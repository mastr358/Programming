// jednoduché zašednutí bez přechodu
$(document.getElementsByClassName("induoMenu")).add($(document.getElementsByClassName("rootCategory"))).hover(function() {
$("#BgrGrey").css( "z-index", "50" );
$("#BgrGrey").css( "opacity", "0.6" );
$("#BgrGrey").css( "display", "block" );
},function() {
$("#BgrGrey").css( "z-index", "0" );
$("#BgrGrey").css( "opacity", "0" );
})


// s přechodem
$(document.getElementsByClassName("induoMenu")).add($(document.getElementsByClassName("rootCategory"))).hover(function() {
$("#BgrGrey").fadeIn(300)

},function() {
$("#BgrGrey").fadeOut(300)

})


// s přechodem animate
$(document.getElementsByClassName("induoMenu")).add($(document.getElementsByClassName("rootCategory"))).hover(function() {
$("#BgrGrey").stop()
$("#BgrGrey").animate({'opacity':'0.6', 'z-index':'50'},500);

},function() {
$("#BgrGrey").stop()
$("#BgrGrey").animate({'opacity':'0', 'z-index':'0'},500);


})


// řešení DPS
       var openCloseCount = 0;
        var fadingState = true;

        function prepareOverlay() {
            $over = $('#overlay');                                              //sedy div, u nas GreyBgr
        if (!$over.is(":visible")) {
                $over.css({ opacity: 0.0 });
                $over.show();
            }

            return $over;
        }

        jQuery(document).ready(function ($) {
            jQuery('#overlay_box').dcMegaMenu({                                 // menu, trigger funkce volající vysouvání menu. Potřeba obejít volání funkce.
                beforeOpen: function () {
                    openCloseCount++;

                    console.log(openCloseCount);

                    if (openCloseCount == 1) {
                        prepareOverlay().show().stop().animate({ "opacity": 1 }, 300);
                        console.log("fadein");
                    }
                },
                beforeClose: function () {
                    openCloseCount--;
                    console.log(openCloseCount);

                    if (openCloseCount == 0) {
                        prepareOverlay().stop().animate({ "opacity": 0 }, 300, function() {
                            $(this).hide();
                        });
                        console.log("fadeout");
                    }
                },
                rowItems: 5,
                effect: 'slide',
                speed: 0,
            });
        });



// přizpůsobené řešení DPS
var openCloseCount = 0;
$(document.getElementsByClassName("induoMenu")).add($(document.getElementsByClassName("rootCategory"))).hover(
    function() {
        openCloseCount++;
        //console.log(openCloseCount);

        if (openCloseCount == 1) {
            $("#BgrGrey").show().stop().animate({ "opacity": 0.6 }, 300);
            //console.log("fadein");
        }
    }
    ,function() {
        openCloseCount--;
        //console.log(openCloseCount);

        if (openCloseCount == 0) {
            $("#BgrGrey").stop().animate({ "opacity": 0 }, 300, function() {
                $(this).hide();
            });
            //console.log("fadeout");
        }
    }
) 
