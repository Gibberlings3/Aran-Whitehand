


BEGIN ~C-AWSAGE~  /* Teldra's Contact: Sage */
BEGIN ~C-SUMMON~  /* Sage's Summons */


/* quest sage information*/

APPEND ~C-AWSAGE~


  3 = met with contact        Global("c-arancontract","GLOBAL",3)  set by C-AWSAGE.DLG
  4 = resolution              Global("c-arancontract","GLOBAL",4)  set by C-AWSAGE.DLG
  5 = contact surrendered     Global("c-arancontract","GLOBAL",5)  set by 
  6 = resolved peaceably      Global("c-arancontract","GLOBAL",6)  set by  -> quest reward 3
  7 = resolved fighting       Global("c-arancontract","GLOBAL",7)  set by   -> quest reward 2
  8 = contact killed          Global("c-arancontract","GLOBAL",8)  set by  -> quest reward 1
  
IF ~NumTimesTalkedTo(0)~ THEN BEGIN starting_state_sage
  SAY ~[C-AWSAGE] What gives you the right to disturb my work with those dirty boots and unwashed minds?~
  ++ ~[PC] My apologies. I will leave you to your thinking.~ + forget_me_now
  ++ ~[PC] I have come to request use of your talent. I have heard sages can get information, for a price.~ + ask_a_question
  + ~Global("c-arancontract","GLOBAL",1)~ +  ~[PC] Actually, I have heard that there is a contract available, and you might be the person to talk to. I just haven't decided whether to take it.~ + should_i_take_it
  + ~Global("c-arancontract","GLOBAL",2)~ +  ~[PC] I am here to protect you. Teldra sent me.~ + i_have_taken_it
  ++ ~[PC] Books and scrolls everywhere, and yest you have managed to remain ignorant of simple interaction and communication. That takes dedication.~ + less_than_impressive
END

IF ~~ THEN BEGIN forget_me_now
  SAY #28661 /* ~Then I shall forget you were ever here. Actually, it is an astoundingly easy thing to do.~ */
  IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
END

IF ~~ ask_a_question
  SAY ~[C-AWSAGE] I have no time to spare for your questions, and you could not afford my rates even if I did. Now leave, before I call for assistance.~
  ++ ~[PC] My apologies. I will leave you to your thinking.~ DO ~SetNumTimesTalkedTo(0)~ + forget_me_now
  ++ ~[PC] I was sent here to...~ + less_than_impressive
  ++ ~[PC] Do they teach all of you sages to behave like this, or you all naturally rude?~ + c_sage_dont_know_crap
  ++ ~[PC] Perhaps I should skip the whole contract and just kill you.~ + c_sage_dont_know_crap
END

IF ~~ less_than_impressive
  SAY ~[C-AWSAGE] Let me guess. The Guild sent you over to protect me. I would have thought they would send someone who looks more impressive, but you cannot judge a manuscript by it's title.~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",3)~ GOTO c_sage_dont_know_crap
END

IF ~~ oh_it_is_you
  SAY ~[C-AWSAGE] Oh, it is you again. Are you going to just stand around and bother me, or are you going to stand around and protect me?~
  + ~Global("c-arancontract","GLOBAL",1)~ +  ~[PC] Actually, I have heard that there is a contract available, and you might be the person to talk to. I just haven't decided whether to take it.~ + should_i_take_it
  + ~Global("c-arancontract","GLOBAL",2)~ +  ~[PC] I am here to protect you. Teldra sent me.~ + i_have_taken_it  
  
END


  
  
IF ~~ c_sage_dont_know_crap
  SAY ~[C-AWSAGE] I need but one thing from my hirelings, and that is silent observation. I have spent years studying these materials, and I need no deviant magic use or brawling with pointy things disturbing me.~



IF ~~ i_have_taken_it
  = ~ There is an older scroll in my collection which seems to defy proper investigation.~
  = ~ Unfortunately, this research is rather dangerous, and the sycophantic cowards who call themselves colleagues have insisted I have some muscle here in case something goes wrong. The Cowled Wizards frown on such research, and they tend to steal the useful, publishable materials before the ink is dry on the writeup.~
  = ~ Your job is to make sure whatever gets summoned does not damage my research.~
  ++ ~[PC] What is it you are summoning?~ + what_is_it_you_ask
  ++ ~[PC] I think I need to know more about that scroll before I agree to guard you.~ + what_is_it_you_ask
  ++ ~[PC] I will think about it. I need some time to ponder.~ + forget_me_now 
END

IF ~~ what_is_it_you_ask
  SAY ~[C-AWSAGE] Now if I knew what I was summoning, why would I be resorting to something as inelegant as actually using it, instead of researching it? Truly, leave the thinking to your betters.~ 
  + ~CheckStatGT(Player1,15,CHR)~ + ~[PC] I think perhaps it might not be a good idea to blindly summon some unknown thing from a scroll of unknown origin...~ +  convinced_me 
  + ~CheckStatGT(Player1,10,CHR) CheckStatLT(Player1,16,CHR)~ + ~[PC] I think perhaps it might not be a good idea to blindly summon some unknown thing from a scroll of unknown origin...~ + convinced_me_sortof
  + ~CheckStatLT(Player1,11,CHR)~ + ~[PC] I think perhaps it might not be a good idea to blindly summon some unknown thing from a scroll of unknown origin...~ + forget_u
  ++ ~[PC] Well, it is your funeral. I mean, yes, go right ahead. I will protect you.~ + good_shut_up_now
END

IF ~~ convinced_me
  SAY ~[C-AWSAGE] You... my, you are charming. And well spoken. Perhaps I was too hasty. I will be happy to use your services for the day, simply to guard my research from intrusion. As for the scroll, well..... perhaps I should spend more time before resorting to such brutish methods as actual use.~
  = ~[C-AWSAGE] I wish that you were available for the next 
END

IF ~~ convinced_me_sortof
  SAY ~[C-AWSAGE] ~
END

IF ~~ forget_u
  SAY ~[C-AWSAGE] ~
END


IF ~~ good_shut_up_now
  SAY ~[C-AWSAGE] Good. Stand back, and try not to do something stupid.~
  IF ~~ THEN DO ~ClearAllActions() SetGlobal("c-awsagesum","GLOBAL",1) StartCutSceneMode() StartCutScene("c-awsumn")~
END

END /* of append to c-awsage */


/* Cutscene : C-AWSUMN 
  
IF
	True()
THEN
	RESPONSE #100
	CutSceneId(Player1)
	Wait(1)
  CreateCreatureDoor("C-SUMMON",[550.2652],8)
  DisplayStringHead("C-AWSAGE",%Gods! That is not what I expected!%)
  ActionOverride("C-SUMMON",StartDialogueNoSet(Player1))
  EndCutSceneMode()
END

*/


APPEND C-SUMMON

IF ~NumTimesTalkedTo(0)~ THEN BEGIN summonstalk
  SAY ~[C-SUMMON] ~
  ++ ~[PC] ~ + summons_1_talk
  ++ ~[PC] ~ + summons_2_talk
  ++ ~[PC] ~ + summons_3_talk
END

IF ~~ summons_1_talk
  SAY ~[C-SUMMON] ~
  ++ ~[PC] ~ + summons_4_talk
  ++ ~[PC] ~ + summons_5_talk
  ++ ~[PC] ~ + summons_6_talk
END

IF ~~ summons_2_talk
  SAY ~[C-SUMMON] ~
  ++ ~[PC] ~ + summons_4_talk
  ++ ~[PC] ~ + summons_5_talk
  ++ ~[PC] ~ + summons_6_talk
END

IF ~~ summons_3_talk 
  SAY ~[C-SUMMON] ~
  ++ ~[PC] ~ + summons_4_talk
  ++ ~[PC] ~ + summons_5_talk
  ++ ~[PC] ~ + summons_6_talk
END

IF ~~ summons_4_talk /* attack the creature */
  SAY ~[C-SUMMON] ~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",4) Enemy()~ EXIT
END
  
IF ~~ summons_5_talk /* give creature the sage */
  SAY ~[C-SUMMON] ~
  IF ~~ THEN DO ~ClearAllActions() SetGlobal("c-arancontract","GLOBAL",7) StartCutSceneMode() StartCutScene("C-SUMTAK")~
END

IF ~~ summons_6_talk/* talk the creature out of attacking */
  SAY ~[C-SUMMON] ~
  IF ~~ THEN DO ~ClearAllActions() SetGlobal("c-arancontract","GLOBAL",4) StartCutSceneMode() StartCutScene("C-SUMTAK")~  
END  
  
END /* of append to C-SUMMON */


IF %BGT_VAR%
Global("X#FightChallenge","GLOBAL",1)
THEN
RESPONSE #100
ClearAllActions()
SetGlobal("X#FightChallenge","GLOBAL",2)
StartCutSceneMode()
StartCutScene("X#CHALL2")
END

IF %BGT_VAR%
Global("X#SummonXzvarts","GLOBAL",2)
THEN
RESPONSE #100
SetGlobal("X#SummonXzvarts","GLOBAL",3)
ActionOverride("X#XVART1",Enemy())
ActionOverride("X#XVART1",Attack("X#AJANFI"))
ActionOverride("X#AJANFI",Attack("X#XVART1"))
DisplayStringHead("X#AJANFI",@0)
END

IF
True()
THEN RESPONSE #100
CutSceneId("X#CAUTZ")
FadeToColor([20.0],0)
Polymorph(MAGE_FEMALE_ELF)
Wait(3)
PlaySound("%tutu_var%SIRIN03")
Wait(3)
MoveViewPoint([1419.837],VERY_FAST)
CreateCreature("X#DRAG2",[1419.837],5)
Wait(5)
FadeFromColor([20.0],0)
ActionOverride("X#DRAG2",MoveToPoint([1100.1100]))
MoveViewPoint([1227.1123],FAST)
Wait(1)
SetGlobal("X#FightDragon","GLOBAL",6)
ActionOverride("X#DRAG2",StartDialogueNoSet(Player1))
EndCutSceneMode()
END




/* Sage Sacrifice Cutcscene
IF
      True()
THEN
    RESPONSE #100
	CutSceneId("ajantis")
	ClearAllActions()
	ActionOverride("X#AJDRSI",MoveToPoint([1496.1324]))
	ActionOverride("X#AJDRSI",DestroySelf())
	Wait(3)
	MoveViewPoint([1024.1072],VERY_FAST)
	Wait(2)
	Dialog(Player1)
	EndCutSceneMode()
END

*/





/* Merc Recruiter Teldra */

/*
  QUEST: Global("c-arancontract","GLOBAL",#)

  // quest 1; shady sage's spell scarcity shaves sacrificial shoulders
  0 = not taken or offered    Global("c-arancontract","GLOBAL",0)  initial
  1 = offered but not taken   Global("c-arancontract","GLOBAL",1)  set by C-AW01TL.DLG
  2 = taken                   Global("c-arancontract","GLOBAL",2)  set by C-AW01TL.DLG
  3 = met with contact        Global("c-arancontract","GLOBAL",3)  set by C-AWSAGE.DLG
  4 = resolution              Global("c-arancontract","GLOBAL",4)  set by C-AWSAGE.DLG
  5 = contact surrendered     Global("c-arancontract","GLOBAL",5)  set by 
  6 = resolved peaceably      Global("c-arancontract","GLOBAL",6)  set by  -> quest reward 3
  7 = resolved fighting       Global("c-arancontract","GLOBAL",7)  set by   -> quest reward 2
  8 = contact killed          Global("c-arancontract","GLOBAL",8)  set by  -> quest reward 1
  9 = contract refused while in progress Global("c-arancontract","GLOBAL",9) set by C-AW01TL.DLG or C-AWSAGE --> escapes to "no more work", 18
  10 = quest completed to Teldra's satisfaction   Global("c-arancontract","GLOBAL",10) set by C-AW01TL.DLG {if set, new work becomes available next talk}

  // quest 2; prescriptive pandering proves pauline's perils punch provided people proffer preventative programs
  11 = new work offered
  12 = new work taken
  13 = resolved by negotiation - 'can't we all just get along?'
  14 = resolved by taking landowner's side - 'pay the piper, or face the consequences'
  15 = resolved by taking peasant's side - 'help help, we're being repressed!'
  16 = resolved with blood spilled - 'kill 'em all, and let the gods figure it out'

  17 = quest refused while in progress
  18 = no more work
*/




  + ~Global("c-arancontract","GLOBAL",1)~ + ~[PC] Well, you offered it, but I haven't taken it yet.~ + no_details_please
  + ~Global("c-arancontract","GLOBAL",2)~ + ~[PC] Well, I have taken it, but I haven't completed it yet.~ + no_details_please
  + ~Global("c-arancontract","GLOBAL",3)~ + ~[PC] I met with the sage, but he wants to do some highly suspect things. I have not decided if I am going to complete the contract.~ + c_dontbreakit
  + ~Global("c-arancontract","GLOBAL",4)~ + ~[PC] I have met with the sage and agreed to help him, but I am having second thoughts. This looks like a recipie for unmitigated disaster.~ + c_dontbreakit
  + ~Global("c-arancontract","GLOBAL",5)~ + ~[PC] That damned fool sage got in over his head, but we talked him out of doing anything really stupid. Everybody wins.~ + how_did_i_miss_that_talkedout
  + ~Global("c-arancontract","GLOBAL",6)~ + ~[PC] I resolved it with words. Lots of them. You know, I am beginning to think I can talk a dragon out of her scales.~ + how_did_i_miss_that_negotiate
  + ~Global("c-arancontract","GLOBAL",7)~ + ~[PC] I resolved it with force. The sage is alive, at least until he tries to do something so stupid again.~ + how_did_i_miss_that_clobber
  + ~Global("c-arancontract","GLOBAL",8)~ + ~[PC] The sage is dead. There is no more contract.~ + how_did_i_miss_that_sgaedead
  + ~Global("c-arancontract","GLOBAL",9)~ + ~[PC] Well, I refused the contract while it was in progress.~ + breach_of_contract_go_away
  
  
