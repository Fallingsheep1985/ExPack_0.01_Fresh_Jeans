//check if player has apsi item
//Created by Fallingsheep
private["_items","_hasAPSI","_x"];
diag_log "BLOWOUT - APSI CHECK";
_pitems = assignedItems player;
_pheadgear = headgear player;
_pweapons = weapons player;
_pgoggles = goggles player;
_pvest = vest player;
//Check items
{
	if (_x in ns_blow_itemapsi)then{
	_hasAPSI = true;
    }else{
        _hasAPSI = false;
    };
} foreach _pitems;
//Check Weapons
{
	if (_x in ns_blow_itemapsi)then{
	_hasAPSI = true;
    }else{
        _hasAPSI = false;
    };
} foreach _pweapons;
//Check Headgear
if (_pheadgear in ns_blow_itemapsi)then{
	_hasAPSI = true;
}else{
    _hasAPSI = false;
};
//Vest
if (_pvest in ns_blow_itemapsi)then{
	_hasAPSI = true;
}else{
    _hasAPSI = false;
};
//goggles
if (_pgoggles in ns_blow_itemapsi)then{
	_hasAPSI = true;
}else{
    _hasAPSI = false;
};
_hasAPSI