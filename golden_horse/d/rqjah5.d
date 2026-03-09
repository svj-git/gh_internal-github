BEGIN ~rqjah5~

IF ~~ THEN BEGIN Jaheira4Attack
    SAY ~No deals for a slayer of Harpers.~ [JAHEIRC9]
        IF ~~ THEN
        DO
            ~SetGlobal("rqjaheira5malchor","GLOBAL",1)
            Enemy()
            ActionOverride("rqmalch",Enemy())~
        EXIT
END

IF ~~ THEN BEGIN Jaheira4Amulet
    SAY ~An amulet on a silver chain with four gems inlaid: an emerald, a diamond, a rogue stone, and a king's tear.~
    IF ~~ THEN EXTERN ~rqmalch~ MalchorAmuletWants
END
