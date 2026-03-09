BEGIN ~rqjtob3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN rqjtob3Intro
    SAY ~This is my last chance... last chance of mine before they no longer need me.~
    IF ~~ THEN REPLY ~No more resurrections then? This is our last battle?~ GOTO JaheiraItsOverForMe
    IF ~~ THEN REPLY ~You have failed every time so that is expected.~ GOTO JaheiraProvoked
    IF ~~ THEN REPLY ~How fitting that your pursuit of my death will result in your own demise.~ GOTO JaheiraProvoked
    IF ~~ THEN REPLY ~Who is they? Harpers?~ GOTO JaheiraItsOverForMe
    IF ~~ THEN REPLY ~I was just defending myself! This whole thing was escalated by your side.~ GOTO JaheiraProvoked
    IF ~~ THEN REPLY ~So why are you attacking me then? Why just not run away.~ GOTO HarperMurderer
END

IF ~~ THEN BEGIN JaheiraItsOverForMe
    SAY ~Just a tool, pheh.~
    IF ~~ THEN REPLY ~And useless at that.~ GOTO JaheiraProvoked
    IF ~~ THEN REPLY ~Harpers will pay for these attacks!~ GOTO JaheiraWhoIsAgainstMe
END

IF ~~ THEN BEGIN JaheiraProvoked
    SAY ~Despicable wretch!~
    IF ~~ THEN REPLY ~Tell me who is against me or I will kill you!~ GOTO JaheiraWhoIsAgainstMe
    IF ~~ THEN REPLY ~Who is helping you? Who is behind all this!~ GOTO JaheiraWhoIsAgainstMe
END

IF ~~ THEN BEGIN HarperMurderer
    SAY ~What?! Slayer of Harpers you have murdered Mintiper, Prangl even my mentor Dermin!~
    IF ~~ THEN REPLY ~They attacked me so I killed them.~ GOTO JaheiraWhoIsAgainstMe
    IF ~~ THEN REPLY ~This whole thing was orchestrated by foolish Mintiper trying to cover up his failures!~ GOTO JaheiraWhoIsAgainstMe
    IF ~~ THEN REPLY ~Mintiper sent drunk Prangl to negotiate after you must be fool what kind of negotiator would be he?~ GOTO JaheiraWhoIsAgainstMe
END

IF ~~ THEN BEGIN JaheiraWhoIsAgainstMe
    SAY ~What do you know?! You don't even know whom you are up against!~
    IF ~~ THEN REPLY ~Then tell me!~ GOTO JaheiraTryToDoOneLastThing
    IF ~~ THEN REPLY ~I don't fear them then, given how many times you have failed.~ GOTO JaheiraTryToDoOneLastThing
END

IF ~~ THEN BEGIN JaheiraTryToDoOneLastThing
    SAY ~Fool! What about your companions? Are they merely accessories to your bloodpath? Or do they have a will of their own and help me to stop your evil!~
    =
    ~Do you not realize what will happen if <CHARNAME> ascends to Throne of Bhaal?~
    IF ~~ THEN REPLY ~You foolish fanatic! Nobody who values his life should listen to you!~ GOTO JaheiraFinalAttack
    IF ~~ THEN REPLY ~Stop this and go back! Nobody needs to die!~ GOTO JaheiraFinalAttack
    IF ~~ THEN REPLY ~None of this makes any sense!~ GOTO JaheiraFinalAttack
    IF ~~ THEN REPLY ~Your resurrections must have afflicted your sanity.~ GOTO JaheiraFinalAttack
END

IF ~~ THEN BEGIN JaheiraFinalAttack
    SAY ~<CHARNAME>'s ascension will be heralded with rivers of blood! Have that fully on your conscience!~
    IF ~~ THEN DO
        ~CreateCreatureDoor("rqbeart3",[3686.789],11) // Bear
        CreateCreatureDoor("rqbeart3",[3535.662],11) // Bear
        CreateCreatureDoor("rqbeart3",[3447.649],11) // Bear
        CreateCreatureDoor("rqbeart3",[3350.661],11) // Bear
        CreateCreatureDoor("rqbeart3",[3290.694],11) // Bear
        CreateCreatureDoor("rqwolft3",[3421.920],11) // Wolf
        CreateCreatureDoor("rqwolft3",[3524.608],11) // Wolf
        CreateCreatureDoor("rqwolft3",[3614.1009],11) // Wolf
        CreateCreatureDoor("rqinset3",[3336.575],11) // Creeping Doom
        CreateCreatureDoor("rqnaelt3",[3210.666],11) // Corrupted Nature Elemental
        CreateCreatureDoor("rqshamt3",[3339.717],11) // Mound
        CreateCreatureDoor("rqshamt3",[3507.890],11) // Mound
        Enemy()~
    EXIT
END

BEGIN ~rqt1oasi~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1IllasersTrap
    SAY ~Greetings <SIRMAAM>. You look capable. Are you available for hire as a mercenary? Simple courier job from the nearby Oasis.~
    IF ~~ THEN REPLY ~For what exactly?~ GOTO 1Illa1CourierJob
    IF ~~ THEN REPLY ~I don't have time for this.~
        EXIT
END

IF ~!Dead("rq1illa") Global("rq1IllaserraAmbush1","GLOBAL",1)~ THEN BEGIN 1Illa1MerchantRejected
    SAY ~You have returned. Shall I repeat the terms of the contract?~
    IF ~~ THEN REPLY ~Yes do that.~ GOTO 1Illa1CourierJob
    IF ~~ THEN REPLY ~Not necessary I think I have already been in this oasis. Is there anything else?~ GOTO 1Illa1MerchantExplains
    IF ~~ THEN REPLY ~This was a mistake, Farewell.~
        EXIT
END

IF ~~ THEN BEGIN 1Illa1CourierJob
    SAY ~You are to pickup package for me. Now reason why I am sending you instead doing it myself is that Evgar and Uyglur have tried... lets just say we have some violent disagreements.~
    =
    ~There is an Oasis nearby. I shall mark it on your map. I am forgetting something... Ah yes, I shall reward you with a magical item.~
    IF ~~ THEN REPLY ~If it is an ambush, I will make the rest of your life very, very painful.~ GOTO 1IllaThreats
    IF ~~ THEN REPLY ~So am I to take "package" from them by force?~ GOTO 1Illa1MerchantExplains
    IF ~~ THEN REPLY ~Why don't you go with me I will escort you.~ GOTO 1Illa1MerchantExplains
    IF ~~ THEN REPLY ~I am sick of being delivery <GIRLBOY>!~
        EXIT
END

IF ~~ THEN BEGIN 1IllaThreats
    SAY ~There might be... but I hope they will not attack experienced adventurer such as you. I have very powerful magical item as reward to compensate you for the risk.~
    IF ~~ THEN REPLY ~Alright I agree to your terms.~ GOTO 1Illa1MerchantAgreeOrNot
    IF ~~ THEN REPLY ~Not interested, Farewell.~
        EXIT
END

IF ~~ THEN BEGIN 1Illa1MerchantExplains
    SAY ~I had some disagreements with yes, but no. I mean, they expect me, all you need to do is take the package from them and bring it here.~
    IF ~~ THEN REPLY ~Alright I shall do this for you.~ GOTO 1Illa1MerchantAgreeOrNot
    IF ~~ THEN REPLY ~Not interested, Farewell.~
        EXIT
END

IF ~~ THEN BEGIN 1Illa1MerchantAgreeOrNot
    SAY ~Excellent! Go to the oasis and return with the package. I shall wait for you here.~
        IF ~~ THEN DO
            ~SetGlobal("rq1IllaserraAmbush1","GLOBAL",1)~
            UNSOLVED_JOURNAL ~Courier contract: Oasis to Amkethran.

            Thacher, located in Zephir at the Amkethran Inn, has hired me to get a package from someone called Evgar and Uyglur, located in Oasis, and to transport it to him. At this point, I am very skeptical that this will not be an ambush. Still, I am sure something more will come up from this.~
        EXIT
END

IF ~Global("rq1IllaserraAmbush1","GLOBAL",2)
    OR (2)
        Dead("rq1illa")
        Dead("rqmahraj")~
    THEN BEGIN 1IllaReturned
    SAY ~Greetings. Do you have my package?~
    IF ~~ THEN REPLY ~What?! It was ambush who hired you?!~ GOTO 1IllaInterrogation
END

IF ~~ THEN BEGIN 1IllaInterrogation
    SAY ~It was a woman. I was... I was... supposed to hold on to the package and wait for her to get it from me!~
    IF ~~ THEN REPLY ~I don't believe! You're dead!~
        DO  %EraseJournalEntry(~Courier contract: Oasis to Amkethran.

            Thacher, located in Zephir at the Amkethran Inn, has hired me to get a package from someone called Evgar and Uyglur, located in Oasis, and to transport it to him. At this point, I am very skeptical that this will not be an ambush. Still, I am sure something more will come up from this.~)
            EscapeArea()%
            SOLVED_JOURNAL ~Courier contract: Oasis to Amkethran.

            Illasera ambushed me and died for second time. What worries me that I still I do not know who is behind her or how can I strike blow at them.~
        EXIT
    IF ~~ THEN REPLY ~If you knew this was an ambush why would wait here like moron?~ GOTO IllaseraNobleWaitsLikeIdiot

    IF ~Global("rqTobIllaseraIsRakshasa","GLOBAL",1)~ THEN REPLY ~I had enough of illusions and deceit! Show your true form, creature!~
        DO  %EraseJournalEntry(~Courier contract: Oasis to Amkethran.

            Thacher, located in Zephir at the Amkethran Inn, has hired me to get a package from someone called Evgar and Uyglur, located in Oasis, and to transport it to him. At this point, I am very skeptical that this will not be an ambush. Still, I am sure something more will come up from this.~)
            EscapeArea()%
            SOLVED_JOURNAL ~Courier contract: Oasis to Amkethran.

            Turns out Rakshasa was using Illasera's Black Reaver to ambush me. Whether this is related to attacks I am suffering I am not able to figure out.~
        EXIT
    IF ~~ THEN REPLY ~Did she looked this? "Describe Illasera to him"~ GOTO IllaseraNobleWaitsLikeIdiot
END

IF ~~ THEN BEGIN IllaseraNobleWaitsLikeIdiot
    SAY ~Yes... <LADYLORD>... Take this magic item <SIRMAAM>. I... I shall be leaving now.~
        IF ~~ THEN DO
            %EraseJournalEntry(~Courier contract: Oasis to Amkethran.

            Thacher, located in Zephir at the Amkethran Inn, has hired me to get a package from someone called Evgar and Uyglur, located in Oasis, and to transport it to him. At this point, I am very skeptical that this will not be an ambush. Still, I am sure something more will come up from this.~)
            GiveItem("rqshld01",LastTalkedToBy) // Shield of Augthor
            EscapeArea()%
            SOLVED_JOURNAL ~Courier contract: Oasis to Amkethran.

            Illasera ambushed me and died for second time. What worries me that I still I do not know who is behind her or how can I strike blow at them.~
        EXIT
