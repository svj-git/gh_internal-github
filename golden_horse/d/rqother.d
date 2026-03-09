I_C_T BODHI 6 RevBodhiDeal
== rqrevJ IF ~IsValidForPartyDialog("rqrev")~ THEN ~I like her offer much more than the Shadow Thieves' offer. Not to mention the fact the Shadow Thieves love to stab their "allies" or "friends" in the back.~
END

I_C_T HELLJON 7 RevIrenicus
== rqrevJ IF ~IsValidForPartyDialog("rqrev")~ THEN ~Even you recognize that your end is near.~
END

I_C_T HELLJON 8 RevIrenicus
== rqrevJ IF ~IsValidForPartyDialog("rqrev")~ THEN ~Even you recognize that your end is near.~
END

I_C_T HELLJON 9 RevIrenicus
== rqrevJ IF ~IsValidForPartyDialog("rqrev")~ THEN ~Even you recognize that your end is near.~
END

I_C_T HELLJON 10 RevIrenicus
== rqrevJ IF ~IsValidForPartyDialog("rqrev")~ THEN ~Even you recognize that your end is near.~
END

INTERJECT_COPY_TRANS PLAYER1 25 RevanInHell
== rqrevJ IF ~IsValidForPartyDialog("rqrev")~ THEN ~Your pull has dragged me... here... Is this Hell? Isn't it? No matter. We shall finish him off even in this infernal place.~
END

INTERJECT_COPY_TRANS FINSOL01 27 RevanDivinity
== rqrev25J IF ~IsValidForPartyDialog("rqrev")~ THEN ~Why are you looking at me? Take the power that you have wrested from the jaws of destiny! If you fail to do so, all this work you have done will be for nothing!~
END

EXTEND_TOP FATESP 6 #1
  IF ~!Dead("rqrev")
        !InMyArea("rqrev")
        !Class("rqrev",FIGHTER_MAGE_THIEF)
        Global("rqRevanSummoned","GLOBAL",0)~ THEN REPLY ~Bring me Revan, the elven thief/mage.~
    DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
        Wait(2)
        CreateCreature("rqrev25",[1999.1228],0)
        SetGlobal("rqRevanSummoned","GLOBAL",1)~ GOTO 8
  IF ~!Dead("rqrev")
        !InMyArea("rqrev")
        Class("rqrev",FIGHTER_MAGE_THIEF)
        Global("rqRevanSummoned","GLOBAL",0)~ THEN REPLY ~Bring me Revan, the elven fighter/mage/thief.~
    DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
        Wait(2)
        CreateCreature("rqrev25",[1999.1228],0)
        SetGlobal("rqRevanSummoned","GLOBAL",1)~ GOTO 8
END

INTERJECT_COPY_TRANS RENFELD 3 RevanRenfeld
== rqrevJ IF ~IsValidForPartyDialog("rqrev")~ THEN ~That is a Harper-owned building. Let's take him there. I am curious what their reaction will be.~
END


EXTEND_BOTTOM PLAYER1 33
IF ~IsValidForPartyDialog("rqrev")~ THEN DO ~~ GOTO RevanMercenary
END
/*
EXTEND_BOTTOM PLAYER1 33
IF ~IsValidForPartyDialog("rqrev")~ THEN DO ~~ GOTO RevanMercenary
END
*/
APPEND PLAYER1
IF ~~ RevanMercenary
SAY ~You eye the mercenary Revan Artecratos. Will he risk his life this time, or will he leave, not wanting to risk his neck?~
    IF ~~ THEN REPLY ~It is for you to decide, Revan. Are you with me or are you not?~ EXTERN ~rqrevJ~ reasoning
    IF ~~ THEN REPLY ~Revan, you don't need to do this...~ EXTERN ~rqrevJ~ reasoning
END
END

APPEND rqrevJ
IF ~~ reasoning
    SAY ~<CHARNAME>, following you has brought me power, magic, and wealth. Why would I not go and finish off the wizard that you have foiled at every turn and who is cornered here like a rat?~
COPY_TRANS PLAYER1 33
END
END

