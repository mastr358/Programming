$(document).ready(checkBasketPopup());

function checkBasketPopup() {
    if ($.cookie("basketPopup") !== "true") {
        showBasketPopup();
    }
}

function showBasketPopup() {
var basketZero = "";
var basketForm = "";
var czkShops = ["www.ringit.cz","www.a-mania.cz","www.total-store.cz","www.style-puma.cz","www.rb-store.cz"];
if (czkShops.indexOf(window.location.host) !== -1) {
    basketZero = "0&nbsp;Kč";
    basketForm = "http://"+window.location.host+"/data/user-content/script/popups/abandoned-basket-popup-cz.html";    
} else {
    basketZero = "0&nbsp;EUR";
    basketForm = "http://"+window.location.host+"/data/user-content/script/popups/abandoned-basket-popup-sk.html";
}

if ($(".SimpleBasket .price .value").html() !== basketZero) {
    dataLayer.push({'event':'ga.event', 'eCategory': 'popup', 'eAction': 'display', 'eLabel': 'abandonedBasket'});
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
                var orangeShops = ["www.a-mania.cz","www.a-mania.sk","www.total-store.cz","www.total-store.sk"];
                if (orangeShops.indexOf(window.location.host) !== -1) {
                    $("#closeButton").css({"background-image":"url(http://www.a-mania.cz/data/user-content/a-mania-cz/images/krizek.png)"});
                    $("#abandoned-basket-popup .header").css({"color":"#f17c00"});
                }
                $("#abandoned-basket-popup #goToBasket").click(function(){
                    dataLayer.push({
                        'event':'ga.event', 
                        'eCategory': 'popup', 
                        'eAction': 'click', 
                        'eLabel': 'abandonedBasket',
                        'eventCallback':function(){window.location.href = "/kosik";}});
                });
            }
        },
        type: 'ajax',
        closeOnBgClick: true
    })            
}
$.cookie("basketPopup","true");
}