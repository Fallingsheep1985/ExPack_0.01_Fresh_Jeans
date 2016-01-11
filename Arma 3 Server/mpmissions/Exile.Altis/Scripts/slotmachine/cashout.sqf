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
					_newPoptabs = ExileClientPlayerMoney + 10000;
					ENIGMA_UpdateStats = [player,_newPoptabs];
					publicVariableServer "ENIGMA_UpdateStats";
				}else{
					//remove credits
					SlotsPlayerCredits = SlotsPlayerCredits - 1;
					//cash back
					_newPoptabs = ExileClientPlayerMoney + 1000;
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