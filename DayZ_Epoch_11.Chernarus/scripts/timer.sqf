_timetowait = _this select 0;
while {_timetowait > 0} do
{
   if (_timetowait != 1) then
   {
      cutText[format["%1 minutes left", _timetowait], "PLAIN DOWN"];
   }
   else
   {
      cutText["One minute left", "PLAIN DOWN"];
   };
   Sleep(60);
   _timetowait = _timetowait - 1;

}
timesover = true;
Timerstarted = false;
AGN_enteredSafezone = false;

PublicVariable "timesover";