END

BEGIN ~rq1illa~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1IllaEcnounter
    SAY ~So we meet again, <CHARNAME>. Surprised? Did you really think you could defeat me so easily?~
    IF ~~ THEN REPLY ~As I suspected an ambush!~ GOTO 1IllaObservation
    IF ~~ THEN REPLY ~No talking this time! You are dead!~ GOTO 1IllaLearnedAnything
    IF ~~ THEN REPLY ~So what did I kill in forest clearing?~ GOTO 1IllaSecretsHowIllaseraAlive
END

IF ~~ THEN BEGIN 1IllaObservation
    SAY ~Your observation skill is astounding I am amazed you have reached this far.~
    IF ~~ THEN REPLY ~Enough of this garbage talk! Lets fight!~ GOTO 1IllaFight1
    IF ~~ THEN REPLY ~Will there be round three?~ GOTO 1IllaSecretsHowIllaseraAlive
END

IF ~~ THEN BEGIN 1IllaSecretsHowIllaseraAlive
    SAY ~A girl has to have a few secrets, wouldn't you agree? I am sure we are in accord on this.~
    IF ~~ THEN REPLY ~Madness is to repeat same thing over and over again and expect different result!~ GOTO 1IllaFight1
    IF ~~ THEN REPLY ~Fool! You shall die once more!~ GOTO 1IllaFight1
    IF ~~ THEN REPLY ~I wonder how many times will I have to kill you.~ GOTO 1IllaFight1
END

IF ~~ THEN BEGIN 1IllaLearnedAnything
    SAY ~Oh really? Do you think I have not learned anything after first battle?~
    IF ~~ THEN REPLY ~You are gift that keeps on giving! I shall enjoy your every death!~ GOTO 1IllaFight1
END

IF ~~ THEN BEGIN 1IllaFight1
    SAY ~And fight shall you have. I am anxious to try this new body. Red Slayer's Attack!~
        IF ~~ THEN
        DO ~SetGlobal("rq1IllaserraAmbush1","GLOBAL",2)
            Enemy()
            ActionOverride("rq1f18",Enemy())
            ActionOverride("rq1fb19",Enemy())
            ActionOverride("rq1kamra",Enemy())
            ActionOverride("rq1mage",Enemy())
            ActionOverride("rq1t12f1",Enemy())
            ActionOverride("rqt1merc",Enemy())~
        EXIT
END

BEGIN ~rq2illa~

IF ~~ THEN BEGIN IllaseraInaneBragging
    SAY ~<CHARNAME> is here! Finally, I can finish him off!~
    IF ~~ THEN EXTERN ~rqt5dea1~ DeathstalkerGroundsIllasera
END

// Irgulis
BEGIN ~rqt5dea1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN rqdeathstalker1
    SAY ~Start with reaping! Go inside and drag all the corpses here!~
    IF ~~ THEN EXTERN ~rq2illa~ IllaseraInaneBragging
END

IF ~~ THEN BEGIN DeathstalkerGroundsIllasera
    SAY ~What?! Silence, foolish Illasera!~
    =
    ~How did you find us here?!~
    IF ~~ THEN REPLY ~Someone who knew about your activities here have put contract on your head.~ GOTO DeathstalkerResult
    IF ~~ THEN REPLY ~Ha! I might as well tell this to zombie.~ GOTO ElwychThreat
    IF ~~ THEN REPLY ~Why would I answer this fool!~ GOTO ElwychThreat
END

IF ~~ THEN BEGIN ElwychThreat
    SAY ~Elvych! You are the only unknown here! If you run or switch sides, you will be murdered!~
    IF ~~ THEN EXTERN ~rqt5elvy~ ElvychThread
END

IF ~~ THEN BEGIN DeathstalkerResult
    SAY ~The spawn of Bhaal is just fuel for a return. Bhaal will be resurrected!~ [rqspawn]
    =
    ~There is no escape! <CHARNAME>!~ [rqescap]
    IF ~~ THEN DO
        ~SetGlobal("rqT5DeathStalkerEncounter1","GLOBAL",2)
        CreateCreatureDoor("rqt5bga1",[82.1167],0) // Bone Golem
        CreateCreatureDoor("rqt5bga1",[144.1183],0) // Bone Golem
        CreateCreatureDoor("rqt5bga1",[104.1189],0) // Bone Golem
        CreateCreatureDoor("rqt5bga1",[216.1174],0) // Bone Golem
        CreateCreatureDoor("rqt5bga1",[289.1165],0) // Bone Golem
        CreateCreatureDoor("rqt5bga1",[405.1100],0) // Bone Golem
        CreateCreatureDoor("rqt5pba1",[314.1010],0) // Putrid Bear
        CreateCreatureDoor("rqt5pba1",[445.1104],0) // Putrid Bear
        CreateCreatureDoor("rqt5pba1",[126.963],0) // Putrid Bear
        CreateCreatureDoor("rqt5pba1",[265.1123],0) // Putrid Bear
        CreateCreatureDoor("rqt5pba1",[413.1010],0) // Putrid Bear
        CreateCreatureDoor("rqt5pba1",[154.970],0) // Putrid Bear
        CreateCreatureDoor("rqt5fw01",[548.1304],0) // Fetid Wolf
        CreateCreatureDoor("rqt5fw01",[410.1381],0) // Fetid Wolf
        CreateCreatureDoor("rqt5fw01",[291.1325],0) // Fetid Wolf
        CreateCreatureDoor("rqt5fw01",[364.1380],0) // Fetid Wolf
        CreateCreatureDoor("rqt5fw01",[477.1390],0) // Fetid Wolf
        CreateCreatureDoor("rqt5fw01",[336.1181],0) // Fetid Wolf
        Enemy()
        ActionOverride("rqt5tf1",Enemy()) // Elvych Firetouched
        ActionOverride("rq2illa",Enemy()) // Illasera
        ActionOverride("rqt5clt1",Enemy()) // Deathstalker Ammar
        ActionOverride("rqt5clt2",Enemy())~ // Deathstalker Tylgarth
    EXIT
END

IF ~~ THEN BEGIN IrgulisAbazigalReaction
    SAY ~Do not underestimate <HIMHER> <HESHE> was probably the first!~
    IF ~~ THEN EXTERN ~rqt7dea2~ SixtarchIntro
END

IF ~~ THEN BEGIN SendaiReaction
    SAY ~Do not forget the your role!~
    IF ~~ THEN EXTERN ~rqt6dea2~ SecondEncounter
END

IF ~~ THEN BEGIN BetrayalItwantos
    SAY ~You speak of betrayal Itwantos! There will be blood if you betray us!~
    IF ~~ THEN EXTERN ~rqt7dea2~ ReactionToItwantos
END

IF ~~ THEN BEGIN BetrayalIrgulisReaction
    SAY ~Then I proclaim you as heretics and what awaits heretics is death!~
    IF ~~ THEN EXTERN ~rqt7dea2~ ReactionToItwantos
END

IF ~~ THEN BEGIN YouTooItwantos
    SAY ~Heretical scum!~
    IF ~~ THEN EXTERN ~rqt7dea2~ ReactionToItwantos
END

IF ~~ THEN BEGIN ItwantosTreasonReac2
    SAY ~You speak of treason, Itwantos! If you betray us, I shall kill with my own hands!~
    IF ~~ THEN EXTERN ~rqt6dea2~ ItwantoReactsToIrgulis
END
// Elvych Firetouched
BEGIN ~rqt5elvy~

IF ~~ THEN BEGIN ElvychThread
    SAY ~I did nothing wrong! Please, you must believe me!~
    IF ~~ THEN EXTERN ~rqt5dea1~ DeathstalkerResult
END

/* -------------------------------------------- Itwantos Group -------------------------------------------------- */
BEGIN ~rqt6ded1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN DeathStalker01
    SAY ~Your struggle is pointless, fool! Die as you must!~
    IF ~!Dead("rqt5clf1")~ THEN EXTERN ~rqt5dea1~ SendaiReaction
    IF ~Dead("rqt5clf1")~ THEN EXTERN ~rqt6dea2~ SecondEncounter
END
/* ------------------------------------------------------------ Deathstalker Itwantos ------------------------------------------------------------- */
BEGIN ~rqt6dea2~ //Itwantos

IF ~~ THEN BEGIN SecondEncounter
    SAY ~So, you must have interrupted our expedition in the Fire Giant Temple. She told us this would be difficult.~
    IF ~Alignment(Player1,MASK_EVIL)~ THEN GOTO ReplyToEvilBhaalspawn
    IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO ReplyToGoodBhaalspawn
    IF ~Alignment(Player1,MASK_GENEUTRAL)~ THEN GOTO ReplyToGoodBhaalspawn
END

IF ~~ THEN BEGIN ReplyToEvilBhaalspawn
    SAY ~Although it is pointless to talk to fuel for our god's rebirth, is it not? Talking to a wooden log or lump of coal is that wise?~
    IF ~~ THEN REPLY ~You and I know the prophecy, so why are you here? Why do you continue this?~ GOTO ExplainToCHARNAME
    IF ~~ THEN REPLY ~Talking to you is waste of time. Prepare to meet your god!~ GOTO SpawnEnemies
END

IF ~~ BEGIN ExplainToCHARNAME
    SAY ~You must be a bigger fool than I have ever imagined!~
    IF ~~ THEN GOTO SpawnEnemies
END

IF ~~ THEN BEGIN ReplyToGoodBhaalspawn
    SAY ~Think about the good that could have been accomplished if you would just purged yourself of your essence. We offer such solution to your problem with evil within.~
    IF ~~ THEN REPLY ~How would you do that?~ GOTO CHARNAMEisFool
    IF ~~ THEN REPLY ~I'd rather not do anything with you.~ GOTO SpawnEnemies
    IF ~~ THEN REPLY ~Enough! Ending of your pathetic lives will pave the way for my ascendance!~ GOTO SpawnEnemies
    IF ~~ THEN REPLY ~If you desire Bhaal so much, perhaps I could arrange a meeting in afterlife!~ GOTO SpawnEnemies
END

