//Malory's point to repair script
cursorTarget setdammage 0;
cursorTarget setvehicleammo 1;
cursorTarget setfuel 1;
cutText ["Repaired until next server restart.", "PLAIN DOWN"];
if ( AdminTrackRepair ) {
	_pos = getPos player;
	_playerUID = getplayerUID player;
	_playerName = name player;
	diag_log format["[ADMIN TOOLS] - REPAIRED - Admin Name: %1 UID: %2 Position: %3" , _playerName, _playerUID, _pos];
};