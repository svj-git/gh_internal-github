BEGIN ~rqjtob2~

IF ~Global("rqjaheira2tobambush","GLOBAL",1)~ THEN BEGIN rq2tob2
    SAY ~<CHARNAME>, it is you! I know... I... know you will never believe me, but I thank you from the bottom of my heart for freeing me from the demons that captured my mind.~
    =
    ~They forced me to attack you and commit many other unspeakable acts against the Harpers. Now you have freed me, and I have come to beg you for forgiveness.~
    =
    ~I thank you for freeing me. If there is anything I can do, just ask.~
    IF ~~ THEN REPLY ~You seemed bereft of your wits, but now you seem as lucid as before?!~ GOTO rq2jaheiraintro
END

IF ~~ THEN BEGIN rq2jaheiraintro
    SAY ~I have come to apologize and to offer my help so we can travel together.~
    IF ~~ THEN REPLY ~Your apology is not accepted. I have had enough of Harpers. Now scram before I kill you.~ GOTO rq2jaheirarocky
    IF ~~ THEN REPLY ~Leave now, and I don't want to see your face again.~ GOTO rq2jaheirarocky
    IF ~~ THEN REPLY ~What do you mean you were not in control of yourself?~ GOTO rq2jahieracontrol
    IF ~~ THEN REPLY ~Whoa there! First you attack me, and then you want to join me?~ GOTO rq2jahieracontrol
    IF ~~ THEN REPLY ~Alright, join me, but you must not betray me!~ GOTO rq2jahamends
    IF ~~ THEN REPLY ~So how did you get into Saradush?~ GOTO rq2AccuseLevel1
    IF ~Global("hectan","GLOBAL",2) Global("lazarus","GLOBAL",2)~ THEN REPLY ~So how did you get into Saradush? Not even teleportation magic works.~ GOTO rq2AccuseLevel2
    IF ~Dead("rqjah134")~ THEN REPLY ~I killed you in the Tethyr Forest. So how did you get into Saradush?~ GOTO rq2AccuseLevel2
END

IF ~~ THEN BEGIN rq2jahieracontrol
    SAY ~The four demons led by Blutdurst did this! By killing them, you have restored my wits and released me from their possession possession!~
    IF ~~ THEN REPLY ~I have more questions for you.~ GOTO rq2jahquestions
END

IF ~~ THEN BEGIN rq2jahquestions
    SAY ~Ask.~
    IF ~~ THEN REPLY ~Who resurrected you?~ GOTO rq2jahmalchorres
    IF ~~ THEN REPLY ~Why would these demons posses you?~ GOTO rq2jahwhyposses
    IF ~~ THEN REPLY ~How did you managed to get so many different allies to help you with your last ambush?~ GOTO rq2jahharpconnections
    IF ~~ THEN REPLY ~One last thing. You died so many times and kept coming back now that is unnatural.~ GOTO rq2jahmalchorres
    IF ~~ THEN REPLY ~No more questions.~ GOTO rq2jaheiraintro
END

IF ~~ THEN BEGIN rq2jahmalchorres
    SAY ~I think it was Malchor Harpell, but I... I... my memories are very hazy. I wish I could remember.~
    IF ~~ THEN REPLY ~I have more questions.~ GOTO rq2jahquestions
END

IF ~~ THEN BEGIN rq2jahwhyposses
    SAY ~They might have more plans. I think they had just... destruction in mind. There was nothing sophisticated about the demon in my body.~
    IF ~~ THEN REPLY ~I have more questions.~ GOTO rq2jahquestions
END

IF ~~ THEN BEGIN rq2jahharpconnections
    SAY ~Harpers do have many connections, though not necessarily allies, so it must have been demonic charm or influence that swayed them to follow.~
    IF ~~ THEN REPLY ~I have more questions.~ GOTO rq2jahquestions
END

