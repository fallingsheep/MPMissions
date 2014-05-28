private ["_body", "_name", "_kills", "_killsH", "_killsB", "_headShots", "_humanity", "_kills_player", "_killsH_player", "_killsB_player", "_headShots_player", "_humanity_player", "_name_player", "_newkills", "_newkillsH", "_newkillsB", "_newhs", "_newhumanity", "_text", "_time", "_deathtime", "_date", "_deathtext"];


_body = _this select 3;
_name = _body getVariable ["bodyName","unknown"];
_kills = _body getVariable ["zombieKills",0];
_killsH = _body getVariable ["humanKills",0];
_killsB = _body getVariable ["banditKills",0];
_headShots = _body getVariable ["headShots",0];
_humanity = _body getVariable ["humanity",0];
_method = 	_body getVariable["deathType","unknown"];
_methodStr = localize format ["str_death_%1",_method];
_deathtime = _body getVariable["deathTime",-1];
_deathtext = localize format ["str_death_%1",_deathtype];

//cutText [format[(localize  "str_player_studybody"),_name,_methodStr], "PLAIN DOWN"];

if (_deathtime < 0) then {
    _text = "unknown";
} else {
    _date = (DateToNumber date);
    _time = (_date - _deathtime) * 525948;
 
    _text = "Their body has been here for a very long time, it has a horrible stench!";
 
    if ( _time < 25 ) then {  //60
        _text = "Their body is cold, its been a while since they died";
    };
 
    if ( _time < 15 ) then {  //30
        _text = "Their body is still slightly warm but their blood has started to coagulate";
    };
 
    if ( _time < 5 ) then { //10
        _text = "Their body hasn't been here long, the blood around them is still warm";
    };
};
cutText [format["Their name was %1, it seems they died from %2. \n%3 \n",_name,_deathtext,_text], "PLAIN DOWN"];

_name_player = name player;
_kills_player = player getVariable ["zombieKills",0];
_killsH_player = player getVariable ["humanKills",0];
_killsB_player = player getVariable ["banditKills",0];
_headShots_player = player getVariable ["headShots",0];
_humanity_player = player getVariable ["humanity",0];

_newkills = _kills_player + _kills;
_newkillsH = _killsH_player + _killsH;
_newkillsB = _killsB_player + _killsB;
_newhs = _headShots_player + _headShots;
_newhumanity = _humanity_player + _humanity;
 
if (exp_studyBody) then {
	if (exp_nopvp) then {
		if (_name_player == _name) then {
			player setVariable ['zombieKills',_newkills,true];
			player setVariable ['humanKills',_newkillsH,true];
			player setVariable ['banditKills',_newkillsB,true];
			player setVariable ['headShots',_headShots,true];
			player setVariable ['humanity',_newhs,true];
		};
	} else {
		player setVariable ['zombieKills',_newkills,true];
		player setVariable ['humanKills',_newkillsH,true];
		player setVariable ['banditKills',_newkillsB,true];
		player setVariable ['headShots',_newhs,true];
		player setVariable ['humanity',_newhumanity,true];
	};
};