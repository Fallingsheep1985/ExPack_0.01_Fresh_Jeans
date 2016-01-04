//Script load init
private["_piclogo","_LOGO_WATERMARK_SCRIPT","_WELCOME_CREDITS_SCRIPT","_KILL_MESSAGE_SCRIPT","_IGILOAD_SCRIPT"];
_LOGO_WATERMARK_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "LOGO_WATERMARK_SCRIPT_config" >> "LOGO_WATERMARK_SCRIPT");
_WELCOME_CREDITS_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "WELCOME_CREDITS_SCRIPT_config" >> "WELCOME_CREDITS_SCRIPT");
_KILL_MESSAGE_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "KILL_MESSAGE_SCRIPT_config" >> "KILL_MESSAGE_SCRIPT");
_IGILOAD_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "IGILOAD_SCRIPT_config" >> "IGILOAD_SCRIPT");

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