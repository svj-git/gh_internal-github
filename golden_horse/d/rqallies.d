BEGIN ~rqfougi~

CHAIN
    IF ~Global("rqRevanMintiper","GLOBAL",3)
        InParty("rqrev")
        !Dead("rqrev")
        !StateCheck("rqrev",STATE_SLEEPING)~
    THEN rqfougi FougierIntro
    ~Greetings, Captain.~
DO ~SetGlobal("rqRevanMintiper","GLOBAL",4)~
    == rqrevJ
    ~We need to find out where Mintiper Moonsilver, our old enemy from the Moonsea, is.~
    == rqfougi
    ~He came here?! Okay, tell me what you have. Let's analyze all the known events.~
    == rqrevJ
    ~We have nothing but Mintiper's name, and I think most mercenaries are from the same unit since they have the same colors and they mostly use halberds and crossbows.~
    =
    ~One more thing: they recruited Prangl.~
    == rqfougi
    ~Ha! I saw him outside the Umar Hills tavern. Drink was always his weakness. Prangl almost ran from the tavern, so I doubt Mintiper is renting a room there.~
    == rqrevJ
    ~Right, some outdoor location in the Umar Hills. Has Rugos found any suitable mercenary contracts?~
    == rqfougi
    ~He has.~
    == rqrevJ
    ~Okay, go and fetch Rugos. I will return when I have dealt with Mintiper.~
    == rqfougi
    ~I'm on it.~
DO ~EscapeArea()~
END
IF ~~ THEN EXTERN ~rqrevJ~ MintiperEncounterToCome

BEGIN ~rqrahm~

IF ~!InParty("rqrev") Global("rqZZRahmIntro","GLOBAL",0)~ THEN BEGIN MercenaryInterestOrNot
    SAY ~Greetings, I am a representative of the Golden Horse mercenaries. Might I interest you in hiring our mercenaries? 1000 gold for one contract.~
    IF ~~ THEN REPLY ~Not right now, Farewell.~
        EXIT
    IF ~PartyGoldLT(1000)~ THEN REPLY ~I don't have that kind of gold, Farewell.~
        EXIT
    IF ~PartyGoldGT(999)~ THEN REPLY ~Perhaps, why don't you start with the details.~ DO ~SetGlobal("rqZZRahmIntro","GLOBAL",1)~ GOTO InterestIsThere
END

IF ~InParty("rqrev") Global("rqZZRahmIntro","GLOBAL",0)~ THEN BEGIN MercenaryInterestRevan
    SAY ~You are with the Captain, so I assume you want to hire mercenaries? It is 1000 gold for one contract.~
    IF ~~ THEN REPLY ~Not right now, Farewell.~
        EXIT
    IF ~PartyGoldLT(1000)~ THEN REPLY ~I don't have that kind of gold, Farewell.~
        EXIT
    IF ~PartyGoldGT(999)~ THEN REPLY ~Perhaps, why don't you start with the details.~ DO ~SetGlobal("rqZZRahmIntro","GLOBAL",1)~ GOTO InterestIsThere
END
// Dead("rqmen") Dead("rqfbet") Dead("rqfmn") Dead("rqmin")
IF ~Dead("rqfbe")  Dead("rqmil") Dead("rqsrc") Dead("rqmtr")  Dead("rqbsk") Dead("rqmdi") Dead("rqmab")~ THEN BEGIN NoMercenariesAllDead
    SAY ~We do not have any mercenaries available right now.~
        IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN InterestIsThere
    SAY ~Normally our mercenaries are paid daily, but in your case this is unworkable. Instead, what we will offer you is this:~
    =
    ~Payment is a one-time fee of 1000 gold pieces when starting the contract. For that, you will get a time-unlimited service contract with our mercenary. Dismissal of the mercenary means termination of the contract.~
    =
    ~A mercenary should never leave you, even if you do something against his moral code, as he works for gold.~
    =
    ~Dismissed mercenaries can be summoned here, provided you pay the contract fee of 1000 gold.~
    IF ~~ THEN REPLY ~Tell me who can work for me.~ GOTO GiveMercenaryRoosterLetter
    IF ~~ THEN REPLY ~Nah, I will stick to free adventurers, Farewell.~
        EXIT