APPEND ~C-AW01TL~

/* double duty - testing state - allows quick diagnosis */

IF ~Global("teldratesting","GLOBAL",1)~ THEN BEGIN c_teldra_testing_state 
  SAY ~[C-AW01TL] You want to know what the quest variables are, don't you. Can't a girl drink in peace?~
  IF ~~ THEN DO ~SetGlobal("teldratesting","GLOBAL",0)~ GOTO hows_it_going
END


/* Initial Starting State: */

IF ~NumTimesTalkedTo(0)~ THEN BEGIN  first_meet_teldra
  SAY ~[C-AW01TL]  Greetings and a pearl you. If you come to me seeking sellswords and mercenaries looking for contracts both long and short, you have come to the right place.~
  ++ ~[PC] Actually, I was looking to be employed myself. Is there any short term work available?~ + c_workavailable
  + ~RandomNum(3,3)~ + ~[PC] I just thought you were the barmaid. Do you work here?~ + c_1_thoughtbarmaid
  + ~RandomNum(3,2)~ + ~[PC] I just thought you were the barmaid. Do you work here?~ + c_2_thoughtbarmaid
  + ~RandomNum(3,1)~ + ~[PC] I just thought you were the barmaid. Do you work here?~ + c_3_thoughtbarmaid
  + ~RandomNum(3,3)~ + ~[PC] I was admiring the curve of your breastplate.~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_obnoxious_1
  + ~RandomNum(3,2)~ + ~[PC] You are very pretty, in a "cross-me-and-I-will-kill-you" kind of way.~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_obnoxious_2
  + ~RandomNum(3,1)~ + ~[PC] I was thinking perhaps you might be up for some fun, clothing optional.~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_obnoxious_3
  ++ ~[PC] Is business good right now?~ + c_businessgood
  + ~!Global("c-aranjoined","GLOBAL",1) Global("c-aranorintalk","C-AR01",1) !InParty("c-aran")~ + ~[PC] I might be interested in hiring some help. Orrin, the tavernkeeper over there, mentioned a sellsword who can read and write. Where can I find him?~ +  c_findaran
  IF ~!Global("c-aranjoined","GLOBAL",1) Global("c-aranemployment","C-AR01",1) !InParty("c-aran")~ THEN GOTO aran_already_introduced_but_not_present
  IF ~Global("c-aranemployment","C-AR01",0) !InParty("c-aran") Global("c-aranteldratalk","GLOBAL",0) Global("c-aranorintalk","C-AR01",0)~ THEN GOTO not_in_party_met_noone /* Aran not in party and not met teldra or orrin */
  IF ~Global("c-aranteldratalk","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN EXTERN C-ARANJ c_aranteldratalk1 /* Aran in party and not met teldra */
END

/* Quest comment: Aran not in party and Orrin's quest is in progress */
IF ~OR(2) PartyHasItem("c-awpkg1") PartyHasItem("c-awpkg2") OR(3) !InParty("c-aran") !InMyArea("c-aran") StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN BEGIN c_not_in_line
  SAY ~[C-AW01TL] I would have thought feching and carrying things for Orrin was a bit below your pay grade. But to each <PRO_HISHER> own, I guess.~
  IF ~Global("c-arancontract","GLOBAL",0)~ THEN GOTO if_1_you_are_that_desparate
  IF ~GlobalGT("c-arancontract","GLOBAL",0) GlobalLT("c-arancontract","GLOBAL",9)~ THEN GOTO that_2_goes_for_me_too
  IF ~Global("c-arancontract","GLOBAL",10)~ THEN GOTO since_you_did_so_well_last_time
  IF ~GlobalGT("c-arancontract","GLOBAL",10) GlobalLT("c-arancontract","GLOBAL",17)~ THEN GOTO that_2_goes_for_me_too
  IF ~GlobalGT("c-arancontract","GLOBAL",17)~ THEN GOTO but_you_already_knew_that
  IF ~OR(2) Global("c-arancontract","GLOBAL",9) Global("c-arancontract","GLOBAL",17)~ THEN GOTO not_that_it_matters
  IF ~!Global("c-aranjoined","GLOBAL",1)~ THEN GOTO c_say_hi_to_aran
END

/* Quest comment: Aran in party and Orrin's quest is in progress */
IF ~OR(2) PartyHasItem("c-awpkg1") PartyHasItem("c-awpkg2") InParty("c-aran") InMyArea("c-aran") StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN BEGIN c_working_on_the_tavern_quest
  SAY ~[C-AW01TL] I would have thought feching and carrying things for Orrin was a bit below your pay grade. But to each <PRO_HISHER> own, I guess.~
  IF ~Global("c-arancontract","GLOBAL",0)~ THEN GOTO i_have_some_work
  IF ~GlobalGT("c-arancontract","GLOBAL",0) GlobalLT("c-arancontract","GLOBAL",9)~ THEN GOTO hows_it_going
  IF ~OR(2) Global("c-arancontract","GLOBAL",9) Global("c-arancontract","GLOBAL",17)~ THEN GOTO not_that_it_matters
  IF ~Global("c-arancontract","GLOBAL",10)~ THEN GOTO i_have_some_more_work
  IF ~GlobalGT("c-arancontract","GLOBAL",10) GlobalLT("c-arancontract","GLOBAL",17)~ THEN GOTO hows_it_going
  IF ~GlobalGT("c-arancontract","GLOBAL",17)~ THEN GOTO but_you_already_knew_that
END

/* Quest: All Resolved = 18 */
IF ~GlobalGT("c-arancontract","GLOBAL",17)~ THEN BEGIN c_good_old_days
  SAY ~[C-AW01TL] Pull up a chair and rest a bit. No work right now, so there is little enough to do, and I bet you could tell me some great stories...~
  ++ ~[PC] I just thought you were the barmaid. Aren't you going to take my drink order?~ + ha_ha_yeah_right
  ++ ~[PC] I was admiring the curve of your breastplate. I especially like the lack of appropriate protection from slashing attacks.~ + admire_away_cant_touch_this
  ++ ~[PC] Look, Teldra, I don't know how to say this... but perhaps we could go someplace more private?~ + admire_away_cant_touch_this
  ++ ~[PC] I am the conquering all-powerful <CHARNAME>. I have come for your soul.~ + ha_ha_yeah_right
  ++ ~[PC] I will talk if you buy.~ + talk_you_buy
  ++ ~[PC] I was hoping you could tell me a story or two.~ + teldra_talks_pc_buys
  ++ ~[PC] Some other time, perhaps.~ + i_will_be_here
END

/* Quest BLOCKING: Breach of Contract */
IF ~Global("c-arancontract","GLOBAL",17)~ THEN BEGIN c_you_bastard
  SAY ~[C-AW01TL] I'm just sitting here. Not much to say, and I'm not really in the mood anyways.~
  ++ ~[PC] I was wondering if you had heard about any more work.~ + breach_of_contract_go_away
  ++ ~[PC] This place looks pretty empty. Have you hired everyone out already?~ + breach_of_contract_go_away
  ++ ~[PC] Not in the mood for what?~ + breach_of_contract_go_away
  ++ ~[PC] Here, let me buy you a drink.~ + breach_of_contract_go_away
END

/* 11 - 16 = Quest BLOCKING: Aran not in party and Teldra's quest2 is in progress */
IF ~OR(3) !InParty("c-aran") !InMyArea("c-aran") StateCheck("c-aran",CD_STATE_NOTVALID) GlobalGT("c-arancontract","GLOBAL",10) GlobalLT("c-arancontract","GLOBAL",17)~ THEN BEGIN c_dont_diss_teldra
  SAY ~[C-AW01TL] Good to see you again, <CHARNAME>. I hope your work is progressing nicely. You know the drill... just pretend I said the gods blighted contract clause disclosure. I get so sick of saying it over and over again.~
  IF ~InPartyAllowDead("c-aran") StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN GOTO c_looks_bad_there 
  IF ~InPartyAllowDead("c-aran") !InMyArea("c-aran")~ THEN GOTO c_tell_him_hello
  IF ~!InPartyAllowDead("c-aran")~ THEN EXIT
END

/* 11 - 16 = Quest: Teldra's quest 2 is in progress */ <<<<<<<<<<<hole 
IF ~InParty("c-aran") InMyArea("c-aran") StateCheck("c-aran",CD_STATE_NOTVALID) GlobalGT("c-arancontract","GLOBAL",10) GlobalLT("c-arancontract","GLOBAL",17)~  THEN BEGIN c_hows_it_hangin
  SAY ~[C-AW01TL]  Good to see you. How is the contract progressing?~
  ++ ~[PC] Actually, I have not started it yet.~ + no_details_please
  ++ ~[PC] It is going well. How are things going around here?~ + no_details_please
  ++ ~[PC] That depends. Just how many drinks does a <PRO_MANWOMAN> have to buy you before <PRO_HESHE> can tell you how attractive you are?~ + c_nice_looking_but_dumb
  + ~RandomNum(3,3)~ + ~[PC] I was admiring the curve of your breastplate.~ + c_obnoxious_1
  + ~RandomNum(3,2)~ + ~[PC] You are very pretty, in a "cross-me-and-I-will-kill-you" kind of way.~ + c_obnoxious_2
  + ~RandomNum(3,1)~ + ~[PC] I was thinking perhaps you might be up for some fun, clothing optional.~ + c_obnoxious_3
  ++ ~[PC] I have decided that I am not going to fulfil the contract. Find someone else to do it.~ + c_dontbreakit
END

/* Quest: Teldra's quest 2 is available but not yet taken : 11 */
IF ~InParty("c-aran") InMyArea("c-aran") StateCheck("c-aran",CD_STATE_NOTVALID) Global("c-arancontract","GLOBAL",11)~ THEN BEGIN c_so_are_you_or_arent_you
  SAY ~[C-AW01TL]  Well, good to see you, <CHARNAME>. Have you thought about taking that contract I offered you? More money this time, and very low risk.~
  ++ ~[PC] I am still thinking about it.~ + still_2_thinking_about_it
  ++ ~[PC] Actually, yes. I would like to take that contract. I could use the coin.~ + yes_2_i_will
  ++ ~[PC] No, I do not want to take this contract right now.~ + no_not_ever
  ++ ~[PC] I might be interested... if I thought you might be interested, if you know what I mean.~ + perhaps_2_if_you_want_to_date
  ++ ~[PC] Don't mind me. I am just chatting with you to pass the time.~ + still_2_thinking_about_it
  ++ ~[PC] Sure, I will trust that it is low risk. After all, it went so, so well last time.~ + still_2_thinking_about_it  
END

/* 9 = contact refused - set by C-ARAN.BCS - leaves eventually at 17 */
IF ~Global("c-arancontract","GLOBAL",9)~ THEN BEGIN resolve_refused /* refused_tq */
  SAY  ~[C-AW01TL] I have a very angry letter here from the Sage's Guild, accusing me of all sorts of things. They even went so far as to write "Your scurrilous conduct and inadequacy places the gravest concerns on any future dealings". What in the nine hells did you do to piss them off so badly?~
  ++ ~[PC] Err... we did nothing. Nothing at all. In fact, we refused to honor the contract.~ + resolve_9_refused
  ++ ~[PC] Do you know what that idiot wanted us to do? I did not sign up for a suicide mission.~ + resolve_9_refused
  ++ ~[PC] Clean up your own mess. Who paid you to take that high a risk, for so little coin?~ + resolve_9_refused
  ++ ~[PC] I do not know why they are upset. We met your contact, helped him out, and were on our way. Where is my payment?~ + dont_kid_a_kidder
END

/* 2 - 8 Quest BLOCKING: Aran not in party and Teldra's quest1 is in progress */
IF ~OR(3) !InParty("c-aran") !InMyArea("c-aran") StateCheck("c-aran",CD_STATE_NOTVALID) GlobalGT("c-arancontract","GLOBAL",1) GlobalLT("c-arancontract","GLOBAL",9)~ THEN BEGIN c_get_on_with_it
  SAY ~[C-AW01TL] Hail and well met. I hope the contract is progressing nicely. That advance money is just a taste, so get the contract done and I can pay you off.~
  = ~[C-AW01TL] Just a word to the wise... and something I am required to mention. Aran is Guild. That means payoff comes when he is healthy, present, and part of your team. That is all part of the contract. Until then I can't really talk to you.~
  IF ~InPartyAllowDead("c-aran") StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN GOTO c_looks_bad_there 
  IF ~InPartyAllowDead("c-aran") !InMyArea("c-aran")~ THEN GOTO c_tell_him_hello
  IF ~!InPartyAllowDead("c-aran")~ THEN EXIT
END

/* 8 = contact killed - set by C-ARAN.BCS  */
IF ~Global("c-arancontract","GLOBAL",8)~ THEN BEGIN resolve_dead /* dead_tq */
  SAY  ~[C-AW01TL] I don't know what happened in there, but the word on the street is that Quonai is dead. There are some serious questions flying about, so something must have gone pretty wrong.~
  ++ ~[PC] Err... we did nothing. Nothing at all. In fact, we were never there. Didn't see a thing.~ + contract_1_neutral
  ++ ~[PC] Do you know what that idiot wanted us to do? I did not sign up for a suicide mission. His death was unfortunate, but not my fault.~ + contract_1_neutral
  ++ ~[PC] Clean up your own mess. Who paid you to take that high a risk, for so little coin?~ + contract_1_neutral
  ++ ~[PC] I do not know why they are upset. We met your contact, helped him out, and were on our way. No one said he had to be alive when it was all over. Where is my payment?~ + contract_1_neutral
END

/* 7 = resolved fighting  set by C-AWLEAD.DLG or C-AWLEAD.BCS */
IF ~Global("c-arancontract","GLOBAL",7)~ THEN BEGIN resolve_two /* resolve_two */
  SAY ~[C-AW01TL]  Well, I have a nice letter from the Sage's Guild here, and a decent payoff for a simple contract. I guess if someone wants to skirt Amnian law, there is bound to be a hitch or two. I heard it was a good fight.~
  ++ ~[PC] Err... we did nothing. Nothing at all. In fact, we were never there. Didn't see a thing.~ + contract_1_positive
  ++ ~[PC] Do you know what that idiot wanted us to do? I am not going to be very happy if there is not a serious bonus. Call it a "stupid tax" and pass the cost along to the client.~ + contract_1_positive
  ++ ~[PC] Who paid you to take that high a risk, for so little coin... and with my life?~ + contract_1_positive
  ++ ~[PC] We met your contact, helped him out, and were on our way. Where is my payment?~ + contract_1_positive
END

/*  6 = resolved peaceably - set by C-AWLEAD.DLG */
IF ~Global("c-arancontract","GLOBAL",6)~ THEN BEGIN resolve_three /* resolve_three */
  SAY ~[C-AW01TL] Well, I have a nice letter from the Sage's Guild here, and a decent payoff. You saved the city the risk of a fight that could have killed innocents, and probably saved that damned fool's life into the bargain. I know a contract is a contract, but sometimes you just have to wonder what these people are thinking.~
  ++ ~[PC] Err... we did nothing. Nothing at all. In fact, we were never there. Didn't see a thing.~ + contract_1_positive
  ++ ~[PC] Do you know what that idiot wanted us to do? I am not going to be very happy if there is not a serious bonus. Call it a "stupid tax" and pass the cost along to the client.~ + contract_1_positive
  ++ ~[PC] Who paid you to take that high a risk, for so little coin... and with my life?~ + contract_1_positive
  ++ ~[PC] We met your contact, helped him out, and were on our way. Where is my payment?~ + contract_1_positive
END

/* 5 = contact surrendered - set by C-SUMMON */
IF ~Global("c-arancontract","GLOBAL",5)~ THEN BEGIN resolve_four 
  SAY ~[C-AW01TL] I have a very angry letter here from the Sage's Guild, accusing me of all sorts of things. What in the nine hells did you do to piss them off so badly?~
  ++ ~[PC] Err... we did nothing. Nothing at all. In fact, we got here, and everything was all shuttered up, and no one answered the door. Why, did something happen? ~ + guild_not_happy
  ++ ~[PC] Do you know what that idiot wanted us to do? I did not sign up for a suicide mission.~ + guild_not_happy
  ++ ~[PC] Clean up your own mess. Who paid you to take that high a risk, for so little coin?~ + guild_not_happy
  ++ ~[PC] I do not know why they are upset. We met your contact, helped him out, and were on our way. Where is my payment?~ + guild_not_happy
END

/* 2 - 4 = Quest: Teldra's quest 1 is in progress */
IF ~InParty("c-aran") InMyArea("c-aran") StateCheck("c-aran",CD_STATE_NOTVALID) GlobalGT("c-arancontract","GLOBAL",1) GlobalLT("c-arancontract","GLOBAL",5)~  THEN BEGIN c_going_well_i_presume
  SAY ~[C-AW01TL] Good to see you are still in one piece.~
  IF ~~ THEN GOTO hows_it_going
END

/* Quest: Teldra's quest 1 is available but not yet taken */
IF ~InParty("c-aran") InMyArea("c-aran") StateCheck("c-aran",CD_STATE_NOTVALID) Global("c-arancontract","GLOBAL",1)~ THEN BEGIN c_slow_to_start_eh
  SAY ~[C-AW01TL]  Well, good to see you, I guess. Have you thought about taking that contract I offered you?~
  ++ ~[PC] The whole offer sounds tempting... a little easy money standing around guarding a pile of books. But I am still thinking about it.~ + still_thinking_about_it
  ++ ~[PC] I think I will take that contract. What were the details, exactly?~ + yes_i_will
  ++ ~[PC] I am not interested. Not now, and pretty much not ever.~ + no_not_ever
  ++ ~[PC] That depends. Just how many drinks does a <PRO_MANWOMAN> have to buy you before <PRO_HESHE> can tell you how attractive you are?~ + perhaps_if_you_want_to_date
  ++ ~[PC] Look, I have other things on my mind right now. Perhaps later.~ + still_thinking_about_it
END

/* catch-all if everything above evaluates false */
IF ~True()~ THEN BEGIN teldra_catch_all_talk
  SAY ~[C-AW01TL]  Greetings and a pearl you. If you come to me seeking sellswords and mercenaries looking for contracts both long and short, you have come to the right place.~
  ++ ~[PC] Actually, I was looking to be employed myself. Is there any short term work available?~ + c_workavailable
  + ~RandomNum(3,3)~ + ~[PC] I just thought you were the barmaid. Do you work here?~ + c_1_thoughtbarmaid
  + ~RandomNum(3,2)~ + ~[PC] I just thought you were the barmaid. Do you work here?~ + c_2_thoughtbarmaid
  + ~RandomNum(3,1)~ + ~[PC] I just thought you were the barmaid. Do you work here?~ + c_3_thoughtbarmaid
  + ~Global("c-aranteldratalk","GLOBAL",0) Global("c-aranemployment","C-AR01",0) !InPartyAllowDead("c-aran") Global("c-aranorintalk","C-AR01",0)~ + ~Do you have any good prospects to assist an adventuring party?~ + c_not_yet_met_aran /* Aran not in party and not met teldra or orrin */
  ++ ~!InParty("c-aran") !Global("c-aranemployment","GLOBAL",2)~ + ~[PC] What do you think about Aran Whitehand? I hear he might be available for contract work.~ + c_available_to_pc /* there is a hole here i am not plugging now - the "send to an inn" component. Since it exists for lots of PCs, I'll ignore it and come back later to plug the gap. */
  + ~RandomNum(3,3)~ + ~[PC] I was admiring the curve of your breastplate.~ + c_obnoxious_1
  + ~RandomNum(3,2)~ + ~[PC] You are very pretty, in a "cross-me-and-I-will-kill-you" kind of way.~ + c_obnoxious_2
  + ~RandomNum(3,1)~ + ~[PC] I was thinking perhaps you might be up for some fun, clothing optional.~ + c_obnoxious_3
  ++ ~[PC] Is business good right now?~ + c_businessgood
  + ~Global("c-aranorintalk","C-AR01",1) !InParty("c-aran")~ + ~[PC] I might be interested in hiring some help. Orrin, the tavernkeeper, mentioned a sellsword who can read and write. Where can I find him?~ +  /* c_findaran */
  IF ~Global("c-arancontract","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN EXTERN C-ARANJ c_aranteldracontract 
  IF ~Global("c-aranteldratalk","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN EXTERN C-ARANJ c_aranteldratalk1 /* Aran in party and not met teldra */
END

/* replies to states */

IF ~~ ha_ha_yeah_right
  SAY ~[C-AW01TL] Heh. What soul? I sold that for a few iron tradebars when I was fourteen. Now, if you have come for my body, buy me a drink and we will get down to some serious negotiation.~
  ++ ~[PC] Soul, body... whatever gets you into my bed, or me into yours.~ + c_not_easy_or_cheap
  ++ ~[PC] You said there is no work at all? I really need some coin.~ + c_r_e_s_p_e_c_t
  ++ ~[PC] Why, Teldra, I am surprised. Why so forward?~ + c_not_easy_or_cheap
  ++ ~[PC] I... I am not comfortable with this. We should keep things friendly, but not too friendly.~ + i_will_be_here
END

IF ~~ c_r_e_s_p_e_c_t
  SAY ~[C-AW01TL] Now, what you really need is a good stiff drink, sitting here swapping combat stories, and forgetting your troubles for a time. We all need that.~
  ++ ~[PC] I don't have the time. There are so many things to do, monsters to slay, opponents to loot... I don't even have time for a drink.~ + i_will_be_here
  ++ ~[PC] Why are you leaning forward like that? I can see right down your cleavage, you know.~ + admire_away_cant_touch_this
  ++ ~[PC] You may. I don't.~ + i_will_be_here
  ++ ~[PC] Have you ever thought of joining me? Adventuring with me?~ + bed_yes_join_no
END

IF ~~ i_will_be_here
  SAY ~[C-AW01TL] Well, suit yourself. I am not planning on going anywhere, so I will keep a spot warm for you.~
  IF ~~ THEN EXIT 
END

IF ~~ teldra_talks_pc_buys
  SAY ~[C-AW01TL] You just sit here, and the first round is on me. I'll tell you about the time I had a contract dispute between the Steels and the Mindgulphs, and had to hire the Blue Boars to keep the peace while we sorted it all out.~
  IF ~~ THEN EXIT /* story expansion later? */
END

IF ~~ talk_you_buy_two
  SAY ~[C-AW01TL] You just sit here, and the first round is on me. So, tell me... what is it like to be one of the most powerful forces on the face of Toril?~
  IF ~~ THEN EXIT /* story expansion later? */
END

IF ~~ admire_away_cant_touch_this
  SAY ~[C-AW01TL] Hey, if you have it, flaunt it, I always say. I can't tell you how many times some poor sod is on the fence about signing on, and all it takes is a judicious leaning forward and a slight wardrobe malfunction, and I have met my quota.~
  + ~Gender(Player1,FEMALE)~ + ~[PC] You don't have that much to flaunt, you know.~ + c_you_sister
  + ~Gender(Player1,MALE)~ + ~[PC] You don't have that much to flaunt, you know.~ + c_you_brother
  ++ ~[PC] Well, about that drink, and that negotiation...~ + c_not_easy_or_cheap
  ++ ~[PC] Huh. I heard you were both easy and cheap, but luring poor innocent farmers into becoming fodder for mercenary companies is just a little over the top.~ + not_easy_reply_6
  ++ ~[PC] Have you ever thought of joining me? Adventuring with me?~ + bed_yes_join_no
END

IF ~~ c_you_sister
  SAY ~[C-AW01TL] Says you, sister.  Besides, it isn't how much you have, it is how much you 'accidentally' show. No one can resists the allure and mystery of the forbidden fruit, whether it is a peach or a melon.~
  ++ ~[PC] Well, about that drink, and that negotiation...~ + c_not_easy_or_cheap  
  ++ ~[PC] We should keep things friendly. No need to muddle business and pleasure.~ + not_easy_reply_3
  ++ ~[PC] That is a big change in attitude.~ + not_easy_reply_5
  ++ ~[PC] We should keep things friendly. No need to muddle business and pleasure.~ + not_easy_reply_3
  ++ ~[PC] Have you ever thought of joining me? Adventuring with me?~ + bed_yes_join_no
END

IF ~~ c_you_brother
  SAY ~[C-AW01TL] Says you, boyo. Your eyes keep wandering down that way whether you realize it or not. Besides, it isn't how much you have, it is how much you 'accidentally' show. No one can resists the allure and mystery of the forbidden fruit, whether it is a peach or a melon.~
  ++ ~[PC] Well, about that drink, and that negotiation...~ + c_not_easy_or_cheap  
  ++ ~[PC] We should keep things friendly. No need to muddle business and pleasure.~ + not_easy_reply_3
  ++ ~[PC] That is a big change in attitude.~ + not_easy_reply_5
  ++ ~[PC] We should keep things friendly. No need to muddle business and pleasure.~ + not_easy_reply_3
  ++ ~[PC] Have you ever thought of joining me? Adventuring with me?~ + bed_yes_join_no
END

IF ~~ c_not_easy_or_cheap
  SAY ~[C-AW01TL] Look, I am not easy, and I am not cheap, but I like powerful, effective people. You have won most of the negotiating points just getting tough things done. And I look at you, and what is there not to like? So shall we negotiate, or shall we go upstairs and screw like wild rabbits?~
  ++ ~[PC] I was thinking of leisurely romance, a bottle of wine, the long slow teasing and sultry looks.~ + not_easy_reply_1
  ++ ~[PC] Wild rabbits it is.~ + not_easy_reply_2
  ++ ~[PC] I don't have the time right now, but I would love to have this conversation another time.~ + not_easy_reply_3
  ++ ~[PC] Huh. I heard you were both easy and cheap.~ + not_easy_reply_4
  ++ ~[PC] That is a big change in attitude.~ + not_easy_reply_5
  ++ ~[PC] We should keep things friendly. No need to muddle business and pleasure.~ + not_easy_reply_3
END

IF ~~ not_easy_reply_5
  SAY ~[C-AW01TL] What can I say. You have won me over, and when I see what I want, I go for it.~
  ++ ~[PC] I was thinking of leisurely romance, a bottle of wine, the long slow teasing and sultry looks.~ + not_easy_reply_1
  ++ ~[PC] Bedding like wild rabbits it is.~ + not_easy_reply_2
  ++ ~[PC] I don't have the time right now, but I would love to have this conversation later.~ + not_easy_reply_3
  ++ ~[PC] We should keep things friendly. No need to muddle business and pleasure.~ + not_easy_reply_3
  ++ ~[PC] Have you ever thought of joining me? Adventuring with me?~ + bed_yes_join_no
END

IF ~~ not_easy_reply_1
  SAY ~[C-AW01TL] You have the wrong woman for that. I favor complete discretion, quick negotiation, a thorough examination of the physical goods, a detailed exploration of skills and sevices, and rapid conclusion of the contract to the mutual pleasure of both parties. Oh, and a no-fault clause... I don't sign up for long term comittments.~
  IF ~~ THEN GOTO business_concluded_pleasure_begins
END

IF ~~ not_easy_reply_2
  SAY ~[C-AW01TL] Good. I favor complete discretion, quick negotiation, a thorough examination of the physical goods, a detailed exploration of skills and sevices, and rapid conclusion of the contract to the mutual pleasure of both parties. Oh, and a no-fault clause... I don't sign up for long term comittments.~
  IF ~~ THEN GOTO business_concluded_pleasure_begins
END

IF ~~ bed_yes_join_no
  SAY ~[C-AW01TL] For a brief tumble in the bedchamber? Yes. And now that you are not likely to be a client of mine in the near future, the thought keeps occurring to me. But joining you as an adventurer, no. I have a good position here, and a good life.~
  IF ~~ THEN EXIT
END

IF ~~ not_easy_reply_3
  SAY ~[C-AW01TL] Fine by me. For the record, though, I favor complete discretion, quick negotiation, a thorough examination of the physical goods, a detailed exploration of skills and sevices, and rapid conclusion of the contract to the mutual pleasure of both parties. Oh, and a no-fault clause... I don't sign up for long term comittments.~
  IF ~~ THEN EXIT
END

IF ~~ not_easy_reply_4
  SAY ~[C-AW01TL] Well, if you are going to joke about it, forget it. You are cute, but I don't like attitude in the bedroom. Unless it is "yes, please, may I have another?".~
  IF ~~ THEN EXIT
END

IF ~~ not_easy_reply_6
  SAY ~[C-AW01TL] Well, if you are going to be that way, forget the whole flirting business. You are cute, but I don't like attitude in the bedroom. Unless it is "yes, please, may I have another?".~
  IF ~~ THEN EXIT
END

IF ~~ business_concluded_pleasure_begins
  SAY ~[C-AW01TL] That being said, I'll see you upstairs. Drink up... I intend to find out just how much endurance you have!~
  IF ~~ THEN DO ~RestParty()~ EXIT /* cutscene? Encounter? For now, just do a BioWare standard "rest the party", and at the least swap in berelinde's "don't have other dreams" cutscene. */
END

/* Aran is out of the party */
IF ~~ c_say_hi_to_aran
  SAY ~[C-AW01TL] You should bring Aran around when he is ready for some work. I might have something for you both.~
  IF ~~ THEN EXIT 
END

IF ~~ c_tell_him_hello
  SAY ~[C-AW01TL] When you see him, tell him I said hello.~
  IF ~~ THEN EXIT 
END

IF ~~ c_looks_bad_there
  SAY ~[C-AW01TL] He sure looks worse for the wear, there. I hope that heals up nicely. Hells, I hope it heals, period.~
  IF ~~ THEN EXIT 
END

IF ~~ dont_kid_a_kidder
  SAY ~[C-AW01TL] That is not the story I heard.~
  IF ~~ THEN GOTO resolve_9_refused
END


IF ~~ guild_not_happy
  SAY ~[C-AW01TL] The Sages Guild claims you took the contract to protect Quonai, but somehow he ended up disappearing without a trace.~
  ++ ~[PC] Hey, if the client isn't dead, and we were there, I consider the letter of the contract fulfilled.~ + contract_1_reduced
  ++ ~[PC] Look, the idiot summoned a creature far beyond any reasonable positive outcome of battle. I negotiated a way where the creature didn't kill us and burn down half of the city, and everyone walks away not dead - even the client.~ + contract_1_reduced
  ++ ~[PC] If you read carefully, I believe the job was to protect the research, not the researcher. No books were harmed in the fulfillment of this contract.~ + contract_1_reduced
  ++ ~[PC] Is this going to be a problem? I just want my money.~ + contract_1_reduced
END

IF ~~ c_contract_delayed
  SAY ~[C-AW01TL] Well, if you change your mind, come talk to me. This sort of thing is too small for the big Companies, and I am short of freelancers right now. I'd send Torin, but he drinks too much.~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",1)~ EXIT
END

//\\//\\//\\Contracts Completed//\\//\\//\\


IF ~~ resolve_9_refused
  SAY ~[C-AW01TL] Now that is a load of manure. The Guild is not happy, I'm not happy, the client's backers are not happy. I hope you are, because that would be the only positive thing gained from this whole mess.~
  = ~[C-AW01TL] Keep the advance. I don't need the hassle. But don't bother coming looking for work from me until you are finished with this one, Aran. <PRO_HESHE>'s bad for business.~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",17) EraseJournalEntry(%Guard Duty

I have taken a contract with Teldra to guard some sage's precious books for a few hours. The pay is high, which means with my luck there will be more to the story then hanging around doing nothing for a few hours%) ~ SOLVED_JOURNAL ~Sage Contract Completed

I refused to complete a contract granted by Teldra today. She seemed... less than happy.~ EXIT
END

/* Reward + for contract 1 */
IF ~~ contract_1_positive
  SAY ~[C-AW01TL] ~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",10) AddExperienceParty(11500) GiveGoldForce(500) EraseJournalEntry(%Guard Duty

I have taken a contract with Teldra to guard some sage's precious books for a few hours. The pay is high, which means with my luck there will be more to the story then hanging around doing nothing for a few hours%) ~ SOLVED_JOURNAL ~Sage Contract Completed

I completed a contract granted by Teldra today. She seemed very pleased with my work. perhaps there will be more contracts from her in the future.~ EXIT
END

/* Reward - for contract 1 */
IF ~~ contract_1_neutral
  SAY ~[C-AW01TL] ~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",10) AddExperienceParty(8500) GiveGoldForce(400) ~ EraseJournalEntry(%Guard Duty

I have taken a contract with Teldra to guard some sage's precious books for a few hours. The pay is high, which means with my luck there will be more to the story then hanging around doing nothing for a few hours%) ~ SOLVED_JOURNAL ~Sage Contract Completed

I completed a contract granted by Teldra today. She seemed pleased enough with my skills. I do not think I will be her first choice of hires, but she will probably give me more work eventually.~ EXIT
END

/* Reduced Reward - for contract 1 */
IF ~~ contract_1_reduced
  SAY ~[C-AW01TL] This smells like the Docks just after a Calshite slave galley pulls in, but I see no evidence to show a broken contract. Here is the payoff. I'll write up something that will calm things down between the guilds. I really don't want to find out whether the pen is mightier than the sword, seeing as most of my business involves both.~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",10) AddExperienceParty(8500) GiveGoldForce(300)~ SOLVED_JOURNAL ~Sage Contract Completed

I completed a contract granted by Teldra today. She was not very happy, but a contract is a contract. I may have to push her to get me more work.~ EXIT
END

/* Reward + for contract 2 */
IF ~~ contract_2_positive
  SAY ~[C-AW01TL] ~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",18) AddExperienceParty(11500) GiveGoldForce(1000)~ SOLVED_JOURNAL ~Disputed Contract Completed

I completed a contract granted by Teldra today. I am not sure why people are not able to resolve their own problems, but if they need someone to step in, at least I can gain some coin for it.~ EXIT
END

/* Reward - for contract 2 */
IF ~~ contract_2_neutral
  SAY ~[C-AW01TL] ~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",18) AddExperienceParty(8500) GiveGoldForce(1000)~ SOLVED_JOURNAL ~Disputed Contract Completed

I completed a contract granted by Teldra today. I am not sure why people are not able to resolve their own problems, but if they need someone to step in, at least I can gain some coin for it.~ EXIT
END

/* Reward - for contract 2 */
IF ~~ contract_2_reduced
  SAY ~[C-AW01TL] ~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",18) AddExperienceParty(8500) GiveGoldForce(1000)~ SOLVED_JOURNAL ~Disputed Contract Completed

I completed a contract granted by Teldra today. I am not sure why people are not able to resolve their own problems, but if they need someone to step in, at least I can gain some coin for it.~ EXIT
END

//\\//\\//\\Business//\\//\\//\\
IF ~~ c_businessgood
  SAY ~[C-AW01TL] Not really. Well, actually, it is too good. There are few recruitable people left to enroll. Every day we get more mercenary work, what with uprisings and rebellions and needed protection. Whole armies are on the march, and no one is completely sure why.~
  ++ ~[PC] Then I will make a great candidate for any work the regular companies can't or won't take, right?~ + c_businessgoodreply_1
  ++ ~[PC] At least you have a full purse now.~ + c_businessgoodreply_2
  ++ ~[PC] I thought there could never be too much business.~ + c_businessgoodreply_3
  ++ ~[PC] Well, perhaps you will have to turn to prostitution. I could be your trial run, if you wanted.~ + c_businessgoodreply_4
  ++ ~[PC] Well, it is good talking to you. I will see you later.~ + i_will_be_here
END

IF ~~ c_businessgoodreply_1
  SAY ~[C-AW01TL] Sure enough. It never rains without a benefit to someone. Lucky you.~
  IF ~~ THEN EXIT
END

IF ~~ c_businessgoodreply_2
  SAY ~[C-AW01TL] For now, yes. And with all the movement, there will be plenty of accounts to manage and enogh to keep me going for quite some time. But these things are cyclical. Eventually, I am going to be sitting here keeping dozens of out of work mercenaries entertained and occupied, so that they don't tear half of Amn apart out of sheer boredom and cussedness.~
  IF ~~ THEN EXIT
END

IF ~~ c_businessgoodreply_3
  SAY ~[C-AW01TL] Supply and demand, m'<PRO_BOYGIRL>, supply and demand. It is great to have strong demand, but when it outstrips supply, I end up on the pointy end of the spear. So far, that last has been only a figure of speech, because I don't subcontract Chill work. Best decicision of my life.~
  IF ~~ THEN EXIT
END

IF ~~ c_businessgoodreply_4
  SAY ~[C-AW01TL] Hey, what a great idea. I have an even better one. You bend over, and I'll go find something large and spiky to ram up your rear.~
  IF ~~ THEN EXIT
END

IF ~~ breach_of_contract_go_away
  SAY ~[C-AW01TL] Look, <GABBER>...~
  IF ~Global("c-aranbreachcontract","C-AR01",0)~ THEN GOTO breach_1_bugger_off
  IF ~Global("c-aranbreachcontract","C-AR01",1)~ THEN GOTO breach_2_bugger_off
  IF ~Global("c-aranbreachcontract","C-AR01",2)~ THEN GOTO breach_3_bugger_off
  IF ~Global("c-aranbreachcontract","C-AR01",3)~ THEN GOTO breach_4_bugger_off
END
  
IF ~~ breach_1_bugger_off  
  SAY ~[C-AW01TL] You seem to have a hard time with this whole "I just can't do business with you" concept. Go away.~
  IF ~~ THEN DO ~SetGlobal("c-aranbreachcontract","C-AR01",1)~ EXIT
END

IF ~~ breach_2_bugger_off  
  SAY ~[C-AW01TL] Are you hard of hearing? Or do you just think with your ass instead of your brains?~
  IF ~~ THEN DO ~SetGlobal("c-aranbreachcontract","C-AR01",2)~ EXIT
END

IF ~~ breach_3_bugger_off  
  SAY ~[C-AW01TL] Shove your smalltalk. I don't talk to slime that breaks contracts.~
  IF ~~ THEN DO ~SetGlobal("c-aranbreachcontract","C-AR01",3)~ EXIT
END

IF ~~ breach_4_bugger_off  
  SAY ~[C-AW01TL] At what point do I need to call in a few favors from some of the Companies? Should I put out the word that you are bad for business, and have you targetted by the Guild?~
  IF ~~ THEN DO ~SetGlobal("c-aranbreachcontract","C-AR01",0)~ EXIT
END

IF ~~ c_nice_looking_but_dumb
  SAY ~[C-AW01TL] I thought you hailed from Candlekeep, the center of all knowledge and enlightenment. Apparently, they grow them cute but dumb up that way. With me, business first, business second, and pleasure a far distant third.~
  IF ~~ THEN EXIT
END

IF ~~ if_1_you_are_that_desparate
  SAY ~[C-AW01TL] If you are that lacking for coin, I may have something for you, too.~
  IF ~~ THEN GOTO i_have_some_work
END

IF ~~ that_2_goes_for_me_too
  SAY ~[C-AW01TL] That goes for me, too, of course. Come back and talk when he is more accessible. Gods. I never thought I'd describe him as inaccessible.~
  IF ~~ THEN EXIT
END

IF ~~ not_that_it_matters
  SAY ~[C-AW01TL] Not that it matters much. I'm just suprised Orrin is still working with you. Then again, breaking an existing contract is against his religion, no matter who it is with.~
  IF ~~ THEN EXIT
END

IF ~~ since_you_did_so_well_last_time
  SAY ~[C-AW01TL] Hey, you did well enough last time... if you are interested, I have something that seems right up your alley.~
  IF ~~ THEN GOTO i_have_some_more_work
END

// Blue Boars
// Blazidon One-Eye up in Waterdeep mentioned your sister doing well.

IF ~~ but_you_already_knew_that
  SAY ~[C-AW01TL] I have no idea why I bother saying that, since you already know it. Habit, job requirement, boredom, or perhaps just because it is a way to spark conversation, I guess.~
  IF ~~ THEN EXIT
END

IF ~~ i_have_some_work
  SAY ~[C-AW01TL] I have a contract from the Sage's Guild that I am having trouble fulfilling. I need a reasonably discreet guard for some research project or other, just for a few hours. The pay is not great, but it should be only a day out of your life. Interested?~
  ++ ~[PC] The whole offer sounds tempting, but I am not sure I can take any more contracts just yet.~ + still_thinking_about_it
  ++ ~[PC] I think I will take that contract.~ + yes_i_will
  ++ ~[PC] I am not interested in mercenary contract work. Not now, and pretty much not ever.~ + no_not_ever
  ++ ~[PC] That depends. Will my taking that contract make you happy? Just how many drinks does a <PRO_MANWOMAN> have to buy you before <PRO_HESHE> can tell you how attractive you are?~ + perhaps_if_you_want_to_date
  ++ ~[PC] Look, I have other things on my mind right now. Perhaps later.~ + still_thinking_about_it
  + ~RandomNum(3,1)~ + ~[PC] I think that sounds about as exciting as shoveling out a stable, but I need the money. I will take it.~ + yes_i_will
  + ~RandomNum(3,2)~ + ~[PC] I think that sounds about as exciting as watching kobolds mate, but I need the money. I will take it.~ + yes_i_will
  + ~RandomNum(3,3)~ + ~[PC] I think that sounds about as exciting as reading Volo's works on the Dung Beetles of Neverwinter, but I need the money. I will take it.~ + yes_i_will
  + ~RandomNum(4,1)~ + ~[PC] I think that sounds about as exciting as shoveling out a stable. I will pass.~ + still_thinking_about_it
  + ~RandomNum(4,2)~ + ~[PC] I think that sounds about as exciting as watching kobolds mate. I will pass.~ + still_thinking_about_it
  + ~RandomNum(4,3)~ + ~[PC] I think that sounds about as exciting as reading Volo's works on the Dung Beetles of Neverwinter. I will pass.~ + still_thinking_about_it
  + ~RandomNum(4,4)~ + ~[PC] I think that sounds about as exciting as watching for a Masked Lord of Waterdeep to show her face. I will pass.~ + still_thinking_about_it
END



IF ~~ hows_it_going /* double duty - testing state - allows quick diagnosis */
  SAY ~[C-AW01TL] So, how are things progressing on that contract?~
  + ~Global("c-arancontract","GLOBAL",0)~ + ~[PC] What contract?~ + h_i_g_0
  + ~Global("c-arancontract","GLOBAL",1)~ + ~[PC] Well, you offered it, but I haven't taken it yet.~ + no_details_please
  + ~Global("c-arancontract","GLOBAL",2)~ + ~[PC] Well, I have taken it, but I haven't completed it yet.~ + no_details_please
  + ~Global("c-arancontract","GLOBAL",3)~ + ~[PC] I met with the sage, but he wants to do some highly suspect things. I have not decided if I am going to complete the contract.~ + c_dontbreakit
  + ~Global("c-arancontract","GLOBAL",4)~ + ~[PC] I have met with the sage and agreed to help him, but I am having second thoughts. This looks like a recipie for unmitigated disaster.~ + c_dontbreakit
  + ~Global("c-arancontract","GLOBAL",5)~ + ~[PC] That damned fool sage got in over his head, but we talked our way out of it. Everybody wins. Except him, I guess.~ + how_did_i_miss_that_surrendered
  + ~Global("c-arancontract","GLOBAL",6)~ + ~[PC] I resolved it with words. Lots of them. You know, I am beginning to think I can talk a dragon out of her scales.~ + how_did_i_miss_that_negotiate
  + ~Global("c-arancontract","GLOBAL",7)~ + ~[PC] I resolved it with force. The sage is alive, at least until he tries to do something so stupid again.~ + how_did_i_miss_that_clobber
  + ~Global("c-arancontract","GLOBAL",8)~ + ~[PC] The sage is dead. There is no more contract.~ + how_did_i_miss_that_sagedead
  + ~Global("c-arancontract","GLOBAL",9)~ + ~[PC] Well, I refused the contract while it was in progress.~ + breach_of_contract_go_away
  + ~Global("c-arancontract","GLOBAL",10)~ + ~[PC] That is old news. I completed it, remember?~ + h_i_g_10
  + ~Global("c-arancontract","GLOBAL",11)~ + ~[PC] Well, you offered me that second contract, but I haven't taken it yet.~ + no_details_please
  + ~Global("c-arancontract","GLOBAL",12)~ + ~[PC] Well, you offered me that second contract and I accepted it, but I haven't completed it yet.~ + no_details_please
  + ~Global("c-arancontract","GLOBAL",13)~ + ~[PC] We all came to a mutually satisfactory settlement.~ + h_i_g_13
  + ~Global("c-arancontract","GLOBAL",14)~ + ~[PC] I sided with the noble, and made sure the tenants remembered that there were other ways to resolve the matter.~ + h_i_g_14
  + ~Global("c-arancontract","GLOBAL",15)~ + ~[PC] I sided with the peasants, and got the noble to back down.~ + h_i_g_15
  + ~Global("c-arancontract","GLOBAL",16)~ + ~[PC] I decided to kill them all and let Cyric, Kelemvor, or whatever god is scrabbling for that portfolio right now sort them all out.~ + h_i_g_16
  + ~Global("c-arancontract","GLOBAL",17)~ + ~[PC] Well, I refused the contract while it was in progress.~ + breach_of_contract_go_away
  + ~GlobalGT("c-arancontract","GLOBAL",17)~ + ~[PC] What contract? I have completed two for you, and you have not given me any more work.~ + h_i_g_18
  + ~GlobalGT("c-arancontract","GLOBAL",0) GlobalLT("c-arancontract","GLOBAL",5)~ + ~[PC] I have decided that I am not going to fulfil the contract. Find someone else to do it.~ + c_dontbreakit 
  + ~GlobalGT("c-arancontract","GLOBAL",10) GlobalLT("c-arancontract","GLOBAL",17)~ + ~[PC] I have decided that I am not going to fulfil the contract. Find someone else to do it.~ + c_dontbreakit2
END 

IF ~~ h_i_g_10
  SAY ~[C-AW01TL] So you did. Well have a drink on me, then.~
  IF ~~ THEN EXIT
END

IF ~~ how_did_i_miss_that_surrendered /* 5 */ 
  SAY ~[C-AW01TL] Well, I'll be a monkey's mother. Somehow, I missed this. Here...~
  IF ~~ THEN GOTO resolve_four
END

IF ~~ how_did_i_miss_that_negotiate /* 6 */ 
  SAY ~[C-AW01TL] Well, I'll be a monkey's mother. Somehow, I missed this. Here...~
  IF ~~ THEN GOTO resolve_three
END

IF ~~ how_did_i_miss_that_clobber /* 7 */ 
  SAY ~[C-AW01TL] Well, I'll be a monkey's mother. Somehow, I missed this. Here...~
  IF ~~ THEN GOTO resolve_two
END

IF ~~ how_did_i_miss_that_sagedead /* 8 */ 
  SAY ~[C-AW01TL] Well, I'll be a monkey's mother. Somehow, I missed this. Here...~
  IF ~~ THEN GOTO resolve_dead
END

IF ~~ c_h_i_g_0
  SAY ~[C-AW01TL] Gods, I am having some sort of memory lapse. I could have sworn I already offered you a contract.~
  IF ~!InParty("c-aran")~ THEN GOTO c_bring_aran_by_and_we_will_talk
  IF ~InParty("c-aran")~ THEN GOTO i_have_some_work
END

IF ~~ c_bring_aran_by_and_we_will_talk
  SAY ~[C-AW01TL] Get Aran and drop in again for a chat. I have some work I can give him. Well, both of you, actually.~
  IF ~~ THEN EXIT 
END

IF ~~ c_dontbreakit
  SAY ~[C-AW01TL] That would be... unfortunate. A contract is a contract. The Guild is not big on defaulters.~
  ++ ~[PC] I think I can risk your displeasure. It is not like I was getting anything out of this contract worth having, anyways.~ + c_finebethatway
  ++ ~[PC] Why, what would you do to me?~ + c_nothingmuch
  ++ ~[PC] I have no choice. I have more important things that need to be done. Find someone else.~ + c_finebethatway
  ++ ~[PC] On second thought, I will complete the contract.~ + c_sounds_good
  ++ ~[PC] Is there any reason why this needs to be done right away?~ + c_nothingmuchreply_3 
  ++ ~[PC] I could do it for a bit more coin, if you wanted to negotiate.~ + c_nothingmuchreply_1
END

IF ~~ c_dontbreakit2
  SAY ~[C-AW01TL] Look, you did some decent work before, and you should know the policy. A contract is a contract. The Guild is not big on defaulters.~
  ++ ~[PC] I think I can risk your displeasure. It is not like I was getting anything out of this contract worth having, anyways.~ + c_finebethatway
  ++ ~[PC] Why, what would you do to me?~ + c_nothingmuch
  ++ ~[PC] I have no choice. I have more important things that need to be done. Find someone else.~ + c_finebethatway
  ++ ~[PC] On second thought, I will complete the contract.~ + c_sounds_good
  ++ ~[PC] Is there any reason why this needs to be done right away?~ + c_nothingmuchreply_3 
  ++ ~[PC] I could do it for a bit more coin, if you wanted to negotiate.~ + c_nothingmuchreply_1
END

IF ~~ c_nothingmuch
   SAY ~[C-AW01TL] What? Oh, you mean what consequences? Well, no more business with those I represent, and I certainly am not going to work with someone who has crossed me.~
   ++ ~[PC] I could do it for a bit more coin, if you wanted to negotiate.~ + c_nothingmuchreply_1
   ++ ~[PC] On second thought, I will complete the contract.~ + c_sounds_good
   ++ ~[PC] Is there any reason why this needs to be done right away?~ + c_nothingmuchreply_3
   ++ ~[PC] So no assassination contracts to duck, no mercenary bands with my name on a "kill first, resurrect and ask questions later" list?~ + c_nothingmuchreply_4
   ++ ~[PC] Well then, I am not going to fulfil this contract. Find someone else.~ + c_finebethatway
END

IF ~~ c_nothingmuchreply_1
  SAY ~[C-AW01TL] Compensation as agreed, no more, no less. If someone gets killed, you get to loot the corpse, of course. If the ciontractee gets killed by the contractor, there will be Cyric to pay, and bane to eat your soul. This is standard freelance work. If you didn't want it, you should have refused it before you signed on.~
  ++ ~[PC] I am not going to fulfil this contract. Find someone else.~ + c_finebethatway
  ++ ~[PC] Well then, I might get around to doing it after all.~ + c_sounds_good
  ++ ~[PC] On second thought, I will complete the contract.~ + c_sounds_good
  ++ ~[PC] I don't like your attitude and your inflexibility, and I hate the job. I won't do it~ + c_finebethatway
END

IF ~~ c_nothingmuchreply_3
  SAY ~[C-AW01TL] Nope.~
  ++ ~[PC] Good. It seems like a waste of my time, but at least I can put it off for awhile.~ + c_sounds_good
  ++ ~[PC] Well then, I might get around to doing it after all.~ + c_sounds_good
  ++ ~[PC] On second thought, I will complete the contract.~ + c_sounds_good
  ++ ~[PC] I could do it for a bit more coin, if you wanted to negotiate.~ + c_nothingmuchreply_1
  ++ ~[PC] I am not going to fulfil this contract. Find someone else.~ + c_finebethatway
END

IF ~~ c_sounds_good
  SAY ~[C-AW01TL] Sounds fine with me. Hey, bring me back a souvenir, or something. I am starting to miss being part of the action.~
  IF ~~ THEN EXIT
END

IF ~~ c_nothingmuchreply_4
  SAY ~[C-AW01TL] Blighted hells, what do you think this is, some kind of bard's fantasy? If I tried to kill every half-wit and low-life who reneged on mercenary contract work, I would be out of business in a week! It is a freelance contract. Do it and get paid, or don't do it and look somewhere else for work.~
  ++ ~[PC] Are you calling me a half-wit or a low-lofe?~ + c_nothingmuchreply_4reply_1
  ++ ~[PC] I could do it for a bit more coin, if you wanted to negotiate.~ + c_nothingmuchreply_1
  ++ ~[PC] On second thought, I will complete the contract.~ + c_nothingmuchreply_2
  ++ ~[PC] Is there any reason why this needs to be done right away?~ + c_nothingmuchreply_3
  ++ ~[PC] Well then, I am not going to fulfil this contract. Find someone else.~ + c_finebethatway
END

IF ~~ c_nothingmuchreply_4reply_1
  SAY ~[C-AW01TL] Of course not. Well, if you are keeping your word, I'm not. If you are backing out, then I am not likely to be civil, now, am I?~
  ++ ~[PC] I could do it for a bit more coin, if you wanted to negotiate.~ + c_nothingmuchreply_1
  ++ ~[PC] On second thought, I will complete the contract.~ + c_nothingmuchreply_2
  ++ ~[PC] Is there any reason why this needs to be done right away?~ + c_nothingmuchreply_3
  ++ ~[PC] Well then, I am not going to fulfil this contract. Find someone else.~ + c_finebethatway
END

IF ~~ c_finebethatway
  SAY ~[C-AW01TL] That is a pity. But the gods like our free will. It amuses them to see people doing stupid things like breaking their word. We won't be doing any further business together.~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",17)~ EXIT
END

IF ~~ i_have_some_more_work
  SAY ~[C-AW01TL] I have some more work available. This time it is a bit politically sensitive, but compared to that last little suprise, it can't be that bad.~
  = ~[C-AW01TL] A young jackass of a Lord has managed to get his tenants close to a full scale rebellion. No one wants to touch the matter, as the Lord in question is well connected, and some of the tenants are good Guild members... and I don't mean the Ladies Home Sewing Cirle of Greater Athalka.~
  = ~[C-AW01TL] I have a contract here that says 'resolve this matter'. Just the kind of thing no self-respecting sellsword would willingly do... an open ended, undetailed, general requirement, with no parameters or guildelines. So of course, I immediately thought of you.~
  = ~[C-AW01TL] The good news is that it pays 1000gp, no questions asked, no names required. Just fix the problem in whatever way works, and make sure none of the players end up running home to mommy crying about how unjust and unfair life is.~
  = ~[C-AW01TL] Interested?~
  ++ ~[PC] The whole offer sounds tempting, but I am not sure I can take any more contracts just yet.~ + still_thinking_about_it
  ++ ~[PC] I think I will take that contract.~ + yes_i_will
  ++ ~[PC] I am not interested in any more mercenary contract work. Not now, and pretty much not ever.~ + no_not_ever
  ++ ~[PC] That depends on how interested you are in practicing some, err... combat manouvers... with me. I am a <PRO_MANWOMAN> of action, and I think we might be just right for each other.~ + perhaps_if_you_want_to_date
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] Hey, perhaps this time Aran will manage to actually hide in a shadow or two. Successfully, and without muttering curses under his breath.~ + reply_aran_thief
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] That depends. Will Aran actually have to cast a spell?~ + reply_aran_thief
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] Hold on... Aran, you had better pray to your god for guidance on this matter. No, swearing doesn't count as a prayer.~ + reply_aran_thief
  + ~!Class("c-aran",CLERIC_ALL) !Class("c-aran",MAGE_ALL) !Class("c-aran",THIEF_ALL)~ + ~[PC] Hey, for a change of pace, this time let's let Aran do all the talking. Or grunting. Or whatever it is he does.~ + reply_aran_thief
