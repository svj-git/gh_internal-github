BEGIN  ~rqjah134~

IF  ~NumTimesTalkedTo(0)~
    THEN BEGIN rq1tob1 // jaheira
    SAY ~Quiet! <PRO_HESHE> here!~
    IF ~~ THEN GOTO rq1tob2
END

IF ~~ THEN BEGIN rq1tob2 // ribald
    SAY ~Attack friends! Attack!~
    IF ~~ THEN EXTERN ~rqriba~ rqriba3
END

// jaheira to cowled wizards
IF ~~ THEN BEGIN rq1tob8
    SAY ~All stay! Fight!~
    IF ~~ THEN REPLY ~Cowled Wizards? Here? I would say that's too far away from your domain.~ EXTERN ~rqcowl~ rq1tob9
END

IF ~~ THEN BEGIN rq1tob4 // jaheira to shadow thieves
    SAY ~No! All stay! Fight!~
    IF ~~ THEN REPLY ~Shadow Thieves came to tie up few loose ends...~ EXTERN ~rqmonliq~ rq1tob5 // Montin Liq'var
END

BEGIN ~rqriba~

IF ~~ THEN BEGIN rqriba3 // ribald
    SAY ~Although I owe some favors to the Harpers... this... this is beyond what I am willing to help with.~
        IF ~~ THEN
            DO
                ~ApplySpell(Myself,WIZARD_HASTE)  // SPWI305.SPL (Haste)
                EscapeArea()~
            EXTERN ~rqjah134~ rq1tob4
END

BEGIN ~rqmonliq~

IF ~~ THEN BEGIN rq1tob5
    SAY ~We had a little fun with you near Baldur's Gate. Perhaps we will find out what color a Bhaalspawn's blood is after all.~
    IF ~Dead("aran")~ THEN REPLY ~Tsk tsk... perhaps after I dispose of you, I will pay your new Shadowmaster a visit.~ GOTO rq1tob7
    IF ~!Dead("aran") ReputationLT(Player1,7) ~ THEN REPLY ~Aran, that rotten bastard! I will send your heads back to him as a reply!~ GOTO rq1tob7
    IF ~~ THEN REPLY ~Pathetic assassins, unable to even comprehend who they are standing against.~ GOTO rq1tob6
    IF ~~ THEN REPLY ~So you're the one who abducted me near Baldur's Gate. I shall make your death agonizingly slow!~ GOTO rq1tob6
    IF ~~ THEN REPLY ~How much do you want?~ GOTO rq1tob6
    IF ~~ THEN REPLY ~You are quite far away from Amn, no? Why not pretend you did not find me?~ GOTO rq1tob6
    IF ~~ THEN REPLY ~Why come here?~ GOTO rq1tob6
END

IF ~~ THEN BEGIN rq1tob6
    SAY ~HAHAHA!... As expected, spineless and weak.~
        IF ~~ THEN DO
            ~SetGlobal("rqjahtob1shadowthieves","GLOBAL",1)
            Enemy()
            ActionOverride("rqvvsa",Enemy())
            ActionOverride("rqstde",Enemy())~
        EXTERN ~rqjah134~ rq1tob8
END

IF ~~ THEN BEGIN rq1tob7
    SAY ~Drop your gear! We need to reach them faster!~
    IF ~~ THEN DO
            ~DropInventory()
            EscapeArea()
            ActionOverride("rqvvsa",DropInventory())
            ActionOverride("rqvvsa",EscapeArea())
            ActionOverride("rqstde",DropInventory())
            ActionOverride("rqstde",EscapeArea())~ // all thieves to drop inventoryrqvv
        EXTERN ~rqjah134~ rq1tob8
END

BEGIN ~rqcowl~

