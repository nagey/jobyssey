// Name: blur Anchors
// Language: JavaScript
// Author: Travis Beckham ¦ squidfingers.com
// Description: Remove anchor outlines from all links in the document
// --------------------------------------------------
function blurAnchors(){
if(document.getElementsByTagName) {
var a = document.getElementsByTagName("a");
//collect all anchors A
for(var i = 0; i < a.length; i++){
// mouse onfocus, blur anchors
a[i].onfocus = function(){this.blur();};
}
}
}
window.onload = blurAnchors;