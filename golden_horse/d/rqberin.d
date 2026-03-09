BEGIN ~rqberin~

IF ~~ THEN BEGIN BerinvarWhatIDidNot
    SAY ~What? I did not.~
    IF ~~ THEN REPLY ~So what do you want?~ EXTERN ~rqjah2~ JaheiraSaysDie
END

IF ~~ THEN BEGIN BerinvarPleaseLeave1
    SAY ~Please! Let's leave. You are clearly unwell.~
    IF ~~ THEN EXTERN ~rqjah2~ JaheiraWeird
END

IF ~~ THEN BEGIN BerinvarPleaseLeave2
    SAY ~Just leave this one alone, and you can live and have your revenge later!~
    IF ~~ THEN EXTERN ~rqjah2~ JaheiraWeird2
END

IF ~~ THEN BEGIN BerinvarDamn
    SAY ~Damn it!~
        IF ~~ THEN
        DO ~SetGlobal("rqBattle2Start","GLOBAL",1)
            SetGlobal("rqJaheira2Ambush","GLOBAL",1)
            Enemy()~
        EXIT
END