IF ~~ THEN BEGIN rq2AccuseLevel1
    SAY ~The road to the city was difficult... I used magic and stealth. Obviously, I cannot tell you more; it would endanger those who helped me.~
    IF ~~ THEN REPLY ~Oh, really? Do tell me more.~ GOTO rq2jaheirarocky
    IF ~~ THEN REPLY ~How about the details.~ GOTO rq2jaheirarocky
    IF ~CheckStatGT(Player1,9,INT)~ THEN REPLY ~So who told you where I would be? A certain fire giant told you?~ GOTO rq2jaheirarocky
    IF ~CheckStatLT(Player1,9,INT)~ THEN REPLY ~Maybe you are telling me the truth, though I have more questions about the demons that possessed you.~ GOTO rq2jahieracontrol
END

IF ~~ THEN BEGIN rq2AccuseLevel2
    SAY ~I think... I reached the city the same way you did.~
    IF ~~ THEN REPLY ~I can get into the city because of my divine heritage, and I am certain you are not a Child of Bhaal.~ GOTO rq2jaheirarocky
END

IF ~~ THEN BEGIN rq2jaheirarocky
    SAY ~You have chosen a rocky path for the future. I do not remember you being so cold. No matter; perhaps we shall meet again.~
    =
    ~Curses! Attack! Attack! Avenge our dead friends!~
        IF ~~ THEN DO
            ~SetGlobal("rqjaheira2tobambush","GLOBAL",2)
            Enemy()
            CreateCreatureDoor("rqfb19t",[529.663],0) // Aumar Freespirited
            CreateCreatureDoor("rqanakat",[600.622],0) // Hegri Balanced
            CreateCreatureDoor("rqs20t",[547.504],0) // Perog the Courageous
            CreateCreatureDoor("rqc26t",[511.561],0) // Prinski Prideculler
            CreateCreatureDoor("rqharpar",[520.542],0) // Agram the Comrade
            CreateCreatureDoor("rqbs21",[535.594],0) // Junthor Talesinger
            CreateCreatureDoor("rqberkrt",[594.546],0) // Leventhern Lawgiver
            CreateCreatureDoor("rqgrunt",[420.629],0) // Lessi Selfless
            CreateCreatureDoor("rqmo22t",[529.736],0) // Lestor the Adjudicator
            CreateCreatureDoor("rqpi20",[711.678],0) // Losbellon Sanctifier
            CreateCreatureDoor("rqds19",[542.777],0) // Grath Fearless
            CreateCreatureDoor("rqf4a18",[724.708],0)~ // Punisher Usshagh
        EXIT
END

IF ~~ THEN BEGIN rq2jahamends
    SAY ~Hahaaa... The wretch is now caged! Attack, my friends! Attack!~
        IF ~~ THEN DO
            ~SetGlobal("rqjaheira2tobambush","GLOBAL",2)
            DisplayStringHead(Myself,31971)  // uses a wand
            ReallyForceSpellRES("rqmaze",Player1) // ApplySpell(Player1,rqmaze)
            Enemy()
            CreateCreatureDoor("rqfb19t",[529.663],0) // Aumar Freespirited
            CreateCreatureDoor("rqanakat",[600.622],0) // Hegri Balanced
            CreateCreatureDoor("rqs20t",[547.504],0) // Perog the Courageous
            CreateCreatureDoor("rqc26t",[511.561],0) // Prinski Prideculler
            CreateCreatureDoor("rqharpar",[520.542],0) // Agram the Comrade
            CreateCreatureDoor("rqbs21",[535.594],0) // Junthor Talesinger
            CreateCreatureDoor("rqberkrt",[594.546],0) // Leventhern Lawgiver
            CreateCreatureDoor("rqgrunt",[420.629],0) // Lessi Selfless
            CreateCreatureDoor("rqmo22t",[529.736],0) // Lestor the Adjudicator
            CreateCreatureDoor("rqpi20",[711.678],0) // Losbellon Sanctifier
            CreateCreatureDoor("rqds19",[542.777],0) // Grath Fearless
            CreateCreatureDoor("rqf4a18",[724.708],0)~ // Punisher Usshagh
        EXIT
END