END

IF ~~ so_will_or_wont
  SAY ~[C-AW01TL] Heh. So, yes or no on the whole contract thing?.~
  ++ ~[PC] I'll take the work.~ + explain_2_quest
  ++ ~[PC] I might be back later.~ + still_2_thinking_about_it
  ++ ~[PC] Not right now. Probaby never, actually, but I don't want to hurt your feelings.~ + still_2_thinking_about_it
  ++ ~[PC] I'll pass. These things always seem to end up with a very small reward for a very big amount of pain and suffering.~ + still_2_thinking_about_it
END

IF ~~ yes_2_i_will
  SAY ~[C-AW01TL] Good. I could use some good news right now, and you just provided some.~
  IF ~~ THEN DO ~SetGlobal("c-arancontract","GLOBAL",12)~ GOTO explain_2_quest
END

IF ~~ perhaps_2_if_you_want_to_date
  SAY ~[C-AW01TL] Look, you do good work, but I just have to say no. No offense meant, but I like to keep business separate from personal matters.~
  ++ ~[PC] In that case, I am not interested.~ + still_2_thinking_about_it
  ++ ~[PC] It was worth a shot. I'll take the work.~ + explain_2_quest
  ++ ~[PC] I might be back later.~ + still_2_thinking_about_it
  ++ ~[PC] On second thought, I could use some coin. Sign me up.~ + explain_2_quest
  ++ ~[PC] And people say I have a bad attitude.~ + still_2_thinking_about_it
