BEGIN ~rq4essli~

IF ~Global("rqwaukenambush4","GLOBAL",1)
    InParty("rqrev")
    !Dead("rqrev")~
    THEN BEGIN 5
    SAY ~Thank you for coming here, <CHARNAME> and Revan.~
    IF ~~ THEN EXTERN ~rq4grosh~ 6
END

IF ~~ THEN BEGIN 7
    SAY ~Yes, but I would like to stop the bloodshed before it's too late.~
    IF ~~ THEN EXTERN ~rq4grosh~ 8
END

IF ~~ THEN BEGIN 9
    SAY ~Your interference is spoiling our operation, Groshnakh!~
    IF ~~ THEN EXTERN ~rq4grosh~ EsslinsWarningGrosh
END

IF ~~ THEN BEGIN 10 // from WaukeenAmbushNegotiation11
    SAY ~*He ignores him* Apologies for the outbursts of my comrade. *He extends his hand* My name is Esslin, and I have invited you here.~
    IF ~~ THEN REPLY ~Shake his hand.~ GOTO WaukeenPoisoned
    IF ~~ THEN REPLY ~Ignore him outstretched hand.~ GOTO WaukeenAmbushCourt1
    IF ~~ THEN REPLY ~Attack him.~ EXTERN ~rq4grosh~ 11 //GroshnakhAmbushAttackCry6
END

IF ~~ THEN BEGIN WaukeenPoisoned
    SAY ~Well met <CHARNAME>. Just ignore him; he doesn't know a thing about making deals.~
    IF ~~ THEN REPLY ~*You feel sharp pain in your hand* You've Poisoned me!~
        DO
            ~ApplySpellRES("rqpoiso",Player1) // poison
            Enemy()~
        EXTERN ~rq4grosh~ 12 //GroshnakhDisbelief8
END

IF ~~ THEN BEGIN WaukeenAmbushCourt1
    SAY ~No time for courtesies? Again, we are here to negotiate a peace deal with you.~
    IF ~~ THEN REPLY ~What!? Why would you do that?.~ GOTO WaukeenAmbushCourt2
END

IF ~~ THEN BEGIN WaukeenAmbushCourt2
    SAY ~We would not be acting in the best interests of our organization if we continued the hunt, so we want to make a deal.~
    IF ~~ THEN REPLY ~Can I ask you some questions?~ GOTO WaukeenAmbushCourt3
    IF ~~ THEN REPLY ~Lets have this ended. Tell me the details of your peace deal.~ GOTO WaukeenNegotiation1
END

IF ~~ THEN BEGIN WaukeenAmbushCourt3
    SAY ~Sure! Question away!~
    IF ~~ THEN REPLY ~Why would I want to make peace deal who are you?~ GOTO WaukeenAmbushCourt5
    IF ~~ THEN REPLY ~What organization are you from?~ GOTO WaukeenAmbushCourt4
    IF ~~ THEN REPLY ~Are you not angry that we have eliminated quite lot of your members?~ GOTO WaukeenAmbushCourt6
    IF ~~ THEN REPLY ~What are the actual crime Revan has committed?~ GOTO WaukeenAmbushCourt7
    IF ~~ THEN REPLY ~So many men sent after one mercenary something doesn't add up.~ GOTO WaukeenAmbushCourt8
    IF ~~ THEN REPLY ~Enough about all this, tell me about this negotiated deal.~ GOTO WaukeenNegotiation1
END

IF ~~ THEN BEGIN WaukeenAmbushCourt4
    SAY ~That I cannot tell you. What I can say is that you have met some of our members, and some of them are very powerful.~
    IF ~~ THEN REPLY ~I want to ask more questions.~ GOTO WaukeenAmbushCourt3
    IF ~~ THEN REPLY ~No more questions tell me about these negotiations.~ GOTO WaukeenNegotiation1
END

IF ~~ THEN BEGIN WaukeenAmbushCourt5
    SAY ~You are a formidable one, but even you cannot watch your back all the time. Why not make a deal now?~
    IF ~~ THEN REPLY ~I want to ask more questions.~ GOTO WaukeenAmbushCourt3
    IF ~~ THEN REPLY ~No more questions tell me about these negotiations.~ GOTO WaukeenNegotiation1
END

