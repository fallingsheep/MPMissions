private ["_warning", "_rtime", "_hours","_defaultLevel","_TotalXP", "_minutes", "_minutes2", "_humanity", "_pic", "_info_player"];
_warning = false;

debugMonitor = true;

//Level System
NoPVP = false;
LoseXP_PVP = true; // lose XP for PVP actions
LevelMenu = false; // use level menu rewards
DefaultLevel = 0; // player start level
ZombieXP = true; //gain XP from zombie kills
HumanityXP = true;//gain XP from Humanity
AIXP = true;//gain XP from killing AI (and Bandit Players!)

waitUntil {count PVDZE_plr_Login2 > 0};
private ["_kills", "_killsH", "_killsB", "_humanity", "_TotalXP","_defaultLevel"];

//Initialize Variables
_kills = player getVariable ["zombieKills",0];
_killsH = player getVariable ["humanKills",0];
_killsB = player getVariable ["banditKills",0];
_humanity = player getVariable ["humanity",0];
_PXP = player getVariable ["experience",0];
_Plevel = 		player getVariable["level",0];

_totalzedXP = (_kills * _zedXP);
_totalmurderXP = (_killsH * _murderXP);
_totalbanditsXP = (_KillsB * _banditsXP);
_totalhumanityXP = (_humanity * _humanityXP);



if(LoseXP_PVP == false)then{
	if (NoPVP == false)then{
		_murderXP = 10;// how much XP to gain per PVP kill
	}else{
		_murderXP = 0;
	};
}else{
	if (NoPVP == false)then{
		_murderXP = -10;// how much XP to lose per PVP kill
	}else{
		_murderXP = 0;
	};
};

if (AIXP == false)then{
	_banditsXP = 0;
}else{
	_banditsXP = 10;//how much XP per zombie kill
};

if (ZombieXP == false)then{
	_zedXP = 0;
}else{
	_zedXP = 10;//how much XP per zombie kill
};

if (HumanityXP == false)then{
	_humanityXP = 0;
}else{
	_humanityXP = 1;//each point of humanity is worth 1 XP
};

_TotalXP = (_totalzedXP + _totalmurderXP + _totalbanditsXP + _totalhumanityXP);

_level1 = 10000;
_level2 = 20000;
_level3 = 30000;
_level4 = 40000;
_level5 = 50000;
_level6 = 60000;
_level7 = 70000;
_level8 = 80000;
_level9 = 90000;
_level10 = 100000;

_Default_Level = 0;
_startXP = 0;

//Set initial player level and XP
player setVariable["level",_Default_Level,true];
player setVariable["experience",_startXP,true];

//write to RPT to confirm LEVELS is loaded
diag_log "LEVELS: Initialized";


while {true} do {
	//LEVELS
	
//force XP update
if (_TotalXP > _PXP)then{
	//update xp display
	player setVariable["experience",_TotalXP,true];
}else{
	//update xp display
	player setVariable["experience",_TotalXP,true];
};
	
	if (_TotalXP >= _level1 && _TotalXP < _level2) then {
        player setVariable ["level",1,true];
        systemchat format['You have reached Level 1'];
    };
    if (_TotalXP >= _level2 && _TotalXP < _level3) then {
        player setVariable ["level",2,true];
        systemchat format['You have reached Level 2'];
    };
    if (_TotalXP >= _level3 && _TotalXP < _level4) then {
        player setVariable ["level",3,true];
        systemchat format['You have reached Level 3'];
    };
    if (_TotalXP >= _level4 && _TotalXP < _level5) then {
        player setVariable ["level",4,true];
        systemchat format['You have reached Level 4'];
    };
    if (_TotalXP >= _level5 && _TotalXP < _level6) then {
        player setVariable ["level",5,true];
        systemchat format['You have reached Level 5'];
    };
    if (_TotalXP >= _level6 && _TotalXP < _level7) then {
        player setVariable ["level",6,true];
        systemchat format['You have reached Level 6'];
    };
    if (_TotalXP >= _level7 && _TotalXP < _level8) then {
        player setVariable ["level",7,true];
        systemchat format['You have reached Level 7'];
    };
    if (_TotalXP >= _level8 && _TotalXP < _level9) then {
        player setVariable ["level",8,true];
        systemchat format['You have reached Level 8'];
    };
    if (_TotalXP >= _level9 && _TotalXP < _level10) then {
        player setVariable ["level",9,true];
        systemchat format['You have reached Level 9'];
    };
    if (_TotalXP >= _level10) then {
        player setVariable ["level",10,true];
        systemchat format['You have reached Level 10'];
    };
		
	_rtime = round(21600 - serverTime);
	
	if ((_rtime < 300) && (!_warning)) then {
		_warning = true;
		cutText [(localize "STR_custom_5minRestart"),"PLAIN"];
	};	

	if (debugMonitor) then {
	
		//Restart Time
		_hours = (_rtime/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = toString _hours;
		_hours = compile _hours;
		_hours = call _hours;
		_minutes = round(_rtime/60);
		_minutes2 = _minutes - (_hours*60);

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
			 <t size='1' font='Bitstream' align='left' color='#FFBF00'>Level: </t><t size='1' font='Bitstream' align='right'>%13</t><br/>
			  <t size='1' font='Bitstream' align='left' color='#FFBF00'>Experience: </t><t size='1' font='Bitstream' align='right'>%14</t><br/>
			<br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>Players Online: </t><t size='1 'font='Bitstream' align='right'>%12</t><br/>
	        <t size='1' font='Bitstream' align='left' color='#FFBF00'>Murders: </t><t size='1' font='Bitstream' align='right'>%8</t><br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>Bandits Killed: </t><t size='1' font='Bitstream' align='right'>%11</t><br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>Zombies Killed: </t><t size='1' font='Bitstream' align='right'>%7</t><br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>FPS: </t><t size='1' font='Bitstream' align='right'>%10</t><br/>
			<t size='1'font='Bitstream'align='center' color='#104E8B' >"+ (localize "") + "</t><br/>
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
			(count playableUnits),
			_PXP,
			_Plevel
			];
	};
	sleep 1;	
};









