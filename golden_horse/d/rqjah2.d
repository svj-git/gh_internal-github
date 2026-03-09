BEGIN ~rqjah2~

IF ~Global("rqJaheira2AmbushSpawn","GLOBAL",1)~ THEN BEGIN JaheiraAccusation
    SAY ~You've murdered me..~
    IF ~~ THEN REPLY ~What!? How come you are alive!~ GOTO JaheiraRessurectedHow
END

IF ~~ THEN BEGIN JaheiraRessurectedHow
    SAY ~Berinvar found... brought... priest resurrected.~
    IF ~~ THEN EXTERN ~rqberin~ BerinvarWhatIDidNot
END

IF ~~ THEN BEGIN JaheiraSaysDie
    SAY ~For you to die...~
    IF ~~ THEN REPLY ~You had your attempt with Galvarey and look how it turned out.~ EXTERN ~rqberin~ BerinvarPleaseLeave1
END

IF ~~ THEN JaheiraWeird
    SAY ~Kha... Khal... Ah the revenge... I... I... I see <CHARNAME>! I shall restore the balance to avenge all that I have lost!~
    IF ~~ THEN EXTERN ~rqberin~ BerinvarPleaseLeave2
END

IF ~~ THEN BEGIN JaheiraWeird2
    SAY ~I HAVE NO LIFE! Now only... if... no?... Yes!... <CHARNAME>! You took everything from me! And I shall have my retribution!~
    IF ~~ THEN EXTERN ~rqberin~ BerinvarDamn
END

