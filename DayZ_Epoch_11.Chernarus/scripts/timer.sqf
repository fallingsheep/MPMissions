
_timetowait = _this select 0;
while {_timetowait > 0} do{
   if (_timetowait != 1) then {
    //tell player how long is left before godmode will be reapplied
      // uncomment the below line (delete the // ) if your time limit is 3 minutes or more
	 //systemChat ("[AGN] Antispam - %1 minutes left", _timetowait);
   }else{
   //tell player how long is left before godmode will be reapplied
   systemChat ("[AGN] Antispam - 1 minute left", _timetowait);
   };
   Sleep(60);
   _timetowait = _timetowait - 1;
};
timesover = true;
PublicVariable "timesover";