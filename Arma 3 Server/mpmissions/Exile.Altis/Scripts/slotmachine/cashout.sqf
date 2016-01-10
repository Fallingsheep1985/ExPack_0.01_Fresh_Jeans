disableSerialization;

private["ReelImage1","ReelImage2","ReelImage3","fnc_add_1_credits","fnc_add_10_credits","fnc_spin","fnc_payout","fnc_random_pictures","fnc_reset_slots","_newMoney","playerMoney","SlotsPlayerCredits","SLOTCOST1SPIN","SLOTCOST10SPIN","PRIZE1","PRIZE2","PRIZE3","PRIZE4","PRIZE5","PRIZE6","PRIZE7","IsSpinning","reelArray","slotspictures","hasSlotsCredits","reel1","reel2","reel3"]

	if (IsSpinning) then {
		titleText ["Please wait for current spin!","PLAIN DOWN"]; titleFadeOut 3;
	}else{
		if (SlotsPlayerCredits > 0) then {
			while {SlotsPlayerCredits > 0} do
			{
				if (SlotsPlayerCredits > 10) then {
					//remove credits
					SlotsPlayerCredits = SlotsPlayerCredits - 10;
					//cash back
					_newMoney = playerMoney + SLOTCOST10SPIN;
					player setVariable ['ExileMoney', _newMoney];
					ExileClientPlayerMoney = _newMoney;
					(owner player) publicVariableClient 'ExileClientPlayerMoney';
					format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
				}else{
					//remove credits
					SlotsPlayerCredits = SlotsPlayerCredits - 1;
					//cash back
					_newMoney = playerMoney + SLOTCOST1SPIN;
					player setVariable ['ExileMoney', _newMoney];
					ExileClientPlayerMoney = _newMoney;
					(owner player) publicVariableClient 'ExileClientPlayerMoney';
					format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
				};
			};
			titleText ["Credits refunded.","PLAIN DOWN"]; titleFadeOut 3;
			sleep 0.01;
			//Reset Slots
			SlotsPlayerCredits = 0;
			IsSpinning = false;
		};
	};