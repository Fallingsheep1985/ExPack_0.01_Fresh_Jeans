//check if player has apsi item
//Created by Fallingsheep
private["_unit","_items","_hasAPSI","_x"];
diag_log "BLOWOUT - APSI CHECK";
_unit = _this select 0;
_pitems = assignedItems _unit;
_pheadgear = headgear _unit;
_pweapons = weapons _unit;
_pgoggles = goggles _unit;
_pvest = vest _unit;
//Check items
if(ns_blow_itemtype isEqualTo 1)then{
{
	if (_x in ns_blow_itemapsi)then{
	_hasAPSI = true;
    }else{
        _hasAPSI = false;
    };
} foreach _pitems;
        
};
//Check Weapons
if(ns_blow_itemtype isEqualTo 2)then{
{
	if (_x in ns_blow_itemapsi)then{
	_hasAPSI = true;
    }else{
        _hasAPSI = false;
    };
} foreach _pweapons;
};
//Check Headgear
if(ns_blow_itemtype isEqualTo 3)then{
{
	if (_x in ns_blow_itemapsi)then{
	_hasAPSI = true;
    }else{
        _hasAPSI = false;
    };
} foreach _pheadgear;
};
_hasAPSI