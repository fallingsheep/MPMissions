private ["_vehicle","_type","_name","_hitpoints"];_vehicle = cursorTarget;_type = typeOf _vehicle;_name = getText(configFile >> "cfgVehicles" >> _type >> "displayName");_hitpoints = _vehicle call vehicle_getHitpoints;{    private ["_damage","_selection"];    _damage = [_vehicle,_x] call object_getHit;    if (_damage > 0) then {		_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _x >> "name");		[_vehicle,_selection,0] call object_setFixServer;	};} forEach _hitpoints;_vehicle setDamage 0;_vehicle setFuel 1;_vehicle setVehicleAmmo 1;_vehicle setVelocity [0,0,1];titleText [format["%1 permanently repaired, refuelled and rearmed.", _name], "PLAIN DOWN"]; titleFadeOut 3;if ( AdminTrackRepair ) {	_pos = getPos player;	_playerUID = getplayerUID player;	_playerName = name player;	diag_log format["[ADMIN TOOLS] - PERM REPAIRED - Admin Name: %1 UID: %2 Position: %3 Vehicle: %4" , _playerName, _playerUID, _pos, _vehicle];};