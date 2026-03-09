BEGIN ~rq4grosh~

IF ~Global("rqwaukenambush4","GLOBAL",1)
    InParty("rqrev")
    !Dead("rqrev")~
    THEN BEGIN 6
    SAY ~Go away beggar we have impor.... Oh no! He here attack!~
    IF ~~ THEN EXTERN ~rq4essli~ 7 //WaukeenAmbushTheater2

END

IF ~~ THEN BEGIN 8
    SAY ~What!? He not murder us before!?~
    IF ~~ THEN EXTERN ~rq4essli~ 9
END

IF ~~ THEN BEGIN EsslinsWarningGrosh
    SAY ~They murderers and you want talk talk?!~
    IF ~~ THEN EXTERN ~rq4essli~ 10 //WaukeenAmbushNegotiation11
END


IF ~~ THEN BEGIN 11 //GroshnakhAmbushAttackCry6
    SAY ~You attack us?! Groshnakh KILL KILL KILL!!!~
    IF ~~ THEN EXTERN ~rq4essli~ 15 //WaukeenAmbushEsslinReaction7
END

IF ~~ THEN BEGIN 12 //GroshnakhDisbelief8
    SAY ~HAAHAHAAHAA.. can't believe that worked ATTACK!! KILL! KILL! KILL!!!!~
        IF ~~ THEN DO
            ~SetGlobal("rq4AmbushBattle","GLOBAL",1)
            SetGlobal("rqRevanMintiper","GLOBAL",1)
            Enemy()~
        EXIT
END

IF ~~ THEN BEGIN 14 //GroshnakhAmbushNegotiationAttackHim9
    SAY ~RRRRAAAAGHHH!!!! I HAD ENOUGH! THEY IS DEAD!!~
    IF ~~ THEN EXTERN ~rq4essli~ 15 //WaukeenAmbushEsslinReaction7
END

IF ~~ THEN BEGIN 13 //GroshnakhAmbushPeace10
    SAY ~YOU PRICK! YOU DIE NOW!!~
    IF ~~ THEN EXTERN ~rq4essli~ 15 //WaukeenAmbushEsslinReaction7
END
