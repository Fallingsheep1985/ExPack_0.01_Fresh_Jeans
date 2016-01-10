//init
private["_piclogo","_LOGO_WATERMARK_SCRIPT","_WELCOME_CREDITS_SCRIPT","_KILL_MESSAGE_SCRIPT","_IGILOAD_SCRIPT"];
_LOGO_WATERMARK_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "LOGO_WATERMARK_SCRIPT_config" >> "LOGO_WATERMARK_SCRIPT");
_WELCOME_CREDITS_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "WELCOME_CREDITS_SCRIPT_config" >> "WELCOME_CREDITS_SCRIPT");
_KILL_MESSAGE_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "KILL_MESSAGE_SCRIPT_config" >> "KILL_MESSAGE_SCRIPT");
_IGILOAD_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "IGILOAD_SCRIPT_config" >> "IGILOAD_SCRIPT");
_WEATHER_EFFECTS_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "WEATHER_EFFECTS_SCRIPT_config" >> "WEATHER_EFFECTS_SCRIPT");
_AIR_PATROL_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "AIR_PATROL_SCRIPT_config" >> "AIR_PATROL_SCRIPT");
_STATUS_BAR_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "STATUS_BAR_SCRIPT_config" >> "_STATUS_BAR_SCRIPT");


if (_AIR_PATROL_SCRIPT isEqualTo 1) then{
	[] execVM "scripts\airpatrol.sqf";
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
// Status Bar
if (_STATUS_BAR_SCRIPT isEqualTo 1) then{
	[] execVM "addons\statusBar\statusBar.sqf";
};


// bAdmin Exile by Daz & Biabock

#define DEBUG false

[DEBUG] call compile preprocessFileLineNumbers "badmin\globalCompile.sqf";

if (!isDedicated) then
{
	if (hasInterface) then // Normal player
	{
		execVM "badmin\client\init.sqf";
	}
};

if (isServer) then
{
	diag_log "bAdmin - Initializing";
	[] execVM "badmin\server\init.sqf";
};


 