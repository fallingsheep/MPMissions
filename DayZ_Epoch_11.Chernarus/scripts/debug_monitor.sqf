private ["_warning", "_rtime", "_hours", "_minutes", "_minutes2", "_humanity", "_pic", "_info_player"];
_warning = false;

customCombatLogger = "";
customMission = "";
customStudyBody = "";

debugMonitor = true;

while {true} do {
	_rtime = round(21600 - serverTime);
	
	if ((_rtime < 300) && (!_warning)) then {
		_warning = true;
		cutText [(localize "STR_custom_5minRestart"),"PLAIN"];
	};

	if (debugMonitor) then {
		_hours = (_rtime/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = toString _hours;
		_hours = compile _hours;
		_hours = call _hours;
		_minutes = round(_rtime/60);
		_minutes2 = _minutes - (_hours*60);
		
		//Debug Info
		_humanity =		player getVariable["humanity",0];
		
		//Kill Stats
		_kills = 		player getVariable["zombieKills",0];
		_killsH = 		player getVariable["humanKills",0];
		_killsB = 		player getVariable["banditKills",0];
		
		if (player == vehicle player) then {
			_pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));
		} else {
			_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
		};
		
		_info_player = 
			"<t size='1' font='Bitstream' align='Center' >%3</t><br/>
			<img size='4.75' image='%6'/><br/>
			<t size='1' font='Bitstream' align='center' color='#5882FA'>Survived %9 Days</t><br/>
			<t size='1' font='Bitstream' align='left' color='#CC0000'>Blood: </t><t size='1' font='Bitstream' align='right'>%4</t><br/>
			<t size='1' font='Bitstream' align='left' color='#0066CC'>Humanity: </t><t size='1' font='Bitstream' align='right'>%5</t><br/>
			<br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>Players Online: </t><t size='1 'font='Bitstream' align='right'>%12</t><br/>
	        <t size='1' font='Bitstream' align='left' color='#FFBF00'>Murders: </t><t size='1' font='Bitstream' align='right'>%8</t><br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>Bandits Killed: </t><t size='1' font='Bitstream' align='right'>%11</t><br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>Zombies Killed: </t><t size='1' font='Bitstream' align='right'>%7</t><br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>FPS: </t><t size='1' font='Bitstream' align='right'>%10</t><br/>"
			+ customMission + customCombatLogger + customStudyBody +
			"<t size='1'font='Bitstream'align='center' color='#104E8B' >"+ (localize "") + "</t><br/>
			<t size='1'font='Bitstream'align='center' color='#104E8B' >Press F10 to Toggle Debug</t><br/>";
			
		hintSilent parseText format 
			[_info_player,
			customMissionImage,
			"debug_monitor\pirates.paa",
			('' + (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'))),
			round (r_player_blood),
			_humanity,
			_pic,
			_kills,
			_killsH,
			(dayz_Survived),
			round(diag_fps),
			_KillsB,
			(count playableUnits)
			];
	};
	sleep 1;	
};