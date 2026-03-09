BEGIN ~rq1marca~

IF ~Global("rqcontractMarcian","GLOBAL",1)~ THEN BEGIN rqMarcianArgentIntroduction
    SAY ~Why do you bother me?~
    IF ~~ THEN REPLY ~I was told a man named Marcian Argent is in this area.~ GOTO rqMarcianArgentNeutral
    IF ~OR (2)
        Class(Player1,CLERIC_ALL)
        Class(Player1,MAGE_ALL)
    CheckStatGT(LastTalkedToBy,16,CHR)~ THEN REPLY ~You there, I am searching for corpses or bones for my spells have you seen any useful remains for me to utilize?~ GOTO rqMarcianArgentBluff
    IF ~~ THEN REPLY ~I have been hired to kill man named Marcian Argent.~ GOTO rqMarcianArgentDirect
END

IF ~~ THEN BEGIN rqMarcianArgentNeutral
    SAY ~Who are you and what do you want with him?~
    IF ~~ THEN REPLY ~Just his head separated from body.~ GOTO rqMarcianArgentBattle
    IF ~~ THEN REPLY ~Thanks for confirming who you are.~ GOTO rqMarcianArgentBattle
END

IF ~~ THEN BEGIN rqMarcianArgentBattle
    SAY ~Whelp! We shall get the information who sent you from your half dead body!~
        IF ~~ THEN DO
            ~SetGlobal("rqcontract1battle","GLOBAL",1)~
        EXIT
END

IF ~~ THEN BEGIN rqMarcianArgentDirect
    SAY ~Men! Drawl steel!~
        IF ~~ THEN DO
            ~SetGlobal("rqcontract1battle","GLOBAL",1)~
        EXIT
END

IF ~~ THEN BEGIN rqMarcianArgentBluff
    SAY ~We saw some corpses in nearby chamber.~
    IF ~CheckStatLT(Player1,18,CHR)~ THEN REPLY ~We have a map here, can you mark it on our map?~ GOTO rqMarcianArgentCaught
    IF ~CheckStatGT(Player1,17,CHR)
        CheckStatGT(Player1,15,DEX)
        See("rqrev")
        Inparty("rqrev")
        !StateCheck("rqrev",STATE_SLEEPING)~
        THEN REPLY ~*Secretly, with your hand, only you motion Revan to attack.* We have a map here, can you mark it on our map?~
            DO  ~ActionOverride("rqrev",ForceSpellPointRES("rqmararf",[474.3520])
                SetGlobal("rqcontract1battle","GLOBAL",1)
                Wait(1)~
            EXIT
    IF ~CheckStatGT(Player1,17,CHR)
        CheckStatGT(Player1,15,DEX)
        !See("rqrev")
        Inparty("rqrev")
        !StateCheck("rqrev",STATE_SLEEPING)
        ~
        THEN REPLY ~*Secretly, with your hand, only you motion Revan to attack.* We have a map here, can you mark it on our map?~ GOTO rqMarcianArgentCaught
END

IF ~~ THEN BEGIN rqMarcianArgentCaught
    SAY ~Silly trick! Men, Attack!~
        IF ~~ THEN DO
            ~SetGlobal("rqcontract1battle","GLOBAL",1)~
        EXIT
END