IF ~~ THEN BEGIN rq1tob9
    SAY ~The Council of Six sent us to keep watch on you, <CHARNAME>...~
    IF ~Global("BribedCowled","GLOBAL",1)~ THEN REPLY ~I am a licensed mage in Amn. There is no conflict between me and the Cowled Wizards.~ GOTO rq1tob11
    IF ~Global("BribedCowled","GLOBAL",0)~ THEN REPLY ~Strange. Why do you stand here as if you were to attack me?~ GOTO rq1tob10
    IF ~Dead("mage18z")~ THEN REPLY ~I killed all of your ilk that dared to oppose me back in Athkatla. Come and be murdered!~ GOTO rq1tob10
    IF ~Class(Player1,MAGE_ALL)~ THEN REPLY ~Foolish Cowled meddlers, I will show you true power!~ GOTO rq1tob10
    IF ~~ THEN REPLY ~Go back! None of you need to die here!~ GOTO rq1tob11
END

IF ~~ THEN BEGIN rq1tob10
    SAY ~Ready for battle, all of you!~
        IF ~~ THEN DO
            ~Enemy()
            ActionOverride("rqcowl2",Enemy())
            ActionOverride("rqcenf1",Enemy())
            ActionOverride("rqcenf2",Enemy())
            ActionOverride("rqcenf3",Enemy())
            ActionOverride("rqcenf4",Enemy())~
        EXTERN ~rqbael~ rq1tob12
END

IF ~~ THEN BEGIN rq1tob11
    SAY ~We shall be leaving now.~
        IF ~~ THEN DO
            ~EscapeArea()
            ActionOverride("rqcowl2",EscapeArea())
            ActionOverride("rqcenf1",EscapeArea())
            ActionOverride("rqcenf2",EscapeArea())
            ActionOverride("rqcenf3",EscapeArea())
            ActionOverride("rqcenf4",EscapeArea())~
        EXTERN ~rqbar30a~ BlutdurstReaction
END

BEGIN ~rqbar30a~

IF ~~ THEN BEGIN BlutdurstReaction
    SAY ~I knew this was foolishness, Jaheira.~
    IF ~~ THEN EXTERN ~rqbael~ rq1tob12
END

BEGIN ~rqbael~

IF ~~ THEN BEGIN rq1tob12
    SAY ~We were sent by Elhan to reinforce the just cause of the Harpers. We did not know it was against you, <CHARNAME>. Now that we are here...~
    IF ~Dead("sudemin")~ THEN REPLY ~Lich! After all that I have done for Suldanesselar, this is how you repay me?!~ GOTO rq1tob13
    IF ~Dead("sudemin")~ THEN REPLY ~Come on, fight, you elven twats! I shall give you a traitor's reward!~ GOTO rq1tob13
    IF ~Dead("sudemin")~ THEN REPLY ~Wait till the citizens of Suldanesselar hear of this—you attacking me just a few days after I rescued you all.~ GOTO rq1tob13
    IF ~!Dead("sudemin")~ THEN REPLY ~Why is there no compassion for the savior of your city and the Tree of Life?~ GOTO rq1tob14
    IF ~!Dead("sudemin")~ THEN REPLY ~Suldanesselar is safe because of me. Remember that, elf.~ GOTO rq1tob14
    IF ~!Dead("sudemin")~ THEN REPLY ~Wait till the citizens of Suldanesselar hear of this. You attacking me here just a few days after I rescued you all.~ GOTO rq1tob14
END

IF ~~ THEN BEGIN rq1tob13
    SAY ~We want to know who murdered Priestess Demin.~
    IF ~~ THEN REPLY ~Demons killed her; we had nothing to do with her death.~ GOTO rq1tobDeadDeminAnswer
    IF ~~ THEN REPLY ~Maybe *YOU* should not have released Irenicus! Then Demin would have lived!~ GOTO rq1tob14
    IF ~~ THEN REPLY ~I have nothing to do with her death. Go and try to pin it on someone else!~ GOTO rq1tobDeadDeminAnswer
    IF ~~ THEN REPLY ~It was an accident, nothing more.~ GOTO rq1tob15
END

