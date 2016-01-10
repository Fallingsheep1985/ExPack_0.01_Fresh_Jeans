disableSerialization;
playerMoney = player getVariable ['ExileMoney', 0];
if(IsSpinning)then{
		titleText ["Please wait for current spin!","PLAIN DOWN"]; 
		titleFadeOut 3;
	 } else {
	   //check if player has required item
	   if ( playerMoney > 1000 ) then{
		 //remove cost
			_newMoney = playerMoney - 1000;
			player setVariable ['ExileMoney', _newMoney];
			ExileClientPlayerMoney = _newMoney;
			(owner player) publicVariableClient 'ExileClientPlayerMoney';
			format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
		 //add credit
		 SlotsPlayerCredits = SlotsPlayerCredits + 1;
		 //Update credits display
		 _dialog = findDisplay 9000;
		 (_dialog displayCtrl 1001) ctrlSetText format ["%1" ,SlotsPlayerCredits]];
	   }else{
		 titleText ["You need 1000 to add 1 credit!","PLAIN DOWN"];
		 titleFadeOut 3;
	   };
   };