BEGIN ~rqtest~

IF ~True()~ THEN BEGIN PotionTestinConstruct
    SAY ~Potion testing construct.~
    IF ~~ THEN REPLY ~1 number potion rqpotn1~ GOTO Potion1
    IF ~~ THEN REPLY ~2 number potion rqpotn2~ GOTO Potion2
    IF ~~ THEN REPLY ~3 number potion rqpotn3~ GOTO Potion3
    IF ~~ THEN REPLY ~4 number potion rqpotn4~ GOTO Potion4
    IF ~~ THEN REPLY ~5 number potion rqpotn5~ GOTO Potion5
    IF ~~ THEN REPLY ~6 number potion rqpotn6~ GOTO Potion6
    IF ~~ THEN REPLY ~7 number potion rqpotn7~ GOTO Potion7
    IF ~~ THEN REPLY ~8 number potion rqpotn8~ GOTO Potion8
    IF ~~ THEN REPLY ~9 number potion rqpotn9~ GOTO Potion9
    IF ~~ THEN REPLY ~10 number potion rqpotn10~ GOTO Potion10
    IF ~~ THEN REPLY ~11 number potion rqpotn11~ GOTO Potion11
    IF ~~ THEN REPLY ~12 number potion rqpotn12~ GOTO Potion12
    IF ~~ THEN REPLY ~13 number potion rqpotn13~ GOTO Potion13
    IF ~~ THEN REPLY ~14 number potion rqpotn14~ GOTO Potion14
    IF ~~ THEN REPLY ~15 number potion rqpotn15~ GOTO Potion15
    IF ~~ THEN REPLY ~16 number potion rqpotn16~ GOTO Potion16
    IF ~~ THEN REPLY ~17 number potion rqpotn17~ GOTO Potion17
    IF ~~ THEN REPLY ~18 number potion rqpotn18~ GOTO Potion18
    IF ~~ THEN REPLY ~19 number potion rqpotn19~ GOTO Potion19
    IF ~~ THEN REPLY ~20 number potion rqpotn20~ GOTO Potion20
    IF ~~ THEN REPLY ~21 number potion rqpotn21~ GOTO Potion21
    IF ~~ THEN REPLY ~22 number potion rqpotn22~ GOTO Potion22
    IF ~~ THEN REPLY ~23 number potion rqpotn23~ GOTO Potion23
    IF ~~ THEN REPLY ~24 number potion rqpotn24~ GOTO Potion24
    IF ~~ THEN REPLY ~25 number potion rqpotn25~ GOTO Potion25
    IF ~~ THEN REPLY ~26 number potion rqpotn26~ GOTO Potion26
    IF ~~ THEN REPLY ~27 number potion rqpotn27~ GOTO Potion27
    IF ~~ THEN REPLY ~28 number potion rqpotn28~ GOTO Potion28
    IF ~~ THEN REPLY ~29 number potion rqpotn29~ GOTO Potion29
    IF ~~ THEN REPLY ~30 number potion rqpotn30~ GOTO Potion30
    IF ~~ THEN REPLY ~31 number potion rqpotn31~ GOTO Potion31
    IF ~~ THEN REPLY ~32 number potion rqpotn32~ GOTO Potion32
    IF ~~ THEN REPLY ~33 number potion rqpotn33~ GOTO Potion33
    IF ~~ THEN REPLY ~34 number potion rqpotn34~ GOTO Potion34
    IF ~~ THEN REPLY ~Immunities testing potions.~ GOTO GivePotionsFortesting
    IF ~~ THEN REPLY ~Immutability potions.~ GOTO GivePotionsForImmubatleTesting
    IF ~~ THEN REPLY ~Bonuses potions.~ GOTO GivePotionsBonusTesting
    IF ~~ THEN REPLY ~Extra Potions 36,37~ GOTO GiveExtraPotionsForTesting
    IF ~~ THEN REPLY ~No i do not wish anything right now.~ GOTO NoNothing
END

