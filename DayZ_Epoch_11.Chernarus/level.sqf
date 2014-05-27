//
// LEVELS!
// Created By: Maddin & Fallingsheep
//

//waitUntil {count PVDZE_plr_Login2 > 0};
//Initialize Variables
_kills = 		player getVariable ["zombieKills",0];
_killsH = 		player getVariable ["humanKills",0];
_killsB = 		player getVariable ["banditKills",0];
_humanity = 	player getVariable ["humanity",0];

_totalzedXP = (_kills * _zedXP);
_totalmurderXP = (_killsH * _murderXP);
_totalbanditsXP = (_KillsB * _banditsXP);
_totalhumanityXP = (_humanity * _humanityXP);

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

//write to RPT to confirm LEVELS is loaded
diag_log "LEVELS: Initialized";