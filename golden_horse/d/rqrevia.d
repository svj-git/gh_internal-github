BEGIN ~rqrevia~

IF ~Global("rqharper3reviane","GLOBAL",0)~ THEN BEGIN rqrevia1
    SAY ~Hold and stand! I am charged with the removal of your taint from this land!~
    =
    ~Jaheira told us about your fiendish exploits; it made my spine shiver! She is a Harper paragon, even in her pitiful state for which you are responsible, and yet still she strives to uphold the the Harper Code!~
    IF ~~ THEN REPLY ~I think you are being played by forces yet to be seen! Surrender, and we shall get to the bottom of this.~ GOTO rqrevia2
    IF ~~ THEN REPLY ~Attack if you dare, but know that many have failed!~ GOTO rqrevia4
    IF ~~ THEN REPLY ~If I suffer further attacks, I shall dedicate myself to eliminating all traces of Harper filth from the realms!~ GOTO rqrevia4
    IF ~~ THEN REPLY ~The attacks on me were unprovoked; it was you who struck the first blow!~ GOTO rqrevia3
END

IF ~~ THEN BEGIN rqrevia2
    SAY ~It is you that have wronged those who harp! Such a crime demands the harshest response!~
    IF ~~ THEN REPLY  ~Yawn! Another foolish Harper. I do feel very threatened.~ GOTO rqrevia5
    IF ~~ THEN REPLY  ~Is there no compassion in your heart? Why must you attack me constantly?~ GOTO rqrevia5
    IF ~~ THEN REPLY  ~And such a threat demands an equal response!~ GOTO rqrevia4
END

IF ~~ THEN BEGIN rqrevia3
    SAY ~There can be no rhyme or reason for this crime. Justice will be served on the end of my blade! There can be no talking with the killer of Harpers!~
    IF ~~ THEN DO
        ~SetGlobal("rqBattle3Start","GLOBAL",1)
        SetGlobal("rqharper3reviane","GLOBAL",1)
        Enemy()~
    EXIT
END

IF ~~ THEN BEGIN rqrevia4
    SAY ~Good! Defend yourself, for it shall make it all the more punishing when you fall!~
    IF ~~ THEN DO
        ~SetGlobal("rqBattle3Start","GLOBAL",1)
        SetGlobal("rqharper3reviane","GLOBAL",1)
        Enemy()~
    EXIT
END

IF ~~ THEN BEGIN rqrevia5
    SAY ~You are mocking me?! The insolence!~
    IF ~~ THEN DO
        ~SetGlobal("rqBattle3Start","GLOBAL",1)
        SetGlobal("rqharper3reviane","GLOBAL",1)
        Enemy()~
    EXIT
END
