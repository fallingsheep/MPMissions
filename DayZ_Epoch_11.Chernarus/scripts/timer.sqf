//sheeps 2 min timer
Timercalled = true;
timesover = false;
if( Timercalled ){
	systemChat ("[AGN] Antispam - 2 minutes left");
	Sleep(60);//wait 1 min
	systemChat ("[AGN] Antispam - 1 minute left");
	Sleep(60);//wait 1 min
	timesover = true;
};
PublicVariable "timesover";