END

IF ~~ still_2_thinking_about_it
  SAY ~[C-AW01TL] Well, you did good work before, but I do not have much time left before someone forces the issue. Whenever you make up your mind, just let me know.~
  IF ~~ THEN GOTO i_will_be_here
END

IF ~~ still_thinking_about_it
  SAY ~[C-AW01TL] Well, the matter is not that pressing. The Sage's chapter around here once took two months to decide appropriate seating arrangements. Big windbags, most of them. Give a person tenure, and it is amazing how much they like to hear themselves talk. Anyhow...~
  IF ~~ THEN GOTO i_will_be_here
END

IF ~~ yes_i_will
  SAY ~[C-AW01TL] Well, that is good news for both of us, then. I need that contract done right, and you need something worthwile to do to line your purse.~
  ++ ~[PC] I am sure you will make sure I am appropriately compensated. My services do not come cheap.~ + reply_1_attitude
  ++ ~[PC] That sounds like a winning combination. What do you want me to do?~ + explain_1_quest
  ++ ~[PC] Get that contract out and explain. There is no sense in wasting more time.~ + explain_1_quest
  ++ ~[PC] I can think of several things to do with you that might be quite worthwhile...~ + work_not_grabass
  ++ ~[PC] Wait... I can't do this right now. Perhaps I will check back in with you later.~ + i_will_be_here
