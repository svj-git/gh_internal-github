BEGIN ~rq7thief~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN rqSending
    SAY ~Greetings Krolyn.~
    IF ~CheckStatGT(Player1,14,CHR)~ THEN REPLY ~The pleasure is mine.~ GOTO rqCheck1
    IF ~~ THEN REPLY ~It is I, Harper Krolyn.~ GOTO rqYouGoofed
    IF ~~ THEN REPLY ~I do not know what you are talking about.~ GOTO rqYouGoofed
    IF ~~ THEN REPLY ~No, I am <CHARNAME>.~ GOTO rqYouGoofed
END

IF ~~ THEN BEGIN rqCheck1
    SAY ~Why did you insisted to meet here? Graveyard of all places.~
    IF ~~ THEN REPLY ~I wanted to avoid the Cowled Wizards. Their ban on magic is not enforced here.~ GOTO rqPoleaxeItIS
    IF ~CheckStatLT(Player1,12,WIS)~ THEN REPLY ~Forget about it, let's talk about why you are here.~ GOTO rqPoleaxeItIS
    IF ~CheckStatGT(Player1,12,WIS)~ THEN REPLY ~What exactly were we supposed to do here?~ GOTO rqYouGoofed
END
//
IF ~~ THEN BEGIN rqPoleaxeItIS
    SAY ~Alright apologies about my outburst. I have this ceremonial poleaxe to trade. It is way too unwieldy for combat though someone of larger stature and great strength might have use for it.~
    =
    ~Pvolmier probably won't make more of these, so this poleaxe is one of a kind. Are you interested in a trade?~
    IF ~~ THEN REPLY ~So how much do you want for it?~ GOTO PoleaxeDetails
END

IF ~~ THEN BEGIN PoleaxeDetails
    SAY ~Well I was hoping to trade for your own war hammer.~
    IF ~~ THEN REPLY ~No its either gold or nothing.~ GOTO GoldOrNothing
    IF ~!PartyHasItem("rqhamm01")~ THEN REPLY ~Which war hammer are you talking about?~ GOTO rqYouGoofed
    IF ~PartyHasItem("rqhamm01") CheckStatLT(Player1,12,WIS)~ THEN REPLY ~Are you talking about this one?~ GOTO BadNews
    IF ~PartyHasItem("rqhamm01") CheckStatGT(Player1,12,WIS)~ THEN REPLY ~Ah... I have the hammer right here.~ GOTO HammerExchange
END

IF ~~ THEN BEGIN BadNews
    SAY ~Yes of course... wait a second..~
    IF ~~ THEN GOTO rqYouGoofed
END

IF ~~ THEN BEGIN HammerExchange
    SAY ~Lets make that trade.~
    IF ~PartyHasItem("rqhamm01")~ THEN REPLY ~Here you go.~
        DO ~TakePartyItem("rqhamm01")
        GiveItem("rqhamm02",Player1)~ GOTO TradeDone
    IF ~~ THEN REPLY ~Nope I do not want your weapon.~ GOTO TradeNotDone
END

IF ~~ THEN BEGIN rqYouGoofed
    SAY ~What?! You are not Krolyn! Damn!~
    IF ~~ THEN DO ~ForceSpell(Myself,DRYAD_TELEPORT)~
        EXIT
END

IF ~~ THEN BEGIN GoldOrNothing
    SAY ~Then it's nothing. I assumed you were working for Fitzalan, but I guess you are not. Having a ceremonial, unwieldy poleaxe is not an option for an adventurer.~
    IF ~~ THEN REPLY ~Wait, I have changed my mind. I wish to trade!~ GOTO HammerExchange
    IF ~~ THEN REPLY ~No, I do not want anything from you.~ GOTO TradeNotDone
END

IF ~~ THEN BEGIN TradeNotDone
    SAY ~What a waste of time you are.~
    IF ~~ THEN DO ~ForceSpell(Myself,DRYAD_TELEPORT)~
        EXIT
END

IF ~~ THEN BEGIN TradeDone
    SAY ~Well I hope Fitzalan will be happy.~
    IF ~~ THEN DO ~ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END
