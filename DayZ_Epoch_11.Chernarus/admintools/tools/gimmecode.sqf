private ["_ownerID"];
_ownerID = cursorTarget getVariable ["CharacterID","0"];
if(_ownerID != "0") then {
cutText [format["The Code is: %1",_ownerID], "PLAIN DOWN"];
} else {
cutText [format["Not a valid target.",_ownerID], "PLAIN DOWN"];
};
if ( AdminTrackGetCode) {
		_pos = getPos player;
		_playerUID = getplayerUID player;
		_playerName = name player;
		diag_log format["[ADMIN TOOLS] - GET CODE - Admin Name: %1 UID: %2 Position: %3" , _playerName, _playerUID, _pos];
};