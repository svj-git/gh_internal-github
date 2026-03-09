BEGIN ~rqrev25~

IF ~Global("rqRevanSummoned","GLOBAL",1)~ THEN Revansummon
    SAY ~<CHARNAME>? Where am I, and why have you summoned me here?~
    IF ~~ THEN REPLY ~We are in a special part of Hell, and I have need of you.~ DO ~SetGlobal("rqRevanSummoned","GLOBAL",2)~ + RevanHelpMe
    IF ~~ THEN REPLY ~Thieving and arcane skills are the reason why I summoned you.~ DO ~SetGlobal("rqRevanSummoned","GLOBAL",2)~ + RevanNeedYourSkills
END

IF ~~ RevanNeedYourSkills
    SAY ~That I can provide.~
    IF ~~ GOTO RevanHelpMe
END

IF ~~ RevanHelpMe
    SAY ~Is this place part of your divine inheritance?~
    IF ~~ THEN REPLY ~Yes, it is.~ GOTO RevanJoinMe
END

IF ~~ RevanJoinMe
    SAY ~I understand now, <CHARNAME>. Aluando's prophecy is coming to its climax. Shall we go?~
    IF ~~ THEN REPLY ~Yes, join me.~ DO ~JoinParty()~ EXIT
    IF ~~ THEN REPLY ~No, just yet. Wait here for a while.~ DO ~MoveToPointNoInterrupt([2162.1490])~ EXIT
END

IF ~Global("rqRevanSummoned","GLOBAL",2)~ Revansummoned2
    SAY ~So, do you have need of my skills?~
    IF ~~ THEN REPLY ~Yes, do join me.~  DO ~JoinParty()~ EXIT
    IF ~~ THEN REPLY ~No, not yet.~ EXIT
END

BEGIN ~rqrev25P~

IF ~Global("rqKickedOut","LOCALS",0)~ THEN BEGIN 0
  SAY ~So, I am to leave?~
  IF ~~ THEN REPLY ~No, it was a mistake.~ DO ~SetGlobal("rqKickedOut","LOCALS",0)
      JoinParty()~ EXIT
  IF ~AreaCheck("AR4500")~ THEN REPLY ~Wait here for now.~ DO ~SetGlobal("rqKickedOut","LOCALS",1)
      MoveToPointNoInterrupt([2162.1490]) Face(0)~ GOTO 1
  IF ~!AreaCheck("AR4500")
      !AreaCheck("AR4000")
      !AreaCheck("AR6200")~ THEN REPLY ~I shall send you to the Pocket Plane. Wait for me there.~ DO ~SetGlobal("rqKickedOut","LOCALS",1)
      CreateVisualEffectObject("SPDIMNDR",Myself)
      Wait(2)
      MoveBetweenAreas("AR4500",[2162.1490],0)
        ~ EXIT
  IF ~!AreaCheck("AR4500")
      !AreaCheck("AR4000")
      !AreaCheck("AR6200")~ THEN REPLY ~Stay here, Revan.~ DO ~SetGlobal("rqKickedOut","LOCALS",1)~ GOTO 1
END

IF ~Global("rqKickedOut","LOCALS",1)~ THEN BEGIN 2
    SAY ~Boredom is not something I enjoy. Shall we go back hunting our enemies?~
    IF ~~ THEN REPLY ~Yes lets go.~ DO ~SetGlobal("rqKickedOut","LOCALS",0) JoinParty()~ EXIT
    IF ~~ THEN REPLY ~No just stay here.~ GOTO 3
END

IF ~~ THEN BEGIN 3
    SAY ~More boredom.~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
    SAY ~Alright, I shall wait.~
    IF ~~ THEN EXIT
END

BEGIN ~rqrev25J~

