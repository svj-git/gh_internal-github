BEGIN ~rqjah4~

IF ~Global("rqharper3reviane","GLOBAL",1)~THEN BEGIN JaheiraUnnatural
    SAY ~This is <PRO_HESHE>...yes, this is the one.~
    IF ~~ THEN REPLY ~How is this possible?! I have struck you down twice now!~ GOTO Jaheira4Ressurected
END

IF ~~ THEN BEGIN Jaheira4Ressurected
    SAY ~You try harder <CHARNAME>. I nightmare now.~
    IF ~~ THEN REPLY ~Well, no matter. I will just kill you one more time!~ EXTERN ~rqdermin~ DerminWhatYouDone
    IF ~~ THEN REPLY ~We used to be comrades, remember?~ EXTERN ~rqdermin~ DerminWhatYouDone
    IF ~~ THEN REPLY ~Why all this? Why don't you just scram to the blasted afterlife!~ EXTERN ~rqdermin~ DerminWhatYouDone
END
