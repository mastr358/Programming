// zašednutí menu - přizpůsobené řešení DPS

$(document).on({
    mouseenter: function() {
        if ( typeof openCloseCount == 'undefined') {openCloseCount = 0;}
        openCloseCount++;
    
        if (openCloseCount == 1) {
            $("#BgrGrey").show().stop().animate({ "opacity": 0.6 }, 300);
        }
    },
    mouseleave: function() {
        openCloseCount--;
    
        if (openCloseCount == 0) {
            $("#BgrGrey").stop().animate({ "opacity": 0 }, 300, function() {
                $(this).hide();
            });
        }
    }
}, ".rootCategory:not(.leaf), .induoMenu"
)