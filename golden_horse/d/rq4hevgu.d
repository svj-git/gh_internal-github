BEGIN ~rq4hevgu~

IF ~True()~ THEN BEGIN rq4jobppl
    SAY ~What I can do for you?~
    IF ~~ THEN REPLY ~Why do you have an assassination contract with a gold bounty on your heads?~ GOTO Job4Details
    IF ~~ THEN REPLY ~Apologies for the intrusion. I'll be leaving now.~ GOTO Job4LeaveNow
    IF ~~ THEN REPLY ~Greetings, paladins. I am Sir Dumfolnicus Foolio and wish to bestow upon you the blessings of Torm with weapons and magic.~ GOTO Job4Attacked
END

IF ~~ THEN BEGIN Job4LeaveNow
    SAY ~Farewell.~
        IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Job4Details
    SAY ~Do you always come between a group of armed warriors and say things like that? This is practically a death wish.~
    IF ~~ THEN REPLY ~I'm no ordinary <PRO_RACE>, and I am just that curious.~ GOTO Job4DetailsFollowUp
END

IF ~~ THEN BEGIN Job4DetailsFollowUp
    SAY ~*Suddenly his face pales*. You are... th... *Suddenly he turns to his men and shouts* Get <PRO_HIMHER>! Get that <PRO_MANWOMAN>!~
        IF ~~ THEN GOTO Job4Attacked
END

IF ~~ THEN BEGIN Job4Attacked
    SAY ~*In silence cut through by the sounds of drawn steel, the paladins unsheathe their weapons and attack.*~
        IF ~IsValidForPartyDialog("Myself")~ THEN DO
            ~SetGlobal("rqcontract4battle","GLOBAL",1)
            DisplayStringHead("Minsc",3171) // NOOOOO!!!  Such a vile act will not go unpunished!  Minsc will see this paladin's heart avenged!  Boo shall burrow through your black little souls!
            PlaySound("MINSC54")
            LeaveParty()
            Enemy()
            ActionOverride("Aerie",LeaveParty())
            ActionOverride("Aerie",Enemy())
            ActionOverride("Valygar",LeaveParty())
            ActionOverride("Valygar",Enemy())
            ActionOverride("Jaheira",LeaveParty())
            ActionOverride("Jaheira",Enemy())
            ActionOverride("Keldorn",LeaveParty())
            ActionOverride("Keldorn",Enemy())
            ActionOverride("Mazzy",LeaveParty())
            ActionOverride("Mazzy",Enemy())
            ActionOverride("Anomen",LeaveParty())
            ActionOverride("Anomen",Enemy())~
        EXIT
        IF ~IsValidForPartyDialog("Anomen")~ THEN DO
            ~SetGlobal("rqcontract4battle","GLOBAL",1)
            DisplayStringHead("Anomen",25542) // Nooo!!  You vile dog!  I shall cut out your black heart for this!
            LeaveParty()
            Enemy()
            ActionOverride("Aerie",LeaveParty())
            ActionOverride("Aerie",Enemy())
            ActionOverride("Valygar",LeaveParty())
            ActionOverride("Valygar",Enemy())
            ActionOverride("Jaheira",LeaveParty())
            ActionOverride("Jaheira",Enemy())
            ActionOverride("Minsc",LeaveParty())
            ActionOverride("Minsc",Enemy())
            ActionOverride("Keldorn",LeaveParty())
            ActionOverride("Keldorn",Enemy())
            ActionOverride("Mazzy",LeaveParty())
            ActionOverride("Mazzy",Enemy())~
        EXIT
        IF ~IsValidForPartyDialog("Mazzy")~ THEN DO
            ~SetGlobal("rqcontract4battle","GLOBAL",1)
            DisplayStringHead("Mazzy",40492)  // No!  You... you can't do this!
            LeaveParty()
            Enemy()

            ActionOverride("Aerie",LeaveParty())
            ActionOverride("Aerie",Enemy())
            ActionOverride("Valygar",LeaveParty())
            ActionOverride("Valygar",Enemy())
            ActionOverride("Jaheira",LeaveParty())
            ActionOverride("Jaheira",Enemy())
            ActionOverride("Minsc",LeaveParty())
            ActionOverride("Minsc",Enemy())
            ActionOverride("Keldorn",LeaveParty())
            ActionOverride("Keldorn",Enemy())
            ActionOverride("Anomen",LeaveParty())
            ActionOverride("Anomen",Enemy())~
        EXIT
        IF ~IsValidForPartyDialog("Aerie")~
            THEN DO
            ~SetGlobal("rqcontract4battle","GLOBAL",1)
            DisplayStringHead("Aerie",56235)  // No! What are you doing?!
            LeaveParty()
            Enemy()
            ActionOverride("Valygar",LeaveParty())
            ActionOverride("Valygar",Enemy())
            ActionOverride("Jaheira",LeaveParty())
            ActionOverride("Jaheira",Enemy())
            ActionOverride("Minsc",LeaveParty())
            ActionOverride("Minsc",Enemy())
            ActionOverride("Keldorn",LeaveParty())
            ActionOverride("Keldorn",Enemy())
            ActionOverride("Mazzy",LeaveParty())
            ActionOverride("Mazzy",Enemy())
            ActionOverride("Anomen",LeaveParty())
            ActionOverride("Anomen",Enemy())~
        EXIT
        IF ~IsValidForPartyDialog("Keldorn")~
            THEN DO
            ~SetGlobal("rqcontract4battle","GLOBAL",1)
            DisplayStringHead("Keldorn",29435)  // NOOOOOO!!
            LeaveParty()
            Enemy()
            ActionOverride("Aerie",LeaveParty())
            ActionOverride("Aerie",Enemy())
            ActionOverride("Valygar",LeaveParty())
            ActionOverride("Valygar",Enemy())
            ActionOverride("Jaheira",LeaveParty())
            ActionOverride("Jaheira",Enemy())
            ActionOverride("Minsc",LeaveParty())
            ActionOverride("Minsc",Enemy())
            ActionOverride("Keldorn",LeaveParty())
            ActionOverride("Keldorn",Enemy())
            ActionOverride("Mazzy",LeaveParty())
            ActionOverride("Mazzy",Enemy())
            ActionOverride("Anomen",LeaveParty())
            ActionOverride("Anomen",Enemy())~
        EXIT
        IF ~!IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Mazzy") !IsValidForPartyDialog("Anomen") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Keldorn")~
            THEN DO
            ~SetGlobal("rqcontract4battle","GLOBAL",1)
            ActionOverride("Aerie",LeaveParty())
            ActionOverride("Aerie",Enemy())
            ActionOverride("Valygar",LeaveParty())
            ActionOverride("Valygar",Enemy())
            ActionOverride("Jaheira",LeaveParty())
            ActionOverride("Jaheira",Enemy())
            ActionOverride("Minsc",LeaveParty())
            ActionOverride("Minsc",Enemy())
            ActionOverride("Keldorn",LeaveParty())
            ActionOverride("Keldorn",Enemy())
            ActionOverride("Mazzy",LeaveParty())
            ActionOverride("Mazzy",Enemy())
            ActionOverride("Anomen",LeaveParty())
            ActionOverride("Anomen",Enemy())~
        EXIT
END
