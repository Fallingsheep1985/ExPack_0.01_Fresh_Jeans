disableSerialization;
playerMoney = player getVariable ['ExileMoney', 0];
	if (IsSpinning) then {
		titleText ["Please wait for current spin!","PLAIN DOWN",3]; 
		titleFadeOut 3;
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
			titleText ["Credits refunded.","PLAIN DOWN", 3]; titleFadeOut 3;
			sleep 0.01;
			
			//Reset Slots
			SlotsPlayerCredits = 0;
			IsSpinning = false;
		};
		titleText ["No Credits - Closing app.","PLAIN DOWN", 3]; titleFadeOut 3;
		closeDialog 9000;
	};