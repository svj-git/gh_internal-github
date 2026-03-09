// Volo companions
EXTEND_BOTTOM SARVOLO 9
    IF ~InParty("rqrev")~ THEN REPLY ~Tell me about Revan.~ GOTO VoloAboutRevan
END

APPEND SARVOLO

    IF ~~ THEN BEGIN VoloAboutRevan
        SAY ~From leader of a mercenary company in the Moonsea to master of rogue and arcane arts, skillfully combining his talents into a deadly result. What will the future hold for the old mercenary?~
        IF ~!IsValidForPartyDialog("rqrev")~ THEN GOTO 9
        IF ~IsValidForPartyDialog("rqrev")~ THEN EXTERN ~rqrev25J~ RevanAnswerToEnemies
    END
END
