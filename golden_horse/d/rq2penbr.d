BEGIN ~rq2penbr~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN PentarchBridgeIntro
    SAY ~Blasted stubborn Ribald! Thrice be dammed!~
    IF ~~ THEN REPLY ~Why are you talking to me?~ GOTO PentarchBridgeName
    IF ~~ THEN REPLY ~Yes.. perhaps revolt against high prices in Athkatla would be in order.~ GOTO PentarchBridgeName
    IF ~~ THEN REPLY ~Why yes his prices are bit high.~ GOTO PentarchBridgeName
    IF ~~ THEN REPLY ~What seems to be problem?~ GOTO PentarchBridgeName
END

IF ~~ THEN BEGIN PentarchBridgeName
    SAY ~Ah. Apologies <PRO_SIRMAAM>, my name is Pentarch d'Arquile, and my daughter is getting married, but we cannot proceed with the preparations because I don't have the wedding ring.~
    IF ~~ THEN GOTO PentarchBridgePlea
END

IF ~~ THEN BEGIN PentarchBridgePlea
    SAY ~I am getting desperate. Please, stranger, help me.~
    IF ~~ THEN REPLY ~Something doesn't add up why would Ribald not sell you the ring?~ GOTO PentarchBridgeExplains
END

IF ~~ THEN BEGIN PentarchBridgeExplains
    SAY ~Ah, my daughter, the flower of my life, has changed her mind a few times... and now Ribald is reluctant to replace the ring with Lazurite inlay... please just help me get the ring from him.~
    IF ~~ THEN REPLY ~So what will you give me for my effort of fixing relations with very important merchant as Ribald?~ GOTO PentarchBridgeReward
    IF ~~ THEN REPLY ~Not really interested in your schemes, Farewell.~ GOTO PentarchBridgeBegging1
END

IF ~~ THEN BEGIN PentarchBridgeBegging1
    SAY ~No! Please help, I beg you. *tears start to well in his eyes*~
    IF ~~ THEN REPLY ~Maybe if you could give me some reward.~ GOTO PentarchBridgeReward
    IF ~~ THEN REPLY ~I don't have time for this nonsense.~ GOTO PentarchBridgeQuestBegging3
END

IF ~~ THEN BEGIN PentarchBridgeReward
    SAY ~I could give you these enchanted coins. Their value, both sentimental and in gold, is great, but I will not allow my daughter's marriage to be ruined.~
    IF ~~ THEN REPLY ~What do these coins do exactly.~ GOTO PentarchBridgeCoinsDo
    IF ~~ THEN REPLY ~Why would I do courier for you?, Farewell.~ GOTO PentarchBridgeBegging2
END

IF ~~ THEN BEGIN PentarchBridgeBegging2
    SAY ~No! Please! Help me... please.. The coins... the power...~
    IF ~~ THEN REPLY ~What in the Nine Hells??? show me these coins.~ GOTO PentarchBridgeCoinsDo
END

IF ~~ THEN BEGIN PentarchBridgeCoinsDo
    SAY ~*He smiles* That would be my surprise, <PRO_SIRMAAM>. Do not worry, I will demonstrate enchantment on these coins when you return with the ring.~
    IF ~~ THEN REPLY ~Alright I will get the ring but these coins better be worth it.~ GOTO PentarchBridgeAgreed
    IF ~~ THEN REPLY ~Not interested, Farewell.~ GOTO PentarchBridgeBegging3
END

IF ~~ THEN BEGIN PentarchBridgeQuestBegging3
    SAY ~Listen, if you knew the power of these coins... I think you would change your mind.~
    IF ~~ THEN REPLY ~Well this better be worth my time.~ GOTO PentarchBridgeAgreed
    IF ~~ THEN REPLY ~You make big deal out of these coins but how do I know that is really worth it?~ GOTO PentarchBridgeCoinsDo
    IF ~~ THEN REPLY ~No.~ GOTO PentarchBridgeBegging3
END

IF ~~ THEN BEGIN PentarchBridgeAgreed
    SAY ~Please return to me shortly.~
    IF ~~ THEN
        DO
            ~SetGlobal("rqPentachBridgeAmbush2","GLOBAL",2)~
            UNSOLVED_JOURNAL
            ~Pentarch d'Arquile: Wedding Ring.

            Pentarch d'Arquile located in Bridge district have requested from to bring him his daughters ring to him from Ribald in Waukeen's Promenade. Simple courier quest it seems.~
        EXIT