// Tob reaction to ambush in forest
IF ~Global("rqRevanTobReaction1","GLOBAL",1)~ THEN BEGIN RevanTobAttackTethyrForest
    SAY ~Hmph... organizing this ambush took a tremendous amount of effort, and they *knew* we were coming. I am afraid this has grown beyond the Harpers. Someone is either manipulating them, or they are receiving a significant amount of help from someone unknown to us.~
    IF ~~ THEN REPLY ~Ellesime or someone from Suldanesselar must have informed our Harper *friends* of our coming here.~ GOTO RevanReiteratesHisPoint
    IF ~~ THEN REPLY ~Even Cowled Wizards came from Amn.~ GOTO RevanReiteratesHisPoint
    IF ~~ THEN REPLY ~Ribald that deceitful merchant was again involved in plots with my enemies!~ GOTO RevanReiteratesHisPoint
    IF ~~ THEN REPLY ~Blutdurst and other men around her were not exactly humans were they?~ GOTO RevanReiteratesHisPoint
    IF ~~ THEN REPLY ~Even Shadow Thieves have scrounged few assassins to attack me here!~ GOTO RevanReiteratesHisPoint
    IF ~~ THEN REPLY ~Order of Radiant Heart have sent their Paladins to hunt me outside of Amn.~ GOTO RevanReiteratesHisPoint
END

IF ~~ THEN BEGIN RevanReiteratesHisPoint
    SAY ~Yes, but again, someone with even more resources than the Harpers has set up this ambush.~
    =
    ~It all points to someone behind Jaheira or the Harpers who is keen to kill you.~
    IF ~~ THEN DO ~SetGlobal("rqRevanTobReaction1","GLOBAL",2)~ EXIT
END

// Tob reaction to ambush in saradush
IF ~Global("rqRevanTobReaction2","GLOBAL",1)~ THEN BEGIN RevanSaradushAmbush // How would she know where are you?
    SAY ~<CHARNAME>, how did she get in here? Two options: through the fire giant camp, or by magic. I can tell you, as a rogue and a mage, both are unlikely. The former is extremely difficult and the latter is impossible. Using teleportation magic from here would result in death.~
    IF ~~ THEN GOTO RevanSaradushAmbushTeleport
END

IF ~Global("rqRevanTobReaction2","GLOBAL",1)~ THEN BEGIN RevanSaradushAmbushTeleport
    SAY ~And how would she know where you were? No, it is likely she received help from someone who knew where you were and is able to at least temporarily lower the magical imprisonment....~
    IF ~~ THEN REPLY ~Just doesn't make sense if Yaga-Shura had done this he would teleport his army inside.~ GOTO RevanSaradushAmbushFinale
END

IF ~~ THEN BEGIN RevanSaradushAmbushFinale
    SAY ~Exactly. Someone or something is behind these ambushes and is manipulating events to its advantage.~
    IF ~~ THEN DO ~SetGlobal("rqRevanTobReaction2","GLOBAL",2)~ EXIT
END

// Revan answer to Volo
IF ~~ THEN BEGIN RevanAnswerToEnemies
    SAY ~I will enlarge my mercenary company here in Amn.~
    IF ~~ THEN EXTERN ~SARVOLO~ 9
END

// Contract no against T5 deathstalkers
IF ~~ THEN BEGIN RevanT5IntroDeath
    SAY ~New contracts? Here in Amkethran? Who gave them to you, and how did they know who you work for?~
    IF ~~ THEN EXTERN ~rqtrugos~ RugosT5CloakedWoman
END

IF ~~ THEN BEGIN RevanTrapT5
    SAY ~Given what we are doing and who is against us, my gut tells me this is a trap...so I will let <CHARNAME> decide if we take them. Alright, what is the first contract?~
    IF ~~ THEN EXTERN ~rqtrugos~ RugosT5Contract25000G
END

// Rugos go back to Athkatla
IF ~~ THEN BEGIN RugosT6GoBackToAmn
    SAY ~Do you have more contracts for us here? If not, I want to return to Amn and hire Piter de Almivar's company.~
    IF ~~ THEN EXTERN ~rqtrugos~ RugosGoesBackToAmnRevanSent
END

