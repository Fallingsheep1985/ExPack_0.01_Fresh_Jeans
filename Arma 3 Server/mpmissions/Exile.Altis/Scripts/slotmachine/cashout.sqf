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
					_newPoptabs = ExileClientPlayerMoney + SLOTCOST10SPIN;
					ENIGMA_UpdateStats = [player,_newPoptabs];
					publicVariableServer "ENIGMA_UpdateStats";
				}else{
					//remove credits
					SlotsPlayerCredits = SlotsPlayerCredits - 1;
					//cash back
					_newPoptabs = ExileClientPlayerMoney + SLOTCOST1SPIN;
					ENIGMA_UpdateStats = [player,_newPoptabs];
					publicVariableServer "ENIGMA_UpdateStats";
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