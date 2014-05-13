_pathtotools = "admintools\tools\";
_pathtoskins = "admintools\skins\";
_pathtoweapon = "admintools\weaponkits\";
_pathtoshields = "admintools\shields\";
_pathtovehicles = "admintools\vehicles\";
//building materials menu
_pathtorepack = "admintools\materials\";
_pathtorepack2 = "admintools\buildingkits\";

_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';
_EXECscript2 = 'player execVM "'+_pathtoskins+'%1"';
_EXECscript3 = 'player execVM "'+_pathtoweapon+'%1"';
_EXECscript4 = 'player execVM "'+_pathtoshields+'%1"';
_EXECscript5 = 'player execVM "'+_pathtovehicles+'%1"';

//building materials menu
_EXECscript6 = 'player execVM "'+_pathtorepack+'%1"';
_EXECscript7 = 'player execVM "'+_pathtorepack2+'%1"';

if ((getPlayerUID player) in ["120958982",""]) then {
	if ((getPlayerUID player) in ["#####","#######"]) then { 
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:ModToolsMenu", -5, [["expression", ""]], "1", "1"],
				["Skins Menu", [3], "#USER:SkinsMenu", -5, [["expression", ""]], "1", "1"],
				["Weapon Kits", [4], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
	if ((getPlayerUID player) in ["######","#######"]) then { 
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:AdminToolsMenu", -5, [["expression", ""]], "1", "1"],
				["Skins Menu", [3], "#USER:SkinsMenu", -5, [["expression", ""]], "1", "1"],
				["Weapon Kits", [4], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
	if ((getPlayerUID player) in ["120958982",""]) then { 
		adminmenu =
		[
			["",true],
				["Tools Menu", [2], "#USER:ToolsMenu", -5, [["expression", ""]], "1", "1"],
				["Skins Menu", [3], "#USER:SkinsMenu", -5, [["expression", ""]], "1", "1"],
				["Weapon Kits", [4], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
				["Shields Menu", [5], "#USER:ShieldMenu", -5, [["expression", ""]], "1", "1"],
				["Vehicle Menu", [6], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
				["Materials Menu", [7], "#USER:MaterialsMenu", -5, [["expression", ""]], "1", "1"],
				["Building Kits Menu", [8], "#USER:BuildingKitsMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];};
};

ModToolsMenu =
[
	["",true],
		["ESP / Tele", [2],  "", -5, [["expression", format[_EXECscript1,"dayzesp.sqf"]]], "1", "1"],
		["God Mode", [3],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		["Car God", [4],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Heal Player(s)", [5],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
		["Look-N-Repair", [6],  "", -5, [["expression", format[_EXECscript1,"looknrepair.sqf"]]], "1", "1"],
		["Repair Buildings", [7],  "", -5, [["expression", format[_EXECscript1,"fixbuildings.sqf"]]], "1", "1"],
		["Spectate Player", [8],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["Teleport To Me", [9], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ToolsMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

AdminToolsMenu =
[
	["",true],
		["ESP / Tele", [2],  "", -5, [["expression", format[_EXECscript1,"dayzesp.sqf"]]], "1", "1"],
		["God Mode", [3],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		["Car God", [4],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Heal Player(s)", [5],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
		["Look-N-Repair", [6],  "", -5, [["expression", format[_EXECscript1,"looknrepair.sqf"]]], "1", "1"],
		["Repair Buildings", [7],  "", -5, [["expression", format[_EXECscript1,"fixbuildings.sqf"]]], "1", "1"],
		["Spectate Player", [8],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["Teleport To Me", [9], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ToolsMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
ToolsMenu =
[
	["",true],
		["ESP / Tele", [2],  "", -5, [["expression", format[_EXECscript1,"dayzesp.sqf"]]], "1", "1"],
		["God Mode", [3],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		["Car God", [4],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Heal Player(s)", [5],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
		["Look-N-Repair", [6],  "", -5, [["expression", format[_EXECscript1,"looknrepair.sqf"]]], "1", "1"],
		["Repair Buildings", [7],  "", -5, [["expression", format[_EXECscript1,"fixbuildings.sqf"]]], "1", "1"],
		["Spectate Player", [8],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["Teleport To Me", [9], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],
		["Enhanced ESP", [9], "", -5, [["expression", format[_EXECscript1, "EnhancedESP.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ToolsMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
ToolsMenu2 = 
[
["",true],
		["Flip Vehicle", [2],  "", -5, [["expression", format[_EXECscript1,"flipvehicle.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
//Materialsmenu
MaterialsMenu =
[
	["",true],	
		["10 x Burlap", [2],  "", -5, [["expression", format[_EXECscript6,"10 x Burlap.sqf"]]], "1", "1"],
		["10 x Canvas", [3],  "", -5, [["expression", format[_EXECscript6,"10 x Canvas.sqf"]]], "1", "1"],
		["10 x CinderBlocks", [4],  "", -5, [["expression", format[_EXECscript6,"10 x CinderBlocks.sqf"]]], "1", "1"],
		["10 x Corrugated", [5],  "", -5, [["expression", format[_EXECscript6,"10 x Corrugated.sqf"]]], "1", "1"],
		["10 x Empty Supply Crate", [6],  "", -5, [["expression", format[_EXECscript6,"10 x Empty Supply Crate.sqf"]]], "1", "1"],
		["10 x Wood Pile", [7],  "", -5, [["expression", format[_EXECscript6,"10 x Wood Pile.sqf"]]], "1", "1"],
		["10 x Light Bulb", [8],  "", -5, [["expression", format[_EXECscript6,"10 x Light Bulb.sqf"]]], "1", "1"],
		["10 x Lumber", [9],  "", -5, [["expression", format[_EXECscript6,"10 x Lumber.sqf"]]], "1", "1"],
		["10 x Combo Lock", [10],  "", -5, [["expression", format[_EXECscript6,"10 x Combo Lock.sqf"]]], "1", "1"],
		["10 x Mortar Bucket", [11],  "", -5, [["expression", format[_EXECscript6,"10 x Mortar Bucket.sqf"]]], "1", "1"],
		["10 x Plywood", [12],  "", -5, [["expression", format[_EXECscript6,"10 x Plywood.sqf"]]], "1", "1"],
		["10 x Poles", [13],  "", -5, [["expression", format[_EXECscript6,"10 x Poles.sqf"]]], "1", "1"],
		["10 x Sandbag Large", [14],  "", -5, [["expression", format[_EXECscript6,"10 x Sandbag Large.sqf"]]], "1", "1"],
		["10 x Sandbag", [15],  "", -5, [["expression", format[_EXECscript6,"10 x Sandbag.sqf"]]], "1", "1"],
		["10 x Scrap Metal", [16],  "", -5, [["expression", format[_EXECscript6,"10 x Scrap Metal.sqf"]]], "1", "1"],
		["10 x Tank Trap", [17],  "", -5, [["expression", format[_EXECscript6,"10 x Tank Trap.sqf"]]], "1", "1"],
		["10 x Wire", [18],  "", -5, [["expression", format[_EXECscript6,"10 x Wire.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Next page", [19], "#USER:MaterialsMenu2", -5, [["expression", ""]], "1", "1"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
MaterialsMenu2 =
[
	["",true],	

		["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
//BuildingKitsMenu
BuildingKitsMenu =
[
	["",true],	
		["wooden_shed_kit", [2],  "", -5, [["expression", format[_EXECscript7,"wooden_shed_kit.sqf"]]], "1", "1"],
		["outhouse_kit", [3],  "", -5, [["expression", format[_EXECscript7,"outhouse_kit.sqf"]]], "1", "1"],
		["storage_shed_kit", [4],  "", -5, [["expression", format[_EXECscript7,"storage_shed_kit.sqf"]]], "1", "1"],
		["rusty_gate_kit", [5],  "", -5, [["expression", format[_EXECscript6,"rusty_gate_kit.sqf"]]], "1", "1"],
		["metal_panel_kit", [6],  "", -5, [["expression", format[_EXECscript7,"metal_panel_kit.sqf"]]], "1", "1"],
		["GunRackKit", [7],  "", -5, [["expression", format[_EXECscript7,"ItemGunRackKit.sqf"]]], "1", "1"],
		["OilBarrel", [8],  "", -5, [["expression", format[_EXECscript7,"ItemOilBarrel.sqf"]]], "1", "1"],
		["FuelBarrel", [9],  "", -5, [["expression", format[_EXECscript7,"ItemFuelBarrel.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Next page", [12], "#USER:BuildingKitsMenu2", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
BuildingKitsMenu2 =
[
	["",true],	
		["cinder_wall_kit", [2],  "", -5, [["expression", format[_EXECscript7,"cinder_wall_kit.sqf"]]], "1", "1"],
		["cinder_garage_kit", [3],  "", -5, [["expression", format[_EXECscript7,"cinder_garage_kit.sqf"]]], "1", "1"],
		["cinder_door_kit", [4],  "", -5, [["expression", format[_EXECscript7,"cinder_door_kit.sqf"]]], "1", "1"],
		["deer_stand_kit", [5],  "", -5, [["expression", format[_EXECscript6,"deer_stand_kit.sqf"]]], "1", "1"],
		["light_pole_kit", [6],  "", -5, [["expression", format[_EXECscript7,"light_pole_kit.sqf"]]], "1", "1"],
		["fuel_pump_kit", [7],  "", -5, [["expression", format[_EXECscript7,"fuel_pump_kit.sqf"]]], "1", "1"],
		["m240_nest_kit", [8],  "", -5, [["expression", format[_EXECscript7,"m240_nest_kit.sqf"]]], "1", "1"],
		["stick_fence_kit", [9],  "", -5, [["expression", format[_EXECscript7,"stick_fence_kit.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Next page", [12], "#USER:BuildingKitsMenu3", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
SkinsMenu =
[
	["",true],
		["Hero", [2],  "", -5, [["expression", format[_EXECscript2,"Hero.sqf"]]], "1", "1"],
		["Camo", [3],  "", -5, [["expression", format[_EXECscript2,"Camo.sqf"]]], "1", "1"],
		["Ghillie", [4],  "", -5, [["expression", format[_EXECscript2,"Ghille.sqf"]]], "1", "1"],
		["Suvivor", [5],  "", -5, [["expression", format[_EXECscript2,"Male.sqf"]]], "1", "1"],
		["Soldier", [6],  "", -5, [["expression", format[_EXECscript2,"Soldier.sqf"]]], "1", "1"],
		["invisible", [7],  "", -5, [["expression", format[_EXECscript2,"invisible.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

WeaponMenu =
[
	["",true],
		["No Weapons", [2],  "", -5, [["expression", format[_EXECscript3,"items.sqf"]]], "1", "1"],
		["M4 Holo", [3],  "", -5, [["expression", format[_EXECscript3,"itemz.sqf"]]], "1", "1"],
		["M4 CCO SD", [4],  "", -5, [["expression", format[_EXECscript3,"itemz2.sqf"]]], "1", "1"],
		["AS50", [5],  "", -5, [["expression", format[_EXECscript3,"itemz3.sqf"]]], "1", "1"],
		["FN FAL", [6],  "", -5, [["expression", format[_EXECscript3,"itemz4.sqf"]]], "1", "1"],
		["M16 ACOG", [7],  "", -5, [["expression", format[_EXECscript3,"itemz5.sqf"]]], "1", "1"],
		["Pecheneg 50 cal", [8],  "", -5, [["expression", format[_EXECscript3,"itemz6.sqf"]]], "1", "1"],
		["Mk 48", [9],  "", -5, [["expression", format[_EXECscript3,"item7.sqf"]]], "1", "1"],
		["Gold AK", [10],  "", -5, [["expression", format[_EXECscript3,"item8.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:WeaponMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
WeaponMenu2 =
[
	["",true],
		["Aks Kobra", [2],  "", -5, [["expression", format[_EXECscript3,"item9.sqf"]]], "1", "1"],
		[".338 LAPUA", [3],  "", -5, [["expression", format[_EXECscript3,"item10.sqf"]]], "1", "1"],
		["DMR", [4],  "", -5, [["expression", format[_EXECscript3,"item11.sqf"]]], "1", "1"],
		["M4A1 HWS GL SD Camo", [5],  "", -5, [["expression", format[_EXECscript3,"item12.sqf"]]], "1", "1"],
		["M14 Aim", [6],  "", -5, [["expression", format[_EXECscript3,"item13.sqf"]]], "1", "1"],
		["Alice", [7],  "", -5, [["expression", format[_EXECscript3,"bp2.sqf"]]], "1", "1"],
		["Coyote", [8],  "", -5, [["expression", format[_EXECscript3,"bp1.sqf"]]], "1", "1"],
		["Delete gear", [9],  "", -5, [["expression", format[_EXECscript3,"cleanme.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:WeaponMenu3", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
//extra menu for custom kits remove "
WeaponMenu3 =
[
	["",true],
			
			
			
			
			
			
			
			
			
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ShieldMenu =
[
	["",true],
		["Zombie Shield", [2],  "", -5, [["expression", format[_EXECscript4,"zombieshield.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu = 
[
	["",true],
		["A10", [2],  "", -5, [["expression", format[_EXECscript5,"A10.sqf"]]], "1", "1"],
		["Little Bird", [3],  "", -5, [["expression", format[_EXECscript5,"AH64.sqf"]]], "1", "1"],
		["an2", [4],  "", -5, [["expression", format[_EXECscript5,"an2_prop.sqf"]]], "1", "1"],
		["Apache", [5],  "", -5, [["expression", format[_EXECscript5,"APACHE.sqf"]]], "1", "1"],
		["MTVR fors", [6],  "", -5, [["expression", format[_EXECscript5,"MTVRf.sqf"]]], "1", "1"],
		["MTVR des", [7],  "", -5, [["expression", format[_EXECscript5,"MTVR.sqf"]]], "1", "1"],
		["ATV", [8],  "", -5, [["expression", format[_EXECscript5,"ATV.sqf"]]], "1", "1"],
		["Bike", [9],  "", -5, [["expression", format[_EXECscript5,"Bike.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu2", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu2 =
[
["",true],
		["Bus", [2],  "", -5, [["expression", format[_EXECscript5,"bus.sqf"]]], "1", "1"],
		["C130", [3],  "", -5, [["expression", format[_EXECscript5,"C130.sqf"]]], "1", "1"],
		["Chinook", [4],  "", -5, [["expression", format[_EXECscript5,"chinook.sqf"]]], "1", "1"],
		["F35", [5],  "", -5, [["expression", format[_EXECscript5,"F35.sqf"]]], "1", "1"],
		["Boat 1", [6],  "", -5, [["expression", format[_EXECscript5,"FISH.sqf"]]], "1", "1"],
		["Boat 2", [7],  "", -5, [["expression", format[_EXECscript5,"FISH2.sqf"]]], "1", "1"],
		["Boat 3", [8],  "", -5, [["expression", format[_EXECscript5,"FISH3.sqf"]]], "1", "1"],
		["Gaz", [9],  "", -5, [["expression", format[_EXECscript5,"Gaz.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu3", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu3 =
[
["",true],
		["Hatchback", [2],  "", -5, [["expression", format[_EXECscript5,"Hatchback.sqf"]]], "1", "1"],
		["HMMV fors", [3],  "", -5, [["expression", format[_EXECscript5,"HMMV.sqf"]]], "1", "1"],
		["HMMV des", [4],  "", -5, [["expression", format[_EXECscript5,"HMMV_Fallu.sqf"]]], "1", "1"],
		["KA60 Namal", [5],  "", -5, [["expression", format[_EXECscript5,"KA60_namalsk.sqf"]]], "1", "1"],
		["Red Lada", [6],  "", -5, [["expression", format[_EXECscript5,"ladared.sqf"]]], "1", "1"],
		["White Lada", [7],  "", -5, [["expression", format[_EXECscript5,"Ladawhite.sqf"]]], "1", "1"],
		["Little Bird", [8],  "", -5, [["expression", format[_EXECscript5,"littleBird.sqf"]]], "1", "1"],
		["MI17", [9],  "", -5, [["expression", format[_EXECscript5,"MI17civ.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu4", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu4 =
[
["",true],
		["MI24", [2],  "", -5, [["expression", format[_EXECscript5,"MI24.sqf"]]], "1", "1"],
		["Mill Offroad", [3],  "", -5, [["expression", format[_EXECscript5,"militrayOffroad.sqf"]]], "1", "1"],
		["UH60", [4],  "", -5, [["expression", format[_EXECscript5,"UH60.sqf"]]], "1", "1"],
		["VW Golf", [5],  "", -5, [["expression", format[_EXECscript5,"miniHB.sqf"]]], "1", "1"],
		["Moto", [6],  "", -5, [["expression", format[_EXECscript5,"Moto.sqf"]]], "1", "1"],
		["Moto 2", [7],  "", -5, [["expression", format[_EXECscript5,"Moto2.sqf"]]], "1", "1"],
		["Moto 3", [8],  "", -5, [["expression", format[_EXECscript5,"Moto3.sqf"]]], "1", "1"],
		["Moto 4", [9],  "", -5, [["expression", format[_EXECscript5,"Moto4.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu5", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu5 =
[
["",true],
		["MV22", [2],  "", -5, [["expression", format[_EXECscript5,"MV22.sqf"]]], "1", "1"],
		["Offroad", [3],  "", -5, [["expression", format[_EXECscript5,"Offroad.sqf"]]], "1", "1"],
		["Offroad 2", [4],  "", -5, [["expression", format[_EXECscript5,"OFFROAD_d.sqf"]]], "1", "1"],
		["Offroad 3", [5],  "", -5, [["expression", format[_EXECscript5,"OFFROAD_w"]]], "1", "1"],
		["Red Offroad", [6],  "", -5, [["expression", format[_EXECscript5,"offroadRed.sqf"]]], "1", "1"],
		["Offroad Saffari", [7],  "", -5, [["expression", format[_EXECscript5,"offroadSaffari.sqf"]]], "1", "1"],
		["Offroad Tan", [8],  "", -5, [["expression", format[_EXECscript5,"offroadTan.sqf"]]], "1", "1"],
		["PBX", [9],  "", -5, [["expression", format[_EXECscript5,"PBX.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu6", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu6 =
[
["",true],
		["Sedan", [2],  "", -5, [["expression", format[_EXECscript5,"sedan.sqf"]]], "1", "1"],
		["SUV", [3],  "", -5, [["expression", format[_EXECscript5,"SUV.sqf"]]], "1", "1"],
		["MH6J", [4],  "", -5, [["expression", format[_EXECscript5,"MH6J.sqf"]]], "1", "1"],
		["Tank", [5],  "", -5, [["expression", format[_EXECscript5,"tank.sqf"]]], "1", "1"],
		["Tank Fallu", [6],  "", -5, [["expression", format[_EXECscript5,"TANKfall.sqf"]]], "1", "1"],
		["Tank Namal", [7],  "", -5, [["expression", format[_EXECscript5,"TANKnam.sqf"]]], "1", "1"],
		["Taxi", [8],  "", -5, [["expression", format[_EXECscript5,"taxi.sqf"]]], "1", "1"],
		["Tour Car", [9],  "", -5, [["expression", format[_EXECscript5,"tourcar.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu7", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu7 =
[
["",true],
		["SU25", [2],  "", -5, [["expression", format[_EXECscript5,"SU25.sqf"]]], "1", "1"],
		["Tractor 2", [3],  "", -5, [["expression", format[_EXECscript5,"Tractor.sqf"]]], "1", "1"],
		["Pickup Tubeframe", [4],  "", -5, [["expression", format[_EXECscript5,"tubeframe.sqf"]]], "1", "1"],
		["UAZ", [5],  "", -5, [["expression", format[_EXECscript5,"UAZ.sqf"]]], "1", "1"],
		["L39", [6],  "", -5, [["expression", format[_EXECscript5,"L39.sqf"]]], "1", "1"],
		["UH1H camo", [7],  "", -5, [["expression", format[_EXECscript5,"UH1H_TK.sqf"]]], "1", "1"],
		["UH1", [8],  "", -5, [["expression", format[_EXECscript5,"UH1.sqf"]]], "1", "1"],
		["Ural", [9],  "", -5, [["expression", format[_EXECscript5,"Ural.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu8", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu8 =
[
["",true],	
		["V3S", [2],  "", -5, [["expression", format[_EXECscript5,"V3S.sqf"]]], "1", "1"],
		["Van 2", [3],  "", -5, [["expression", format[_EXECscript5,"Van.sqf"]]], "1", "1"],
		["F35", [4],  "", -5, [["expression", format[_EXECscript5,"F35.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];


showCommandingMenu "#USER:adminmenu";