END

IF ~~ reply_1_attitude
  SAY ~[C-AW01TL] Look, Aran is the Guild-bonded here, not you. If you are going to get an attitude, I can find someone else to do this.~
  ++ ~[PC] You sound offended. I thought a lowly barrel-scraping recruiter like you would have a tougher skin.~ + reply_1_tougher_skin
  ++ ~[PC] Right, right... no offense meant. What do you want me to do?~ + explain_1_quest
  ++ ~[PC] Look, just get that contract out and explain. There is no sense in wasting more time.~ + explain_1_quest
  ++ ~[PC] You look like the kind of woman who likes a little tough love. Do you want to skip all this and go have a little sparring match? ~ + work_not_grabass
  ++ ~[PC] Wait... I can't do this right now. Perhaps I will check back in with you later.~ + i_will_be_here
END

IF ~~ work_not_grabass
  SAY ~[C-AW01TL] Hey, I am a mercenary, and a blighted good one. If I wanted to play grab-ass with you, I would have walked up to you and asked if you liked your eggs scrambled or poached.~
  ++ ~[PC] You sound offended. I thought a lowly barrel-scraping recruiter like you would have a tougher skin.~ + reply_1_tougher_skin
  ++ ~[PC] Right, right... no offense meant. What do you want me to do?~ + explain_1_quest
  ++ ~[PC] Look, just get that contract out and explain. There is no sense in wasting more time.~ + explain_1_quest
  ++ ~[PC] Wait... I can't do this right now. Perhaps I will check back in with you later.~ + i_will_be_here
