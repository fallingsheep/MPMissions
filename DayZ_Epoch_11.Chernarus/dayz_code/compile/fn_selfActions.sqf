scriptName "Functions\misc\fn_selfActions.sqf";
/***********************************************************
	ADD ACTIONS FOR SELF
	- Function
	- [] call fnc_usec_selfActions;
************************************************************/
private ["_isWreckBuilding","_temp_keys","_magazinesPlayer","_isPZombie","_vehicle","_inVehicle","_hasFuelE","_hasRawMeat","_hasKnife","_hasToolbox","_onLadder","_nearLight","_canPickLight","_canDo","_text","_isHarvested","_isVehicle","_isVehicletype","_isMan","_traderType","_ownerID","_isAnimal","_isDog","_isZombie","_isDestructable","_isTent","_isFuel","_isAlive","_Unlock","_lock","_buy","_dogHandle","_lieDown","_warn","_hastinitem","_allowedDistance","_menu","_menu1","_humanity_logic","_low_high","_cancel","_metals_trader","_traderMenu","_isWreck","_isRemovable","_isDisallowRepair","_rawmeat","_humanity","_speed","_dog","_hasbottleitem","_isAir","_isShip","_playersNear","_findNearestGens","_findNearestGen","_IsNearRunningGen","_cursorTarget","_isnewstorage","_itemsPlayer","_ownerKeyId","_typeOfCursorTarget","_hasKey","_oldOwner","_combi","_key_colors","_player_deleteBuild","_player_flipveh","_player_lockUnlock_crtl","_player_butcher","_player_studybody","_player_cook","_player_boil","_hasFuelBarrelE","_hasHotwireKit","_player_SurrenderedGear","_isSurrendered","_isModular","_ownerKeyName","_temp_keys_names","_hasAttached","_allowTow","_liftHeli","_found","_posL","_posC","_height","_liftHelis","_attached"];

if (DZE_ActionInProgress) exitWith {}; // Do not allow if any script is running.

_vehicle = vehicle player;
_isPZombie = player isKindOf "PZombie_VB";
_inVehicle = (_vehicle != player);

_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
// ---------------------------------------Krixes Self Bloodbag Start------------------------------------
    _mags = magazines player;
 
    // Krixes Self Bloodbag
    if ("ItemBloodbag" in _mags) then {
        hasBagItem = true;
    } else { hasBagItem = false;};
    if((speed player <= 1) && hasBagItem && _canDo) then {
        if (s_player_selfBloodbag < 0) then {
            s_player_selfBloodbag = player addaction[("<t color=""#c70000"">" + ("Self Bloodbag") +"</t>"),"scripts\player_selfbloodbag.sqf","",5,false,true,"", ""];
        };
    } else {
        player removeAction s_player_selfBloodbag;
        s_player_selfBloodbag = -1;
    };
// ---------------------------------------Krixes Self Bloodbag End------------------------------------

