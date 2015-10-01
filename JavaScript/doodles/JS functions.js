//------------------------------------------------------------------------------

// simple hello world
function hello() {
  document.write("Hello World!");
}

//------------------------------------------------------------------------------

//add text together
function JoinText(t1, t2) {
  var text = "";
  text += t1;
  text += t2;
  return document.write(text);
}

//------------------------------------------------------------------------------

// list items in google datalayer
function GetDataLayer(datalayer) {
var text = "";
  for (var key in datalayer[0]) {                                                              //for each item in object datalayer[0]
    if (Array.isArray(datalayer[0][key])) {                                                    //if this item is an array
      var index;
      for	(index = 0; index < datalayer[0][key].length; index++) {                             //list his objects one by one
            for (var keyy in datalayer[0][key][index]) {                                       //and for each item in his object
              if (datalayer[0][key][index].hasOwnProperty(keyy)) {                             //if the item has property
                text += (keyy + " -> " + datalayer[0][key][index][keyy]+ "<br>");              //write the property
              }
            }
      }
  
    } else if (datalayer[0].hasOwnProperty(key)) {                                             //if the item was not an array
    text += (key + " -> " + datalayer[0][key]+ "<br>");                                        //write his property
    }
  }
return text; 
}

//------------------------------------------------------------------------------

// gets the list of elements from object
function GetElements(foo) {
    for (var key in foo) {
        if (foo.hasOwnProperty(key)) {
            document.write(key + ": " + foo[key]+ "<br>");
        }
    }
}

//------------------------------------------------------------------------------

//pull data from google DataLayer to sociomantic DataLayer

function GooToSocio(dataLayer) {
    
    var basket = {"products":[],                                                        //define basket, give it basic elements pulled from dataLayer
        "transaction": dataLayer[0]["transactionId"],
        "amount": dataLayer[0]["transactionTotal"],
        "currency": "CZK"
    };

    
    for	(index = 0; index < dataLayer[0]["transactionProducts"].length; index++) {      //fill the array 'products' with data from dataLayer
        basket.products.push({
            "identifier": dataLayer[0]["transactionProducts"][index]["sku"], 
            "amount": dataLayer[0]["transactionProducts"][index]["price"],
            "currency": "CZK",
            "quantity": dataLayer[0]["transactionProducts"][index]["quantity"]});
    }
    
    return basket;
}

//------------------------------------------------------------------------------

//return defined categories from dataLayer into array
function GetCategories(thisVar) {                                                      
    var someVar = [];
    for (i = 0; i < thisVar.length; i++) {
          if (!(thisVar[i] === undefined)) {
              someVar.push(thisVar[i]);
          };
    }  
    return someVar;
}

//------------------------------------------------------------------------------

//function that returns cookie by name
function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
};

//------------------------------------------------------------------------------

//three ways to run function when the page is loaded

//1
document.addEventListener('DOMContentLoaded', function() {
// your code here
}, false);

//2
//jQuery method
$(document).ready(function(){
// your code
});

//3
setTimeout(function(){
 //your code here
}, 3000);

//------------------------------------------------------------------------------

//hide contact stickers on the right side of Ringit on certain pages
$(document).ready(function(){
var url = location.href;
if(
    (url.indexOf('/kosik') > -1) ||
    (url.indexOf('?status') > -1)
) {
$(".induoRightPanel").css("display","none")
}
});

//------------------------------------------------------------------------------

// show bank transfer info at orders paid by transfer (thankyou page)
$(document).ready(function(){
var url = location.href;
var domain = location.hostname;
var payment = dataLayer[0].transactionPaymentType; 

if (payment.indexOf('Příkazem') > -1 &&
    url.indexOf('status=2') > -1 &&
    domain.indexOf('.cz') > -1
) {
$('#orderNumber').after('<p id="BankTransfer">Prosím zaplaťte celou hodnotu objednávky na účet 2106872180/2700.<br />Jako variabilní symbol uveďte číslo objednávky.</p>');
};  

if (payment.indexOf('Příkazem') > -1 &&
    url.indexOf('status=2') > -1 &&
    domain.indexOf('.sk') > -1
) {
$('#orderNumber').after('<p id="BankTransfer">Prosím zaplaťte celú hodnotu objednávky na účet 4007818022/7500. <br /> Ako variabilný symbol uveďte číslo objednávky.</p>');
}; 

});


//------------------------------------------------------------------------------

// function to search object in JSON
function getObjects(obj, key, val) {
    var objects = [];
    for (var i in obj) {
        if (!obj.hasOwnProperty(i)) continue;
        if (typeof obj[i] == 'object') {
            objects = objects.concat(getObjects(obj[i], key, val));
        } else if (i == key && obj[key] == val) {
            objects.push(obj);
        }
    }
    return objects;
}
//Use like so:

getObjects(TestObj, 'id', 'A'); // Returns an array of matching objects

//------------------------------------------------------------------------------