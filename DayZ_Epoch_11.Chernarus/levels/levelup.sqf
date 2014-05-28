waitUntil {alive player};

private ["_send", "_levelnew", "_levelold"];

//Must be outside the loop
_send = false;

//Get current level, do not update level!
_levelold = player getVariable['level',0];

//Get level again to compare
_level = player getVariable['level',0];

while (true) do {

	//Reassign level
	_level = player getVariable['level',0];
	
	if (_levelold != _level) then {
		_levelold = _level; 
		_send = false; 
	};

	switch (_level) do {
		case 1: 
			if (_send == false) then {
				systemchat "You have reached level 1";
				_send = true;
			};
		case 2: 
			if (_send == false) then {
				systemchat "You have reached level 2";
				_send = true;
			};
		case 3: 
			if (_send == false) then {
				systemchat "You have reached level 3";
				_send = true;
			};
		case 4: 
			if (_send == false) then {
				systemchat "You have reached level 4";
				_send = true;
			};
		case 5: 
			if (_send == false) then {
				systemchat "You have reached level 5";
				_send = true;
			};
		case 6: 
			if (_send == false) then {
				systemchat "You have reached level 6";
				_send = true;
			};
		case 7: 
			if (_send == false) then {
				systemchat "You have reached level 7";
				_send = true;
			};
		case 8: 
			if (_send == false) then {
				systemchat "You have reached level 8";
				_send = true;
			};
	};

};