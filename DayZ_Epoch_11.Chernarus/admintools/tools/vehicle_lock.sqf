private ["_vehicle","_removed"];

_vehicle = cursorTarget;

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_32") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

{player removeAction _x} forEach s_player_lockunlock;s_player_lockunlock = [];
s_player_lockUnlock_crtl = 1;

		PVDZE_veh_Lock = [_vehicle,true];
		if(player distance _vehicle < 10) then {
			
			if (local _vehicle) then {
				PVDZE_veh_Lock spawn local_lockUnlock
			} else {
				publicVariable "PVDZE_veh_Lock";
			};
		};
	
s_player_lockUnlock_crtl = -1;
DZE_ActionInProgress = false;

if ( AdminTrackLockVehicles ) {
_pos = getPos player;
	_playerUID = getplayerUID player;
	_playerName = name player;
	diag_log format["[ADMIN TOOLS] - LOCKED VEHICLE - Admin Name: %1 UID: %2 Position: %3 Vehicle: %4" , _playerName, _playerUID, _pos, _vehicle ];
};