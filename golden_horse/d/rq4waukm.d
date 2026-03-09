BEGIN ~rq4waukm~

IF ~NumTimesTalkedTo(0)~
    THEN BEGIN  WaukenMessenger
    SAY ~Apologies for the interruption, <LADYLORD> <CHARNAME>. Esslin invites you and Revan for a parley. You can locate them here in the promenade, near the stall just outside the promenade itself. Goodbye and farewell.~
        IF ~~ THEN DO
            ~SetGlobal("rqwaukenambush4","GLOBAL",1)
            EscapeArea()~
            UNSOLVED_JOURNAL
            ~Protect Revan from assassins

            Messenger in Waukeens Promenade has passed on to me invitation to appear in northwest near stall, outside the promenade itself to discuss peace. I smell an ambush.~
        EXIT
END
