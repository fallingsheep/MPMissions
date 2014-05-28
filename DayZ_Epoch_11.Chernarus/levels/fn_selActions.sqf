if (exp_rewards && (speed player <= 1) && _canDo) then {
	if (s_player_openlevel < 0) then {
		s_player_openlevel = player addaction[("<t color=""#9ABCD9"">" + ("Open Level Menu") +"</t>"),"custom\level\menu.sqf","",0,false,true,"", ""];
	};
} else {
	player removeAction s_player_openlevel;
	s_player_openlevel = -1;
};