END

IF ~~ THEN BEGIN GiveMercenaryRoosterLetter
    SAY ~Here you go. The mercenaries are all listed on this parchment.~
    IF ~~ THEN DO ~GiveItem("rqrooste",LastTalkedToBy())~ GOTO InterestedInMercenariesRooster
END
// Battlerager
IF ~Global("rqZZRahmIntro","GLOBAL",1)~ THEN BEGIN InterestedInMercenariesRooster
    SAY ~Now that we know what our bussiness is all about...~
    IF ~Global("rqZZmercFBESpawned","GLOBAL",1)
        !InParty("rqfbe")
        !Dead("rqfbe")~
        THEN REPLY ~I want the Dwarwen Battlerager Jorgur to rejoin me.~ GOTO MercenaryFBERejoin

    IF ~Global("rqZZmercFBESpawned","GLOBAL",0)~ THEN REPLY ~Send for Dwarwen Battlerager.~
            DO ~TakePartyGold(1000)
                Wait(4)
                CreateCreature("rqfbe",[265.749],13)
                SetGlobal("rqZZmercFBESpawned","GLOBAL",1)~ GOTO MercenaryArrivesFBE
// Illusionist
    IF ~Global("rqZZmercMILSpawned","GLOBAL",1)
        !InParty("rqmil")
        !Dead("rqmil")~
        THEN REPLY ~I want the Gnomish Illusionist. to rejoin me.~ GOTO MercenaryMILRejoin

    IF ~Global("rqZZmercMILSpawned","GLOBAL",0)~ THEN REPLY ~Send for Gnomish Illusionist.~
            DO ~TakePartyGold(1000)
                Wait(4)
                CreateCreature("rqmil",[265.749],13)
                SetGlobal("rqZZmercMILSpawned","GLOBAL",1)~ GOTO MercenaryArrivesMIL
// Sorcerer
    IF ~Global("rqZZmercSRCSpawned","GLOBAL",1)
        !InParty("rqsrc")
        !Dead("rqsrc")~
        THEN REPLY ~I want the Elven Sorcerer to rejoin me.~ GOTO MercenarySRCRejoin

    IF ~Global("rqZZmercSRCSpawned","GLOBAL",0)~ THEN REPLY ~Send for Elven Sorcerer.~
            DO ~TakePartyGold(1000)
                Wait(4)
                SetGlobal("rqZZmercSRCSpawned","GLOBAL",1)
                CreateCreature("rqsrc",[265.749],13)~ GOTO MercenaryArrivesSRC
// Transmuter
    IF ~Global("rqZZmercMTRSpawned","GLOBAL",1)
        !InParty("rqmtr")
        !Dead("rqmtr")~
        THEN REPLY ~I want the Human Mage Transmuter to rejoin me.~ GOTO MercenaryMTRRejoin

    IF ~Global("rqZZmercMTRSpawned","GLOBAL",0)~ THEN REPLY ~Send for Human Transmuter.~
            DO ~TakePartyGold(1000)
                Wait(4)
                SetGlobal("rqZZmercMTRSpawned","GLOBAL",1)
                CreateCreature("rqmtr",[265.749],13)~ GOTO MercenaryArrivesMTR
// Skald
    IF ~Global("rqZZmercBSKSpawned","GLOBAL",1)
        !InParty("rqbsk")
        !Dead("rqbsk")~
        THEN REPLY ~I want the Human Skald to rejoin me.~ GOTO MercenaryBSKRejoin

    IF ~Global("rqZZmercBSKSpawned","GLOBAL",0)~ THEN REPLY ~Send for Human Skald.~
            DO ~TakePartyGold(1000)
                Wait(4)
                SetGlobal("rqZZmercBSKSpawned","GLOBAL",1)
                CreateCreature("rqbsk",[265.749],13)~ GOTO MercenaryArrivesBSK