// Trash talk with companions
CHAIN IF ~InParty("Cernd")
        See("Cernd")
        !StateCheck("Cernd",STATE_SLEEPING)
        Global("rqRevtCernd","LOCALS",0)~ THEN rqrev25J riddle
    ~Do you recognize what this is?~
DO ~SetGlobal("rqRevtCernd","LOCALS",1)~
== BCERND ~What is this... a riddle? It doesn’t look anything like any herb I’ve ever seen. Ah, I get it... is this part of an insect?~
== rqrev25J ~Yes, you guessed correctly.~
== BCERND ~Please tell me what it is.~
== rqrev25J ~You can’t tell?~
== BCERND ~I'm afraid I don't know much about Moonsea insects.~
== rqrev25J ~Actually, it is from a flying insect from the Underdark.~
== BCERND ~Well, one is always learning. Thank you for this riddle.~
EXIT

CHAIN IF ~InParty("Edwin")
        See("Edwin")
        !StateCheck("Edwin",STATE_SLEEPING)
        Global("rqRevtEdwin","LOCALS",0)~ THEN rqrev25J revcooperation
    ~You know this is going to end sooner rather than later; will you go back to Thay?~
DO ~SetGlobal("rqRevtEdwin","LOCALS",1)~
== BEDWIN ~Scrutinize my plans if you must; mercenary, it will do you no good.~
== rqrev25J ~I was thinking about mercantile or mercenary cooperation if the future allows for such, dear Odesseiron.~
== BEDWIN ~And I'll have to just sign quickly because otherwise I will not be able to take this wonderful new opportunity in gnome slave mines.~
== rqrev25J ~I don't think of you as a fool, Odesseiron. In any event, we should discuss this in private.~
EXIT

CHAIN IF ~InParty("Imoen")
        See("Imoen")
        !StateCheck("Imoen",STATE_SLEEPING)
        Global("rqRevtImoen","LOCALS",0)~ THEN BIMOEN2 jokesonyou
    ~Heya, wanna hear a joke? How many Paladins does it take to light a candle?~
DO ~SetGlobal("rqRevtImoen","LOCALS",1)~
== rqrev25J ~I don't know.~
== BIMOEN2 ~Two! One to light it and another to “uphold the light.” hahaha.~
== rqrev25J ~A good one.~
== BIMOEN2 ~But you didn't laugh.~
== rqrev25J ~I didn't. Why all the acting? You're still a Bhaalspawn, and underneath that mask you put on, there's a killer.~
== BIMOEN2 ~So you are scaaared... look I will munch this cookie which will turn me into murderous Slayer!...~
== rqrev25J ~No, but watchfulness is warranted.~
== BIMOEN2 ~You are no fun at all.~
EXIT

CHAIN IF ~InParty("Jan")
        See("Jan")
        !StateCheck("Jan",STATE_SLEEPING)
        Global("rqRevtJansen","LOCALS",0)~ THEN BJAN25 janmerc
    ~So, mercenary, why do you follow <CHARNAME> now? You could go back to Amn to restart your mercenary company.~
DO ~SetGlobal("rqRevtJansen","LOCALS",1)~
== rqrev25J ~I don't see how this concerns you gnome.~
== BJAN25 ~It concerns me mightily, friend. My nephew Filisse was trying to hire mercenaries to guard his turnips. Maybe you could have helped, but alas, none of the available companies did. Which reminds me of the story of Griffin catcher Umynil the Terrible.~
== rqrev25J ~Umynil was hoarding the turnips? How much does he have?~
== BJAN25 ~Ah, never mind.~
EXIT

CHAIN IF ~InParty("HaerDalis")
        See("HaerDalis")
        !StateCheck("HaerDalis",STATE_SLEEPING)
        Global("rqRevHaerDalis","LOCALS",0)~ THEN BHAERD25 story
    ~You seem very tense my goldpact hawk.~