IF ~~ THEN BEGIN SpawnEnemies
    SAY ~You cannot stop us; even if we die, Bhaal will be resurrected!~
        IF ~~ THEN DO
            ~CreateCreatureDoor("rqt5bga1",[1453.1131],0) // Bone Golem
            CreateCreatureDoor("rqt5bga1",[1462.1084],0) // Bone Golem
            CreateCreatureDoor("rqt5bga1",[1521.1169],0) // Bone Golem
            CreateCreatureDoor("rqt5bga1",[1830.1174],0) // Bone Golem
            CreateCreatureDoor("rqt5bga1",[1819.1103],0) // Bone Golem
            CreateCreatureDoor("rqt5bga1",[1671.1305],0) // Bone Golem
            CreateCreatureDoor("rqt5pba1",[1816.991],0) // Putrid Bear
            CreateCreatureDoor("rqt5pba1",[1558.1204],0) // Putrid Bear
            CreateCreatureDoor("rqt5pba1",[1486.1257],0) // Putrid Bear
            CreateCreatureDoor("rqt5pba1",[1633.958],0) // Putrid Bear
            CreateCreatureDoor("rqt5pba1",[1732.1000],0) // Putrid Bear
            CreateCreatureDoor("rqt5pba1",[1830.957],0) // Putrid Bear
            CreateCreatureDoor("rqt5fw01",[1519.873],0) // Fetid Wolf
            CreateCreatureDoor("rqt5fw01",[1716.906],0) // Fetid Wolf
            CreateCreatureDoor("rqt5fw01",[1532.964],0) // Fetid Wolf
            CreateCreatureDoor("rqt5fw01",[1437.1228],0) // Fetid Wolf
            CreateCreatureDoor("rqt5fw01",[1717.970],0) // Fetid Wolf
            CreateCreatureDoor("rqt5fw01",[1447.925],0) // Fetid Wolf
            Enemy()~
        EXIT
END

IF ~~ THEN BEGIN CHARNAMEisFool
    SAY ~You don't need to worry about this; just hold still for a while.~
    IF ~CheckStatLT(Player1,7,INT)~ THEN REPLY ~What... Why? Do you want to hurt me?~
            DO ~ReallyForceSpell(Player1,FIFTY_PERCENT_DAMAGE_ARROW)~ GOTO SpawnEnemies
    IF ~CheckStatGT(Player1,6,WIS)~ THEN REPLY ~No! You shall die fool!~ GOTO SpawnEnemies
END
// Last encounter negotiation Itwantos
IF ~Global("rqTobRetreatImpossible","Global",3)~ THEN BEGIN NegotationsDeathsHatred
    SAY ~<CHARNAME>, stop! I wish to fight the one who has betrayed me. Our common enemy!~
    IF ~~ THEN REPLY ~Drowning man will say anything to save himself.~ GOTO EnemiesOnOurs
    IF ~~ THEN REPLY ~Spare me this foolishness and die with dignity!~ GOTO EnemiesOnOurs
END

IF ~~ THEN BEGIN EnemiesOnOurs
    SAY ~Someone must have betrayed me! I wish to kill whoever maneuvered me here... I am not afraid to die, still I would think the destruction of our common enemy is preferable to my death.~
    IF ~~ THEN REPLY ~No! Tell me what you know now, or else!~ GOTO IdoNotKnowWhoisEnemy
END

IF ~~ THEN BEGIN IdoNotKnowWhoisEnemy
    SAY ~If I knew who it was, I would go kill them right now!~
    IF ~~ THEN REPLY ~Let's pretend I will let you leave. What will you do then?~ GOTO EscapeAndGiveInventory
    IF ~!Dead("rqt5clf1")
        !StateCheck("rqt5clf1",STATE_HELPLESS)
        !StateCheck("rqt5clf1",STATE_STUNNED)
        !StateCheck("rqt5clf1",STATE_PANIC)
        !StateCheck("rqt5clf1",STATE_BERSERK)
        !StateCheck("rqt5clf1",STATE_SLEEPING)
        !StateCheck("rqt5clf1",STATE_SILENCED)
        !StateCheck("rqt5clf1",STATE_CHARMED)
        !StateCheck("rqt5clf1",STATE_FEEBLEMINDED)
        !StateCheck("rqt5clf1",STATE_CONFUSED)~ THEN REPLY ~Why should I let you go?~ EXTERN ~rqt5dea1~ ItwantosTreasonReac2
END

IF ~~ THEN BEGIN ItwantoReactsToIrgulis
    SAY ~Pathetic Irgulis, slavishly devoted to Setherus! You know what I will do?~
    IF ~~ THEN EXTERN ~rqt6dea2~ EscapeAndGiveInventory
END

IF ~~ THEN EscapeAndGiveInventory
    SAY ~I will go and kill whoever altered my teleportation magic!~
    IF ~~ THEN REPLY ~Sounds great. Bring me proof of the deed.~ GOTO LeaveForVengeanceRestFirst
    IF ~~ THEN REPLY ~Where is that traitor of yours located?~ GOTO TempleLocation
    IF ~~ THEN REPLY ~Give me all your valuables and you can leave.~ GOTO ValuableGiveCharname
    IF ~~ THEN REPLY ~There is a small issue of your Holy symbol. Give them to me and I shall let you go.~ GOTO GiveHolySymbols
    IF ~~ THEN REPLY ~I think I'd rather kill you.~ EXIT
END

IF ~~ THEN TempleLocation
    SAY ~There is an old underground temple nearby. I shall storm it and kill the traitors!~
    IF ~~ THEN REPLY ~If you are ready to betray them, give me your Holy symbols.~ GOTO GiveHolySymbols
    IF ~~ THEN REPLY ~After suffering so many ambushes from you, I do not think leaving you alive is wise.~ EXIT
END