IF ~~ THEN BEGIN rq1tob15
    SAY ~You murdered her! You even admitted it!~
        IF ~~ THEN DO
        ~Enemy()
        ActionOverride("rqc6elf3",Enemy())
        ActionOverride("rqc6elf1",Enemy())
        ActionOverride("rqc6elf2",Enemy())
        ActionOverride("rqc6elf4",Enemy())
        ActionOverride("rqc6gen",Enemy())
        ActionOverride("rqf27",Enemy())
        ActionOverride("Keldorn",LeaveParty())
        ActionOverride("Keldorn",Enemy())
        ActionOverride("Aerie",LeaveParty())
        ActionOverride("Aerie",Enemy())
        ActionOverride("Mazzy",LeaveParty())
        ActionOverride("Mazzy",Enemy())
        ActionOverride("Minsc",LeaveParty())
        ActionOverride("Minsc",Enemy())
        ActionOverride("Valygar",LeaveParty())
        ActionOverride("Valygar",Enemy())~
        GOTO ElvesAttack
END

IF ~~ THEN BEGIN ElvesAttack
    SAY ~We must act, no matter what you have done for us!~
    IF ~Global("rqPaladinWoodwille","GLOBAL",1)~ THEN EXTERN ~rqwoodw~ WoodwilleIntro
    IF ~Global("rqPaladinAlThon","GLOBAL",1)~ THEN EXTERN ~rqwill~ rq1tob16
END

IF ~~ THEN BEGIN rq1tob14
    SAY ~Correct, and from the bottom of our hearts we thank you for your role in saving Suldanesselar. May Corellon Larethian bless you.~
        IF ~~ THEN DO
        ~Enemy()
        ActionOverride("rqc6elf3",EscapeArea())
        ActionOverride("rqc6elf1",EscapeArea())
        ActionOverride("rqc6elf2",EscapeArea())
        ActionOverride("rqc6elf4",EscapeArea())
        ActionOverride("rqc6gen",EscapeArea())
        ActionOverride("rqf27",EscapeArea())~ GOTO ElvesLeave
END

IF ~~ THEN BEGIN rq1tobDeadDeminAnswer
    SAY ~Ellesime did not allow War Sages to accompany us here... Regardless, we would certainly not attack the savior of our city.~
        IF ~~ THEN DO
        ~EscapeArea()
        ActionOverride("rqc6elf3",EscapeArea())
        ActionOverride("rqc6elf1",EscapeArea())
        ActionOverride("rqc6elf2",EscapeArea())
        ActionOverride("rqc6elf4",EscapeArea())
        ActionOverride("rqc6gen",EscapeArea())
        ActionOverride("rqf27",EscapeArea())~ GOTO ElvesLeave
END

IF ~~ THEN BEGIN ElvesLeave
    SAY ~We shall be leaving now. May Corellon Larethian bless you.~
    IF ~Global("rqPaladinWoodwille","GLOBAL",1)~ THEN EXTERN ~rqwoodw~ WoodwilleIntro
    IF ~Global("rqPaladinAlThon","GLOBAL",1)~ THEN EXTERN ~rqwill~ rq1tob16
END

BEGIN ~rqwoodw~

IF ~~ THEN BEGIN WoodwilleIntro
    SAY ~So I have finally laid my eyes upon the vile, despicable, murderous <CHARNAME>! You will not survive this meeting, I swear it!~
    =
    ~Prepare for battle, all of you!~
        IF ~~ THEN DO
            ~Enemy()
            ActionOverride("rqwoodw",Enemy())
            ActionOverride("rqnevill",Enemy())
            ActionOverride("rqstaf",Enemy())
            ActionOverride("rqhoward",Enemy())
            ActionOverride("rqbeauf",Enemy())
            ActionOverride("rqtalbot",Enemy())
            ActionOverride("rqjah134",Enemy())
            ActionOverride("rqbar30a",Enemy())
            ActionOverride("rqs20",Enemy())
            ActionOverride("rqc26",Enemy())
            ActionOverride("rqd18",Enemy())
            ActionOverride("Keldorn",LeaveParty())
            ActionOverride("Keldorn",Enemy())
            ActionOverride("Aerie",LeaveParty())
            ActionOverride("Aerie",Enemy())
            ActionOverride("Mazzy",LeaveParty())
            ActionOverride("Mazzy",Enemy())
            ActionOverride("Minsc",LeaveParty())
            ActionOverride("Minsc",Enemy())
            ActionOverride("Anomen",LeaveParty())
            ActionOverride("Anomen",Enemy())
            ActionOverride("Valygar",LeaveParty())
            ActionOverride("Valygar",Enemy())~
        EXIT
