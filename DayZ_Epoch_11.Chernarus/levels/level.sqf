// Wait for the player got his login Data to make sure he has a valid PlayerUID
waitUntil {alive player};
 
private ["_kills", "_killsH", "_killsB", "_humanity", "_levelxp", "_focus","_defaultLevel", "_multiplicator", "_bmulti", "_zmulti", "_hmulti", "_till"];
 
 
//Custom Configuration Support
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
 
_defaultLevel = exp_defaultLevel;
player setVariable ["level",_defaultLevel,true];
 
_multiplicator = exp_basic_multiplicator;
_bmulti = exp_b_kill_multiplicator;
_zmulti = exp_z_kill_multiplicator;
_hmulti = exp_h_kill_multiplicator;
 
while {true} do
{
	//Initialize Variables
	_kills = player getVariable ["zombieKills",0];
	_killsH = player getVariable ["humanKills",0];
	_killsB = player getVariable ["banditKills",0];
	_humanity = player getVariable ["humanity",0];
 
	if (exp_focus) then {
 
	_focus = exp_focusvar;
       
	//levelxp mathematics
	if (exp_loosepvp) then {
		if (_focus == "Humanity") then {
			_levelxp = (((_kills*_zmulti) + (_killsB*_bmulti) - (_killsH*_hmulti)) + (_humanity*2) * _multiplicator);
		};
		if (_focus == "ZKills") then {
			_levelxp = (((_killsB*_bmulti) + _humanity - (_killsH*_hmulti)) + (_kills*_zmulti*2) * _multiplicator);
		};
		if (_focus == "BKills") then {
			_levelxp = (((_kills*_zmulti) + _humanity - (_killsH*_hmulti)) + (_killsB*_bmulti*2) * _multiplicator);
		};
	} else {
		if (_focus == "Humanity") then {
			_levelxp = (((_kills*_zmulti) + _killsB + (_killsH*_hmulti)) + (_humanity*2) * _multiplicator);
		};
		if (_focus == "ZKills") then {
			_levelxp = (((_killsB*_bmulti) + _humanity + (_killsH*_hmulti)) + (_kills*_zmulti*2) * _multiplicator);
		};
		if (_focus == "BKills") then {
			_levelxp = (((_kills*_zmulti) + _humanity + (_killsH*_hmulti)) + (_killsB*_bmulti*2) * _multiplicator);
		};
		if (_focus == "HKills") then {
			_levelxp = (((_kills*_zmulti) + _humanity + (_killsB*_bmulti)) + (_killsH*_hmulti*2) * _multiplicator);
		};
	};
       
	} else {
		if (exp_loosepvp) then {
			_levelxp = (((_kills*_zmulti) + _humanity + (_killsB*_bmulti) - (_killsH*_hmulti)) * _multiplicator);
		}
		else {
			_levelxp = (((_kills*_zmulti) + _humanity + (_killsB*_bmulti) + (_killsH*_hmulti)) * _multiplicator);
		};
	};
 
	//Set Level
	if (_levelxp >= _level1 && _levelxp < _level2) then {
		player setVariable ["level",1,true];
	};
	if (_levelxp >= _level2 && _levelxp < _level3) then {
		player setVariable ["level",2,true];
	};
	if (_levelxp >= _level3 && _levelxp < _level4) then {
		player setVariable ["level",3,true];
	};
	if (_levelxp >= _level4 && _levelxp < _level5) then {
		player setVariable ["level",4,true];
	};
	if (_levelxp >= _level5 && _levelxp < _level6) then {
		player setVariable ["level",5,true];
	};
	if (_levelxp >= _level6 && _levelxp < _level7) then {
		player setVariable ["level",6,true];
	};
	if (_levelxp >= _level7 && _levelxp < _level8) then {
		player setVariable ["level",7,true];
	};
	if (_levelxp >= _level8 && _levelxp < _level9) then {
		player setVariable ["level",8,true];
	};
	if (_levelxp >= _level9 && _levelxp < _level10) then {
		player setVariable ["level",9,true];
	};
	if (_levelxp >= _level10) then {
		player setVariable ["level",10,true];
	};
	
	//Calc EXP to next level 
	if ((player getVariable['level',0]) == 0) then {
		_till = _level1 - _levelxp;
		player setVariable['levelxp',_till,true];
	}
	if ((player getVariable['level',0]) == 1) then {
		_till = _level2 - _levelxp;
		player setVariable['levelxp',_till,true];
	}
	if ((player getVariable['level',0]) == 2) then {
		_till = _level3 - _levelxp;
		player setVariable['levelxp',_till,true];
	}
	if ((player getVariable['level',0]) == 3) then {
		_till = _level4 - _levelxp;
		player setVariable['levelxp',_till,true];
	}
	if ((player getVariable['level',0]) == 4) then {
		_till = _level5 - _levelxp;
		player setVariable['levelxp',_till,true];
	}
	if ((player getVariable['level',0]) == 5) then {
		_till = _level6 - _levelxp;
		player setVariable['levelxp',_till,true];
	}
	if ((player getVariable['level',0]) == 6) then {
		_till = _level7 - _levelxp;
		player setVariable['levelxp',_till,true];
	}
	if ((player getVariable['level',0]) == 7) then {
		_till = _level8 - _levelxp;
		player setVariable['levelxp',_till,true];
	}
	if ((player getVariable['level',0]) == 8) then {
		_till = _level9 - _levelxp;
		player setVariable['levelxp',_till,true];
	}
	if ((player getVariable['level',0]) == 9) then {
		_till = _level10 - _levelxp;
		player setVariable['levelxp',_till,true];
	}
	
};