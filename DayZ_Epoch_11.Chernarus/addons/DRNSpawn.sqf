private ["_isIsland","_pos","_findSpot","_mkr","_position","_isNear","_isZero","_counter","_DRNLocs","_DRNloc"];
_DRNLocs = [
	//Chernogorsk
	[[6686.8,2290.11,0.001], [7235.6,2233.5,0.001], [6288.59,2574.14,0.001], [6827.66,3168.46,0.001], [6960.53,2550.45,0.001]],
	//Electro
	[[10845.3,2701.37,0.009], [9479.41,1960.8,0.001], [10497.3,2016.5,0.001], [10214.1,2411.58,0.001], [10432.7,2047.76,0.002]],
	//Kamenka
	[[1244.61,2614.59,0.001], [1047.04,2268.01,0.001], [1787.07,2441.89,0.002], [2030.73,2235.37,0.001], [1166.07,2299.62,0.001]],
	//Baltoa
	[[4388.23,2263.44,0.001], [5683.43,3004.63,0.001], [4517.41,2420.66,0.001], [5171.99,2070.86,0.001], [4253.29,2533.43,0.001]],
	//Kamyshovo
	[[12070.5,3591.06,0.001], [11972.7,3831.11,0.001], [11962.1,3567.45,0.001], [12245.1,3529.93,0.001], [11929.7,3472.91,0.001]],
	//Berinzo
	[[11936.1,8870.28,0.001], [12287.3,8471.17,0.002], [12263.7,9160.7,0.001], [11702.7,9172.23,0.001], [12618.5,9560.67,0.001]],
	//Solinchiny
	[[13387.5,6617.4,0.001], [13285,6115.62,0.002], [13310.1,6331.05,0.002], [13401.9,5995.73,0.001], [13513.4,6326.69,0.002]],
	//Krasnotav
	[[11052.5,12361.2,0.002], [11764.1,12147.6,0.002], [12086,11991,0.001], [10804.7,12483.5,0.001], [11073.3,12468.8,0.001]],
	//Gorka
	[[9711.25,8962.2,0.001], [9756.47,8715.15,0.002], [9401.49,8953.64,0.001], [9240.9,8802.83,0.002], [9867.63,8751.83,0.002]],
	//Grishhino
	[[5939.45,10195.3,0.001], [6194.16,10372.5,0.001], [6089.6,10558,0.002], [5865.1,10132,0.002], [5296.89,10556,0.002]],
	//Vybor
	[[3625.72,8976.06,0.001], [3685.59,8564.4,0.001], [4197.1,8917.17,0.001], [3870.38,8997.64,0.001], [3729.86,8869.19,0.001]],
	//Pusta
	[[9153.26,3900.56,0.001], [9128.73,4106.21,0.001], [9200.91,3983.34,0.002], [9147.2,3741.96,0.001], [9391.94,4077.68,0.001]],
	//Kabino
	[[5300.83,8547.84,0.002], [5216.97,8646.67,0.002], [5294.96,8437.37,0.001], [5194.68,8584.59,0.002], [5794.95,8698.89,0.002]]
	];
drnspawn = -1;
cutText ["","BLACK OUT"];
_ok = createDialog "DRN_DIALOG";
waitUntil { drnspawn != -1};
if (drnspawn == 13) then {drnspawn = floor (random 12)};
_DRNloc = _DRNLocs select drnspawn;
	//Spawn modify via mission init.sqf
	if(isnil "spawnArea") then {
		spawnArea = 1500;
	};
	if(isnil "spawnShoremode") then {
		spawnShoremode = 1;
	};
	//spawn into random
	_findSpot = true;
	_mkr = "";
	while {_findSpot} do {
		_counter = 0;
		while {_counter < 20 and _findSpot} do {
			// switched to floor
			_mkr = _DRNLoc select(floor(random (count _DRNLoc)));
			_position = ([(_mkr),0,spawnArea,10,0,2000,spawnShoremode] call BIS_fnc_findSafePos);
			_isNear = count (_position nearEntities ["Man",100]) == 0;
			_isZero = ((_position select 0) == 0) and ((_position select 1) == 0);
			//Island Check
			_pos 		= _position;
			_isIsland	= false;		//Can be set to true during the Check
			for [{_w=0},{_w<=150},{_w=_w+2}] do {
				_pos = [(_pos select 0),((_pos select 1) + _w),(_pos select 2)];
				if(surfaceisWater _pos) exitWith {
					_isIsland = true;
				};
			};
			
			if ((_isNear and !_isZero) || _isIsland) then {_findSpot = false};
			_counter = _counter + 1;
		};
	};
	_isZero = ((_position select 0) == 0) and ((_position select 1) == 0);
	_position = [_position select 0,_position select 1,0];
	diag_log("DEBUG: spawning new player at" + str(_position));
	if (!_isZero) then {
		player setPosATL _position;
	};
cutText ["","BLACK IN"];