IF ~~ THEN BEGIN GiveHolySymbols
    SAY ~An excellent idea! I will not need them anyway!~
    IF ~~ THEN
        DO
            ~GiveItem("rqhosy1",Player1)
            ActionOverride("rqt6clt1",GiveItem("rqhosy1",Player1)
            ActionOverride("rqt6clt2",GiveItem("rqhosy1",Player1)
            ActionOverride("rqt7clf1",GiveItem("rqhosy1",Player1)
            ActionOverride("rqt7clt1",GiveItem("rqhosy1",Player1)
            ActionOverride("rqt7clt2",GiveItem("rqhosy1",Player1)~ GOTO LeaveForVengeanceRestFirst
END

IF ~~ THEN LeaveForVengeanceRestFirst
    SAY ~I shall get to the bottom of this! Whoever stands in my way shall fall!~
    IF ~~ THEN
        DO
            ~SetGlobal("rqTobItwantosPrimaryAlly","GLOBAL",1)
            SetGlobal("rqTobChangeToAlly","GLOBAL",1)~
        EXIT
END

IF ~~ THEN BEGIN ValuableGiveCharname
    SAY ~Surely being powerful as yourself has no need of my meager equipment and I will need it in upcoming battle. Though I promise I shall bring you whatever I looted from my enemies!~
    IF ~~ THEN REPLY ~Agreed, but that loot better be worth it!~
        DO
            ~SetGlobal("rqTobItwantosPrimaryAlly","GLOBAL",1)
            SetGlobal("rqTobChangeToAlly","GLOBAL",1)~
        EXIT
    IF ~~ THEN REPLY ~Nope, you are dead man!~ EXIT
END
// Ceremony with Sixtarch
IF ~~ THEN BEGIN JoinSixtarchInBetrayal
    SAY ~Sixtarch, I want to join you, for I have a score to settle with whoever betrayed us!~
    IF ~~ THEN EXTERN ~rqt7dea2~ JoinUpThenSixtarchSays
    IF ~!Dead("rqt5clf1")
        !StateCheck("rqt5clf1",STATE_HELPLESS)
        !StateCheck("rqt5clf1",STATE_STUNNED)
        !StateCheck("rqt5clf1",STATE_PANIC)
        !StateCheck("rqt5clf1",STATE_BERSERK)
        !StateCheck("rqt5clf1",STATE_SLEEPING)
        !StateCheck("rqt5clf1",STATE_SILENCED)
        !StateCheck("rqt5clf1",STATE_CHARMED)
        !StateCheck("rqt5clf1",STATE_FEEBLEMINDED)
        !StateCheck("rqt5clf1",STATE_CONFUSED)~ THEN EXTERN ~rqt5dea1~ YouTooItwantos
END

IF ~~ THEN BEGIN LoyaltyToCharnameItwantos
    SAY ~I and my Deathst... I mean, my men swear fealty to you, <PRO_LADYLORD> <CHARNAME>.~
    IF ~~ THEN EXTERN ~rqt7dea2~ LoyaltyToCharname
END

BEGIN ~rqt7ded1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN ScoutWarningSixtarch
    SAY ~Sixtarch! Gorion's Ward is here!~
    IF ~!Dead("rqt5clf1")~ THEN EXTERN ~rqt5dea1~ IrgulisAbazigalReaction
    IF ~Dead("rqt5clf1")~ THEN EXTERN ~rqt7dea2~ SixtarchIntro
END

// Deathstalker Sixtarch
BEGIN ~rqt7dea2~

IF ~~ THEN BEGIN SixtarchIntro
    SAY ~Gorion's Ward?! How come you are here?~
    IF ~~ THEN REPLY ~There is contract on your heads.~ GOTO BetrayalWhoDidthat
    IF ~~ THEN REPLY ~You will achieve nothing and join your god!~ GOTO SixtarchBattlecry
    IF ~Dead("rqjah136")~ THEN REPLY~Have you provided any aid to Jaheira? I've seen similar creatures fighting for her, as you can summon.~ GOTO CorruptedCreatures
END

IF ~Dead("rqt5clf1") Dead("rqt5clt1") Dead("rqt5clt2") Global("rqTobRetreatImpossible","GLOBAL",0)~ THEN BEGIN SixtarchIntroDeadFireGiantTemple
    SAY ~Gorion's Ward?! Someone betrayed us! How did you knew about our presence here?~
    IF ~~ THEN REPLY ~There is contract on your heads.~ GOTO BetrayalWhoDidthat
    IF ~~ THEN REPLY ~The prophecy is coming to its conclusion and your deaths will pave the way!~ GOTO SixtarchBattlecry
    IF ~Dead("rqjah136")~ THEN REPLY ~Some of the creatures you have summoned in Marching Mountains have you provided these to Jaheira?~ GOTO CorruptedCreatures
END

IF ~~ THEN BEGIN BetrayalWhoDidthat
    SAY ~Contract? Nonsense! You are Gorion's Ward; the fact you are here is not the result of some mercenary contract.~
    IF ~~ THEN GOTO SixtarchBattlecry
END

IF ~~ THEN BEGIN CorruptedCreatures
    SAY ~No, but I am surprised you pieced the whole thing together. I guess her need for superiority of morals over those whom she deems morally wrong has led her to our welcoming embrace.~
    IF ~~ THEN REPLY ~Why do you say this?~ GOTO SixtarchTiredofThis
    IF ~~ THEN REPLY ~How come, then, she had corrupted animals teleported to her aid in Amkethran?~ GOTO SixtarchIdoNotKnow
    IF ~~ THEN REPLY ~I do not believe that Jaheira would have join you.~ GOTO SixtarchPissed
    IF ~~ THEN REPLY ~What a bunch of nonsense.~ GOTO SixtarchNonsense
END

IF ~~ THEN BEGIN SixtarchNonsense
    SAY ~Whatever. Believe what you wish.~
    IF ~~ THEN GOTO SixtarchBattlecry
END

IF ~~ THEN BEGIN SixtarchPissed
    SAY ~Then why do you ask such a question if you can't handle the truth!~
    IF ~~ THEN GOTO SixtarchBattlecry
END

IF ~~ THEN BEGIN SixtarchIdoNotKnow
    SAY ~I do not know.~
    IF ~~ THEN GOTO SixtarchBattlecry
END

IF ~~ THEN BEGIN SixtarchTiredofThis
    SAY ~Why? Because I do not suffer from delusions of self-perceived moral superiority; I serve my god, Bhaal.~
    IF ~~ THEN REPLY ~Why do you say such thing?~ GOTO SixtarchImbelicQuestion
END

IF ~~ THEN BEGIN SixtarchImbelicQuestion
    SAY ~Why am I even bothering!~
    IF ~~ THEN GOTO SixtarchBattlecry
END

IF ~~ THEN BEGIN SixtarchBattlecry
    SAY ~Our lord Bhaal! Please aid us in our struggle!~
    IF ~~ THEN DO
            ~CreateCreatureDoor("rqt5bga1",[1340.1316],0) // Bone Golem
            CreateCreatureDoor("rqt5bga1",[1400.1272],0) // Bone Golem
            CreateCreatureDoor("rqt5bga1",[1335.1351],0) // Bone Golem
            CreateCreatureDoor("rqt5bga1",[1251.1311],0) // Bone Golem
            CreateCreatureDoor("rqt5bga1",[1216.1424],0) // Bone Golem
            CreateCreatureDoor("rqt5bga1",[1833.1099],0) // Bone Golem
            CreateCreatureDoor("rqt5fw01",[1763.1203],0) // Fetid Wolf
            CreateCreatureDoor("rqt5fw01",[1495.1137],0) // Fetid Wolf
            CreateCreatureDoor("rqt5fw01",[1568.1138],0) // Fetid Wolf
            CreateCreatureDoor("rqt5fw01",[1577.1269],0) // Fetid Wolf
            CreateCreatureDoor("rqt5fw01",[1595.1138],0) // Fetid Wolf
            CreateCreatureDoor("rqt5fw01",[1414.1201],0) // Fetid Wolf
            CreateCreatureDoor("rqt5pba1",[1699.1317],0) // Putrid Bear
            CreateCreatureDoor("rqt5pba1",[1500.1160],0) // Putrid Bear
            CreateCreatureDoor("rqt5pba1",[1354.1440],0) // Putrid Bear
            CreateCreatureDoor("rqt5pba1",[1483.1274],0) // Putrid Bear
            CreateCreatureDoor("rqt5pba1",[1478.1478],0) // Putrid Bear
            CreateCreatureDoor("rqt5pba1",[1489.1402],0) // Putrid Bear
            Enemy()~
    EXIT
END

// Sixtarch Surrender
IF ~Global("rqTobRetreatImpossible","Global",3)
    !Global("rqTobItwantosPrimaryAlly","GLOBAL",1)~ THEN BEGIN NegotationsDeathsAlly
    SAY ~<CHARNAME>, we have been betrayed! I do not want want to die for nothing. I... I... wish to surrender.~
    IF ~~ THEN REPLY ~I recall these words from somewhere. Why should I believe you?~ GOTO ThreatToDS
    IF ~~ THEN REPLY ~I think I prefer your head on platter.~ GOTO ThreatToDS
END

IF ~~ THEN BEGIN ThreatToDS
    SAY ~Our deaths will not serve you in any appreciable manner; however, we can be of service to you.~
    IF ~~ THEN REPLY ~Betrayed you said?...by whom?~ GOTO BatlthazarIsHeNot
    IF ~~ THEN REPLY ~How I can make use of you?~ GOTO DSKnowledge
END

IF ~~ THEN BEGIN BatlthazarIsHeNot
    SAY ~The same entity who sabotaged our teleportation magic sought our confrontation here and my death. Don't you see, <CHARNAME>?~
    IF ~~ THEN GOTO DSKnowledge
END

// Irgulis Betrayal reaction & Joining of Sixtarch
IF ~~ THEN BEGIN DSKnowledge
    SAY ~We can provide you with magical items, and perhaps in future you might have further use of our talents.~
    IF ~~ THEN GOTO EyesandEars
    IF ~!Dead("rqt5clf1")
        !StateCheck("rqt5clf1",STATE_HELPLESS)
        !StateCheck("rqt5clf1",STATE_STUNNED)
        !StateCheck("rqt5clf1",STATE_PANIC)
        !StateCheck("rqt5clf1",STATE_BERSERK)
        !StateCheck("rqt5clf1",STATE_SLEEPING)
        !StateCheck("rqt5clf1",STATE_SILENCED)
        !StateCheck("rqt5clf1",STATE_CHARMED)
        !StateCheck("rqt5clf1",STATE_FEEBLEMINDED)
        !StateCheck("rqt5clf1",STATE_CONFUSED)~ THEN EXTERN ~rqt5dea1~ BetrayalIrgulisReaction
    IF ~!Dead("rqt6clf1")
        !StateCheck("rqt6clf1",STATE_HELPLESS)
        !StateCheck("rqt6clf1",STATE_STUNNED)
        !StateCheck("rqt6clf1",STATE_PANIC)
        !StateCheck("rqt6clf1",STATE_BERSERK)
        !StateCheck("rqt6clf1",STATE_SLEEPING)
        !StateCheck("rqt6clf1",STATE_SILENCED)
        !StateCheck("rqt6clf1",STATE_CHARMED)
        !StateCheck("rqt6clf1",STATE_FEEBLEMINDED)
        !StateCheck("rqt6clf1",STATE_CONFUSED)~ THEN EXTERN ~rqt6dea2~ JoinSixtarchInBetrayal
END

// Reaction to Irgulis
IF ~~ THEN BEGIN ReactionToItwantos
    SAY ~Then die like a dog loyal to master who betrayed you!~
    IF ~~ THEN GOTO EyesandEars
END

IF ~~ THEN BEGIN EyesandEars
    SAY ~What do you think? That we shall be your own personal eyes and ears?~
    IF ~~ THEN REPLY ~My own personal cult? I like the sound of that.~
            DO
                ~SetGlobal("rqTobSixtarchIsPrimaryAlly","GLOBAL",1)
                SetGlobal("rqTobRetreatImpossible","Global",4)
                SetGlobal("rqTobChangeToAlly","GLOBAL",1)~
            EXIT
    IF ~~ THEN REPLY ~No I think you would stab me in back in fist available opportunity.~ EXIT
END

IF ~~ THEN BEGIN JoinUpThenSixtarchSays
    SAY ~With you, we will have a bigger chance.~
    IF ~~ THEN GOTO EyesandEars
END

// Swearing in
IF ~Global("rqTobSixtarchIsPrimaryAlly","GLOBAL",2)~ THEN BEGIN YourOwnCult
    SAY ~I, Sixtarch, and my group solemnly swear an oath of allegiance to <LADYLORD> <CHARNAME>!~
    IF ~~ THEN GOTO LoyaltyToCharname
    IF ~!Dead("rqt6clf1")
        !StateCheck("rqt6clf1",STATE_HELPLESS)
        !StateCheck("rqt6clf1",STATE_STUNNED)
        !StateCheck("rqt6clf1",STATE_PANIC)
        !StateCheck("rqt6clf1",STATE_BERSERK)
        !StateCheck("rqt6clf1",STATE_SLEEPING)
        !StateCheck("rqt6clf1",STATE_SILENCED)
        !StateCheck("rqt6clf1",STATE_CHARMED)
        !StateCheck("rqt6clf1",STATE_FEEBLEMINDED)
        !StateCheck("rqt6clf1",STATE_CONFUSED)~ THEN EXTERN ~rqt6dea2~ LoyaltyToCharnameItwantos
END

IF ~~ THEN BEGIN LoyaltyToCharname
    SAY ~<PRO_LADYLORD> <CHARNAME>, we are yours to command. What do you have us do?~
    IF ~~ THEN REPLY ~First, give me your holy symbols.~ GOTO GiveHolySymbols2
    IF ~~ THEN REPLY ~You said something about there being someone else conspiring against me? I want them dead.~ GOTO AttackTemple1
    IF ~~ THEN REPLY ~You will help with my assault on Balthazar's monastery.~ GOTO AssaultOnBaltazar
    IF ~~ THEN REPLY ~Information. What were you supposed to do, and who did you serve?~ GOTO InformationAboutDScult
END

IF ~~ THEN BEGIN LoyaltyToCharname2
    SAY ~<PRO_LADYLORD> <CHARNAME> you we are your to command. What do you have us do?~
    IF ~~ THEN REPLY ~You said something about there being someone else conspiring against me? I want them dead.~ GOTO AttackTemple1
    IF ~~ THEN REPLY ~You will help with my assault on Balthazar's monastery.~ GOTO AssaultOnBaltazar
    IF ~~ THEN REPLY ~Information. What were you supposed to do, and who did you serve?~ GOTO InformationAboutDScult
END

// Holy symbols
IF ~~ THEN BEGIN GiveHolySymbols2
    SAY ~We will not need them anyway.~
    IF ~~ THEN
        DO
            ~GiveItem("rqhosy1",Player1)
            ActionOverride("rqmalch",StartDialogNoSet(Player1))
            ActionOverride("rqt6clf1",GiveItem("rqhosy1",Player1))
            ActionOverride("rqt6clt1",GiveItem("rqhosy1",Player1))
            ActionOverride("rqt6clt2",GiveItem("rqhosy1",Player1))
            ActionOverride("rqt7clt1",GiveItem("rqhosy1",Player1))
            ActionOverride("rqt7clt2",GiveItem("rqhosy1",Player1))~ GOTO LoyaltyToCharname2
END

IF ~~ THEN BEGIN AttackTemple1
    SAY ~Yes. Then we have to infiltrate or storm the Temple of Bhaal. A difficult task, though we know the location and can take control of its guardians.~
    IF ~~ THEN REPLY ~What will I gain from this?~ GOTO GainFromAssaultOnTemple
    IF ~~ THEN REPLY ~I'd rather you help me with assault on Balthazar's monastery.~ GOTO AssaultOnBaltazar
    IF ~~ THEN REPLY ~I wish to know more about your activities.~ GOTO InformationAboutDScult
END

IF ~~ THEN BEGIN AssaultOnBaltazar
    SAY ~Balthazar's monastery... hmm, we could sneak past the monks and strike at Balthazar inside. Be aware that then we cannot strike at our former temple.~
    IF ~~ THEN REPLY ~Why not?~ GOTO TempleWhyStormWillFail
    IF ~~ THEN REPLY ~I want you to assault Balthazar's Monastery with me.~ GOTO AssaultBalthazar
    IF ~~ THEN REPLY ~Perhaps I require more information about your past.~ GOTO InformationAboutDScult
END

IF ~~ THEN BEGIN TempleWhyStormWillFail
    SAY ~Setherus, our former leader, expects us. If we fail to return, he will start to suspect something. This will vaporize our surprise factor. We cannot take the temple without surprise playing in our favor.~
    IF ~~ THEN REPLY ~Balthazar is the priority; you will help me with him.~ GOTO AssaultBalthazar
    IF ~~ THEN REPLY ~I am authorizing an assault on your temple to kill this Setherus. Return to me when you have finished.~ GOTO AssaultBalthazar
    IF ~~ THEN REPLY ~Tell me more about your cult and your roles inside it.~ GOTO InformationAboutDScult
END

IF ~~ THEN BEGIN AssaultTemple
    SAY ~<PRO_LADYLORD> <CHARNAME>, we shall do as commanded.~
    IF ~~ THEN
        DO ~SetGlobal("rqTobAssaultTemple","GLOBAL",1)
        SetGlobal("rqTobSixtarchIsPrimaryAlly","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN AssaultBalthazar
    SAY ~<PRO_LADYLORD> <CHARNAME>, we shall do as commanded.~
    IF ~~ THEN
        DO ~SetGlobal("rqTobAssaultBalthazar","GLOBAL",1)
        SetGlobal("rqTobSixtarchIsPrimaryAlly","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN GainFromAssaultOnTemple
    SAY ~The temple has magic items which will surely come in handy for you. Also, it is where Setherus is; we can extract from him if and who he is serving.~
    IF ~~ THEN REPLY ~I do wish it. Go there and kill everyone and everything.~ GOTO AssaultTemple
    IF ~~ THEN REPLY ~I'm thinking that storming Balthazar with me is a better thing to do.~ GOTO AssaultBalthazar
    IF ~~ THEN REPLY ~No, I'd rather learn more about your past.~ GOTO InformationAboutDScult
END
// Balthering about plot
IF ~~ THEN BEGIN InformationAboutDScult
    SAY ~<PRO_LADYLORD> <CHARNAME>, if I know, I will answer.~
    IF ~~ THEN REPLY ~Who are you, and who is giving you orders?~ GOTO WhoAreYouLeaderSetherus
    IF ~~ THEN REPLY ~What's the Harper role in all this?~ GOTO HarperRole
    IF ~~ THEN REPLY ~What exactly was your assignment concerning me?~ GOTO AssignmentAboutCHARNAME
    IF ~~ THEN REPLY ~How was Jaheira involved with you?~ GOTO JaheiraInvolvement
    IF ~~ THEN REPLY ~What did your cult do to Jaheira?~ GOTO SetherusJaheiraRevival
    IF ~~ THEN REPLY ~Your holy symbols look like those of Cyric.~ GOTO HolySymbols1
    IF ~~ THEN REPLY ~Who is this Setherus?~ GOTO SetherusWhoIsHe
    IF ~~ THEN REPLY ~Nothing that I need for now.~ GOTO LoyaltyToCharname
END

IF ~~ THEN BEGIN SetherusWhoIsHe
    SAY ~Setherus is leader of Deathstalkers. He is the one who sent us here.~
    IF ~~ THEN REPLY ~Could he be the saboteur of your magic?~ GOTO SetherusLoyalty
END

IF ~~ THEN BEGIN SetherusLoyalty
    SAY ~No, he is far too loyal to Bhaal... It must be someone else from the temple.~
    IF ~~ THEN REPLY ~I have more questions for you.~ GOTO InformationAboutDScult
END

IF ~~ THEN BEGIN WhoAreYouLeaderSetherus
    SAY ~We were members of secret Deathstalker sect. Our leader was Setherus.~
    IF ~~ THEN REPLY ~I have more questions for you.~ GOTO InformationAboutDScult
END

IF ~~ THEN BEGIN HolySymbols1
    SAY ~Yes, me and Itwantos's group were hiding among a Cyric cult.~
    IF ~~ THEN REPLY ~I have more questions for you.~ GOTO InformationAboutDScult
END

IF ~~ THEN BEGIN AssignmentAboutCHARNAME
    SAY ~Our assignment was to spy on you and abduct one of your companions to gain knowledge about you. When you killed Jaheira, we knew we could just take her corpse to the temple so she could be interrogated.~
    IF ~~ THEN REPLY ~Did this Setherus do anything to her apart from revival?~ GOTO OtherThanRevival
    IF ~~ THEN REPLY ~What happened then?~ GOTO OtherThanRevival
END

IF ~~ THEN BEGIN OtherThanRevival
    SAY ~I was not present, though Setherus's dealings with Jaheira were conducted alone between the two of them.~
    IF ~~ THEN REPLY ~Why don't you tell me full history? How did the Harpers get involved? And how were Illasera and the Five involved in all this?~ GOTO FullHistory
    IF ~~ THEN REPLY ~I have different questions.~ GOTO InformationAboutDScult
END

IF ~~ THEN BEGIN FullHistory
    SAY ~Again, the Harpers got involved only after Jaheira died her first death. Illasera was the same case; we wanted to learn about you from dead enemies.~
    IF ~Dead("rqbar30a")~ THEN REPLY ~I have killed Blutdurst and his party; they definitely did not appear wholly human to me.~ GOTO NoAnswersFromSixtarch
    IF ~~ THEN REPLY ~Then who provided her with so many resources?~ GOTO NoAnswersFromSixtarch
END

IF ~~ THEN BEGIN NoAnswersFromSixtarch
    SAY ~Setherus might know the answers to these questions. If you wish to know more, <PRO_LADYLORD> <CHARNAME>, you should send us to assault the temple.~
    IF ~~ THEN REPLY ~Right more questions.~ GOTO InformationAboutDScult
END

IF ~~ THEN BEGIN SetherusJaheiraRevival
    SAY ~Setherus will know more. We just found Jaheira and brought her to Setherus.~
    IF ~~ THEN REPLY ~I have more questions.~ GOTO InformationAboutDScult
END

IF ~~ THEN BEGIN JaheiraInvolvement
    SAY ~I have no knowledge beyond that there was bad blood between you two. She mentioned names like Galvarey and Mintiper.~
    IF ~~ THEN REPLY ~I sure killed a lot of them. Next question.~ GOTO InformationAboutDScult
    IF ~Alignment(Player1,"MASK_GOOD") Alignment(Player1,"MASK_GENEUTRAL")~ THEN REPLY ~I don't think I believe you; she always held herself to high moral standards.~ GOTO JaheiraGood
END

IF ~~ THEN BEGIN JaheiraGood
    SAY ~Is a temporary alliance between two groups who share a common enemy so unbelievable?~
    IF ~~ THEN REPLY ~I have questions that I need answers for.~ GOTO InformationAboutDScult
END

IF ~~ THEN BEGIN HarperRole
    SAY ~All cooperation happened through Jaheira.~
    IF ~~ THEN REPLY ~Answers are needed.~ GOTO InformationAboutDScult
END

BEGIN ~rqtrugos~

IF ~InParty("rqrev")
    Global("rqT5DeathStalkerEncounter1","GLOBAL",0)~
    THEN BEGIN RugosT5RevanIntroDialogue
    SAY ~Ah, Captain! Glad I am to find ye here. I’ve got new contracts for yer crew.~
    IF ~~ THEN EXTERN ~rqrev25J~ RevanT5IntroDeath
END

IF ~~ THEN BEGIN RugosT5CloakedWoman
    SAY ~That be the suspicious part, aye. A cloaked man did approach me and handed over contracts to rid nine priests of Bhaal, he did.~
    IF ~~ THEN EXTERN ~rqrev25J~ RevanTrapT5
END

IF ~~ THEN BEGIN RugosT5Contract25000G
    SAY ~In the Marching Mountains, it be said there be priests of the dead god Bhaal. Your task be to slay 'em for 25,000 gold coins. Fail to take 'em all down, and ye'll earn a lesser reward, aye.~
    IF ~~ THEN REPLY ~Alright I accept.~ GOTO RugosT1Accept
    IF ~~ THEN REPLY ~How about some more information about these Priests of Bhaal or man in the hood who ordered this contract?~ GOTO RugosT5NoMoreInformationToGive
    IF ~~ THEN REPLY ~We don't have time for this.~ GOTO RugosT1Rejected
END

IF ~~ THEN BEGIN RugosT5NoMoreInformationToGive
    SAY ~Hmph. Wish I had more info, but alas, I do not. You take it or leave it—no grudge held if you refuse this contract.~
    IF ~~ THEN REPLY ~I will take it.~ GOTO RugosT1Accept
    IF ~~ THEN REPLY ~No it sounds too sketchy to be interested.~ GOTO RugosT1Rejected
END

IF ~~ THEN BEGIN RugosT1Rejected
    SAY ~Aye, it be lookin' like a trap, it does. If ye change yer mind, I’ll be stayin’ right here. Farewell, friend.~
    IF ~~ THEN DO
        ~SetGlobal("rqT5DeathStalkerEncounter1","GLOBAL",3)~ // Rejected
    EXIT
END

IF ~~ THEN BEGIN RugosT1Accept
    SAY ~Ah, well now, I do hope ye make it back intact, aye.~
    IF ~~ THEN DO
        ~SetGlobal("rqT5DeathStalkerEncounter1","GLOBAL",1)~ // Accepted
            UNSOLVED_JOURNAL ~Assassination Contract: Marching Mountains

            I have agreed to return to the Marching Mountains to assassinate clerics of Bhaal for 25,000 gold pieces. The dwarf Rugos acquired this contract under very suspicious circumstances, so I should be prepared for ambushes. When I am done, I should return to the Zephir Tavern in Amkethran.~
    EXIT
END
/* --------------------- Deathslatker T5-1 Quest -1- No Revan --------------------- */
// test without revan
IF ~!InParty("rqrev") Global("rqT5DeathStalkerEncounter1","GLOBAL",0)~
    THEN BEGIN RugosT5IntroRevanNotInParty
    SAY ~Greetings, <CHARNAME>. Aye, ye may not ken me, but I ken ye well enough. And a new task awaits, if ye be inclined.~
    IF ~~ THEN REPLY ~So what kind of contracts do you have?~ GOTO RugosT5DetailsNoRevan
    IF ~~ THEN REPLY ~Not interested.~ GOTO RugosT5RejectedNoRevan1
END

IF ~~ THEN BEGIN RugosT5DetailsNoRevan
    SAY ~Aye, listen well. The first order o' business is dealin' with what some folk call Deathstalkers of Bhaal lurkin' in the Marching Mountains. We’re talkin’ a hefty 25,000 gold coins for the job. But heed me words—things might not be as straightforward as they appear. Be cautious, aye.~
    IF ~~ THEN REPLY ~Why do you say this might be trap?~ GOTO RugosT5WhoNoRevan
END

IF ~~ THEN BEGIN RugosT5WhoNoRevan
    SAY ~Aye, that mage, he comes to me in Athkatla, wantin' us to bury some priests in their own temple down Tethyr way. Told 'im the road was too long for my kin. Then the wretch drops yer name, says ye might be fool enough to handle it. I grew wary as a wet cat then, but when he said I'd find ye holed up in Amkethran... well, I made haste. Thought I'd best bring ye a warnin', lad. Thought ye should know.~
    IF ~~ THEN REPLY ~Did he told you his name?~ GOTO Rugos5MageWhoHeWas
    IF ~~ THEN REPLY ~How did you knew he was mage?~ GOTO RugosT5HowKnewHeMage
    IF ~~ THEN REPLY ~How did he knew where you can find me?~ GOTO RugosT5TrapExplain
END

IF ~~ THEN BEGIN Rugos5MageWhoHeWas
    SAY ~Nay, he did not spill his name when I queried; he ignored me.~
    IF ~~ THEN REPLY ~How did you knew he was mage?~ GOTO RugosT5HowKnewHeMage
END

IF ~~ THEN BEGIN RugosT5HowKnewHeMage
    SAY ~Hmph... he employed magic to depart. Ye interested?~
    IF ~~ THEN REPLY ~Alright, I am. Tell me the details.~GOTO RugosT5AcceptNoRevan
    IF ~~ THEN REPLY ~Not interested in taking this contract.~ GOTO RugosT5RejectedNoRevan1
END

IF ~~ THEN BEGIN RugosT5RejectedNoRevan1
    SAY ~Uninterested? Can't blame ye. I will be here if ye change yer mind.~
    IF ~~ THEN DO ~SetGlobal("rqT5DeathStalkerEncounter1","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN RugosT5TrapExplain
    SAY ~No mind comes to explain... All I can tell ye is he knew ye knew where ye'd be and offered ye to kill priests here in Tethyr.~
    IF ~~ THEN REPLY ~Now that does sound like ambush still I have survived many assassinations I am sure I best whoever set this up.~ GOTO RugosT5AcceptNoRevan
    IF ~~ THEN REPLY ~What about the details then?~ GOTO RugosT5Details1
    IF ~~ THEN REPLY ~Not interested for now. Farewell.~ GOTO RugosT5RejectedNoRevan1
END

IF ~~ THEN BEGIN RugosT5Details1
    SAY ~Targets be Deathstalkers, remnants of Bhaal's cursed cult, aye. Your task be to slay 'em while they venture into Marching Mountains. Word be they gatherin' bones there for craftin' golems, so be swift. Let me tell ye the details.~
    IF ~~ THEN GOTO RugosT5AcceptNoRevan
END

IF ~Global("rqT5DeathStalkerEncounter1","GLOBAL",3)~ THEN BEGIN RugosT5UnchangedQuest
    SAY ~Have ye returned, and have ye given it another thought?~
    IF ~~ THEN REPLY ~You mentioned this might be a trap or something?~ GOTO RugosT5TrapExplain
    IF ~~ THEN REPLY ~Yes I have tell me about this contract.~ GOTO RugosT5AcceptNoRevan
    IF ~~ THEN REPLY ~My mistake, Farewell.~ EXIT
END

// accepted
IF ~~ THEN BEGIN RugosT5AcceptNoRevan
    SAY ~Right, kill priests in Fire Giant Temple for 25000 gold. I was told priests are sent there to gather corpses and such to build golems. If you fail you will get only fraction of reward. So priority is to kill the priests.~
    IF ~~ THEN REPLY ~Alright I accept.~
        DO
            ~SetGlobal("rqT5DeathStalkerEncounter1","GLOBAL",1)~
            UNSOLVED_JOURNAL ~Assassination Contract: Marching Mountains

            I have agreed to return to the Marching Mountains to assassinate clerics of Bhaal for 25,000 gold pieces. The dwarf Rugos acquired this contract under very suspicious circumstances, so I should be prepared for ambushes. When I am done, I should return to the Zephir Tavern in Amkethran.~
        EXIT
    IF ~~ THEN REPLY ~No this was mistake, Farewell.~ EXIT
END
// not done yet
IF ~Global("rqT5DeathStalkerEncounter1","GLOBAL",1)~ THEN BEGIN RugosT5UnchangedQuest
    SAY ~Greetings, are them priests in the Marching Mountains fallen?~
    IF ~~ THEN REPLY ~No not yet.~ EXIT
END

IF ~Global("rqT5DeathStalkerEncounter1","GLOBAL",2)
    Dead("rqt5clf1")
    Dead("rqt5clt1")
    Dead("rqt5clt2")~ THEN BEGIN RugosT5QuestDoneNoRevan
    SAY ~Ye've slain them Priests, have ye? Any ambushes met along the way?~
    IF ~~ THEN REPLY ~They were surprised to see me, and all the priests are dead.~ GOTO Rutos5DoneBIGlReward
END

IF ~OR(3)
        !Dead("rqt5clf1")
        !Dead("rqt5clt1")
        !Dead("rqt5clt2")
    Global("rqT5DeathStalkerEncounter1","GLOBAL",2)~ THEN BEGIN RugosT5QuestDone
    SAY ~Ye've slain them Priests, eh? Did ye come upon any sneaky ambush, then?~
    IF ~~ THEN REPLY ~It did not look like an ambush, though we did not kill all the clerics.~ GOTO Rugos5DoneSmallReward
END

IF ~~ THEN BEGIN Rugos5DoneSmallReward
    SAY ~Hrrm, I reckon I’d rather give ye the full reward, risks be what they be. But deal’s a deal, aye.~
    IF ~~ THEN DO
            %SetGlobal("rqT5DeathStalkerEncounter1","GLOBAL",4)
            GiveGoldForce(2000)
            EraseJournalEntry (~Assassination Contract: Marching Mountains

            I have agreed to return to the Marching Mountains to assassinate clerics of Bhaal for 25,000 gold pieces. The dwarf Rugos acquired this contract under very suspicious circumstances, so I should be prepared for ambushes. When I am done, I should return to the Zephir Tavern in Amkethran.~)
            %
            SOLVED_JOURNAL ~Assassination Contract: Marching Mountains.

            Marching Mountains I have not killed all of the priests so I received only small reward of 2000 gold.~ GOTO RugosAmulets
END

IF ~~ THEN BEGIN Rutos5DoneBIGlReward
    SAY ~Ah, it be good to see ye pleased, friend. Here be yer full reward, as promised.~
    IF ~~ THEN DO
            %SetGlobal("rqT5DeathStalkerEncounter1","GLOBAL",4)
            GiveGoldForce(25000)
            EraseJournalEntry (~Assassination Contract: Marching Mountains

            I have agreed to return to the Marching Mountains to assassinate clerics of Bhaal for 25,000 gold pieces. The dwarf Rugos acquired this contract under very suspicious circumstances, so I should be prepared for ambushes. When I am done, I should return to the Zephir Tavern in Amkethran.~)
            %
            SOLVED_JOURNAL ~Assassination Contract: Marching Mountains.

            Marching Mountains I have killed all of the priests and got full reward of 25000 gold.~ GOTO RugosAmulets
END

IF ~~ THEN BEGIN RugosAmulets
    SAY ~This whole mess, it makes my beard bristle, I tell ya.~
    IF ~~ THEN REPLY ~I think that whoever put these contracts up knew exactly where Deathstalkers would be. My thinking is that someone inside their cult wants them dead.~ GOTO RugosWhoWantsDeadDS
END

IF ~~ THEN BEGIN RugosWhoWantsDeadDS
    SAY ~We understand each other, aye. But enough of words, yes. Next contracts is...~
    IF ~~ THEN GOTO RugosNextContract
END

IF ~~ THEN BEGIN RugosNextContract
    SAY ~Hah! Bounty paid for bringin' me their sacred symbols, aye. I’ll reward ye four thousand gold per symbol ye hand over. No fuss, no specifics, no tellin' where. So if ye cross paths with Deathstalkers or Bhaal’s priests carryin' such holy things, best make 'em dead, aye.~
    IF ~~ THEN REPLY ~So, am I to just bring you the holy symbols and receive gold?~ GOTO RugosHunting
    IF ~~ THEN REPLY ~I have so much to do and not enough time. My destiny comes first. Farewell.~ GOTO RugosGoesBackToAmnRevanSent
END

IF ~~ THEN BEGIN RugosHunting
    SAY ~Aye, that be right. I wish ye good fortune in yer hunt, Fare thee well.~
    IF ~~ THEN
            UNSOLVED_JOURNAL ~Stalk the Deathstalkers to death.

            I have received another contract from Rugos. I am to hunt for priests of my dead father. As proof of death, I am to bring their holy symbols to Rugos in Zephir Tavern in Amkethran. The reward is 4,000 gold for each holy symbol.~
        EXIT
END

IF ~PartyHasItem("rqhosy1") !HasItem("rqhosy1",Myself)~ THEN BEGIN RugosHolySymbols
    SAY ~Hmph. Do ye possess one o' their sacred emblems, then?~
    IF ~NumItemsParty("rqhosy1",1)~ THEN REPLY ~Yes, in fact, I do. Look at it from the side. The Cyricist symbol changes to Bhaalist. I have one such holy symbol.~ GOTO Rugos1HolySymbol
    IF ~NumItemsParty("rqhosy1",2)~ THEN REPLY ~Yes, in fact, I do. Look at it from the side. The Cyricist symbol changes to Bhaalist. I have two such holy symbols.~ GOTO Rugos2HolySymbol
    IF ~NumItemsParty("rqhosy1",3)~ THEN REPLY ~Yes, in fact, I do. Look at it from the side. The Cyricist symbol changes to Bhaalist. I have three such holy symbols.~ GOTO Rugos3HolySymbol
    IF ~NumItemsParty("rqhosy1",4)~ THEN REPLY ~Yes, in fact, I do. Look at it from the side. The Cyricist symbol changes to Bhaalist. I have four such holy symbols.~ GOTO Rugos4HolySymbol
    IF ~NumItemsParty("rqhosy1",5)~ THEN REPLY ~Yes, in fact, I do. Look at it from the side. The Cyricist symbol changes to Bhaalist. I have five such holy symbols.~ GOTO Rugos5HolySymbol
    IF ~NumItemsParty("rqhosy1",6) !InParty("rqrev") !InMyArea("rqrev")~ THEN REPLY ~Yes, in fact, I do. Look at it from the side. The Cyricist symbol changes to Bhaalist. I have six such holy symbols.~ GOTO Rugos6HolySymbol
    IF ~NumItemsParty("rqhosy1",6) InParty("rqrev") !InMyArea("rqrev")~ THEN REPLY ~Yes, in fact, I do. Look at it from the side. The Cyricist symbol changes to Bhaalist. I have six such holy symbols.~ GOTO Rugos6HolySymbol
    IF ~NumItemsParty("rqhosy1",6) InParty("rqrev") InMyArea("rqrev") !StateCheck("rqrev",STATE_SLEEPING)~ THEN REPLY ~Yes, in fact, I do. Look at it from the side. The Cyricist symbol changes to Bhaalist. I have six such holy symbols.~ GOTO Rugos6HolySymbolRevanLeadup

END

IF ~~ THEN BEGIN Rugos1HolySymbol
    SAY ~By the stones, I n'er seen such trickery in all me days. Bring me more to claim the rest of the gold, aye.~
    IF ~~ THEN DO ~GiveGoldForce(4000) TakePartyItem("rqhosy1")~ EXIT
END

IF ~~ THEN BEGIN Rugos2HolySymbol
    SAY ~By the stones, I n'er seen such trickery in all me days. Bring me more to claim the rest of the gold, aye.~
    IF ~~ THEN DO ~GiveGoldForce(8000) TakePartyItemNum("rqhosy1",2)~ EXIT
END

IF ~~ THEN BEGIN Rugos3HolySymbol
    SAY ~By the stones, I n'er seen such trickery in all me days. Bring me more to claim the rest of the gold, aye.~
    IF ~~ THEN DO ~GiveGoldForce(12000) TakePartyItemNum("rqhosy1",3)~ EXIT
END

IF ~~ THEN BEGIN Rugos4HolySymbol
    SAY ~By the stones, I n'er seen such trickery in all me days. Bring me more to claim the rest of the gold, aye.~
    IF ~~ THEN DO ~GiveGoldForce(16000) TakePartyItemNum("rqhosy1",4)~ EXIT
END

IF ~~ THEN BEGIN Rugos5HolySymbol
    SAY ~By the stones, I n'er seen such trickery in all me days. Bring me more to claim the rest of the gold, aye.~
    IF ~~ THEN DO ~GiveGoldForce(20000) TakePartyItemNum("rqhosy1",5)~ EXIT
END

IF ~NumItems("rqhosy1",Myself,6)~ THEN BEGIN Rugos5EnoughSymbols
    SAY ~Ah, ye've done what was asked, aye. It was good dealin' with ye, I suppose. Farewell.~
    IF ~!InParty("rqrev")~ THEN GOTO RugosGoesBackToAmnRevanSent
    IF ~InParty("rqrev") !InMyArea("rqrev")~ THEN GOTO RugosGoesBackToAmnRevanSent
    IF ~InParty("rqrev")
        InMyArea("rqrev")
        !StateCheck("rqrev",STATE_SLEEPING)~ THEN EXTERN ~rqrev25J~ RugosT6GoBackToAmn
END

IF ~HasItem("rqhosy1",Myself) !NumItems("rqhosy1",Myself,6)~ THEN BEGIN RugosSecond
    SAY ~Greetings, good sir. How many Holy symbols have ye brought me?~
    IF ~NumItemsParty("rqhosy1",1)~ THEN REPLY ~I have one such Holy symbol.~ GOTO Rugos2ndReaction111
    IF ~NumItemsParty("rqhosy1",2)~ THEN REPLY ~I have two such Holy symbols.~ GOTO Rugos2ndReaction222
    IF ~NumItemsParty("rqhosy1",3)~ THEN REPLY ~I have three such Holy symbols.~ GOTO Rugos3HolySymbol333
    IF ~NumItemsParty("rqhosy1",4)~ THEN REPLY ~I have four such Holy symbols.~ GOTO Rugos4HolySymbol444
    IF ~NumItemsParty("rqhosy1",5)~ THEN REPLY ~I have five such Holy symbols.~ GOTO Rugos5HolySymbol555
END

IF ~~ THEN BEGIN Rugos2ndReaction111
    SAY ~Ah, well now, let me see just how many I got at this moment, aye.~
    IF ~~ THEN DO ~GiveGoldForce(4000) TakePartyItem("rqhosy1")~ EXIT
END

IF ~~ THEN BEGIN Rugos2ndReaction222
    SAY ~Ah, well now, let me see just how many I got at this moment, aye.~
    IF ~~ THEN DO ~GiveGoldForce(8000) TakePartyItemNum("rqhosy1",2)~ EXIT
END

IF ~~ THEN BEGIN Rugos3HolySymbol333
    SAY ~Ah, well now, let me see just how many I got at this moment, aye.~
    IF ~~ THEN DO ~GiveGoldForce(12000) TakePartyItemNum("rqhosy1",3)~ EXIT
END

IF ~~ THEN BEGIN Rugos4HolySymbol444
    SAY ~Ah, well now, let me see just how many I got at this moment, aye.~
    IF ~~ THEN DO ~GiveGoldForce(16000) TakePartyItemNum("rqhosy1",4)~ EXIT
END

IF ~~ THEN BEGIN Rugos5HolySymbol555
    SAY ~Ah, well now, let me see just how many I got at this moment, aye.~
    IF ~~ THEN DO ~GiveGoldForce(20000) TakePartyItemNum("rqhosy1",5)~ EXIT
END

IF ~~ THEN BEGIN Rugos6HolySymbol
    SAY ~This be the full bounty of twenty-four thousand gold coins, aye. That be all I have, for I must head back to Athkatla.~
    IF ~~ THEN
        DO
            %GiveGoldForce(24000)
            EraseJournalEntry (~Stalk the Deathstalkers to death.

            I have received another contract from Rugos. I am to hunt for priests of my dead father. As proof of death, I am to bring their holy symbols to Rugos in Zephir Tavern in Amkethran. The reward is 4,000 gold for each holy symbol.~)
            EscapeArea()%
            SOLVED_JOURNAL ~Stalk the Deathstalkers to death.

            I have sucessfully hunted hunted down Deathstalkers. This ends Rugos quests in Amkethran.~
        EXIT
END

IF ~~ THEN BEGIN Rugos6HolySymbolRevanLeadup
    SAY ~Ah, listen well, for ye shall receive the full bounty of twenty-four thousand gold pieces, aye.~
    IF ~~ THEN
        DO %GiveGoldForce(24000)
            TakePartyItemNum("rqhosy1",6)
            EraseJournalEntry (~Stalk the Deathstalkers to death.

            I have received another contract from Rugos. I am to hunt for priests of my dead father. As proof of death, I am to bring their holy symbols to Rugos in Zephir Tavern in Amkethran. The reward is 4,000 gold for each holy symbol.~)
            %
            SOLVED_JOURNAL ~Stalk the Deathstalkers to death.
            I have sucessfully hunted hunted down Deathstalkers. This ends Rugos quests in Amkethran.~ EXTERN ~rqrev25J~ RugosT6GoBackToAmn
END

IF ~~ THEN BEGIN RugosGoesBackToAmnRevanSent
    SAY ~Right I be leaving now.~
    IF ~~ THEN DO ~EscapeArea()~ EXIT
END
// Imp Geselarn T8
BEGIN ~rqt8imp~

IF ~Global("rqTobItwantosPrimaryAlly","GLOBAL",1)~ THEN BEGIN ImpMessenger //Global("rqTobItwantosPrimaryAlly","GLOBAL",1)
    SAY ~Greetings from Itwantos I bring. He wishes to transfer these items to your possession.~
    IF ~~ THEN DO
            ~GiveItemCreate("POTN55",Player1,15,1,0) // Potion of Superior Healing
            GiveItemCreate("POTN41",Player1,7,1,0) // Potion of Power
            GiveItemCreate("POTN07",Player1,4,1,0) // Potion of Storm Giant Strength
            GiveItem("rqletitw",Player1) // Letter from Itwantos
            GiveItem("rqbrac03",Player1) // Graal's Fist
            GiveItem("rqtome01",Player1) // Book of the Dead
            GiveItem("rqrobe01",Player1) // Iluvaskar's Robe of Defence
            CreateVisualEffectObject("ICFIRSDI",Myself)
            DestroySelf()~
        EXIT
END
// IMP in Balthazar monastery
BEGIN ~rqt8imp1~

IF ~Global("rqTobAssaultTemple","GLOBAL",1)~ THEN BEGIN ImpMessengerSixtarch //
    SAY ~Master Sixtarch wishes to relay following message: <PRO_LADYLORD> <CHARNAME>, we have been successful beyond your wildest imagination. Setherus and whole enclave are dead.~
    =
    ~He also wanted you to have forward these items to you.~
    IF ~~ THEN DO
            ~GiveItem("rqsixsto",Player1) // Beacon Stone
            GiveItem("rqletsi1",Player1) // Letter temple information
            GiveItem("rqbrac03",Player1) // Graal's Fist
            GiveItem("rqtome01",Player1) // Book of the Dead
            GiveItem("rqrobe01",Player1) // Iluvaskar's Robe of Defence
            CreateVisualEffectObject("ICFIRSDI",Myself)
            DestroySelf()~
        EXIT
END

// IMP in Balthazar monastery
BEGIN ~rqt8imp2~

IF ~Global("rqTobAssaultBalthazar","GLOBAL",1)~ THEN BEGIN ImpMessengerSixtarch //Global("rqTobAssaultTemple","GLOBAL",1)
    SAY ~Master Sixtarch wishes to relay following message: <PRO_LADYLORD> <CHARNAME> Setherus somehow found about our betrayal. Unfortunately we were forced to act thus we left this monastery.~
    =
    ~He also wanted you to have this summoning stone and accompanying letter.~
    IF ~~ THEN DO
            ~GiveItem("rqsixsto",Player1) // Beacon Stone
            GiveItem("rqletsi2",Player1) // Letter Baltazar help info
            CreateVisualEffectObject("ICFIRSDI",Myself)
            DestroySelf()~
        EXIT
END

// Sixtarch ---------------------------------------------------------------------------------------------------------
BEGIN ~rqt0clf1~
/*
INTERJECT_COPY_TRANS FINSOL01 27 SixtarchDivinity
== rqt0clf1 IF ~GlobalLT("SixtarchDivinity","GLOBAL",1)
        !StateCheck("rqt0clf1",STATE_HELPLESS)
        !StateCheck("rqt0clf1",STATE_STUNNED)
        !StateCheck("rqt0clf1",STATE_PANIC)
        !StateCheck("rqt0clf1",STATE_BERSERK)
        !StateCheck("rqt0clf1",STATE_SLEEPING)
        !StateCheck("rqt0clf1",STATE_SILENCED)
        !StateCheck("rqt0clf1",STATE_CHARMED)
        !StateCheck("rqt0clf1",STATE_FEEBLEMINDED)
        !StateCheck("rqt0clf1",STATE_CONFUSED)~ THEN ~<LADYLORD> <CHARNAME> is victorious! We shall become instruments of your divine power!~
END
*/
IF ~RandomNum(7,1)~ THEN BEGIN CultistsBow201
  SAY ~I bow before your will <PRO_LADYLORD> <CHARNAME>!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,2)~ THEN BEGIN PlansForNaught201
  SAY ~Concocted plans for you to kill the Five yet failed to comprehend by doing so she had enabled your ascension!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,3)~ THEN BEGIN OverwhelmingAndSoothing201
  SAY ~Overwhelming yet soothing this place is.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,4)~ THEN BEGIN CHARNAMEDivinityComment201
  SAY ~I have never seen a god yet I think... i.. can see divinity in your eyes... <PRO_LADYLORD> <CHARNAME>.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,5)~ THEN BEGIN Retribution201
  SAY ~She betrayed yet we are here to extract our retribution!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,6)~ THEN BEGIN RevengeOnAmelissan201
  SAY ~Revenge shall be ours! Amelissan shall suffer greatly!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,7)~ THEN BEGIN Feelings201
  SAY ~This is amazing I can...i...can feel our dead god everywhere.~
  IF ~~ THEN EXIT
END

// Itwantos ---------------------------------------------------------------------------------------------------------
BEGIN ~rqt0clf2~
/*
INTERJECT_COPY_TRANS FINSOL01 27 SixtarchAllyItwantos
== rqt0clf2 IF ~GlobalLT("SixtarchDivinity","GLOBAL",1)
        !Dead("rqt0clf2")
        !StateCheck("rqt0clf2",STATE_HELPLESS)
        !StateCheck("rqt0clf2",STATE_STUNNED)
        !StateCheck("rqt0clf2",STATE_PANIC)
        !StateCheck("rqt0clf2",STATE_BERSERK)
        !StateCheck("rqt0clf2",STATE_SLEEPING)
        !StateCheck("rqt0clf2",STATE_SILENCED)
        !StateCheck("rqt0clf2",STATE_CHARMED)
        !StateCheck("rqt0clf2",STATE_FEEBLEMINDED)
        !StateCheck("rqt0clf2",STATE_CONFUSED)~ THEN ~<LADYLORD> <CHARNAME> you are victorious! Hopefully you will not forget your allies.~
END
*/
IF ~RandomNum(7,1)~ THEN BEGIN CultistsBow202
  SAY ~If Five were the most powerful bhaalspawn ever lived what hope she does have?~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,2)~ THEN BEGIN PlansForNaught202
  SAY ~Setherus the fool when I think of him I chuckle.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,3)~ THEN BEGIN OverwhelmingAndSoothing202
  SAY ~I know of hidden Cyricist sect they should feel our blessing first I think.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,4)~ THEN BEGIN CHARNAMEDivinityComment202
  SAY ~Few faithful to Bhaal remain we shall hunt them down and they shall convert or die!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,5)~ THEN BEGIN Retribution202
  SAY ~Plenty she has to answer for!Great let me check~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,6)~ THEN BEGIN RevengeOnAmelissan202
  SAY ~I thought it would be better to steer clear of you now I see what Sixtarch saw in you.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,7)~ THEN BEGIN Feelings202
  SAY ~Her weakness we shall prove of that I am certain!~
  IF ~~ THEN EXIT
