waituntil {!alive player ; !isnull (finddisplay 46)};

if ((getPlayerUID player) in ["120958982",""]) then {
	sleep 5;
	player addaction [("<t color=""#0074E8"">" + ("Tools Menu") +"</t>"),"admintools\Eexcute.sqf","",5,false,true,"",""];
};