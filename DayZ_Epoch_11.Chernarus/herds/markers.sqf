//TEMP CREATE MARKER AT PLAYER FOR TESTING
//creates the cow marker on map
private ["_cowmarker","_sheepmarker"];

_cowmarker = createMarker ["CowSpawn1",[6686.8,2290.11]]; // create marker
_cowmarker setMarkerShape "ICON"; //set marker shape
_cowmarker setMarkerType "DOT"; //set marker type
_cowmarker setMarkerText "COWS"; //set marker text

_sheepmarker = createMarker ["SheepSpawn1",[6686.8,2290.11]]; // create marker
_sheepmarker setMarkerShape "ICON"; //set marker shape
_sheepmarker setMarkerType "DOT"; //set marker type
_sheepmarker setMarkerText "SHEEP"; //set marker text


diag_log ( "//////////////////////// HERDS - Markers Created ////////////////////////" );