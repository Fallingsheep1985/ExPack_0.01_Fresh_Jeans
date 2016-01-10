if(IsSpinning)then{
		titleText ["Please wait for current spin!","PLAIN DOWN"]; titleFadeOut 3;
	 } else {
if (playerMoney => SLOTCOST10SPIN) then{
		 //remove cost
			_newMoney = playerMoney - SLOTCOST10SPIN;
			player setVariable ['ExileMoney', _newMoney];
			ExileClientPlayerMoney = _newMoney;
			(owner player) publicVariableClient 'ExileClientPlayerMoney';
			format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
		 //add credits
		 SlotsPlayerCredits = SlotsPlayerCredits + 10;
		 //Update credits display
		 _dialog = findDisplay 9000;
		 (_dialog displayCtrl 1001) ctrlSetText format ["%1" ,SlotsPlayerCredits]];
	   }else{
		 titleText ["You need 10000 to add 10 credits!","PLAIN DOWN"]; titleFadeOut 3;
	   };
   };