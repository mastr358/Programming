//------------------------------------------------------------------------------           version beta
function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
}

//------------------------------------------------------------------------------           version 1.0

//define function that returns cookie by name
function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
}

//define helper variables
var str, str2

//pull content of cookie __reff
str = getCookie("__reff")
//"(direct)&1417433843917.1417433843917.1|panska-obuv.heureka.cz&1417433843917.1417433922501.2|campaign::c:[2014-11]m:[Affil]s:[ProZeny.cz]&1417433843917.1417435397359.3"

//find part related to last session
//"campaign::c:[2014-11]m:[Affil]s:[ProZeny.cz]&1417433843917.1417435397359.3"
str2 = str.substr(str.lastIndexOf("|")+1,str.length)

//get string with utm parameter information 
//"campaign::c:[2014-11]m:[Affil]s:[ProZeny.cz]
str3 = str2.substr(0,str2.indexOf("&"))

str4 = str3.substr(str3.indexOf("s:[")+3,str3.lastIndexOf("]")-str3.indexOf("s:[")-3)

//------------------------------------------------------------------------------          version 2.0

//define function that returns cookie by name
function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
};

//pull content of cookie __reff, split it by "|"
cookie = getCookie("__reff").split("|");
//get last session and split it with "[" and "]"
session = cookie[cookie.length-1].split(/[\[\]]/);
//find session by looking at string after "s:"
utmsource = session[session.indexOf("s:")+1];