END

IF ~~ reply_1_tougher_skin
  SAY ~[C-AW01TL] You would think. But right now, I have had my fill of smart-mouthed assholes who think they are better than me. Tell you what. You go away and come back talking business, and I will forget this ever happened. Otherwise, stick your left fist where the sun doesn't shine.~
  IF ~~ THEN EXIT
END

IF ~~ no_not_ever
  SAY ~[C-AW01TL] I understand. You know where I am if you change your mind, or need a few swords to hire on. But since most of the experienced hands are already being hired out, I do not expect you will see much more available than raw recruits.~
  IF ~~ THEN EXIT
END

IF ~~ perhaps_if_you_want_to_date
  SAY ~[C-AW01TL] I would say I was flattered, but to tell you the truth, I have heard every form of every proposition ever tried out on the face of Toril. Perhaps after contracts have been settled, or world peace is achieved.~
  IF ~~ THEN EXIT
END

IF ~~ no_details_please
  SAY ~[C-AW01TL] Well, I am glad to see you are working. I do not have any more information to give you, so my advice is to get the job done quickly without asking too many questions, same as any contract ever made.~
  IF ~~ THEN EXIT
END

IF ~~ talk_you_buy_one
  SAY ~[C-AW01TL] That sounds fair to me.~
  IF ~~ THEN EXIT
