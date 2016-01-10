//////////////////////////////////
//			SLOT MACHINE		//
//		By - Fallingsheep		//
//		ReWritten for exile		//
////////////////////////////////// 
disableSerialization;

private["ReelImage1","ReelImage2","ReelImage3","fnc_add_1_credits","fnc_add_10_credits","fnc_spin","fnc_payout","fnc_random_pictures","fnc_reset_slots","_newMoney","playerMoney","SlotsPlayerCredits","SLOTCOST1SPIN","SLOTCOST10SPIN","PRIZE1","PRIZE2","PRIZE3","PRIZE4","PRIZE5","PRIZE6","PRIZE7","IsSpinning","reelArray","slotspictures","hasSlotsCredits","reel1","reel2","reel3"]
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
fnc_payout = {
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
		ctrlSetText[1001, format ["%1" ,SlotsPlayerCredits]];
       titleText ["You won 3 free spins!","PLAIN DOWN"]; titleFadeOut 3;
     };
   }else{
     titleText ["You lost.","PLAIN DOWN"]; titleFadeOut 3;
   };
   IsSpinning = false;
};
fnc_add_1_credits = {
if(IsSpinning)then{
		titleText ["Please wait for current spin!","PLAIN DOWN"]; titleFadeOut 3;
	 } else {
	   //check if player has required item
	   if (playerMoney => SLOTCOST1SPIN) then{
		 //remove cost
			_newMoney = playerMoney - SLOTCOST1SPIN;
			player setVariable ['ExileMoney', _newMoney];
			ExileClientPlayerMoney = _newMoney;
			(owner player) publicVariableClient 'ExileClientPlayerMoney';
			format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
		 //add credit
		 SlotsPlayerCredits = SlotsPlayerCredits + 1;
		 //Update credits display
		 ctrlSetText[1001, format ["%1" ,SlotsPlayerCredits]];
	   }else{
		 titleText ["You need 1000 to add 1 credit!","PLAIN DOWN"];
		 titleFadeOut 3;
	   };
   };
};

fnc_add_10_credits = {
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
		 ctrlSetText[1001, format ["%1" ,SlotsPlayerCredits]];
	   }else{
		 titleText ["You need 10000 to add 10 credits!","PLAIN DOWN"]; titleFadeOut 3;
	   };
   };
};

fnc_random_pictures = {
//loop thru random images on reels
	_counter = 0;
	while {_counter < 15} do
	{
	ReelImage1 = slotspictures call BIS_fnc_selectRandom;
	ReelImage2 = slotspictures call BIS_fnc_selectRandom;
	ReelImage3 = slotspictures call BIS_fnc_selectRandom;
	ctrlSetText[1200, format ["%1" ,ReelImage1]];
	ctrlSetText[1201, format ["%1" ,ReelImage2]];
	ctrlSetText[1202, format ["%1" ,ReelImage3]];
	sleep 0.01;
		_counter = _counter + 1;
	};
};

fnc_spin  = {
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
		 ctrlSetText[1001, format ["%1" ,SlotsPlayerCredits]];
		 //randomise reels
		 call fnc_random_pictures;
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
		 call fnc_display_pictures;
		 //check if win or lose
		 call fnc_payout;
	   };
	};
};
fnc_display_pictures = {
//reel 1
   if (reel1 == "cherry") then {
    ctrlSetText [1200, "pictures\image1.paa"];
   };
   if (reel1 == "lemon") then {
    ctrlSetText [1200, "pictures\image2.paa"];
   };
   if (reel1 == "grape") then {
    ctrlSetText [1200, "pictures\image3.paa"];
   };
   if (reel1 == "watermelon") then {
    ctrlSetText [1200, "pictures\image4.paa"];
   };
   if (reel1 == "orange") then {
    ctrlSetText [1200, "pictures\image5.paa"];
   };
   if (reel1 == "bar") then {
    ctrlSetText [1200, "pictures\image6.paa"];
   };
   if (reel1 == "seven") then {
    ctrlSetText [1200, "pictures\image7.paa"];
   };
   if (reel1 == "diamond") then {
    ctrlSetText [1200, "pictures\image8.paa"];
   };
   //reel 2
   if (reel2 == "cherry") then {
    ctrlSetText [1201,"pictures\image1.paa"];
   };
   if (reel2 == "lemon") then {
    ctrlSetText [1201,"pictures\image2.paa"];
   };
   if (reel2 == "grape") then {
    ctrlSetText [1201,"pictures\image3.paa"];
   };
   if (reel2 == "watermelon") then {
    ctrlSetText [1201,"pictures\image4.paa"];
   };
   if (reel2 == "orange") then {
    ctrlSetText [1201,"pictures\image5.paa"];
   };
   if (reel2 == "bar") then {
    ctrlSetText [1201,"pictures\image6.paa"];
   };
   if (reel2 == "seven") then {
    ctrlSetText [1201,"pictures\image7.paa"];
   };
   if (reel2 == "diamond") then {
    ctrlSetText [1201,"pictures\image8.paa"];
   };
   //reel 3
   if (reel3 == "cherry") then {
    ctrlSetText [1202,"pictures\image1.paa"];
   };
   if (reel3 == "lemon") then {
    ctrlSetText [1202,"pictures\image2.paa"];
   };
   if (reel3 == "grape") then {
    ctrlSetText [1202,"pictures\image3.paa"];
   };
   if (reel3 == "watermelon") then {
    ctrlSetText [1202,"pictures\image4.paa"];
   };
   if (reel3 == "orange") then {
    ctrlSetText [1202,"pictures\image5.paa"];
   };
   if (reel3 == "bar") then {
    ctrlSetText [1202,"pictures\image6.paa"];
   };
   if (reel3 == "seven") then {
    ctrlSetText [1202,"pictures\image7.paa"];
   };
   if (reel3 == "diamond") then {
    ctrlSetText [1202,"pictures\image8.paa"];
   };
};


fnc_reset_slots = {
	SlotsPlayerCredits = 0;
	IsSpinning = false;
};

fnc_cash_out = {
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
			call fnc_reset_slots;
		};
	};
};
//randomize images
call fnc_random_pictures;