END

// Llergwyn ---------------------------------------------------------------------------------------------------------
BEGIN ~rqt0clt1~
/*
INTERJECT_COPY_TRANS FINSOL01 27 Sixtarch
== rqt0clt1 IF ~GlobalLT("SixtarchDivinity","GLOBAL",1)
        GlobalLT("SixtarchAllyItwantos","GLOBAL",1)
        !Dead("rqt0clt1")
        !StateCheck("rqt0clt1",STATE_HELPLESS)
        !StateCheck("rqt0clt1",STATE_STUNNED)
        !StateCheck("rqt0clt1",STATE_PANIC)
        !StateCheck("rqt0clt1",STATE_BERSERK)
        !StateCheck("rqt0clt1",STATE_SLEEPING)
        !StateCheck("rqt0clt1",STATE_SILENCED)
        !StateCheck("rqt0clt1",STATE_CHARMED)
        !StateCheck("rqt0clt1",STATE_FEEBLEMINDED)
        !StateCheck("rqt0clt1",STATE_CONFUSED)~ THEN ~<LADYLORD> <CHARNAME> you are victorious! Hopefully you will not forget your allies.~
END
*/
IF ~RandomNum(7,1)~ THEN BEGIN CultistsBow101
  SAY ~The magic protects us! I can feel its strength I thank you <PRO_LADYLORD> <CHARNAME>.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,2)~ THEN BEGIN PlansForNaught101
  SAY ~Amelissan fears our might!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,3)~ THEN BEGIN OverwhelmingAndSoothing101
  SAY ~Its our turn to write history!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,4)~ THEN BEGIN CHARNAMEDivinityComment101
  SAY ~Power comes to those seize from cold dead hands and we shall do exactly so!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,5)~ THEN BEGIN Retribution101
  SAY ~All will feel misery!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,6)~ THEN BEGIN RevengeOnAmelissan101
  SAY ~Our opponents shall be crushed!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,7)~ THEN BEGIN Feelings101
  SAY ~We head towards victory!~
  IF ~~ THEN EXIT
