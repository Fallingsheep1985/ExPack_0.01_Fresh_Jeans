/* Property of DayZ modification - http://www.dayzmod.com/ */
//Modified by fallingsheep for exile
private["_unit1","_cover","_distanceToCover","_inside"];
_unit1 = _this select 0;
//_building = _this select 1;
_cover = nearestBuilding _unit1;
_distanceToCover = _unit1 distance _cover;
if (_distanceToCover < 10)then{
	_inside = true;
};
_inside