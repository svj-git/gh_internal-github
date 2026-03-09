// Grunesky
BEGIN ~rq5grune~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Job5LeaveNow
    SAY ~We are the protectors of this grove. It needs to heal, and any violator of its peace shall be eliminated. Please leave now.~
    IF ~Global("GrovePoisoned","GLOBAL",1)~ THEN REPLY ~Who did poison the grove?~ EXTERN ~rq5paude~ Job5Contract
    IF ~Global("loganjob1","GLOBAL",1) // !CHARNAME Druid/Ranger
        !Class(Player1,DRUID_ALL)
        !Class(Player1,RANGER_ALL)~
        THEN REPLY ~Are you the cause of the animal attacks on Trademeet?~ EXTERN ~rq5arcdr~ Job5FaldornNotDeadYet
    IF ~Global("loganjob1","GLOBAL",2) // CHARNAME Druid/Ranger
        OR (2)
            Class(Player1,DRUID_ALL)
            Class(Player1,RANGER_ALL)~
        THEN REPLY ~This grove needs to heal naturally, not with your spells.~ EXTERN ~rq5arcdr~ Job5Druid
    IF ~Global("loganjob1","GLOBAL",1) // CHARNAME Druid/Ranger
        OR (2)
            Class(Player1,DRUID_ALL)
            Class(Player1,RANGER_ALL)~
        THEN REPLY ~I have been hired to investigate this ritual, and I shall deal with Faldorn.~ EXTERN ~rq5arcdr~ Job5Druid
    IF ~Global("GrovePoisoned","GLOBAL",1)~ THEN REPLY ~So, you druids are trying to heal the grove, so they might attack Trademeet again!~ EXTERN ~rq5paude~ Job5Contract
    IF ~~ THEN REPLY ~Maybe I could help... by fertilizing the grove with your corpses!~ EXTERN ~rq5paude~ Job5Contract
    IF ~~ THEN REPLY ~Then we shall be leaving soon. Just one very, very important question: if I eat a polymorphed druid, is that cannibalism?~ EXTERN ~rq5paude~ Job5Contract
    IF ~Global("itonatold","GLOBAL",1)~ THEN REPLY ~Do you know that Rakshasa are here, right in this area?~ EXTERN ~rq5arcdr~ Job5Rakshasa
END

// Pauden
BEGIN ~rq5paude~

IF ~~ THEN BEGIN Job5Contract
    SAY ~Grunesky, I recognize <HIMHER>! Kill <HIMHER>!~
        IF ~~ THEN EXTERN ~rq5arcdr~ Job5Attacked
END

// Dubovy Archdruid
BEGIN ~rq5arcdr~

IF ~~ THEN BEGIN Job5Rakshasa
    SAY ~*Archdruid takes a long look at you but then talks* Combined with your presence... Grunesky, Pauden! Move out!~
        IF ~~ THEN DO
            ~SetGlobal("rqcontractGrunelensky","GLOBAL",3)~
        EXIT
END

IF ~Dead("CEDRUID2") Dead("CEFGT01") Dead("CEFGT02")~ THEN BEGIN Job5FaldornNotDeadYet
    SAY ~*His eyes focus on you* So you are the <MANWOMAN> that the Shadow Druids went after... Oh, you must be here because of that foolish Faldorn.~
    IF ~~ THEN GOTO Job5DeadShadowDruids
END

IF ~~ THEN BEGIN Job5DeadShadowDruids
    SAY ~We have nothing to do with her, yet we cannot excuse you murdering druids, no matter how foolish their actions are!~
    IF ~~ THEN GOTO Job5Escalation
END

IF ~~ THEN BEGIN Job5Escalation
    SAY ~Leave the grove now and never return, or we shall be forced to kill you!~
    IF ~~ THEN REPLY ~Great! Your blood will be spilled today!~ GOTO Job5Attacked
    IF ~~ THEN REPLY ~Trademeet is being attacked by animals. I have been hired to look into this, so you will let me pass.~ GOTO Job5Attacked
    IF ~~ THEN REPLY ~Why don't we just take step back and perhaps we could negotiate some deal?~ GOTO Job5Attacked
END

// Dubovy Archdruid
IF ~~ THEN BEGIN Job5Druid
    SAY ~You are not one of our circle, so stay away from this. Wait, who sent you?~
    IF ~~ THEN REPLY ~Ashbrought.~ GOTO Job5Druid2
    IF ~~ THEN REPLY ~Nobody, I came because of my own interest.~ GOTO Job5Druid2
END

// Dubovy Archdruid
IF ~~ THEN BEGIN Job5Druid2
    SAY ~In any case, your presence here tells me we have been discovered. Grunesky! Pauden! Let's go!~
        IF ~~ THEN DO
            ~SetGlobal("rqcontractGrunelensky","GLOBAL",3)~
        EXIT
END

IF ~~ THEN BEGIN Job5Attacked
    SAY ~Silvanus aid us!!!~
        IF ~IsValidForPartyDialog("Cernd")~ THEN DO
            ~DisplayStringHead("Cernd",56426)  // No!  What have you done!  You have destroyed everything... this is not what I had intended!  You evil fool... who will stand with me!  This must be punished!
            LeaveParty()
            Enemy()
            ActionOverride("Aerie",LeaveParty())
            ActionOverride("Aerie",Enemy())
            ActionOverride("Cernd",LeaveParty())
            ActionOverride("Cernd",Enemy())
            ActionOverride("Valygar",LeaveParty())
            ActionOverride("Valygar",Enemy())
            ActionOverride("Jaheira",LeaveParty())
            ActionOverride("Jaheira",Enemy())
            ActionOverride("Minsc",LeaveParty())
            ActionOverride("Minsc",Enemy())
            ActionOverride("Keldorn",LeaveParty())
            ActionOverride("Keldorn",Enemy())
            ActionOverride("Mazzy",LeaveParty())
            ActionOverride("Mazzy",Enemy())
            SetGlobal("rqcontract5battle","GLOBAL",1)~ // trigger other neutrals to enemies
        EXIT
        IF ~~ THEN DO
            ~ActionOverride("Aerie",LeaveParty())
            ActionOverride("Aerie",Enemy())
            ActionOverride("Cernd",LeaveParty())
            ActionOverride("Cernd",Enemy())
            ActionOverride("Valygar",LeaveParty())
            ActionOverride("Valygar",Enemy())
            ActionOverride("Jaheira",LeaveParty())
            ActionOverride("Jaheira",Enemy())
            ActionOverride("Minsc",LeaveParty())
            ActionOverride("Minsc",Enemy())
            ActionOverride("Keldorn",LeaveParty())
            ActionOverride("Keldorn",Enemy())
            ActionOverride("Mazzy",LeaveParty())
            ActionOverride("Mazzy",Enemy())
            SetGlobal("rqcontract5battle","GLOBAL",1) // trigger other neutrals to enemies
            Enemy()~
        EXIT
END