// Abjurer
    IF ~Global("rqZZmercMABSpawned","GLOBAL",1)
        !InParty("rqmab")
        !Dead("rqmab")~
        THEN REPLY ~I want the Human Abjurer to rejoin me.~ GOTO MercenaryMABRejoin

    IF ~Global("rqZZmercMABSpawned","GLOBAL",0)~ THEN REPLY ~Send for Human Abjurer.~
            DO ~TakePartyGold(1000)
                Wait(4)
                SetGlobal("rqZZmercMABSpawned","GLOBAL",1)
                CreateCreature("rqmab",[265.749],13)~ GOTO MercenaryArrivesMAB
// Diviner
    IF ~Global("rqZZmercMDISpawned","GLOBAL",1)
        !InParty("rqmdi")
        !Dead("rqmdi")~
        THEN REPLY ~I want the Human Diviner to rejoin me.~ GOTO MercenaryMDIRejoin

    IF ~Global("rqZZmercMDISpawned","GLOBAL",0)~ THEN REPLY ~Send for Human Diviner.~
            DO ~TakePartyGold(1000)
                Wait(4)
                SetGlobal("rqZZmercMDISpawned","GLOBAL",1)
                CreateCreature("rqmdi",[265.749],13)~ GOTO MercenaryArrivesMDI
    IF ~~ THEN REPLY ~Not interested in any of them.~ EXIT
END
/*
    IF ~Global("rqZZmercFBETSpawned","GLOBAL",1)
        !InParty("rqfbet")
        !Dead("rqfbet")~
        THEN REPLY ~I want the Dwarwen Battlerager Breneke to rejoin me.~ GOTO MercenaryFBETRejoin

    IF ~Global("rqZZmercFBETSpawned","GLOBAL",0)~
        THEN REPLY ~Send for Dwarwen Battlerager.~
            DO ~TakePartyGold(1000)
                Wait(4)
                CreateCreature("rqfbet",[265.749],13)
                SetGlobal("rqZZmercFBETSpawned","GLOBAL",1)~ GOTO MercenaryArrivesFBET

    IF ~Global("rqZZmercFTHSpawned","GLOBAL",1)
        !InParty("rqfth")
        !Dead("rqfth")~
        THEN REPLY ~I want the Dwarwen Fighting Thief to rejoin me.~ GOTO MercenaryFTHRejoin

    IF ~Global("rqZZmercFTHSpawned","GLOBAL",0)~
        THEN REPLY ~Send for Dwarwen Fighting Thief.~
            DO ~TakePartyGold(1000)
                Wait(4)
                CreateCreature("rqfth",[265.749],13)
                SetGlobal("rqZZmercFTHSpawned","GLOBAL",1)~ GOTO MercenaryArrivesFTH

    IF ~Global("rqZZmercMINSpawned","GLOBAL",1)
        !InParty("rqmin")
        !Dead("rqmin")~
        THEN REPLY ~I want the Human Invoker Mage specialist to rejoin me.~ GOTO MercenaryMINRejoin

    IF ~Global("rqZZmercMINSpawned","GLOBAL",0)~
        THEN REPLY ~Send for Human Invoker Mage specialist.~
            DO ~TakePartyGold(1000)
                Wait(4)
                CreateCreature("rqmin",[265.749],13)
                SetGlobal("rqZZmercMINSpawned","GLOBAL",1)~ GOTO MercenaryArrivesMIN

// Fighter nercromancer
    IF ~Global("rqZZmercFMNSpawned","GLOBAL",1)
        !InParty("rqfmn")
        !Dead("rqfmn")~
        THEN REPLY ~I want the Human Fighter to rejoin me.~ GOTO MercenaryFMNRejoin

    IF ~Global("rqZZmercFMNSpawned","GLOBAL",0)~
        THEN REPLY ~Send for Human Fighter.~
            DO ~TakePartyGold(1000)
                Wait(4)
                CreateCreature("rqfmn",[265.749],13)
                SetGlobal("rqZZmercFMNSpawned","GLOBAL",1)~ GOTO MercenaryArrivesFMN
// Enchanter
    IF ~Global("rqZZmercMENSpawned","GLOBAL",1)
        !InParty("rqmen")
        !Dead("rqmen")~
        THEN REPLY ~I want the Elven Enchanter to rejoin me.~ GOTO MercenaryMENRejoin

    IF ~Global("rqZZmercMENSpawned","GLOBAL",0)~
        THEN REPLY ~Send for Elven Enchanter.~
            DO ~TakePartyGold(1000)
                Wait(4)
                SetGlobal("rqZZmercMENSpawned","GLOBAL",1)
                CreateCreature("rqmen",[265.749],13)~ GOTO MercenaryArrivesMEN
*/


