cursorTarget setfuel 1;
cutText ["Point to Refuel Successful", "PLAIN"];
if ( AdminTrackRefuel ) {
	_pos = getPos player;
	_playerUID = getplayerUID player;
	_playerName = name player;
	diag_log format["[ADMIN TOOLS] - REFUELED - Admin Name: %1 UID: %2 Position: %3" , _playerName, _playerUID, _pos];
};