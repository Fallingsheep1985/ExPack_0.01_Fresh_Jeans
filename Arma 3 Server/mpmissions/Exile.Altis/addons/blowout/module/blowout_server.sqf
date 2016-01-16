/*
 **  BLOWOUT MODULE - Nightstalkers: Shadow of Namalsk
 *   ..created by Sumrak, ©2010
 *   http://www.nightstalkers.cz
 *   sumrak<at>nightstalkers.cz
 *   PBO edition
 *   SERVER-SIDE script 
*/
private["_emp_tg_namalsk"];
diag_log "BLOWOUT SERVER - Loaded"; 

bl_damage = {
	private["_isinbuilding","_emp"];
	_emp = _this select 0;
	//_count_units = count playableUnits;
	_count_units = count AllUnits;
	_isinbuilding = false;
	diag_log format["[NAC BLOWOUT SERVER] :: bl_damage (_count_units = %1)", _count_units];
	for [{_c = 0}, {_c <= _count_units}, {_c = _c + 1}] do {
		//_jednotka = playableUnits select _c;
		_jednotka = AllUnits select _c;
		if (!isNull _jednotka) then {
			if([_jednotka] call fnc_isInsideBuilding) then {
				_isinbuilding = true;
				diag_log format["[NAC BLOWOUT SERVER] :: [S] %1 IN", _isinbuilding];
			} else {
				_isinbuilding = false;
				diag_log format["[NAC BLOWOUT SERVER] :: [S] %1 OUT", _isinbuilding];
			};
			if (!([_jednotka] call fnc_hasAPSI)) then {
				diag_log format["[NAC BLOWOUT SERVER] :: [S] %1 does not have APSI", _jednotka];
				if (!_isinbuilding) then {
					diag_log format["[NAC BLOWOUT SERVER] :: [S] and %1 is not in a building, sorry.", _jednotka];
					_jednotka setDamage (damage _jednotka + 0.30);
					diag_log format["[NAC BLOWOUT SERVER] :: [S] %1 has been damaged by blowout by 0.30", _jednotka];
				} else {
					diag_log format["[NAC BLOWOUT SERVER] :: [S] but %1 is in some building, good for him.", _jednotka];
				};
			} else {
				diag_log format["[NAC BLOWOUT SERVER] :: [S] %1 does have APSI, I do not have problem with him.", _jednotka];
			};
			if (worldName == ns_blow_world) then {
				if (ns_blow_removeapsi) then {
					if ([_jednotka] call fnc_hasAPSI) then {
						 _jednotka removeItem ns_blow_itemapsi;
					};
				};
			};
	    };
	    //_count_units = count AllUnits;
    };
    if (_emp == 1) then {
      _count_vehicles = count vehicles;
      diag_log format["[NAC BLOWOUT SERVER] :: bl_damage (_count_vehicles = %1)", _count_vehicles];
      for [{_c = 0}, {_c <= _count_vehicles}, {_c = _c + 1}] do {
        _vehikl = vehicles select _c;
        if (_vehikl isKindOf "AllVehicles") then {
          if ((damage _vehikl) <= 0.99) then {
            //_vehikl setDamage 0.9;
            //_vehikl setFuel 0;
            diag_log format["[NAC BLOWOUT SERVER] :: [V] %1 has been damaged by blowout by 0.90", _vehikl];
          };  
        };
      };    
    };
};

// init
while {true} do {
 _emp_tg_namalsk = 0;
 if (isNil("ns_blow_emp")) then { ns_blow_emp = false; }; 
 if (isNil("ns_blowout")) then { ns_blowout = true; }; 
 if (isNil("ns_blowout_exile")) then { ns_blowout_exile = false; };
 if (isNil("ns_blow_delaymod")) then { ns_blow_delaymod = 1; };
 if (isNil("ns_blow_prep")) then { ns_blow_prep = false; };
 
  private["_prodleva"];
  if(ns_blowout_exile) then {
   _prodleva = random (6000 * ns_blow_delaymod);
   while {_prodleva < (3000 * ns_blow_delaymod)} do {
     _prodleva = random (6000 * ns_blow_delaymod);
   };
  } else {
   _prodleva = (random (1600 * ns_blow_delaymod));
   while {_prodleva < (800 * ns_blow_delaymod)} do {
     _prodleva = random (1600 * ns_blow_delaymod);
   };
  };
  
  diag_log format["[NAC BLOWOUT SERVER] :: Next blowout in _delay (_delay = %1), delay modifier is %2 (ns_blow_delaymod)", _prodleva, ns_blow_delaymod];
  sleep _prodleva;

  if(!ns_blowout) then {
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout module is temporarily OFF ns_blowout (ns_blowout = %1)", ns_blowout];
  } else {
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout module is ON ns_blowout (ns_blowout = %1)", ns_blowout];
  };
  
  if(ns_blowout_exile) then {
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout module is in DayZ mode ns_blowout_exile (ns_blowout_exile = %1)", ns_blowout_exile];
  };
  
  // Stop variable check
  waitUntil{ns_blowout};

  if (ns_blow_emp) then {
     diag_log format["[NAC BLOWOUT SERVER] :: Boosting up efficiency, EMP target Namalsk and surroundings (ns_blow_emp = %1)", ns_blow_emp];
     _emp_tg_namalsk = 1;
  } else {
     diag_log format["[NAC BLOWOUT SERVER] :: Normal output, EMP target surroundings of Namalsk (ns_blow_emp = %1)", ns_blow_emp];
     _emp_tg_namalsk = 0;
  };
  
  // Preparations before blowout - APSI / players running to take a cover
  ns_blow_prep = true;
  publicVariable "ns_blow_prep";
  diag_log format["[NAC BLOWOUT SERVER] :: Preparations are under way (ns_blow_prep = %1)", ns_blow_prep];
  sleep 10;
  ns_blow_prep = false;
  publicVariable "ns_blow_prep";
  diag_log format["[NAC BLOWOUT SERVER] :: Preparations are finished (ns_blow_prep = %1)", ns_blow_prep];
  
  // main blowout variable - 1 == blowout in progress, 0 == no current blowout
  ns_blow_status = true;
  publicVariable "ns_blow_status";
  diag_log format["[NAC BLOWOUT SERVER] :: Blowout in progress (ns_blow_status = %1)", ns_blow_status];
  sleep 2;
  if (ns_blow_status) then {
    ns_blow_action = true;
    publicVariable "ns_blow_action";
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout actions in progress (ns_blow_action = %1)", ns_blow_action];
    if (!ns_blowout_exile) then {_bul = [_emp_tg_namalsk] call bl_damage;};
	sleep 10;
    ns_blow_action = false;
    publicVariable "ns_blow_action";
    diag_log format["[NAC BLOWOUT SERVER] :: Blowout actions finished (ns_blow_action = %1)", ns_blow_action];
  };
  sleep 10;
  ns_blow_status = false; 
  publicVariable "ns_blow_status";
  diag_log format["[NAC BLOWOUT SERVER] :: Blowout finished (ns_blow_status = %1)", ns_blow_status];
};