IF ~~ THEN BEGIN MercenaryFBERejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqfbeP~ rqFigBersRejoin
END

IF ~~ THEN BEGIN MercenaryMILRejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqmilP~ rqMageIlluRejoin
END

IF ~~ THEN BEGIN MercenarySRCRejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqsrcP~ rqSorcererRejoin
END

IF ~~ THEN BEGIN MercenaryMTRRejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqmtrP~ rqMageTransmuterRejoin
END

IF ~~ THEN BEGIN MercenaryBSKRejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqbskP~ rqBardSkaldRejoin
END

IF ~~ THEN BEGIN MercenaryMABRejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqmabP~ rqMageAbjurerRejoin
END

IF ~~ THEN BEGIN MercenaryMDIRejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqmdiP~ rqMageDivinerRejoin
END
/*
IF ~~ THEN BEGIN MercenaryFBETRejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqfbeTP~ rqFigBersTRejoin
END

IF ~~ THEN BEGIN MercenaryFTHRejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqfthP~ rqFigThiRejoin
END

IF ~~ THEN BEGIN MercenaryMINRejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqminP~ rqMageInvokerRejoin
END

IF ~~ THEN BEGIN MercenaryFMNRejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqfmnP~ rqFigMageNecrRejoin
END

IF ~~ THEN BEGIN MercenaryMENRejoin
    SAY ~Great choice.~
        IF ~~ THEN DO ~TakePartyGold(1000)~ EXTERN ~rqmenP~ rqMageEnchanterRejoin
END
*/


IF ~~ THEN BEGIN MercenaryArrivesFBE
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqfbe",MoveToPoint([540.673]))
        ActionOverride("rqfbe",StartDialogNoSet(Player1))~
    EXIT
END

IF ~~ THEN BEGIN MercenaryArrivesMIL
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqmil",MoveToPoint([540.673]))
        ActionOverride("rqmil",StartDialogNoSet(Player1))~
    EXIT
END

IF ~~ THEN BEGIN MercenaryArrivesSRC
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqsrc",MoveToPoint([540.673]))
        ActionOverride("rqsrc",StartDialogNoSet(Player1))~
    EXIT
END

IF ~~ THEN BEGIN MercenaryArrivesMTR
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqmtr",MoveToPoint([540.673]))
        ActionOverride("rqmtr",StartDialogNoSet(Player1))~
    EXIT
END

IF ~~ THEN BEGIN MercenaryArrivesBSK
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqbsk",MoveToPoint([540.673]))
        ActionOverride("rqbsk",StartDialogNoSet(Player1))~
    EXIT
END

IF ~~ THEN BEGIN MercenaryArrivesMAB
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqmab",MoveToPoint([540.673]))
        ActionOverride("rqmab",StartDialogNoSet(Player1))~
    EXIT
END

IF ~~ THEN BEGIN MercenaryArrivesMDI
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqmdi",MoveToPoint([540.673]))
        ActionOverride("rqmdi",StartDialogNoSet(Player1))~
    EXIT
END

/*
IF ~~ THEN BEGIN MercenaryArrivesFBET
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqfbet",MoveToPoint([540.673]))
        ActionOverride("rqfbet",StartDialogNoSet(Player1))~
    EXIT
END

IF ~~ THEN BEGIN MercenaryArrivesFTH
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqfth",MoveToPoint([540.673]))
        ActionOverride("rqfth",StartDialogNoSet(Player1))~
    EXIT
END

IF ~~ THEN BEGIN MercenaryArrivesMIN
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqmin",MoveToPoint([540.673]))
        ActionOverride("rqmin",StartDialogNoSet(Player1))~
    EXIT
END

IF ~~ THEN BEGIN MercenaryArrivesFMN
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqfmn",MoveToPoint([540.673]))
        ActionOverride("rqfmn",StartDialogNoSet(Player1))~
    EXIT
END

IF ~~ THEN BEGIN MercenaryArrivesMEN
    SAY ~Your mercenary will arrive shortly.~
    IF ~~ THEN DO
        ~Wait(1)
        ActionOverride("rqmen",MoveToPoint([540.673]))
        ActionOverride("rqmen",StartDialogNoSet(Player1))~
    EXIT
END
*/


