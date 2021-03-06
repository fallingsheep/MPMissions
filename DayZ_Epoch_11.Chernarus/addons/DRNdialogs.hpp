class DRN_DIALOG
{
	idd=-1;
	movingenable=true;
	class Controls
	{
		class btnChernogorsk: RscButton
		{
			idc = 1600;
			text = "Cherno";
			x = 0.280228 * safezoneW + safezoneX;
			y = 0.382577 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 0;";
		};
		class btnElectrozavodsk: RscButton
		{
			idc = 1601;
			text = "Electro";
			x = 0.368967 * safezoneW + safezoneX;
			y = 0.382576 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 1";
		};
		class btnBaltoa: RscButton
		{
			idc = 1602;
			text = "Balota";
			x = 0.573809 * safezoneW + safezoneX;
			y = 0.382576 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 3;";
		};
		class btnBerezino: RscButton
		{
			idc = 1603;
			text = "Berezino";
			x = 0.661719 * safezoneW + safezoneX;
			y = 0.382578 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 5;";
		};
		class btnKamenka: RscButton
		{
			idc = 1604;
			text = "Kamenka";
			x = 0.471803 * safezoneW + safezoneX;
			y = 0.382576 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 2;";
		};
				class btnKamyshovo: RscButton
		{
			idc = 1605;
			text = "Kamyshovo";
			x = 0.280228 * safezoneW + safezoneX;
			y = 0.542496 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 4";
		};
		class btnKrasnostav: RscButton
		{
			idc = 1606;
			text = "Krasnostav";
			x = 0.280228 * safezoneW + safezoneX;
			y = 0.687876 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 7";
		};
		class btnGrishino: RscButton
		{
			idc = 1607;
			text = "Grishino";
			x = 0.662548 * safezoneW + safezoneX;
			y = 0.542496 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 9;";
		};
		class btnKabino: RscButton
		{
			idc = 1608;
			text = "Kabino";
			x = 0.662548 * safezoneW + safezoneX;
			y = 0.688995 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 12;";
		};
		class btnPusta: RscButton
		{
			idc = 1609;
			text = "Pusta";
			x = 0.368966 * safezoneW + safezoneX;
			y = 0.688995 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 11;";
		};
		class btnRand: RscButton
		{
			idc = 1610;
			text = "Random";
			x = 0.470144 * safezoneW + safezoneX;
			y = 0.688995 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 13;";
		};
		class btnVybor: RscButton
		{
			idc = 1611;
			text = "Vybor";
			x = 0.57381 * safezoneW + safezoneX;
			y = 0.688995 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 10;";
		};
		class btnSolinchiny: RscButton
		{
			idc = 1612;
			text = "Solinchiny";
			x = 0.368137 * safezoneW + safezoneX;
			y = 0.542496 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 6;";
		};
		class btnGorka: RscButton
		{
			idc = 1613;
			text = "Gorka";
			x = 0.572981 * safezoneW + safezoneX;
			y = 0.543614 * safezoneH + safezoneY;
			w = 0.0594477 * safezoneW;
			h = 0.027978 * safezoneH;
			action = "closeDialog 0;drnspawn = 8;";
		};
		class mapCherno: RscPicture
		{
			idc = 1214;
			text = "";
			x = 0.340983 * safezoneW + safezoneX;
			y = 0.23125 * safezoneH + safezoneY;
			w = 0.30876 * safezoneW;
			h = 0.531375 * safezoneH;
		};
		class picCherno: RscPicture
		{
			idc = 1200;
			text = "addons\Cherno.paa";
			x = 0.281057 * safezoneW + safezoneX;
			y = 0.289757 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picElectro: RscPicture
		{
			idc = 1201;
			text = "addons\Electro.paa";
			x = 0.369795 * safezoneW + safezoneX;
			y = 0.289758 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picKamenka: RscPicture
		{
			idc = 1202;
			text = "addons\Kamenka.paa";
			x = 0.471803 * safezoneW + safezoneX;
			y = 0.289757 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picBaltoa: RscPicture
		{
			idc = 1203;
			text = "addons\Balota.paa";
			x = 0.575468 * safezoneW + safezoneX;
			y = 0.289757 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picBerezino: RscPicture
		{
			idc = 1204;
			text = "addons\Berezino.paa";
			x = 0.662548 * safezoneW + safezoneX;
			y = 0.289757 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picKrasnostav: RscPicture
		{
			idc = 1205;
			text = "addons\Krasnostav.paa";
			x = 0.281058 * safezoneW + safezoneX;
			y = 0.596175 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picPusta: RscPicture
		{
			idc = 1206;
			text = "addons\Pusta.paa";
			x = 0.369796 * safezoneW + safezoneX;
			y = 0.597293 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picRandom: RscPicture
		{
			idc = 1207;
			text = "addons\Random.paa";
			x = 0.470973 * safezoneW + safezoneX;
			y = 0.597294 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picVybor: RscPicture
		{
			idc = 1208;
			text = "addons\Vybor.paa";
			x = 0.574639 * safezoneW + safezoneX;
			y = 0.596175 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picKabino: RscPicture
		{
			idc = 1209;
			text = "addons\Kabino.paa";
			x = 0.663377 * safezoneW + safezoneX;
			y = 0.595057 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picKamyshovo: RscPicture
		{
			idc = 1210;
			text = "addons\Kamyshovo.paa";
			x = 0.281886 * safezoneW + safezoneX;
			y = 0.446321 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picGrishino: RscPicture
		{
			idc = 1211;
			text = "addons\Grishino.paa";
			x = 0.662548 * safezoneW + safezoneX;
			y = 0.447439 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picSolinchiny: RscPicture
		{
			idc = 1212;
			text = "addons\Solnichiny.paa";
			x = 0.368137 * safezoneW + safezoneX;
			y = 0.448558 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class picGorka: RscPicture
		{
			idc = 1213;
			text = "addons\Gorka.paa";
			x = 0.573811 * safezoneW + safezoneX;
			y = 0.448558 * safezoneH + safezoneY;
			w = 0.0586185 * safezoneW;
			h = 0.0883669 * safezoneH;
		};
		class lblMap: RscText
		{
			idc = 1000;
			text = "Select spawn area";
			x = 0.447753 * safezoneW + safezoneX;
			y = 0.256207 * safezoneH + safezoneY;
			w = 0.10589 * safezoneW;
			h = 0.0447527 * safezoneH;
		};
	};
};
