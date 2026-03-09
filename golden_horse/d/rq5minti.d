// mintiper vs revan interaction in umar hills
BEGIN ~rq5minti~

IF ~NumTimesTalkedTo(0)
    See("rqrev")
    Inparty("rqrev")
    !Dead("rqrev")
    !StateCheck("rqrev",STATE_SLEEPING)
    ~
    THEN BEGIN MintiperIntro
    SAY ~So you're the fiendish group who has been murdering my friends!~
    IF ~~ THEN REPLY ~I did enjoy defeating your feeble ambush attempts.~ GOTO MintiperAttack //17
    IF ~~ THEN REPLY ~Wait, I would like to know why all this?~ GOTO MintiperExplains
    IF ~~ THEN REPLY ~Let's make a deal. If you will stop your attacks against me, I will pay you gold.~ GOTO MintiperBribeAttempt
    IF ~Alignment(Player1,MASK_GOOD)~ THEN REPLY ~Is there any compassion? I am a genuinely good person. Let's settle this nonviolently.~ GOTO MintiperAttack //17
END

IF ~~ THEN BEGIN MintiperBribeAttempt
    SAY ~Who do you think you are dealing with? We are Harpers; we do not take bribes!~
    IF ~~ THEN REPLY ~Wait, I would like to know why all this is happening.~ GOTO MintiperExplains
    IF ~~ THEN REPLY ~Now I return the favor!~ GOTO MintiperAttack
END

IF ~~ THEN BEGIN MintiperExplains
    SAY ~Hmph! Why would I do that?! Perhaps... perhaps I should say my truth before a battle I might not survive...~
    =
    ~He was the leader of a quite unscrupulous mercenary group. We found out about his involvement in a plot to rob one of our members. So we took some things from his home and pinned the theft on Revan.~
    =
    ~Some nobles are our allies, and we had his robbery contract in writing. A victory, I thought, but then he escaped from jail...~
    =
    ~Subsequently, he ran away to Athkatla and then he hired you.~
    IF ~~ THEN EXTERN ~rqrevJ~ RevanVSMintiper // 16
END

IF ~~ THEN BEGIN MintiperAttack // 17
    SAY ~YOUR WORDS DO NOT MATTER! YOU MURDERED MY FRIENDS!!! DIE!!!~
    IF ~~ THEN DO
        ~SetGlobal("rqContractsRugosAvailable","GLOBAL",1)
        SetGlobal("rq5MintipBattle","GLOBAL",1)
        Enemy()~
    EXIT
END
