BEGIN ~rqdermin~

IF ~~ THEN BEGIN DerminWhatYouDone
    SAY ~What have you done to her? Answer me, you bastard!~
    IF ~~ THEN REPLY ~I killed her a few times, and here is the result.~ GOTO DerminSlayer
    IF ~~ THEN REPLY ~She was my companion, but she turned against me with Galvarey, and I guess her deaths damaged her mind.~ GOTO DerminThreats
    IF ~~ THEN REPLY ~Don't mind her. Are you here to attack me?~ GOTO DerminRemorse
    IF ~~ THEN REPLY ~I have killed her twice already; don't you think that would be cause for discourse?~ GOTO DerminRemorse
    IF ~~ THEN REPLY ~Not this thing again.~ GOTO DerminThreats
END

IF ~~ THEN BEGIN DerminSlayer
    SAY ~Graagh! Slayer of Harpers! You shall know no rest! We shall hound you until you die!~
    IF ~~ THEN REPLY ~The forces of "Good" are attacking me again. Pardon me if I yawn.~ GOTO DerminKilledFew
    IF ~~ THEN REPLY ~Why do persist in attacking me?~ GOTO DerminThreats
END

IF ~~ THEN BEGIN DerminRemorse
    SAY ~Do you have any remorse for what you have done? Know that your execution has been ordered, and you shall know no peace until your last breath.~
    =
    ~Surrender, and I shall make it quick.~
    IF ~~ THEN REPLY ~No, you surrender! Call off your "friends" and run for your life!~ GOTO DerminSurrender
    IF ~~ THEN REPLY ~Why don't you offer me some sort of deal?~ GOTO DerminDeal
END

IF ~~ THEN BEGIN DerminThreats
    SAY ~The situation is very dire for you. In nearby lands, you are the top priority for Harper ambushes.~
    =
    ~Do you realize how grave your condition is?~
    IF ~~ THEN REPLY ~Yesss... I will deal with them with pleasure.~ GOTO DerminKilledFew
    IF ~~ THEN REPLY ~Why don't you just leave with your life and call off this war against me?~ GOTO DerminSurrender
END

IF ~~ THEN BEGIN DerminSurrender
    SAY ~Humanity you have not displayed when dealing with my comrades...~
    IF ~~ THEN REPLY ~I don't have any problem with you, old man, unless you attack me.~ GOTO DerminJaheira
    IF ~~ THEN REPLY ~On second thought, why not just solve our issues with swords?~ GOTO DerminBattle
END

IF ~~ THEN BEGIN DerminJaheira
    SAY ~Yet you have murdered many of us!~
        IF ~~ THEN DO
            ~SetGlobal("rqjaheira4ambush","GLOBAL",1)
            SetGlobal("rqBattle4Start","GLOBAL",1)
            Enemy()~
        EXIT
END

IF ~~ THEN BEGIN DerminKilledFew
    SAY ~You callous piece of filth!~
        IF ~~ THEN DO
            ~SetGlobal("rqjaheira4ambush","GLOBAL",1)
            SetGlobal("rqBattle4Start","GLOBAL",1)
            Enemy()~
        EXIT
END

IF ~~ THEN BEGIN DerminBattle
    SAY ~Yes, we should do that.~
        IF ~~ THEN DO
            ~SetGlobal("rqjaheira4ambush","GLOBAL",1)
            SetGlobal("rqBattle4Start","GLOBAL",1)
            Enemy()~
        EXIT
END

IF ~~ THEN BEGIN DerminDeal
    SAY ~Deal you say Eh? We both know this cannot end without battle. Jeremon! Chrost!~
        IF ~~ THEN DO
            ~SetGlobal("rqjaheira4ambush","GLOBAL",1)
            SetGlobal("rqBattle4Start","GLOBAL",1)
            Enemy()~
        EXIT
END
