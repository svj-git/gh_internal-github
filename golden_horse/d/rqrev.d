BEGIN ~rqrev~

IF ~Global("rqRevanKnowsTask","GLOBAL",0)~ THEN BEGIN FirstMeeting
    SAY ~Greetings, good <PRO_SIRMAAM>. I would like to introduce myself to you. My name is Revan Artecratos, mercenary captain, and I would like to make a business proposition to you.~
    IF ~!InParty("Jaheira")~ THEN REPLY ~What kind of proposition are talking about?~ GOTO rqProposition
    IF ~InParty("Jaheira")~ THEN REPLY ~*Suddenly his gaze notices Jaheira and his tone shifts completely* Apologies for wasting your time. I will not bore you with this silly proposal. Farewell.~
        EXIT
    IF ~!InParty("Jaheira")~ THEN REPLY ~Not interested.~ GOTO OfferGold
END

IF ~~ THEN BEGIN OfferGold
    SAY  ~Not even if I tell you that I will pay you considerable amount of gold for your time?~
    IF ~~ THEN REPLY ~Okay but make it quick.~ GOTO rqProposition
    IF ~~ THEN REPLY ~Still not interested, Farewell.~ EXIT
END

IF ~~ THEN BEGIN rqProposition
    SAY ~I would like to travel with you to protect my person from assassins.~
    IF ~~ THEN REPLY ~So what do you want from me exactly?~ GOTO ProtectionDetails
    IF ~~ THEN REPLY ~So that means there's a large bounty on your head.~ GOTO rqNoBounty
    IF ~~ THEN REPLY ~Who is after you?~ GOTO OrganizationReward
END

IF ~~ THEN BEGIN rqNoBounty
    SAY ~No bounty yet, though it may come up.~
    IF ~~ THEN REPLY ~Interesting tell me more.~ GOTO ProtectionDetails
END

IF ~~ THEN BEGIN ProtectionDetails
    SAY ~My proposal is thus: you are to protect me from my would-be assassins while we travel together, for a monetary reward~
    IF ~~ THEN REPLY ~Why don't you go directly after the people who ordered these hits on you?~ GOTO DirectlyAfterYouRevan
END

IF ~~ THEN BEGIN DirectlyAfterYouRevan
    SAY ~If I knew, I would go after them.~
    IF ~~ THEN GOTO OrganizationReward
END

IF ~~ THEN BEGIN OrganizationReward
    SAY ~I was a mercenary back in the Moonsea. That kind of profession inevitably makes you a lot of enemies.~
    IF ~~ THEN REPLY ~What skills do you have?~ GOTO rqRevanSkills
    IF ~~ THEN REPLY ~I don't care who is after you I want 20000 gold as reward.~ GOTO RewardNegotiation
    IF ~~ THEN REPLY ~Okay then I want 15000 gold.~ GOTO RewardNegotiation
    IF ~~ THEN REPLY ~12000 sounds good to me.~ GOTO RewardNegotiation
    IF ~~ THEN REPLY ~I think 10000 for such task would be sufficient.~ GOTO RewardNegotiation
    IF ~~ THEN REPLY ~On second thought you should handle your own problems.~ GOTO RejectedRevan
END

