//Server  init
private["_piclogo","_LOGO_WATERMARK_SCRIPT","_WELCOME_CREDITS_SCRIPT","_KILL_MESSAGE_SCRIPT","_IGILOAD_SCRIPT"];
_LOGO_WATERMARK_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "LOGO_WATERMARK_SCRIPT_config" >> "LOGO_WATERMARK_SCRIPT");
_WELCOME_CREDITS_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "WELCOME_CREDITS_SCRIPT_config" >> "WELCOME_CREDITS_SCRIPT");
_KILL_MESSAGE_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "KILL_MESSAGE_SCRIPT_config" >> "KILL_MESSAGE_SCRIPT");
_IGILOAD_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "IGILOAD_SCRIPT_config" >> "IGILOAD_SCRIPT");
_WEATHER_EFFECTS_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "WEATHER_EFFECTS_SCRIPT_config" >> "WEATHER_EFFECTS_SCRIPT");
_AIR_PATROL_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "AIR_PATROL_SCRIPT_config" >> "AIR_PATROL_SCRIPT");
_ADMIN_TOOLS_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "_ADMIN_TOOLS_SCRIPT_config" >> "_ADMIN_TOOLS_SCRIPT");

if (_AIR_PATROL_SCRIPT isEqualTo 1) then{
	[] execVM "scripts\airpatrol.sqf";
};
if (_ADMIN_TOOLS_SCRIPT isEqualTo 1) then{
	[] execVM "fusionsmenu\admin\activate.sqf";
	[] execVM "fusionsmenu\admin\loop.sqf";  
};
//Script load init
//Watermark
if (_LOGO_WATERMARK_SCRIPT isEqualTo 1) then {
	_piclogo = "Pictures\logo.paa";
	[
		'<img align=''left'' size=''1.0'' shadow=''0'' image='+(str(_piclogo))+' />',
		safeZoneX+0.027,
		safeZoneY+safeZoneH-0.1,
		99999,
		0,
		0,
		3090
	] spawn bis_fnc_dynamicText;
};
// Welcome Credits by Gr8
if (_WELCOME_CREDITS_SCRIPT isEqualTo 1) then{
	[] execVM "scripts\welcome.sqf";
};
// Kill Messages By GR8
if (_KILL_MESSAGE_SCRIPT isEqualTo 1) then {
	[] execVM "scripts\KillMessages.sqf";
};
// Igiload
if (_IGILOAD_SCRIPT isEqualTo 1) then {
	[] execVM "Scripts\IgiLoad\IgiLoadInit.sqf";
};
// Weather Effects by john
if (_WEATHER_EFFECTS_SCRIPT isEqualTo 1) then{
	[] execVM "scripts\weatherEffects.sqf";
};    