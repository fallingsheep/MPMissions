	_unitGroup2 = createGroup east;
    _amountToSpawn = ((random 9) + 1 );// How many sheep to spawn
    // Repeat _amountToSpawn times.
    for "_i" from 1 to _amountToSpawn do {
		private ["_Type","_unit","_name"];	
		_Type = "Sheep";
        _spawnPos = getMarkerPos "SheepSpawn1";		
		_unit = _unitGroup2 createUnit [_Type, _spawnPos, [], 0, "FORM"];		
		//diag_log ( "//////////////////////// HERDS - Sheep Spawned ////////////////////////" );
    };