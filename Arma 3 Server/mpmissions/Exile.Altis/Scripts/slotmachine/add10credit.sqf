disableSerialization;
playerMoney = player getVariable ['ExileMoney', 0];
if(IsSpinning)then{
		titleText ["Please wait for current spin!","PLAIN DOWN",3]; 
		titleFadeOut 3;
	 } else {
if ( playerMoney > 10000 ) then{
		 //remove cost
		_newPoptabs = ExileClientPlayerMoney - 10000;
		ENIGMA_UpdateStats = [player,_newPoptabs];
		publicVariableServer "ENIGMA_UpdateStats";
		 //add credits
		 SlotsPlayerCredits = SlotsPlayerCredits + 10;
		 //Update credits display
		 _dialog = findDisplay 9000;
		 (_dialog displayCtrl 1001) ctrlSetText format ["%1" ,SlotsPlayerCredits];
	   }else{
		 titleText ["You need 10000 to add 10 credits!","PLAIN DOWN",3]; 
		 titleFadeOut 3;
	   };
   };