IF ~~ THEN BEGIN Potion1
    SAY ~Testing potion no.1~
    IF ~~ THEN REPLY ~Fear/horror/panic test.~ //#24
        DO
            ~ApplySpellRES("SPIN536",Player1)
            ApplySpellRES("SPIN882",Player1)
            ApplySpellRES("SPIN890",Player1)
            ApplySpellRES("SPIN895",Player1)
            ApplySpellRES("SPIN981",Player1)
            ApplySpellRES("SPPR706",Player1)
            ApplySpellRES("SPWI956",Player1)
            //GiveItemCreate("RODMACE","rqtest",1,0,0)
            ~
        EXIT
    IF ~~ THEN REPLY ~Unconsciousness test~ //#39
        DO
            ~ApplySpellRES("BALTH01",Player1)
            //GiveItemCreate("SPER12","rqtest",1,0,0)
            //GiveItemCreate("AX1H16","rqtest",1,0,0)
            ApplySpellRES("SPWISH27",Player1)
            ApplySpellRES("SPPR720",Player1)
            ApplySpellRES("SPYANC01",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Stun test~ //#45
        DO
            ~ApplySpellRES("SAREVEFF",Player1)
            ApplySpellRES("SPCL123",Player1)
            ApplySpellRES("SPDR101",Player1)
            ApplySpellRES("SPIN543",Player1)
            ApplySpellRES("SPIN727",Player1)
            ApplySpellRES("SPIN832",Player1)
            ApplySpellRES("SPIN834",Player1)
            ApplySpellRES("SPIN927",Player1)
            ApplySpellRES("SPIN934",Player1)
            ApplySpellRES("SPIN927",Player1)
            ApplySpellRES("SPIN926",Player1)

            ApplySpellRES("SPWI898",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Feeblemindedness test~ //#76
        DO
            ~//ApplySpellRES("INSANITY",Player1)
            ApplySpellRES("SPWI509",Player1)
            ApplySpellRES("SPWI509",Player1)
            ApplySpellRES("SPWI509",Player1)
            ApplySpellRES("SPWI509",Player1)
            ApplySpellRES("SPWI509",Player1)
            ApplySpellRES("SPWI509",Player1)
            //GiveItemCreate("POTN23",Player1,1,1,0)
            //GiveItemCreate("SCRL18",Player1,1,1,0)
            //GiveItemCreate("SIRINE","rqtest",1,0,0)
            ~
        EXIT
    IF ~~ THEN REPLY ~Fatigue test~ //#93
        DO
            ~ApplySpellRES("SPIN718",Player1)
            ActionOverride(Player1,ReallyForceSpellRES("SPPR417",Player1))
            ActionOverride(Player1,ReallyForceSpellRES("SPPR713",Player1))
            ActionOverride(Player1,ReallyForceSpellRES("SPPR713",Player1))
            ActionOverride(Player1,ReallyForceSpellRES("SPWISH07",Player1))
            ActionOverride(Player1,ReallyForceSpellRES("SPWISH46",Player1))
            ActionOverride(Player1,ReallyForceSpellRES("SPWISH46",Player1))~
        EXIT
    IF ~~ THEN REPLY ~Drunkenness test~ //#94
        DO
            ~ApplySpellRES("SPWISH33",Player1)
            ApplySpellRES("SPWISH33",Player1)
            ApplySpellRES("SPWISH33",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Morale Break test~ //#106
        DO
            ~GiveItemCreate("MISC98","rqtest",1,0,0)
            ApplySpellRES("SPIN680",Player1)
            ApplySpellRES("SPIN675",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Drop weapons in panic test~ //#264
        DO
            ~ApplySpellRES("SPIN203",Player1)
            ApplySpellRES("SPIN675",Player1)
            ApplySpellRES("SPIN848",Player1)
            ApplySpellRES("SPPR416",Player1)
            GiveItemCreate("MISTHO","rqtest",1,0,0)~
        EXIT

END

IF ~~ THEN BEGIN Potion2
    SAY ~Testing potion no.2~
    IF ~~ THEN REPLY ~Maze test.~ //#213
        DO
            ~ApplySpellRES("SPIN774",Player1)
            ApplySpellRES("rqmaze",Player1)
            ApplySpellRES("SPWI813",Player1)~
        EXIT
END

IF ~~ THEN BEGIN Potion3
    SAY ~Testing potion no.3~
    IF ~~ THEN REPLY ~Charisma test~ //#6
        DO
            ~ApplySpellRES("SPIN808",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Consitution test~ //#10
        DO
            ~ApplySpellRES("SPIN808",Player1)
            ApplySpellRES("SPWI928",Player1)
            ApplySpellRES("SPWISH04",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Dexterity test~ //#15
        DO
            ~ApplySpellRES("SPIN808",Player1)
            ApplySpellRES("SPWI928",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Intelligence test~ //#19
        DO
            ~ApplySpellRES("SPIN808",Player1)
            ApplySpellRES("SPIN919",Player1)
            ApplySpellRES("SPIN858",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Strength test~ //#44
        DO
            ~ApplySpellRES("SPIN808",Player1)
            ApplySpellRES("SPWISH41",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Wisdom test~ //#49
        DO
            ~ApplySpellRES("SPIN808",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Familiar Drain test~ //#195
        DO
            ~ActionOverride(Player1,ReallyForceSpellRES("SPWI123",Player1))~
        EXIT
END

IF ~~ THEN BEGIN Potion4
    SAY ~Testing potion no.4~
    IF ~~ THEN REPLY ~Silence test~ //#38
        DO
            ~ApplySpellRES("SPIN692.SPL",Player1)
            ApplySpellRES("SPIN998.SPL",Player1)
            ApplySpellRES("SPPR211.SPL",Player1)
            ApplySpellRES("SPPR988.SPL",Player1)
            ApplySpellRES("SPWI612.SPL",Player1)
            ApplySpellRES("SPWISH35.SPL",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Miscast Magic test~ //#60
        DO
            ~ApplySpellRES("SPWISH30",Player1)
            ApplySpellRES("SPPR986",Player1)
            ApplySpellRES("SPPR717",Player1)
            ApplySpellRES("SPPR517",Player1)
            ApplySpellRES("SPPR319",Player1)
            ApplySpellRES("SPPR310",Player1)
            ApplySpellRES("SPIN992",Player1)
            ApplySpellRES("SPPR310",Player1)
            ApplySpellRES("SPIN992",Player1)
            ApplySpellRES("SPIN779",Player1)
            ApplySpellRES("SPIN731",Player1)
            ApplySpellRES("SPIN712",Player1)
            ApplySpellRES("SPIN689",Player1)
            ApplySpellRES("SPIN646",Player1)
            ApplySpellRES("SPIN550",Player1)
            ApplySpellRES("SPIN531",Player1)
            ApplySpellRES("SPCL132",Player1)
            ApplySpellRES("RQCRDOOM",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Deafness test~ //#80
        DO
            ~ApplySpellRES("SPWI223.SPL",Player1)
            ApplySpellRES("SPWI223.SPL",Player1)
            ApplySpellRES("SPWI223.SPL",Player1)~
        EXIT
END

IF ~~ THEN BEGIN Potion5
    SAY ~Testing potion no.5~
    IF ~~ THEN REPLY ~Blindness test~ //#74
        DO
            ~ApplySpellRES("SPIN595",Player1)
            //ApplySpellRES("SPIN878",Player1)
            //ApplySpellRES("SPIN893",Player1)
            ApplySpellRES("SPIN929",Player1)
            ApplySpellRES("SPIN931",Player1)
            //ApplySpellRES("SPPR704",Player1)
            ActionOverride("rqpotnte",ReallyForceSpellRES("SPPR704","rqpotnte"))~
        EXIT
END

IF ~~ THEN BEGIN Potion6
    SAY ~Testing potion no.6~
    IF ~~ THEN REPLY ~Lower Electrical resistance test~ // #29
        DO
            ~ApplySpellRES("SPIN532",Player1)
            ApplySpellRES("SPIN604",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Lower Fire resistance test~ //#30 #84
        DO
            ~ApplySpellRES("SPIN682",Player1)
            ApplySpellRES("SPIN603",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Lower Cold resistance test~ //#28 #85
        DO
            ~ApplySpellRES("SPIN602",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Lower Acid resistance test~ // #27
        DO
            ~ApplySpellRES("SPIN605",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Lower Magic Fire resistance test~ // #30 #84
        DO
            ~ApplySpellRES("SPIN603",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Lower Magic Cold resistance test~ //#28 #85
        DO
            ~ApplySpellRES("SPIN602",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Lower Magic resitance resistance test~ //#28 #85
        DO
            ~//ApplySpellRES("BEGUILE",Player1)
            //ApplySpellRES("INSANITY",Player1)
            //ApplySpellRES("SPIN553",Player1)
            ApplySpellRES("SPWI514",Player1)
            ApplySpellRES("SPWI608",Player1)
            ApplySpellRES("SPWI805",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Lower Poison resistance test~ //#28 #85
        DO
            ~ApplySpellRES("SPIN530",Player1)~
        EXIT
END

IF ~~ THEN BEGIN Potion7
    SAY ~Testing potion no.7~
    IF ~~ THEN REPLY ~Slow resistance test~ // #40
        DO
            ~ApplySpellRES("BALTH07",Player1)
            ApplySpellRES("BHAAL2B",Player1)
            ApplySpellRES("CH3DRAIN",Player1)
            ApplySpellRES("CH3FLASH",Player1)
            ApplySpellRES("SPIN628",Player1)
            ApplySpellRES("SPIN575",Player1)
            ApplySpellRES("SPWM164",Player1)
            ApplySpellRES("SPIN818",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Paralyze resistance test~ // #109
        DO
            ~ApplySpellRES("SPDR201",Player1)
            ApplySpellRES("SPIN566",Player1)
            ApplySpellRES("SPIN683",Player1)
            ApplySpellRES("SPIN776",Player1)
            ApplySpellRES("SPIN863",Player1)
            ApplySpellRES("SPIN914",Player1)
            ApplySpellRES("SPIN960",Player1)
            ApplySpellRES("SPPR728",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Web Effect resistance test~ // #157
        DO
            ~ApplySpellRES("SPDR201",Player1)
            ApplySpellRES("SPIN566",Player1)
            ApplySpellRES("SPIN683",Player1)
            ApplySpellRES("SPWI215",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Hold 1 resistance test~ // #175
        DO
            ~ApplySpellRES("SPCL415",Player1)
            ApplySpellRES("SPIN648",Player1)
            ApplySpellRES("SPIN988",Player1)
            ApplySpellRES("SPIN990",Player1)
            ApplySpellRES("SPIN996",Player1)
            ApplySpellRES("SPIN999",Player1)
            ApplySpellRES("SPPR208",Player1)
            ApplySpellRES("SPWI507",Player1)
            ApplySpellRES("SPWI818",Player1)
            ApplySpellRES("SPWI918",Player1)
            ApplySpellRES("SPWM122",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Hold 2 resistance test~ // #29
        DO
            ~ApplySpellRES("SPCL415",Player1)
            ApplySpellRES("SPIN708",Player1)
            ApplySpellRES("SPIN769",Player1)
            ApplySpellRES("SPIN853",Player1)
            ApplySpellRES("SPWI413",Player1)
            ApplySpellRES("SPWI853",Player1)
            ApplySpellRES("SPWM114",Player1)
            ApplySpellRES("SPWI507",Player1)
            ApplySpellRES("SPWI818",Player1)
            ApplySpellRES("SPWI918",Player1)
            ApplySpellRES("SPWM122",Player1)~
        EXIT
END

IF ~~ THEN BEGIN Potion8
    SAY ~Testing potion no.8 these do not work in unmodded game.~
        IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN Potion9
    SAY ~Testing potion no.9~
    IF ~~ THEN REPLY ~Poison resistance test~ // #29
        DO
            ~ApplySpellRES("RQPOISO",Player1)
            ApplySpellRES("SPCL422",Player1)
            ApplySpellRES("SPIN583",Player1)
            ApplySpellRES("SPIN707",Player1)
            ApplySpellRES("SPIN733",Player1)
            ApplySpellRES("SPIN979",Player1)
            ApplySpellRES("SPPR610",Player1)
            ApplySpellRES("SPPR722",Player1)
            ApplySpellRES("SPWI008",Player1)~
        EXIT
    IF ~~ THEN REPLY ~Acid resistance test~ // #29
        DO
            ~ApplySpellRES("SPIN596",Player1)
            ApplySpellRES("SPIN913",Player1)
            ApplySpellRES("SPWI211",Player1)
            ~
        EXIT
    IF ~~ THEN REPLY ~Magic damage resistance test~ // #29
        DO
            ~ApplySpellRES("SPIN685",Player1)
            ApplySpellRES("SPIN962",Player1)
            ApplySpellRES("SPWI953",Player1)
            ApplySpellRES("SPWI950",Player1)
            ApplySpellRES("SPWI713",Player1)
            ApplySpellRES("SPWI314",Player1)
            ApplySpellRES("SPIN932",Player1)
            ApplySpellRES("SPIN912",Player1)
            ApplySpellRES("SPIN545",Player1)
            ~
        EXIT
    IF ~~ THEN REPLY ~Disease resistance test~ // #29
        DO
            ~ApplySpellRES("SPIN784",Player1)
            ApplySpellRES("SPWI409",Player1)
            ApplySpellRES("SPWI211",Player1)
            GiveItemCreate("DARTMEL","rqtest",1,0,0)
            //GiveItemCreate("DEMOGORG","rqtest",1,1,0)
            //GiveItemCreate("FINMEL01","rqtest",1,1,0)
            //GiveItemCreate("OTYUGH","rqtest",1,1,0)
            //GiveItemCreate("RAVAG03","rqtest",1,1,0)
            ~
        EXIT
END

IF ~~ THEN BEGIN Potion10
    SAY ~Testing potion no.10~
    IF ~~ THEN REPLY ~Berserking resistance test~ // #29
        DO
            ~ApplySpellRES("SPIN117",Player1)
            ApplySpellRES("SPCL321",Player1)
            ~
        EXIT
    IF ~~ THEN REPLY ~Confusion resistance test~ // #29
        DO
            ~ApplySpellRES("SPCL751A",Player1)
            ApplySpellRES("SPDR501",Player1)
            ApplySpellRES("SPIN582",Player1)
            ApplySpellRES("SPIN704",Player1)
            ~
        EXIT
END

IF ~~ THEN BEGIN Potion11
    SAY ~Testing potion no.11~
    IF ~~ THEN REPLY ~Level Drain resistance test~ // #29
        DO
            ~ApplySpellRES("SPIN571",Player1)
            ApplySpellRES("SPIN586",Player1)
            ApplySpellRES("SPIN587",Player1)
            ApplySpellRES("SPIN666",Player1)
            ApplySpellRES("SPIN878",Player1)
            ApplySpellRES("SPIN893",Player1)
            ApplySpellRES("SPWI914",Player1)
            ~
        EXIT
    IF ~~ THEN REPLY ~Backstab resistance test~ // #29
        DO
            ~CreateCreatureOffScreen("CHALCY02",14)
            CreateCreatureOffScreen("CHALCY02",14)
            CreateCreatureOffScreen("CHALCY02",14)
            CreateCreatureOffScreen("CHALCY02",14)
            CreateCreatureOffScreen("CHALCY02",14)
            CreateCreatureOffScreen("CHALCY02",14)
            ~
        EXIT
    IF ~~ THEN REPLY ~Timestop resitance test~ // #29
        DO
            ~CreateCreatureOffScreen("LICH01",14)
            CreateCreatureOffScreen("LICH01",14)
            ~
        EXIT
END

IF ~~ THEN BEGIN Potion12
    SAY ~Testing potion no.12~
    IF ~~ THEN REPLY ~Invisibility Detection by script test~ // #29
        DO
            ~CreateCreatureOffScreen("CHALCY02",14)~
        EXIT
END

IF ~~ THEN BEGIN Potion13
    SAY ~Testing potion no.13~
    IF ~~ THEN REPLY ~Death: Instant Death test~ // #13
        DO
            ~ApplySpellRES("JWDEATH",Player1)
            ApplySpellRES("SPCTMD02",Player1)
            ApplySpellRES("SPIN627",Player1)
            ApplySpellRES("SPIN770",Player1)
            ApplySpellRES("SPIN780",Player1)
            ApplySpellRES("SPIN813",Player1)
            ApplySpellRES("SPIN991",Player1)
            ~
        EXIT
    IF ~~ THEN REPLY ~Death: Kill Creature Type~ // #55
        DO
            ~ApplySpellRES("SPCL411",Player1)
            ApplySpellRES("SPIN681",Player1)
            ApplySpellRES("SPIN723",Player1)
            ApplySpellRES("SPIN820",Player1)
            ApplySpellRES("SPIN836",Player1)
            ApplySpellRES("SPPR599",Player1)
            ApplySpellRES("SPPR722",Player1)
            ~
        EXIT
    IF ~~ THEN REPLY ~State: Petrification~ // #134
        DO
            ~ApplySpellRES("SPIN865",Player1)
            ApplySpellRES("SPIN889",Player1)
            ApplySpellRES("SPIN950",Player1)
            ApplySpellRES("SPIN984",Player1)
            ApplySpellRES("SPWI053",Player1)
            ApplySpellRES("SPWI118",Player1)
            ApplySpellRES("SPWI604",Player1)
            ~
        EXIT
    IF ~~ THEN REPLY ~Death: Kill 60HP~ // #209
        DO
            ~ApplySpellRES("SPPR719",Player1)
            ApplySpellRES("SPWI817",Player1)
            ApplySpellRES("SPWI897",Player1)
            ApplySpellRES("SPWI912",Player1)
            ~
        EXIT
    IF ~~ THEN REPLY ~Spell Effect: Imprisonment~ // #211
        DO
            ~ApplySpellRES("SPIN580",Player1)
            ApplySpellRES("SPIN626",Player1)
            ApplySpellRES("SPIN788",Player1)
            ApplySpellRES("SPWI910",Player1)
            ~
        EXIT
    IF ~~ THEN REPLY ~Death: Disintegrate~ // #238
        DO
            ~ApplySpellRES("SPIN542",Player1)
            ApplySpellRES("SPIN552",Player1)
            ApplySpellRES("SPIN624",Player1)
            ApplySpellRES("SPIN782",Player1)
            ApplySpellRES("SPIN805",Player1)
            ApplySpellRES("SPIN982",Player1)
            ApplySpellRES("SPWI055",Player1)
            ApplySpellRES("SPWI056",Player1)
            ApplySpellRES("SPWI616",Player1)
            ~
        EXIT
END

IF ~~ THEN BEGIN Potion14
    SAY ~Testing potion no.14~
    IF ~~ THEN REPLY ~Conjuration by school~ // #29
        DO ~ApplySpellRES("rqtest14",Player1)~ EXIT
END

IF ~~ THEN BEGIN Potion15
    SAY ~Testing potion no.15~
    IF ~~ THEN REPLY ~Necromancy by school~ // #29
        DO ~ApplySpellRES("rqtest15",Player1)~ EXIT
END

IF ~~ THEN BEGIN Potion16
    SAY ~Testing potion no.16~
    IF ~~ THEN REPLY ~Illusion by school~ // #29
        DO ~ApplySpellRES("rqtest16",Player1)~ EXIT
END

IF ~~ THEN BEGIN Potion17
    SAY ~Testing potion no.17~
    IF ~~ THEN REPLY ~Evocation by school~ // #29
        DO ~ApplySpellRES("rqtest17",Player1)~ EXIT
END

IF ~~ THEN BEGIN Potion18
    SAY ~Testing potion no.18~
    IF ~~ THEN REPLY ~Enchantment by school~ // #29
        DO ~ApplySpellRES("rqtest18",Player1)~ EXIT
END

IF ~~ THEN BEGIN Potion19
    SAY ~Testing potion no.19~
    IF ~~ THEN REPLY ~0 & 1 & 2 level Spells by power level~ // #29
        DO ~ApplySpellRES("rqabju",Player1)~ EXIT
    IF ~~ THEN REPLY ~0 & 1 & 2 level Spells by power level~ // #29
        DO ~ApplySpellRES("rqalte",Player1)~ EXIT
    IF ~~ THEN REPLY ~0 & 1 & 2 level Spells by power level~ // #29
        DO ~ApplySpellRES("rqconj",Player1)~ EXIT
    IF ~~ THEN REPLY ~0 & 1 & 2 level Spells by power level~ // #29
        DO ~ApplySpellRES("rqdivi",Player1)~ EXIT
    IF ~~ THEN REPLY ~0 & 1 & 2 level Spells by power level~ // #29
        DO ~ApplySpellRES("rqench",Player1)~ EXIT
    IF ~~ THEN REPLY ~0 & 1 & 2 level Spells by power level~ // #29
        DO ~ApplySpellRES("rqillu",Player1)~ EXIT
    IF ~~ THEN REPLY ~0 & 1 & 2 level Spells by power level~ // #29
        DO ~ApplySpellRES("rqinvo",Player1)~ EXIT
    IF ~~ THEN REPLY ~0 & 1 & 2 level Spells by power level~ // #29
        DO ~ApplySpellRES("rqnecr",Player1)~ EXIT
    IF ~~ THEN REPLY ~0 & 1 & 2 level Spells by power level~ // #29
        DO ~ApplySpellRES("rqnone",Player1)~ EXIT
    IF ~~ THEN REPLY ~0 & 1 & 2 level Spells by power level~ // #29
        DO ~ApplySpellRES("rqwild",Player1)~ EXIT
END

IF ~~ THEN BEGIN Potion20
    SAY ~Testing potion no.20~
    IF ~~ THEN REPLY ~Spell duration is not testable.~ // #29
        EXIT
END

IF ~~ THEN BEGIN Potion21
    SAY ~Testing potion no.21~
    IF ~~ THEN REPLY ~Critical hit multiplier.~ // #29
        DO ~CreateCreatureOffScreen("rqdummy",14)~ EXIT
END

IF ~~ THEN BEGIN Potion22
    SAY ~Testing potion no.22~
    IF ~~ THEN REPLY ~Aura cleansing testing.~ // #29
        DO ~CreateCreatureOffScreen("rqdummy",14)~ EXIT
END

IF ~~ THEN BEGIN Potion23
    SAY ~Testing potion no.23~
    IF ~~ THEN REPLY ~Casting time modifier.~ // #29
        DO ~CreateCreatureOffScreen("rqdummy",14)~ EXIT
END

IF ~~ THEN BEGIN Potion24
    SAY ~Testing potion no.24~
    IF ~~ THEN REPLY ~Charm testing.~ // #29
        DO ~ApplySpellRES("URGEKILL",Player1)
        ApplySpellRES("SPWI943",Player1)
        ApplySpellRES("SPWI939",Player1)
        ApplySpellRES("SPWI930",Player1)
        ApplySpellRES("SPWI929",Player1)
        ApplySpellRES("SPWI506",Player1)
        ApplySpellRES("SPPR982",Player1)
        ApplySpellRES("SPPR405",Player1)
        ApplySpellRES("SPIN985",Player1)
        ApplySpellRES("SPIN975",Player1)
        ApplySpellRES("SPIN910",Player1)
        ApplySpellRES("SPIN883",Player1)
        ~ EXIT
END

IF ~~ THEN BEGIN Potion25
    SAY ~Testing potion no.25~
    IF ~~ THEN REPLY ~Drain Wizard spell testing.~ // #29
        DO ~ApplySpellRES("SPIN550",Player1)
        ApplySpellRES("SPIN732",Player1)
        ApplySpellRES("SPWISH22",Player1)
        ~ EXIT
END

IF ~~ THEN BEGIN Potion26
    SAY ~Testing potion no.26~
    IF ~~ THEN REPLY ~Attacks Per Round Modifier testing.~ // #29
        EXIT
END

IF ~~ THEN BEGIN Potion27
    SAY ~Testing potion no.27~
    IF ~~ THEN REPLY ~Extra Damage Modifier Attack Speed Factor To Hit Modifier testing.~ // #29
        DO ~CreateCreatureOffScreen("rqdummy",14)~ EXIT
END

IF ~~ THEN BEGIN Potion28
    SAY ~Testing potion no.28~
    IF ~~ THEN REPLY ~Wizard Spell Slots Modifier is not testable.~ // #29
        EXIT
END

IF ~~ THEN BEGIN Potion29
    SAY ~Testing potion no.29~
    IF ~~ THEN REPLY ~Priest Spell Slots Modifier is not testable~ // #29
        EXIT
END

IF ~~ THEN BEGIN Potion30
    SAY ~Testing potion no.30~
    IF ~~ THEN REPLY ~Elemental damage resistance is not testable yet~ // #29
        DO ~~ EXIT // 100 dmg spell create
END

IF ~~ THEN BEGIN Potion31
    SAY ~Testing potion no.31~
    IF ~~ THEN REPLY ~Polymorph into Specific~ // #29
        DO ~ApplySpellRES("SPIN830",Player1)
        ApplySpellRES("SPIN868",Player1)
        ApplySpellRES("SPIN831",Player1)
        ApplySpellRES("SPIN868",Player1)
        ApplySpellRES("SPIN869",Player1)
        ApplySpellRES("SPWM113",Player1)~ EXIT // Wand of Polymorph
END

IF ~~ THEN BEGIN Potion32
    SAY ~Testing potion no.32~
    IF ~~ THEN REPLY ~Increasing saving throws is not testable~ // #29
        EXIT
END

IF ~~ THEN BEGIN Potion33
    SAY ~Testing potion no.33~
    IF ~~ THEN REPLY ~Immunity to modifying SAVING throws.~ // #29
        DO ~ApplySpellRES("BALTH07",Player1)
        ApplySpellRES("SPIN617",Player1)
        ApplySpellRES("SPWI412",Player1)
        ApplySpellRES("SPWI412",Player1)
        ApplySpellRES("SPWI928",Player1)
        ApplySpellRES("SPPR113",Player1)
        ~ EXIT
END

IF ~~ THEN BEGIN Potion34
    SAY ~Testing potion no.34~
    IF ~~ THEN REPLY ~AC vs. Damage Type Modifier~ // #29
        DO ~CreateCreatureOffScreen("rqtest",14)
        GiveItemCreate("sw1h77","rqtest",0,0,0)~ EXIT
END

IF ~~ THEN BEGIN GivePotionsFortesting
    SAY ~Give Potions for immunity testing 1,2,4,5,7,8,9,10,11,12,13,24,25,31~
    IF ~~ THEN REPLY ~Give Me potions 1,2,4,5,7,8,9,10,11,12,13,24,25,31~ // #29
        DO
        ~GiveItemCreate("rqpotn1",Player1,0,0,0) // 1
        GiveItemCreate("rqpotn2",Player1,0,0,0) // 2

        GiveItemCreate("rqpotn4",Player1,0,0,0) // 4
        GiveItemCreate("rqpotn5",Player1,0,0,0) // 5

        GiveItemCreate("rqpotn7",Player1,0,0,0) // 7
        GiveItemCreate("rqpotn8",Player1,0,0,0) // 8
        GiveItemCreate("rqpotn9",Player1,0,0,0) // 9
        GiveItemCreate("rqpotn10",Player1,0,0,0) //10
        GiveItemCreate("rqpotn11",Player1,0,0,0) //11
        GiveItemCreate("rqpotn12",Player1,0,0,0) //12
        GiveItemCreate("rqpotn13",Player1,0,0,0) //13

        GiveItemCreate("rqpotn24",Player1,0,0,0) //24
        GiveItemCreate("rqpotn25",Player1,0,0,0) //25
        GiveItemCreate("rqpotn31",Player1,0,0,0) //31
        ~ EXIT
END

IF ~~ THEN BEGIN GivePotionsForImmubatleTesting
    SAY ~Give Potions 3,6,33,34~
    IF ~~ THEN REPLY ~Immutability Potions 3,6,33,34~ // #29
        DO ~GiveItemCreate("rqpotn3",Player1,0,0,0)
        GiveItemCreate("rqpotn6",Player1,0,0,0)
        GiveItemCreate("rqpotn33",Player1,0,0,0)
        GiveItemCreate("rqpotn34",Player1,0,0,0)
        ~ EXIT
END

IF ~~ THEN BEGIN GivePotionsBonusTesting
    SAY ~Give Potions for immunity testing 14,15,16,17,18,19,20,21,22,23, 26,27,28,29,30, 32,35~
    IF ~~ THEN REPLY ~Give Me potions 14,15,16,17,18,19,20,21,22,23, 26,27,28,29,30, 32,35~
        DO
        ~GiveItemCreate("rqpotn14",Player1,0,0,0) // 15
        GiveItemCreate("rqpotn15",Player1,0,0,0) // 15
        GiveItemCreate("rqpotn16",Player1,0,0,0) // 16
        GiveItemCreate("rqpotn17",Player1,0,0,0) // 17
        GiveItemCreate("rqpotn18",Player1,0,0,0) // 18

        GiveItemCreate("rqpotn19",Player1,0,0,0) // 19
        GiveItemCreate("rqpotn20",Player1,0,0,0) // 20
        GiveItemCreate("rqpotn21",Player1,0,0,0) // 21
        GiveItemCreate("rqpotn22",Player1,0,0,0) // 22
        GiveItemCreate("rqpotn23",Player1,0,0,0) // 23

        GiveItemCreate("rqpotn26",Player1,0,0,0) // 26
        GiveItemCreate("rqpotn27",Player1,0,0,0) // 27
        GiveItemCreate("rqpotn28",Player1,0,0,0) // 28
        GiveItemCreate("rqpotn29",Player1,0,0,0) // 29
        GiveItemCreate("rqpotn30",Player1,0,0,0) // 30

        GiveItemCreate("rqpotn32",Player1,0,0,0) // 32
        GiveItemCreate("rqpotn35",Player1,0,0,0) // 35
        ~ EXIT
END

IF ~~ THEN BEGIN GiveExtraPotionsForTesting
    SAY ~Give Potions 36,37~
    IF ~~ THEN REPLY ~Extra Potions 36,37~ // #29
        DO ~GiveItemCreate("rqpotn36",Player1,0,0,0)
        GiveItemCreate("rqpotn37",Player1,0,0,0)
        ~ EXIT
END

IF ~~ THEN BEGIN NoNothing
    SAY ~As you like.~
    IF ~~ THEN EXIT
END
