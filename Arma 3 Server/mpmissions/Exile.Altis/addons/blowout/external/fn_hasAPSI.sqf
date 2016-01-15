//check if player has apsi item
//Created by Fallingsheep
private["_unit1","_items","_hasAPSI"];
_unit1 = _this select 0;
//Check items
if(ns_blow_itemtype isEqualTo 1)then{
	if({_x in ns_blow_itemapsi} foreach(items _unit))then{
		_hasAPSI = true;
	}else{
		_hasAPSI = false;
	};
};
//Check Weapons
if(ns_blow_itemtype isEqualTo 2)then{
	if({_x in ns_blow_itemapsi} foreach(weapons _unit))then{
		_hasAPSI = true;
	}else{
		_hasAPSI = false;
	};
};
//Check Headgear
if(ns_blow_itemtype isEqualTo 3)then{
	if({_x in ns_blow_itemapsi} foreach (headgear _unit))then{
		_hasAPSI = true;
	}else{
		_hasAPSI = false;
	};
};
_hasAPSI