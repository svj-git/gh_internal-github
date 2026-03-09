BEGIN ~rqlyngre~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN rqStoreIntro
    SAY ~Greetings, most enlightened <LADYLORD>. I am a merchant. I suppose your next question would be, "What am I doing here?" This Watcher's Keep must be filled to the brim with magic, which I am willing to purchase for a good price.~
    IF ~~ THEN REPLY ~Maybe I will take a look.~ GOTO rqStoreStart
    IF ~~ THEN REPLY ~Not right now.~ EXIT
END

IF ~NumTimesTalkedToGT(0) NumTimesTalkedToLT(2)~ THEN BEGIN rqStoreSecond
    SAY ~You are back! Surely you have noticed that I give you a better price for your goods while I am here!~
    IF ~~ THEN REPLY ~Alright.~ GOTO rqStoreStart
    IF ~~ THEN REPLY ~Not now. Farewell.~ EXIT
END

IF ~NumTimesTalkedToGT(1)~ THEN BEGIN rqStoreThird
    SAY ~My favorite customer is here! Let's talk business.~
    IF ~~ THEN REPLY ~Yes, let's do that.~ GOTO rqStoreStart
    IF ~~ THEN REPLY ~Maybe later. Farewell.~ EXIT
END

IF ~~ THEN BEGIN rqStoreStart
    SAY ~Excellent! I knew you were a highly intelligent individual, capable of seizing smart opportunities the moment I saw you.~
        IF ~~ THEN DO ~StartStore("rqlyngre",LastTalkedToBy())~ EXIT  // Merchant
END
