//Server  init
_AIR_PATROL_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "AIR_PATROL_SCRIPT_config" >> "AIR_PATROL_SCRIPT");
_ADMIN_TOOLS_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "_ADMIN_TOOLS_SCRIPT_config" >> "_ADMIN_TOOLS_SCRIPT");

if (_AIR_PATROL_SCRIPT isEqualTo 1) then{
	[] execVM "scripts\airpatrol.sqf";
};
if (_ADMIN_TOOLS_SCRIPT isEqualTo 1) then{
	[] execVM "fusionsmenu\admin\activate.sqf";
	[] execVM "fusionsmenu\admin\loop.sqf";  
};    