END

// Interactions after agreeing to quest GLOBAL,2
IF ~True()
    !PartyHasItem("rq2wedrn")
    Global("rqPentachBridgeAmbush2","GLOBAL",2)
    ~
    THEN BEGIN  PentarchBridgeNotHaveRingFromRibald
    SAY ~*He looks at you expectantly* Do you have the ring?~
    IF ~~ THEN REPLY ~Not yet what was I supposed to do?~ GOTO PentarchBridgeRetellsQuest
    IF ~~ THEN REPLY ~I thought about it and I not be courier for you, Farewell.~ GOTO PentarchBridgeBegging3
END

IF ~~ THEN BEGIN PentarchBridgeRetellsQuest
    SAY ~*Pleading* Please go and talk to Ribald, please, to get the wedding ring for my daughter.~
    IF ~~ THEN REPLY ~This better be worth my time, Alright I will do it.~
        DO
            ~SetGlobal("rqPentachBridgeAmbush2","GLOBAL",2)~
        EXIT
    IF ~~ THEN REPLY ~You can forget about your quest, Farewell.~
        DO
            ~SetGlobal("rqPentachBridgeAmbush2","GLOBAL",4)~
        EXIT
END

IF ~~ THEN BEGIN PentarchBridgeBegging3
    SAY ~*He makes a pleading gesture.* Please, <PRO_SIRMAAM>, help me in my greatest need, and I shall be eternally grateful.~
    IF ~~ THEN REPLY ~I'll talk to Ribald but these enchanted coins better be worth it.~
        DO
            ~SetGlobal("rqPentachBridgeAmbush2","GLOBAL",2)~
        EXIT
    IF ~~ THEN REPLY ~No is my final word, Farewell.~
        DO
            ~SetGlobal("rqPentachBridgeAmbush2","GLOBAL",4)~
        EXIT
END

// Pentarch you have ring
IF ~True()
    Global("rqPentachBridgeAmbush2","GLOBAL",2)
    PartyHasItem("rq2wedrn")
    ~
    THEN BEGIN PentarchBridgeAmbush1
    SAY ~*He smiles* I knew you would come.~
    IF ~PartyHasItem("rq2wedrn")~ THEN REPLY ~I have the ring right here.~
        DO
            ~TakePartyItem("rq2wedrn")
            SetGlobal("rqPentachBridgeAmbush2","GLOBAL",3)
            SetGlobal("rqRevanAfterAmbush2Talk","GLOBAL",1)~
        GOTO PentarchBridgeAmbush2
    IF ~~ THEN REPLY ~Can you retell me your quest?~ GOTO PentarchBridgeRetellsQuest
    IF ~~ THEN REPLY ~This was a mistake, Farewell.~
        EXIT
END

IF ~~ THEN BEGIN PentarchBridgeAmbush2
    SAY ~*He quickly grabs the ring and starts talking while moving* I have taken the liberty of leaving the enchanted coins right behind this house. Go and see how the enchantment works.~
        IF ~~ THEN
        DO
            %SetGlobal("rqSpawnPentarchAmbush","GLOBAL",1)
            EraseJournalEntry
            (~Pentarch d'Arquile: Wedding Ring.

            Pentarch d'Arquile located in Bridge district have requested from to bring him his daughters ring to him from Ribald in Waukeen's Promenade. Simple courier quest it seems.~)
            EscapeArea()
            %
            SOLVED_JOURNAL
            ~Pentarch d'Arquile: Wedding Ring.
            Turns out all this was just elaborate ruse. Someone really wants me dead nothing surprising for me although who is behind this or their motive in unclear.~
        EXIT
END


IF ~Global("rqPentachBridgeAmbush2","GLOBAL",4)~ THEN BEGIN  PentarchBridgeRetellsQuest2
    SAY ~*Pleading* Please help me to get my daughters wedding ring from that fop Ribald.~
    IF ~~ THEN REPLY ~This better be worth my time, Alright I will do it.~
        DO
            ~SetGlobal("rqPentachBridgeAmbush2","GLOBAL",2)~
        EXIT
    IF ~~ THEN REPLY ~You can forget about your quest, Farewell.~
        EXIT
END
