//------------------------------------------------------------------------------          version 3.0
function getSource() {
  var value = "; " + document.cookie;
  var parts = value.split("; " + "__reff" + "=");
  if (parts.length == 2) {
      aa = parts.pop().split(";").shift()
  };


//pull content of cookie __reff, split it by "|"
part = aa.split("|");

//get last session and split it with "[" and "]"
session = part[part.length-1].split(/[\[\]]/);

//find session by looking at string after "s:"
return session[session.indexOf("s:")+1];
}