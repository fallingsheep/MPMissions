/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/



/////////////////// disable plot pole ///////////////////

DZE_requireplot = 0;




/////////////////// Admin teleport Fix ///////////////////

DZE_teleport = [14000,14000,14000,14000,14000];




startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];




/////////////////// REALLY IMPORTANT VALUES ///////////////////

dayZ_serverName = "DayZ Epoch";			// server name (country code + server number)
dayZ_instance =	11;							//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;




/////////////////// disable greeting menu /////////////////// 

player setVariable ["BIS_noCoreConversations", true];




/////////////////// disable radio messages to be heard and shown in the left lower corner of the screen ///////////////////

enableRadio false;




/////////////////// May prevent "how are you civilian?" messages from NPC ///////////////////

enableSentences false;




/////////////////// DayZ Epoch config ///////////////////

spawnShoremode = 1; 						// Default = 1 (on shore)
spawnArea= 1500; 							// Default = 1500
MaxVehicleLimit = 300; 						// Default = 50
MaxDynamicDebris = 0; 						// Default = 100
dayz_MapArea = 14000; 						// Default = 10000
DynamicVehicleFuelLow = 0; 					// Default: 0
DynamicVehicleFuelHigh = 100; 				// Default: 100
dayz_maxLocalZombies = 40; 					// Default: 40
dayz_maxGlobalZombiesInit = 40; 			// Default: 40
dayz_maxGlobalZombiesIncrease = 10; 		// Default: 10
dayz_maxZeds = 500; 						// Default: 500
dayz_zedsAttackVehicles = false;
DZE_BuildOnRoads = true; 					// Default: False
dayz_paraSpawn = true;
dayz_minpos = -1; 
dayz_maxpos = 16000;
dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;
dayz_maxAnimals = 8; 						// Default: 8
dayz_tameDogs = false;
DynamicVehicleDamageLow = 0; 				// Default: 0
DynamicVehicleDamageHigh = 100; 			// Default: 100




EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;




/////////////////// Starting Loadout ///////////////////

DefaultMagazines = ["FoodCanBakedBeans","ItemBandage","ItemPainkiller","HandRoadFlare","ItemSodaCoke"]; 
DefaultWeapons = ["ItemFlashlight"]; 
DefaultBackpack = ""; 
DefaultBackpackWeapon = "";



/////////////////// Load in compiled functions ///////////////////

call compile preprocessFileLineNumbers "fixes\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf";							//Initializes custom variables
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";					//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "dayz_code\compiles.sqf";								//Compile regular functions
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";									//Compile trader configs
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";							//Compile custom compiles
call compile preprocessFileLineNumbers "dayz_code\init\settings.sqf";							//Initialize custom clientside settings
progressLoadingScreen 1.0;
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";




[] spawn {
	while {true} do {
		waitUntil {((isNil "BIS_Effects_Rifle") OR {(count(toArray(str(BIS_Effects_Rifle)))!=7)})};
		diag_log "Res3tting B!S effects...";
		/* BIS_Effects_* fixes from Dwarden */
		BIS_Effects_EH_Killed = compile preprocessFileLineNumbers "dayz_code\BIS_Effects\killed.sqf";
		BIS_Effects_AirDestruction = compile preprocessFileLineNumbers "dayz_code\BIS_Effects\AirDestruction.sqf";
		BIS_Effects_AirDestructionStage2 = compile preprocessFileLineNumbers "dayz_code\BIS_Effects\AirDestructionStage2.sqf";

		BIS_Effects_globalEvent = {
			BIS_effects_gepv = _this;
			publicVariable "BIS_effects_gepv";
			_this call BIS_Effects_startEvent;
		};

		BIS_Effects_startEvent = {
			switch (_this select 0) do {
				case "AirDestruction": {
						[_this select 1] spawn BIS_Effects_AirDestruction;
				};
				case "AirDestructionStage2": {
						[_this select 1, _this select 2, _this select 3] spawn BIS_Effects_AirDestructionStage2;
				};
				case "Burn": {
						[_this select 1, _this select 2, _this select 3, false, true] spawn BIS_Effects_Burn;
				};
			};
		};

		"BIS_effects_gepv" addPublicVariableEventHandler {
			(_this select 1) call BIS_Effects_startEvent;
		};

		BIS_Effects_EH_Fired = {false};
		BIS_Effects_Rifle = {false};
		sleep 1;
	};
};




if (!isNil "dayZ_serverName") then {
	[] spawn {
		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		waituntil {!(isNull (findDisplay 46))};
		5 cutRsc ["wm_disp","PLAIN"];
		((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText dayZ_serverName;
	};
};




/////////////////// Debug Toggle ///////////////////

dayz_spaceInterrupt = compile preprocessFileLineNumbers "scripts\dayz_spaceInterrupt.sqf";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Compile vehicle configs
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	[] execVM "scripts\antihack.sqf";
	[] execVM "custom\Stats\debug_monitor.sqf";
	
	
};
if (isServer) then {
	[true] execVM "busroute\init_bus.sqf";
};

if (!isDedicated) then {
	[] execVM "busroute\player_axeBus.sqf";
	[] execVM "scripts\Server_WelcomeCredits.sqf";
};

if (isServer) then {
axe_server_lampObjs =    compile preprocessFileLineNumbers "scripts\fnc_returnLampWS.sqf";
    "axeLampObjects" addPublicVariableEventHandler {_id = (_this select 1) spawn axe_server_lampObjs};
};

if (!isDedicated) then {
	[] execVM "scripts\house_lights.sqf";
	[] execVM "scripts\tower_lights.sqf";
	[] execVM "scripts\street_lights.sqf";
};

 



	
	
	

	
	
	
	
/////////////////// Custom Scripts ///////////////////

#include "REsec\REsec.sqf";
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf";
sleep 1; 
_fast_rope = [] execVM "addons\BTC_fast_roping_init.sqf";

[] execVM "scripts\kh_actions.sqf";
[] execVM "scripts\agn_SafeZoneCommander.sqf"; 
[] execVM "scripts\regenblood.sqf";
[] execVM "admintools\Activate.sqf";
[] execVM "custom\EFFECTS\DynamicWeatherEffects.sqf";
[] execVM "custom\EFFECTS\ground_fog.sqf";
[] execVM "custom\EFFECTS\WindDust.sqf";
[] execVM "custom\EFFECTS\earthquake.sqf";












