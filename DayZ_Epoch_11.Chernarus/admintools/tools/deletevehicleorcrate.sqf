
//Made by Scenic of UG & OpenDayZ on 26/04/2014

_ct = cursorTarget;
if (_ct isKindOf "LandVehicle" OR _ct isKindOf "Helicopter" OR _ct isKindOf "Plane" OR _ct isKindOf "Ship" OR _ct isKindOf "USBasicAmmunitionBox" OR _ct isKindOf "USLaunchersBox" OR _ct isKindOf "USOrdnanceBox" OR _ct isKindOf "USBasicWeaponsBox" OR _ct isKindOf "USSpecialWeaponsBox" OR _ct isKindOf "USVehicleBox" OR _ct isKindOf "RUBasicAmmunitionBox" OR _ct isKindOf "RULaunchersBox" OR _ct isKindOf "RUOrdnanceBox" OR _ct isKindOf "RUBasicWeaponsBox" OR _ct isKindOf "RUSpecialWeaponsBox" OR _ct isKindOf "RUVehicleBox" OR _ct isKindOf "LocalBasicAmmunitionBox" OR _ct isKindOf "LocalBasicWeaponsBox" OR _ct isKindOf "GuerillaCacheBox" OR _ct isKindOf "SpecialWeaponsBox") then
{
cutText ["Cursor target deleted.", "PLAIN"];
DeleteIT = "deleteVehicle cursorTarget;";
[] spawn compile DeleteIT;
}
else
{
cutText ["Cursor target isnt a vehicle!", "PLAIN"];
};