//####----####----####---- Base Building 1.3 Start ----####----####----####
	_currentSkin = typeOf(player);
	_hasToolbox = "ItemToolbox" in items player;
	_hasMatches    = "ItemMatchbox" in items player;
	_hasETool 	= "ItemEtool" in items player;
	_baseBuildAdmin = ((getPlayerUID player) in BBSuperAdminAccess);
	_baseBuildLAdmin = ((getPlayerUID player) in BBLowerAdminAccess);
	//Get objects that can't be targetted
	_flagBasePole = nearestObject [player, BBTypeOfFlag];
		//All untargetable objects (except Base Flag), searches a 12 meter radius, you can add any new objects you put in the build list that can't be targetted
		_untargetableArray = nearestObjects [player, ["Land_CamoNetB_EAST","Land_CamoNetVar_EAST","Land_CamoNet_EAST","Land_CamoNetB_NATO","Land_CamoNetVar_NATO","Land_CamoNet_NATO","Land_Ind_IlluminantTower","Land_sara_hasic_zbroj","Land_A_Castle_Bergfrit","Land_A_Castle_Gate","Land_A_Castle_Bastion","Land_A_Castle_Wall1_20","Land_A_Castle_Wall1_20_Turn","Land_A_Castle_Wall2_30","HeliH","HeliHCivil","Land_Ind_Shed_01_main","RampConcrete","Land_Ind_Shed_01_end","Land_Ind_SawMillPen"],12];//The number at the end is the range to look for items, if you have issues with some items try increasing it by one or two at a time.
		_nearUntargetable = count _untargetableArray > 0; //Check if anything is in range
		_closestUntargetable = if (_nearUntargetable) then {_untargetableArray select 0};//Selects the closest returned item
		_nettingNames = ["Land_CamoNetB_EAST","Land_CamoNetVar_EAST","Land_CamoNet_EAST","Land_CamoNetB_NATO","Land_CamoNetVar_NATO","Land_CamoNet_NATO"]; //Used for menu options
		_castleNames = ["Land_A_Castle_Bergfrit","Land_A_Castle_Gate","Land_A_Castle_Bastion","Land_A_Castle_Wall1_20","Land_A_Castle_Wall1_20_Turn","Land_A_Castle_Wall2_30"];
		_heliPadNames = ["HeliH","HeliHCivil"];
		_roofNames = ["Land_Ind_Shed_01_main","Land_Ind_Shed_01_end","Land_Ind_SawMillPen"];
		_buildingNames = [];//Can add generic building names here
		_displayName = "Base Build Object";//Default menu option name if none of the following match
		if (typeOf(_closestUntargetable) in _nettingNames) then {_displayName = "Netting";};
		if (typeOf(_closestUntargetable) in _castleNames) then {_displayName = "Castle";};
		if (typeOf(_closestUntargetable) in _heliPadNames) then {_displayName = "HeliPad";};
		if (typeOf(_closestUntargetable) in _roofNames) then {_displayName = "Roof";};
		if (typeOf(_closestUntargetable) in _buildingNames) then {_displayName = "Building";};
		if (typeOf(_closestUntargetable) == "Land_Ind_IlluminantTower") then {_displayName = "Tower";};


	// Check mags in player inventory to show build recipe menu	
	_mags = magazines player;
	if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags || "equip_scrapelectronics" in _mags || "ItemCamoNet" in _mags || "equip_crate" in _mags || "equip_brick" in _mags || "equip_string" in _mags || "equip_duct_tape" in _mags) then {
		hasBuildItem = true;
	} else { hasBuildItem = false;};
	//Build Recipe Menu Action
	if((speed player <= 1) && hasBuildItem && _canDo) then {
		if (s_player_recipeMenu < 0) then {
			s_player_recipeMenu = player addaction [("<t color=""#0074E8"">" + ("Build Recipes") +"</t>"),"buildRecipeBook\build_recipe_dialog.sqf","",5,false,true,"",""];
		};
		if (s_player_buildHelp < 0) then {
			s_player_buildHelp = player addaction [("<t color=""#FF9500"">" + ("Base Building Help") +"</t>"),"dayz_code\actions\build_help.sqf","",5,false,true,"",""];
		};
		if (s_player_showFlags < 0) then {
			s_player_showFlags = player addAction [("<t color=""#FF9500"">" + ("Show My Flags") +"</t>"),"dayz_code\actions\show_flag_markers.sqf","",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_buildHelp;
		s_player_buildHelp = -1;
		player removeAction s_player_recipeMenu;
		s_player_recipeMenu = -1;
		player removeAction s_player_showFlags;
		s_player_showFlags = -1;
	};
	
	//Add in custom eventhandlers or whatever on skin change
	if (_currentSkin != globalSkin) then {
		globalSkin = _currentSkin;
		player removeMPEventHandler ["MPHit", 0]; 
		player removeEventHandler ["AnimChanged", 0];
		ehWall = player addEventHandler ["AnimChanged", { player call antiWall; }];
		empHit = player addMPEventHandler ["MPHit", {_this spawn fnc_plyrHit;}];
	};

	//General Untargetable Objects
	if((isNull cursorTarget) && _canDo && !remProc && !procBuild && _nearUntargetable) then {
	_ownerUnT = _closestUntargetable getVariable ["characterID", "0"]; //Checks owner IDs of untargetable objects, simply to avoid RPT spam with map objects
	_unTauthUID = _closestUntargetable getVariable ["AuthorizedUID", []]; //Gets master AuthUID from untargetable objects
	_unTauthGateCodes = if ((_ownerUnT != "0") && (count _unTauthUID > 0)) then {((getPlayerUID player) in (_unTauthUID select 1));}; //Checks for player access to untargetable objects
	_adminText = if (!_unTauthGateCodes && _baseBuildAdmin) then {"ADMIN:";}else{"";};//Let admins know they aren't registered
		if (_unTauthGateCodes || _baseBuildAdmin) then {
			if (s_player_camoBaseOwnerAccess < 0) then {
				s_player_camoBaseOwnerAccess = player addAction [format["%2%1: Give all base owners (from flagpole) access",_displayName,_adminText], "dayz_code\external\keypad\fnc_keyPad\functions\give_gateAccess.sqf",_closestUntargetable, 1, false, true, "", ""];
			};
			if (s_player_addCamoAuth < 0) then {
				s_player_addCamoAuth = player addAction [format["%2%1: Add Player UIDs",_displayName,_adminText], "dayz_code\external\keypad\fnc_keyPad\enterCodeAdd.sqf",_closestUntargetable, 1, false, true, "", ""];
			};
			if (s_player_removeCamoAuth < 0) then {
				s_player_removeCamoAuth = player addAction [format[("<t color=""#F01313"">" + ("%2%1: Remove Player UIDs") +"</t>"),_displayName,_adminText], "dayz_code\external\keypad\fnc_keyPad\enterCodeRemove.sqf",_closestUntargetable, 1, false, true, "", ""];
			};
		};
		if (_ownerUnT != "0" && (_hasToolbox || _baseBuildAdmin || _baseBuildLAdmin)) then {
			if (s_player_deleteCamoNet < 0) then {
				s_player_deleteCamoNet = player addaction [format[("<t color=""#F01313"">" + ("Remove %1") +"</t>"),_displayName,_adminText],"dayz_code\actions\player_remove.sqf",_closestUntargetable,1,false,true,"",""];
			};
		};
	} else {
		player removeAction s_player_camoBaseOwnerAccess;
		s_player_camoBaseOwnerAccess = -1;
		player removeAction s_player_addCamoAuth;
		s_player_addCamoAuth = -1;
		player removeAction s_player_removeCamoAuth;
		s_player_removeCamoAuth = -1;
		player removeAction s_player_deleteCamoNet;
		s_player_deleteCamoNet = -1;
	};	

	// FlagPole Access (more reliable than cursortarget)
	if ((isNull cursorTarget) && _canDo && !remProc && !procBuild && (_flagBasePole distance player < 10)) then {
	_ownerFlag = _flagBasePole getVariable ["characterID", "0"]; //Checks owner IDs of flags, simply to avoid RPT spam with map objects
	_flagAuthUID = _flagBasePole getVariable ["AuthorizedUID", []]; //Gets master AuthUID from 
	_flagAuthGateCodes = if ((_ownerFlag != "0") && (count _flagAuthUID > 0)) then {((getPlayerUID player) in (_flagAuthUID select 1));}; //Checks if player has access to flag
	_adminText = if (!_flagAuthGateCodes && _baseBuildAdmin) then {"ADMIN:";}else{"";};//Let admins know they aren't registered
		if (_flagAuthGateCodes || _baseBuildAdmin) then {
			if (s_player_addFlagAuth < 0) then {
				s_player_addFlagAuth = player addAction [format["%1FlagPole: Add Player UIDs for Base Building Access",_adminText], "dayz_code\external\keypad\fnc_keyPad\enterCodeAdd.sqf", _flagBasePole, 1, false, true, "", ""];
			};
			if (s_player_removeFlagAuth < 0) then {
				s_player_removeFlagAuth = player addaction [format[("<t color=""#F01313"">" + ("%1FlagPole: Remove Player UIDs") +"</t>"),_adminText],"dayz_code\external\keypad\fnc_keyPad\enterCodeRemove.sqf", _flagBasePole, 1, false, true, "", ""];
			};
			if (s_player_removeFlag < 0) then {
				s_player_removeFlag = player addaction [format[("<t color=""#F01313"">" + ("%1Permanently Remove Flag (restrictions apply)") +"</t>"),_adminText],"dayz_code\actions\player_remove.sqf", _flagBasePole,1,false,true,"",""];
			};
			if (bbAIGuards == 1) then {
				if (s_player_guardToggle < 0) then {
					s_player_guardToggle = player addaction [format[("<t color=""#FFFFFF"">" + ("%1Toggle Guards to Kill all non-base owners (default on)") +"</t>"),_adminText],"dayz_code\actions\toggle_base_guards.sqf",_flagBasePole,1,false,true,"",""];
				};
			};
		};
	} else {
		player removeAction s_player_removeFlag;
		s_player_removeFlag = -1;
		player removeAction s_player_addFlagAuth;
		s_player_addFlagAuth = -1;
		player removeAction s_player_removeFlagAuth;
		s_player_removeFlagAuth = -1;
		player removeAction s_player_guardToggle;
		s_player_guardToggle = -1;
	};
//####----####----####---- Base Building 1.3 END ----####----####----####
_nearLight = 	nearestObject [player,"LitObject"];
_canPickLight = false;
if (!isNull _nearLight) then {
	if (_nearLight distance player < 4) then {
		_canPickLight = isNull (_nearLight getVariable ["owner",objNull]);
	};
};

//Grab Flare
if (_canPickLight and !dayz_hasLight and !_isPZombie) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [format[localize "str_actions_medical_15",_text], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true, "", ""];
		s_player_removeflare = player addAction [format[localize "str_actions_medical_17",_text], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true, "", ""];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};

// Taunt Nearby Zombies if player has hunting knife and has a "live" zombie targeted (35 or less distance to player)
    if ((cursorTarget isKindOf "zZombie_base") and (alive cursorTarget) and !_inVehicle and _canDo and (player distance CursorTarget < 36)) then {
      if (s_player_tauntzed < 0) then {
        if (!_hasKnife) then {
          s_player_tauntzed = player addAction [("<t color=""#A0A0A0"">" + ("Taunt nearby zombies (Bleed and Scream)") + "</t>"), "scripts\player_tauntnearbyzed.sqf",[], 1, false, true, "", ""];
        } else {
          s_player_tauntzed = player addAction [("<t color=""#FF3232"">" + ("Taunt nearby zombies (Bleed and Scream)") + "</t>"), "scripts\player_tauntnearbyzed.sqf",[], 1, false, true, "", ""];
        };
      };
      } else {
      player removeAction s_player_tauntzed;
      s_player_tauntzed = -1;
    };

if (DZE_HeliLift) then {
	_hasAttached = _vehicle getVariable["hasAttached",false];
	if(_inVehicle and (_vehicle isKindOf "Air") and ((getPos _vehicle select 2) < 30) and (speed _vehicle < 5) and (typeName _hasAttached == "OBJECT")) then {
		if (s_player_heli_detach < 0) then {
			dayz_myLiftVehicle = _vehicle;
			s_player_heli_detach = dayz_myLiftVehicle addAction ["Detach Vehicle","\z\addons\dayz_code\actions\player_heliDetach.sqf",[dayz_myLiftVehicle,_hasAttached],2,false,true,"",""];
		};
	} else {
		dayz_myLiftVehicle removeAction s_player_heli_detach;
		s_player_heli_detach = -1;
	};
};

if(DZE_HaloJump) then {
	if(_inVehicle and (_vehicle isKindOf "Air") and ((getPos _vehicle select 2) > 400)) then {
		if (s_halo_action < 0) then {
			DZE_myHaloVehicle = _vehicle;
			s_halo_action = DZE_myHaloVehicle addAction [localize "STR_EPOCH_ACTIONS_HALO","\z\addons\dayz_code\actions\halo_jump.sqf",[],2,false,true,"",""];
		};
	} else {
		DZE_myHaloVehicle removeAction s_halo_action;
		s_halo_action = -1;
	};
};

if (!DZE_ForceNameTagsOff) then {
	if (s_player_showname < 0 and !_isPZombie) then {
		if (DZE_ForceNameTags) then {
			s_player_showname = 1;
			player setVariable["DZE_display_name",true,true];
		} else {
			s_player_showname = player addAction [localize "STR_EPOCH_ACTIONS_NAMEYES", "\z\addons\dayz_code\actions\display_name.sqf",true, 0, true, false, "",""];
			s_player_showname1 = player addAction [localize "STR_EPOCH_ACTIONS_NAMENO", "\z\addons\dayz_code\actions\display_name.sqf",false, 0, true, false, "",""];
		};
	};
};

if(_isPZombie) then {
	if (s_player_callzombies < 0) then {
		s_player_callzombies = player addAction [localize "STR_EPOCH_ACTIONS_RAISEHORDE", "\z\addons\dayz_code\actions\call_zombies.sqf",player, 5, true, false, "",""];
	};
	if (DZE_PZATTACK) then {
		call pz_attack;
		DZE_PZATTACK = false;
	};
	if (s_player_pzombiesvision < 0) then {
		s_player_pzombiesvision = player addAction [localize "STR_EPOCH_ACTIONS_NIGHTVIS", "\z\addons\dayz_code\actions\pzombie\pz_vision.sqf", [], 4, false, true, "nightVision", "_this == _target"];
	};
	if (!isNull cursorTarget and (player distance cursorTarget < 3)) then {	//Has some kind of target
		_isAnimal = cursorTarget isKindOf "Animal";
		_isZombie = cursorTarget isKindOf "zZombie_base";
		_isHarvested = cursorTarget getVariable["meatHarvested",false];
		_isMan = cursorTarget isKindOf "Man";
		// Pzombie Gut human corpse or animal
		if (!alive cursorTarget and (_isAnimal or _isMan) and !_isZombie and !_isHarvested) then {
			if (s_player_pzombiesfeed < 0) then {
				s_player_pzombiesfeed = player addAction [localize "STR_EPOCH_ACTIONS_FEED", "\z\addons\dayz_code\actions\pzombie\pz_feed.sqf",cursorTarget, 3, true, false, "",""];
			};
		} else {
			player removeAction s_player_pzombiesfeed;
			s_player_pzombiesfeed = -1;
		};
	} else {
		player removeAction s_player_pzombiesfeed;
		s_player_pzombiesfeed = -1;
	};
};

// Increase distance only if AIR OR SHIP
_allowedDistance = 4;
_isAir = cursorTarget isKindOf "Air";
_isShip = cursorTarget isKindOf "Ship";
if(_isAir or _isShip) then {
	_allowedDistance = 8;
};

if (!isNull cursorTarget and !_inVehicle and !_isPZombie and (player distance cursorTarget < _allowedDistance) and _canDo) then {	//Has some kind of target

	// set cursortarget to variable
	_cursorTarget = cursorTarget;

	// get typeof cursortarget once
	_typeOfCursorTarget = typeOf _cursorTarget;

	// hintsilent _typeOfCursorTarget;

	_isVehicle = _cursorTarget isKindOf "AllVehicles";
	_isVehicletype = _typeOfCursorTarget in ["ATV_US_EP1","ATV_CZ_EP1"];
	_isnewstorage = _typeOfCursorTarget in DZE_isNewStorage;
	
	// get items and magazines only once
	_magazinesPlayer = magazines player;

	//boiled Water
	_hasbottleitem = "ItemWaterbottle" in _magazinesPlayer;
	_hastinitem = false;
	{
		if (_x in _magazinesPlayer) then {
			_hastinitem = true;
		};
	} forEach boil_tin_cans;
	_hasFuelE = 	"ItemJerrycanEmpty" in _magazinesPlayer;
	_hasFuelBarrelE = 	"ItemFuelBarrelEmpty" in _magazinesPlayer;
	_hasHotwireKit = 	"ItemHotwireKit" in _magazinesPlayer;

	_itemsPlayer = items player;
	
	_temp_keys = [];
	_temp_keys_names = [];
	// find available keys
	_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
	{
		if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in _key_colors) then {
			_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _x >> "keyid");
			_ownerKeyName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_temp_keys_names set [_ownerKeyId,_ownerKeyName];
			_temp_keys set [count _temp_keys,str(_ownerKeyId)];
		};
	} forEach _itemsPlayer;

	_hasKnife = 	"ItemKnife" in _itemsPlayer;
	_hasToolbox = 	"ItemToolbox" in _itemsPlayer;

	_isMan = _cursorTarget isKindOf "Man";
	_traderType = _typeOfCursorTarget;
	_ownerID = _cursorTarget getVariable ["CharacterID","0"];
	_isAnimal = _cursorTarget isKindOf "Animal";
	_isDog =  (_cursorTarget isKindOf "DZ_Pastor" || _cursorTarget isKindOf "DZ_Fin");
	_isZombie = _cursorTarget isKindOf "zZombie_base";
	_isDestructable = _cursorTarget isKindOf "BuiltItems";
	_isWreck = _typeOfCursorTarget in DZE_isWreck;
	_isWreckBuilding = _typeOfCursorTarget in DZE_isWreckBuilding;
	_isModular = _cursorTarget isKindOf "ModularItems";
	
	_isRemovable = _typeOfCursorTarget in DZE_isRemovable;
	_isDisallowRepair = _typeOfCursorTarget in ["M240Nest_DZ"];

	_isTent = _cursorTarget isKindOf "TentStorage";
	
	_isAlive = alive _cursorTarget;
	
	_text = getText (configFile >> "CfgVehicles" >> _typeOfCursorTarget >> "displayName");
	
	_rawmeat = meatraw;
	_hasRawMeat = false;
	{
		if (_x in _magazinesPlayer) then {
			_hasRawMeat = true;
		};
	} forEach _rawmeat; 
	
	_isFuel = false;
	if (_hasFuelE or _hasFuelBarrelE) then {
		{
			if(_cursorTarget isKindOf _x) exitWith {_isFuel = true;};
		} forEach dayz_fuelsources;
	};

	// diag_log ("OWNERID = " + _ownerID + " CHARID = " + dayz_characterID + " " + str(_ownerID == dayz_characterID));
	
	// logic vars
	_player_flipveh = false;
	_player_deleteBuild = false;
	_player_lockUnlock_crtl = false;

	 if (_canDo && (speed player <= 1) && (_cursorTarget isKindOf "Plastic_Pole_EP1_DZ")) then {
		 if (s_player_maintain_area < 0) then {
		  	s_player_maintain_area = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_MAINTAREA"], "\z\addons\dayz_code\actions\maintain_area.sqf", "maintain", 5, false];
		 	s_player_maintain_area_preview = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_MAINTPREV"], "\z\addons\dayz_code\actions\maintain_area.sqf", "preview", 5, false];
		 };
	 } else {
    		player removeAction s_player_maintain_area;
    		s_player_maintain_area = -1;
    		player removeAction s_player_maintain_area_preview;
    		s_player_maintain_area_preview = -1;
	 };

	// CURSOR TARGET ALIVE
	if(_isAlive) then {
		
		//Allow player to delete objects
		if(_isDestructable or _isWreck or _isRemovable or _isWreckBuilding) then {
			if(_hasToolbox and "ItemCrowbar" in _itemsPlayer) then {
				_player_deleteBuild = true;
			};
		};
		
		//Allow owners to delete modulars
                if(_isModular and (dayz_characterID == _ownerID)) then {
                        if(_hasToolbox and "ItemCrowbar" in _itemsPlayer) then {

                                _player_deleteBuild = true;
                        };
                };
		
		// CURSOR TARGET VEHICLE
		if(_isVehicle) then {
			
			//flip vehicle small vehicles by your self and all other vehicles with help nearby
			if (!(canmove _cursorTarget) and (player distance _cursorTarget >= 2) and (count (crew _cursorTarget))== 0 and ((vectorUp _cursorTarget) select 2) < 0.5) then {
				_playersNear = {isPlayer _x} count (player nearEntities ["CAManBase", 6]);
				if(_isVehicletype or (_playersNear >= 2)) then {
					_player_flipveh = true;	
				};
			};


			if(!_isMan and _ownerID != "0" and !(_cursorTarget isKindOf "Bicycle")) then {
				_player_lockUnlock_crtl = true;
			};

		};
	
	};

