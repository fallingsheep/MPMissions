GearAdd = (vehicle player);
GearAdd addMagazine 'ItemMorphine';
GearAdd addMagazine 'ItemBloodbag';
GearAdd addMagazine 'ItemPainkiller';
GearAdd addMagazine 'ItemSodaPepsi';
GearAdd addMagazine 'FoodSteakCooked';
GearAdd addMagazine 'ItemBandage';
GearAdd addMagazine 'ItemBandage';
GearAdd addWeapon 'Binocular_Vector';
GearAdd addWeapon 'NVGoggles';
GearAdd addWeapon 'ItemGPS';
GearAdd addWeapon 'ItemWatch';
GearAdd addWeapon 'ItemHatchet';
GearAdd addWeapon 'ItemKnife';
GearAdd addWeapon 'ItemMatchbox';
GearAdd addWeapon 'ItemEtool';
GearAdd addWeapon 'ItemToolbox';
(Unitbackpack GearAdd) addMagazineCargo ['ItemBloodbag', 2];
(Unitbackpack GearAdd) addMagazineCargo ['ItemSodaPepsi', 3];
(Unitbackpack GearAdd) addMagazineCargo ['ItemBandage', 2];
(Unitbackpack GearAdd) addMagazineCargo ['FoodSteakCooked', 3];
(Unitbackpack GearAdd) addMagazineCargo ['ItemMorphine', 2];
if ( AdminTrackItems ) {
	_playerUID = getplayerUID player;
	_playerName = name player;
	diag_log format["[ADMIN TOOLS] - SPAWNED ITEMS  - Admin Name: %1 UID: %2 " , _playerName, _playerUID];
};