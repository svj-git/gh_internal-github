BEGIN ~rqmalch~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Malchor
    SAY ~Greetings again. It is I, Malchor Harpell, a friend of the Harpers.~
    =
    ~I believe you are in possession of Harper gear. If you would be so kind as to hand it over, I would be very grateful.~
    IF ~~ THEN REPLY ~Most esteemed mage Malchor, we don't have the items you are looking for. You should turn back and leave.~ GOTO MalchorDifficult
    IF ~~ THEN REPLY ~Why would I give up these items to you?~ GOTO MalchorDifficult
    IF ~~ THEN REPLY ~Okay here you go.~
        DO
            ~TakePartyItem("misc5x") // Harper Pin
            TakePartyItem("amul28") // Amulet of Master Harper
            TakePartyItem("sw1h50")~ // Shazzelim + 1
        GOTO MalchorEasy
END

IF ~~ THEN BEGIN MalchorDifficult
    SAY ~I will not let you interfere with my mission! Give them to me now!~
    IF ~~ THEN EXTERN ~rqjah5~ Jaheira4Attack
END

IF ~~ THEN BEGIN MalchorEasy
    SAY ~That was easier than I thought… Wonderful… wonderful… Now Jaheira wants her amulet. Please describe it, Jaheira.~
    IF ~~ THEN EXTERN ~rqjah5~ Jaheira4Amulet
END

IF ~~ THEN BEGIN MalchorBattle
    SAY ~I wish to make this deal as quick and painless as possible!~
    IF ~~ THEN EXTERN ~rqjah5~ Jaheira4Attack
END

IF ~~ THEN BEGIN MalchorAmuletWants
    SAY ~You have the description now. Please give it back.~
    IF ~~ THEN REPLY ~We don't have it!~ GOTO MalchorBattle
    IF ~~ THEN REPLY ~You bitch! Why did you tell that to the…~ EXTERN ~rqjah5~ Jaheira4Attack
    IF ~~ THEN REPLY ~Go and do shakedown on someone else!~ GOTO MalchorBattle
    IF ~~ THEN REPLY ~You are a fool, Malchor. She is just using you to get her revenge!~ GOTO MalchorBattle
    IF ~~ THEN REPLY ~I do not ha…~ EXTERN ~rqjah5~ Jaheira4Attack
END