//####----####----####---- Base Building 1.3 Start ----####----####----####
	_lever = cursorTarget;
	_codePanels = ["Infostand_2_EP1", "Fence_corrugated_plate"];
	_baseBuildAdmin = ((getPlayerUID player) in BBSuperAdminAccess);
	_baseBuildLAdmin = ((getPlayerUID player) in BBLowerAdminAccess);
	_authorizedUID = cursorTarget getVariable ["AuthorizedUID", []];
	_authorizedGateCodes = if ((_ownerID != "0") && (count _authorizedUID > 0)) then {((getPlayerUID player) in (_authorizedUID select 1));}; //Check it's not a map object/unbuilt object to avoid RPT spam
	_adminText = if (!_authorizedGateCodes && _baseBuildAdmin) then {"ADMIN:";}else{"";};//Let admins know they aren't registered
	
	//Let players check the UID of other players when near their flags
	if (_isMan && (_flagBasePole distance player < 10)) then {
	_ownerFlag = _flagBasePole getVariable ["characterID", "0"]; //Checks owner IDs of flags, simply to avoid RPT spam with map objects
	_flagAuthUID = _flagBasePole getVariable ["AuthorizedUID", []]; //Gets master AuthUID from 
	_flagAuthGateCodes = if (_ownerFlag != "0") then {((getPlayerUID player) in (_flagAuthUID select 1));}; //Checks if player has access to flag
	_adminText = if (!_flagAuthGateCodes && _baseBuildAdmin) then {"ADMIN:";}else{"";};//Let admins know they aren't registered
		if (_flagAuthGateCodes || _baseBuildAdmin) then {
			if (s_player_getTargetUID < 0) then {
				s_player_getTargetUID = player addAction [format["%1Get UID of Targeted Player",_adminText], "dayz_code\actions\get_player_UID.sqf", cursorTarget, 4, false, true, "", ""];
			};
		};
	} else {
		player removeAction s_player_getTargetUID;
		s_player_getTargetUID = -1;
	};
	
	// Operate Gates AND Add Authorization to Gate
	if (((typeOf(cursortarget) in _codePanels) && (_authorizedGateCodes || _baseBuildAdmin) && !remProc && !procBuild) || ((typeOf(cursortarget) in allbuildables_class) && (_authorizedGateCodes || _baseBuildAdmin) && !remProc && !procBuild)) then {
		_gates = nearestObjects [_lever, ["Concrete_Wall_EP1"], 15];
		if (s_player_gateActions < 0) then {
			if (typeOf(cursortarget) == "Fence_corrugated_plate") then {
					s_player_gateActions = player addAction [format[("<t color=""#FFF700"">" + ("%1Operate Single Metal Gate") +"</t>"),_adminText], "dayz_code\external\keypad\fnc_keyPad\operate_gates.sqf", _lever, 6, true, true, "", ""];
			} else {
				if (typeOf(cursortarget) == "Infostand_2_EP1") then {
					if (count _gates > 0) then {
						s_player_gateActions = player addAction [format[("<t color=""#FFF700"">" + ("%1Operate Nearest Concrete Gates Within 15 meters") +"</t>"),_adminText], "dayz_code\external\keypad\fnc_keyPad\operate_gates.sqf", _lever, 6, true, true, "", ""];
					} else {s_player_gateActions = player addAction [format[("<t color=""#FFF700"">" + ("%1No gates around to operate") +"</t>"),_adminText], "", _lever, 6, false, true, "", ""];};
				};
			};
		};
		if (s_player_giveBaseOwnerAccess < 0) then {
			s_player_giveBaseOwnerAccess = player addAction [format["%1Give all base owners (from flagpole) access to object/gate",_adminText], "dayz_code\external\keypad\fnc_keyPad\functions\give_gateAccess.sqf", _lever, 1, false, true, "", ""];
		};
		if (s_player_addGateAuthorization < 0) then {
			s_player_addGateAuthorization = player addAction [format["%1Add Player UIDs to Grant Gate/Object Access",_adminText], "dayz_code\external\keypad\fnc_keyPad\enterCodeAdd.sqf", _lever, 1, false, true, "", ""];
		};
		if (s_player_removeGateAuthorization < 0) then {
				s_player_removeGateAuthorization = player addaction [format[("<t color=""#F01313"">" + ("%1Remove Player UIDs from Gate/Object Access") +"</t>"),_adminText],"dayz_code\external\keypad\fnc_keyPad\enterCodeRemove.sqf", _lever, 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_giveBaseOwnerAccess;
		s_player_giveBaseOwnerAccess = -1;
		player removeAction s_player_gateActions;
		s_player_gateActions = -1;
		player removeAction s_player_addGateAuthorization;
		s_player_addGateAuthorization = -1;
		player removeAction s_player_removeGateAuthorization;
		s_player_removeGateAuthorization = -1;
	};
	// Operate ROOFS
	if ((typeOf(cursortarget) in _codePanels) && (_authorizedGateCodes || _baseBuildAdmin) && !remProc && !procBuild) then {
		_gates = nearestObjects [_lever, ["Land_Ind_Shed_01_main","Land_Ind_Shed_01_end","Land_Ind_SawMillPen"], BBFlagRadius];
		if (s_player_roofToggle < 0) then {
			if (typeOf(cursortarget) == "Infostand_2_EP1") then {
				if (count _gates > 0) then {
					s_player_roofToggle = player addAction [format[("<t color=""#FFF700"">" + ("%1Operate Roof Covers") +"</t>"),_adminText], "dayz_code\external\keypad\fnc_keyPad\operate_roofs.sqf", _lever, 6, false, true, "", ""];
				} else {s_player_roofToggle = player addAction [format[("<t color=""#FFF700"">" + ("%1No roof covers around to operate") +"</t>"),_adminText], "", _lever, 6, false, true, "", ""];};
			};
		};
	} else {
		player removeAction s_player_roofToggle;
		s_player_roofToggle = -1;
	};

	// Remove Object
	if((typeOf(cursortarget) in allremovables)&& (_ownerID != "0") && (_hasToolbox || _baseBuildAdmin || _baseBuildLAdmin) && _canDo && !remProc && !procBuild && !removeObject) then {
		if (s_player_deleteBuild < 0) then {
			s_player_deleteBuild = player addAction [format[localize "str_actions_delete",_text], "dayz_code\actions\player_remove.sqf",cursorTarget, 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_deleteBuild;
		s_player_deleteBuild = -1;
	};
	// Disarm Booby Trap Action
	if((cursortarget iskindof "Grave" && cursortarget distance player < 2.5) && (_ownerID != "0") && (_hasToolbox || _baseBuildAdmin || _baseBuildLAdmin) && _canDo && !remProc && !procBuild) then {
		if (s_player_disarmBomb < 0) then {
			s_player_disarmBomb = player addaction [format[("<t color=""#F01313"">" + ("%1Disarm Bomb") +"</t>"),_adminText],"dayz_code\actions\player_disarmBomb.sqf","",1,true,true,"", ""];
		};
	} else {
		player removeAction s_player_disarmBomb;
		s_player_disarmBomb = -1;
	};
	
	//Light Menu
	if((typeOf(cursortarget) == "Infostand_2_EP1") && (_authorizedGateCodes || _baseBuildAdmin) && !remProc && !procBuild) then {
		_nearestFlags = nearestObjects [_lever, [BBTypeOfFlag], BBFlagRadius];
		_baseFlag = _nearestFlags select 0;
		_barrels = nearestObjects [_baseFlag, ["Land_Fire_Barrel"], BBFlagRadius];//Makes sure there are barrels in range of the flag
		_towers = nearestObjects [_baseFlag, ["Land_Ind_IlluminantTower"], BBFlagRadius];//Makes sure there are towers in range of the flag
		if (count _barrels > 0 || count _towers >0) then {
			if (s_player_bbLightMenu < 0) then {
				s_player_bbLightMenu = player addAction [format[("<t color=""#4FF795"">" + ("%1Light Options") +"</t>"),_adminText], "dayz_code\actions\lights\lightMenu.sqf", _lever, 5, false, false, "", ""];
			};
		} else {
			if (s_player_bbLightMenu < 0) then {
				s_player_bbLightMenu = player addAction [format[("<t color=""#4FF795"">" + ("%1No Barrel/Tower Lights in Range of Flag") +"</t>"),_adminText], "", _lever, 5, false, true, "", ""];
			};
		};
	} else {
		player removeAction s_player_bbLightMenu;
		s_player_bbLightMenu = -1;
	};

	//Zombie Shield
	if ((typeOf(cursorTarget) == BBTypeOfZShield) &&(_authorizedGateCodes || _baseBuildAdmin) && !remProc && !procBuild) then {
		if (s_player_giveBaseOwnerAccess > 0) then { //Temp fix to prevent players having more than the max allowed number of shield gens
		player removeAction s_player_giveBaseOwnerAccess;
		s_player_giveBaseOwnerAccess = -1;
		};
		if (BBEnableZShield == 1) then {
			if (s_player_bbZombieShield_on < 0) then {
				s_player_bbZombieShield_on = player addAction [format[("<t color=""#FFF700"">" + ("%1Zombie Shield On") +"</t>"),_adminText], "dayz_code\actions\shield\bbZombieShield.sqf", [_lever, true], 6, true, true, "", ""];
			};
			if (s_player_bbZombieShield_off < 0) then {
				s_player_bbZombieShield_off = player addAction [format[("<t color=""#FFF700"">" + ("%1Zombie Shield Off") +"</t>"),_adminText], "dayz_code\actions\shield\bbZombieShield.sqf", [_lever, false], 6, false, true, "", ""];
			};
		} else {
			if (s_player_bbZombieShield_on < 0) then {
				s_player_bbZombieShield_on = player addAction [format[("<t color=""#FFF700"">" + ("%1Zombie Shields are disabled on this server") +"</t>"),_adminText], "", [], 6, false, true, "", ""];
			};
			player removeAction s_player_bbZombieShield_off;
			s_player_bbZombieShield_off = -1;
		};
	} else {
		player removeAction s_player_bbZombieShield_on;
		s_player_bbZombieShield_on = -1;
		player removeAction s_player_bbZombieShield_off;
		s_player_bbZombieShield_off = -1;
	};
//####----####----####---- Base Building 1.3 End ----####----####----####

//heli lift
    	if (DZE_HeliLift) then {
    _liftHeli = objNull;
    _found = false;
    _allowTow = false;
    if ((count (crew _cursorTarget)) == 0) then {
    { if(!_allowTow) then { _allowTow = _cursorTarget isKindOf _x; }; } forEach DZE_HeliAllowToTowLight;
    if(_allowTow) then { _lightweight = true; } else { _lightweight = false; };
    };
    if ((count (crew _cursorTarget)) == 0) then {
    { if(!_allowTow) then { _allowTow = _cursorTarget isKindOf _x; }; } forEach DZE_HeliAllowToTowMedium;
    if(_allowTow and !_lightweight) then { _mediumweight = true; } else { _mediumweight = false; };
    };
    if ((count (crew _cursorTarget)) == 0) then {
    { if(!_allowTow) then { _allowTow = _cursorTarget isKindOf _x; }; } forEach DZE_HeliAllowToTowHeavy;
    if(_allowTow and !_lightweight and !_mediumweight) then { _heavyweight = true; } else { _heavyweight = false; };
    };
    if ((count (crew _cursorTarget)) == 0) then {
    { if(!_allowTow) then { _allowTow = _cursorTarget isKindOf _x; }; } forEach DZE_HeliAllowToTowSuperHeavy;
    if(_allowTow and !_lightweight and !_mediumweight and !_heavyweight) then { _superheavyweight = true; } else { _superheavyweight = false; };
    };
    //diag_log format["CREW: %1 ALLOW: %2",(count (crew _cursorTarget)),_allowTow];
    if (_allowTow and _lightweight and !_found) then {
    _liftHelis = nearestObjects [player, DZE_HeliAllowTowFromLight, 15];
    {
    if(!_found) then {
    _posL = getPos _x;
    _posC = getPos _cursorTarget;
    _height = (_posL select 2) - (_posC select 2);
    _hasAttached = _x getVariable["hasAttached",false];
    if(_height < 15 and _height > 5 and (typeName _hasAttached != "OBJECT")) then {
    if(((abs((_posL select 0) - (_posC select 0))) < 10) and ((abs((_posL select 1) - (_posC select 1))) < 10)) then {
    _liftHeli = _x;
    _found = true;
    };
    };
    };
    } forEach _liftHelis;
    };
    if ( _allowTow and !_found and ( _mediumweight or _lightweight ) ) then {
    _liftHelis = nearestObjects [player, DZE_HeliAllowTowFromMedium, 15];
    {
    if(!_found) then {
    _posL = getPos _x;
    _posC = getPos _cursorTarget;
    _height = (_posL select 2) - (_posC select 2);
    _hasAttached = _x getVariable["hasAttached",false];
    if(_height < 15 and _height > 5 and (typeName _hasAttached != "OBJECT")) then {
    if(((abs((_posL select 0) - (_posC select 0))) < 10) and ((abs((_posL select 1) - (_posC select 1))) < 10)) then {
    _liftHeli = _x;
    _found = true;
    };
    };
    };
    } forEach _liftHelis;
    };
    if ( _allowTow and !_found and ( _heavyweight or _mediumweight or _lightweight ) ) then {
    _liftHelis = nearestObjects [player, DZE_HeliAllowTowFromHeavy, 15];
    {
    if(!_found) then {
    _posL = getPos _x;
    _posC = getPos _cursorTarget;
    _height = (_posL select 2) - (_posC select 2);
    _hasAttached = _x getVariable["hasAttached",false];
    if(_height < 15 and _height > 5 and (typeName _hasAttached != "OBJECT")) then {
    if(((abs((_posL select 0) - (_posC select 0))) < 10) and ((abs((_posL select 1) - (_posC select 1))) < 10)) then {
    _liftHeli = _x;
    _found = true;
    };
    };
    };
    } forEach _liftHelis;
    };
    if ( _allowTow and !_found and ( _superheavyweight or _heavyweight or _mediumweight or _lightweight ) ) then {
    _liftHelis = nearestObjects [player, DZE_HeliAllowTowFromSuperHeavy, 15];
    {
    if(!_found) then {
    _posL = getPos _x;
    _posC = getPos _cursorTarget;
    _height = (_posL select 2) - (_posC select 2);
    _hasAttached = _x getVariable["hasAttached",false];
    if(_height < 15 and _height > 5 and (typeName _hasAttached != "OBJECT")) then {
    if(((abs((_posL select 0) - (_posC select 0))) < 10) and ((abs((_posL select 1) - (_posC select 1))) < 10)) then {
    _liftHeli = _x;
    _found = true;
    };
    };
    };
    } forEach _liftHelis;
    };
    //diag_log format["HELI: %1 TARGET: %2",_found,_cursorTarget];
    _attached = _cursorTarget getVariable["attached",false];
    if(_found and _allowTow and _canDo and !locked _cursorTarget and !_isPZombie and (typeName _attached != "OBJECT")) then {
    if (s_player_heli_lift < 0) then {
    s_player_heli_lift = player addAction ["Attach to Heli", "\z\addons\dayz_code\actions\player_heliLift.sqf",[_liftHeli,_cursorTarget], -10, false, true, "",""];
    };
    } else {
    player removeAction s_player_heli_lift;
    s_player_heli_lift = -1;
    };
    };
	
	// Allow Owner to lock and unlock vehicle  
	if(_player_lockUnlock_crtl) then {
		if (s_player_lockUnlock_crtl < 0) then {
			_hasKey = _ownerID in _temp_keys;
			_oldOwner = (_ownerID == dayz_playerUID);
			if(locked _cursorTarget) then {
				if(_hasKey or _oldOwner) then {
					_Unlock = player addAction [format[localize "STR_EPOCH_ACTIONS_UNLOCK",_text], "\z\addons\dayz_code\actions\unlock_veh.sqf",[_cursorTarget,(_temp_keys_names select (parseNumber _ownerID))], 2, true, true, "", ""];
					s_player_lockunlock set [count s_player_lockunlock,_Unlock];
					s_player_lockUnlock_crtl = 1;
				} else {
					if(_hasHotwireKit) then {
						_Unlock = player addAction [format[localize "STR_EPOCH_ACTIONS_HOTWIRE",_text], "\z\addons\dayz_code\actions\hotwire_veh.sqf",_cursorTarget, 2, true, true, "", ""];
					} else {
						_Unlock = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_VEHLOCKED"], "",_cursorTarget, 2, true, true, "", ""];
					};
					s_player_lockunlock set [count s_player_lockunlock,_Unlock];
					s_player_lockUnlock_crtl = 1;
				};
			} else {
				if(_hasKey or _oldOwner) then {
					_lock = player addAction [format[localize "STR_EPOCH_ACTIONS_LOCK",_text], "\z\addons\dayz_code\actions\lock_veh.sqf",_cursorTarget, 1, true, true, "", ""];
					s_player_lockunlock set [count s_player_lockunlock,_lock];
					s_player_lockUnlock_crtl = 1;
				};
			};
		};
		 
	} else {
		{player removeAction _x} forEach s_player_lockunlock;s_player_lockunlock = [];
		s_player_lockUnlock_crtl = -1;
	};

	if(DZE_AllowForceSave) then {
		//Allow player to force save
		if((_isVehicle or _isTent) and !_isMan) then {
			if (s_player_forceSave < 0) then {
				s_player_forceSave = player addAction [format[localize "str_actions_save",_text], "\z\addons\dayz_code\actions\forcesave.sqf",_cursorTarget, 1, true, true, "", ""];
			};
		} else {
			player removeAction s_player_forceSave;
			s_player_forceSave = -1;
		};
	};

	
	
	If(DZE_AllowCargoCheck) then {
		if((_isVehicle or _isTent or _isnewstorage) and _isAlive and !_isMan and !locked _cursorTarget) then {
			if (s_player_checkGear < 0) then {
				s_player_checkGear = player addAction [localize "STR_EPOCH_PLAYER_CARGO", "\z\addons\dayz_code\actions\cargocheck.sqf",_cursorTarget, 1, true, true, "", ""];
			};
		} else {
			player removeAction s_player_checkGear;
			s_player_checkGear = -1;
		};
	};
	
	
	//flip vehicle small vehicles by your self and all other vehicles with help nearby
	if(_player_flipveh) then {
		if (s_player_flipveh  < 0) then {
			s_player_flipveh = player addAction [format[localize "str_actions_flipveh",_text], "\z\addons\dayz_code\actions\player_flipvehicle.sqf",_cursorTarget, 1, true, true, "", ""];		
		};
	} else {
		player removeAction s_player_flipveh;
		s_player_flipveh = -1;
	}; 
	
	//Allow player to fill jerrycan
	if((_hasFuelE or _hasFuelBarrelE) and _isFuel) then {
		if (s_player_fillfuel < 0) then {
			s_player_fillfuel = player addAction [localize "str_actions_self_10", "\z\addons\dayz_code\actions\jerry_fill.sqf",[], 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_fillfuel;
		s_player_fillfuel = -1;
	};
	
	// logic vars for addactions
	_player_butcher = false;
	_player_studybody = false;
	_player_SurrenderedGear = false;

	// CURSOR TARGET NOT ALIVE
	if (!_isAlive) then {

		// Gut animal/zed
		if((_isAnimal or _isZombie) and _hasKnife) then {
			_isHarvested = _cursorTarget getVariable["meatHarvested",false];
			if (!_isHarvested) then {
				_player_butcher = true;
			};
		};

		// Study body
		if (_isMan and !_isZombie and !_isAnimal) then {
			_player_studybody = true;
		}
	} else {
		// unit alive

		// gear access on surrendered player
		if(_isMan and !_isZombie and !_isAnimal) then {
			_isSurrendered = _cursorTarget getVariable ["DZE_Surrendered",false];
			if (_isSurrendered) then {
				_player_SurrenderedGear = true;
			};
		};
	};


	// Human Gut animal or zombie
	if (_player_butcher) then {
		if (s_player_butcher < 0) then {
			if(_isZombie) then {
				s_player_butcher = player addAction [localize "STR_EPOCH_ACTIONS_GUTZOM", "\z\addons\dayz_code\actions\gather_zparts.sqf",_cursorTarget, 0, true, true, "", ""];
			} else {
				s_player_butcher = player addAction [localize "str_actions_self_04", "\z\addons\dayz_code\actions\gather_meat.sqf",_cursorTarget, 3, true, true, "", ""];
			};
		};
	} else {
		player removeAction s_player_butcher;
		s_player_butcher = -1;
	};

	// Study Body
	if (_player_studybody) then {
		if (s_player_studybody < 0) then {
			s_player_studybody = player addAction [localize "str_action_studybody", "\z\addons\dayz_code\actions\study_body.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_studybody;
		s_player_studybody = -1;
	};

    //CLOTHES
    if (_isMan and !_isAlive and !_isZombie and !_isAnimal) then {
		if (s_clothes < 0) then {
            s_clothes = player addAction [("<t color=""#FF0000"">" + ("Take Clothes") + "</t>"), "scripts\clothes.sqf",cursorTarget, 1, false, true, "",""];
        };
    } else {
        player removeAction s_clothes;
        s_clothes = -1;
    };
	
	//BURY BODIES
	if (!_isAlive and !_isZombie and !_isAnimal and _hasETool and _isMan and _canDo) then {
        if (s_player_bury_human < 0) then {
            s_player_bury_human = player addAction [format["Bury Body"], "scripts\bury_human.sqf",cursorTarget, 3, true, true, "", ""];
        }
    } else {
        player removeAction s_player_bury_human;
        s_player_bury_human = -1;
    };
	
	// logic vars
	_player_cook = false;
	_player_boil = false;

	// CURSOR TARGET IS FIRE
	if (inflamed _cursorTarget) then {
		
		//Fireplace Actions check
		if (_hasRawMeat) then {
			_player_cook = true;	
		};
		
		// Boil water
		if (_hasbottleitem and _hastinitem) then {
			_player_boil = true;
		};
	};

	if (_player_SurrenderedGear) then {
		if (s_player_SurrenderedGear < 0) then {
			s_player_SurrenderedGear = player addAction [localize "STR_EPOCH_ACTION_GEAR", "\z\addons\dayz_code\actions\surrender_gear.sqf",_cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_SurrenderedGear;
		s_player_SurrenderedGear = -1;
	};

	//Fireplace Actions check
	if (_player_cook) then {
		if (s_player_cook < 0) then {
			s_player_cook = player addAction [localize "str_actions_self_05", "\z\addons\dayz_code\actions\cook.sqf",_cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_cook;
		s_player_cook = -1;
	};
	
	// Boil water
	if (_player_boil) then {
		if (s_player_boil < 0) then {
			s_player_boil = player addAction [localize "str_actions_boilwater", "\z\addons\dayz_code\actions\boil.sqf",_cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_boil;
		s_player_boil = -1;
	};
	
	if(_cursorTarget == dayz_hasFire) then {
		if ((s_player_fireout < 0) and !(inflamed _cursorTarget) and (player distance _cursorTarget < 3)) then {
			s_player_fireout = player addAction [localize "str_actions_self_06", "\z\addons\dayz_code\actions\fire_pack.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_fireout;
		s_player_fireout = -1;
	};
	//BURN TENT
	if(_isTent and _hasMatches and _canDo and !_isMan) then {
        if (s_player_igniteTent < 0) then {
            s_player_igniteTent = player addAction [format["Ignite Tent"], "scripts\tent_ignite.sqf",cursorTarget, 1, true, true, "", ""];
        };
    } else {
        player removeAction s_player_igniteTent;
        s_player_igniteTent = -1;
    };
	
	//Packing my tent
	if(_isTent and (player distance _cursorTarget < 3)) then {
		if (_ownerID == dayz_characterID) then {
			if (s_player_packtent < 0) then {
				s_player_packtent = player addAction [localize "str_actions_self_07", "\z\addons\dayz_code\actions\tent_pack.sqf",_cursorTarget, 0, false, true, "",""];
			};
		} else {
			if(("ItemJerrycan" in _magazinesPlayer) and ("ItemMatchbox_DZE" in weapons player)) then {
				if (s_player_packtent < 0) then {
					s_player_packtent = player addAction [localize "STR_EPOCH_ACTIONS_DESTROYTENT", "\z\addons\dayz_code\actions\remove.sqf",_cursorTarget, 1, true, true, "", ""];
				};
			};
		};
	} else {
		player removeAction s_player_packtent;
		s_player_packtent = -1;
	};

	//Allow owner to unlock vault
	if((_typeOfCursorTarget in DZE_LockableStorage) and _ownerID != "0" and (player distance _cursorTarget < 3)) then {
		if (s_player_unlockvault < 0) then {
			if(_typeOfCursorTarget in DZE_LockedStorage) then {
				if(_ownerID == dayz_combination or _ownerID == dayz_playerUID) then {
					_combi = player addAction [format[localize "STR_EPOCH_ACTIONS_OPEN",_text], "\z\addons\dayz_code\actions\vault_unlock.sqf",_cursorTarget, 0, false, true, "",""];
					s_player_combi set [count s_player_combi,_combi];
				} else {
					_combi = player addAction [format[localize "STR_EPOCH_ACTIONS_UNLOCK",_text], "\z\addons\dayz_code\actions\vault_combination_1.sqf",_cursorTarget, 0, false, true, "",""];
					s_player_combi set [count s_player_combi,_combi];
				};
				s_player_unlockvault = 1;
			} else {
				if(_ownerID != dayz_combination and _ownerID != dayz_playerUID) then {
					_combi = player addAction [localize "STR_EPOCH_ACTIONS_RECOMBO", "\z\addons\dayz_code\actions\vault_combination_1.sqf",_cursorTarget, 0, false, true, "",""];
					s_player_combi set [count s_player_combi,_combi];
					s_player_unlockvault = 1;
				};
			};
		};
	} else {
		{player removeAction _x} forEach s_player_combi;s_player_combi = [];
		s_player_unlockvault = -1;
	};

	//Allow owner to pack vault
	if(_typeOfCursorTarget in DZE_UnLockedStorage and _ownerID != "0" and (player distance _cursorTarget < 3)) then {

		if (s_player_lockvault < 0) then {
			if(_ownerID == dayz_combination or _ownerID == dayz_playerUID) then {
				s_player_lockvault = player addAction [format[localize "STR_EPOCH_ACTIONS_LOCK",_text], "\z\addons\dayz_code\actions\vault_lock.sqf",_cursorTarget, 0, false, true, "",""];
			};
		};
		if (s_player_packvault < 0 and (_ownerID == dayz_combination or _ownerID == dayz_playerUID)) then {
			s_player_packvault = player addAction [format["<t color='#ff0000'>%1</t>",(format[localize "STR_EPOCH_ACTIONS_PACK",_text])], "\z\addons\dayz_code\actions\vault_pack.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_packvault;
		s_player_packvault = -1;
		player removeAction s_player_lockvault;
		s_player_lockvault = -1;
	};

	

    //Player Deaths
	if(_typeOfCursorTarget == "Info_Board_EP1") then {
		if (s_player_information < 0) then {
			s_player_information = player addAction [localize "STR_EPOCH_ACTIONS_MURDERS", "\z\addons\dayz_code\actions\list_playerDeaths.sqf",[], 7, false, true, "",""];
		};
	} else {
		player removeAction s_player_information;
		s_player_information = -1;
	};
	
	//Fuel Pump
	if(_typeOfCursorTarget in dayz_fuelpumparray) then {	
		if (s_player_fuelauto < 0) then {
			
			// check if Generator_DZ is running within 30 meters
			_findNearestGens = nearestObjects [player, ["Generator_DZ"], 30];
			_findNearestGen = [];
			{
				if (alive _x and (_x getVariable ["GeneratorRunning", false])) then {
					_findNearestGen set [(count _findNearestGen),_x];
				};
			} foreach _findNearestGens;
			_IsNearRunningGen = count (_findNearestGen);
			
			// show that pump needs power if no generator nearby.
			if(_IsNearRunningGen > 0) then {
				s_player_fuelauto = player addAction [localize "STR_EPOCH_ACTIONS_FILLVEH", "\z\addons\dayz_code\actions\fill_nearestVehicle.sqf",objNull, 0, false, true, "",""];
			} else {
				s_player_fuelauto = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_NEEDPOWER"], "",[], 0, false, true, "",""];
			};
		};
	} else {
		player removeAction s_player_fuelauto;
		s_player_fuelauto = -1;
	};

	//Fuel Pump on truck
	if(_typeOfCursorTarget in DZE_fueltruckarray and alive _cursorTarget) then {	
		if (s_player_fuelauto2 < 0) then {
			// show that fuel truck pump needs power.
			if(isEngineOn _cursorTarget) then {
				s_player_fuelauto2 = player addAction [localize "STR_EPOCH_ACTIONS_FILLVEH", "\z\addons\dayz_code\actions\fill_nearestVehicle.sqf",_cursorTarget, 0, false, true, "",""];
			} else {
				s_player_fuelauto2 = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_NEEDPOWER"], "",[], 0, false, true, "",""];
			};
		};
	} else {
		player removeAction s_player_fuelauto2;
		s_player_fuelauto2 = -1;
	};

	// inplace upgrade tool
	if ((_cursorTarget isKindOf "ModularItems") or (_cursorTarget isKindOf "Land_DZE_WoodDoor_Base") or (_cursorTarget isKindOf "CinderWallDoor_DZ_Base")) then {
		if ((s_player_lastTarget select 0) != _cursorTarget) then {
			if (s_player_upgrade_build > 0) then {
				player removeAction s_player_upgrade_build;
				s_player_upgrade_build = -1;
			};
		};
		if (s_player_upgrade_build < 0) then {
			// s_player_lastTarget = _cursorTarget;
			s_player_lastTarget set [0,_cursorTarget];
			s_player_upgrade_build = player addAction [format[localize "STR_EPOCH_ACTIONS_UPGRADE",_text], "\z\addons\dayz_code\actions\player_upgrade.sqf",_cursorTarget, -1, false, true, "",""];
		};
	} else {
		player removeAction s_player_upgrade_build;
		s_player_upgrade_build = -1;
	};
	
	// downgrade system
	if((_isDestructable or _cursorTarget isKindOf "Land_DZE_WoodDoorLocked_Base" or _cursorTarget isKindOf "CinderWallDoorLocked_DZ_Base") and (DZE_Lock_Door == _ownerID)) then {
		if ((s_player_lastTarget select 1) != _cursorTarget) then {
			if (s_player_downgrade_build > 0) then {	
				player removeAction s_player_downgrade_build;
				s_player_downgrade_build = -1;
			};
		};

		if (s_player_downgrade_build < 0) then {
			s_player_lastTarget set [1,_cursorTarget];
			s_player_downgrade_build = player addAction [format[localize "STR_EPOCH_ACTIONS_REMLOCK",_text], "\z\addons\dayz_code\actions\player_buildingDowngrade.sqf",_cursorTarget, -2, false, true, "",""];
		};
	} else {
		player removeAction s_player_downgrade_build;
		s_player_downgrade_build = -1;
	};

	// inplace maintenance tool
	if((_cursorTarget isKindOf "ModularItems" or _cursorTarget isKindOf "DZE_Housebase" or _typeOfCursorTarget == "LightPole_DZ") and (damage _cursorTarget >= DZE_DamageBeforeMaint)) then {
		if ((s_player_lastTarget select 2) != _cursorTarget) then {
			if (s_player_maint_build > 0) then {	
				player removeAction s_player_maint_build;
				s_player_maint_build = -1;
			};
		};

		if (s_player_maint_build < 0) then {
			s_player_lastTarget set [2,_cursorTarget];
			s_player_maint_build = player addAction [format[localize "STR_EPOCH_ACTIONS_MAINTAIN",_text], "\z\addons\dayz_code\actions\player_buildingMaint.sqf",_cursorTarget, -2, false, true, "",""];
		};
	} else {
		player removeAction s_player_maint_build;
		s_player_maint_build = -1;
	};


	//Start Generator
	if(_cursorTarget isKindOf "Generator_DZ") then {
		if (s_player_fillgen < 0) then {
			
			// check if not running 
			if((_cursorTarget getVariable ["GeneratorRunning", false])) then {
				s_player_fillgen = player addAction [localize "STR_EPOCH_ACTIONS_GENERATOR1", "\z\addons\dayz_code\actions\stopGenerator.sqf",_cursorTarget, 0, false, true, "",""];				
			} else {
			// check if not filled and player has jerry.
				if((_cursorTarget getVariable ["GeneratorFilled", false])) then {
					s_player_fillgen = player addAction [localize "STR_EPOCH_ACTIONS_GENERATOR2", "\z\addons\dayz_code\actions\fill_startGenerator.sqf",_cursorTarget, 0, false, true, "",""];
				} else {
					if("ItemJerrycan" in _magazinesPlayer) then {
						s_player_fillgen = player addAction [localize "STR_EPOCH_ACTIONS_GENERATOR3", "\z\addons\dayz_code\actions\fill_startGenerator.sqf",_cursorTarget, 0, false, true, "",""];
					};
				};
			};
		};
	} else {
		player removeAction s_player_fillgen;
		s_player_fillgen = -1;
	};

	//Towing with tow truck
	/*
	if(_typeOfCursorTarget == "TOW_DZE") then {
		if (s_player_towing < 0) then {
			if(!(_cursorTarget getVariable ["DZEinTow", false])) then {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_ATTACH" "\z\addons\dayz_code\actions\tow_AttachStraps.sqf",_cursorTarget, 0, false, true, "",""];				
			} else {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_DETACH", "\z\addons\dayz_code\actions\tow_DetachStraps.sqf",_cursorTarget, 0, false, true, "",""];				
			};
		};
	} else {
		player removeAction s_player_towing;
		s_player_towing = -1;
	};
	*/
	//TOWING
	call compile preprocessFileLineNumbers 'addons\init.sqf';

    //Sleep
	if(_isTent and _ownerID == dayz_characterID) then {
		if ((s_player_sleep < 0) and (player distance _cursorTarget < 3)) then {
			s_player_sleep = player addAction [localize "str_actions_self_sleep", "scripts\player_sleep.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_sleep;
		s_player_sleep = -1;
	};
	
	//Repairing Vehicles
	if ((dayz_myCursorTarget != _cursorTarget) and _isVehicle and !_isMan and _hasToolbox and (damage _cursorTarget < 1) and !_isDisallowRepair) then {
		if (s_player_repair_crtl < 0) then {
			dayz_myCursorTarget = _cursorTarget;
			_menu = dayz_myCursorTarget addAction [localize "STR_EPOCH_PLAYER_REPAIRV", "\z\addons\dayz_code\actions\repair_vehicle.sqf",_cursorTarget, 0, true, false, "",""];
			//_menu1 = dayz_myCursorTarget addAction [localize "STR_EPOCH_PLAYER_SALVAGEV", "\z\addons\dayz_code\actions\salvage_vehicle.sqf",_cursorTarget, 0, true, false, "",""];
			_menu1 = dayz_myCursorTarget addAction [localize "STR_EPOCH_PLAYER_SALVAGEV", "scripts\ss_remove.sqf",_cursorTarget, 0, true, false, "",""];
			
			s_player_repairActions set [count s_player_repairActions,_menu];
			s_player_repairActions set [count s_player_repairActions,_menu1];
			s_player_repair_crtl = 1;
		} else {
			{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
			s_player_repair_crtl = -1;
		};
	};

	// All Traders
	if (_isMan and !_isPZombie and _traderType in serverTraders) then {
		
		if (s_player_parts_crtl < 0) then {

			// get humanity
			_humanity = player getVariable ["humanity",0];
			_traderMenu = call compile format["menu_%1;",_traderType];

			// diag_log ("TRADER = " + str(_traderMenu));
			
			_low_high = "low";
			_humanity_logic = false;
			if((_traderMenu select 2) == "friendly") then {
				_humanity_logic = (_humanity < -5000);
			};
			if((_traderMenu select 2) == "hostile") then {
				_low_high = "high";
				_humanity_logic = (_humanity > -5000);
			};
			if((_traderMenu select 2) == "hero") then {
				_humanity_logic = (_humanity < 5000);
			};
			if(_humanity_logic) then {
				_cancel = player addAction [format[localize "STR_EPOCH_ACTIONS_HUMANITY",_low_high], "\z\addons\dayz_code\actions\trade_cancel.sqf",["na"], 0, true, false, "",""];
				s_player_parts set [count s_player_parts,_cancel];
			} else {
				
				// Static Menu
				{
					//diag_log format["DEBUG TRADER: %1", _x];
					_buy = player addAction [format["Trade %1 %2 for %3 %4",(_x select 3),(_x select 5),(_x select 2),(_x select 6)], "\z\addons\dayz_code\actions\trade_items_wo_db.sqf",[(_x select 0),(_x select 1),(_x select 2),(_x select 3),(_x select 4),(_x select 5),(_x select 6)], (_x select 7), true, true, "",""];
					s_player_parts set [count s_player_parts,_buy];
				
				} forEach (_traderMenu select 1);
				// Database menu
				_buy = player addAction [localize "STR_EPOCH_PLAYER_289", "\z\addons\dayz_code\actions\show_dialog.sqf",(_traderMenu select 0), 999, true, false, "",""];
				s_player_parts set [count s_player_parts,_buy];





			};
			s_player_parts_crtl = 1;
			
		};
	} else {
		{player removeAction _x} forEach s_player_parts;s_player_parts = [];
		s_player_parts_crtl = -1;
	};

	
	if(dayz_tameDogs) then {
		
		//Dog
		if (_isDog and _isAlive and (_hasRawMeat) and _ownerID == "0" and player getVariable ["dogID", 0] == 0) then {
			if (s_player_tamedog < 0) then {
				s_player_tamedog = player addAction [localize "str_actions_tamedog", "\z\addons\dayz_code\actions\tame_dog.sqf", _cursorTarget, 1, false, true, "", ""];
			};
		} else {
			player removeAction s_player_tamedog;
			s_player_tamedog = -1;
		};
		if (_isDog and _ownerID == dayz_characterID and _isAlive) then {
			_dogHandle = player getVariable ["dogID", 0];
			if (s_player_feeddog < 0 and _hasRawMeat) then {
				s_player_feeddog = player addAction [localize "str_actions_feeddog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,0], 0, false, true,"",""];
			};
			if (s_player_waterdog < 0 and "ItemWaterbottle" in _magazinesPlayer) then {
				s_player_waterdog = player addAction [localize "str_actions_waterdog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,1], 0, false, true,"",""];
			};
			if (s_player_staydog < 0) then {
				_lieDown = _dogHandle getFSMVariable "_actionLieDown";
				if (_lieDown) then { _text = "str_actions_liedog"; } else { _text = "str_actions_sitdog"; };
				s_player_staydog = player addAction [localize _text,"\z\addons\dayz_code\actions\dog\stay.sqf", _dogHandle, 5, false, true,"",""];
			};
			if (s_player_trackdog < 0) then {
				s_player_trackdog = player addAction [localize "str_actions_trackdog","\z\addons\dayz_code\actions\dog\track.sqf", _dogHandle, 4, false, true,"",""];
			};
			if (s_player_barkdog < 0) then {
				s_player_barkdog = player addAction [localize "str_actions_barkdog","\z\addons\dayz_code\actions\dog\speak.sqf", _cursorTarget, 3, false, true,"",""];
			};
			if (s_player_warndog < 0) then {
				_warn = _dogHandle getFSMVariable "_watchDog";
				if (_warn) then { _text = (localize "str_epoch_player_247"); _warn = false; } else { _text = (localize "str_epoch_player_248"); _warn = true; };
				s_player_warndog = player addAction [format[localize "str_actions_warndog",_text],"\z\addons\dayz_code\actions\dog\warn.sqf",[_dogHandle, _warn], 2, false, true,"",""];		
			};
			if (s_player_followdog < 0) then {
				s_player_followdog = player addAction [localize "str_actions_followdog","\z\addons\dayz_code\actions\dog\follow.sqf",[_dogHandle,true], 6, false, true,"",""];
			};
		} else {
			player removeAction s_player_feeddog;
			s_player_feeddog = -1;
			player removeAction s_player_waterdog;
			s_player_waterdog = -1;
			player removeAction s_player_staydog;
			s_player_staydog = -1;
			player removeAction s_player_trackdog;
			s_player_trackdog = -1;
			player removeAction s_player_barkdog;
			s_player_barkdog = -1;
			player removeAction s_player_warndog;
			s_player_warndog = -1;
			player removeAction s_player_followdog;
			s_player_followdog = -1;
		};
	};

} else {
	//Engineering
	{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
	s_player_repair_crtl = -1;

	{player removeAction _x} forEach s_player_combi;s_player_combi = [];
		
	dayz_myCursorTarget = objNull;
	s_player_lastTarget = [objNull,objNull,objNull,objNull,objNull];

	{player removeAction _x} forEach s_player_parts;s_player_parts = [];
	s_player_parts_crtl = -1;

	{player removeAction _x} forEach s_player_lockunlock;s_player_lockunlock = [];
	s_player_lockUnlock_crtl = -1;

	player removeAction s_player_checkGear;
	s_player_checkGear = -1;

	player removeAction s_player_SurrenderedGear;
	s_player_SurrenderedGear = -1;
	//####----####----####---- Base Building 1.3 Start ----####----####----####
	player removeAction s_player_getTargetUID;
	s_player_getTargetUID = -1;
	player removeAction s_player_giveBaseOwnerAccess;
	s_player_giveBaseOwnerAccess = -1;
	player removeAction s_player_gateActions;
	s_player_gateActions = -1;
	player removeAction s_player_roofToggle;
	s_player_roofToggle = -1;
	player removeAction s_player_addGateAuthorization;
	s_player_addGateAuthorization = -1;
	player removeAction s_player_removeGateAuthorization;
	s_player_removeGateAuthorization = -1;
	player removeAction s_player_disarmBomb;
	s_player_disarmBomb = -1;
	player removeAction s_player_bbZombieShield_on;
	s_player_bbZombieShield_on = -1;
	player removeAction s_player_bbZombieShield_off;
	s_player_bbZombieShield_off = -1;
	player removeAction s_player_inflameBarrels;
	s_player_inflameBarrels = -1;
	player removeAction s_player_deflameBarrels;
	s_player_deflameBarrels = -1;
	player removeAction s_player_towerLightsOn;
	s_player_towerLightsOn = -1;
	player removeAction s_player_towerLightsOff;
	s_player_towerLightsOff = -1;
	player removeAction s_player_bbLightMenu;
	s_player_bbLightMenu = -1;
//####----####----####---- Base Building 1.3 End ----####----####----####
	
	player removeAction s_player_bury_human;
    s_player_bury_human = -1;

	//Others
	player removeAction s_player_forceSave;
	s_player_forceSave = -1;
	player removeAction s_player_flipveh;
	s_player_flipveh = -1;
	player removeAction s_player_sleep;
	s_player_sleep = -1;
	player removeAction s_player_deleteBuild;
	s_player_deleteBuild = -1;
	player removeAction s_player_butcher;
	s_player_butcher = -1;
	player removeAction s_player_cook;
	s_player_cook = -1;
	player removeAction s_player_boil;
	s_player_boil = -1;
	player removeAction s_player_fireout;
	s_player_fireout = -1;
	player removeAction s_player_packtent;
	s_player_packtent = -1;
	player removeAction s_player_fillfuel;
	s_player_fillfuel = -1;
	player removeAction s_player_studybody;
	s_player_studybody = -1;
	player removeAction s_clothes;
    s_clothes = -1;
	//Dog
	player removeAction s_player_tamedog;
	s_player_tamedog = -1;
	player removeAction s_player_feeddog;
	s_player_feeddog = -1;
	player removeAction s_player_waterdog;
	s_player_waterdog = -1;
	player removeAction s_player_staydog;
	s_player_staydog = -1;
	player removeAction s_player_trackdog;
	s_player_trackdog = -1;
	player removeAction s_player_barkdog;
	s_player_barkdog = -1;
	player removeAction s_player_warndog;
	s_player_warndog = -1;
	player removeAction s_player_followdog;
	s_player_followdog = -1;
    
    // vault
	player removeAction s_player_unlockvault;
	s_player_unlockvault = -1;
	player removeAction s_player_packvault;
	s_player_packvault = -1;
	player removeAction s_player_lockvault;
	s_player_lockvault = -1;

	player removeAction s_player_information;
	s_player_information = -1;
	player removeAction s_player_fillgen;
	s_player_fillgen = -1;
	player removeAction s_player_upgrade_build;
	s_player_upgrade_build = -1;
	player removeAction s_player_maint_build;
	s_player_maint_build = -1;
	player removeAction s_player_downgrade_build;
	s_player_downgrade_build = -1;
	player removeAction s_player_towing;
	s_player_towing = -1;
	player removeAction s_player_fuelauto;
	s_player_fuelauto = -1;
	player removeAction s_player_fuelauto2;
	s_player_fuelauto2 = -1;
};



//Dog actions on player self
_dogHandle = player getVariable ["dogID", 0];
if (_dogHandle > 0) then {
	_dog = _dogHandle getFSMVariable "_dog";
	_ownerID = "0";
	if (!isNull cursorTarget) then { _ownerID = cursorTarget getVariable ["CharacterID","0"]; };
	if (_canDo and !_inVehicle and alive _dog and _ownerID != dayz_characterID) then {
		if (s_player_movedog < 0) then {
			s_player_movedog = player addAction [localize "str_actions_movedog", "\z\addons\dayz_code\actions\dog\move.sqf", player getVariable ["dogID", 0], 1, false, true, "", ""];
		};
		if (s_player_speeddog < 0) then {
			_text = (localize "str_epoch_player_249");
			_speed = 0;
			if (_dog getVariable ["currentSpeed",1] == 0) then { _speed = 1; _text = (localize "str_epoch_player_250"); };
			s_player_speeddog = player addAction [format[localize "str_actions_speeddog", _text], "\z\addons\dayz_code\actions\dog\speed.sqf",[player getVariable ["dogID", 0],_speed], 0, false, true, "", ""];
		};
		if (s_player_calldog < 0) then {
			s_player_calldog = player addAction [localize "str_actions_calldog", "\z\addons\dayz_code\actions\dog\follow.sqf", [player getVariable ["dogID", 0], true], 2, false, true, "", ""];
		};
	};
} else {
	player removeAction s_player_movedog;		
	s_player_movedog =		-1;
	player removeAction s_player_speeddog;
	s_player_speeddog =		-1;
	player removeAction s_player_calldog;
	s_player_calldog = 		-1;
};
// ----------------------------- / Drink water \ ----------------------
private["_playerPos","_canDrink","_isPond","_isWell","_pondPos","_objectsWell","_objectsPond","_display"];
 
_playerPos = getPosATL player;
_canDrink = count nearestObjects [_playerPos, ["Land_pumpa","Land_water_tank"], 4] > 0;
_isPond = false;
_isWell = false;
_pondPos = [];
_objectsWell = [];
 
if (!_canDrink) then {
    _objectsWell = nearestObjects [_playerPos, [], 4];
    {
        //Check for Well
        _isWell = ["_well",str(_x),false] call fnc_inString;
        if (_isWell) then {_canDrink = true};
    } forEach _objectsWell;
};
 
if (!_canDrink) then {
    _objectsPond = nearestObjects [_playerPos, [], 50];
    {
        //Check for pond
        _isPond = ["pond",str(_x),false] call fnc_inString;
        if (_isPond) then {
            _pondPos = (_x worldToModel _playerPos) select 2;
            if (_pondPos < 0) then {
                _canDrink = true;
            };
        };
    } forEach _objectsPond;
};
 
if (_canDrink) then {
        if (s_player_drinkWater < 0) then {
            s_player_drinkWater = player addaction[("<t color=""#0000c7"">" + (localize "STR_action_drink") +"</t>"),"scripts\drink_water.sqf"];
        };
    } else {
        player removeAction s_player_drinkWater;
        s_player_drinkWater = -1;
    };
// ----------------------------- \ Drink water / ----------------------
//SUICIDESTART
private ["_handGun"];
_handGun = currentWeapon player;
if ((_handGun in ["revolver_gold_EP1","glock17_EP1","M9","M9SD","Makarov","MakarovSD","revolver_EP1","UZI_EP1","Sa61_EP1","Colt1911"]) && (player ammo _handGun > 0)) then {
    hasSecondary = true;
} else {
    hasSecondary = false;
};
if (player ammo _handGun == 1) then {
    lastRound = true;
} else {
    lastRound = false;
};
if((speed player <= 1) && hasSecondary && lastRound && _canDo) then {
    if (s_player_suicide < 0) then {
		s_player_suicide = player addaction[("<t color=""#ff0000"">" + ("Commit Suicide") +"</t>"),"scripts\suicide_init.sqf",_handGun,0,false,true,"",""];
    };
} else {
    player removeAction s_player_suicide;
    s_player_suicide = -1;
};
//SUICIDEEND
// ZOMBIE SHIELD START
if (("TrashTinCan" in magazines player) && ("TrashJackDaniels" in magazines player) && ("PartEngine" in magazines player) && ("ItemJerrycan" in magazines player) && ("ItemToolbox" in items player)) then {
    hasShield = true;
} else {
    hasShield = false;
};
if (hasShield) then {
    if (zombieShield < 0) then {
    zombieShield = player addAction [("<t color=""#00c362"">" + ("Anti-Zombie Emitter") +"</t>"),"scripts\zombieshield.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction zombieShield;
    zombieShield = -1;
};
// ZOMBIE SHIELD END
// Zombie Bait
if (("ItemBloodbag" in magazines player) && ("FoodbeefRaw" in magazines player)) then {
    hasBait = true;
} else {
    hasBait = false;
};
if (hasBait) then {
    if (zombieBait < 0) then {
zombieBait = player addAction [("<t color=""#c30000"">" + ("Place Zombie Bait") +"</t>"),"scripts\zombiebait.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction zombieBait;
    zombieBait = -1;
};
// Exploding Zombie Bait
if ((hasBait) && ("HandGrenade_West" in magazines player)) then {
if (zombieBomb < 0) then {
zombieBomb = player addAction [("<t color=""#c30000"">" + ("Place Exploding Bait") +"</t>"),"scripts\zombiebomb.sqf","",5,false,true,"",""];
};
} else {
player removeAction zombieBomb;
zombieBomb = -1;
};