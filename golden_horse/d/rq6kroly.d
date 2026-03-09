BEGIN ~rq6kroly~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN KrolynIntro
    SAY ~Hey friend I am Krolyn and this is my merry band of revelers. How fitting that you have arrived just in time for our main event!~
    IF ~~ THEN REPLY ~This is the the Graveyard district. What is wrong with you?~ GOTO KrolyMercGraveyardReaction
    IF ~~ THEN REPLY ~Are you a Harper?~ GOTO KrolynNotHarper
    IF ~~ THEN REPLY ~Harpers operate alone or in small groups, is that not the truth?~ GOTO KrolynNotHarper
    IF ~~ THEN REPLY ~Can we talk this through? I am sure we could enter into some agreement.~ GOTO KrolynAnger
    IF ~~ THEN REPLY ~Maybe some gold would persuade you or your mercenaries to not notice me.~ EXTERN ~rq6merc~ BribeAttempt
END

IF ~~ THEN BEGIN KrolynAnger
    SAY ~Agreements, you say... I, or any Harper, will never enter into any agreement with the Slayer of Harpers!~
    IF ~~ THEN DO
        ~SetGlobal("rqBattle6Start","GLOBAL",1)
        Enemy()~
    EXIT
END

IF ~~ THEN BEGIN KrolyMercGraveyardReaction
    SAY ~I shall show you what is wrong with murderers like YOU!~
    IF ~~ THEN DO
        ~SetGlobal("rqBattle6Start","GLOBAL",1)
        Enemy()~
    EXIT
END


IF ~~ THEN BEGIN KrolynNotHarper
    SAY ~No, I am not a Harper, though I am not here to chat with the Slayer of Harpers! I am here to end them!~
    IF ~~ THEN DO
        ~SetGlobal("rqBattle6Start","GLOBAL",1)
        Enemy()~
    EXIT
END

IF ~~ THEN BEGIN KrolyMercBribeReaction
    SAY ~You are not behaving properly there! Fall back in line or I shall have words with your leader!~
    IF ~~ THEN GOTO KrolyMercGraveyardReaction
END

BEGIN ~rq6merc~

IF ~~ THEN BEGIN BribeAttempt
    SAY ~How much do you offer?~
    IF ~~ THEN EXTERN ~rq6kroly~ KrolyMercBribeReaction
END
