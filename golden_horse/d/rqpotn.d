BEGIN ~rqpotc01~

IF ~CheckStatGT(LastTalkedToBy,16,WIS) CheckStatGT(LastTalkedToBy,16,INT)~ THEN BEGIN rqPotionCase100
    SAY~*You notice this potion case is larger and slightly heavier than a usual potion case. Despite its size, it can hold as many potions as an ordinary case. If you take out the longest potion and put it on the side of the case, you notice the case is substantially taller than the potion, which can only mean that the case has a double bottom. You see no obvious opening. You could rip it open if you wish and figure out what is sewn inside, if anything.*~
    IF ~AreaCheck("AR4500") InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Cut the case with knife.~ GOTO AreaRight
    IF ~!AreaCheck("AR4500") !InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Cut the case with knife.~ GOTO AreaWrong
    IF ~!AreaCheck("AR4500") InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Cut the case with knife.~ GOTO AreaWrong
    IF ~AreaCheck("AR4500") !InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~Cut the case with knife.~ GOTO AreaWrong
    IF ~~ THEN REPLY ~Leave it be.~ EXIT
END
// Int + Wis --- AR4500 --- InpartySlot
// InPartySlot(LastTalkedToBy,0)

IF ~~ THEN BEGIN AreaWrong
    SAY ~You pierce through the leather side of the case, then proceed sideways to cut a hole for your hand...~
    IF ~RandomNum(6,1)~ THEN GOTO rqPotionCase101
    IF ~RandomNum(6,2)~ THEN GOTO rqPotionCase102
    IF ~RandomNum(6,3)~ THEN GOTO rqPotionCase103
    IF ~RandomNum(6,4)~ THEN GOTO rqPotionCase104
    IF ~RandomNum(6,5)~ THEN GOTO rqPotionCase105
    IF ~RandomNum(6,6)~ THEN GOTO rqPotionCase106
END

IF ~~ THEN BEGIN rqPotionCase101
    SAY ~You pull out a single potion from the cut-up case.~
        IF ~~ THEN DO ~GiveItemCreate("potn55",LastTalkedToBy,0,0,0)
        DestroyItem("rqpotc01")~ EXIT
END

IF ~~ THEN BEGIN rqPotionCase102
    SAY ~You pull out a single potion from the cut-up case.~
        IF ~~ THEN DO ~GiveItemCreate("potn14",LastTalkedToBy,0,0,0)
        DestroyItem("rqpotc01")~ EXIT
END

IF ~~ THEN BEGIN rqPotionCase103
    SAY ~You pull out a single potion from the cut-up case.~
        IF ~~ THEN DO ~GiveItemCreate("potn11",LastTalkedToBy,0,0,0)
        DestroyItem("rqpotc01")~ EXIT
END

IF ~~ THEN BEGIN rqPotionCase104
    SAY ~You pull out a single potion from the cut-up case.~
        IF ~~ THEN DO ~GiveItemCreate("potn18",LastTalkedToBy,0,0,0)
        DestroyItem("rqpotc01")~ EXIT
END

IF ~~ THEN BEGIN rqPotionCase105
    SAY ~You pull out a single potion from the cut-up case.~
        IF ~~ THEN DO ~GiveItemCreate("potn33",LastTalkedToBy,0,0,0)
        DestroyItem("rqpotc01")~ EXIT
END

IF ~~ THEN BEGIN rqPotionCase106
    SAY ~You pull out a single potion from the cut-up case.~
        IF ~~ THEN DO ~GiveItemCreate("potn35",LastTalkedToBy,0,0,0)
        DestroyItem("rqpotc01")~ EXIT
END

// Crates
IF ~~ THEN BEGIN AreaRight
    SAY ~You pierce through leather side of case then proceed sideways to cut hole for you hand....~
    IF ~RandomNum(5,1) InPartySlot(LastTalkedToBy,0)~ THEN GOTO rqPotionCase110
    IF ~RandomNum(5,2) InPartySlot(LastTalkedToBy,0)~ THEN GOTO rqPotionCase111
    IF ~RandomNum(5,3) InPartySlot(LastTalkedToBy,0)~ THEN GOTO rqPotionCase112
    IF ~RandomNum(5,4) InPartySlot(LastTalkedToBy,0)~ THEN GOTO rqPotionCase113
    IF ~RandomNum(5,5) InPartySlot(LastTalkedToBy,0)~ THEN GOTO rqPotionCase114
END

IF ~~ THEN BEGIN rqPotionCase110
    SAY ~You pull out small crate from cut up case.~
        IF ~~ THEN DO ~GiveItemCreate("rqpotc02",LastTalkedToBy,0,0,0)
        DestroyItem("rqpotc01")~ EXIT
END

