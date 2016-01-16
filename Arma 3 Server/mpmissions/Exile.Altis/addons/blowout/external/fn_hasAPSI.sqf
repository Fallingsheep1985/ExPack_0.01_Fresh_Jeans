//check if player has apsi item
//Created by Fallingsheep
private["_hasAPSI","_x"];
diag_log "BLOWOUT - APSI CHECK";

//Check items
{
	if (_x in ns_blow_itemapsi)then{
	_hasAPSI = true;
    }else{
        _hasAPSI = false;
    };
} foreach (assignedItems player);
//Check Weapons
{
	if (_x in ns_blow_itemapsi)then{
	_hasAPSI = true;
    }else{
        _hasAPSI = false;
    };
} foreach (weapons player);

//Check Headgear
if ((headgear player) in ns_blow_itemapsi)then{
	_hasAPSI = true;
}else{
    _hasAPSI = false;
};
//Vest
if ((vest player) in ns_blow_itemapsi)then{
	_hasAPSI = true;
}else{
    _hasAPSI = false;
};
//goggles
if ((goggles player) in ns_blow_itemapsi)then{
	_hasAPSI = true;
}else{
    _hasAPSI = false;
};
_hasAPSI