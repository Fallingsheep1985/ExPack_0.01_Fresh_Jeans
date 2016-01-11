disableSerialization;
playerMoney = player getVariable ['ExileMoney', 0];
if(IsSpinning)then{
		titleText ["Please wait for current spin!","PLAIN DOWN",3]; 
		titleFadeOut 3;
	 } else {
	   //check if player has required item
	   if ( playerMoney > 1000 ) then{
		 //remove cost
		_newPoptabs = ExileClientPlayerMoney - 1000;
		ENIGMA_UpdateStats = [player,_newPoptabs];
		publicVariableServer "ENIGMA_UpdateStats";
		 //add credit
		 SlotsPlayerCredits = SlotsPlayerCredits + 1;
		 //Update credits display
		 _dialog = findDisplay 9000;
		 (_dialog displayCtrl 1001) ctrlSetText format ["%1" ,SlotsPlayerCredits];
	   }else{
		 titleText ["You need 1000 to add 1 credit!","PLAIN DOWN",3];
		 titleFadeOut 3;
	   };
   };