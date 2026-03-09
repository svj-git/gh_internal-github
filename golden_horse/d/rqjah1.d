BEGIN ~rqjah1~

IF ~OR (2)
        OpenState("Cell01",FALSE)
        Global("JaheiraReleased","GLOBAL",0)~ THEN BEGIN JaheiraOpenedCellDoor
    SAY ~You bastard! You did not even bother to rescue me from Irenicus's cell!~
    IF ~~ THEN EXTERN ~rqgalvar~ GalvareyBrief
END

IF ~!OpenState("Cell01",FALSE)
    OR (3)
        Global("JaheiraJerk","GLOBAL",1)
        Global("JaheiraHunt","GLOBAL",1)
        ReputationLT([PC],13)
    ~
    THEN BEGIN JaheiraDisapproval
    SAY ~I see you have changed much, <CHARNAME>. Words of your deeds have reached even us...~
    IF ~~ THEN REPLY ~Jaheira why is that a concern to you?~ GOTO JaheiraWhy
    IF ~~ THEN REPLY ~What lovely surprise Jaheira you sure welcomed sight for sore eyes.~ GOTO JaheiraWhy
END

IF ~~ THEN BEGIN JaheiraWhy
    SAY ~It seems that I have misjudged you. It would be best if you just calmly listened to us; it is for the best.~
    IF ~~ THEN EXTERN ~rqgalvar~ GalvareyIntro
END

IF ~~ THEN BEGIN JaheiraAppeal
    SAY ~<CHARNAME> cease you mewling... Have no fear I personally shall break the news to High Harpers and they will judge not *i*.~
    IF ~~ THEN EXTERN ~rqgalvar~ GalvareyPoint
END

IF ~~ THEN BEGIN JaheiraWhyEnemy
    SAY ~Many things, <CHARNAME>. If you must know, dalliances with the monster over here were just the last straw.~
    IF ~~ THEN REPLY ~I still remember remember Gorion's words: that I should go to the Friendly Arms. There you will find Khalid and Jaheira. They have long been my friends, and you can trust them.~ EXTERN ~rqgalvar~ GalvareyEnough
    IF ~~ THEN REPLY ~You should recognize I am also struggling with the taint. It is not easy to have part of my soul so different...~ EXTERN ~rqgalvar~ GalvareyEnough
    IF ~~ THEN REPLY ~Oh, come on, Jaheira. Can't you take a bit of humor? You know your face looks so gorgeous when you are angry.~ EXTERN ~rqgalvar~ GalvareyEnough
    IF ~~ THEN REPLY ~So be it. I shall regard you as enemy from now on.~ EXTERN ~rqgalvar~ GalvareyEnough
END
