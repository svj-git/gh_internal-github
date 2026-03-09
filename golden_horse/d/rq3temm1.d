BEGIN ~rq3temp1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
  SAY ~These two should be put in jail to cool down a little.~
  IF ~~ THEN EXTERN ~rq3temm1~ 2
END

BEGIN rq3temm1

IF ~~ THEN BEGIN 2
  SAY ~Could you ask this good-for-nothing, flea-bitten excuse for a merchant to leave this place! The High Priest and I came to an understanding that only *I* will have the right to be a merchant near the temple!~
  IF ~~ THEN EXTERN ~rq3temm2~ 3
END

BEGIN rq3temm2

IF ~~ THEN BEGIN 3
  SAY ~And where is the parchment or document of some kind to prove this? Hmm??? Why don't you show me your supposed right on paper?~
    IF ~~ THEN DO ~SetGlobal("rqSpawnTempleAmbush","GLOBAL",1)~ EXTERN ~rq3temo2~ 4
END

BEGIN rq3temo2

IF ~~ THEN BEGIN 4
  SAY ~Alright, you and me, let's go!~ [RUFFIA05]
    IF ~~ THEN DO
      ~SetGlobal("rq3AmbushBattle","GLOBAL",1)
      OpenDoor("Door0901")
      Enemy()
      ActionOverride("rq3temm1",EscapeArea())
      ActionOverride("rq3temm2",EscapeArea())
      ActionOverride("rq3temp1",EscapeArea())~
    EXIT
END


