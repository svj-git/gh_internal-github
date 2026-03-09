// Saemon death

EXTEND_BOTTOM AMCARRAS 3
    IF ~Dead("amsaemon")~ THEN REPLY ~Saemon is dead by my own hand. His corpse is just south of the circular platform here in Amkethran.~ GOTO SaemonDead
END

APPEND AMCARRAS

    IF ~~ THEN BEGIN SaemonDead
        SAY ~I... see... it is unfortunate that Saemon has met his end. What do you wish of us then?~
        IF ~~ THEN REPLY ~Now, hand over your *merchandise*, or you will share his fate.~ GOTO 10
        IF ~~ THEN REPLY ~Just a warning: if you do *any* action that would harm me or my interests, you will follow him to hell.~
            DO ~SetGlobalTimer("ThievesScoot","AR5504",ONE_DAY)~ EXIT
    END
END

/*
    IF ~~ THEN BEGIN CarrasEscapes
        SAY ~*Pulls out bag* We gathered most valuable things here just leave us alone.~
        IF ~~ THEN
            DO
                ~ReallyForceSpell(Myself,DRYAD_TELEPORT)
                GiveItemCreate("rqbag01")~
    END
*/