IF ~~ THEN BEGIN rqPotionCase111
    SAY ~You pull out small crate from cut up case.~
        IF ~~ THEN DO ~GiveItemCreate("rqpotc04",LastTalkedToBy,0,0,0)
        DestroyItem("rqpotc01")~ EXIT
END

IF ~~ THEN BEGIN rqPotionCase112
    SAY ~You pull out small crate from cut up case.~
        IF ~~ THEN DO ~GiveItemCreate("rqpotc05",LastTalkedToBy,0,0,0)
        DestroyItem("rqpotc01")~ EXIT
END

IF ~~ THEN BEGIN rqPotionCase113
    SAY ~You pull out small crate from cut up case.~
        IF ~~ THEN DO ~GiveItemCreate("rqpotc06",LastTalkedToBy,0,0,0)
        DestroyItem("rqpotc01")~ EXIT
END

IF ~~ THEN BEGIN rqPotionCase114
    SAY ~You pull out small crate from cut up case.~
        IF ~~ THEN DO ~GiveItemCreate("rqpotc07",LastTalkedToBy,0,0,0)
        DestroyItem("rqpotc01")~ EXIT
END
// 1 - 8
BEGIN ~rqpotc02~

IF ~True()~ THEN BEGIN rqPotionCase200
    SAY ~The box that was ripped from the potion case has the numeral II on it. Apart from that, there are no other markings on the small crate. Surely there is something important inside. What will you do?~
        IF ~CheckStatGT(LastTalkedToBy,17,WIS) CheckStatGT(LastTalkedToBy,17,INT) Dead("chalrv01") AreaCheck("AR4500") InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~*Suddenly voice in your head says* Blood sacrifice is demanded!~ GOTO rqPotionSacrifice200
        IF ~!Dead("chalrv01")~ THEN REPLY ~You deftly put a knife between the top plank and the rest of the crate and pry the lid off.~ GOTO rqPotionCaseLimited200
        IF ~Dead("chalrv01")~ THEN REPLY ~You deftly put a knife between the top plank and the rest of the crate and pry the lid off.~ GOTO rqPotionCaseLimited200
        IF ~~ THEN REPLY ~Not yet, put away the crate.~
            EXIT
END

