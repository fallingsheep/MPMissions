private ["_amountToSpawn", "_spawnPosition", "_cowGroup", "_cowType", "_cow", "_pos1"];

CowTypes = ["Cow01","Cow02","Cow03","Cow04"]; // Array containing types of cows
//SpawnedCows = []; // An array containing all the cows spawned

//pick random cow
RandomCowType = {
    CowTypes select (floor random count CowTypes); // pick random CowType
};
    //_amountToSpawn = 15;// How many cows to spawn
    // Repeat _amountToSpawn times.
   // for [{_i = 0}, {_i < _amountToSpawn}, {_i = _i + 1}] do{ 
		_cowType = call RandomCowType;// Pick a random cow type from the CowType array.
        _spawnPos = getMarkerPos "CowSpawn1";
		createUnit [_cowType, [_spawnPos select 0,_spawnPos select 1,1], [], 1, "FORM"];	
		diag_log ( "################### HERDS - Cow Spawned ###################" );
    //};
	


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