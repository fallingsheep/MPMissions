/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
//

startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500

MaxVehicleLimit = 100; // Default = 50
MaxDynamicDebris = 50; // Default = 100
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 40; // Default = 30 

dayz_paraSpawn = false;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 8; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 5; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = true; // Default: False
DZE_StaticConstructionCount = 1;
//custom loot tables
DZE_MissionLootTable = true;
//disable plot pole
DZE_requireplot = 1;
//Admin teleport Fix
DZE_teleport = [14000,14000,14000,14000,14000];
//Heli lift
DZE_HeliLift = True;

//TEST HELI CRASH MARKES 60 crashes per hour dont use live!!!
EpochEvents = [["any","any","any","any",0,"crash_spawner"],["any","any","any","any",1,"crash_spawner"],["any","any","any","any",2,"crash_spawner"],["any","any","any","any",3,"crash_spawner"],["any","any","any","any",4,"crash_spawner"],["any","any","any","any",5,"crash_spawner"],["any","any","any","any",6,"crash_spawner"],["any","any","any","any",7,"crash_spawner"],["any","any","any","any",8,"crash_spawner"],["any","any","any","any",9,"crash_spawner"],["any","any","any","any",10,"crash_spawner"],["any","any","any","any",11,"crash_spawner"],["any","any","any","any",12,"crash_spawner"],["any","any","any","any",13,"crash_spawner"],["any","any","any","any",14,"crash_spawner"],["any","any","any","any",15,"crash_spawner"],["any","any","any","any",16,"crash_spawner"],["any","any","any","any",17,"crash_spawner"],["any","any","any","any",18,"crash_spawner"],["any","any","any","any",19,"crash_spawner"],["any","any","any","any",20,"crash_spawner"],["any","any","any","any",21,"crash_spawner"],["any","any","any","any",22,"crash_spawner"],["any","any","any","any",23,"crash_spawner"],["any","any","any","any",24,"crash_spawner"],["any","any","any","any",25,"crash_spawner"],["any","any","any","any",26,"crash_spawner"],["any","any","any","any",27,"crash_spawner"],["any","any","any","any",28,"crash_spawner"],["any","any","any","any",29,"crash_spawner"],["any","any","any","any",30,"crash_spawner"],["any","any","any","any",31,"crash_spawner"],["any","any","any","any",32,"crash_spawner"],["any","any","any","any",33,"crash_spawner"],["any","any","any","any",34,"crash_spawner"],["any","any","any","any",35,"crash_spawner"],["any","any","any","any",36,"crash_spawner"],["any","any","any","any",37,"crash_spawner"],["any","any","any","any",38,"crash_spawner"],["any","any","any","any",39,"crash_spawner"],["any","any","any","any",40,"crash_spawner"],["any","any","any","any",41,"crash_spawner"],["any","any","any","any",42,"crash_spawner"],["any","any","any","any",43,"crash_spawner"],["any","any","any","any",44,"crash_spawner"],["any","any","any","any",45,"crash_spawner"],["any","any","any","any",46,"crash_spawner"],["any","any","any","any",47,"crash_spawner"],["any","any","any","any",48,"crash_spawner"],["any","any","any","any",49,"crash_spawner"],["any","any","any","any",50,"crash_spawner"],["any","any","any","any",51,"crash_spawner"],["any","any","any","any",52,"crash_spawner"],["any","any","any","any",53,"crash_spawner"],["any","any","any","any",54,"crash_spawner"],["any","any","any","any",55,"crash_spawner"],["any","any","any","any",56,"crash_spawner"],["any","any","any","any",57,"crash_spawner"],["any","any","any","any",58,"crash_spawner"],["any","any","any","any",59,"crash_spawner"],["any","any","any","any",0,"crash_spawner"]];
//EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];


dayz_fullMoonNights = true;

//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
//////////////////////////////////BASE BUILD//////////////////////////////////
call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf";							//Initializes custom variables
//////////////////////////////////BASE BUILD//////////////////////////////////
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "custom\publicEH.sqf";
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
//////////////////////////////////BASE BUILD//////////////////////////////////
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";							//Compile custom compiles
call compile preprocessFileLineNumbers "dayz_code\init\settings.sqf";							//Initialize custom clientside settings
//////////////////////////////////BASE BUILD//////////////////////////////////
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

//Debug Toggle
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
	
	
	//Debug Monitor
	[] execVM "scripts\debug_monitor.sqf";
	
	//Safe Zones
	[] execVM 'scripts\agn_SafeZoneCommander.sqf';
	
	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	
};
if (isServer) then {
	//Bus Route
	[true] execVM "busroute\init_bus.sqf";
};

if (!isDedicated) then {
	//Bus Route
	[] execVM "busroute\player_axeBus.sqf";
};
//LIGHTS
if (isServer) then {
axe_server_lampObjs =    compile preprocessFileLineNumbers "scripts\fnc_returnLampWS.sqf";
    "axeLampObjects" addPublicVariableEventHandler {_id = (_this select 1) spawn axe_server_lampObjs};
};

if (!isDedicated) then {
	[] execVM "scripts\house_lights.sqf";
	[] execVM "scripts\tower_lights.sqf";
	[] execVM "scripts\street_lights.sqf";
};
//Auto Refuel
[] execVM 'scripts\kh_actions.sqf'; 

snowchance = 5; //5% chance to snow on server start/restart
	if (isServer) then {
		if((random 100) < snowchance)then{
			[] execVM "scripts\effects.sqf";
		};
	};

//////////////////////////////////BASE BUILD//////////////////////////////////
#include "REsec\REsec.sqf";
//#include "\z\addons\dayz_code\system\REsec.sqf"
//////////////////////////////////BASE BUILD//////////////////////////////////

//Start Dynamic Weather
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf";
//Fast Roping
sleep 1; 
_fast_rope = [] execVM "addons\BTC_fast_roping_init.sqf";

//SPAWN SELECT
waitUntil {!isNil ("PVDZE_plr_LoginRecord")}; 
if (dayzPlayerLogin2 select 2) then { 
	[] execVM "addons\DRNSpawn.sqf";
};

//Welcome Credits
[] execVM "scripts\welcomecredits.sqf";
	
//custom weather
[] execVM "custom\EFFECTS\DynamicWeatherEffects.sqf";
[] execVM "custom\EFFECTS\ground_fog.sqf";
[] execVM "custom\EFFECTS\WindDust.sqf";
[] execVM "custom\EFFECTS\earthquake.sqf";

//Regen Blood
[] execVM "scripts\regenblood.sqf";

//Epoch admin tools
if (!isDedicated) then {
		// Epoch Admin Tools
	[] execVM "admintools\AdminList.sqf";
	if ( !((getPlayerUID player) in AdminList) && !((getPlayerUID player) in ModList) && !((getPlayerUID player) in tempList)) then 
	{
		[] execVM "\z\addons\dayz_code\system\antihack.sqf";
	};
};
sleep 0.1;
[] execVM "admintools\Activate.sqf";

nul=[] execVM "KRON_Strings.sqf";