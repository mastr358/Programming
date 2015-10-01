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