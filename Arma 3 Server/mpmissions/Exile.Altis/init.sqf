//init
private["_piclogo","_LOGO_WATERMARK_SCRIPT","_WELCOME_CREDITS_SCRIPT","_KILL_MESSAGE_SCRIPT","_IGILOAD_SCRIPT"];
_LOGO_WATERMARK_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "LOGO_WATERMARK_SCRIPT_config" >> "LOGO_WATERMARK_SCRIPT");
_WELCOME_CREDITS_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "WELCOME_CREDITS_SCRIPT_config" >> "WELCOME_CREDITS_SCRIPT");
_KILL_MESSAGE_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "KILL_MESSAGE_SCRIPT_config" >> "KILL_MESSAGE_SCRIPT");
_IGILOAD_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "IGILOAD_SCRIPT_config" >> "IGILOAD_SCRIPT");
_WEATHER_EFFECTS_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "WEATHER_EFFECTS_SCRIPT_config" >> "WEATHER_EFFECTS_SCRIPT");
_AIR_PATROL_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "AIR_PATROL_SCRIPT_config" >> "AIR_PATROL_SCRIPT");
_STATUS_BAR_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "STATUS_BAR_SCRIPT_config" >> "STATUS_BAR_SCRIPT");


if (_AIR_PATROL_SCRIPT isEqualTo 1) then {
	[] execVM "scripts\airpatrol.sqf";
	diag_log "Air Patrol - Loaded";
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
	diag_log "Watermark - Loaded";
};
// Welcome Credits by Gr8
if (_WELCOME_CREDITS_SCRIPT isEqualTo 1) then {
	[] execVM "scripts\welcome.sqf";
	diag_log "Welcome Credits by Gr8 - Loaded";
};
// Kill Messages By GR8
if (_KILL_MESSAGE_SCRIPT isEqualTo 1) then {
	[] execVM "scripts\KillMessages.sqf";
	diag_log "Kill Messages By GR8 - Loaded";
};
// Igiload
if (_IGILOAD_SCRIPT isEqualTo 1) then {
	[] execVM "Scripts\IgiLoad\IgiLoadInit.sqf";
	diag_log "IgiLoad - Loaded";
};

// Status Bar
if (_STATUS_BAR_SCRIPT isEqualTo 1) then {
	[] execVM "scripts\statusBar\statusBar.sqf";
	diag_log "Status Bar - Loaded";
};

// bAdmin Exile by Daz & Biabock
#define DEBUG false
[DEBUG] call compile preprocessFileLineNumbers "badmin\globalCompile.sqf";
if (!isDedicated) then {
	if (hasInterface) then {
		execVM "badmin\client\init.sqf";
		diag_log "bAdmin - Client Loaded";
	};
};

if (isServer) then {
	diag_log "bAdmin - Initializing";
	[] execVM "badmin\server\init.sqf";
	diag_log "bAdmin - Server Loaded";
};
OPEN_bADMIN_FNC = {
	switch (_this) do {
		//Key U
		case 22: {
			nul = [] execVM "badmin\client\systems\adminPanel\checkAdmin.sqf";
		};
	};
};

waituntil {!isnull (finddisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call OPEN_bADMIN_FNC;false;"];


// Weather Effects by john
if (_WEATHER_EFFECTS_SCRIPT isEqualTo 1) then {
	[] execVM "scripts\weatherEffects.sqf";
	diag_log "Weather Effects - Loaded";
};
 