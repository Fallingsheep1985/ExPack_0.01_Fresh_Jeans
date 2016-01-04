//Server  init
_AIR_PATROL_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "AIR_PATROL_SCRIPT_config" >> "AIR_PATROL_SCRIPT");

if (_AIR_PATROL_SCRIPT isEqualTo 1) then{
	[] execVM "scripts\airpatrol.sqf";
};      