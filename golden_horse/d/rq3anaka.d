BEGIN ~rq3anaka~

IF ~Global("rqcontractAnakarhysse","GLOBAL",1)~ THEN BEGIN rq3jobppl
    SAY ~Hey! *Man turns around to face you with smile, but quickly his face turns into a wary scowl.* So they hired some muscle to force us out.~
    IF ~~ THEN REPLY ~That's good because I wanted a fight.~ GOTO Job3Scamming0
    IF ~~ THEN REPLY ~Apologies. I don't know what you are talking about.~ GOTO Job3Scamming0
    IF ~~ THEN REPLY ~Why is there a contract for your deaths?~ GOTO Job3Scamming0
END

IF ~~ THEN BEGIN Job3Scamming0
    SAY ~Could you do one thing before I die? Could you tell us how much you get for our deaths?~
    IF ~~ THEN REPLY ~4000 gold.~ GOTO Job3Scamming1
END

IF ~~ THEN BEGIN Job3Scamming1
    SAY ~Isn't that too little? I recall there was 20,000 gold on our heads before.~
    IF ~~ THEN GOTO Job3Scamming2
END

IF ~~ THEN BEGIN Job3Scamming2
    SAY ~If I were you, I would go back to the contractor and demand more gold for your work.~
    IF ~CheckStatLT(Player1,9,INT)~ THEN REPLY ~Will you be here when I return?~ GOTO Job3Scamming3
    IF ~CheckStatGT(Player1,8,INT)~ THEN REPLY ~Ha! Yeah, I'll go... Draw steel!~
        DO ~SetGlobal("rqcontract3battle","GLOBAL",1)~
        EXIT
END

IF ~~ THEN BEGIN Job3Scamming3
    SAY ~Yes, I will. Where else could I go?~
    IF ~~ THEN REPLY ~Okay.~
        DO
            ~EscapeArea()
            ActionOverride("rqberkri",EscapeArea())
            SetGlobal("rqcontractAnakarhysse","GLOBAL",3)
            SetGlobal("rqcontractbotched","GLOBAL",1)~
        EXIT
END