END

// Nalgarath ---------------------------------------------------------------------------------------------------------
BEGIN ~rqt0clt2~
/*
INTERJECT_COPY_TRANS FINSOL01 27 SixtarchItwantos
== rqt0clt2 IF ~GlobalLT("SixtarchDivinity","GLOBAL",1)
        GlobalLT("SixtarchAllyItwantos","GLOBAL",1)
        GlobalLT("SixtarchAllyLlergwyn","GLOBAL",1)
        !Dead("rqt0clt2")
        !StateCheck("rqt0clt2",STATE_HELPLESS)
        !StateCheck("rqt0clt2",STATE_STUNNED)
        !StateCheck("rqt0clt2",STATE_PANIC)
        !StateCheck("rqt0clt2",STATE_BERSERK)
        !StateCheck("rqt0clt2",STATE_SLEEPING)
        !StateCheck("rqt0clt2",STATE_SILENCED)
        !StateCheck("rqt0clt2",STATE_CHARMED)
        !StateCheck("rqt0clt2",STATE_FEEBLEMINDED)
        !StateCheck("rqt0clt2",STATE_CONFUSED)~ THEN ~<LADYLORD> <CHARNAME> you are victorious! Hopefully you will not forget your allies.~
END
*/
IF ~RandomNum(7,1)~ THEN BEGIN CultistsBow102
  SAY ~I bow before your will <PRO_LADYLORD> <CHARNAME>!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,2)~ THEN BEGIN PlansForNaught102
  SAY ~Concocted plans for you to kill the Five yet failed to comprehend by doing so she had enabled your ascension!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,3)~ THEN BEGIN OverwhelmingAndSoothing102
  SAY ~Overwhelming yet soothing this place is.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,4)~ THEN BEGIN CHARNAMEDivinityComment102
  SAY ~I have never seen a god yet I think... i.. can see divinity in your eyes... <PRO_LADYLORD> <CHARNAME>.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,5)~ THEN BEGIN Retribution102
  SAY ~She betrayed yet we are here to extract our retribution!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,6)~ THEN BEGIN RevengeOnAmelissan102
  SAY ~Power above all!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,7)~ THEN BEGIN Feelings102
  SAY ~None shall resist us!~
  IF ~~ THEN EXIT