END

IF ~~ i_will_be_here
  SAY ~[C-AW01TL] Drop by any time. I will be right here. I might even be sober.~
  IF ~~ THEN EXIT
END

IF ~~ explain_1_quest
  SAY ~[C-AW01TL] Easy enough a task. Go to the << FINISH THIS WITH AREA AND SETIUP >> PLACEHOLDER ~
  ++ ~[PC] I think I can handle that. I probably could do it alone, but I guess it never hurts to have someone to hand me a nice drink while I save the day.~ DO ~SetGlobal("c-arancontract","GLOBAL",2)~ UNSOLVED_JOURNAL ~Guard Duty

I have taken a contract with Teldra to guard some sage's precious books for a few hours. The pay is high, which means with my luck there will be more to the story then hanging around doing nothing for a few hours~ + no_details_please
  ++ ~[PC] It sounds like I should get there pretty quickly. That sage must be very anxious to get to work on whatever he feels needs so much protection.~ DO ~SetGlobal("c-arancontract","GLOBAL",2)~ UNSOLVED_JOURNAL ~Guard Duty

I have taken a contract with Teldra to guard some sage's precious books for a few hours. The pay is high, which means with my luck there will be more to the story then hanging around doing nothing for a few hours~ + no_details_please 
  ++ ~[PC] Got it. I'll be back.~ DO ~SetGlobal("c-arancontract","GLOBAL",2)~ UNSOLVED_JOURNAL ~Guard Duty

I have taken a contract with Teldra to guard some sage's precious books for a few hours. The pay is high, which means with my luck there will be more to the story then hanging around doing nothing for a few hours~ + no_details_please
  ++ ~[PC] You know, you should not have said easy. That is a dead giveaway that some horrible twist of fate will turn a pleasant day into a nightmare.~ DO ~SetGlobal("c-arancontract","GLOBAL",2)~ UNSOLVED_JOURNAL ~Guard Duty

I have taken a contract with Teldra to guard some sage's precious books for a few hours. The pay is high, which means with my luck there will be more to the story then hanging around doing nothing for a few hours~ + no_details_please
  ++ ~[PC] I don't want this contract. Don't you have anything else?~ + c_nope_nuttin
END

IF ~~ c_nope_nuttin
  SAY ~[C-AW01TL] No, I don't. Do you want the work, or not?~
  ++ ~[PC] I might. Or I might not. I'll go think about it, and get back to you.~ + talk_you_buy_one
  ++ ~[PC] Do I want it? No. Do I need the coin badly enough? Yes. I'll take it.~  DO ~SetGlobal("c-arancontract","GLOBAL",2)~ UNSOLVED_JOURNAL ~Guard Duty

I have taken a contract with Teldra to guard some sage's precious books for a few hours. The pay is high, which means with my luck there will be more to the story then hanging around doing nothing for a few hours~ + no_details_please 
  ++ ~[PC] I'll take it.~  DO ~SetGlobal("c-arancontract","GLOBAL",2)~ UNSOLVED_JOURNAL ~Guard Duty

I have taken a contract with Teldra to guard some sage's precious books for a few hours. The pay is high, which means with my luck there will be more to the story then hanging around doing nothing for a few hours~ + no_details_please 
  ++ ~[PC] Ten tradebars and a case of Rashemi Firewine says the books are secretly slime monsters in disguise, and the 'sage' is actually a vampire.~  DO ~SetGlobal("c-arancontract","GLOBAL",2)~ UNSOLVED_JOURNAL ~Guard Duty

I have taken a contract with Teldra to guard some sage's precious books for a few hours. The pay is high, which means with my luck there will be more to the story then hanging around doing nothing for a few hours~ + no_details_please 
  ++ ~[PC] I'll go talk to him, at least.~ + talk_you_buy_one
  ++ ~[PC] No, I don't want it. If I change my mind, I know where to find you.~ + talk_you_buy
END

IF ~~ explain_2_quest
  SAY ~[C-AW01TL] ~
  ++ ~[PC] narcissistic~ + 
  ++ ~[PC] compassion~ DO ~SetGlobal("c-arancontract","GLOBAL",2)~ + 
  ++ ~[PC] practical~ DO ~SetGlobal("c-arancontract","GLOBAL",2)~ + 
  ++ ~[PC] inappropriate~ + 
  ++ ~[PC] exit_talk~ + 
END

IF ~~ c_not_yet_met_aran
  SAY ~[C-AW01TL] I do have a good prospect for you, if you need someone who can fight and keep an accounting ledger.~
  ++ ~[PC] Actually, I was looking to be employed myself. Is there any short term work available?~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_workavailable
  + ~InParty("j#kelsey") InMyArea("j#kelsey") !StateCheck("j#kelsey",CD_STATE_NOTVALID)~ + ~[PC] I already have Kelsey here to keep the books, and while he can't fight very well he is a strong enough spellcaster.~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_aran_kelsey/* aran_kelsey */
  + ~RandomNum(3,3)~ + ~[PC] I just thought you were the barmaid. Do you work here?~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_1_thoughtbarmaid
  + ~RandomNum(3,2)~ + ~[PC] I just thought you were the barmaid. Do you work here?~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_2_thoughtbarmaid
  + ~RandomNum(3,1)~ + ~[PC] I just thought you were the barmaid. Do you work here?~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_3_thoughtbarmaid
  + ~RandomNum(3,3)~ + ~[PC] I was admiring the curve of your breastplate.~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_obnoxious_1
  + ~RandomNum(3,2)~ + ~[PC] You are very pretty, in a "cross-me-and-I-will-kill-you" kind of way.~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_obnoxious_2
  + ~RandomNum(3,1)~ + ~[PC] I was thinking perhaps you might be up for some fun, clothing optional.~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_obnoxious_3
  ++ ~[PC] I might be interested in hiring some help. Where can I find this sellsword?~ DO ~SetGlobal("c-aranemployment","C-AR01",1)~ + c_findaran
END

IF ~~ c_findaran
  SAY ~[C-AW01TL] Take a look in the room just north of here. North is that way, by the way. Well, unless one of those Cowled Wizards has been messing with some 'deviant act', as they call it, and messed up the compass directions again. I guess Amn feels madmen are the best keepers of madmen.~
  ++ ~!InParty("c-aran") !Global("c-aranemployment","GLOBAL",2)~ + ~[PC] Hey, what do you think about him? You know, the sellsword?~ + c_available_to_pc
  ++ ~[PC] Thanks for the help.~ + no_problemo_hotshot
  ++ ~[PC] What do you know about the Cowled Wizards?~ + the_less_you_know
END

IF ~~ the_less_you_know
  SAY ~[C-AW01TL] Friend, the less you know the better. They have a tight grip on magic use, and getting permits from them is worse than trying to get blood from a stone. They don't like me much. The feeling is mutual.~
  IF ~~ THEN EXIT 
END

IF ~~ no_problemo_hotshot
  SAY ~[C-AW01TL] I live to serve. Well, actually, that is complete bullshit, but you look like a person who might be either a client or an employee someday, so it never hurts to put a little shine on, right?~
  ++ ~[PC] Employeee, I bet. You look like the kind of impossibly attractive lady who lives to send people like me out to get all bruised and battered while you sit there drinking and counting your profit.~ + good_one_charname
  ++ ~[PC] Client, I bet. You look like the kind of dashing stranger I would hire to clean my boots.~ + good_one_charname
  ++ ~!InParty("c-aran") !Global("c-aranemployment","GLOBAL",2)~ + ~[PC] I guess. Hold on... what do you think about Aran Whitehand? Just the high points.~ + c_available_to_pc
  ++ ~[PC] Sure. I will be moving along, now.~ EXIT
END

IF ~~ good_one_charname
  SAY ~[C-AW01TL] I like you, smartass. Come talk to me sometime.~
  IF ~~ THEN EXIT
END

IF ~~ not_erika_why
  SAY ~[C-AW01TL] Erika? No. No relation. Why?~
  ++ ~[PC] You seem to have very similar reactions to Aran, here.~ + c_seen_one_seen_em_all
  ++ ~[PC] Never mind. Did you mentioned something about some work that you might want done?~ +  i_have_some_work
  + ~Gender(Player1,MALE)~ + ~[PC] You are both dazzlingly beautiful.~ + male_money_talks_bullshit_walks
  + ~Gender(Player1,FEMALE)~ + ~[PC] You are both dazzlingly beautiful.~ + female_money_talks_bullshit_walks
  ++ ~[PC] I was wondering if she had any suitors. She seems very interesting.~ + c_stick_to_business_now
END

IF ~~ c_stick_to_business_now
  SAY ~[C-AW01TL] I make a decent living coordinating hires for mercenaries, nothing else. If you want a matchmaker, find someone who does that.~
  ++ ~[PC] Never mind. You mentioned some work that you might want done?~ +  i_have_some_work
  ++ ~[PC] Perhaps I will be back to talk to you later.~ + i_will_be_here
END

IF ~~ male_money_talks_bullshit_walks
  SAY ~[C-AW01TL] Gods, another one. Look, boyo, you are kind of cute, but business is business. Keep all that sweet talk for the next drunken half-orc female who wanders by. Now, about that contract...~
  IF ~~ THEN GOTO i_have_some_work
END

IF ~~ female_money_talks_bullshit_walks
  SAY ~[C-AW01TL] Gods, a female Aran. Look, you are kind of cute, and I am very.... flexible, in all the right ways...  but business is business. Keep all that sweet talk for the next drunken half-orc who wanders by. Now, about that contract...~
  IF ~~ THEN GOTO i_have_some_work
END

IF ~~ c_seen_one_seen_em_all
  SAY ~[C-AW01TL] Proactive self defense. Aran here thinks "hey, will you pass me that drink" means "I want you to make sweet love to me". To be fair, most mercenaries around here think that, male or female.~
  ++ ~[PC] So he is unreliable?~ + c_reliable_obnoxious  
  ++ ~[PC] You mentioned some work that you might want done...~ +  i_have_some_work
END

IF ~~ c_reliable_obnoxious
  SAY ~[C-AW01TL] I don't put up with unreliable. Whitehand is reliable, remarkably flexible, and can do the job. You just have to watch him when it comes to fraternization with females, be they mercenaries, townsfolk, waitstaff, geese, ducks, pigs...~
  IF ~~ THEN EXTERN C-ARANJ c_i_heard_no_complaints
