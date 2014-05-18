
CowTypes = ["Cow","Cow02","Cow04"]; // Array containing types of cows
//pick random cow
RandomCowType = {
   CowTypes select (floor random count CowTypes); // pick random CowType
};
	_unitGroup = createGroup east;
    _amountToSpawn = ((random 10) + 1 );// How many cows to spawn
    // Repeat _amountToSpawn times.
    for "_i" from 1 to _amountToSpawn do {
		private ["_cowType","_unit","_name"];	
		_cowType = call RandomCowType;// Pick a random cow type from the CowType array.
        _spawnPos = getMarkerPos "CowSpawn1";		
		_unit = _unitGroup createUnit [_cowType, _spawnPos, [], 0, "FORM"];		
		//diag_log ( "//////////////////////// HERDS - Cow Spawned ////////////////////////" );
    };
