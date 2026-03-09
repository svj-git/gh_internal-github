// Amelissan Bragging
EXTEND_BOTTOM MELISS01 8
    IF ~Dead("rqessl")~ THEN GOTO AmelissanBragging
    IF ~Dead("rqessl")
        OR(2)
            Global("rqTobAssaultTemple","GLOBAL",1)
            Global("rqTobItwantosPrimaryAlly","GLOBAL",1)~ THEN GOTO AmelissanBragging2
    IF ~!Dead("rqessl")
        Global("rqT6DeathStalkerSendai","GLOBAL",1)
        Global("rqT7DeathStalkerAbazigal","GLOBAL",1)~ THEN GOTO AmelissanBragging3
END

APPEND MELISS01
    IF ~~ THEN BEGIN AmelissanBragging
        SAY ~It was *I* who manipulated Harpers into attacking you!~
        IF ~~ THEN GOTO 9
    END

    IF ~~ THEN BEGIN AmelissanBragging2
        SAY ~It was *I* who manipulated Harpers into attacking you! It was *I* who sent that overly loyal simpleton Setherus against you!~
        IF ~~ THEN GOTO 9
    END

    IF ~~ THEN BEGIN AmelissanBragging3 // ToB only game bragging
        SAY ~It was *I* who set up the remaining loyalists, who could interfere with my plan, into attacking you!~
        IF ~~ THEN GOTO 9
    END
END
