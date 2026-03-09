// Saradush temple ambush
EXTEND_BOTTOM SARTEM01 0

IF ~Dead("rqjah135")~ THEN REPLY ~What do you know about the woman who ambushed me?~ GOTO JaheiraTobAmbushTalk1
END

APPEND SARTEM01

    IF ~~ THEN BEGIN JaheiraTobAmbushTalk1
        SAY ~I do not know her at all. I just let her stay here; I assumed she sought shelter from the besieging army.~
        IF ~~ THEN REPLY ~Is that all? Are you telling everything?~ GOTO JaheiraTobAmbushTalk2
    END

    IF ~~ THEN BEGIN JaheiraTobAmbushTalk2
        SAY ~She arrived just a few hours before you came here. I never saw her before; we talked just once. I asked her if she needed help.~
        IF ~~ THEN REPLY ~How did she arrive just a few hours ago when there is no way in or out of Saradush?~ GOTO JaheiraTobAmbushTalk3
    END

    IF ~~ THEN BEGIN JaheiraTobAmbushTalk3
        SAY ~I do not know; perhaps she arrived before the siege?~
        IF ~~ THEN REPLY ~Thanks, she definitely did not. Farewell.~ DO ~SetGlobal("rqJaheiraSaradushReaction","GLOBAL",1)~ EXIT
        IF ~~ THEN REPLY ~Okay, show me your services.~
            DO
                ~SetGlobal("rqJaheiraSaradushReaction","GLOBAL",1)
                StartStore("sartem01",LastTalkedToBy())~ // Waukeen's Wares
            EXIT
        IF ~~ THEN REPLY ~I don't know if you were associated with her, but I cannot take any chances. Prepare to meet your god, priestess!~
            DO
                ~SetGlobal("rqJaheiraSaradushReaction","GLOBAL",1)
                ActionOverride("sartem01",Enemy())~
            EXIT
    END
END
