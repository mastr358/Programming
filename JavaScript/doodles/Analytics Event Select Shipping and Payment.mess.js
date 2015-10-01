$("#DeliverySelector :input").change(function() {
    var GaShipping = this[checked='checked'] ? this.chilren("input").value
    console.log = GaShipping
}
)






$("#DeliverySelector input[checked=checked]").parent().text()



$("#DeliverySelector input").change(function() {
    var GaShipping = this.attr("checked") = "checked" ? this.parent().text()
    console.log = GaShipping    
})




// // 18.3.
var GaShipping = $("#DeliverySelector input[checked='checked']").parent().text()

// trigger button has following class:
// button nextStep xta_nextStep xta_order


// on clicking of button NEXT - delay for sending does not work :-/
$(".button.nextStep.xta_nextStep.xta_order").click(function() {
// get shipping method
var eShip = $("#DeliverySelector input[checked='checked']").parent().text()
// get payment method
var ePay = $("#PaymentSelector input[checked='checked']").parent().text()

// go only if shipping and payment are selected
if (eShip !== undefined && ePay !== undefined) {

    // set event variables
    if ( eShip.indexOf("PPL") !== -1 ) {
        eShip = "PPL";
    } else if ( eShip.indexOf("do ruky") !== -1 ) {
        eShip = "CPDR";
    } else if ( eShip.indexOf("na poštu") !== -1 ) {
        eShip = "CPNP";
    } else if ( eShip.indexOf("DPD") !== -1 ) {
        eShip = "DPD";
    } else if ( eShip.indexOf("Uloženka") !== -1 ) {
        eShip = "ULOZ";
    } else eShip = "unknown shipping";
    console.log(eShip);
    
    if ( ePay.indexOf("Dobírka") !== -1 ) {
        ePay = "Dobirkou";
    } else if ( ePay.indexOf("Příkazem") !== -1 ) {
        ePay = "Prevodem";
    } else if ( ePay.indexOf("GoPay") !== -1 ) {
        ePay = "Prevodem";
    } else ePay = "unkown payment type";       
    console.log(ePay);

    dataLayer.push({ 'event': 'ga.event', 'eCategory': 'Doprava a platba', 'eAction': eShip, 'eLabel': ePay });


}

})