END

BEGIN ~rqwill~

IF ~~ THEN BEGIN rq1tob16
    SAY ~We heeded the Harpers' call for battle with great evil.~
    IF ~Dead("rqinqhev")~ THEN GOTO rqAccusation1
    IF ~Dead("kayl2")~ THEN GOTO rqAccusation2
    IF ~Dead("hprelate")~ THEN GOTO rqAccusation3
    IF ~Dead("dawnmas")~ THEN GOTO rqAccusation4
    IF ~Dead("rqinqhev") Dead("kayl2")~ THEN GOTO rqAccusation5
    IF ~Dead("rqinqhev") Dead("hprelate")~ THEN GOTO rqAccusation6
    IF ~Dead("rqinqhev") Dead("dawnmas")~ THEN GOTO rqAccusation7
    IF ~Dead("kayl2") Dead("hprelate")~ THEN GOTO rqAccusation8
    IF ~Dead("hprelate") Dead("kayl2")~ THEN GOTO rqAccusation9
    IF ~Dead("rqinqhev") Dead("dawnmas")~ THEN GOTO rqAccusation10
    IF ~Dead("hprelate") Dead("dawnmas")~ THEN GOTO rqAccusation11
    IF ~Dead("rqinqhev") Dead("kayl2") Dead("hprelate")~ THEN GOTO rqAccusation12
    IF ~Dead("rqinqhev") Dead("kayl2") Dead("dawnmas")~ THEN GOTO rqAccusation13
    IF ~Dead("rqinqhev") Dead("hprelate") Dead("dawnmas")~ THEN GOTO rqAccusation14
    IF ~Dead("kayl2") Dead("hprelate") Dead("dawnmas")~ THEN GOTO rqAccusation15
    IF ~Dead("rqinqhev") Dead("kayl2") Dead("hprelate") Dead("dawnmas")~ THEN GOTO rqAccusation16
    IF ~OR(2) Alignment(Player1,MASK_GOOD) Alignment(Player1,MASK_GENEUTRAL) ReputationGT(Player1,9)~ THEN GOTO rq1tob18
    IF ~OR(2) Alignment(Player1,MASK_GOOD) Alignment(Player1,MASK_GENEUTRAL) ReputationLT(Player1,10)~ THEN GOTO rqProtagonistNotEvilButLowRep
    IF ~Alignment(Player1,MASK_EVIL) ReputationGT(Player1,9)~ THEN GOTO rqProtagonistEvilButGoodRep
    IF ~Alignment(Player1,MASK_EVIL) ReputationLT(Player1,10)~ THEN GOTO rq1tob17
END

IF ~~ THEN BEGIN rqAccusation1
    SAY ~Inquisitor Hevguris is dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation2
    SAY ~Sir Ryan Trawl is dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation3
    SAY ~Prelate Wessalen is dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation4
    SAY ~Dawnmaster Kreel is dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation5
    SAY ~Inquisitor Hevguris and Sir Ryan Trawl are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation6
    SAY ~Inquisitor Hevguris and Prelate Wessalen are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation7
    SAY ~Inquisitor Hevguris and Dawnmaster Kreel are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation8
    SAY ~Sir Ryan Trawl and Prelate Wessalen are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation9
    SAY ~Prelate Wessalen and Sir Ryan Trawl are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation10
    SAY ~Inquisitor Hevguris and Dawnmaster Kreel are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation11
    SAY ~Prelate Wessalen and Sir Ryan Trawl are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation12
    SAY ~Inquisitor Hevguris, Sir Ryan Trawl, and Prelate Wessalen are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation13
    SAY ~Inquisitor Hevguris, Sir Ryan Trawl, and Dawnmaster Kreel are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation14
    SAY ~Inquisitor Hevguris, Prelate Wessalen, and Dawnmaster Kreel are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation15
    SAY ~Sir Ryan Trawl, Prelate Wessalen, and Dawnmaster Kreel are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqAccusation16
    SAY ~Inquisitor Hevguris, Sir Ryan Trawl, Prelate Wessalen, and Dawnmaster Kreel are dead, and you are the prime suspect. Do you confess?~
    IF ~~ THEN GOTO rqDeadPeople
