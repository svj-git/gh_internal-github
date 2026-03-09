// Ribald had no money
EXTEND_BOTTOM AMELM01 1

IF ~GlobalGT("rqRevanMintiper","GLOBAL",2)~ THEN REPLY ~Why don't you call of your Harpers assassins off my back?~ GOTO ElminsterHarperPeace
IF ~GlobalGT("rqRevanMintiper","GLOBAL",2)~ THEN REPLY ~So Harpers have sent great mage Elminster after me I am honored.~ GOTO ElminsterHarperPeace
END

APPEND AMELM01

    IF ~~ THEN BEGIN ElminsterHarperPeace
        SAY ~To this matter, I will say the following. From now on, I shall personally enforce peace from our side. You and your companions will no longer be attacked by our assets. I personally have dismantled this effort. You may walk in peace.~
        =
        ~Now to the next reason why I have sought you out.~
        IF ~~ THEN GOTO 5
    END
END