IF ~~ THEN BEGIN WaukeenAmbushCourt6
    SAY ~We prefer negotiated solutions if possible, and that's why we are exchanging words, not blows with swords.~
    IF ~~ THEN REPLY ~I want to ask more questions.~ GOTO WaukeenAmbushCourt3
    IF ~~ THEN REPLY ~No more questions tell me about these negotiations.~ GOTO WaukeenNegotiation1
END

IF ~~ THEN BEGIN WaukeenAmbushCourt8
    SAY ~It is not strange if you see it from our perspective: a group harboring a known criminal. Our members have not returned after we sent them to apprehend Revan, and they did have instructions to bring Revan peacefully if possible.~
    IF ~~ THEN REPLY ~I want to ask more questions.~ GOTO WaukeenAmbushCourt3
    IF ~~ THEN REPLY ~No more questions tell me about these negotiations.~ GOTO WaukeenNegotiation1
END

IF ~~ THEN BEGIN WaukeenAmbushCourt7
    SAY ~This is all in the past now; we want to make a deal with you.~
    IF ~~ THEN REPLY ~You are not answering my question about his crimes.~ GOTO WaukeenAmbushCourt9
    IF ~~ THEN REPLY ~No details huh?~ GOTO WaukeenAmbushCourt9
END

IF ~~ THEN BEGIN WaukeenAmbushCourt9
    SAY ~He is a thief and a criminal. We have an alchemist's assistant here who can testify... But why bother? We want to make a deal.~
    IF ~~ THEN REPLY ~Why would you bring assistant here?~ GOTO WaukeenAmbushCourt10
    IF ~~ THEN REPLY ~This affair is getting stranger and stranger.~ GOTO WaukeenAmbushCourt10
    IF ~~ THEN REPLY ~Tell me about this deal.~ GOTO WaukeenAmbushCourt10
END

IF ~~ THEN BEGIN WaukeenAmbushCourt10
    SAY ~None of this matters. Will you hear the negotiation proposal? All you have to do is listen for a while.~
    IF ~~ THEN REPLY ~Alright.~ GOTO WaukeenNegotiation1
END

IF ~~ THEN BEGIN WaukeenNegotiation1
    SAY ~*He again offers his hand for a handshake* Let's do this.~
    IF ~~ THEN REPLY ~(Shake his hand...)~
        DO
            ~ApplySpellRES("rqpoiso",Player1)
            Enemy()~
        EXTERN ~rq4grosh~ 12 //GroshnakhDisbelief8
    IF ~~ THEN REPLY ~*Ignore his outstretched hand.*~ GOTO EsslinNegotiation2
END

IF ~~ THEN BEGIN EsslinNegotiation2
    SAY ~We wish to cease hostilities. This has already cost us dearly in both loved ones and comrades.~
    IF ~~ THEN GOTO EsslinNegotiation3
END

IF ~~ THEN BEGIN EsslinNegotiation3
    SAY ~We are willing to give you magical items in exchange for peace, but we want something in return.~
    IF ~~ THEN GOTO EsslinNegotiation4
END

IF ~~ THEN BEGIN EsslinNegotiation4
    SAY ~We can offer the following powerful magic items:
        Heavily enchanted Magical Quarterstaff.
        Illithid summoning statue.
        Manual of Bodily Health.
        Select one that makes your heart sing, please.~
    IF ~~ THEN REPLY ~Heavily enchanted Magical Quarterstaff.~ GOTO EsslinNegotiation5
    IF ~~ THEN REPLY ~Illithid summoning statue.~ GOTO EsslinNegotiation5
    IF ~~ THEN REPLY ~Manual of Bodily Health.~ GOTO EsslinNegotiation5
END

IF ~~ THEN BEGIN EsslinNegotiation5
    SAY ~Excellent choice, but you must give up something in return.~
    IF ~~ THEN GOTO EsslinChoice1
END

IF ~~ THEN BEGIN EsslinChoice1
    SAY ~We want Revan back, so if you are inclined to do so, please sign this parchment, which states that you have voluntarily given Revan back to our custody.~
    IF ~~ THEN GOTO EsslinChoice2
END

IF ~~ THEN BEGIN EsslinChoice2
    SAY ~We believe you have in your possession a valuable gold coin. It's quite large, so even if you have lots of gold, you will spot it quite easily.~
    IF ~~ THEN GOTO EsslinChoice3
END

