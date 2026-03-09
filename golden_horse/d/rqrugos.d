/* ------------------------------------------------------------------- Rugos contract no.1 -------------------------------------------------------------------*/
BEGIN ~rqrugos~

IF ~Global("rqContractsRugosAvailable","GLOBAL",3)~
    THEN BEGIN Rugos1OfferContract
    SAY ~Hail.~
    IF ~~ THEN EXTERN ~rqrevJ~ ProtectionContractFinished
END

IF ~~ THEN BEGIN Rugos1ContractProlog
    SAY ~Perhaps, for now. I reckon the Harpers won't yield so readily, Revan... in any case.~
    IF ~~ THEN DO
            %GiveGoldForce("15000")
            EraseJournalEntry(~New mercenary work for me?

            Revan has more mercenary work for me. If I am interested, I should go to Mithrest Inn in Waukeen's Promenade.~)
            EraseJournalEntry(~Protect Revan from assassins

            To receive my reward for escorting Revan Artecratos, I should talk to Rugos in Mithrest.~)%
            SOLVED_JOURNAL ~Protect Revan from assassins: Completed.

            I have killed Mintiper this should stop further Harper ambushes. I am not so sure if they will give up so soon but who am I to complain I got my 15000 gold pieces.~ GOTO Rugos1FirstContractIntro
END

IF ~~ THEN BEGIN Rugos1FirstContractIntro
    SAY ~Did Revan gab with ya 'bout them mercenary deals? You keen on 'em?~
    IF ~~ THEN REPLY ~Yes, he told me to talk to you.~ GOTO Rugos1Contract
    IF ~~ THEN REPLY ~Yeah, that's not the case. Farewell.~ GOTO Rugos1Rejected
END

IF ~~ THEN BEGIN Rugos1Contract
    SAY ~For this particular accord, I grant four thousand gold. Target be Marcian Argent, leader of a bandit band of no insignificant might.~
    IF ~~ THEN REPLY ~4000 gold sounds acceptable. Where is he?~ GOTO Rugos1AgreedLocation
    IF ~~ THEN REPLY ~Why does he have bounty on his head?~ GOTO Rugos1Bounty
    IF ~~ THEN REPLY ~Can you tell me more about this Marcian Argent?~ GOTO Rugos1TellMore
    IF ~~ THEN REPLY ~On second thought, I don't have time for this.~ GOTO Rugos1Rejected
END

IF ~~ THEN BEGIN Rugos1Bounty
    SAY ~We ask few, very few. As for yer query, I know naught. Only ask questions that can be used to bring down bounty targets, no more, no less.~
    IF ~~ THEN REPLY ~Right, tell me more about him and his group.~ GOTO Rugos1TellMore
    IF ~~ THEN REPLY ~Okay, but knowing all these details might be helpful to defeat them.~ GOTO Rugos1ExplainAnonymity
END

IF ~~ THEN BEGIN Rugos1ExplainAnonymity
    SAY ~Aye, that be true indeed, but sometimes ye get clients wishin' to stay as hidden as the deepest mine, preferin' not to share such details, aye.~
    IF ~~ THEN REPLY ~Can you tell me more about this Marcian Argent?~ GOTO Rugos1TellMore
END

IF ~~ THEN BEGIN Rugos1TellMore
    SAY ~Ach, I have come to the conclusion, ye see, that he’s formed a splinter faction from some unknown religious cult. Those cultists, they be wantin’ him dead, aye. No one leaves that cult alive, I reckon.~
    =
    ~Marcian himself be a skilled fighter, he be, and he’s got himself a couple of clerics, one wizard, and a handful of fighters in his crew.~
    IF ~~ THEN REPLY ~Where can I find him?~ GOTO Rugos1AgreedLocation
    IF ~~ THEN REPLY ~Okay, but I want a bigger share of the reward.~ GOTO Rugos1Negotitation
END

IF ~~ THEN BEGIN Rugos1AgreedLocation
    SAY ~Graveyard district, aye. Might be he’s hidin’ in one of the crypts, or maybe he only comes out at night, but I can't say fer certain.~
    IF ~~ THEN REPLY ~He is as good as dead.~ GOTO Rugos1AgreedToContract
    IF ~~ THEN REPLY ~4000 is too small amount. I want 10000 gold pieces.~ GOTO Rugos1Negotitation
    IF ~~ THEN REPLY ~Not interested.~ GOTO Rugos1Rejected
END

IF ~~ THEN BEGIN Rugos1Negotitation
    SAY ~Revan, he say, give ye highest share of reward, aye. But, I, I only take but a quarter, so cannot give ye more, no more.~
    IF ~~ THEN REPLY ~Alright, I will do it for 4000 gold pieces.~ GOTO Rugos1AgreedToContract
    IF ~~ THEN REPLY ~Not enough.~ GOTO Rugos1Rejected
END

IF ~~ THEN BEGIN Rugos1Rejected
    SAY ~Aye, I understand. Farewell, friend.~
    IF ~~ THEN DO
        ~SetGlobal("rqcontractMarcian","GLOBAL",2)~ // rejected
    EXIT
END

IF ~Global("rqcontractMarcian","GLOBAL",2) // rejected
    Global("rqContractsRugosAvailable","GLOBAL",3)~
    THEN BEGIN Rugos1Reconsideration
    SAY ~Hark, ye interested in takin' on my contract, are ye?~
    IF ~~ THEN REPLY ~Can you repeat contents of your contract?~ GOTO Rugos1Contract
    IF ~~ THEN REPLY ~Maybe later. As of now, farewell.~ GOTO Rugos1Rejected
END

IF ~~ THEN BEGIN Rugos1AgreedToContract
    SAY ~Ah, well now! He's lurkin' somewhere 'round the Graveyard District 'ere in Athkatla, I tell ye.~
    IF ~~ THEN DO
        ~SetGlobal("rqcontractMarcian","GLOBAL",1)
        SetGlobal("rqContractsRugosAvailable","GLOBAL",4)~
        UNSOLVED_JOURNAL ~Assassination Contract: Marcian Argent.

        I have agreed to kill Marcian Argent for dwarf Rugos in Mithrest Inn. He is supposed to be somewhere in Graveyard District I should be expecting Marcian to be protected by at least two Priests, several Fighters and one Wizard.~
    EXIT
END

IF ~Global("rqcontractMarcian","GLOBAL",1)~ THEN BEGIN Rugos1InitiatedBattle
    SAY ~Greetings, noble friend. I trust ye bring tidings of fortune. Is the task complete? And hath ye acquired his head?~
    IF ~Dead("rq1marca") PartyHasItem("rqproof1") Global("rqcontract1battle","GLOBAL",1)~ THEN REPLY ~It is done Marcian is dead and here is his head.~ GOTO Rugos1HaveHead
    IF ~Dead("rq1marca") !PartyHasItem("rqproof1") Global("rqcontract1battle","GLOBAL",1)~ THEN REPLY ~Marcian but I forgot his head.~ GOTO Rugos1Unfinished
    IF ~!Dead("rqmararg")~ THEN REPLY ~Not yet I will have to figure out how to finish the job.~ GOTO Rugos1Unfinished
END

IF ~~ THEN BEGIN Rugos1Unfinished
    SAY ~Hah! Ye be better off comin' 'round later, aye.~
    IF ~~THEN EXIT
END

IF ~~ THEN BEGIN Rugos1HaveHead
    SAY ~Show it to me... Hrm... appearance matches, indeed. Here is your gold. Come back when ye be ready for another job. Farewell.~
    IF ~~ THEN DO
        %GiveGoldForce(4000)
        SetGlobal("rqcontractMarcian","GLOBAL",3)
        TakePartyItem("rqproof1")
        EraseJournalEntry(~Assassination Contract: Marcian Argent.

        I have agreed to kill Marcian Argent for dwarf Rugos in Mithrest Inn. He is supposed to be somewhere in Graveyard District I should be expecting Marcian to be protected by at least two Priests, several Fighters and one Wizard.~)
        %
        SOLVED_JOURNAL ~Assassination Contract: Marcian Argent completed.

        Marcian Argent is dead and I have my reward 4000 gold.~
    EXIT
END

/* ------------------------------------------------------------------- Rugos contract no.2 -------------------------------------------------------------------*/

IF ~Global("rqcontractMarcian","GLOBAL",3)~ THEN BEGIN Rugos2OfferContract // timer expired
    SAY ~Greetings, I have second job for ye.~
    IF ~~ THEN REPLY ~Let's hear it.~ GOTO Rugos2Contract
    IF ~~ THEN REPLY ~Maybe we shall talk later about this. Farewell.~ GOTO Rugos2Rejected
END

IF ~~ THEN BEGIN Rugos2Contract
    SAY ~Reward for this job be 14000 gold, aye. This contract be for zealous Wizardslayer and his pupils, it be. These contracts from mages, they pop out now and then, aye.~
    IF ~~ THEN REPLY ~14000 gold?! Consider it done. Just tell me where they are.~ GOTO Rugos2AgreedLocation
    IF ~~ THEN REPLY ~Mages? That can only be from the Cowled Wizards, no?~ GOTO Rugos2WhoIsIssuer
    IF ~~ THEN REPLY ~Can you tell me more about this Wizardslayer group?~ GOTO Rugos2TellMore
    IF ~~ THEN REPLY ~On second thought, I don't have time for this.~ GOTO Rugos2Rejected
END

IF ~~ THEN BEGIN Rugos2WhoIsIssuer
    SAY ~We don't trouble ourselves with many questions, aye. But I can confirm, aye, that Cowled Wizards did issue this contract.~
    IF ~~ THEN REPLY ~Right, tell me more about why Cowled Wizards want him dead.~ GOTO Rugos2TellMore
    IF ~~ THEN REPLY ~More details mean less chance of an ambush in the worst case, or any other problems...~ GOTO Rugos2Ambush
END

IF ~~ THEN BEGIN Rugos2Ambush
    SAY ~Hmpf! I tell ya, contract's solid as stone. Just a simple kill job from the Cowled Wizards, official and plain as day, it is.~
    IF ~~ THEN REPLY ~Can you tell me more about this Wizardslayer group?~ GOTO Rugos2TellMore
END

IF ~~ THEN BEGIN Rugos2TellMore
    SAY ~Hark, ye, it seems the Wizardslayers and Cowled Wizards be at odds, aye. And a leader from Cowled Wizards, fed up, set a bounty on 'em, he did.~
    =
    ~Leader be mighty skilled in the ways of the Wizardslayer, a true fighter of great renown. He’s got a couple of those wizard-fighters at his side, and a handful of fighters wielding all manner of arms, each with his own special craft.~
    IF ~~ THEN REPLY ~Where can I find him?~ GOTO Rugos2AgreedLocation
    IF ~~ THEN REPLY ~Okay, but I want a bigger share of the reward.~ GOTO Rugos2Negotitation
END

IF ~~ THEN BEGIN Rugos2AgreedLocation
    SAY ~We are not sure where he is specifically. Last time they were seen in Umar Hills Inn. You should start your search from there.~
    IF ~~ THEN REPLY ~He is as good as dead.~ GOTO Rugos2AgreedToContract
    IF ~~ THEN REPLY ~14000 gold is too small amount. I want more.~ GOTO Rugos2Negotitation
    IF ~~ THEN REPLY ~Not interested.~ GOTO Rugos2Rejected
END

IF ~~ THEN BEGIN Rugos2Negotitation
    SAY ~Hrmph! We be not certain where he be exactly. Last, they were spotted in Umar Hills Inn. Ye best begin yer hunt from that place.~
    IF ~~ THEN REPLY ~Alright, I will do it for 14000 gold pieces.~ GOTO Rugos2AgreedToContract
    IF ~~ THEN REPLY ~Not enough.~ GOTO Rugos2Rejected
END

IF ~~ THEN BEGIN Rugos2Rejected
    SAY ~Aye, it be understandable, indeed.~
    IF ~~ THEN DO
        ~SetGlobal("rqcontractKamraarn","GLOBAL",2)
        SetGlobal("rqcontractMarcian","GLOBAL",4)~
    EXIT
END

IF ~Global("rqcontractKamraarn","GLOBAL",2)~ THEN BEGIN Rugos2Reconsideration
    SAY ~Hrmph! You interested in takin' on my contract, eh?~
    IF ~~ THEN REPLY ~Can you repeat contents of your contract?~ GOTO Rugos2Contract
    IF ~~ THEN REPLY ~Not yet Rugos.~ GOTO Rugos2Rejected
END

IF ~~ THEN BEGIN Rugos2AgreedToContract
    SAY ~Ah, well now, good to hear! Last time thems was seen in Umar Hills Inn, do mind bringin' his amulet, yes?~
    IF ~~ THEN DO
        ~SetGlobal("rqcontractKamraarn","GLOBAL",1)
        SetGlobal("rqcontractMarcian","GLOBAL",4)~
        UNSOLVED_JOURNAL ~Assassination Contract: Kamraarn.

        I have agreed to kill Kamraarn for dwarf Rugos Mithrest Inn. He is supposed to be somewhere in Umar Hills I should be expecting Kamraarn to be accompanied with several fighting men with Wizardslayer specialization. Supported by few fighting mages.~
    EXIT
END

IF ~Global("rqcontractKamraarn","GLOBAL",1)~ THEN BEGIN Rugos2InitiatedBattle
    SAY ~Greetings, friend. I trust ye return with favorable tidings. Is the task complete? And, have ye secured his amulet?~
    IF ~Dead("rqkamraa") PartyHasItem("rqproof2") Global("rqcontract2battle","GLOBAL",1)~ THEN REPLY ~It is done. Kamraarn is dead, and here is his amulet.~ GOTO Rugos2HaveAmulet
    IF ~Dead("rqkamraa") !PartyHasItem("rqproof2") Global("rqcontract2battle","GLOBAL",1)~ THEN REPLY ~Kamraarn is dead, but I forgot the proof of the deed.~ GOTO Rugos2Unfinished
    IF ~!Dead("rqkamraa")~ THEN REPLY ~Not yet. I will have to figure out how to finish the job.~ GOTO Rugos2Unfinished
END

IF ~~ THEN BEGIN Rugos2Unfinished
    SAY ~Hmph. Ye best return later, aye.~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Rugos2HaveAmulet
    SAY ~Give it to me, I say. Looks alright, it does. Here is yer gold. Come back when ye want another contract, and we’ll talk again. Farewell.~
    IF ~~ THEN DO
        %TakePartyItem("rqproof2") // amuletproof2
        GiveGoldForce(14000)
        SetGlobal("rqcontractKamraarn","GLOBAL",3)
        EraseJournalEntry(~Assassination Contract: Kamraarn.

        I have agreed to kill Kamraarn for dwarf Rugos Mithrest Inn. He is supposed to be somewhere in Umar Hills I should be expecting Kamraarn to be accompanied with several fighting men with Wizardslayer specialization. Supported by few fighting mages.~)
        %
        SOLVED_JOURNAL ~Assassination Contract on Kamraarn completed.

        Kamraarn is dead and I have my reward 14000 gold.~
    EXIT
END

/* ------------------------------------------------------------------- Rugos contract no.3 -------------------------------------------------------------------*/

IF ~Global("rqcontractKamraarn","GLOBAL",3)~ THEN BEGIN Rugos3OfferContract
    SAY ~New task I have ye, indeed.~
    IF ~~ THEN REPLY ~I sure did like your previous contract.~ GOTO Rugos3Contract
    IF ~~ THEN REPLY ~You have my ear.~ GOTO Rugos3Contract
    IF ~~ THEN REPLY ~Maybe we shall talk later about this. Farewell.~ GOTO Rugos3Rejected
END

IF ~~ THEN BEGIN Rugos3Contract
    SAY ~Ah, reward be 4000 gold, aye. These two Kensai with Mage workin’ for rival mercenary clans, they are. Someone seeks to shove 'em into retirement fast and hard, yes indeed.~
    IF ~~ THEN REPLY ~4000 gold? Alright, I will take it.~ GOTO Rugos3AgreedLocation
    IF ~~ THEN REPLY ~Who issued this contract?~ GOTO Rugos3WhoIsIssuer
    IF ~~ THEN REPLY ~Seems like a lower-paying job with fewer enemies to eliminate?~ GOTO Rugos3TellMore
    IF ~~ THEN REPLY ~On second thought, I don't have time for this.~ GOTO Rugos3Rejected
END

IF ~~ THEN BEGIN Rugos3WhoIsIssuer
    SAY ~Hah! I ken not, nor Revan, if ye be askin'. As I said, I be quite sure the contractor be some other mercenary band, aye.~
    IF ~~ THEN REPLY ~Perhaps they are here on a mission of sorts.~ GOTO Rugos3TellMore
    IF ~~ THEN REPLY ~More details mean less chance of an ambush in the worst case, or any other problems...~ GOTO Rugos3Ambush
END

IF ~~ THEN BEGIN Rugos3Ambush
    SAY ~Hrumph. These two, they be but scouts, no backup needed. Should trouble arise, come to me, and we shall reevaluate and set things right.~
    IF ~~ THEN REPLY ~Tell me more about them.~ GOTO Rugos3TellMore
END

IF ~~ THEN BEGIN Rugos3TellMore
    SAY ~They be likely scouts or maybe shadowy killers, aye. But why would a mercenary band lay a contract on 'em, hmm? If ye uncover the reason, do tell me.~
    =
    ~Verily, both be masterful in their craft, one a hardy warrior who fights unarmored, the other a mighty mage of great power.~
    IF ~~ THEN REPLY ~Where can we find him?~ GOTO Rugos3AgreedLocation
    IF ~~ THEN REPLY ~Okay, but I want a bigger share of the reward.~ GOTO Rugos3Negotitation
END

IF ~~ THEN BEGIN Rugos3AgreedLocation
    SAY ~Ye best be seekin' 'em in Trademeet, friend.~
    IF ~~ THEN REPLY ~They are as good as dead.~ GOTO Rugos3AgreedToContract
    IF ~~ THEN REPLY ~4000 gold is three-quarters of the full sum you got from contractor?~ GOTO Rugos3Negotitation
    IF ~~ THEN REPLY ~Not interested in such lowly paying contracts. Farewell.~ GOTO Rugos3Rejected
END

IF ~~ THEN BEGIN Rugos3Negotitation
    SAY ~Aye, I be desirein' that as well. It be four thousand or naught.~
    IF ~~ THEN REPLY ~Alright, I will do it for 4000 gold pieces.~ GOTO Rugos3AgreedToContract
    IF ~~ THEN REPLY ~Not enough.~ GOTO Rugos3Rejected
END

IF ~~ THEN BEGIN Rugos3Rejected
    SAY ~*Grumble* Bah, does it have to be so blasted hard? Farewell, then.~
    IF ~~ THEN DO
        ~SetGlobal("rqcontractAnakarhysse","GLOBAL",2)
        SetGlobal("rqcontractKamraarn","GLOBAL",4)~
    EXIT
END

IF ~Global("rqcontractAnakarhysse","GLOBAL",2)~ THEN BEGIN Rugos3Reconsideration
    SAY ~Greetings, noble one. Are ye inclined to partake in my contractual dealings?~
    IF ~~ THEN REPLY ~Can you repeat terms of your contract?~ GOTO Rugos3Contract
    IF ~~ THEN REPLY ~Never mind.~ GOTO Rugos3Rejected
END

IF ~~ THEN BEGIN Rugos3AgreedToContract
    SAY ~Trademeet, that be the place ye find 'em, aye.~
    IF ~~ THEN DO
        ~SetGlobal("rqcontractAnakarhysse","GLOBAL",1)
        SetGlobal("rqcontractKamraarn","GLOBAL",4)~
        UNSOLVED_JOURNAL ~Assassination Contract: Anakarhysse.

        I have agreed to kill Anakarhysse for dwarf Rugos Mithrest Inn. Last seen in Trademeet though it is very likely he would not be where is a lot of people. He was last seen with Berkris a powerful Magi.~
    EXIT
END

IF ~Global("rqcontractAnakarhysse","GLOBAL",1)~ THEN BEGIN Rugos3InitiatedBattle
    SAY ~Ah, ye return with good news, I trust. Is it finished? And do ye possess his head?~
    IF ~Dead("rqberkri") Dead("rqanakar") PartyHasItem("rqproof3") Global("rqcontract3battle","GLOBAL",1)~ THEN REPLY ~It is done. Anakarhysse is dead, and here is his head.~ GOTO Rugos3HaveHead
    IF ~!Dead("rqanakar") !Dead("rqberkri")~ THEN REPLY ~Not yet. I will have to figure out how to finish the job.~ GOTO Rugos3Unfinished
    IF ~Global("rqcontractAnakarhysse","GLOBAL",3)~ THEN REPLY ~Anakarhysse left, and I failed to stop him.~ GOTO Rugos3Failed
    IF ~!PartyHasItem("rqproof3") Dead("rqanakar") Dead("rqberkri")~ THEN REPLY ~They are dead, but I forgot the proof of the deed.~ GOTO Rugos3Unfinished
END

IF ~~ THEN BEGIN Rugos3Unfinished
    SAY ~Hrrmph! Very well, ye can return when the time be right.~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Rugos3HaveHead
    SAY ~Show it to me, lad... Seems like him, but next time, don’t rough him up so. Here be your gold, come talk to me when ye be ready for the next contract.~
    IF ~~ THEN DO
        %GiveGoldForce(4000)
        TakePartyItem("rqproof3")
        SetGlobal("rqcontractAnakarhysse","GLOBAL",3)
        EraseJournalEntry (~Assassination Contract: Anakarhysse.

        I have agreed to kill Anakarhysse for dwarf Rugos Mithrest Inn. Last seen in Trademeet though it is very likely he would not be where is a lot of people. He was last seen with Berkris a powerful Magi.~)
        %
        SOLVED_JOURNAL ~Assassination Contract on Anakarhysse completed.

        Contract is fulfilled and I got my 4000 gold.~
    EXIT
END

IF ~Global("rqcontractbotched","GLOBAL",1)~ THEN BEGIN Rugos3Failed
    SAY ~Hah! Ye did what?! Very well, I shall dispatch a messenger when next contract comes your way.~
    IF ~~ THEN DO
        %EraseJournalEntry (~Assassination Contract: Anakarhysse.

        I have agreed to kill Anakarhysse for dwarf Rugos Mithrest Inn. Last seen in Trademeet though it is very likely he would not be where is a lot of people. He was last seen with Berkris a powerful Magi.~)
        %
        SOLVED_JOURNAL ~Assassination Contract on Anakarhysse completed.~
    EXIT
END

/* ------------------------------------------------------------------- Rugos contract no.4 -------------------------------------------------------------------*/

IF ~Global("rqcontractAnakarhysse","GLOBAL",3)~ THEN BEGIN Rugos4OfferContract
    SAY ~Greetings, friend. I carry new contract for ye, but this one be a mighty different beast from what we've seen before.~
    IF ~~ THEN REPLY ~How so?~ GOTO Rugos4Contract
    IF ~~ THEN REPLY ~So, tell me about it.~ GOTO Rugos4Contract
    IF ~~ THEN REPLY ~Maybe we shall talk later about this. Farewell.~ GOTO Rugos4Rejected
END

IF  ~Global("rqcontractHevguris","GLOBAL",1) // failed
    OR(3)
        Class(Player1,PALADIN)
        Class(Player1,RANGER)
        Alignment(Player1,MASK_GOOD)~
    THEN BEGIN Rugos4OfferContract
    SAY ~Hark ye, <CHARNAME>, do not take offense, but this be not the sort of pact thou canst fulfill.~
        IF ~~ THEN REPLY ~Farewell.~
            DO
                ~SetGlobal("rqcontractbotched","GLOBAL",1)~
            EXIT
END

IF ~~ THEN BEGIN Rugos4Contract
    SAY ~I be havin' a contract from the Church, aye, to eliminate a group of Paladins of Torm, I be.~
    IF ~~ THEN REPLY ~At last... we shall have revenge...~ GOTO Rugos4AgreedLocation
    IF ~~ THEN REPLY ~Who issued this contract?~ GOTO Rugos4WhoIsIssuer
    IF ~~ THEN REPLY ~Any more details?~ GOTO Rugos4TellMore
    IF ~~ THEN REPLY ~On second thought, I don't have time for this.~ GOTO Rugos4Rejected
END

IF ~~ THEN BEGIN Rugos4WhoIsIssuer
    SAY ~I reckon I don't rightly know, friend.~
    IF ~~ THEN REPLY ~Any other details?~ GOTO Rugos4TellMore
    IF ~~ THEN REPLY ~Can I get into problems with a good-aligned faction after this contract?~ GOTO Rugos4Ambush
END

IF ~~ THEN BEGIN Rugos4Ambush
    SAY ~Hrmph, this be beyond me grasp, but I reckon dangers of such surprises be mirrored in the treasures they bring.~
    IF ~~ THEN REPLY ~Tell me more about them.~ GOTO Rugos4TellMore
END

IF ~~ THEN BEGIN Rugos4TellMore
    SAY ~This mighty band has riled the grand church, and they seek to hasten their path to the heavens, aye.~
    =
    ~They be made up of one mage, two clerics, and a dozen knights, aye.~
    IF ~~ THEN REPLY ~Where can we find him?~ GOTO Rugos4AgreedLocation
    IF ~~ THEN REPLY ~Okay, but I want a bigger share of the reward.~ GOTO Rugos4Negotitation
END

IF ~~ THEN BEGIN Rugos4AgreedLocation
    SAY ~Ah, Athkatla Slums District, ye say. Reward be 20000 gold coins, aye.~
    IF ~~ THEN REPLY ~They are as good as dead.~ GOTO Rugos4AgreedToContract
    IF ~~ THEN REPLY ~20000? That's quite a lot, but I will be spending a lot to get my reputation back up. I want more gold for this contract.~ GOTO Rugos4Negotitation
    IF ~~ THEN REPLY ~Not interested.~ GOTO Rugos4Rejected
END

IF ~~ THEN BEGIN Rugos4Negotitation
    SAY ~Hmph. Apologies, but I cannot hand over more gold, no. However, as I seek to build my reputation as a dependable mercenary, I can offer you magic, if ye fulfill the contract, aye.~
    IF ~~ THEN REPLY ~20000 and magic sound far more interesting.~ GOTO Rugos4AgreedToContract
    IF ~~ THEN REPLY ~Not enough. Farewell.~ GOTO Rugos4Rejected
END

IF ~~ THEN BEGIN Rugos4Rejected
    SAY ~Understandable, friend. Tis clear now.~
        IF ~~ THEN DO
            ~SetGlobal("rqcontractHevguris","GLOBAL",2)
            SetGlobal("rqcontractAnakarhysse","GLOBAL",4)~
        EXIT
END

IF ~Global("rqcontractHevguris","GLOBAL",2)~ THEN BEGIN Rugos4Reconsideration
    SAY ~Are ye wantin' to take on me contract, then?~
    IF ~~ THEN REPLY ~Can you repeat terms of your contract?~ GOTO Rugos4Contract
    IF ~~ THEN REPLY ~Not yet. Right now, I have different priorities.~ GOTO Rugos4Rejected
END

IF ~~ THEN BEGIN Rugos4AgreedToContract
    SAY ~They be arrivin' to Athkatla Slums District, aye.~
        IF ~!IsValidForPartyDialogue("Keldorn") !IsValidForPartyDialogue("Mazzy")~ THEN DO
            ~SetGlobal("rqcontractHevguris","GLOBAL",1)
            SetGlobal("rqcontractAnakarhysse","GLOBAL",4)~
            UNSOLVED_JOURNAL ~Assassination Contract: Hevguris.

            I have agreed to kill Inquisitor Hevguris for dwarf Rugos in Mithrest Inn. They are supposed to be in Athkatla Slums District. According to Rugos the group should consist of one wizard, few clerics and several knights.~
        EXIT
            IF ~IsValidForPartyDialogue("Mazzy")~ THEN DO
            ~SetGlobal("rqcontractHevguris","GLOBAL",1)
            SetGlobal("rqcontractAnakarhysse","GLOBAL",4)
            SetGlobal("rqcontract4MazzyReinfSends","GLOBAL",1)
            DisplayStringHead("Mazzy",49810)~
            UNSOLVED_JOURNAL ~Assassination Contract: Hevguris.

            I have agreed to kill Inquisitor Hevguris for dwarf Rugos in Mithrest Inn. They are supposed to be in Athkatla Slums District. According to Rugos the group should consist of one wizard, few clerics and several knights.~
        EXIT
            IF ~IsValidForPartyDialogue("Keldorn")~ THEN DO
            ~SetGlobal("rqcontractHevguris","GLOBAL",1)
            SetGlobal("rqcontractAnakarhysse","GLOBAL",4)
            SetGlobal("rqcontract4KeldornReinfSends","GLOBAL",1)
            DisplayStringHead("Keldorn",85664)~
            UNSOLVED_JOURNAL ~Assassination Contract: Hevguris.

            I have agreed to kill Inquisitor Hevguris for dwarf Rugos in Mithrest Inn. They are supposed to be in Athkatla Slums District. According to Rugos the group should consist of one wizard, few clerics and several knights.~
        EXIT
END

IF ~Global("rqcontractHevguris","GLOBAL",1)~ THEN BEGIN Rugos4InitiatedBattle
    SAY ~Greetings, friend. I trust your journey brought glad tidings. Has the task been completed? And do you bear the prize his head?~
    IF ~Dead("rqinqhev") PartyHasItem("rqproof4") Global("rqcontract4battle","GLOBAL",1)~ THEN REPLY ~It is done. Hevguris is dead, and here is the proof you require.~ GOTO Rugos4HaveHead
    IF ~Dead("rqinqhev") !PartyHasItem("rqproof4") Global("rqcontract4battle","GLOBAL",1)~ THEN REPLY ~I have killed Hevguris, but I forgot to loot his ring.~ GOTO Rugos4Forgot
    IF ~!Dead("rqinqhev")~ THEN REPLY ~Not yet. I will have to figure out how to finish the job.~ EXIT
END

IF ~~ THEN BEGIN Rugos4Forgot
    SAY ~Ah, so ye be comin' back then, eh? Only reward ye I shall if ye bring me proof of yer deed, aye.~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Rugos4HaveHead
    SAY ~Give it to me... Hmm... the look's right enough. Here be your gold. Come back when ye be ready for the next job.~
        IF ~~ THEN DO
            %GiveGoldForce(20000)
            TakePartyItem("rqproof4")
            GiveItem("sw1h27",Player1) // Arbane's Sword +2
            SetGlobal("rqcontractHevguris","GLOBAL",3)
            EraseJournalEntry (~Assassination Contract: Hevguris.

            I have agreed to kill Inquisitor Hevguris for dwarf Rugos in Mithrest Inn. They are supposed to be in Athkatla Slums District. According to Rugos the group should consist of one wizard, few clerics and several knights.~)
            %
            SOLVED_JOURNAL ~Assassination Contract on Hevguris completed.

            Paladin Hevguris is dead and I got my 20000 gold for the deed.~
        EXIT
END

/* ------------------------------------------------------------------- Rugos contract no.5 -------------------------------------------------------------------*/
//After solving druid grove do check with rugos
IF ~Global("rqcontractHevguris","GLOBAL",3)~ THEN BEGIN Rugos5OfferContract
    SAY ~Once again, I got meself a contract, a tough one, aye. Others might shy away, but I reckon you might be up to the challenge.~
    IF ~~ THEN REPLY ~Tell me more.~ GOTO Rugos5Contract
    IF ~~ THEN REPLY ~I'm listening.~ GOTO Rugos5Contract
    IF ~~ THEN REPLY ~Maybe we shall talk later about this, Farewell~ GOTO Rugos5Rejected
END

IF ~Global("rqcontractHevguris","GLOBAL",3)
    OR (2)
        Class(Player1,RANGER)
        Class(Player1,DRUID)~
    THEN BEGIN CharnameIsNatureLover
    SAY ~Aye, I ken yer care fer Nature, but Druids themselves brought this matter to me. As far as I see it, this be an internal squabble. Do ye wish to take part in it?~
    =
    ~Ye need not spill blood, friend. Just break their spell, which I reckon can be done without fuss or fight.~
    IF ~~ THEN REPLY ~No, not interested in our disputes.~ GOTO Rugos5Rejected
    IF ~~ THEN REPLY ~Assume? That is not enough.~ GOTO Rugo5ComeBackToMe
    IF ~~ THEN REPLY ~Maybe we shall talk later about this. Farewell.~ GOTO Rugos5Contract
    IF ~~ THEN REPLY ~What if I am not able to resolve it peacefully?~ GOTO Rugo5ComeBackToMe
END

IF ~~ THEN BEGIN Rugo5ComeBackToMe
    SAY ~If ye accept but falter, return to me with tales of defeat.~
    IF ~~ THEN REPLY ~Alright, tell me more.~ GOTO Rugos5Contract
    IF ~~ THEN REPLY ~Nope, I will not be taking this contract.~ GOTO Rugos5Rejected
END

IF ~~ THEN BEGIN Rugos5Contract
    SAY ~Disruption or ritual that be to be done by the band of Druids and their kin, aye.~
    IF ~~ THEN REPLY ~Color me interested. Where are they?~ GOTO Rugos5AgreedLocation
    IF ~~ THEN REPLY ~Who issued this contract?~ GOTO Rugos5WhoIsIssuer
    IF ~~ THEN REPLY ~Any more details?~ GOTO Rugos5TellMore
    IF ~~ THEN REPLY ~On second thought, I don't have time for this.~ GOTO Rugos5Rejected
END

IF ~~ THEN BEGIN Rugos5WhoIsIssuer
    SAY ~Hark, some unknown druid sect, Ashbrought or whatnot, aye. Though I reckon it be naught but a veil for Shadow Druids, aye.~
    IF ~~ THEN REPLY ~Any other details?~ GOTO Rugos5TellMore
    IF ~~ THEN REPLY ~Can I get into problems with the Druids faction after completion of this contract?~ GOTO Rugos5Ambush
END

IF ~~ THEN BEGIN Rugos5Ambush
    SAY ~Hrm, this I cannot say fer certain, but methinks the chance of surprises be mirrored in the size of the reward, aye.~
    IF ~~ THEN REPLY ~Tell me more about them.~ GOTO Rugos5TellMore
END

IF ~~ THEN BEGIN Rugos5TellMore
    SAY ~Group be made up of a handful Druids and Rangers, shapeshifters, and a pair of elemental beings, aye.~
    IF ~~ THEN REPLY ~Where can we find him?~ GOTO Rugos5AgreedLocation
    IF ~~ THEN REPLY ~Okay, but I want a bigger share of the reward.~ GOTO Rugos5Negotitation
END

IF ~~ THEN BEGIN Rugos5AgreedLocation
    SAY ~Hrr, they be gatherin' for their ritual in Druid Groove, aye. Reward be 10000 gold, it be.~
    IF ~~ THEN REPLY ~Time to return them to more natural state of being.~ GOTO Rugos5AgreedToContract
    IF ~~ THEN REPLY ~10000 gold? That's quite a lot, but I will be spending a lot to get my reputation back up. I want more gold for this contract.~ GOTO Rugos5Negotitation
    IF ~~ THEN REPLY ~Not interested.~ GOTO Rugos5Rejected
END

IF ~~ THEN BEGIN Rugos5Negotitation
    SAY ~Hrmph! Sorry, but no more gold I can part with. However, I can offer ye some magic for fulfillin’ yer contract.~
    IF ~~ THEN REPLY ~10000 gold and magic sounds far more interesting.~ GOTO Rugos5AgreedToContract
    IF ~~ THEN REPLY ~Not enough. Farewell.~ GOTO Rugos5Rejected
END

IF ~~ THEN BEGIN Rugos5Rejected
    SAY ~Aye, 'tis clear as a mountain stream.~
        IF ~~ THEN DO
            ~SetGlobal("rqcontractGrunelensky","GLOBAL",2)~
        EXIT
END

IF ~Global("rqcontractGrunelensky","GLOBAL",2)~ THEN BEGIN Rugos5Reconsideration
    SAY ~Ye interested in doin' me contract, aye?~
    IF ~~ THEN REPLY ~Can you repeat the terms of your contract?~ GOTO Rugos5Contract
    IF ~~ THEN REPLY ~Never mind.~ GOTO Rugos5Rejected
END

IF ~~ THEN BEGIN Rugos5AgreedToContract
    SAY ~Hmmph! Good enough, they be sittin' in Druid Grove close to Trademeet, aye.~
        IF ~~ THEN DO
            ~SetGlobal("rqcontractGrunelensky","GLOBAL",1)
            SetGlobal("rqcontractHevguris","GLOBAL",4)~
            UNSOLVED_JOURNAL ~Contract: Archdruid Dubovy.

            I have agreed to disrupt ritual or destroy druids that are supposed to perform it Contractors is dwarf Rugos in Mithrest Inn. Potential opposition would consist of few Druids Rangers Shapeshifters and Elemental beings.~
        EXIT
END

IF ~Global("rqcontractGrunelensky","GLOBAL",1)~ THEN BEGIN Rugos1InitiatedBattle
    SAY ~Ach, ye return with good tidings, I trust. Is it finished now? Ritual's been disrupted, I hope.~
    IF ~!Dead("rqarcdrd") !Dead("rqpaud") !Dead("rqgrune") Global("rqcontractGrunelensky","GLOBAL",3)~ THEN REPLY ~It is done. The ritual is disrupted, but the druids live.~ GOTO Rugos5HaveProof
    IF ~!Dead("rqarcdrd")~ THEN REPLY ~Not yet. I will have to figure out how to finish the job.~ EXIT
    IF ~Dead("rqarcdrd") Dead("rqarcdrd") Dead("rqarcdrd") Global("rqcontract5battle","GLOBAL",1)~ THEN REPLY ~It is done. The ritual is disrupted, and the druids are dead.~ GOTO Rugos5HaveProof
END

IF ~~ THEN BEGIN Rugos5HaveProof
    SAY ~Hark, here be yer gold, and I be all out of contracts. Why not seek out Revans' godfather to provide more?~
        IF ~~ THEN DO
            %SetGlobal("rqcontractGrunelensky","GLOBAL",3)
            SetGlobal("rqcontractHevguris","GLOBAL",4)
            GiveGoldForce(10000)
            GiveItem("sw1h35",Player1) // Adjatha the Drinker +2
            GiveItem("quiver06",Player1) // bag of plenty
            EraseJournalEntry (~Contract: Archdruid Dubovy.

            I have agreed to disrupt ritual or destroy druids that are supposed to perform it Contractors is dwarf Rugos in Mithrest Inn. Potential opposition would consist of few Druids Rangers Shapeshifters and Elemental beings.~)
            %
            SOLVED_JOURNAL ~Assassination Contract on Archdruid Dubovy completed.

            Completed contract for disruption of druids and got 10000 gold pieces.~
        EXIT
END

IF ~Global("rqcontractbotched","GLOBAL",1)~ THEN BEGIN RugosBotched
    SAY ~No contracts at this moment, traveler. Return after thou hast received word from the courier.~
        IF ~~ THEN EXIT
END

IF ~Global("rqcontractHevguris","GLOBAL",4) Global("rqcontractGrunelensky","GLOBAL",3)~ THEN BEGIN RugosEnding
    SAY ~Hrrm, contracts be run dry, they be. Why don't ye seek out Revans' old man, his godfather, and ask for more contracts, aye?~
    IF ~~ THEN EXIT
END
// only for testing return back for normal playtrhough
/*
IF ~Global("rqcontractHevguris","GLOBAL",3) !Dead("Faldorn")~ THEN BEGIN RugosLast5ContractDruids
    SAY ~I have contacts between some strange sect named Ashbrought they are interested about Druid Grove located near Trademeet. They could give us antother contract come back later maybe it will be up.~
    IF ~~ THEN EXIT
END
*/
