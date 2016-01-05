#include"xm8Apps\defines.hpp"
#include"xm8Apps\Xm8Apps.hpp"

//Watermark Logo
class RscTitles {
	#include "VEMFr_client\gui\hpp_mainVEMFrClient.hpp"
	class wm_disp {
		idd = -1;
		onLoad = "uiNamespace setVariable ['wm_disp', _this select 0]";
		fadein = 0;
		fadeout = 0;
		duration = 10e10;
		controlsBackground[] = {};
		objects[] = {};
		class controls {
			class wm_text2 {
				idc = 1;
				x = safeZoneX+0.027;//safeZoneW*0.01;
				y = safeZoneY+safeZoneH-0.16;
				w = 0.151*safeZoneH;
				h = 0.057*safeZoneH;
				shadow = 2;
				class Attributes
				{
					font = "EtelkaNarrowMediumPro";
					color = "#24FFFFFF";
					align = "left"; // put "center" here if you want some background
					valign = "middle";
					shadow = 2;
				};
				colorBackground[] = { 1, 0.3, 0, 0 };  // uncomment and increase 4th number to have a background
				font = "EtelkaNarrowMediumPro";
				size = 0.06*safeZoneH;
				type = 13;
				style = 0;
				text="";
			};
		};
	};
};
//Welcome Message
class CfgSounds
{
    sounds[] = {Intro};
    class Intro
    {
        name = "Intro";
        sound[] = {"\Sounds\Intro.ogg", 1, 1};
        titles[] = {};
    };
};
//VEMF
class cfgFunctions
{
    #include "VEMFr_client\CfgFunctions.hpp"
};