IF ~~ THEN BEGIN rqPotionCaseLimited200
    SAY ~You unwrap cloth and put the potion in your inventory.~
    IF ~RandomNum(4,1)~ THEN
        DO
            ~GiveItemCreate("rqpotn1",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
    IF ~RandomNum(4,2)~ THEN
        DO
            ~GiveItemCreate("rqpotn2",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
    IF ~RandomNum(4,3)~ THEN
        DO
            ~GiveItemCreate("rqpotn3",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
    IF ~RandomNum(4,4)~ THEN
        DO
            ~GiveItemCreate("rqpotn4",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
END

IF ~~ THEN BEGIN rqPotionSacrifice200
    SAY ~The crate briefly glows and you are certain that you have done something right.~
    IF ~~ THEN REPLY ~Your eyes suddenly focus on a small needle you swear you've never seen before. Intuitively, you pierce your finger, letting a few drops of blood onto the crate.~ DO ~ApplyDamage(LastTalkedToBy,1,PIERCING)~ GOTO rqPotionCase201
    IF ~~ THEN REPLY ~Leave the crate be.~ EXIT
END

// 1 - 8
IF ~~ THEN BEGIN rqPotionCase201
    SAY ~You unwrap cloth and put the potion in your inventory.~
    IF ~RandomNum(10,1)~ THEN
        DO
            ~GiveItemCreate("rqpotn1",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
    IF ~RandomNum(10,2)~ THEN
        DO
            ~GiveItemCreate("rqpotn2",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
    IF ~RandomNum(10,3)~ THEN
        DO
            ~GiveItemCreate("rqpotn3",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
    IF ~RandomNum(10,4)~ THEN
        DO
            ~GiveItemCreate("rqpotn4",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
    IF ~RandomNum(10,5)~ THEN
        DO
            ~GiveItemCreate("rqpotn5",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
    IF ~RandomNum(10,6)~ THEN
        DO
            ~GiveItemCreate("rqpotn6",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
    IF ~RandomNum(10,7)~ THEN
        DO
            ~GiveItemCreate("rqpotn7",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
    IF ~RandomNum(10,8)~ THEN
        DO
            ~GiveItemCreate("rqpotn8",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
// extra
    IF ~RandomNum(10,9)~ THEN
        DO
            ~GiveItemCreate("rqpotn2",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
    IF ~RandomNum(10,10)~ THEN
        DO
            ~GiveItemCreate("rqpotn3",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc02")~
        EXIT
END
// 9 - 16
BEGIN ~rqpotc04~

IF ~True()~ THEN BEGIN rqPotionCase400
    SAY ~The box that was ripped from the potion case has the numeral IV on it. Apart from that, there are no other markings on the small crate. Surely there is something important inside. What will you do?~
        IF ~CheckStatGT(LastTalkedToBy,17,WIS) CheckStatGT(LastTalkedToBy,17,INT) Dead("chalrv01") AreaCheck("AR4500") InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~*Suddenly voice in your head says* Blood sacrifice is demanded!~ GOTO rqPotionSacrifice400
        IF ~!Dead("chalrv01")~ THEN REPLY ~You deftly put a knife between the top plank and the rest of the crate and pry the lid off.~ GOTO rqPotionCaseLimited400
        IF ~Dead("chalrv01")~ THEN REPLY ~You deftly put a knife between the top plank and the rest of the crate and pry the lid off.~ GOTO rqPotionCaseLimited400
        IF ~~ THEN REPLY ~Not yet, put away the crate.~
            EXIT
END

IF ~~ THEN BEGIN rqPotionCaseLimited400
    SAY ~You unwrap cloth and put the potion in your inventory.~
    IF ~RandomNum(4,1)~ THEN
        DO
            ~GiveItemCreate("rqpotn1",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
    IF ~RandomNum(4,2)~ THEN
        DO
            ~GiveItemCreate("rqpotn2",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
    IF ~RandomNum(4,3)~ THEN
        DO
            ~GiveItemCreate("rqpotn3",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
    IF ~RandomNum(4,4)~ THEN
        DO
            ~GiveItemCreate("rqpotn4",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
END

IF ~~ THEN BEGIN rqPotionSacrifice400
    SAY ~The crate briefly glows and you are certain that you have done something right.~
    IF ~~ THEN REPLY ~Your eyes suddenly focus on a small needle you swear you've never seen before. Intuitively, you pierce your finger, letting a few drops of blood onto the crate.~ DO ~ApplyDamage(LastTalkedToBy,1,PIERCING)~ GOTO rqPotionCase401
    IF ~~ THEN REPLY ~Leave the crate be.~ EXIT
END

// 9 - 16
IF ~~ THEN BEGIN rqPotionCase401
    SAY ~You unwrap cloth and put the potion in your inventory.~
    IF ~RandomNum(10,1)~ THEN
        DO
            ~GiveItemCreate("rqpotn2",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
    IF ~RandomNum(10,2)~ THEN
        DO
            ~GiveItemCreate("rqpotn3",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
// 9 - 16
    IF ~RandomNum(10,3)~ THEN
        DO
            ~GiveItemCreate("rqpotn9",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
    IF ~RandomNum(10,4)~ THEN
        DO
            ~GiveItemCreate("rqpotn10",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
    IF ~RandomNum(10,5)~ THEN
        DO
            ~GiveItemCreate("rqpotn11",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
    IF ~RandomNum(10,6)~ THEN
        DO
            ~GiveItemCreate("rqpotn12",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
    IF ~RandomNum(10,7)~ THEN
        DO
            ~GiveItemCreate("rqpotn13",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
    IF ~RandomNum(10,8)~ THEN
        DO
            ~GiveItemCreate("rqpotn14",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
    IF ~RandomNum(10,9)~ THEN
        DO
            ~GiveItemCreate("rqpotn15",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
    IF ~RandomNum(10,10)~ THEN
        DO
            ~GiveItemCreate("rqpotn16",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc04")~
        EXIT
END
// 17 - 24
BEGIN ~rqpotc05~

IF ~True()~ THEN BEGIN rqPotionCase500
    SAY ~The box that was ripped from the potion case has the numeral V on it. Apart from that, there are no other markings on the small crate. Surely there is something important inside. What will you do?~
        IF ~CheckStatGT(LastTalkedToBy,17,WIS) CheckStatGT(LastTalkedToBy,17,INT) Dead("chalrv01") AreaCheck("AR4500") InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~*Suddenly voice in your head says* Blood sacrifice is demanded!~ GOTO rqPotionSacrifice500
        IF ~!Dead("chalrv01")~ THEN REPLY ~You deftly put a knife between the top plank and the rest of the crate and pry the lid off.~ GOTO rqPotionCaseLimited500
        IF ~Dead("chalrv01")~ THEN REPLY ~You deftly put a knife between the top plank and the rest of the crate and pry the lid off.~ GOTO rqPotionCaseLimited500
        IF ~~ THEN REPLY ~Not yet, put away the crate.~
            EXIT
END

IF ~~ THEN BEGIN rqPotionCaseLimited500
    SAY ~You unwrap cloth and put the potion in your inventory.~
    IF ~RandomNum(4,1)~ THEN
        DO
            ~GiveItemCreate("rqpotn1",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
    IF ~RandomNum(4,2)~ THEN
        DO
            ~GiveItemCreate("rqpotn2",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
    IF ~RandomNum(4,3)~ THEN
        DO
            ~GiveItemCreate("rqpotn3",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
    IF ~RandomNum(4,4)~ THEN
        DO
            ~GiveItemCreate("rqpotn4",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
END

IF ~~ THEN BEGIN rqPotionSacrifice500
    SAY ~The crate briefly glows and you are certain that you have done something right.~
    IF ~~ THEN REPLY ~Your eyes suddenly focus on a small needle you swear you've never seen before. Intuitively, you pierce your finger, letting a few drops of blood onto the crate.~ DO ~ApplyDamage(LastTalkedToBy,1,PIERCING)~ GOTO rqPotionCase501
    IF ~~ THEN REPLY ~Leave the crate be.~ EXIT
END


// 17 - 24
IF ~~ THEN BEGIN rqPotionCase501
    SAY ~You unwrap cloth and put the potion in your inventory.~
    IF ~RandomNum(10,1)~ THEN
        DO
            ~GiveItemCreate("rqpotn17",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
    IF ~RandomNum(10,2)~ THEN
        DO
            ~GiveItemCreate("rqpotn18",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
    IF ~RandomNum(10,3)~ THEN
        DO
            ~GiveItemCreate("rqpotn19",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
    IF ~RandomNum(10,4)~ THEN
        DO
            ~GiveItemCreate("rqpotn20",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
    IF ~RandomNum(10,5)~ THEN
        DO
            ~GiveItemCreate("rqpotn21",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
    IF ~RandomNum(10,6)~ THEN
        DO
            ~GiveItemCreate("rqpotn22",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
    IF ~RandomNum(10,7)~ THEN
        DO
            ~GiveItemCreate("rqpotn23",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
    IF ~RandomNum(10,8)~ THEN
        DO
            ~GiveItemCreate("rqpotn24",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
// extra
    IF ~RandomNum(10,9)~ THEN
        DO
            ~GiveItemCreate("rqpotn2",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
    IF ~RandomNum(10,10)~ THEN
        DO
            ~GiveItemCreate("rqpotn3",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc05")~
        EXIT
END
// 25 - 32
BEGIN ~rqpotc06~

IF ~True()~ THEN BEGIN rqPotionCase600
    SAY ~The box that was ripped from the potion case has the numeral VI on it. Apart from that, there are no other markings on the small crate. Surely there is something important inside. What will you do?~
        IF ~CheckStatGT(LastTalkedToBy,17,WIS) CheckStatGT(LastTalkedToBy,17,INT) Dead("chalrv01") AreaCheck("AR4500") InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~*Suddenly voice in your head says* Blood sacrifice is demanded!~ GOTO rqPotionSacrifice600
        IF ~!Dead("chalrv01")~ THEN REPLY ~You deftly put a knife between the top plank and the rest of the crate and pry the lid off.~ GOTO rqPotionCaseLimited600
        IF ~Dead("chalrv01")~ THEN REPLY ~You deftly put a knife between the top plank and the rest of the crate and pry the lid off.~ GOTO rqPotionCaseLimited600
        IF ~~ THEN REPLY ~Not yet, put away the crate.~
            EXIT
END

IF ~~ THEN BEGIN rqPotionCaseLimited600
    SAY ~You unwrap cloth and put the potion in your inventory.~
    IF ~RandomNum(4,1)~ THEN
        DO
            ~GiveItemCreate("rqpotn1",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
    IF ~RandomNum(4,2)~ THEN
        DO
            ~GiveItemCreate("rqpotn2",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
    IF ~RandomNum(4,3)~ THEN
        DO
            ~GiveItemCreate("rqpotn3",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
    IF ~RandomNum(4,4)~ THEN
        DO
            ~GiveItemCreate("rqpotn4",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
END

IF ~~ THEN BEGIN rqPotionSacrifice600
    SAY ~The crate briefly glows and you are certain that you have done something right.~
    IF ~~ THEN REPLY ~Your eyes suddenly focus on a small needle you swear you've never seen before. Intuitively, you pierce your finger, letting a few drops of blood onto the crate.~ DO ~ApplyDamage(LastTalkedToBy,1,PIERCING)~ GOTO rqPotionCase601
    IF ~~ THEN REPLY ~Leave the crate be.~ EXIT
END
// 25 - 32
IF ~~ THEN BEGIN rqPotionCase601
    SAY ~You unwrap cloth and put the potion in your inventory.~
    IF ~RandomNum(10,1)~ THEN
        DO
            ~GiveItemCreate("rqpotn25",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
    IF ~RandomNum(10,2)~ THEN
        DO
            ~GiveItemCreate("rqpotn26",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
    IF ~RandomNum(10,3)~ THEN
        DO
            ~GiveItemCreate("rqpotn27",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
    IF ~RandomNum(10,4)~ THEN
        DO
            ~GiveItemCreate("rqpotn28",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
    IF ~RandomNum(10,5)~ THEN
        DO
            ~GiveItemCreate("rqpotn29",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
    IF ~RandomNum(10,6)~ THEN
        DO
            ~GiveItemCreate("rqpotn30",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
    IF ~RandomNum(10,7)~ THEN
        DO
            ~GiveItemCreate("rqpotn31",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
    IF ~RandomNum(10,8)~ THEN
        DO
            ~GiveItemCreate("rqpotn32",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
// extra
    IF ~RandomNum(10,9)~ THEN
        DO
            ~GiveItemCreate("rqpotn2",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
    IF ~RandomNum(10,10)~ THEN
        DO
            ~GiveItemCreate("rqpotn3",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc06")~
        EXIT
END
// 33 - 38
BEGIN ~rqpotc07~

IF ~True()~ THEN BEGIN rqPotionCase700
    SAY ~The box that was ripped from the potion case has the numeral VII on it. Apart from that, there are no other markings on the small crate. Surely there is something important inside. What will you do?~
        IF ~CheckStatGT(LastTalkedToBy,17,WIS) CheckStatGT(LastTalkedToBy,17,INT) Dead("chalrv01") AreaCheck("AR4500") InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~*Suddenly voice in your head says* Blood sacrifice is demanded!~ GOTO rqPotionSacrifice700
        IF ~!Dead("chalrv01")~ THEN REPLY ~You deftly put a knife between the top plank and the rest of the crate and pry the lid off.~ GOTO rqPotionCaseLimited700
        IF ~Dead("chalrv01")~ THEN REPLY ~You deftly put a knife between the top plank and the rest of the crate and pry the lid off.~ GOTO rqPotionCaseLimited700
        IF ~~ THEN REPLY ~Not yet, put away the crate.~
            EXIT
END

IF ~~ THEN BEGIN rqPotionCaseLimited700
    SAY ~You unwrap cloth and put the potion in your inventory.~
    IF ~RandomNum(4,1)~ THEN
        DO
            ~GiveItemCreate("rqpotn1",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
    IF ~RandomNum(4,2)~ THEN
        DO
            ~GiveItemCreate("rqpotn2",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
    IF ~RandomNum(4,3)~ THEN
        DO
            ~GiveItemCreate("rqpotn3",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
    IF ~RandomNum(4,4)~ THEN
        DO
            ~GiveItemCreate("rqpotn4",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
END

IF ~~ THEN BEGIN rqPotionSacrifice700
    SAY ~The crate briefly glows and you are certain that you have done something right.~
    IF ~~ THEN REPLY ~Your eyes suddenly focus on a small needle you swear you've never seen before. Intuitively, you pierce your finger, letting a few drops of blood onto the crate.~ DO ~ApplyDamage(LastTalkedToBy,1,PIERCING)~ GOTO rqPotionCase701
    IF ~~ THEN REPLY ~Leave the crate be.~ EXIT
END

// 33 - 39
IF ~~ THEN BEGIN rqPotionCase701
    SAY ~You unwrap cloth and put the potion in your inventory.~
    IF ~RandomNum(8,1)~ THEN
        DO
            ~GiveItemCreate("rqpotn33",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
    IF ~RandomNum(8,2)~ THEN
        DO
            ~GiveItemCreate("rqpotn34",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
    IF ~RandomNum(8,3)~ THEN
        DO
            ~GiveItemCreate("rqpotn35",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
    IF ~RandomNum(8,4)~ THEN
        DO
            ~GiveItemCreate("rqpotn36",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
    IF ~RandomNum(8,5)~ THEN
        DO
            ~GiveItemCreate("rqpotn37",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
    IF ~RandomNum(8,6)~ THEN
        DO
            ~GiveItemCreate("rqpotn38",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
    IF ~RandomNum(8,7)~ THEN
        DO
            ~GiveItemCreate("rqpotn39",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
    IF ~RandomNum(8,8)~ THEN
        DO
            ~GiveItemCreate("rqpotn40",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc07")~
        EXIT
END

BEGIN ~rqpotc03~

IF ~True()~ THEN BEGIN rqPotionCase300
    SAY ~You found this on the corpse of a Harper. Surely there is something important inside. What will you do?~
        IF ~~ THEN REPLY ~You deftly put a knife between the top plank and the rest of the crate and pry the lid off.~ GOTO rqPotionCase301
        IF ~~ THEN REPLY ~Not yet, put away the crate.~
            EXIT
END

IF ~~ THEN BEGIN rqPotionCase301
    SAY ~You unwrap cloth and put the potion in your inventory.~
    IF ~~ THEN
        DO
            ~GiveItemCreate("rqpotn1",LastTalkedToBy,0,0,0)
            DestroyItem("rqpotc03")~
        EXIT
END

BEGIN ~rqpotn1~

IF ~True()~ THEN BEGIN rqPotion100
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Yhral - Anchoring and Unfailing Endurance of Mind"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion101
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion102
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion102
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion102
END

IF ~~ THEN BEGIN rqPotion101
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn1")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion102
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn1",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn1")~
        EXIT
END

BEGIN ~rqpotn4~

IF ~True()~ THEN BEGIN rqPotion400
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Mosgoroth - Weave Stability"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion401
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion402
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion402
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion402
END

IF ~~ THEN BEGIN rqPotion401
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb4",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn4")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion402
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn4",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn4")~
        EXIT
END

BEGIN ~rqpotn5~

IF ~True()~ THEN BEGIN rqPotion500
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Ostgund - Magical Sight"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion501
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion502
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion502
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion502
END

IF ~~ THEN BEGIN rqPotion501
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn5")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion502
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn5",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn5")~
        EXIT
END

BEGIN ~rqpotn6~

IF ~True()~ THEN BEGIN rqPotion600
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Kergulor - Resistance Stability, both Negative and Positive!"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion601
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion602
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion602
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion602
END

IF ~~ THEN BEGIN rqPotion601
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn6")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion602
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn6",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn6")~
        EXIT
END

BEGIN ~rqpotn7~

IF ~True()~ THEN BEGIN rqPotion700
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Julmen - Immunity to clerical Negative Chant and Bad Luck (flawed!)"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion701
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion702
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion702
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion702
END

IF ~~ THEN BEGIN rqPotion701
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn7")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion702
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn7",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn7")~
        EXIT
END

BEGIN ~rqpotn8~

IF ~True()~ THEN BEGIN rqPotion800
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Uvgaryl - Resistance to Poison, Disease, Acid, and Magic Damage"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion801
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion802
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion802
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion802
END

IF ~~ THEN BEGIN rqPotion801
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn8")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion802
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn8",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn8")~
        EXIT
END

BEGIN ~rqpotn9~

IF ~True()~ THEN BEGIN rqPotion900
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads:"Uvgaryl - Resistance to Poison, Disease, Acid, Magic damage"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion901
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion902
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion902
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion902
END

IF ~~ THEN BEGIN rqPotion901
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn9")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion902
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn9",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn9")~
        EXIT
END

BEGIN ~rqpotn10~

IF ~True()~ THEN BEGIN rqPotion1000
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Esmrilil Avegiel - Immunity to Berserking and Confusion"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion1001
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion1002
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion1002
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion1002
END

IF ~~ THEN BEGIN rqPotion1001
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn10")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion1002
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn10",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn10")~
        EXIT
END

BEGIN ~rqpotn11~

IF ~True()~ THEN BEGIN rqPotion1100
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Ilsinen - Immunity to Timestop, Level Drain, and Backstab"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion1101
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion1102
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion1102
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion1102
END

IF ~~ THEN BEGIN rqPotion1101
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn11")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion1102
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn11",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn11")~
        EXIT
END

BEGIN ~rqpotn12~

IF ~True()~ THEN BEGIN rqPotion1200
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Feyviryl - True Seeing"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion1201
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion1202
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion1202
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion1202
END

IF ~~ THEN BEGIN rqPotion1201
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn12")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion1202
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn12",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn12")~
        EXIT
END

BEGIN ~rqpotn13~

IF ~True()~ THEN BEGIN rqPotion1300
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Wevugarth - Instant Death, Petrification, Disintegrate, and Imprisonment"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion1301
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion1302
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion1302
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion1302
END

IF ~~ THEN BEGIN rqPotion1301
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn13")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion1302
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn13",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn13")~
        EXIT
END


BEGIN ~rqpotn14~

IF ~True()~ THEN BEGIN rqPotion1300
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Kysloth - Immunity to Spell School: Conjuration"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion1401
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion1402
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion1402
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion1402
END

IF ~~ THEN BEGIN rqPotion1401
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn14")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion1402
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn14",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn14")~
        EXIT
END

BEGIN ~rqpotn15~

IF ~True()~ THEN BEGIN rqPotion1500
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Gruske - Immunity to Spell School: Necromancy"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion1501
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion1502
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion1502
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion1502
END

IF ~~ THEN BEGIN rqPotion1501
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn15")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion1502
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn15",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn15")~
        EXIT
END

BEGIN ~rqpotn16~

IF ~True()~ THEN BEGIN rqPotion1600
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Bewick - Immunity to Spell School: Illusion"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion1601
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion1602
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion1602
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion1602
END

IF ~~ THEN BEGIN rqPotion1601
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn16")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion1602
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn16",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn16")~
        EXIT
END

BEGIN ~rqpotn17~

IF ~True()~ THEN BEGIN rqPotion1700
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Atword - Immunity to Spell School: Evocation"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion1701
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion1702
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion1702
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion1702
END

IF ~~ THEN BEGIN rqPotion1701
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn17")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion1702
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn17",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn17")~
        EXIT
END

BEGIN ~rqpotn18~

IF ~True()~ THEN BEGIN rqPotion1800
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Logrian - Immunity to Spell School: Enchantment"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion1801
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion1802
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion1802
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion1802
END

IF ~~ THEN BEGIN rqPotion1801
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn18")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion1802
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn18",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn18")~
        EXIT
END

BEGIN ~rqpotn19~

IF ~True()~ THEN BEGIN rqPotion1900
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Rognvald - Immunity to Level Two Spells and Below"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion1901
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion1902
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion1902
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion1902
END

IF ~~ THEN BEGIN rqPotion1901
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn19")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion1902
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn19",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn19")~
        EXIT
END

BEGIN ~rqpotn20~

IF ~True()~ THEN BEGIN rqPotion2000
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Bjorn - Double Duration Spells"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion2001
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion2002
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion2002
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion2002
END

IF ~~ THEN BEGIN rqPotion2001
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn20")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion2002
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn20",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn20")~
        EXIT
END

BEGIN ~rqpotn21~

IF ~True()~ THEN BEGIN rqPotion2100
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Sir Woodworth - Critical Hit Improvement"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion2101
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion2102
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion2102
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion2102
END

IF ~~ THEN BEGIN rqPotion2101
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn21")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion2102
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn21",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn21")~
        EXIT
END

BEGIN ~rqpotn22~

IF ~True()~ THEN BEGIN rqPotion2200
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Khelben - Aura Cleansing"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion2201
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion2202
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion2202
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion2202
END

IF ~~ THEN BEGIN rqPotion2201
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn22")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion2202
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn22",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn22")~
        EXIT
END

BEGIN ~rqpotn23~

IF ~True()~ THEN BEGIN rqPotion2300
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Helwyg - Casting Time Improvement"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion2301
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion2302
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion2302
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion2302
END

IF ~~ THEN BEGIN rqPotion2301
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn23")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion2302
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn23",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn23")~
        EXIT
END

BEGIN ~rqpotn24~

IF ~True()~ THEN BEGIN rqPotion2400
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Lugreim - Immunity to Charm"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion2401
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion2402
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion2402
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion2402
END

IF ~~ THEN BEGIN rqPotion2401
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn24")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion2402
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn24",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn24")~
        EXIT
END

BEGIN ~rqpotn25~

IF ~True()~ THEN BEGIN rqPotion2500
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Kress - Immunity to Draining of Mage Spells"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion2501
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion2502
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion2502
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion2502
END

IF ~~ THEN BEGIN rqPotion2501
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn25")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion2502
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn25",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn25")~
        EXIT
END

BEGIN ~rqpotn26~

IF ~True()~ THEN BEGIN rqPotion2600
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Atler - More Physical Attacks"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion2601
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion2602
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion2602
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion2602
END

IF ~~ THEN BEGIN rqPotion2601
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn26")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion2602
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn26",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn26")~
        EXIT
END

BEGIN ~rqpotn27~

IF ~True()~ THEN BEGIN rqPotion2700
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Jhorguth - Extra Melee Power, Speed, and Accuracy"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion2701
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion2702
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion2702
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion2702
END

IF ~~ THEN BEGIN rqPotion2701
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn27")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion2702
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn27",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn27")~
        EXIT
END

BEGIN ~rqpotn28~

IF ~True()~ THEN BEGIN rqPotion2800
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Pelguniir - Mage Spell Memorizationization Bonus"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion2801
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion2802
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion2802
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion2802
END

IF ~~ THEN BEGIN rqPotion2801
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn28")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion2802
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn28",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn28")~
        EXIT
END

BEGIN ~rqpotn29~

IF ~True()~ THEN BEGIN rqPotion2900
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Hoflug - Priest Spell Memorization Bonus"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion2901
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion2902
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion2902
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion2902
END

IF ~~ THEN BEGIN rqPotion2901
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn29")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion2902
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn29",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn29")~
        EXIT
END

BEGIN ~rqpotn30~

IF ~True()~ THEN BEGIN rqPotion3000
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Torstein - Saving Throw Increase"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion3001
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion3002
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion3002
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion3002
END

IF ~~ THEN BEGIN rqPotion3001
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn30")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion3002
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn30",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn30")~
        EXIT
END

BEGIN ~rqpotn31~

IF ~True()~ THEN BEGIN rqPotion3100
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads:"Geier - Flawed polymorph protection could not make it work so I sent you what I have."~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion3101
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion3102
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion3102
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion3102
END

IF ~~ THEN BEGIN rqPotion3101
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn31")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion3102
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn31",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn31")~
        EXIT
END

BEGIN ~rqpotn32~

IF ~True()~ THEN BEGIN rqPotion3200
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads:"Torstein - Saving throw increase"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion3201
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion3202
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion3202
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion3202
END

IF ~~ THEN BEGIN rqPotion3201
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn32")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion3202
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn32",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn32")~
        EXIT
END

BEGIN ~rqpotn33~

IF ~True()~ THEN BEGIN rqPotion3300
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Huon - Immunity to Saving Throw Manipulation, both Negative and Positive!"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion3301
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion3302
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion3302
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion3302
END

IF ~~ THEN BEGIN rqPotion3301
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn33")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion3302
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn33",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn33")~
        EXIT
END

BEGIN ~rqpotn34~

IF ~True()~ THEN BEGIN rqPotion3400
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Forberg - Immunity to Armor Protection Manipulation, both Negative and Positive!"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion3401
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion3402
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion3402
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion3402
END

IF ~~ THEN BEGIN rqPotion3401
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn34")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion3402
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn34",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn34")~
        EXIT
END

BEGIN ~rqpotn35~

IF ~True()~ THEN BEGIN rqPotion3500
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads:"Parcival - Magical resistance addition"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion3501
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion3502
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion3502
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion3502
END

IF ~~ THEN BEGIN rqPotion3501
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn35")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion3502
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn35",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn35")~
        EXIT
END

BEGIN ~rqpotn36~

IF ~True()~ THEN BEGIN rqPotion3600
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Amerghiis - Life Essence"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion3601
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion3602
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion3602
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion3602
END

IF ~~ THEN BEGIN rqPotion3601
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn36")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion3602
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn36",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn36")~
        EXIT
END

BEGIN ~rqpotn37~

IF ~True()~ THEN BEGIN rqPotion3700
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Mogor-Nagal - Wild Magic Stabilization"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion3701
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion3702
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion3702
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion3702
END

IF ~~ THEN BEGIN rqPotion3701
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn37")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion3702
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn37",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn37")~
        EXIT
END

BEGIN ~rqpotn38~

IF ~True()~ THEN BEGIN rqPotion3800
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Lucky Merlidien - Luck Increase"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion3801
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion3802
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion3802
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion3802
END

IF ~~ THEN BEGIN rqPotion3801
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn38")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion3802
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn38",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn38")~
        EXIT
END

BEGIN ~rqpotn39~

IF ~True()~ THEN BEGIN rqPotion3900
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Lucky Merlidien - Luck Increase"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion3901
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion3902
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion3902
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion3902
END

IF ~~ THEN BEGIN rqPotion3901
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn39")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion3902
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn39",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn39")~
        EXIT
END

BEGIN ~rqpotn40~

IF ~True()~ THEN BEGIN rqPotion4000
    SAY ~Unwrapping it from rags, you pull out a potion with a parchment that reads: "Lucky Merlidien - Luck Increase"~
    IF ~!InPartySlot(LastTalkedToBy,0)~ THEN REPLY ~I am not sure if I should quaff this potion.~ GOTO rqPotion4001
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What being could have a more powerful soul than my divine-infused soul?~ GOTO rqPotion4002
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GENEUTRAL)~ THEN REPLY ~Weaker souls... I might have such a soul to resist adverse effects.~ GOTO rqPotion4002
    IF ~InPartySlot(LastTalkedToBy,0) Alignment(Player1,MASK_GOOD)~ THEN REPLY ~The potion promises power, which almost always comes at a price.~ GOTO rqPotion4002
END

IF ~~ THEN BEGIN rqPotion4001
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotnb",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn40")~
        EXIT
END

IF ~~ THEN BEGIN rqPotion4002
    SAY ~Do I risk and drink from this potion or...~
    IF ~~ THEN REPLY ~You decide that whatever effects this potion has are not worth the risk. You put the potion back in your inventory.~
        EXIT
    IF ~~ THEN REPLY ~Despite the risk, you decide to drink it.~
        DO
            ~ApplySpellRES("rqpotn40",Myself)
            ApplySpellRES("rqpotncu",Myself)
            DestroyItem("rqpotn40")~
        EXIT
END
