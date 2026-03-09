BEGIN ~rq2kamra~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN rq2jobppl
    SAY ~Halt! We were supposed to meet with the Cowled Wizards. What's going on here?~
    IF ~~ THEN REPLY ~Well, it appears you shall have your meeting, but not with the Cowled Wizards, rather with me, a delegate of death!~ GOTO Job2Attacked
    IF ~~ THEN REPLY ~Apologies, I am not a Cowled Wizard. I shall leave now~ GOTO Job2LeaveNow
END

IF ~~ THEN BEGIN Job2LeaveNow
    SAY ~Yes, yes trouble us no more.~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Job2Attacked
    SAY ~We are under attack!~
    IF ~~ THEN DO
        ~SetGlobal("rqcontract2battle","GLOBAL",1)~
    EXIT
END

IF ~Global("rqcontract2battle","GLOBAL",0)~ THEN BEGIN Job2RepeatedTalk
    SAY ~What is it this time! Can't you see we are busy... Men! Lets teach this moron a lesson!~
    IF ~~ THEN DO
        ~SetGlobal("rqcontract2battle","GLOBAL",1)~
    EXIT
END