END

IF ~~ THEN BEGIN rqDeadPeople
    SAY ~We have witnesses, we pieced the whole thing together, we even have some scripts. So again, do you confess?~
    IF ~~ THEN REPLY ~I confess to nothing. You are way out of your league, little paladin.~ GOTO rq1tob17
    IF ~~ THEN REPLY ~We are not in Amn, so I suggest you leave now or face my wrath!~ GOTO rq1tob17
    IF ~~ THEN REPLY ~So what if I did? You do the same; you are just making different distinctions.~GOTO rq1tob17
    IF ~Alignment(Player1,MASK_EVIL)~ THEN REPLY ~Bring it on, sanctified murderers!~ GOTO rq1tob17
    IF ~Alignment(Player1,MASK_EVIL)~ THEN REPLY ~Paladins in company with Shadow Thieve. Is there any way to sink even lower than this?~ GOTO rq1tob17
END

IF ~~ THEN BEGIN rqProtagonistNotEvilButLowRep
    SAY ~We can see that <CHARNAME> does not have evil in <PRO_HISHER> heart but has done evil deeds.~
    IF ~~ THEN GOTO rq1tob17
END

IF ~~ THEN BEGIN rqProtagonistEvilButGoodRep
    SAY ~We can see <CHARNAME> is evil, but he has not done enough evil deeds to warrant our help in this matter, Jaheira.~
    IF ~~ THEN GOTO rq1tob18
END

IF ~~ THEN BEGIN rq1tob17
    SAY ~And the viper named <CHARNAME> shall be cleansed from Faerûn by followers of Torm!~
        IF ~~ THEN DO
            ~Enemy()
            ActionOverride("rqalex",Enemy())
            ActionOverride("rqalhe",Enemy())
            ActionOverride("rqkenda",Enemy())
            ActionOverride("rqryan",Enemy())
            ActionOverride("rqjolu",Enemy())
            ActionOverride("rqjah134",Enemy())
            ActionOverride("rqbar30a",Enemy())
            ActionOverride("rqs20",Enemy())
            ActionOverride("rqc26",Enemy())
            ActionOverride("rqd18",Enemy())
            ActionOverride("Keldorn",LeaveParty())
            ActionOverride("Keldorn",Enemy())
            ActionOverride("Aerie",LeaveParty())
            ActionOverride("Aerie",Enemy())
            ActionOverride("Mazzy",LeaveParty())
            ActionOverride("Mazzy",Enemy())
            ActionOverride("Minsc",LeaveParty())
            ActionOverride("Minsc",Enemy())
            ActionOverride("Anomen",LeaveParty())
            ActionOverride("Anomen",Enemy())
            ActionOverride("Valygar",LeaveParty())
            ActionOverride("Valygar",Enemy())~
        EXIT
END

IF ~~ THEN BEGIN rq1tob18
    SAY ~Apologies to you, <CHARNAME>. We were misled. We shall communicate this to the High Harpers.~
        IF ~~ THEN DO
            ~EscapeArea()
            ActionOverride("rqalex",EscapeArea())
            ActionOverride("rqalhe",EscapeArea())
            ActionOverride("rqkenda",EscapeArea())
            ActionOverride("rqryan",EscapeArea())
            ActionOverride("rqjolu",EscapeArea())
            ActionOverride("rqjah134",Enemy())
            ActionOverride("rqbar30a",Enemy())
            ActionOverride("rqs20",Enemy())
            ActionOverride("rqc26",Enemy())
            ActionOverride("rqd18",Enemy())~
        EXIT
END