// ----------------------------------------------------------------rqfbe---------------------------------------------------------------
BEGIN rqfbe // Jorgur

IF ~True()~ THEN BEGIN rqfbeJoining
    SAY ~Yer the new boss I be protectin'?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqfbe","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([540.673])~
        EXIT
END

BEGIN rqfbeP
// Battlerager dismissal
IF ~Global("rqmerc_rqfbe","LOCALS",1)~ THEN BEGIN rqfbeRemoval
    SAY ~Ye and I are done, <CHARNAME>?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~
        EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqfbe","LOCALS",0)
            MoveToPoint([540.673])
            ~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqfbe","LOCALS",0)
            EscapeAreaMove("AR0704",540,673,5)~
        EXIT
END
// Battlerager rejoin
IF ~~ THEN BEGIN rqFigBersRejoin
    SAY ~Ye wish to rehire me?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqfbe","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([540.673])~
        EXIT
END

// ----------------------------------------------------------------rqfbet---------------------------------------------------------------

BEGIN rqfbet // Breneke

IF ~True()~ THEN BEGIN rqfbeJoining
    SAY ~Ye be contractin' me fer protectin' ye?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqfbet","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([540.673])~
        EXIT
END

BEGIN rqfbetP
// Battlerager dismissal
IF ~Global("rqmerc_rqfbet","LOCALS",1)~ THEN BEGIN rqfbeTRemoval
    SAY ~Ye be dismissin' me, <CHARNAME>?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~
        EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqfbet","LOCALS",0)
            MoveToPoint([540.673])
            ~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqfbet","LOCALS",0)
            EscapeAreaMove("AR0704",540,673,5)~
        EXIT
END
// Battlerager rejoin
IF ~~ THEN BEGIN rqFigBersTRejoin
    SAY ~Ye be wishin' to rejoin with meself?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqfbet","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([540.673])~
        EXIT
END
// ---------------------------------------------------------------rqfth----------------------------------------------------------------
BEGIN rqfth

IF ~True()~ THEN BEGIN rqfthJoining
    SAY ~Ye be lookin' a sight better than gutless prissy nobles. Ye ready?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqfth","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([715.542])~
        EXIT
END

BEGIN rqfthP
// Fighter/Thief dismissal
IF ~Global("rqmerc_rqfth","LOCALS",1)~ THEN BEGIN rqfthRemoval
    SAY ~Yer bootin' me out of yer party?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~
        EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqfth","LOCALS",0)
            MoveToPoint([715.542])~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqfth","LOCALS",0)
            EscapeAreaMove("AR0704",715,542,5)~
        EXIT
END
// Fighter/Thief rejoin
IF ~~ THEN BEGIN rqFigThiRejoin
    SAY ~You wish to rehire me?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqfth","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([715.542])~
        EXIT
END
// ---------------------------------------------------------------rqmin-----------------------------------------------------------------
BEGIN rqmin

IF ~True()~ THEN BEGIN rqminJoining
    SAY ~I hope that our contract will be pleasant.~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqmin","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([588.592])~
        EXIT
END

BEGIN rqminP
// Mage Invoker dismissal
IF ~Global("rqmerc_rqmin","LOCALS",1)~ THEN BEGIN rqminRemoval
    SAY ~So it is time to part ways?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~
        EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqmin","LOCALS",0)
            MoveToPoint([588.592])~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqmin","LOCALS",0)
            EscapeAreaMove("AR0704",588,592,5)~
        EXIT
END
// Mage Invoker Rejoin
IF ~~ THEN BEGIN rqMageInvokerRejoin
    SAY ~You wish to rehire me?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqmin","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([588.592])~
        EXIT
END

// -------------------------------------------------------------rqfmn------------------------------------------------------------------
BEGIN rqfmn

