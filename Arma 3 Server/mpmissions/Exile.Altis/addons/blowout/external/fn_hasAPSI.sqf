//check if player has apsi item
//Created by Fallingsheep
private["_unit1","_items","_hasAPSI"];
_unit1 = _this select 0;
//Check items
if(ns_blow_itemtype isEqualTo 1)then{
    if(_x in ns_blow_itemapsi) foreach (items _unit)then{
		diag_log format["player: %2 APSI: %1",_x,_unit];
        _hasAPSI = true;
    }else{
		diag_log format["player: %2 NO APSI",_x,_unit];
        _hasAPSI = false;
    };
};
//Check Weapons
if(ns_blow_itemtype isEqualTo 2)then{
    if(_x in ns_blow_itemapsi) foreach (weapons _unit)then{
		diag_log format["player: %2 APSI: %1",_x,_unit];
        _hasAPSI = true;
    }else{
		diag_log format["player: %2 NO APSI",_x,_unit];
        _hasAPSI = false;
    };
};
//Check Headgear
if(ns_blow_itemtype isEqualTo 3)then{
    if(_x in ns_blow_itemapsi) foreach (headgear _unit)then{
		diag_log format["player: %2 APSI: %1",_x,_unit];];
        _hasAPSI = true;
    }else{
		diag_log format["player: %2 NO APSI",_x,_unit];
        _hasAPSI = false;
    };
};
_hasAPSI