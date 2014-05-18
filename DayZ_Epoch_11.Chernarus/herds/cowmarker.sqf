private ["_amountToSpawn", "_spawnPosition", "_cowGroup", "_cowmarker", "_cowType", "_cow", "_pos1"];

//TEMP CREATE MARKER AT PLAYER FOR TESTING
//creates the cow marker on map

_pos1 = [6686.8,2290.11,0.001]; // chernarus spawn
_cowmarker = createMarker ["CowSpawn1", position _pos1 ]; // create marker
_cowmarker setMarkerShape "ICON"; //set marker shape
_cowmarker setMarkerType "DOT"; //set marker type
_cowmarker setMarkerText "COWS"; //set marker text

CowTypes = ["Cow01","Cow02","Cow03","Cow04"]; // Array containing types of cows
//SpawnedCows = []; // An array containing all the cows spawned

    _amountToSpawn = 15;// How many cows to spawn
    _spawnPosition = getMarkerPos "CowSpawn1";// Get the position to spawn them at.
    _cowGroup = createGroup civilian;// Create a group for the cows.
	
	
    // Repeat _amountToSpawn times.
    for [{_i = 0}, {_i < _amountToSpawn}, {_i = _i + 1}] do{ 
		_cowType = call RandomCowType;// Pick a random cow type from the CowType array.
        _cow = _cowGroup createUnit [_cowType, _spawnPosition, [], 0, "NONE"];// Spawn the cow as part of the created group, at the spawn position.
        //SpawnedCows set [count SpawnedCows, _cow]; // Add the spawned cow to the SpawnedCows array.
    };
	
//pick random cow
RandomCowType = {
    CowTypes select (floor random count CowTypes); // pick random CowType
};

///// NOT USED YET ////
/*
//function remove all spawned cows  
removeAllCows = {
    {
	deleteVehicle _x; // Delete each cow spawned
    } forEach SpawnedCows;	
	SpawnedCows = [];// Clear the array.
	deleteMarker "CowSpawn1"; // delete marker
};
*/