// By Zabn 2013 @ BalotaBuddies.net
private["_itemNew","_onLadder","_skin","_body","_okSkin","_clothesTaken","_itemNewName","_result","_clothesDestroyed","_destroyChance"];
_body = _this select 3;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText ["You can't perform this action while on a ladder!" , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["You may not take clothes while in a vehicle", "PLAIN DOWN"]};

player removeAction s_player_clothes;
s_player_clothes = -1;

_skin = (typeOf _body);

_itemNew = _skin;

switch (_itemNew) do {
	case "Priest_DZ": {
		_itemNew = "Priest_DZ";
	};
	case "RU_Policeman_DZ": {
		_itemNew = "RU_Policeman_DZ";
	};
	case "Haris_Press_EP1_DZ": {
		_itemNew = "Haris_Press_EP1_DZ";
	};
	case "Pilot_EP1_DZ": {
		_itemNew = "Pilot_EP1_DZ";
	};
	case "Functionary1_EP1_DZ": {
		_itemNew = "Functionary1_EP1_DZ";
	};
	case "Rocker1_DZ": {
		_itemNew = "Rocker1_DZ";
	};
	case "Rocker2_DZ": {
		_itemNew = "Rocker2_DZ";
	};
	case "Rocker3_DZ": {
		_itemNew = "Rocker3_DZ";
	};
	case "Rocker4_DZ": {
		_itemNew = "Rocker4_DZ";
	};
	case "Rocket_DZ": {
		_itemNew = "Rocket_DZ";
	};
	case "Sniper1_DZ": {
		_itemNew = "Sniper1_DZ";
	};
	case "CZ_Soldier_Sniper_EP1_DZ": {
		_itemNew = "CZ_Soldier_Sniper_EP1_DZ";
	};
	case "Soldier1_DZ": {
		_itemNew = "Soldier1_DZ";
	};
	case "Camo1_DZ": {
		_itemNew = "Camo1_DZ";
	};
	case "GUE_Soldier_MG_DZ": {
		_itemNew = "GUE_Soldier_MG_DZ";
	};
	case "Bandit1_DZ": {
		_itemNew = "Bandit1_DZ";
	};
	case "Bandit2_DZ": {
		_itemNew = "Bandit2_DZ";
	};
	case "BanditW1_DZ": {
		_itemNew = "BanditW1_DZ";
	};
	case "BanditW2_DZ": {
		_itemNew = "BanditW2_DZ";
	};
	case "SurvivorW2_DZ": {
		_itemNew = "SurvivorW2_DZ";
	};
	case "SurvivorW3_DZ": {
		_itemNew = "SurvivorW3_DZ";
	};
	case "SurvivorWcombat_DZ": {
		_itemNew = "SurvivorWcombat_DZ";
	};
	case "SurvivorWdesert_DZ": {
		_itemNew = "SurvivorWdesert_DZ";
	};
	case "SurvivorWurban_DZ": {
		_itemNew = "SurvivorWurban_DZ";
	};
	case "SurvivorWpink_DZ": {
		_itemNew = "SurvivorWpink_DZ";
	};
	case "FR_OHara_DZ": {
		_itemNew = "FR_OHara_DZ";
	};
	case "FR_Rodriguez_DZ": {
		_itemNew = "FR_Rodriguez_DZ";
	};
	case "Graves_Light_DZ": {
		_itemNew = "Graves Light DZ";
	};
	case "CZ_Special_Forces_GL_DES_EP1_DZ": {
		_itemNew = "CZ_Special_Forces_GL_DES_EP1_DZ";
	};
	case "Survivor3_DZ": {
		_itemNew = "Survivor3_DZ";
	};
	case "Survivor2_DZ": {
		_itemNew = "Survivor2_DZ";
	};
	case "Soldier_Sniper_PMC_DZ": {
		_itemNew = "Soldier_Sniper_PMC_DZ";
	};
	case "Soldier_Bodyguard_AA12_PMC_DZ": {
		_itemNew = "Soldier_Bodyguard_AA12_PMC_DZ";
	};
	case "GUE_Soldier_Sniper_DZ": {
		_itemNew = "GUE_Soldier_Sniper_DZ";
	};
	case "GUE_Soldier_Crew_DZ": {
		_itemNew = "GUE_Soldier_Crew_DZ";
	};
	case "GUE_Soldier_CO_DZ": {
		_itemNew = "GUE_Soldier_CO_DZ";
	};
	case "GUE_Soldier_2_DZ": {
		_itemNew = "GUE_Soldier_2_DZ";
	};
	case "GUE_Commander_DZ": {
		_itemNew = "GUE_Commander_DZ";
	};
	case "Ins_Soldier_GL_DZ": {
		_itemNew = "Ins_Soldier_GL_DZ";
	};
	case "TK_INS_Soldier_EP1_DZ": {
		_itemNew = "TK_INS_Soldier_EP1_DZ";
	};
	case "TK_INS_Warlord_EP1_DZ": {
		_itemNew = "TK_INS_Warlord_EP1_DZ";
	};
	case "Drake_Light_DZ": {
		_itemNew = "Drake_Light_DZ";
	};
	
};

_itemNew = "Skin_" + _itemNew;
_okSkin = isClass (configFile >> "CfgMagazines" >> _itemNew);
if(_okSkin) then {
	player playActionNow "Medic";
	sleep 3;
	
	_clothesTaken = _body getVariable["clothesTaken",false];


	if(!_clothesTaken) then {
		_itemNewName = getText (configFile >> "CfgMagazines" >> _itemNew >> "displayName");
		_result = [player,_itemNew] call BIS_fnc_invAdd;
        if (_result) then {
			_body setVariable["clothesTaken",true,true];
			cutText [format["One %1 has been added to your inventory!",_itemNewName], "PLAIN DOWN"];
		} else {
			cutText [format["You didn't have enough room to store a %1 :(",_itemNewName], "PLAIN DOWN"];
        };
	} else {
		cutText ["These clothes has already been taken!", "PLAIN DOWN"];
	};
}else{
	cutText [format["Currently %1 is not supported by the steal skin script.",_skin], "PLAIN DOWN"];
};