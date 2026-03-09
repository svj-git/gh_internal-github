BEGIN ~rqgalvar~

IF ~~ THEN BEGIN GalvareyIntro
    SAY ~Good... good... Jaheira, I must say that I admire your zeal for our cause greatly.~
    IF ~~ THEN GOTO GalvareyCrimeAccused
END

IF ~~ THEN BEGIN GalvareyCrimeAccused
    SAY ~Let me elaborate on why we are here. Neither Jaheira nor I wish to have blood on our hands, so we devised this Harper Court.~
    =
    ~I personally would not like people with your heritage to walk freely, but Jaheira here convinced me to let the Harper court decide. No doubt they will see you as you truly are.~
    =
    ~We have all this in writing; everything is official here.~
    IF ~~ THEN REPLY ~This looks like another Harper assassination plot! I will have none of this!~ GOTO GalvareyDefense
    IF ~~ THEN REPLY ~Can I see the mentioned letters or parchments?~ GOTO GalvareyLetters
    IF ~~ THEN REPLY ~Yes, yes. After I killed dozens of your goons, now you want to push this garbage.~ GOTO GalvareyDefense
    IF ~~ THEN REPLY ~If Revan is your target, why are you forcing me to go?~ GOTO GalvareyWhyMeAndRevan
END

IF ~~ THEN BEGIN GalvareyWhyMeAndRevan
    SAY ~Your choice in companions is telling, and your heritage... Your behavior towards Jaheira... Shall I go on?~
    IF ~~ THEN REPLY ~I think you are a presumptuous prick!~ GOTO GalvareyDefense
    IF ~~ THEN REPLY ~None of this makes me a criminal.~ GOTO GalvareyCriminal
    IF ~~ THEN REPLY ~I made pact with Revan to protect him. I did not know his enemies were Harpers.~ GOTO GalvareyCriminal
END

IF ~~ THEN BEGIN GalvareyCriminal
    SAY ~We know you killed Mintiper and others! You are a Slayer of Harpers! And we are taking you to court!~
    IF ~~ THEN REPLY ~You are welcome to force me if you like!~ GOTO GalvareyDefense
    IF ~~ THEN REPLY ~I am not submitting to your made-up "Court"! Harpers do not have any court.~ GOTO GalvareyDefense
    IF ~~ THEN REPLY ~Pretty sure this is just another Harper ambush!~ GOTO GalvareyDefense
    IF ~~ THEN REPLY ~It is you who is unreasonable.~ GOTO GalvareyDefense
END

IF ~~ THEN BEGIN GalvareyLetters
    SAY ~Ahh... I must have forgotten them somewhere. Will you go willingly or not?~
    IF ~~ THEN REPLY ~It looks very suspicious that you don't have them!~ GOTO GalvareyDefense
END

IF ~~ THEN BEGIN GalvareyDefense
    SAY ~Nonsense! Your violent nature sees what it wants to see!~
    IF ~~ THEN REPLY ~Alright alright... But let me ask you one question. What is your favorite color?~ GOTO GalvareyColor
    IF ~~ THEN REPLY ~Skip to the point Galvarey!~ GOTO GalvareyPoint
    IF ~~ THEN REPLY ~Jaheira! please do not let this man corrupt you to attack me!~ EXTERN ~rqjah1~  JaheiraAppeal
END

IF ~~ THEN BEGIN GalvareyColor
    SAY ~What!? What this has to do with anything? If anything, this proves we must do this!~
    IF ~~ THEN GOTO GalvareyPoint
END

IF ~~ THEN BEGIN GalvareyPoint
    SAY ~Jaheira and I have agreed to a compromise: a temporary spell of imprisonment. We will then deliver you before the High Harper Council, where we will vote on your fate. If the gods smile on us, perhaps we will even excise your taint.~
    IF ~~ THEN REPLY ~What?! That is monstrous!~ GOTO GalvareyMonstrous
    IF ~~ THEN REPLY ~Why, Jaheira? Why betray me like this!?~ EXTERN ~rqjah1~ JaheiraWhyEnemy
END

IF ~~ THEN BEGIN GalvareyMonstrous
    SAY ~You might not like my words or Jaheira's, but think about it: the more you struggle against Harper justice, the more people will die.~
    IF ~~ THEN REPLY ~None of this looks like justice to me.~ GOTO GalvareyFight
    IF ~~ THEN REPLY ~Why don't you just attack me and skip this imprisonment nonsense!~ GOTO GalvareyFight
    IF ~~ THEN REPLY ~I shall extinguish your organization from the face of Faerun!~ GOTO GalvareyFight
END

IF ~~ THEN BEGIN GalvareyEnough
    SAY ~Enough of this! Jaheira is a Harper, and following the commands of the High Harpers is her duty. You will submit and shall be presented before the High Harper council!~
    IF ~~ THEN REPLY ~I will not agree to any imprisonment!~ GOTO GalvareyFight
    IF ~~ THEN REPLY ~Alright, cast the spell. I will see these Harpers for myself.~ GOTO GalvareyInprisonment
    IF ~~ THEN REPLY ~None of this makes sense to me. Why would you want to cast a spell just to parley with Harpers?~ GOTO GalvareyObjections
END

IF ~~ THEN BEGIN GalvareyBrief
    SAY ~You truly are despicable one Bhaalspawn! Reprehensible so much that even I do not know whether we should benevolent enough to not kill you where you stand!~
    =
    ~Jaheira fought for you, yet you did not even bother to release her from a prison cell! The wretchedness of your behavior is astounding!~
    =
    ~Jaheira and I devised this Harper Court so that you might be judged fairly and without our... en... wh... whatever! Surrender! And you shall be transported via a temporarily incapacitating spell before the Harper Court!~
    IF ~~ THEN REPLY ~What?! I will never agree to anything foolish like that!~ GOTO GalvareyFight
    IF ~~ THEN REPLY ~Alright cast the spell i wish to defend myself before your court.~ GOTO GalvareyInprisonment
    IF ~~ THEN REPLY ~Why would you want to do such thing just for me to talk to this *Harper Court*?~ GOTO GalvareyObjections
END

IF ~~ THEN BEGIN GalvareyInprisonment
    SAY ~Glad you've decided to cooperate. With my appointment as Herald, more good like this can be done. As I said, you need not worry; we shall cast the spell on you, and it will last until we transport you unharmed before the High Harper council.~
    IF ~~ THEN REPLY ~Yes cast the spell on me. I shall meet with this Harper Council.~
        DO
            ~ReallyForceSpell(Player1,WIZARD_IMPRISONMENT)
            ReallyForceSpell("rqrev",WIZARD_IMPRISONMENT)
            SetGlobal("rqJaheira1Ambush","GLOBAL",1)
            SetGlobal("rqBattle1Start","GLOBAL",1)~
        EXIT
END

IF ~~ THEN BEGIN GalvareyObjections
    SAY ~*Sigh* Do you think I am a fool? You will come with us whether you want to or not!~
    IF ~~ THEN GOTO GalvareyFight
END

IF ~~ THEN BEGIN GalvareyFight
    SAY ~You can certainly resist, but with six Harpers and Jaheira as our ally, the odds are not in your favor...~
    IF ~~ THEN DO
        ~SetGlobal("rqJaheira1Ambush","GLOBAL",1)
        SetGlobal("rqBattle1Start","GLOBAL",1)~
    EXIT
END
