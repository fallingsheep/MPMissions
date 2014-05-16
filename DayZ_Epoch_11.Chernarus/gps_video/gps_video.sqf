    // Custom GPS Video Script - BY Josho - FOR Opendayz.net - Public USE!
    waitUntil { alive player };
    waituntil {!isnull (finddisplay 46)};
    sleep 40;
    _CustomGpsVideo = ["gps_video\intro_video.ogv",1.04] spawn bis_fnc_customGPSvideo;