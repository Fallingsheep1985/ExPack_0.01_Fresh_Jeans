//check if player has apsi item
//Created by Fallingsheep
private["_unit","_items","_hasAPSI","_x"];
diag_log "BLOWOUT - APSI CHECK";
_unit = _this select 0;
//undefined fix
_pitems = assignedItems _unit;
_pheadgear = headgear _unit;
_pweapons = weapons _unit;
//Check items
if(ns_blow_itemtype isEqualTo 1)then{
    if (ns_blow_itemapsi in _pitems) then{
        _hasAPSI = true;
    }else{
        _hasAPSI = false;
    };
};
//Check Weapons
if(ns_blow_itemtype isEqualTo 2)then{
    if (ns_blow_itemapsi in _pweapons) then{
        _hasAPSI = true;
    }else{
        _hasAPSI = false;
    };
};
//Check Headgear
if(ns_blow_itemtype isEqualTo 3)then{
    if(ns_blow_itemapsi in _pheadgear) then{
        _hasAPSI = true;
    }else{
        _hasAPSI = false;
    };
};
_hasAPSI