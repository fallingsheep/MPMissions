private["_bag"];
_bag = _this select 0;
removebackpack player;
player addBackpack _bag;
if ( AdminTrackBackpack ) {
	_playerUID = getplayerUID player;
	_playerName = name player;
	diag_log format["[ADMIN TOOLS] - CHANGE BACKPACK - Admin Name: %1 UID: %2 Backpack: %3" , _playerName, _playerUID, _bag ];
};