IF ~~ THEN BEGIN EsslinChoice3
    SAY ~You could also surrender a very small part of your life essence for study by our alchemists.~
    IF ~~ THEN GOTO EsslinChoice4
END

IF ~~ THEN BEGIN EsslinChoice4
    SAY ~Sign this promise contract. It is essentially a promise of future favor. If you sign this parchment, you can be called upon to help us with a certain task in the future.~
    IF ~~ THEN GOTO EsslinIndictment
END

IF ~~ THEN BEGIN EsslinIndictment
    SAY ~To receive the magic you requested, you will need to surrender one of your assets. What will you choose?~
    IF ~~ THEN REPLY ~Revan its time to part ways. Give me the parchment.~ GOTO WaukeenPoisoning1
    IF ~~ THEN REPLY ~If its just small amount cast life draining spell.~ GOTO WaukeenMaze
    IF ~~ THEN REPLY ~You seem like nice enough person I will do task for you in future.~ GOTO WaukeenPoisoning2
    IF ~~ THEN REPLY ~Very large coin you say... I don't think I have such coin but I could take a look.~ GOTO WaukeenStabbing
    IF ~~ THEN REPLY ~Your offers are tempting though I not willing to do anything for you.~ GOTO WaukeenEsslinLeave
END

IF ~~ THEN BEGIN WaukeenStabbing
    SAY ~If you don't have the coin, <CHARNAME>, we will think about something else.~
    IF ~~ THEN REPLY ~*As you reach for your gold in backpack he lunges at you*~
        DO
            ~ApplySpellRES("rqlunge",Player1)
            SwingOnce()
            Enemy()~
        EXTERN ~rq4grosh~ 12 //GroshnakhDisbelief8
END

IF ~~ THEN BEGIN WaukeenPoisoning2
    SAY ~Excellent! We wouldn't put you in any danger we wouldn't face ourselves, <CHARNAME>.~
    IF ~~ THEN REPLY ~While signing his contract you feel sharp pain in your finger...~
        DO
            ~ApplySpellRES("rqpoiso",Player1)
            Enemy()~
        EXTERN ~rq4grosh~ 12 //GroshnakhDisbelief8
END

IF ~~ THEN BEGIN WaukeenMaze
    SAY ~Yes, it is, <CHARNAME>, and it's reversible.~
    IF ~~ THEN REPLY ~*Magical barrier envelops you.*~
        DO
            ~ApplySpellRES("rqmaze",Player1)
            Enemy()~
        EXTERN ~rq4grosh~ 12 //GroshnakhDisbelief8
END

IF ~~ THEN BEGIN WaukeenPoisoning1
    SAY ~Sign here and here.~
    IF ~~ THEN REPLY ~*While signing his contract you feel sharp pain in your finger...* You've Poisoned me!~
        DO
            ~ApplySpellRES("rqpoiso",Player1)
            Enemy()~
        EXTERN ~rq4grosh~ 12 //GroshnakhDisbelief8
END

IF ~~ THEN BEGIN WaukeenEsslinLeave
    SAY ~Groshnakh, prepare yourself to leave! Please, at least shake hands. I shall be informing my superiors of the failure of negotiations.~
    IF ~~ THEN REPLY ~Shake his hand...~ GOTO WaukeenAmbushHandshake
    IF ~~ THEN REPLY ~Ignore his outstretched hand.~
        EXTERN ~rq4grosh~ 13 //GroshnakhAmbushPeace10
    IF ~~ THEN REPLY ~*Attack him.*~
        EXTERN ~rq4grosh~ 14 //GroshnakhAmbushNegotiationAttackHim9
END

IF ~~ THEN BEGIN WaukeenAmbushHandshake
    SAY ~Well, at least we tried to make this right.~
    IF ~~ THEN REPLY ~*You feel sharp pain in your hand* You've Poisoned me!~
        DO
            ~ApplySpellRES("rqpoiso",Player1)
            Enemy()~
        EXTERN ~rq4grosh~ 12 //GroshnakhDisbelief8
END

IF ~~ THEN BEGIN 15 //WaukeenAmbushEsslinReaction7
    SAY ~No! What the hell, you idiot!~
        IF ~~ THEN DO
            ~SetGlobal("rq4AmbushBattle","GLOBAL",1)
            SetGlobal("rqRevanMintiper","GLOBAL",1)
            ActionOverride("rqclthie",Enemy())
            Enemy()~
        EXIT
END