IF ~~ THEN BEGIN RejectedRevan
    SAY ~Right if you reconsider come back.~
    IF ~~ THEN DO ~SetGlobal("rqRevanKnowsTask","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN rqRevanSkills
    SAY ~I am an accomplished mage and can pick locks, remove, or set traps...~
    IF ~~ THEN GOTO RewardNegotiation
END

IF ~~ THEN BEGIN RewardNegotiation
    SAY ~Listen, I will give you 15,000 gold for my protection, no more, no less.~
    IF ~~ THEN REPLY ~Alright join my party.~
        DO
            %SetGlobal("rqrevanjoined","LOCALS",1)
            SetGlobal("rqAgreedtoJob","GLOBAL",1)
            JoinParty()%
            UNSOLVED_JOURNAL ~Protect Revan from assassins

            I have accepted mercenary contract from Revan Artecratos to protect him from assassins while he is traveling with me. As reward I am to receive 15000 gold.~
        EXIT
    IF ~~ THEN REPLY ~No I wont do it.~ EXIT
END

IF ~Global("rqRevanKnowsTask","GLOBAL",1)
    !InParty("Jaheira")~
    THEN BEGIN rqKnowRevansOfferGold
    SAY ~Greetings again. Are you interested in being hired as a mercenary for my personal protection?~
    IF ~~ THEN REPLY ~How much do you pay?~ GOTO RewardNegotiation
    IF ~~ THEN REPLY ~Maybe you could tell me why do you need protection?~ GOTO OrganizationReward
    IF ~~ THEN REPLY ~Not interested.~ EXIT
END

IF ~InParty("Jaheira")~ THEN BEGIN rqJaheirarejection
    SAY ~I am sure guarding fish ponds would not be a mercenary job you would be interested in.~
    IF ~~ THEN EXIT
END

BEGIN ~rqrevP~

IF ~Global("rqrevanjoined","LOCALS",1)~ THEN BEGIN KickOut
    SAY ~You’re kicking me out now?~
    IF ~~ THEN REPLY ~That was a mistake. Get back in the party.~
        DO ~JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~That's right, I don't want you in the party.~
        DO
            ~SetGlobal("rqrevanjoined","LOCALS",0)
            EscapeAreaMove("AR0704",135,625,13)~
        EXIT
END

IF ~Global("rqrevanjoined","LOCALS",0)~ THEN BEGIN RevanRejoiningDialogue
    SAY ~So we meet again. I feel pretty confident they will not make a move on me here. Still, I would like you to resume my protection contract.~
    IF ~~ THEN REPLY ~This has been mistake.~ EXIT
    IF ~!Inparty("Jaheira")~ THEN REPLY ~Rejoin me.~ GOTO RevanRejoins
    IF ~InParty("Jaheira")~ THEN REPLY ~Rejoin me.~ GOTO RevajoinJaheira
END

IF ~~ THEN BEGIN RevanRejoins
    SAY ~Good. This idleness was getting boring.~
    IF ~~ THEN DO
            ~SetGlobal("rqrevanjoined","LOCALS",1)
            JoinParty()~
    EXIT
END

IF ~~ THEN BEGIN RevajoinJaheira
    SAY ~Yeah, like I’ll join a group with a known Harper in it.~
    IF ~~ THEN EXIT
END


IF ~Global("rqrevanjoined","LOCALS",0)~ THEN BEGIN Rejoin
    SAY ~You have reconsidered? Are you ready to resume the protection contract?~
    IF ~~ THEN REPLY ~Yes, rejoin me.~
        DO
            ~SetGlobal("rqrevanjoined","LOCALS",1)
            JoinParty()~
        EXIT
    IF ~~ THEN REPLY ~Not yet, perhaps later.~ EXIT
END

BEGIN ~rqrevJ~

IF  ~Global("rqRevanAmbush1Reaction","GLOBAL",1)
    AreaCheck("AR0300")~
    THEN BEGIN Revan1AmbushReaction
    SAY ~So it begins.~
    IF ~~ THEN REPLY ~Who was this Prangl anyway?~ GOTO PranglAngle
    IF ~~ THEN REPLY ~Why would someone someone want you dead here? If, as you said, you spend most of your life in Moonsea?~ GOTO MoonseaAngle
    IF ~~ THEN REPLY ~How did you figured out that your life could be in danger?~ GOTO RugosKidnappingStory
    IF ~~ THEN REPLY ~Why are you so calm? Who sent them!?~ GOTO MoonseaAngle
END

IF ~~ THEN BEGIN MoonseaAngle
    SAY ~Good question that I have no answer for, as I said I have many enemies there, not here.~
    IF ~~ THEN REPLY ~Let's talk about this Prangl. Why was he after you?~ GOTO PranglAngle
    IF ~~ THEN REPLY ~Maybe it could be helpful if you elaborated on why you knew your life was in danger?~ GOTO RugosKidnappingStory
END

IF ~~ THEN BEGIN PranglAngle
    SAY ~He was one of my lieutenants. I dismissed him for incompetence. Turns out someone picked up my leftovers and sent them to kill me.~
    IF ~~ THEN REPLY ~What could be the reason for Prangl to join with people who plot your death?~ GOTO PranglAngleFurther
END

IF ~~ THEN BEGIN PranglAngleFurther
    SAY ~Revenge for public humiliation. Prangl was brave, eager, but foolish. Not the kind of person who would plot kidnapping or assassination; he would do it face to face, like now.~
    IF ~~ THEN REPLY ~You mentioned something about kidnapping?~ GOTO RugosKidnappingStory
END

IF ~~ THEN BEGIN RugosKidnappingStory
    SAY ~Someone made an attempt to kidnap one of my associates, and later Rugos, my associate, found out that someone was inquiring about my whereabouts.~
    IF ~~ THEN REPLY ~Who was your fiercest enemy in Moonsea?~ GOTO PotentialEnemies
END

IF ~~ THEN BEGIN PotentialEnemies
    SAY ~Duke Aggarath was the most powerful opponent, but with my absence he has no reason to kill me. Just doesn't make sense.~
    IF ~~ THEN DO ~SetGlobal("rqRevanAmbush1Reaction","GLOBAL",2)~
        EXIT
END

// rq reaction to ambush 2 made by ribald and pentarch
IF ~Global("rqRevanAfterAmbush2Talk","GLOBAL",2)~ THEN BEGIN RevanAfterRibaldTalk
    SAY ~<CHARNAME>, I think that merchant in Waukeen's Promenade set us up. We should talk to him.~
        IF ~~ THEN REPLY ~Do you think this ambush had anything to do with you?~ GOTO RevanConfirmsThisWasAboutHim
END

IF ~~ THEN BEGIN RevanConfirmsThisWasAboutHim
    SAY ~Likely. Let's talk to Ribald; maybe we could get some admission from him.~
    IF ~~ THEN DO ~SetGlobal("rqRevanAfterAmbush2Talk","GLOBAL",3)~ EXIT
END

IF  ~Global("rqRevanAfterAccusingRibald","GLOBAL",3)
    Global("rqRevanAfterAmbush2Talk","GLOBAL",3)
    !AreaCheck("AR0702")~
    THEN BEGIN rqrevjinterjection
    SAY ~You know he was lying, right?~
    IF ~~ THEN REPLY ~How would you know?~ GOTO rqRepliedIdiocy
    IF ~~ THEN REPLY ~I actually believe him.~ GOTO rqRepliedIdiocy
    IF ~~ THEN REPLY ~What are you talking about?~ GOTO rqRepliedIdiocy
    IF ~~ THEN REPLY ~Yes, but I just couldn't kill him there with all these witnesses.~ GOTO rqRepliedThreat
END

IF ~~ THEN BEGIN rqRepliedThreat
    SAY ~Very smart. Perhaps we shall find a way to get back at him.~
    IF ~~ THEN REPLY ~Sure but this was not the last ambush.~ GOTO RevanSaysWatchYourBack
END

IF ~~ THEN BEGIN rqRepliedIdiocy
    SAY ~He knew far more than he let on. Nobody could have believed that stupid cover story he spun, or...~
    IF ~~ THEN REPLY ~ His story is very implausible. Recall the whole theater that he played for us.~ GOTO RevanSaysWatchYourBack
    IF ~~ THEN REPLY ~We just don't know; we have very little in terms of proof of his treachery.~ GOTO RevanSaysWatchYourBack
END

IF ~~ THEN BEGIN RevanSaysWatchYourBack
    SAY ~We should be extra careful; our enemies are very powerful if they have the ability to corrupt rich and influential men like Ribald.~
    IF ~~ THEN REPLY ~Yes we will.~ GOTO PartingWords
    IF ~~ THEN REPLY ~We shall see.~ GOTO PartingWords
    IF ~Global("rqContractsRugosAvailable","GLOBAL",3)~ THEN REPLY ~Yes we will.~ GOTO PartingWordsProtectionContractEnded
    IF ~Global("rqContractsRugosAvailable","GLOBAL",3)~ THEN REPLY ~We shall see.~ GOTO PartingWordsProtectionContractEnded
END

IF ~~ THEN BEGIN PartingWords
    SAY ~Powerful our enemies are, yet they do not act directly, which implies weakness. Anyway, your gold will be well earned, <CHARNAME>.~
        IF ~~ THEN DO ~SetGlobal("rqRevanAfterAccusingRibald","GLOBAL",4)~
            UNSOLVED_JOURNAL ~Protect Revan from assassins

            Ribald Barterman story is plausible though what he would gain or why he would join assassination plot on my companion I do not know. This whole thing does not make any sense.~
        EXIT
END

IF ~~ THEN BEGIN PartingWordsProtectionContractEnded
    SAY ~That Ribald must be a Harper; he does have perfect cover to be one. Yet I would suggest not confronting him about it, as I wish to use *him* and his Harper connections later.~
        IF ~~ THEN DO ~SetGlobal("rqRevanAfterAccusingRibald","GLOBAL",4)~
        EXIT
END

// Ambush 3 reaction
IF  ~Global("rqRevanAmbush3Reaction","GLOBAL",1)
    AreaCheck("AR0900")~
    THEN BEGIN Revan3AmbushReaction
    SAY ~Same color and equipment as the men from previous encounters. These mercenaries must be quite angry by now.~
    IF ~~ THEN REPLY ~Well, I can imagine.~ GOTO MercenariesAnger3
    IF ~~ THEN REPLY ~No change at all. Still stoic and level-headed.~ GOTO BewildermentOnRevanBehaviour
    IF ~~ THEN REPLY ~Any other insights?~ GOTO MercenariesAnger3
    IF ~~ THEN REPLY ~You think they might change strategy?~ GOTO MercenariesAnger3
    IF ~CheckStatGT(Player1,14,INT)~ THEN REPLY ~Great. If true, this might cause them to make mistakes.~ GOTO RevanCommendsOnYourIntellect
END

IF ~~ THEN BEGIN MercenariesAnger3
    SAY ~This might force them to make hasty decisions and perhaps then the enemy will reveal himself.~
    IF ~~ THEN GOTO RevanRetellsReward1
END

IF ~~ THEN BEGIN BewildermentOnRevanBehaviour
    SAY ~I am a mercenary and old, even by elven standards. Running around panicking would solve none of my problems.~
    IF ~~ THEN GOTO RevanRetellsReward1
END

IF ~~ THEN BEGIN RevanCommendsOnYourIntellect
    SAY ~Very smart. Hopefully, it will.~
    IF ~~ THEN GOTO RevanRetellsReward1
END

IF ~~ THEN BEGIN RevanRetellsReward1
    SAY ~Anyway, your 15000 gold pieces will be well earned.~
    IF ~~ THEN
        DO ~SetGlobal("rqRevanAmbush3Reaction","GLOBAL",2)~
    EXIT
END

// reaction after esslin and groskhnakh death create baf file in Revan personal script
IF  ~PartyHasItemIdentified("rqminlet") // mintipers letter
    Global("rqwaukenambush4","GLOBAL",1)
    Global("rqRevanMintiper","GLOBAL",2)
    !InParty("jaheira")
    InParty("rqrev")
    !Dead("rqrev")
    ~
    THEN BEGIN RevanHarpersTalk
    SAY ~I think we finally have the name: Mintiper Moonsilver, a man I know from Moonsea.~
    IF ~~ THEN REPLY ~Who is this Mintiper?~ GOTO RevanHarper
END

IF ~~ THEN BEGIN RevanHarper
    SAY ~Two corpses here are wearing Harper amulets, unless they stole them or killed their agents... It's the Harpers that want me dead.~
    IF ~~ THEN REPLY ~Then we must negotiate with them. This has to stop.~ GOTO RevanNegotiateHarpers
    IF ~~ THEN REPLY ~Why would they go after you?~ GOTO RevanWhyAttackYou
    IF ~~ THEN REPLY ~If they keep coming well keep killing~ GOTO RevanBloodlust
END

IF ~~ THEN BEGIN RevanNegotiateHarpers
    SAY ~We should talk to my good friend Fougier in the Mithrest Inn; he might have information about him. Given the time between ambushes, I suspect they do not have a base in Athkatla, but nearby.~
    IF ~~ THEN DO ~SetGlobal("rqRevanMintiper","GLOBAL",3)~
            UNSOLVED_JOURNAL
            ~Protect Revan from assassins

            It is certain that Mintiper who is likely a Harper is responsible for these ambushes that I have been subjected. Revan has suggested to talk to Fougier in Mithrest in order to find Mintiper.~
        EXIT
END

IF ~~ THEN BEGIN RevanWhyAttackYou
    SAY ~Well, we caught and executed a Harper spy back in Moonsea; the fool had the same amulet as one of the corpses here. Not much happened for months, but when I accepted a contract for burglary of an alchemist, things went bad quickly.~
    =
    ~While preparing for the burglary job, I was apprehended, put before a court, and sentenced for a burglary I had not yet committed!~
    =
    ~I busted out of prison and arrived here. Thinking back and seeing these Harper amulets, I think both events are interconnected.~
    IF ~~ THEN REPLY ~But why would they want you dead, and why come after you all the way from Moonsea?~ GOTO RevanWhyDead
    IF ~~ THEN REPLY ~How does Mintiper fit into this?~ GOTO RevanHarpersDiscovery
    IF ~~ THEN REPLY ~Enough questions lets move forward.~ GOTO RevanNegotiateHarpers
END

IF ~~ THEN BEGIN RevanWhyDead
    SAY ~Well, we did kill one of their agents. All I know is that one named Mintiper, who signed this letter, was working for one of the opposing nobles. But I did not know he specifically was a Harper.~
    IF ~~ THEN REPLY ~It still doesn't make sense why they would go so hard after you all the way from Moonsea.~ GOTO RevanNoSense
    IF ~~ THEN REPLY ~Enough questions lets move forward.~ GOTO RevanNegotiateHarpers
END

IF ~~ THEN BEGIN RevanNoSense
    SAY ~True, there should be more to this, but can you see inside the mind of Mintiper?~
    IF ~~ THEN GOTO RevanNegotiateHarpers
END

IF ~~ THEN BEGIN RevanHarpersDiscovery
    SAY ~Mintiper was working for one of the opposing nobles. I am assuming he got the task of eliminating me.~
    IF ~~ THEN REPLY ~Enough questions lets move forward.~ GOTO RevanNegotiateHarpers
END

IF ~~ THEN BEGIN RevanBloodlust
    SAY ~Regardless, we must find them and strike a blow at their base.~
    IF ~~ THEN GOTO RevanNegotiateHarpers
END

// Going after Mintiper in Umar Hills EXTERN from rqfougi
IF ~~ THEN BEGIN MintiperEncounterToCome
    SAY ~Maybe Mintiper's death will stop this and I shall have some peace.~
    IF ~~ THEN DO ~SetGlobal("rqRevanMintiper","GLOBAL",5)~
        UNSOLVED_JOURNAL
            ~Protect Revan from assassins

            I have now location of man who hired assassins on Revan someone named Mintiper. He is supposed to be in Umar Hills.~
        EXIT
END

// reaction after Mintiper dies and you are out of umar hills
IF ~Global("rqrevanmintiper","GLOBAL",5)
    Global("rqContractsRugosAvailable","GLOBAL",2)
    Dead("rqmintip")
    ~
    THEN BEGIN RevanProposal
    SAY ~With Mintiper's death I am free from Harper plots.. you cannot imagine how freeing this is. Lets go to Mithrest Rugos will give you your gold there.~
    =
    ~Hear out my next offering for you <CHARNAME> this will make us both rich.~
    IF ~~ THEN REPLY ~Rich? lets hear it.~ GOTO RevanMercenaryRestart
    IF ~~ THEN REPLY ~According to this Mintiper's journal he will have someone to continue his *work*.~ GOTO MintiperWillContinue
END

IF ~~ THEN BEGIN MintiperWillContinue
    SAY ~That is troubling indeed. Still I do stand by my word. If you want your earned gold come and talk to Rugos in Mithrest.~
    =
    ~I do have another proposal that can weigh down your purse.~
        IF ~~ THEN GOTO RevanMercenaryRestart
END

IF ~~ THEN BEGIN RevanMercenaryRestart
    SAY ~I wish to restart my mercenary business. Fear not I shall not bore you with simple caravan escorting and the like.~
        IF ~~ THEN GOTO RevanMercenaryExplain
END

IF ~~ THEN BEGIN RevanMercenaryExplain
    SAY ~My business will only take contracts of more shall we say lucrative nature. That's where our party could come in.~
    IF ~~ THEN REPLY ~Depends on payment.~ GOTO RevanContract
    IF ~~ THEN REPLY ~Sounds very interesting.~ GOTO RevanContract
    IF ~~ THEN REPLY ~No we don't have time for this.~ GOTO RevanMercJobRejected
END

IF ~~ THEN BEGIN RevanContract
    SAY ~My associate Rugos will be in Mithrest Inn.~
    IF ~~ THEN REPLY ~Agreed but it depends on reward.~ GOTO RevanAgreedToSeeRugos
    IF ~~ THEN REPLY ~On second thought we don't have time for this.~ GOTO RevanMercJobRejected
END

IF ~~ THEN BEGIN RevanMercJobRejected
    SAY ~I understand.~
    IF ~~ THEN DO
        ~SetGlobal("rqcontractMarcian","GLOBAL",2) // rejected contract
        SetGlobal("rqContractsRugosAvailable","GLOBAL",3)~ // rejected in dialogue with Revan
    EXIT
END

IF ~~ THEN BEGIN RevanAgreedToSeeRugos
    SAY ~Rugos will have all the details he is in Mithrest Inn.~
    IF ~~ THEN DO ~SetGlobal("rqContractsRugosAvailable","GLOBAL",3)~
            UNSOLVED_JOURNAL ~New mercenary work for me?

            Revan has more mercenary work for me. If I am interested, I should go to Mithrest Inn in Waukeen's Promenade.~
            UNSOLVED_JOURNAL ~Protect Revan from assassins

            To receive my reward for escorting Revan Artecratos, I should talk to Rugos in Mithrest.~
        EXIT
END

// Harper first Jaheira ambush reaction
IF ~Global("rqJaheira1AmbushReaction","GLOBAL",1)~ THEN BEGIN HarperChangeOfPlans
    SAY ~Looks like I read them wrong. I understood this as personal Mintiper's revenge... <CHARNAME> let us continue traveling together; this whole thing will have to resolve itself.~
    =
    ~Jaheira, she was your companion, was she? Yet, she readily betrayed you to Harpers. What do you think of this?~
    IF ~~ THEN REPLY ~Betrayal comes naturally to those who value perception of themselves above all else.~ GOTO JaheiraBad
    IF ~~ THEN REPLY ~I am saddened by her behavior after all that we have been through together.~ GOTO EndingofPrattle1
    IF ~~ THEN REPLY ~I do not wish to talk about this.~ GOTO EndingofPrattle1
    IF ~~ THEN REPLY ~About her? I do not think of her at all.~ GOTO JaheiraBad
END

IF ~~ THEN BEGIN JaheiraBad
    SAY ~Interesting, I expected you to answer thus. Shall we continue?~
    IF ~~ THEN REPLY ~Nothing, let's just move on.~ GOTO EndingofPrattle1
    IF ~~ THEN REPLY ~I want gold for furthering of your protection contract.~ GOTO RevanWantsGold
END

IF ~~ THEN BEGIN RevanWantsGold
    SAY ~I cannot afford to pay in gold but Harpers are rich so there will be possibility of loot and you can utilize my magical and thieving talents.~
    IF ~~ THEN REPLY ~Lets continue our journey.~ GOTO EndingofPrattle1
    IF ~~ THEN REPLY ~That's not enough.~ GOTO EndOfJourney
END

IF ~~ THEN BEGIN EndingofPrattle1
    SAY ~Meaningless prattle serves no one. Let us get a move on.~
    IF ~~ THEN DO ~SetGlobal("rqJaheira1AmbushReaction","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN EndOfJourney
    SAY ~Then we shall part ways. Farewell.~
    IF ~~ THEN
        DO ~SetGlobal("rqrevanjoined","LOCALS",0)
            EscapeAreaMove("AR0704",135,625,13)
            SetGlobal("rqJaheira1AmbushReaction","GLOBAL",2)~
        EXIT
END

// Dermin death leave attempt
IF ~Global("rqJaheira4AmbushReaction","GLOBAL",1)~ THEN BEGIN DerminsEnd
    SAY ~Given the letter, I suspect Harpers might not send more assassins after me, but one can never know with them.~
    IF ~~ THEN REPLY ~Is your leadership in your mercenary company secure?~ GOTO YourCompany
    IF ~~ THEN REPLY ~Why do you travel with me?~ GOTO WhyAreYouWithMe
END

IF ~~ THEN BEGIN YourCompany
    SAY ~Well, I trust Rugos and Fougier, and I know each other from Moonsea, and even if they backstabbed me, I do have a few countermeasures in place.~
    IF ~~ THEN REPLY ~Why do you follow me then?~ GOTO WhyAreYouWithMe
END

IF ~~ THEN BEGIN WhyAreYouWithMe
    SAY ~Listen, I am old but not that old, and traveling with you made me realize that there is power in your wake, <CHARNAME>. And power is necessary for my future endeavors.~
    IF ~~ THEN REPLY ~I think I understand your motive now.~ GOTO UnderstandWhyRevanIsWithYou
    IF ~~ THEN REPLY ~That is fine, but only if you do not wish to wield it against me.~ GOTO CHARNAMEHasDestiny
    IF ~~ THEN REPLY ~Morality is my measure of character, and since you show none of that, you should leave.~ GOTO LeaveCharnameISMoral
END

IF ~~ THEN BEGIN UnderstandWhyRevanIsWithYou
    SAY ~Well then shall we cease our word exchange?~
    IF ~~ THEN REPLY ~Lets continue our travels then.~ GOTO SimilarToCharname
    IF ~~ THEN REPLY ~I will be watching you.~ GOTO ShowingLoyalty
    IF ~~ THEN REPLY ~Proper morality is most important for my companions. So with your lust for power you have no place in my party.~ GOTO LeaveCharnameISMoral
END

IF ~~ THEN BEGIN CHARNAMEHasDestiny
    SAY ~Oh, there is no way in hell I would challenge <PRO_MANWOMAN> with a destiny like yours.~
    IF ~~ THEN REPLY ~Enough of nonsense; let us continue with our travels.~ GOTO SimilarToCharname
    IF ~~ THEN REPLY ~If you do anything suspicious...~ GOTO ShowingLoyalty
    IF ~~ THEN REPLY ~Proper morality is most important for my companions. So with your lust for power you have no place in my party.~ GOTO LeaveCharnameISMoral
END

IF ~~ THEN BEGIN ShowingLoyalty
    SAY ~I am certain that I *will* have opportunities to show my loyalty to you.~
    IF ~~ THEN DO ~SetGlobal("rqJaheira4AmbushReaction","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN SimilarToCharname
    SAY ~We have arrived at understanding then.~
    IF ~~ THEN DO ~SetGlobal("rqJaheira4AmbushReaction","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN LeaveCharnameISMoral
    SAY ~If this is what you want...~
    IF ~~ THEN
        DO ~SetGlobal("rqJaheira4AmbushReaction","GLOBAL",2)
            SetGlobal("rqrevanjoined","LOCALS",0)
            EscapeArea()~
        EXIT
END

// Mintiper is dead give CHARNAME his reward
IF ~~ THEN BEGIN ProtectionContractFinished
    SAY ~Give <CHARNAME> <PRO_HISHER> reward our enemy is dead.~
    IF ~~ THEN DO
            %EraseJournalEntry(~Protect Revan from assassins

            I have accepted mercenary contract from Revan Artecratos to protect him from assassins while he is traveling with me. As reward I am to receive 15000 gold.~)

            EraseJournalEntry(~Protect Revan from assassins

            Ribald Barterman story is plausible though what he would gain or why he would join assassination plot on my companion I do not know. This whole thing does not make any sense.~)

            EraseJournalEntry(~Protect Revan from assassins

            Messenger in Waukeens Promenade has passed on to me invitation to appear in northwest near stall, outside the promenade itself to discuss peace. I smell an ambush.~)

            EraseJournalEntry(~Protect Revan from assassins

            It is certain that Mintiper who is likely a Harper is responsible for these ambushes that I have been subjected. Revan has suggested to talk to Fougier in Mithrest in order to find Mintiper.~)

            EraseJournalEntry(~Protect Revan from assassins

            I have now location of man who hired assassins on Revan someone named Mintiper. He is supposed to be in Umar Hills.~)

            EraseJournalEntry(~Protect Revan from assassins

            To receive my reward for escorting Revan Artecratos, I should talk to Rugos in Mithrest.~)
            %
        EXTERN ~rqrugos~ Rugos1ContractProlog
END

CHAIN ~rqrevJ~ RevanVSMintiper // 16
~What a nice bunch you are. Just for the record, say you acted preemptively.~
== rq5minti
~Yes, and I don't regret anything. We would do it again! Filthy mercenaries, we were already on your tail for other things you have done! IT WAS preemptive action!~
== rqrevJ
~Amusing. Do tell us more.~
== rq5minti
~He raided and murdered through countryside for cruel noble Ledrael, leaving a trail of destruction through the countryside...~
== rqrevJ
~Ridiculous! Your pinning of alchemist's robbery on me; you hoped to turn Ledrael against me and disrupt his campaign.~
=
~You are not some righteous group; you are just one of the power struggle players. If I recall correctly, you had ties with Ledrael's enemies!~
== rq5minti
~If your elimination would have ceased these raids, it would have been worth it!~
== rqrevJ
~Oh, now I get it. Your *friend* Raymond, my *successor*, had help from you. I know what he did to that small town near Hulburg. Everyone was put to sword: men, women, children.~
=
~Which explains why you are here. With my death your involvement in this failed plot will never surface...~
END
IF ~~ THEN EXTERN ~rq5minti~ MintiperAttack // 17

// Belmin Gergas reaction
/*
IF ~~ THEN BEGIN RevanAnswerToBelmin
    SAY ~Dog that barks doesn't bite.~
        //IF ~~ THEN EXTERN ~BELMIN~ BelminsFinalWords
END
IF ~~ THEN EXTERN ~BELMIN~ BelminsFinalWords
*/

// InParty Prattle
CHAIN IF ~InParty("Korgan")
        See("Korgan")
        !StateCheck("Korgan",STATE_SLEEPING)
        Global("rqRevKorganBackstabs","LOCALS",0)~ THEN BKORGAN backstabs
    ~Me thought yer be softie elf but I see the wicked streak in ye.~
DO ~SetGlobal("rqRevKorganBackstabs","LOCALS",1)~
== rqrevJ ~So you want to be "friend" why? Or perhaps you are trying to judge me if I would backstab you in future inappropriate moment?~
 == rqrevJ ~So you want to be *friend*, why? Or perhaps you are trying to judge whether I would backstab you at an inappropriate moment moment in the future?~
== BKORGAN ~Nay but ye be guessin' my intents clearly.~
EXIT

CHAIN IF ~InParty("Edwin")
        See("Edwin")
        !StateCheck("Edwin",STATE_SLEEPING)
        Global("rqRevEdwinAmul","LOCALS",0)~ THEN BEDWIN amulet
    ~Moonsea has its share of ancient ruins. By chance, have you explored some of them?~
DO ~SetGlobal("rqRevEdwinAmul","LOCALS",1)~ // Here I thought it
== rqrevJ ~No, not really, but I did burglarize mages in a few of Moonsea cities. If I understand your question.~
== BEDWIN ~Tell me, what have you found? Treasure troves of arcane wisdom, ancient Netheril artifacts, or was it forbidden tomes of Necromancy?~
== rqrevJ ~Just some lower-level scrolls, nothing really ancient or secret.~
== BEDWIN ~Blast it!~
EXIT

CHAIN IF ~InParty("Viconia")
        See("Viconia")
        !StateCheck("Viconia",STATE_SLEEPING)
        Global("rqRevViconia","LOCALS",0)~ THEN BVICONI flattery
    ~I have been observing Darthiir you are... yet you are not shackled by foolish morals like most of your kind.~
DO ~SetGlobal("rqRevViconia","LOCALS",1)~
== rqrevJ ~Why the compliments?~
== BVICONI ~It is quite refreshing to see surfacer like yourself. Perhaps you have some drow blood in your lineage?~
== rqrevJ ~Not sure what you mean about drow, so keep it to yourself.~
== BVICONI ~As you wish Jaluk.~
EXIT

CHAIN IF ~InParty("Keldorn")
        See("Keldorn")
        !StateCheck("Keldorn",STATE_SLEEPING)
        Global("rqRevKeldorn","LOCALS",0)~ THEN BKELDOR redemption
    ~You reek of evil elf perhaps you should reconsider your ways. I have seen many a criminals to reform for the better after their time in dungeons.~
DO ~SetGlobal("rqRevKeldorn","LOCALS",1)~
== rqrevJ ~I am uninterested in your opinions, paladin~
== BKELDOR ~Perhaps if you would reconsider your vile attitude, your future afterlife might not be so damning.~
== rqrevJ ~While you're pretending concern over my afterlife is touching, I can't fathom why in Nine Hells you're just talking to me. Shouldn't you be more like *Imitates Keldorn's gruff voice* "I can sense your evil, fiend. Have at thee!"~
== BKELDOR ~So none of your gentler elven heritage remains?~
== rqrevJ ~I was raised by humans. The difference between you and me is your concern for the afterlife and your usage of *righteousness* to cover up your thirst for killing.~
== BKELDOR ~I do no such thing, fiend!~
== rqrevJ ~You kill just as well as I do, but I do not pretend anything. I *know* that I am evil.~
== BKELDOR ~I shall not let my honor be slandered! One more word from your black mouth, and I shall end you where you stand!~
== rqrevJ ~Calm down paladin!~
== BKELDOR ~<CHARNAME>! I shall tolerate this fiend for now, but if I see any evil from him, I shall deliver divine justice.~
EXIT

CHAIN IF ~InParty("Valygar")
        See("Valygar")
        !StateCheck("Valygar",STATE_SLEEPING)
        Global("rqRevValygar","LOCALS",0)~ THEN BVALYGA magepower
    ~I have been observing you for quite a while now and see no signs of magic corruption.~
DO ~SetGlobal("rqRevValygar","LOCALS",1)~
== rqrevJ ~Why would I be corrupted by the tool?~
== BVALYGA ~My mother was twisted by magic power and had to kill her before she did more harm.~
== rqrevJ ~There's plenty of mages who are quite sane, and given what you have just said, I think the problem lies in susceptibility of your bloodline to be corrupted by magic.~
== rqrevJ ~Things are rarely black and white, although I would admit that power corrupts, and magic is certainly a source of power. Ultimately, handling power depends on the type of personality. So, if you want to conquer your fear of magic, you should start to study it.~
== BVALYGA ~I have no intention to study magic!~
== rqrevJ ~Running away is one way to solve your problem, and in your case, it works.~
== BVALYGA ~Thank you for your insights. I have much to ponder upon, but I am not running from my problem as I am containing it.~
== rqrevJ ~No, that would be studying magic and being sane.~
== BVALYGA ~Here we disagree. I know that my way is for the better.~
== rqrevJ ~Suit yourself.~
EXIT

CHAIN IF ~InParty("Anomen")
        See("Anomen")
        !StateCheck("Anomen",STATE_SLEEPING)
        Global("rqRevAnomen","LOCALS",0)~ THEN BANOMEN mercleader
    ~Mercenary, you had leadership experience. Tell me, how did you handle lowlifes that are attracted to this type of work?~
DO ~SetGlobal("rqRevAnomen","LOCALS",1)~
== rqrevJ ~I can see where this will be going, but I shall entertain the answer.~
== rqrevJ ~The key is to be seen as a provider of things they want, be it gold, females, or a decent existence.~
== BANOMEN ~Hpmh! Without knightly virtues, you would be captain of just another band of cutthroats and bandits.~
== rqrevJ ~Sure, sir knight noble, I was leader of a mercenary company, not of our god. Shall reward you in afterlife knightly company?~
== BANOMEN ~Watch your tongue elf!~
== rqrevJ ~Typical.~
EXIT

CHAIN IF ~InParty("Cernd")
        See("Cernd")
        !StateCheck("Cernd",STATE_SLEEPING)
        Global("rqRevCernd","LOCALS",0)~ THEN BCERND herbal
    ~Centrinelia is very good for easing stomach aches.~
DO ~SetGlobal("rqRevCernd","LOCALS",1)~
== rqrevJ ~There's nothing wrong with my stomach.~
== BCERND ~But I saw you looking over my shoulder when I was gathering it.~
== rqrevJ ~I am quite good with first aid and some basic medicine regarding common battlefield wounds, but I know nothing about other applications.~
== BCERND ~Perhaps I can teach you more if you're interested?~
== rqrevJ ~Maybe I will call upon that later, druid.~
EXIT

CHAIN IF ~InParty("Aerie")
        See("Aerie")
        !StateCheck("Aerie",STATE_SLEEPING)
        Global("rqRevAerie","LOCALS",0)~ THEN BAERIE child
    ~Do you worship any god?~
DO ~SetGlobal("rqRevAerie","LOCALS",1)~
== rqrevJ ~No, child, I do not.~
== BAERIE ~I'm not a child.~
== rqrevJ ~You look like a child, you act like a child, so what do you want, child?~
== BAERIE ~F... F... Forget it then.~
EXIT

CHAIN IF ~InParty("HaerDalis")
        See("HaerDalis")
        !StateCheck("HaerDalis",STATE_SLEEPING)
        Global("rqRevHaerDalis","LOCALS",0)~ THEN BHAERDA story
    ~Underneath that rough exterior, there must be something more than you let on, my gold-seeking hawk of war. Perhaps you have a story to tell? Glorious victories, powerful enemies vanquished, maybe treasures of gold?~
DO ~SetGlobal("rqRevHaerDalis","LOCALS",1)~
== rqrevJ ~Hmph, I will tell you a story then.~
== rqrevJ ~I will tell you about my first contract. The goal was to kill or capture Thereus of Geshwein, who at that time was terrorizing Badlguen. I only had one captive from Thereus's company.~
== rqrevJ ~After very gentle persuasion with pincers and fire, he gave up the location of the camp, but I knew the place well. It was in very difficult terrain with ruined field fortifications.~
== rqrevJ ~Attacking them in forest fortification was foolishness, so I let our bandit captive overhear my fake conversation about a traveling Guild master from Badlguen to deceive him about my intentions and arranged his escape.~
== rqrevJ ~As I expected bandits left the fortifications to ambush the Guild master, but part of my company was noticed by the bandits, so I was faced with option of retreating or attacking.~
== rqrevJ ~So I decided to attack. Due to the fight being in a mountainous forest, I chose to attack their right wing before enemy could concentrate. The attack on their right wing was successful, and I routed the more numerous enemy.~
== rqrevJ ~But I could not destroy the more numerous bandits in subsequent attack so had to withdraw my company.~
== rqrevJ ~Small victory but I could not destroy the more numerous bandits completely if I ordered followup attack, so I had to withdraw my company.~
== rqrevJ ~Later, we found out bandits executed my former captive, which led to the murder of Thereus of Geshwein, and without their leader bandit group dispersed on its own.~
== rqrevJ ~This is how I earned my first gold from mercenary endeavor.~
== BHAERDA ~That was quite a story, my hawk. Would you mind if I changed a few elements here and there and used it for my play?~
== rqrevJ ~Whatever, but if I hear an unflattering portrayal of my person...~
== BHAERDA ~I shall not user your name in my play of this I swear.~
EXIT

CHAIN IF ~InParty("Jaheira")
        See("Jaheira")
        !StateCheck("Jaheira",STATE_SLEEPING)
        Global("rqRevJaheira","LOCALS",0)~ THEN BJAHEIR greedymerc
    ~What wouldn't you do for gold?~
DO ~SetGlobal("rqRevJaheira","LOCALS",1)~
== rqrevJ ~That's not the proper question.~
== BJAHEIR ~I see how much the proper one wouldn't it?~
== rqrevJ ~I tire of this conversation.~
== BJAHEIR ~Your brusque manner betrays something dark about you mercenary.~
EXIT

CHAIN IF ~InParty("Jan")
        See("Jan")
        !StateCheck("Jan",STATE_SLEEPING)
        Global("rqRevJansen","LOCALS",0)~ THEN BJAN janstory
    ~Did I ever tell you about Uncle Simple?~
DO ~SetGlobal("rqRevJansen","LOCALS",1)~
== rqrevJ ~No you didn't~
== BJAN ~He was a turnip artist; he could make tiny statues. In the previous winter, he caught the attention of mage Tlesk. Grumpy mage he was, and my uncle entered into his service making turnip statues.~
== rqrevJ ~Hahaha that was a good one!~
== BJAN ~But I wasn't finished with the story.~
== rqrevJ ~Now let me tell you a story about my uncle Nonsense. He sought to bore to the center of Toril with slaves. So he started digging, little did he know about the danger he was approaching.
One day, his slaves would dig into the cavern of evil turnips. My uncle was a mage of no small power, but even then, abandoned by his slave, he nevertheless defeated the evil turnip army. He would return to the surface and assemble an adventuring group with whom he descended back into the cavern. But no longer was the cavern infested with evil turnips; it was infested with good turnip automatons. So my uncle joined them in merriment, celebrating the defeat of the evil turnips, and the good turnips would feast upon turnip stew, turnip sweets, and turnip steaks.
But after a while, Nonsense would see that something was amiss with the good turnip automatons. They would start to polymorph into evil turnips, and once again, he would have to battle the evil turnips. This time, easily victorious, he would...~
== rqrevJ ~Hey, are you listening to me, Jansen?~
== BJAN ~Yes, I was, but these Flasher Bruiser Mates seemed damaged; I had to dispose of them quickly.~
== rqrevJ ~You sure don't like the taste of your own medicine gnome.~
EXIT



CHAIN IF ~InParty("Mazzy")
        See("Mazzy")
        !StateCheck("Mazzy",STATE_SLEEPING)
        Global("rqRevMazzy","LOCALS",0)~ THEN BMAZZY evilmerc
    ~Your cruel eyes have certainly seen evil deeds.~
DO ~SetGlobal("rqRevMazzy","LOCALS",1)~
== rqrevJ ~Trading words with pretend paladins is not high on my list of desired activities.~
== BMAZZY ~Evil comes in many forms and yours is quite visible and disturbing.~
== rqrevJ ~Nice compliments, half-female. Why don't you scurry to some hole you crawled out of and leave my mind power to deal with more important subjects.~
== BMAZZY ~Fiend, I'll be watching you, and if you try to hurt someone, I'll be there to stop you..~
== rqrevJ ~Here, I thought that good people do not make threats like evil bad people, but I guess I was wrong. You and I have much in common.~
== BMAZZY ~We don't have anything in common! And mark my words, fiend!~
EXIT

CHAIN IF ~InParty("Nalia")
        See("Nalia")
        !StateCheck("Nalia",STATE_SLEEPING)
        Global("rqRevNalia","LOCALS",0)~ THEN BNALIA naliaorigins
    ~Artecratos?? That sounds like a noble name.~
DO ~SetGlobal("rqRevNalia","LOCALS",1)~
== rqrevJ ~My adopted father was human, and he gave me my name. It's not a noble title; it signifies a given title.~
== rqrevJ ~Originally it was pronounced differently and meant excellence in strength, although my soldiers have shortened it because it was difficult to pronounce.~
== BNALIA ~What happened to you father?~
== rqrevJ ~He is dead.~
== BNALIA ~I am sorry about your loss. How did he pass away?~
== rqrevJ ~Do you really need to know my familial history?~
== BNALIA ~I was just curious since you speak so little about yourself.~
EXIT

CHAIN IF ~InParty("Yoshimo")
        See("Yoshimo")
        !StateCheck("Yoshimo",STATE_SLEEPING)
        Global("rqRevYoshimo","LOCALS",0)~ THEN BYOSHIM yoshiact
    ~What a beautiful day, isn't it?~
DO ~SetGlobal("rqRevYoshimo","LOCALS",1)~
== rqrevJ ~Yes, it is.~
== BYOSHIM ~You are quite an accomplished rogue, Sir Revan. If your time would allow, could you teach me that pickpocketing trick you tried on that pompous noble?~
== rqrevJ ~I'm not a sir, and I failed, you remember? Why would you want to learn that particular trick?~
== BYOSHIM ~Because it holds much promise, and I don't often get to learn from masters of the craft.~
== rqrevJ ~It was supposed to be used with magic. I would enchant an item and then try to distract the mark, so it would be of no use to you.~
== BYOSHIM ~Still, I must persist. Please teach me.~
== rqrevJ ~Over time, I have learned that people who are always friendly and do not offend anyone... they are the most fraudulent of all. Hmm?~
== BYOSHIM ~Err.~
== rqrevJ ~Maybe you could have pulled this off if I were the first person you talked to, but not after seeing you in action. Let me tell you one thing: I don't trust you one bit.~
== BYOSHIM ~My sincerest apologies to you. I shall bother you no more.~
EXIT