END

// Rengarn ---------------------------------------------------------------------------------------------------------
BEGIN ~rqt0clt3~
/*
INTERJECT_COPY_TRANS FINSOL01 27 SixtarchItwantos
== rqt0clt3 IF ~GlobalLT("SixtarchDivinity","GLOBAL",1)
        GlobalLT("SixtarchAllyItwantos","GLOBAL",1)
        GlobalLT("SixtarchAllyLlergwyn","GLOBAL",1)
        GlobalLT("SixtarchAllyNalgarath","GLOBAL",1)
        !Dead("rqt0clt3")
        !StateCheck("rqt0clt3",STATE_HELPLESS)
        !StateCheck("rqt0clt3",STATE_STUNNED)
        !StateCheck("rqt0clt3",STATE_PANIC)
        !StateCheck("rqt0clt3",STATE_BERSERK)
        !StateCheck("rqt0clt3",STATE_SLEEPING)
        !StateCheck("rqt0clt3",STATE_SILENCED)
        !StateCheck("rqt0clt3",STATE_CHARMED)
        !StateCheck("rqt0clt3",STATE_FEEBLEMINDED)
        !StateCheck("rqt0clt3",STATE_CONFUSED)~ THEN ~<LADYLORD> <CHARNAME> you are victorious! Hopefully you will not forget your allies.~
END
*/
IF ~RandomNum(7,1)~ THEN BEGIN CultistsBow103
  SAY ~What would you have of me.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,2)~ THEN BEGIN PlansForNaught103
  SAY ~Throne of Bhaal is such a silly name. Throne of <CHARNAME> sounds much better!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,3)~ THEN BEGIN OverwhelmingAndSoothing103
  SAY ~I have seen our enemy and I am NOT afraid.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,4)~ THEN BEGIN CHARNAMEDivinityComment103
  SAY ~What rituals do you wish to perform for your ascension?~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,5)~ THEN BEGIN Retribution103
  SAY ~Screams of our enemies shall be our reward!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,6)~ THEN BEGIN RevengeOnAmelissan103
  SAY ~<PRO_LADYLORD> <CHARNAME> power protects us!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,7)~ THEN BEGIN Feelings103
  SAY ~Wish we could torture her for while <PRO_LADYLORD> <CHARNAME> could we have some fun after you defeat her?~
  IF ~~ THEN EXIT