DO ~SetGlobal("rqRevHaerDalis","LOCALS",1)~
== rqrev25J ~Are you trying to get inside of my head?~
== BHAERD25 ~As if that would be a possibility, my hawk. If you continue to be so sprung up, I fear you could leave Faerûn, and that would be an awful shame.~
== rqrev25J ~Very funny, bard... To answer your query, we are in the middle of great events, and mistakes on our part can be deadly.~
 == BHAERD25 ~Aye, I feel the same weight, not to impose on you anything, but perhaps if you would not mind some detensioning, it would be in order? As you would know, people cannot function at the same level without proper rest.~
== rqrev25J ~Very wise words bard. Thanks bard.~
EXIT

CHAIN IF ~InParty("Korgan")
        See("Korgan")
        !StateCheck("Korgan",STATE_SLEEPING)
        Global("rqRevKorganBackstabs","LOCALS",0)~ THEN BKORGA25 backstabs
    ~Ye pointy ears I nae liking yer skulking in shadows but yer ability to put blade in backs is lookin' good to me eyes.~
DO ~SetGlobal("rqRevKorganBackstabs","LOCALS",1)~
== rqrev25J ~I was always more of a commander, thus my skill with weapons was never more than average.~
== BKORGA25 ~Mayhap. But I see yer backstabbing skill and I cannae deny its effectiveness.~
== rqrev25J ~What’s the point of exchanging compliments with you?~
== BKORGA25 ~Cold ye be mercenary I shall leave ye be then.~
EXIT

CHAIN IF ~InParty("Sarevok")
        See("Sarevok")
        !StateCheck("Sarevok",STATE_SLEEPING)
        Global("rqRevSarevokTrash","LOCALS",0)~ THEN BSAREV25 SarevokTrash
    ~You do not seem to be disturbed by my presence at all. Why is that, mercenary?~
DO ~SetGlobal("rqRevSarevokTrash","LOCALS",1)~
== rqrev25J ~Why would I? Defeated enemies can make wonderful servants, as you would well know.~
== BSAREV25 ~Once I would cut out your tongue for such impudence mercenary.~
== rqrev25J ~Still, you cannot deny that your death has changed your perspectives.~
== BSAREV25 ~It did mercenary.~
EXIT

CHAIN IF ~InParty("Valygar")
        See("Valygar")
        !StateCheck("Valygar",STATE_SLEEPING)
        Global("rqRevtValygar","LOCALS",0)~ THEN rqrev25J valygspells
    ~I saw you cast wizard spells, Valygar. How did you come to learn them?~
DO ~SetGlobal("rqRevtValygar","LOCALS",1)~
== BVALYG25 ~Yes, it is part of my ranger training to be able to protect myself from magic or ranged attacks.~
== rqrev25J ~So, in essence, you know and cast mage spells.~
== BVALYG25 ~I would watch your next words if I were you.~
== rqrev25J ~You are just a hypocrite. Magic corrupts, blah blah, and then you cast mage spells.~
== BVALYG25 ~No... I have my magic under full control.~
== rqrev25J ~If you don't let me know, I'll run you through, okay?~
 == BVALYG25 ~What?!... You, you are trying to provoke me.~
== rqrev25J ~You truly have it under control. Congratulations.~
EXIT

CHAIN IF ~InParty("Viconia")
        See("Viconia")
        !StateCheck("Viconia",STATE_SLEEPING)
        Global("rqRevtViconia","LOCALS",0)~ THEN BVICON25 flattery
    ~You've been staring at me, jaluk, no doubt with evil or low intent on your mind.~
DO ~SetGlobal("rqRevtViconia","LOCALS",1)~
== rqrev25J ~When I was executing a contract in the Underdark, we ambushed a drow patrol with priestesses.~
== BVICON25 ~Patrols don't typically have priestesses in them, darthiir. Do not think I am this foolish.~
== rqrev25J ~Perhaps. What does the "Dosst ilharn vithus xuil quaggoth" mean?~
== BVICON25 ~Frowns It means your father fucked with quaggoth. Is there more to this story or... because I do get the feeling there's much more to this story than you let on, male.~
== rqrev25J ~*Chuckles* Female, you are correct.~
EXIT