IF ~True()~ THEN BEGIN rqfmnJoining
    SAY ~Refreshing to work for an adventurer. Let us start.~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqfmn","LOCALS",1) JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([680.615])~
        EXIT
END

BEGIN rqfmnP
// Fighter *Necromancer* dismissal
IF ~Global("rqmerc_rqfmn","LOCALS",1)~ THEN BEGIN rqfmnRemoval
    SAY ~And I was just beginning to like you. Are we through?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~
        EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqfmn","LOCALS",0)
            MoveToPoint([680.615])~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqfmn","LOCALS",0)
            EscapeAreaMove("AR0704",680,615,5)~
        EXIT
END
// Fighter *Necromancer* Rejoin
IF ~~ THEN BEGIN rqFigMageNecrRejoin
    SAY ~You wish to rehire me?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqfmn","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([680.615])~
        EXIT
END

// ------------------------------------------------------------rqmil-------------------------------------------------------------------
BEGIN rqmil

IF ~True()~ THEN BEGIN rqmilJoining
    SAY ~Based on your appearance, this should be fun. Should I join then?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqmil","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([744.668])~
        EXIT
END

BEGIN rqmilP
// Gnome Illusionist Dismissal
IF ~Global("rqmerc_rqmil","LOCALS",1)~ THEN BEGIN rqmilRemoval
    SAY ~Is this final? You no longer desire my company?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~
        EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqmil","LOCALS",0)
            MoveToPoint([744.668])~
        EXIT

    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqmil","LOCALS",0)
            EscapeAreaMove("AR0704",744,668,5)~
        EXIT
END
// Gnome Illusionist Rejoin
IF ~~ THEN BEGIN rqMageIlluRejoin
    SAY ~You wish to rehire me?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqmil","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([744.668])~
        EXIT
END

// ------------------------------------------------------------rqsrc-------------------------------------------------------------------
BEGIN ~rqsrc~
// Intro
IF ~Global("rqmerc_rqsrc","LOCALS",0)~ THEN BEGIN rqsrcJoining
    SAY ~An adventurer? Well, I hope our contract will be satisfactory for us both. Shall we go?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqsrc","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END

BEGIN ~rqsrcP~
// Sorcerer Dismissal
IF ~Global("rqmerc_rqsrc","LOCALS",1)~ THEN BEGIN rqsrcRemoval
    SAY ~Are you dismissing me? You are aware that means termination of our contract?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~ EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqsrc","LOCALS",0)
            MoveToPoint([719.667])~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqsrc","LOCALS",0)
            EscapeAreaMove("AR0704",719,667,5)~
        EXIT
END
// Sorcerer Rejoin
IF ~~ THEN BEGIN rqSorcererRejoin
    SAY ~You wish to rehire me?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqsrc","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END

// ------------------------------------------------------------rqmtr-------------------------------------------------------------------
BEGIN ~rqmtr~
// Intro
IF ~Global("rqmerc_rqmtr","LOCALS",0)~ THEN BEGIN rqmtrJoining
    SAY ~An adventurer? Well I hope our contract will satisfactory for us both. Shall we go?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqmtr","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END

BEGIN ~rqmtrP~
// Mage Transmuter Dismissal
IF ~Global("rqmerc_rqmtr","LOCALS",1)~ THEN BEGIN rqmtrRemoval
    SAY ~Are you dismissing me? You are aware that means termination of our contract?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~ EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqmtr","LOCALS",0)
            MoveToPoint([719.667])~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqmtr","LOCALS",0)
            EscapeAreaMove("AR0704",719,667,5)~
        EXIT
END
// Mage Transmuter Rejoin
IF ~~ THEN BEGIN rqMageTransmuterRejoin
    SAY ~You wish to rehire me?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqmtr","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END

// ------------------------------------------------------------rqmen-------------------------------------------------------------------
BEGIN ~rqmen~
// Intro
IF ~Global("rqmerc_rqmen","LOCALS",0)~ THEN BEGIN rqmenJoining
    SAY ~An adventurer? Well I hope our contract will satisfactory for us both. Shall we go?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqmen","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END