END

// Jatwalg ---------------------------------------------------------------------------------------------------------
BEGIN ~rqt0clt4~
/*
INTERJECT_COPY_TRANS FINSOL01 27 SixtarchItwantos
== rqt0clt4 IF ~GlobalLT("SixtarchDivinity","GLOBAL",1)
        GlobalLT("SixtarchAllyItwantos","GLOBAL",1)
        GlobalLT("SixtarchAllyLlergwyn","GLOBAL",1)
        GlobalLT("SixtarchAllyNalgarath","GLOBAL",1)
        GlobalLT("SixtarchAllyRengarn","GLOBAL",1)
        !Dead("rqt0clt4")
        !StateCheck("rqt0clt4",STATE_HELPLESS)
        !StateCheck("rqt0clt4",STATE_STUNNED)
        !StateCheck("rqt0clt4",STATE_PANIC)
        !StateCheck("rqt0clt4",STATE_BERSERK)
        !StateCheck("rqt0clt4",STATE_SLEEPING)
        !StateCheck("rqt0clt4",STATE_SILENCED)
        !StateCheck("rqt0clt4",STATE_CHARMED)
        !StateCheck("rqt0clt4",STATE_FEEBLEMINDED)
        !StateCheck("rqt0clt4",STATE_CONFUSED)~ THEN ~<LADYLORD> <CHARNAME> you are victorious! Hopefully you will not forget your allies.~
END
*/
IF ~RandomNum(7,1)~ THEN BEGIN CultistsBow104
  SAY ~Our enemies shall fall!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,2)~ THEN BEGIN PlansForNaught104
  SAY ~Soon my master.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,3)~ THEN BEGIN OverwhelmingAndSoothing104
  SAY ~Vengeance shall be ours..~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,4)~ THEN BEGIN CHARNAMEDivinityComment104
  SAY ~Fools measure their valor by strength. Wise men by number of kills.~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,5)~ THEN BEGIN Retribution104
  SAY ~If Amelissan had any chance to succeed she would dealt with Five herself!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,6)~ THEN BEGIN RevengeOnAmelissan104
  SAY ~I wonder what flowers we shall plant on her grave. Ha! got you <PRO_LADYLORD> <CHARNAME>!~
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,7)~ THEN BEGIN Feelings104
  SAY ~Silence of death shall speak for our deeds here.~
  IF ~~ THEN EXIT
END
