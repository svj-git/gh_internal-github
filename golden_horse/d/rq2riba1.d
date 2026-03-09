// Ribald ambush Pentarch theatre
EXTEND_BOTTOM RIBALD 0
    IF ~True()
    Global("rqPentachBridgeAmbush2","GLOBAL",2)
    !PartyHasItem("rq2wedrn")
    ~ THEN REPLY ~Do you have ring with Lazurite gem inlay?~ GOTO RibaldTheathre1
END

APPEND RIBALD

    IF ~~ THEN BEGIN RibaldTheathre1
        SAY ~That ring better not be for fool Pentarch; he changes his mind like the weather in Maztica!~
            IF ~~ THEN GOTO RibaldTheathre2
    END

    IF ~~ THEN BEGIN RibaldTheathre2
        SAY ~Do you know how many times he came here to my shop to exchange the ring for another one?~
        IF ~~ THEN REPLY ~I don't know but I am sure you will tell me.~ GOTO RibaldTheathre3
    END

    IF ~~ THEN BEGIN RibaldTheathre3
        SAY ~17 times! Blasted brain-addled idiot!~
        IF ~~ THEN REPLY ~I still want that ring Ribald.~ GOTO RibaldTheathre4
    END

    IF ~~ THEN BEGIN RibaldTheathre4
        SAY ~Alright, alright, apologies for the outburst, but people like that can get on my nerves.~
        IF ~~ THEN REPLY ~Sure give me the ring.~ GOTO RibaldRingSell
        IF ~~ THEN REPLY ~We shall see he seems very emotional, Now how about that ring?~ GOTO RibaldRingSell
        IF ~~ THEN REPLY ~So that's why he was so desperate for my help, though I still want finish this quest to get my reward.~ GOTO RibaldRingSell
    END

    IF ~~ THEN BEGIN RibaldRingSell
        SAY ~That would be 120 gold. That idiot better not send you to replace this ring for gods know what ring this time.~
        IF ~PartyGoldGT(119)~ THEN REPLY ~Ill take it.~ GOTO RibaldGetRing
        IF ~PartyGoldLT(120)~ THEN REPLY ~I don't have that kind of money right now.~ GOTO RibaldNoMoney
    END

    IF ~~ THEN BEGIN RibaldGetRing
        SAY ~Here it is, dear customer. Pleasure doing business with you.~
            IF ~~ THEN DO
                ~TakePartyGold(120)
                GiveItemCreate("rq2wedrn",LastTalkedToBy,0,0,0)~
            EXIT
    END

    IF ~~ THEN BEGIN RibaldNoMoney
        SAY ~Pentarch said this the first time he was here! Farewell!~
        IF ~~ THEN DO
            ~SetGlobal("rqRingPurchaseFailed2","GLOBAL",1)~
        EXIT
    END
END




