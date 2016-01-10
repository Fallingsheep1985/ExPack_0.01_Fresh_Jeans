//////////////////////////////////
//			SLOT MACHINE		//
//		By - Fallingsheep		//
//		ReWritten for exile		//
////////////////////////////////// 
disableSerialization;

//Variables
SlotsPlayerCredits = 0;
//get players current cash
playerMoney = player getVariable ['ExileMoney', 0];
//Cost of 1 spin
SLOTCOST1SPIN = 1000;
//Cost of 1 spin
SLOTCOST10SPIN = 10000;

//Payouts
PRIZE1 = 500;
PRIZE2 = 750;
PRIZE3 = 1200;
PRIZE4 = 2500;
PRIZE5 = 5000;
PRIZE6 = 7500;
PRIZE7 = 10000;

IsSpinning = false;
reelArray = ["cherry","lemon","grape","watermelon","orange","bar","seven","diamond"];
slotspictures = ["pictures\image1.paa","pictures\image2.paa","pictures\image3.paa","pictures\image4.paa","pictures\image5.paa","pictures\image6.paa","pictures\image7.paa","pictures\image8.paa"];
hasSlotsCredits = false;
	if(IsSpinning)then{
		titleText ["Please wait for current spin!","PLAIN DOWN"]; titleFadeOut 3;
	 } else {
	   if (SlotsPlayerCredits <= 0) then {
		 hasSlotsCredits = false;
		 titleText ["You have no credits!","PLAIN DOWN"]; titleFadeOut 3;
	   }else{
		 hasSlotsCredits = true;
	   };
	   
	   if (hasSlotsCredits) then {
		 IsSpinning = true;
		 //remove credit
		 SlotsPlayerCredits = SlotsPlayerCredits - 1;
		 //update credits display     
		 _dialog = findDisplay 9000;
		 _slotcredits = _dialog displayCtrl 1001;
		 _slotcredits ctrlSetText format["%1",SlotsPlayerCredits];
		 //randomise reels
//loop thru random images on reels
	_counter = 0;
	while {_counter < 15} do
	{
	_dialog = findDisplay 9000;
	_reel1 = _dialog displayCtrl 1200;
	_reel2 = _dialog displayCtrl 1201;
	_reel3 = _dialog displayCtrl 1202;
	ReelImage1 = slotspictures call BIS_fnc_selectRandom;
	ReelImage2 = slotspictures call BIS_fnc_selectRandom;
	ReelImage3 = slotspictures call BIS_fnc_selectRandom;
	_reel1 ctrlSetText ReelImage1;
	_reel2 ctrlSetText ReelImage2;
	_reel3 ctrlSetText ReelImage3;
	sleep 0.01;
		_counter = _counter + 1;
	};
		 //WIN CHANCE
		 SlotsWinChance = random 100;
		 //10% chance to win
		 if(SlotsWinChance < 10) then{
			reel1 = reelArray call BIS_fnc_selectRandom;
			reel2 = reel1;
			reel3 = reel1;
		 }else{
			reel1 = reelArray call BIS_fnc_selectRandom;
			reel2 = reelArray call BIS_fnc_selectRandom;
			reel3 = reelArray call BIS_fnc_selectRandom;
		 };
		 sleep 0.1;
		 //display pictures
		 //reel 1
	_dialog = findDisplay 9000;
	_cherry = "pictures\image1.paa";
	_lemon = "pictures\image2.paa";
	_grape = "pictures\image3.paa";
	_watermelon = "pictures\image4.paa";
	_orange = "pictures\image5.paa";
	_bar = "pictures\image6.paa";
	_seven = "pictures\image7.paa";
	_diamond = "pictures\image8.paa";
	_reel1 = _dialog displayCtrl 1200;
	_reel2 = _dialog displayCtrl 1201;
	_reel3 = _dialog displayCtrl 1202;
	
   if (reel1 == "cherry") then {
	_reel1 ctrlSetText format["%1",_cherry];
   };
   if (reel1 == "lemon") then {
    _reel1 ctrlSetText format["%1",_lemon];
   };
   if (reel1 == "grape") then {
    _reel1 ctrlSetText format["%1",_grape];
   };
   if (reel1 == "watermelon") then {
	_reel1 ctrlSetText format["%1",_watermelon];
   };
   if (reel1 == "orange") then {
    _reel1 ctrlSetText format["%1",_orange];
   };
   if (reel1 == "bar") then {
    _reel1 ctrlSetText format["%1",_bar];
   };
   if (reel1 == "seven") then {
    _reel1 ctrlSetText format["%1",_seven];
   };
   if (reel1 == "diamond") then {
    _reel1 ctrlSetText format["%1",_diamond];
   };
   //reel 2
   if (reel2 == "cherry") then {
    _reel2 ctrlSetText format["%1",_cherry];
   };
   if (reel2 == "lemon") then {
    _reel2 ctrlSetText format["%1",_lemon];
   };
   if (reel2 == "grape") then {
    _reel2 ctrlSetText format["%1",_grape];
   };
   if (reel2 == "watermelon") then {
    _reel2 ctrlSetText format["%1",_watermelon];
   };
   if (reel2 == "orange") then {
    _reel2 ctrlSetText format["%1",_orange];
   };
   if (reel2 == "bar") then {
    _reel2 ctrlSetText format["%1",_bar];
   };
   if (reel2 == "seven") then {
    _reel2 ctrlSetText format["%1",_seven];
   };
   if (reel2 == "diamond") then {
    _reel2 ctrlSetText format["%1",_diamond];
   };
   //reel 3
   if (reel3 == "cherry") then {
    _reel3 ctrlSetText format["%1",_cherry];
   };
   if (reel3 == "lemon") then {
    _reel3 ctrlSetText format["%1",_lemon];
   };
   if (reel3 == "grape") then {
    _reel3 ctrlSetText format["%1",_grape];
   };
   if (reel3 == "watermelon") then {
    _reel3 ctrlSetText format["%1",_watermelon];
   };
   if (reel3 == "orange") then {
    _reel3 ctrlSetText format["%1",_cherry];
   };
   if (reel3 == "bar") then {
    _reel3 ctrlSetText format["%1",_bar];
   };
   if (reel3 == "seven") then {
    _reel3 ctrlSetText format["%1",_seven];
   };
   if (reel3 == "diamond") then {
    _reel3 ctrlSetText format["%1",_diamond];
   };
		 if ((reel1 == reel2) && (reel2 == reel3)) then {
     if (reel1 == "cherry") then {
       titleText ["You won 500","PLAIN DOWN"]; titleFadeOut 3;
		_newMoney = playerMoney + PRIZE1;
			player setVariable ['ExileMoney', _newMoney];
			ExileClientPlayerMoney = _newMoney;
			(owner player) publicVariableClient 'ExileClientPlayerMoney';
			format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
     };
     if (reel1 == "lemon") then {
       titleText ["You won 750","PLAIN DOWN"]; titleFadeOut 3;
		_newMoney = playerMoney + PRIZE2;
			player setVariable ['ExileMoney', _newMoney];
			ExileClientPlayerMoney = _newMoney;
			(owner player) publicVariableClient 'ExileClientPlayerMoney';
			format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
     };
     if (reel1 == "grape") then {
       titleText ["You won 1200","PLAIN DOWN"]; titleFadeOut 3;
		_newMoney = playerMoney + PRIZE3;
			player setVariable ['ExileMoney', _newMoney];
			ExileClientPlayerMoney = _newMoney;
			(owner player) publicVariableClient 'ExileClientPlayerMoney';
			format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
     };
     if (reel1 == "watermelon") then {
       titleText ["You won 2500","PLAIN DOWN"]; titleFadeOut 3;
		_newMoney = playerMoney + PRIZE4;
			player setVariable ['ExileMoney', _newMoney];
			ExileClientPlayerMoney = _newMoney;
			(owner player) publicVariableClient 'ExileClientPlayerMoney';
			format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
     };
     if (reel1 == "orange") then {
       titleText ["You won 5000","PLAIN DOWN"]; titleFadeOut 3;
		_newMoney = playerMoney + PRIZE5;
			player setVariable ['ExileMoney', _newMoney];
			ExileClientPlayerMoney = _newMoney;
			(owner player) publicVariableClient 'ExileClientPlayerMoney';
			format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
     };
     if (reel1 == "bar") then {
       titleText ["You won 7500","PLAIN DOWN"]; titleFadeOut 3;
		_newMoney = playerMoney + PRIZE6;
			player setVariable ['ExileMoney', _newMoney];
			ExileClientPlayerMoney = _newMoney;
			(owner player) publicVariableClient 'ExileClientPlayerMoney';
			format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
     };
     if (reel1 == "seven") then {
       titleText ["Jackpot! You won 10000","PLAIN DOWN"]; titleFadeOut 3;
		_newMoney = playerMoney + PRIZE7;
			player setVariable ['ExileMoney', _newMoney];
			ExileClientPlayerMoney = _newMoney;
			(owner player) publicVariableClient 'ExileClientPlayerMoney';
			format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
     };
     if (reel1 == "diamond") then {
       SlotsPlayerCredits = SlotsPlayerCredits + 3;
	   //update credits display  
	_dialog = findDisplay 9000;
	(_dialog displayCtrl 1001) ctrlSetText format ["%1" ,SlotsPlayerCredits];	   
		ctrlSetText[1001, format ["%1" ,SlotsPlayerCredits]];
       titleText ["You won 3 free spins!","PLAIN DOWN"]; titleFadeOut 3;
     };
   }else{
     titleText ["You lost.","PLAIN DOWN"]; titleFadeOut 3;
   };
   IsSpinning = false;
	   };
	};