END

IF ~~ c_aran_kelsey
  SAY ~[C-AW01TL] Well, regardless, Aran can be a good man in a fight. He can read and write in more than one language, though he speaks common like the most illiterate trades-way bastard I ever did hear. Translates, too. Done service in at least two mercenary companies; I think he grew up in a trading family. Thinks he's a gift from the gods to every woman, and tries to prove it. He has a room here, first door on your left.~
  ++ ~[PC] Is he reliable?~ + c_avail_reliable
  + ~Gender(Player1,FEMALE)~ + ~[PC] Is he cute?~ + c_avail_female_cute
  ++ ~[PC] Where was that room again?~ + c_avail_stupid
  + ~Gender(Player1,MALE)~ + ~[PC] Is he cute?~ + c_avail_male_cute
  ++ ~[PC] How much do I owe you for the information?~ + c_avail_cost
  ++ ~[PC] He doesn't sound useful enough to me. Anyone else? Or anything I can do to get some coin?~ + c_workavailable
END

IF ~~ c_available_to_pc
  SAY ~[C-AW01TL] Good man in a fight. Can read and write in more than one language, though he speaks common like the most illiterate trades-way bastard I ever did hear. Translates, too. Done service in at least two mercenary companies; I think he grew up in a trading family. Thinks he's a gift from the gods to every woman, and tries to prove it. He has a room here, first door on your left.~
  ++ ~[PC] Is he reliable?~ + c_avail_reliable
  + ~Gender(Player1,FEMALE)~ + ~[PC] Is he cute?~ + c_avail_female_cute
  ++ ~[PC] Where was that room again?~ + c_avail_stupid
  + ~Gender(Player1,MALE)~ + ~[PC] Is he cute?~ + c_avail_male_cute
  ++ ~[PC] How much do I owe you for the information?~ + c_avail_cost
  ++ ~[PC] He doesn't sound useful enough to me. Anyone else? Or anything I can do to get some coin?~ + c_workavailable
END

IF ~~ c_avail_reliable
  SAY ~[C-AW01TL] Reliable? Yes. Predictable? Mostly. Annoying? At times. Useful? Yes.~
  IF ~~ THEN GOTO c_any_other_questions
END

IF ~~ c_avail_female_cute
  SAY ~[C-AW01TL] If you like that sort of thing, sure. A bit rough around the edges, but you tell him to keep his hands to himself and check in with him from time to time, and you won't have any problems.~
  IF ~~ THEN GOTO c_any_other_questions
END

IF ~~ c_avail_stupid
  SAY ~[C-AW01TL] Are you sure you are interested in a sellsword? I can recommend a decent healer for your deafness problem, or perhaps removal of the feeblemind spell you seem to be under. Go out the door there, turn north, look to your left, and there will be a big brown wooden thing we like to call a "door". You look for the funny brass thing halfway down the left hand side, grab hold of it, and it will make the big brown wooden thing open. He's in there.~
  IF ~~ THEN GOTO c_any_other_questions
END

IF ~~ c_avail_male_cute
  SAY ~[C-AW01TL] If you like that sort of thing, sure. But like I said, he likes the ladies a fair sight better than he should. If you are looking for a little romance on the trail, keep dreaming. That's about all you are going to get to do.~
  IF ~~ THEN GOTO c_any_other_questions
END

IF ~~ c_avail_cost
  SAY ~[C-AW01TL] Nothing. He's Fighters Guild, but freelance. Any work he gets from me, I take a percentage from his cut. Any work he gets freelace, he pays his dues, so it is covered. He owes me some money, so getting him employed is in my best interests.~
  IF ~~ THEN GOTO c_any_other_questions
END

IF ~~ c_any_other_questions
  SAY ~[C-AW01TL] Any other questions?
  ++ ~[PC] Is he reliable?~ + c_avail_reliable
  + ~Gender(Player1,FEMALE)~ + ~[PC] Is he cute?~ + c_avail_female_cute
  ++ ~[PC] Where was that room again?~ + c_avail_stupid
  + ~Gender(Player1,MALE)~ + ~[PC] Is he cute?~ + c_avail_male_cute
  ++ ~[PC] How much do I owe you for the information?~ + c_avail_cost
  ++ ~[PC] He doesn't sound useful enough to me. Anyone else? Or anything I can do to get some coin?~ + c_workavailable
END

IF ~~ c_obnoxious_1
  SAY ~[C-AW01TL] Keep dreaming. That's about all you are going to get to do.~
  IF ~~ THEN EXIT
END

IF ~~ c_obnoxious_2
  SAY ~[C-AW01TL] And you are very alluring yourself, in an "I-am-so-desparate-I-will-proposition-anything-that-moves" kind of way. Go tell it to the 'Fist. I hear some of their recruits are so horny they will sleep with Chill.~
  IF ~~ THEN EXIT
END

IF ~~ c_obnoxious_3
  SAY ~[C-AW01TL] Sure thing. You go find us a nice room, strip naked, and tie yourself to the bedpost. I'll be in just as soon as I can. Oh, wait... I made a promise to myself to avoid sleeping with obnoxious idiots. Sorry.~
  IF ~~ THEN EXIT
END

IF ~~ c_workavailable
  SAY ~[C-AW01TL] Unfortunately, not right now. The last group headed out Dalewards, headed for reinforcement of some campaign or other. Tethyr just closed out recruitment for some squabbles they are having, The 'Fist has their hands full re-training what they already have for guard duty and caravan protection, and you don't look like the Mindgulph's type. Blue Boars... perhaps.~
  = ~[C-AW01TL] I will keep my ears open for anything available, though. Odd things pop up from time to time, and it might be beneficial to both of us to have some problems solved on a lesser contract. Not every problem needs swatting with a batillion of armed regulars.~ 
  IF ~~ THEN EXIT
END

IF ~~ c_1_thoughtbarmaid
  SAY ~[C-AW01TL] Look, I don't know where you hail from, but around here barmaids don't have scars like these, or equipment like this.~
  IF ~~ THEN EXIT
END

IF ~~ c_2_thoughtbarmaid
  SAY ~[C-AW01TL] The nice thing about looking like this is idiots walk right up within sword range and leer at me, which gives me just enough room to put them out of my misery.~
  IF ~~ THEN EXIT
END

IF ~~ c_3_thoughtbarmaid
  SAY ~[C-AW01TL] The swordbelt should have given it away. Or the duelling scar. Or the fact that I am NOT SERVING DRINKS.~
  IF ~~ THEN EXIT
END


END /* of append to C-AW01TL */ 

APPEND ~C-ARANJ~

IF ~~ reply_aran_thief
  SAY ~[ARAN] Blighted hells, you be hurtin' a lad's feelin's, eh?~
  IF ~~ THEN EXTERN C-AW01TL so_will_or_wont
END

END


CHAIN C-ARANJ c_aranteldracontract
~[ARAN] Ho, Teldra. I think you do get prettier every time I see you.~
== C-AW01TL ~[C-AW01TL] You know, you say that every time you greet me.~
== C-ARANJ ~[ARAN] And it be true every time.~
== C-AW01TL ~[C-AW01TL] You are so full of horsedung.~
== C-ARANJ ~[ARAN] Any work for me? I mean, do there be any work for us?~
== C-AW01TL ~[C-AW01TL] For you, no. For you and <PRO_HIMHER>, yes.~
END
IF ~~ THEN EXTERN C-AW01TL i_have_some_work

CHAIN C-ARANJ c_aranteldratalk1
~[ARAN] Ho, Teldra. I think you do get prettier every time I see you.~
== C-AW01TL ~[C-AW01TL] Pity I can't say the same about you.~
== C-ARANJ ~[ARAN] Meaner, too.~
== C-AW01TL ~[C-AW01TL] Well, you sure know how to compliment a woman. Now, wipe that stupid grin off your face and tell me what is troubling you, and therefore me.~
== C-ARANJ ~[ARAN] This be th' smartest grin I know.~
== C-AW01TL ~[C-AW01TL] That figures. Looking for a contract?~
== C-ARANJ ~[ARAN] Got one. But mayhap <CHARNAME> here might be lookin' for somethin' short term.~
== C-AW01TL ~[C-AW01TL] For you, perhaps. I may have something of an easy one, guarding some old books for some research project or other. Decent pay for a job even you couldn't screw up too badly, and only a day's work. Interested?~
END
++ ~[PC] Actually, it has been nice meeting you, but we should get going.~ EXTERN C-AW01TL i_will_be_here
++ ~[PC] Are you related to the barmaid?~ EXTERN C-AW01TL not_erika_why
++ ~[PC] I would like to hear more about that book-guarding duty.~ EXTERN C-AW01TL i_have_some_work
++ ~[PC] If you are finished flirting, Aran, we shold leave. Now.~ EXTERN C-AW01TL i_will_be_here

CHAIN C-ARANJ c_i_heard_no_complaints
~[ARAN] Hey, I do be callin' foul, pun intended! I never did hear any complaints from you.~
== ~[C-AW01TL] I have low standards.~
END
++ ~[PC] I would like to hear more about that book-guarding duty.~ EXTERN C-AW01TL i_have_some_work
++ ~[PC] Perhaps we should go.~ EXTERN C-AW01TL i_have_some_work
++ ~[PC] I get the picture.~ EXTERN C-AW01TL i_have_some_work
+ ~Gender(Player1,FEMALE)~ + ~[PC] Should I be worried?~ EXTERN C-AW01TL no_worries-hands_to_self

CHAIN C-AW01TL no_worries-hands_to_self
~[C-AW01TL] Worried? Personally? Oh, no, nothing like that. He minds his business, just not his manners. Tell him what you want, talk to him, and if necessary lay down some ground rules. But he knows no means no.~ 
== C-ARANJ ~[ARAN] You two know I be standin' right here, eh?~  
== C-AW01TL ~[C-AW01TL] Be a good lad and shut the hells up when we are negotiating contract, Aran. Make yourself useful and take notes for the lady.~ 
== C-ARANJ ~[ARAN] Ma'am, yes ma'am.~
END
++ ~[PC] You mentioned some work that you might want done...~ EXTERN C-AW01TL i_have_some_work
++ ~[PC] Perhaps we should go.~ EXTERN C-AW01TL i_have_some_work
++ ~[PC] I get the picture.~ EXTERN C-AW01TL i_have_some_work
++ ~[PC] Perhaps we could hear about this 'opportunity' later. I am a bit busy right now..~ EXTERN C-AW01TL i_will_be_here


CHAIN C-ARAN reply_1_explain
~[C-ARAN] ~
== CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~[CERND] ~
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN ~[EDWIN] ~
== HAERDAJ IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN ~[HAERDALIS] ~
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] ~
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN ~[JAN] ~
== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~[KELDORN] ~
== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~[KORGAN] ~
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~[MAZZY] ~
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN ~[MINSC] ~
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN ~[NALIA] ~
== VALYGARJ IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~[VALYGAR] ~
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN ~[VICONIA] ~
== YOSHJ IF ~InParty("Yoshimo") InMyArea("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN ~[YOSHIMO] ~
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN ~[IMOEN] ~
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] ~
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~[ANOMEN] ~
== C-AW01TL ~[C-AW01TL] ~
END
++ ~[PC] narcissistic~ EXTERN C-AW01TL reply_1
++ ~[PC] compassion~ EXTERN C-AW01TL reply_2
++ ~[PC] practical~ EXTERN C-AW01TL reply_3
++ ~[PC] inappropriate~ EXTERN C-ARANJ reply_4
++ ~[PC] exit_talk~ EXTERN C-AW01TL reply_exiting





/*


Valygar ICT possibilites from vanilla dialog: 

  SAY ~Hmph.  I have been in the army, friend...and it is much more dreary than you think.  The victories, too, are few and far between...and hardly worth the price you are forced to pay.~ // #30046 
  SAY ~I take it you're talking to me, hm?~ // #38949 
  SAY ~I'm not interested in a woman who has lain with every man in Amn and then some.  As for the prostitute, she doesn't do it for me, either.~ // #48746 
  SAY ~I am not eager to arouse the attention of the Cowled Wizards, <CHARNAME>, but neither am I displeased to dispatch one of their members.  Do as it pleases you.~ // #49492 
  SAY ~Fool mages, always sticking their noses in where they don't belong. ~ // #55954 

*/


