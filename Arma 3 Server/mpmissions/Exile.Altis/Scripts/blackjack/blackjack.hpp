/*Created by Blacklistgaming.org Coder: PapaBear */
 
 #define GUI_GRID_X    (0)
 #define GUI_GRID_Y    (0)
 #define GUI_GRID_W    (0.025)
 #define GUI_GRID_H    (0.04)
 #define GUI_GRID_WAbs    (1)
 #define GUI_GRID_HAbs    (1)
 class BlackjackGUI{	
 idd = 5980; 
	name="black_jack"; 
	movingEnabled = 0; 
	enableSimulation = 1; 
	onLoad = ""; 
	class controlsBackground {			
		class RscFrame_1800: RscText {			
		idc = 5981; 
			colorBackground[] = {0,0,0,0.7}; 
			x = 3 * GUI_GRID_W + GUI_GRID_X; 
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 31 * GUI_GRID_W; 
			h = 20.5 * GUI_GRID_H; 
		}; 
				class RscText_1000: RscText {
				idc = 5988; 
			text = "Dealer"; 

			x = 5 * GUI_GRID_W + GUI_GRID_X; 
			y = 3 * GUI_GRID_H + GUI_GRID_Y; 
			w = 5 * GUI_GRID_W; 
			h = 2 * GUI_GRID_H; 
		}; 
		class RscText_1001: RscText {
		idc = 5989; 
			text = "Player"; 

			x = 20 * GUI_GRID_W + GUI_GRID_X; 
			y = 3 * GUI_GRID_H + GUI_GRID_Y; 
			w = 6 * GUI_GRID_W; 
			h = 2 * GUI_GRID_H; 
		}; 
				class RscText_1012: RscText {			
				idc = 5999; 
			text = "BLACKJACK"; 

			x = 9 * GUI_GRID_W + GUI_GRID_X; 
			y = 1 * GUI_GRID_H + GUI_GRID_Y; 
			w = 18.5 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
			sizeEx = 3 * GUI_GRID_H; 
		}; 
		class RscText_1013: RscText {			
		idc = 6000; 
			text = "Winnings: $"; 

			x = 5.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 15 * GUI_GRID_H + GUI_GRID_Y; 
			w = 5 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
	}; 
	class controls	{		
			class STAY_BTN: RscButtonMenu {			
			idc = 5982; 
			text = "Stay"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[] execVM 'scripts\blackjack\fn_BJstay.sqf';"; 
			x = 20 * GUI_GRID_W + GUI_GRID_X; 
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class HIT_BTN: RscButtonMenu {			
		idc = 5983; 
			text = "Hit"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[] execVM 'scripts\blackjack\fn_BJhit.sqf';";
			x = 27 * GUI_GRID_W + GUI_GRID_X; 
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class TOTAL: RscText {			
		idc = 6007; 
			text = "Total: "; 

			x = 28 * GUI_GRID_W + GUI_GRID_X; 
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class BET_5K: RscButtonMenu {			
		idc = 5984; 
			text = "5K"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[5000] execVM 'scripts\blackjack\fn_BJbet.sqf';";
			x = 6 * GUI_GRID_W + GUI_GRID_X; 
			y = 19 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class BET_10K: RscButtonMenu {			
		idc = 5985; 
			text = "10K"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[10000] execVM 'scripts\blackjack\fn_BJbet.sqf';";
			x = 13 * GUI_GRID_W + GUI_GRID_X; 
			y = 19 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class BET_25K: RscButtonMenu {			
		idc = 5986; 
			text = "25K"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[25000] execVM 'scripts\blackjack\fn_BJbet.sqf';";
			x = 20 * GUI_GRID_W + GUI_GRID_X; 
			y = 19 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class BET_50K: RscButtonMenu {			
		idc = 5987; 
			text = "50K"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "[50000] execVM 'scripts\blackjack\fn_BJbet.sqf';";
			x = 27 * GUI_GRID_W + GUI_GRID_X; 
			y = 19 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Dealer_Card_1: RscText {			
				idc = 5990; 
			x = 5 * GUI_GRID_W + GUI_GRID_X; 
			y = 5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Dealer_Card_2: RscText {			
		idc = 5991; 
			x = 9.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Player_Card_1: RscText {			
		idc = 5992; 
			x = 20.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Player_Card_2: RscText {			
		idc = 5993; 
			x = 24.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Player_Card_3: RscText {			
		idc = 5994; 
			x = 28.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Dealer_Card_4: RscText {			
		idc = 5995; 
			x = 5 * GUI_GRID_W + GUI_GRID_X; 
			y = 8 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Dealer_Card_5: RscText {			
		idc = 5996; 
			x = 9.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 8 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Player_Card_4: RscText {			
		idc = 5997; 
			x = 20.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 8 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class Player_Card_5: RscText {			
		idc = 5998; 
			x = 24.5 * GUI_GRID_W + GUI_GRID_X; 
			y = 8 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
				class Winnings: RscText {			
				idc = 6001; 
			x = 11 * GUI_GRID_W + GUI_GRID_X; 
			y = 15 * GUI_GRID_H + GUI_GRID_Y; 
			w = 5 * GUI_GRID_W; 
			h = 2.5 * GUI_GRID_H; 
		}; 
		class EXIT_BTN: RscButtonMenu {			
		idc = 6002; 
			text = "EXIT"; 

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5}; 
			onButtonClick = "closeDialog 0;"; 
			x = 30 * GUI_GRID_W + GUI_GRID_X; 
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y; 
			w = 4 * GUI_GRID_W; 
			h = 1 * GUI_GRID_H; 
		}; 
		class RscText_1015: RscText {			
		idc = 6003; 
			text = "BET"; 

			x = 7 * GUI_GRID_W + GUI_GRID_X; 
			y = 18 * GUI_GRID_H + GUI_GRID_Y; 
			w = 2 * GUI_GRID_W; 
			h = 1 * GUI_GRID_H; 
		}; 
		class RscText_1016: RscText {			
		idc = 6004; 
			text = "BET"; 

			x = 14 * GUI_GRID_W + GUI_GRID_X; 
			y = 18 * GUI_GRID_H + GUI_GRID_Y; 
			w = 2 * GUI_GRID_W; 
			h = 1 * GUI_GRID_H; 
		}; 
		class RscText_1017: RscText {			
		idc = 6005; 
			text = "BET"; 

			x = 21 * GUI_GRID_W + GUI_GRID_X; 
			y = 18 * GUI_GRID_H + GUI_GRID_Y; 
			w = 2 * GUI_GRID_W; 
			h = 1 * GUI_GRID_H; 
		}; 
		class RscText_1018: RscText {			
		idc = 6006; 
			text = "BET"; 

			x = 28 * GUI_GRID_W + GUI_GRID_X; 
			y = 18 * GUI_GRID_H + GUI_GRID_Y; 
			w = 2 * GUI_GRID_W; 
			h = 1 * GUI_GRID_H; 
		}; 
	}; 
}; 
