// Ribald setup
EXTEND_BOTTOM RIBALD 0

IF ~Global("rqRevanAfterAccusingRibald","GLOBAL",1)~
    THEN REPLY ~You set me up Ribald! together with that Pentarch!~ GOTO RevanAfterRibaldTalk3
END

APPEND RIBALD

    IF ~~ THEN BEGIN RevanAfterRibaldTalk3
        SAY ~No! I didn't, I just... I just... I don't even know what you are talking about.~
        IF ~PartyHasItem("rqletpen")~ THEN REPLY ~Well, I have this letter here which states: "I am authorizing you to utilize our contact in Promenade. Just make him dead!"~ GOTO RevanAfterRibaldProof1
        IF ~!PartyHasItem("rqletpen")~ THEN REPLY ~Admit it, Ribald, or else!~ GOTO RevanAfterRibaldTalk4
    END

    IF ~~ THEN BEGIN RevanAfterRibaldProof1
        SAY ~*Suddenly he pales* This was supposed to be a harmless joke; nobody was supposed to be killed!~
        IF ~~ THEN REPLY ~So you admit it you even know that I was supposed to be murdered!~ GOTO RevanAfterRibaldProof2
    END

    IF ~~ THEN BEGIN RevanAfterRibaldProof2
        SAY ~No! It's not like that at all! Alright, I will tell you the whole truth. They came to me wanting to "repay old debts" to someone named Revan Artecratos. So I played my little part. Made a little theater about Pentarch.~
        IF ~~ THEN REPLY ~Who were they and where they were from?~ GOTO RevanAfterRibaldProof3
    END

    IF ~~ THEN BEGIN RevanAfterRibaldProof3
        SAY ~I do not know where they were from. Do I look like I have psionic powers? All I know is their names: Half-Elf Liness and Half-Orc Gorbak, or something.~
        IF ~~ THEN REPLY ~Who they were working for?~ GOTO RevanAfterRibaldProof4
    END

    IF ~~ THEN BEGIN RevanAfterRibaldProof4
        SAY ~I don't know. I was not privy to any details about their plans. It's not like they trusted me. Please, I told you everything I know. Just let me be.~
        IF ~~ THEN REPLY ~I could report this to someone in the Council of Six building.~ GOTO RevanAfterRibaldProof5
        IF ~~ THEN REPLY ~You are a dead man, Ribald.~
            DO ~ActionOverride("Ribald",Enemy())~ EXIT
        IF ~~ THEN REPLY ~Your part seems harmless enough, though you should have warned me about this plot.~ GOTO RevanAfterRibaldProof5
        IF ~~ THEN REPLY ~If anything like this happens in the future, you are dead. Am I understood?~ GOTO RevanAfterRibaldProof5
    END

    IF ~~ THEN BEGIN RevanAfterRibaldProof5
        SAY ~I can compensate you, say, 2000 gold?~
        IF ~~ THEN REPLY ~I want more gold, Ribald.~ GOTO RevanAfterRibaldProof6
        IF ~~ THEN REPLY ~You plotted my death, Ribald. Do you think you can get out of this easily?~ GOTO RevanAfterRibaldProof6
        IF ~~ THEN REPLY ~I want a discount and gold.~ GOTO RevanAfterRibaldProofDiscount
        IF ~~ THEN REPLY ~I still rather report you to garrison.~ GOTO RevanAfterRibaldProof6
    END

     IF ~~ THEN BEGIN RevanAfterRibaldProof6
        SAY ~Alright alright 3141 gold that's all I have on me.~
        IF ~~ THEN REPLY ~I still want more gold Ribald.~ GOTO RevanAfterRibaldProofDiscount
        IF ~~ THEN REPLY ~Okay but if you harm me in future you will suffer greatly.~ GOTO RevanAfterRibaldDiscount1
    END

    IF ~~ THEN BEGIN RevanAfterRibaldProofDiscount
        SAY ~I cannot give more of my assets as it would interfere with my merchant activity. Here have my gold that is all I can do for you.~
        IF ~~ THEN REPLY ~That is enough for me then but if you will cross me in future I will kill you.~ GOTO RevanAfterRibaldDiscount1
    END

    IF ~~ THEN BEGIN RevanAfterRibaldDiscount1
        SAY ~I am so relieved that we came to understanding please do come back later dear customer!~
        IF ~~ THEN DO
                ~GiveGoldForce(3141)
                SetGlobal("rqRevanAfterAccusingRibald","GLOBAL",2)
                SetGlobal("rqRevanAfterAmbush2Talk","GLOBAL",3)~
            EXIT
    END

    IF ~~ THEN BEGIN RevanAfterRibaldTalk4
        SAY ~Alright I will tell you whole story an elf from Tethyr came to my shop and gave me the ring. In exchange I was to play bit of theatre about Pentarch I... I.. thought it was harmless prank.~
        IF ~~ THEN GOTO RevanAfterRibaldTalk5
    END

    IF ~~ THEN BEGIN RevanAfterRibaldTalk5
        SAY ~I... I... never thought there would be an ambush please...~
        IF ~~ THEN REPLY ~Okay okay lets just say I believe you. But from now on you will be notifying me anytime if there is anything that might concern me Ribald. Am I understood?~ GOTO RibaldRelieved
        IF ~~ THEN REPLY ~I don't think so Ribald you sound like liar.~ GOTO RibaldBegging
        IF ~~ THEN REPLY ~Setting up ambush on me. Tsk. Tsk.~ GOTO RibaldBegging
        IF ~~ THEN REPLY ~Hmm.. very very very implausible but I do believe you.~ GOTO RibaldRelieved
    END

    IF ~~ THEN BEGIN RibaldRelieved
        SAY ~Crystal clear, I am very very relieved that this misunderstanding has been resolved, Farewell.~
            IF ~~ THEN DO
                ~SetGlobal("rqRevanAfterAccusingRibald","GLOBAL",2)
                SetGlobal("rqRevanAfterAmbush2Talk","GLOBAL",3)~
            EXIT
    END

    IF ~~ THEN BEGIN RibaldBegging
        SAY ~Please I had nothing to do with this! You must believe me!~
        IF ~~ THEN REPLY ~I want gold Ribald.~ GOTO RibaldProtests
        IF ~~ THEN REPLY ~Prove it by giving me a discount.~ GOTO RibaldProtests
        IF ~~ THEN REPLY ~You are dead man.~
            DO ~ActionOverride("Ribald",Enemy())~
        EXIT
    END

    IF ~~ THEN BEGIN RibaldProtests
        SAY ~I cannot give you any gold compensation I don't have any money to spare. And I besides that I did no harm to you.~
        IF ~~ THEN REPLY ~You are telling me you the one of the largest and well known merchant in Athkatla is poor?~ GOTO RibaldEscalation
        IF ~~ THEN REPLY ~Maybe I should take this matter to someone in Council of Six Building.~ GOTO RibaldEscalation
        IF ~~ THEN REPLY ~Make sure this won't happen again.~ GOTO RibaldRelieved
    END

    IF ~~ THEN BEGIN RibaldEscalation
        SAY ~My friend I did nothing to harm you. So you are not entitled any compensation from me.~
        IF ~~ THEN REPLY ~Is that so? Perhaps opportunity will arise later.~ GOTO RibaldRelieved
        IF ~~ THEN REPLY ~Better watch your back from now on dear merchant.~ GOTO RibaldRelieved
        IF ~~ THEN REPLY ~Alright perhaps you are correct.~ GOTO RibaldRelieved
    END
END

