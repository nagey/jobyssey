function showHide(entryID, entryLink, htmlObj, type) {
if (type == "comments") {
extTextDivID = ('comText' + (entryID));
extLinkDivID = ('comLink' + (entryID));
} else {
extTextDivID = ('extText' + (entryID));
extLinkDivID = ('extLink' + (entryID));
}
if( document.getElementById ) {
if( document.getElementById(extTextDivID).style.display ) {
if( entryLink != 0 ) {
document.getElementById(extTextDivID).style.display = "block";
document.getElementById(extLinkDivID).style.display = "none";
htmlObj.blur();
} else {
document.getElementById(extTextDivID).style.display = "none";
document.getElementById(extLinkDivID).style.display = "block";
}
} else {
location.href = entryLink;
return true;
}
} else {
location.href = entryLink;
return true;
}
}