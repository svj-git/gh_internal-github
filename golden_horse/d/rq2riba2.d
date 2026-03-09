// Ribald had no money
EXTEND_BOTTOM RIBALD 0

IF ~True()
    Global("rqpentachbridgeambush2","GLOBAL",2)
    Global("rqRingPurchaseFailed2","GLOBAL",1)
    PartyGoldGT(119)
    !PartyHasItem("rq2wedrn")~ THEN REPLY ~I wish to purchase ring for Pentarch.~ GOTO RibaldGet2ndRing
END

APPEND RIBALD

    IF ~~ THEN BEGIN RibaldGet2ndRing
        SAY ~Here it is, dear customer. Pleasure doing business with you.~
            IF ~~ THEN DO
                ~TakePartyGold(120)
                GiveItemCreate("rq2wedrn",LastTalkedToBy,0,0,0)
                SetGlobal("rqRingPurchaseFailed2","GLOBAL",2)~
            EXIT
    END
END
