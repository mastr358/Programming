$(document).ready(showBasketPopup());
function showBasketPopup() {
var czZero = "0&nbsp;Kč";
var skZero = "0&nbsp;EUR";
var basketForm = "http://www.ringit.cz/data/user-content/script/popups/abandoned-basket-popup-cz.html";

if ($(".SimpleBasket .price .value").html() !== czZero) {

    $.magnificPopup.open({
        items: {
            src: basketForm
        },
        callbacks: {
            ajaxContentAdded: function() {
                // positioning of popup
                function positionBasketPopup () {
                    $('head').append('<style>.mfp-container:before{height: 0!important;}</style>');
                    $("#abandoned-basket-popup").css({"top":$(".goToBasketOverlay").offset().top+50, "left": $(".goToBasketOverlay").offset().left-260})
                }
                positionBasketPopup();
                $(window).on('resize', function(){positionBasketPopup()});            
            }
        },
        type: 'ajax',
        closeOnBgClick: true
    })            
}

}