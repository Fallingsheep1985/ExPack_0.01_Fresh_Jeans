//init
_LOGO_WATERMARK_SCRIPT 	= getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "LOGO_WATERMARK_SCRIPT");
_WELCOME_CREDITS_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "WELCOME_CREDITS_SCRIPT");
_KILL_MESSAGE_SCRIPT 	= getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "KILL_MESSAGE_SCRIPT");
_IGILOAD_SCRIPT 		= getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "IGILOAD_SCRIPT");
_WEATHER_EFFECTS_SCRIPT = getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "WEATHER_EFFECTS_SCRIPT");
_AIR_PATROL_SCRIPT 		= getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "AIR_PATROL_SCRIPT");
_STATUS_BAR_SCRIPT 		= getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "STATUS_BAR_SCRIPT");
_FOG_SCRIPT 			= getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "FOG_SCRIPT");
_LOCK_PICK_SCRIPT 		= getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "LOCK_PICK_SCRIPT");
_BLOWOUT_SCRIPT			= getNumber(missionConfigFile >> "CfgScriptControlMisson" >> "SCRIPT_config" >> "BLOWOUT_SCRIPT");

//Lockpick
if (_LOCK_PICK_SCRIPT isEqualTo 1) then {
	[] execVM "addons\w4_lockpick\initLockpick.sqf";
	diag_log "Lock Pick - Loaded";
};
//Air Patrol
if (_AIR_PATROL_SCRIPT isEqualTo 1) then {
	[] execVM "scripts\airpatrol.sqf";
	diag_log "Air Patrol - Loaded";
};
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
//Ground Fog
if (_FOG_SCRIPT isEqualTo 1) then {
	_GF = [] execVM "scripts\fog.sqf";
	diag_log "Ground Fog - Loaded";
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

//blow out
if (_BLOWOUT_SCRIPT isEqualTo 1) then {
	ns_blow_itemapsi = ["H_PilotHelmetFighter_B","H_PilotHelmetFighter_I","H_PilotHelmetFighter_O"];
	ns_blow_itemtype = 3;  // 1=item 2=weapon 3=headgear
	ns_blow_world = "Altis"; // worldname
	ns_blow_removeapsi = true; // remove/destroy APSI item after storm
	ns_blowout = true;
	ns_blowout_exile = true;// true / false
	ns_blow_delaymod = 0.1; //blowout delay
	ns_blow_emp = false; //Namalsk Only
	ns_blow_prep = false;
	ns_blow_status = false;
	ns_blow_action = false;

	if (!isDedicated) then {
		 _bul = [] execVM "addons\blowout\module\blowout_client.sqf";
	diag_log "BLOWOUT CLIENT - Loading";		 
	};
	if (isServer) then {
		_bul = [ns_blow_emp] execVM "addons\blowout\module\blowout_server.sqf";
		diag_log "BLOWOUT SERVER - Loading";
	};
	diag_log "BLOWOUT - Loaded";
};

//run last cause error in RPT
// Weather Effects by john
if (_WEATHER_EFFECTS_SCRIPT isEqualTo 1) then {
	[] execVM "scripts\weatherEffects.sqf";
	diag_log "Weather Effects - Loaded";
};