// aim of this JS file:
// Check settings for displaying popup-forms (domain dependent)
// Count score for viewing pages, save it to cookie
// If score reaches limit from settings, display appropriate popup
// If there is more than 1 enabled popup, randomly select 1 option from them

// -----------------------------------------------------------------------------
// verify form imput
function CorrectEmailaddress(SubscriberForm){
 if (SubscriberForm.pf_Email.value.length > 255)
{
alert("Vložte maximálně 255 znaků do pole Emailová adresa.");
SubscriberForm.pf_Email.focus();
return false;
 }
if (SubscriberForm.pf_Email.value == "")
{
alert("Zadejte hodnotu pro pole Emailová adresa.");
SubscriberForm.pf_Email.focus();
return false; }
if (SubscriberForm.pf_Email.value.length < 7)
{
alert("Vložte minimálně 7 znaků do pole Emailová adresa.");
SubscriberForm.pf_Email.focus();
return false; }
pf_Email=SubscriberForm.pf_Email.value;
var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,})$/;
if(reg.test(pf_Email) == false) 
{
      alert('Emailová adresa je neplatná. Prosím ověřte, že jste ji zadali správně.');
	  SubscriberForm.pf_Email.focus();
	  return false;
}
var counter = 0;
for (i=1; i<=SubscriberForm.pf_CounterMailinglists.value; i++)
 {
var checkBoxName = "pf_MailinglistName" + i;
 if (document.getElementsByName(checkBoxName)[0].checked || document.getElementsByName(checkBoxName)[0].type == "hidden") counter++; 
}
 if (counter == 0)
{
alert("V tomto formuláři je nutné zadat jeden nebo více seznamů adres.");
return false;
 }
return true;
}

// -----------------------------------------------------------------------------

// function open popup with form
function openPopup(el) {  

            // fill current page to redirect field so the customer is not stranded on Apsis thankyou page
            $('input[name=pf_redir]').val(window.location.href); 
            console.log('Popup open!');
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
if( $.cookie('PopupCounter') == null) {                                    
    page = dataLayer[0].pageType;
    CookieValue = 0;
    if (page == "detail") {
        CookieValue += 2;
    } else {
        CookieValue += 1;
    } 

    // expiration in 60 days
    $.cookie("PopupCounter", CookieValue, { expires : 60 });               
} else {

    // if cookie exists, add 1 or 2 depending on pagetype
    CookieValue = parseInt($.cookie("PopupCounter"));                      
    page = dataLayer[0].pageType;
    
    if (page == "detail") {
        CookieValue += 2;
    } else {
        CookieValue += 1;
    }    

    $.cookie("PopupCounter", CookieValue);
} 
}

// -----------------------------------------------------------------------------

// call popup window if popup was not shown and counter > 6
function openForm(form, expireDays, scoreLimit, variantName) {
    if( $.cookie('PopupCounter') >= scoreLimit && $.cookie('PopupShown') == undefined) {  
    
        if (popupSettings[popupVariant].form == "") {
            // When the variant is no-form, just send event and set cookie
            ga('send', 'event', 'popup', 'display', 'no-popup');
            $.cookie("PopupShown", 1, { expires : expireDays });
        } else {
            // send event to analytics and open popup
            ga('send', 'event', 'popup', 'display', variantName); 
    
            // wait 3s before showing popup
            setTimeout(function() {                                
                $.cookie("PopupShown", 1, { expires : expireDays });                      
                openPopup(form);                                                     
            }),3000
        }
    }
}
// -----------------------------------------------------------------------------

// show thank you popup if subscribed. Change cookie PopupShown to 2. This will indikate the thankyou popup was shown
function openThanks () {
    if( $.cookie('PopupShown') == 1 && $.cookie('PopupSubscribed') == 1 ) {
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
    }
}

// -----------------------------------------------------------------------------

function settingsCall () { 
    popupSettings = [];
    $.getJSON("http://www.ringit.cz/data/user-content/script/InduoPopupConfig.js",
        function(data){
            $.each(data, function(index, value){
                if(data[index].active == true && location.host.indexOf(data[index].domain) > 0){
                    popupSettings.push(data[index])
                };
            })
        }
    ).done(function(){
    // Roll what will be displayed for visitor (even chance for all forms)
    maxOptions = popupSettings.length;
    
    for (i=0;i<maxOptions;i++) {
        if (popupSettings[i].name == $.cookie("popupVariant")) {
            popupVariant = i;
            $.cookie("popupVariant", popupSettings[popupVariant].name, {expires : popupSettings[popupVariant].showAgainAfter});            
        }
    }
    if (popupVariant == "") {
        popupVariant = Math.floor(Math.random() * (maxOptions));
        $.cookie("popupVariant", popupSettings[popupVariant].name, {expires : popupSettings[popupVariant].showAgainAfter});
    }
    
    // Count score
    countScore();
    
    // Call the appropriate form to display
    // If the variant is no form - just send info to analytics that nothing was shown
    openForm(popupSettings[popupVariant].form, popupSettings[popupVariant].showAgainAfter, popupSettings[popupVariant].showAtScore, popupSettings[popupVariant].name);
    
    // Show thanks if the page is loaded immediately after sending form.
    openThanks();            
    });
};

// -----------------------------------------------------------------------------

// Controller for popup windows and their settings.
// The form variant name gets sent into Google Analytics event. If settings form 
// address is empty, don't display anything. All active variants will be divided
// across visitors evenly.

$(document).ready(function(){

        popupVariant = "";
        var maxOptions = "";
        
        settingsCall();

});