BEGIN ~rqmenP~
// Mage Enchanter
IF ~Global("rqmerc_rqmen","LOCALS",1)~ THEN BEGIN rqmenRemoval
    SAY ~Are you dismissing me? You are aware that means termination of our contract?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~ EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqmen","LOCALS",0)
            MoveToPoint([719.667])~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqmen","LOCALS",0)
            EscapeAreaMove("AR0704",719,667,5)~
        EXIT
END
// Mage Enchanter Rejoin
IF ~~ THEN BEGIN rqMageEnchanterRejoin
    SAY ~You wish to rehire me?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqmen","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END

// ------------------------------------------------------------rqbsk-------------------------------------------------------------------
BEGIN ~rqbsk~
// Intro
IF ~Global("rqmerc_rqbsk","LOCALS",0)~ THEN BEGIN rqBSKJoining
    SAY ~An adventurer? Well I hope our contract will satisfactory for us both. Shall we go?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqbsk","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END

BEGIN ~rqbskP~
// Bard Skald
IF ~Global("rqmerc_rqbsk","LOCALS",1)~ THEN BEGIN rqBSKRemoval
    SAY ~I thought the battles we braved together would not lead to this, but since you acted as you did, do you wish to terminate our contract?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~ EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqbsk","LOCALS",0)
            MoveToPoint([719.667])~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqbsk","LOCALS",0)
            EscapeAreaMove("AR0704",719,667,5)~
        EXIT
END
// Bard Skald Rejoin
IF ~~ THEN BEGIN rqBardSkaldRejoin
    SAY ~You wish to rehire me, Afkar the bard?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqbsk","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END

// ------------------------------------------------------------rqmdi-------------------------------------------------------------------

BEGIN ~rqmdi~
// Intro
IF ~Global("rqmerc_rqmdi","LOCALS",0)~ THEN BEGIN rqMDIJoining
    SAY ~An adventurer? Well I hope our contract will satisfactory for us both. Shall we go?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqmdi","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END

BEGIN ~rqmdiP~
// Mage Diviner
IF ~Global("rqmerc_rqmdi","LOCALS",1)~ THEN BEGIN rqMDIRemoval
    SAY ~I thought the battles we braved together would not lead to this, but since you acted as you did, do you wish to terminate our contract?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~ EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqmdi","LOCALS",0)
            MoveToPoint([719.667])~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes we will part ways.~
        DO
            ~SetGlobal("rqmerc_rqmdi","LOCALS",0)
            EscapeAreaMove("AR0704",719,667,5)~
        EXIT
END
// Mage Diviner Rejoin
IF ~~ THEN BEGIN rqMageDivinerRejoin
    SAY ~You want me to be rehired my services?~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqmdi","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END

// ------------------------------------------------------------rqmab-------------------------------------------------------------------

BEGIN ~rqmab~
// Intro
IF ~Global("rqmerc_rqmab","LOCALS",0)~ THEN BEGIN rqMABJoining
    SAY ~Greetings I am Bekurel and hopefully this will a pleasure for both of us.~
    IF ~~ THEN REPLY ~Yes join me.~
        DO
            ~SetGlobal("rqmerc_rqmab","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Wait for while here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END

BEGIN ~rqmabP~
// Mage Abjurer
IF ~Global("rqmerc_rqmab","LOCALS",1)~ THEN BEGIN rqMABRemoval
    SAY ~No more should I accompany you?~
    IF ~~ THEN REPLY ~Nope not yet.~
        DO ~JoinParty()~ EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~Join me, Mage.~
        DO
            ~SetGlobal("rqmerc_rqmab","LOCALS",0)
            MoveToPoint([719.667])~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~Yes it is time leave my group.~
        DO
            ~SetGlobal("rqmerc_rqmab","LOCALS",0)
            EscapeAreaMove("AR0704",719,667,5)~
        EXIT
END
// Mage Abjurer Rejoin
IF ~~ THEN BEGIN rqMageAbjurerRejoin
    SAY ~You wish to rehire me,?~
    IF ~~ THEN REPLY ~Yes, Rejoin my group.~
        DO
            ~SetGlobal("rqmerc_rqmab","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~No not now. You should wait here.~
        DO
            ~MoveToPoint([719.667])~
        EXIT
END


