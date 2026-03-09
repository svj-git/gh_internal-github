BEGIN ~rq1cappr~

CHAIN
IF ~True()
    InParty("rqrev")
    See("rqrev")
    !StateCheck("rqrev",STATE_SLEEPING)
    Global("rqPranglGroupAmbush1","GLOBAL",0)
    ~
    THEN ~rq1cappr~ RevanPranglIntro
~I see you have hired some morons to protect your worthless hide! It will *not* save you from our wrath!~
==rqrevJ
~Prangl, Prangl... Why did you order a charge near Stojanow? Have I not taught you tactics? Even the most ba...~
==rq1cappr
~Shut up! Shut up! Shut up! Your words mean NOTHING to me, old man. Why don't you just roll over and die!~
==rqrevJ
~I was your mentor, remember? You could have cal...~
==rq1cappr
~I SHALL HEAR NO MORE OF YOUR POISONOUS WORDS! My new allies took me in, and I am PARTNER to them! Not merely a soldier following orders!~
==rqrevJ
~You are forgetting we are mercenaries. There's no place for such petty things in our profession.~
==rq1cappr
~You may be a mercenary! But I am now something more! I am a MEMBER! MY INPUT is valued! I'm no longer ordered around by you or anybody else!~
=
~*Grinding teeth* Argh! Why am I even.. I would prefer to kill you, but my new allies have advised me to negotiate with you...~
=
~Lets gets this over with! Surrender *all* your magic items and Revan Artecratos to me!~
END
    IF ~~ THEN REPLY ~Why don't you give me your weapons.~ GOTO PranglRespect
    IF ~~ THEN REPLY ~Let us negotiate this issue further.~ GOTO PranglThinksYouAreAnIdiot
    IF ~~ THEN REPLY ~I shall enjoy gutting you.~ GOTO PranglRespect
    IF ~~ THEN REPLY ~Let me give you some gold, and maybe we could come to a negotiated settlement.~ GOTO PranglThinksYouAreAnIdiot

CHAIN rq1cappr PranglRespect
~This is the best day of my life! Dieeee!!!!~
    DO
        ~Enemy()
        SetGlobal("rqPranglGroupAmbush1","GLOBAL",1)
        SetGlobal("rq1AmbushBattle","GLOBAL",1)~
EXIT

CHAIN rq1cappr PranglThinksYouAreAnIdiot
~*Laughs* You are an idiot, now die!~
    DO
        ~Enemy()
        SetGlobal("rqPranglGroupAmbush1","GLOBAL",1)
        SetGlobal("rq1AmbushBattle","GLOBAL",1)~
EXIT
