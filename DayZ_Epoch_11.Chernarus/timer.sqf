 systemChat("Timer Called");
timetowait = 2;//how long before god mode is reapplied
while {timetowait > 0} do
{
   if (timetowait != 1) then
   {
      cutText[format["%1 minutes left", timetowait], "PLAIN DOWN"];
   }
   else
   {
      cutText["One minute left", "PLAIN DOWN"];
   };
   Sleep(60);
   timetowait = timetowait - 1;
};

timer_over = true;
PublicVariable "timer_over"; // so we can check it from the safezone script
PublicVariable "timetowait"; //so we can reset it in safezone script
