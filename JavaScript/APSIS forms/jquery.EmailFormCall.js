// aim of this JS file:
// Check settings for displaying popup-forms (domain dependent)
// Count score for viewing pages, save it to cookie
// If score reaches limit from settings, display appropriate popup
// If there is more than 1 enabled popup, randomly select 1 option from them

// -----------------------------------------------------------------------------

// function open popup with form
function openPopup(el) {  

            // fill current page to redirect field so the customer is not stranded on Apsis thankyou page
            $('input[name=pf_redir]').val(window.location.href); 
            console.log('Opening popup of element named ' + el);
            $.magnificPopup.open({
                items: {
                    src: el
                },
                type: 'inline',
                removalDelay: 500,
                callbacks: {
                    beforeOpen: function() {
                       this.st.mainClass = "mfp-zoom-in";
                    }
                },
                closeOnBgClick: false
            });
}

// -----------------------------------------------------------------------------

// set cookie visit +1 or +2, if cookie does not exist
function countScore() {
    
    var CookieValue = 0;
    // get page increment
    var page = dataLayer[0].pageType;
    if (page == "detail") {
        var increment = 2;
    } else {
        var increment = 1;
    }

    // create cookie if does not exist
    if( $.cookie('PopupCounter') === null || $.cookie('PopupCounter') === undefined) {                                    

        CookieValue = increment;
    
        $.cookie("PopupCounter", CookieValue);               
    
    // if cookie exists, add 1 or 2 depending on pagetype
    } else {
    
        CookieValue = parseInt($.cookie("PopupCounter"));                      
        CookieValue += increment;

        // set the new cookie value (+1 or +2) and refresh duration
        $.cookie("PopupCounter", CookieValue);
    } 
}

// -----------------------------------------------------------------------------

// call popup window if popup was not shown and counter > 6
function openForm(duration, score, variant, repetitions) {

    if( $.cookie('PopupCounter') >= score && $.cookie('PopupSubscribed') != 1000 && $.cookie('PopupShown') === undefined && ($.cookie('PopupSubscribed') === undefined || $.cookie('PopupSubscribed') < repetitions)) {  
        
        if ($.cookie('PopupSubscribed') === undefined) {
            var timesDisplayed = 1;
        } else {
            var timesDisplayed = parseInt($.cookie('PopupSubscribed'))+1;
        }
                
        // in case popup is disabled, just send event that nothing was shown
        if (popupDisable == true) {
            dataLayer.push({'event':'ga.event', 'eCategory': 'popup', 'eAction': 'display', 'eLabel': 'no-popup', 'eValue': timesDisplayed}); 
            $.cookie("PopupShown", 1, { expires : duration });
            $.cookie("PopupSubscribed", timesDisplayed, { expires : 1800 });        
        // else show popup
        } else {
            
            // send event to analytics and open popup
            dataLayer.push({'event':'ga.event', 'eCategory': 'popup', 'eAction': 'display', 'eLabel': variant, 'eValue': timesDisplayed}); 

            // wait 3s before showing popup
            setTimeout(function() {                                
                $.cookie("PopupShown", 1, { expires : duration });
                $.cookie("PopupSubscribed", timesDisplayed, { expires : 1800 });                        
                try {
                    openPopup('#NewsletterForm');
                } catch (err) {
                    console.log("Element was not defined.");
                }                                                     
            },2000);
        }
    }
    
}
// -----------------------------------------------------------------------------

// show thank you popup if subscribed. Change cookie PopupShown to 2. This will indikate the thankyou popup was shown
function openThanks () {
    if( $.cookie('PopupShown') == 1 && $.cookie('PopupSubscribed') == 1000 ) {
        console.log("Opening thanks popup.");
        if ($("#NewsletterThanks").length !== 0) {
            $.magnificPopup.open({
                items: {
                    src: "#NewsletterThanks"
                },
                type: 'inline',
                removalDelay: 500,
                callbacks: {
                    beforeOpen: function() {
                       this.st.mainClass = "mfp-zoom-in";
                    }
                },
                closeOnBgClick: true
            });
            $.cookie("PopupShown", 2, {expires : 1800 }); 
        } else {
            console.log("NewsletterThanks did not exist when calling the popup.");
        }      
    }
}

// -----------------------------------------------------------------------------

// Main run function
function runPopup(duration, score, variant, repetitions) {
    
    var formAddress = "http://" + document.domain + "/data/user-content/script/forms/" + variant + ".html";
    $.ajax({
        url: formAddress,
        success: function (data){
            $( "body" ).prepend( data );
            inPopups = {};
            inPopups.variant = variant;   
            // Count score
            countScore();
            
            // Call the appropriate form to display
            openForm(duration, score, variant, repetitions);
            
            // Show thanks if the page is loaded immediately after sending form.
            openThanks();
        }
    });
}
