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
    if{_x in ns_blow_itemapsi} foreach _pitems then{
		diag_log format["player: %2 ",_unit];
        _hasAPSI = true;
    }else{
		diag_log format["player: %2 NO APSI",_unit];
        _hasAPSI = false;
    };
};
//Check Weapons
if(ns_blow_itemtype isEqualTo 2)then{
    if{_x in ns_blow_itemapsi} foreach _pweapons then{
		diag_log format["player: %2 APSI: %1",_unit];
        _hasAPSI = true;
    }else{
		diag_log format["player: %2 NO APSI",_unit];
        _hasAPSI = false;
    };
};
//Check Headgear
if(ns_blow_itemtype isEqualTo 3)then{
    if{_x in ns_blow_itemapsi} foreach _pheadgear then{
		diag_log format["player: %2 APSI: %1",_unit];
        _hasAPSI = true;
    }else{
		diag_log format["player: %2 NO APSI",_unit];
        _hasAPSI = false;
    };
};
_hasAPSI