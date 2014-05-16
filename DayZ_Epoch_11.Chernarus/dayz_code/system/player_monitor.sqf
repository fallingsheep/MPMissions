if (isServer) then {
	waitUntil{dayz_preloadFinished};
};
_id = [] execFSM "dayz_code\system\player_monitor.fsm";  //patched 4 RscDisplaySpawnSelecter
_void = [] execVM "\z\addons\dayz_code\external\R3F_Realism\R3F_Realism_Init.sqf"; // Heiijjaa mach mir mal ne Hackwurschd ... mit Hühnerknubbel 