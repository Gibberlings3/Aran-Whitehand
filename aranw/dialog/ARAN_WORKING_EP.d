
/// WARNING
////  WORKSPACE
///////   DOI NOT COMPILE!!!

///// NOT DONE YET 

/* ToB FriendTalk Followup : Post Wraith */
IF ~Global("c-aranpostwraith","GLOBAL",3)~ c_are_we_on_or_are_we_done
  SAY ~[ARAN] You keep lookin' at me.~
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I am prettty sure I like looking at you.~ + 
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] No more than usual.~ + 
  ++ ~[PC] Of course I am. You have been tossing and turning all night every night.~ + 
  ++ ~[PC] No I have not.~ + 
  ++ ~ 
END

/* /////////////////////////////////////////////////////// */

/* SoA FriendTalks */

/* BG2 FriendTalk 20 c-aranfriendbg2 = 39  : Tools, Weapons, and Intention */
IF ~Global("c-aranfriendbg2","GLOBAL",39)~ THEN BEGIN a5246
  SAY @13760 /* [ARAN] You know, you be a bit more powerful than you seem to realize. */
  ++ @13761 /* [PC] I don't know. It feels like I am becoming a weapon. */ DO ~SetGlobal("c-aranfriendbg2","GLOBAL",40) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5247
  ++ @13762 /* [PC] I realize exactly how powerful a weapon I am becoming. */ DO ~SetGlobal("c-aranfriendbg2","GLOBAL",40) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5247
  ++ @13763 /* [PC] No, I am not. */  DO ~SetGlobal("c-aranfriendbg2","GLOBAL",40) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5248
  ++ @13764 /* [PC] What about you? You seem to have grown a bit since we first met in that inn room. */ DO ~SetGlobal("c-aranfriendbg2","GLOBAL",40) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5264
  ++ @13765 /* [PC] This is a bad time to have another one of your deep existential conversations. */ DO ~SetGlobal("c-aranfriendbg2","GLOBAL",340) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5250
END
/* GOTO BG2 FriendTalk 20 c-aranfriendbg2 = 39  : Tools, Weapons, and Intention : Replies */

/* BG2 FriendTalk 20 c-aranfriendbg2 = 39  : Tools, Weapons, and Intention : Replies */
IF ~~ a5248
  SAY @13766 /* [ARAN] Not what? Not powerful, not realize? */
  ++ @13767 /* [PC] Not powerful. */ + a5251
  ++ @13768 /* [PC] I don't think I am any more or less powerful than when I started out. */ + a5251
  ++ @13769 /* [PC] I seem to have trouble realizing exactly how powerful I have become. */ + a5249
  ++ @13770 /* [PC] I don't know. I am still figuring out who I really am. */ + a5255
  ++ @13765 /* [PC] This is a bad time to have another one of your deep existential conversations. */ + a5250
END

IF ~~ a5249
  SAY @13771 /* [ARAN] Mayhap it scares you a bit. It scares me, somehow, but more on your account than on mine. */
  IF ~~ THEN GOTO a5247
END

IF ~~ a5250
  SAY @13772 /* [ARAN] Now we have been naught but good companions for a fair while now. Can a lad have a real conversation about all this? */
  ++ @13773 /* [PC] I don't like talking about all the power I have gained. It feels like I am becoming a weapon. */ + a5247
  ++ @13774 /* [PC] I do not need to talk about it. I realize exactly how powerful a weapon I am becoming. */ + a5247
  ++ @13775 /* [PC] I suppose. You know, you seem to have grown a bit since we first met in that inn room. */ + a5264
  ++ @13776 /* [PC] I did not ask for any of this, Aran. It was forced on me. Talking about it is useless. */ + a5263
  ++ @13777 /* [PC] Shut up, Aran. */ + a5259
 END 
  
IF ~~ a5251
  SAY @13778 /* [ARAN] That be th' largest load o' crap I done heard from you, ever. */
  ++ @13779 /* [PC] Look... it scares me, Aran. Even talking about it scares me. */ + a5252
  ++ @13780 /* [PC] Well, you were due some retribution for the loads you throw around. What is next, casting me as the future Ruler of Toril? */ + a5258
  ++ @13781 /* [PC] I may be gaining power, but I do not seem to have any power over my own direction. I get tossed from battle to battle on the wind. */ + a5255
  ++ @13782 /* [PC] Perhaps your head would look better if it was separated from your body. You have gone way past what I tolerate from you, sellsword. */ + a5259  
  ++ @13777 /* [PC] Shut up, Aran. */ + a5259
END

IF ~~ a5264
  SAY @13783 /* [ARAN] That be a right solid way o' changin' th' subject, but I be serious. This be about you, not me. */
  ++ @13779 /* [PC] Look... it scares me, Aran. Even talking about it scares me. */ + a5252
  ++ @13776 /* [PC] I did not ask for any of this, Aran. It was forced on me. Talking about it is useless. */ + a5263  
  ++ @13784 /* [PC] Is that what you see me as? A weapon? */ + a5247
  + ~Class(Player1,CLERIC_ALL)~ + @13785 /* [PC] I serve my deity. I am guided by my faith wherever that takes me, and whatever that makes me. */ + a5247
  + ~Class(Player1,MAGE_ALL)~ + @13786 /* [PC] I study magic. I am guided by my research wherever that takes me, and whatever that makes me.  */ + a5247
  + ~Class(Player1,FIGHTER_ALL)~ + @13787 /* [PC] I fight. I am guided by my tasks wherever they take me, and however they shape me. */ + a5247
  + ~Class(Player1,THIEF_ALL)~ + @13788 /* [PC] I do not always choose the job. Wherever the work takes me, and whatever it makes me, I am always looking for opportunity. */ + a5247  
  ++ @13789 /* [PC] Whatever happened to the good old talks, where you stumbled through silly entertaining things like curry ingredients? You are too serious. */ + a5265
END

IF ~~ a5252
  SAY @13790 /* [ARAN] There be naught to be scared about, as long as you be in charge o' yourself. Your power be a sharp weapon, for sure. */
  IF ~~ THEN GOTO a5247
END

IF ~~ a5247
  SAY @13791 /* [ARAN] Weapons be tools, and naught else. It takes a person weildin' th' sword to make th' call, an' direct th' cut or thrust. Otherwise, th' sword be a heavy decoration good for naught but trippin' over, eh? */
  ++ @13792 /* [PC] I agree. But right now, I have a feeling I am not completely in command of my destiny. Who is really directing me? */ + a5255
  ++ @13793 /* [PC] That is why all this is important. I have the power to shape things, the strength to control it, and the willingness to direct it where I choose. */ + a5253
  ++ @13794 /* [PC] That is why all this is important. I have the power to shape things, but I may not have the strength to control it. */ + a5255
  ++ @13795 /* [PC] I did not ask for any of this, Aran. It was forced on me. */ + a5263
  ++ @13796 /* [PC] I don't think I want to talk about this any more. We should move on. */ + a5259
END

IF ~~ a5253
  SAY @13797 /* [ARAN] I just hope you be th' one really callin' th' shots, an' not some blighted mage or god or some such bein' behind th' scenes. */
  ++ @13798 /* [PC] If it appears others are dictating my actions, just remember... it is not the one who strikes first who wins the battle. It is the one who strikes last. */ + a5254
  ++ @13799 /* [PC] I might simply choose to become someone else's weapon. You seem to have found it easier to follow than to lead. */ + a5255
  ++ @13800 /* [PC] The gods call the shots. They interfere, they push, and they own the board. We just have to play along. */ + a5259
  ++ @13801 /* [PC] The gods mess about on the game board. We just have to take it from them and make it serve our will. */ + a5259
  ++ @13796 /* [PC] I don't think I want to talk about this any more. We should move on. */ + a5250
END

IF ~~ a5254
  SAY @13802 /* [ARAN] I suppose you be right. Only, if th' first strike be powerful enough, sometimes it wins outright, eh? */
  ++ @13803 /* [PC] Are you questioning my ability to use my power effectively? */ + a5256
  ++ @13804 /* [PC] This is more than a simple mercenary campaign. It takes time to build power, and sometimes it takes doing what others want in order to get what I want. */ + a5259
  ++ @13799 /* [PC] I might simply choose to become someone else's weapon. You seem to have found it easier to follow than to lead. */ + a5261
  ++ @13805 /* [PC] The secret to my overbearing power is eating your curry. It will be my tool for conquest. */ + a5258
  ++ @13800 /* [PC] The gods call the shots. They interfere, they push, and they own the board. We just have to play along. */ + a5259
  ++ @13801 /* [PC] The gods mess about on the game board. We just have to take it from them and make it serve our will. */ + a5259
END

IF ~~ a5255
  SAY @13806 /* [ARAN] Tyr's Eye, I blighted well hope you are th' one directin' yourself. You, I have some understandin' about, an' I put my trust in your judgement. Most others, not so much. */
  ++ @13807 /* [PC] Then I had better learn how to wield myself effectively. */ + a5256
  ++ @13799 /* [PC] I might simply choose to become someone else's weapon. You seem to have found it easier to follow than to lead. */ + a5255
  ++ @13800 /* [PC] The gods call the shots. They interfere, they push, and they own the board. We just have to play along. */ + a5259
  ++ @13801 /* [PC] The gods mess about on the game board. We just have to take it from them and make it serve our will. */ + a5259
  ++ @13799 /* [PC] I might simply choose to become someone else's weapon. You seem to have found it easier to follow than to lead. */ + a5261
END

IF ~~ a5256
  SAY @13808 /* [ARAN] Effectively be part o' th' matter, I guess. But I were hopin' for more along th' lines o' compassionately. */
  ++ @13809 /* [PC] I think you had better define what you mean by 'compassionately'. */ + a5257
  ++ @13810 /* [PC] It takes time to build power, and sometimes it takes doing what others want in order to get what I want. In the end, though, my will is what matters. */ + a5259
  ++ @13811 /* [PC] I weigh my decisions carefully when I can. But sometimes, people get hurt no matter what I choose. */ + a5259 
  ++ @13799 /* [PC] I might simply choose to become someone else's weapon. You seem to have found it easier to follow than to lead. */ + a5261
  ++ @13812 /* [PC] Effectively, compassionately... just words. Sometimes we just have to do what is in front of us and move on. */ + a5259
END

IF ~~ a5257
  SAY @13813 /* [ARAN] Hey, now, I hold my own counsel on that. Sometimes people get killed an' things get destroyed on account o' there be no choice. */
  = @13814 /* [ARAN] It be th' needless actions what might be held off on account o' compassion. */
  ++ @13815 /* [PC] We agree on that, Aran. We would not be traveling together if we did not. */ + a5259
  ++ @13799 /* [PC] I might simply choose to become someone else's weapon. You seem to have found it easier to follow than to lead. */ + a5261
  ++ @13816 /* [PC] I find myself doing no needless actions. Everything I do is designed to build my own power and control my own destiny. */ + a5261
  ++ @13811 /* [PC] I weigh my decisions carefully when I can. But sometimes, people get hurt no matter what I choose. */ + a5259 
  ++ @13817 /* [PC] I weigh my decisions carefully when I can. But people getting hurt is their problem, not mine. */ + a5261 
  ++ @13789 /* [PC] Whatever happened to the good old talks, where you stumbled through silly entertaining things like curry ingredients? You are too serious. */ + a5265
END
	
IF ~~ a5258
  SAY @13818 /* [ARAN] Aye, now there be a thought. <CHARNAME>, th' Force o' Faerun, Ruler o' All Toril, built up by serial doses o' my famous gut-bustin' fire-breathin' curry. */
  ++ @13819 /* [PC] Me? Ruler of all that I survey? Now that is a laugh. */ + a5261
  ++ @13820 /* [PC] Me? Ruler of all I survey? Of course. I shall make you my Chief Wineskin Washer. And Chief Wineskin Emptier, as well. */ + a5260
  ++ @13821 /* [PC] I think I might be more comfortable if you were in charge. Well, more in danger of bar brawls, but at least I would not be everyone's target. */ + a5261
  ++ @13822 /* [PC] Laugh all you want, Aran, my boy. I intend to find my own path, even if it means conquering the very Planes themselves to do it. */ + a5262
  ++ @13823 /* [PC] Dear gods... the curry. Somehow, I knew that was the source of true power. I shall place you in charge of all cooking. And cleaning. */ + a5260
END

IF ~~ a5259
  SAY @13824 /* [ARAN] I suppose you be right. But there be plenty o' time ahead to talk. Mayhap we pick this up later. */
  IF ~~ THEN EXIT
END

IF ~~ a5260
  SAY @13825 /* [ARAN] Now that sounds right fine, it does. In fact, here be th' first duty entrusted me, all done already. One wineskin, empty, an' just beggin' for a dip in th' water! */
  IF ~~ THEN EXIT
END

IF ~~ a5261
  SAY @13826 /* [ARAN] Think about what you just said right careful, there. You already be a fair sight more powerful than I could hope to get. I don't mind bein' your sword, an' even bein' a tool to be used by you. */
  = @13827 /* [ARAN] Me, I can make a cut here or there, an' mayhap be useful in a limited way. You... you will influence th' whole o' blighted Toril, an' mayhap more. */
  IF ~~ THEN EXIT
END

IF ~~ a5262
  SAY @13828 /* [ARAN] An' I believe you will do just that, too. Mayhap I needs be expandin' my cookin' options. Takes a might large bit o' food to fuel Planar domination. */
  IF ~~ THEN EXIT
END

IF ~~ a5263
  SAY @13829 /* [ARAN] Don't you be worryin' naught about that. You take charge o' your destiny, forced or not, an' I will be right here to make sure things work out for th' best. */
  IF ~~ THEN EXIT
END

IF ~~ a5265
  SAY @13830 /* [ARAN] Well, I can trot out a joke or somethin', if that be th' way you really feel. */
  = @13831 /* [ARAN] Last market day, I were goin' to be buyin' an invisible sword. I took my coin an' found a smith what dealt wi' them, but... */
  = @13832 /* [ARAN] ...when I got there , I just couldn't see th' point! */
  IF ~~ THEN EXIT
END

/* ToB FriendTalks */


/* ToB FriendTalk 7 : Inspiration: War stories about summoning saving/ruining the day properly - eric */
/* Moonshe Axes */
IF ~Global("c-aranfriendtob","GLOBAL",13)~ THEN BEGIN a5220
	SAY @13833 /* [ARAN] Did you ever get on th’ wrong side of a summonin’? */
	++ @13834 /* [PC] A what? */ DO ~SetGlobal("c-aranfriendtob","GLOBAL",14) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5221
	++ @13835 /* [PC] I am not sure. Does picking up a chatterbox of a sellsword on the Promenade of Athlaka count? */ DO ~SetGlobal("c-aranfriendtob","GLOBAL",14) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5222
	+ ~RandomNum(5,5)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3193 /* c-aranshutup60 */
	+ ~RandomNum(5,4)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3194 /* c-aranshutup61 */
	+ ~RandomNum(5,3)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3195 /* c-aranshutup62 */
	+ ~RandomNum(5,2)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3196 /* c-aranshutup63 */
	+ ~RandomNum(5,1)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3197 /* c-aranshutup64 */		
	++ @13837 /* [PC] I do not think that I have ever had that experience. */ DO ~SetGlobal("c-aranfriendtob","GLOBAL",14) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5225
	+ ~Class(Player1,MAGE_ALL)~ + @13838 /* [PC] I can tell you from both personal experience and study, it is not something most mages live through. */ DO ~SetGlobal("c-aranfriendtob","GLOBAL",14) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5225
	+ ~!Class(Player1,MAGE_ALL)~ + @13839 /* [PC] I have heard that a miscast summoning is not something most mages live through. */ DO ~SetGlobal("c-aranfriendtob","GLOBAL",14) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5225	
	++ @13840 /* [PC] Yes, I have. */ DO ~SetGlobal("c-aranfriendtob","GLOBAL",14) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5225
	++ @13841 /* [PC] Why talk about ancient history? We are very powerful now. Why bring up the distant past? */ DO ~SetGlobal("c-aranfriendtob","GLOBAL",14) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a5236
END
/* ToB FriendTalk 7 : miscast summoning : goto followup7 */

/* ToB FriendTalk 7 : miscast summoning : followup7 */
IF ~~ a5221
	SAY @13842 /* [ARAN] Summonin’. You know, bringin’ in an animal or some sort o’ magical bein’ or somethin’ what to attack your foe. */
	++ @13843 /* [PC] No, I have not been on the wrong side of a summoning. */ + a5225
	++ @13844 /* [PC] I know what it means. It just isn't something that pops up regularly in idle conversation. */ + a5223
	++ @13845 /* [PC] Summoning by wand, by ring, by scroll, or by spell? */ + a5224
	++ @13846 /* [PC] Summ-o-ning. S u m m o n i n g. G. The first syllable is emphasized, and the last 'g' is a hard plosive. */ + a5222
	+ ~Class(Player1,CLERIC_ALL) Class("c-aran",CLERIC_ALL)~ + @13847 /* [PC] We should both pray together. It will take both of our divine contacts to clean up your speech. */ + a5222
	+ ~Class(Player1,CLERIC_ALL) !Class("c-aran",CLERIC_ALL)~ + @13848 /* [PC] I will pray for you, Aran. It will take all of my divine powers to clean up your speech. */ + a5222
	+ ~!Class(Player1,CLERIC_ALL) Class("c-aran",CLERIC_ALL)~ + @13849 /* [PC] You should go pray, Aran. It will take all of your divine contact to clean up your speech. */ + a5222
	+ ~!Class(Player1,CLERIC_ALL) !Class("c-aran",CLERIC_ALL)~ + @13850 /* [PC] We need to go find a cleric, Aran. It will take someone with strong contact with the divine to clean up your speech. */ + a5222
	++ @13841 /* [PC] Why talk about ancient history? We are very powerful now. Why bring up the distant past? */ + a5236
END
 
IF ~~ a5222
	SAY @13851 /* [ARAN] That be right funny. This be me, laughin'. */
	= @13852 /* [ARAN] That whole summonin' thing be a right tricky business, an' seein' it go wrong be an experience. */
	IF ~~ THEN GOTO a5225
END

IF ~~ a5223
	SAY @13853 /* That be an interestin' idea, there. Ordinary conversation. Naught that we do be ordinary, in any sense o' th' word. */
	IF ~~ THEN GOTO a5225
END

IF ~~ a5224
	SAY @13854 /* [ARAN] As far as I be knowin', any o' those can fail. But I were talkin' about th' spell. Most times, if it goes wrong, you don't rightly survive th' experience. */
	IF ~~ THEN GOTO a5225
END
	
IF ~~ a5225	
	SAY @13855 /* [ARAN] I did once. Serving’ up in Moonshea, we had ourselves a Wand what got ahead of himself an’ tried to help by summonin’ up some support. Intelligent sort o’ mage, but he were not that wise. */
	++ @13856 /* [PC] An intelligent self-aware wand? Or more tradespeak? */ + a5226
	++ @13857 /* [PC] Was that really necessary? */ + a5228
	++ @13858 /* [PC] So you fought off the summoned creatures, saved the day, and then promptly got drunk. */ + a5227
	++ @13859 /* [PC] Did the spell not work? */ + a5231
	++ @13860 /* [PC] Dear gods, you are determined to tell this story, aren't you. */ + a5227
	++ @13841 /* [PC] Why talk about ancient history? We are very powerful now. Why bring up the distant past? */ + a5236
END

IF ~~ a5226
	SAY @13861 /* [ARAN] Tradespeak. Th' Wand was castin' a spell, not usin' a wand or staff or naught o' th' sort. */
	IF ~~ THEN GOTO a5227
END

IF ~~ a5227
	SAY @13862 /* [ARAN]	Now, am I goin' to get to tell you th' story, or is this goin' to be one o' those times where you be interruptin' all th' time? */
	++ @13863 /* [PC] It is going to be one of those times. It is worth it to see your face turn all red and twisty when you are interrupted. */ + a5229
	++ @13864 /* [PC] Oh, by all means, tell your story. I will listen intently like a good little <PROGIRLBOY>. */ + a5229
	+ ~RandomNum(5,5)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3193 /* c-aranshutup60 */
	+ ~RandomNum(5,4)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3194 /* c-aranshutup61 */
	+ ~RandomNum(5,3)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3195 /* c-aranshutup62 */
	+ ~RandomNum(5,2)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3196 /* c-aranshutup63 */
	+ ~RandomNum(5,1)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3197 /* c-aranshutup64 */	
	++ @13865 /* [PC] *I* am interrupting *you*? Who started this conversation, anyways? */ + a5241
	++ @13866 /* [PC] Did I ever tell you about the time I single-handedly fought off a few rats in a storeroom at Candlekeep? It sounds about as exciting as this story. */ + a5241
	++ @13867 /* [PC] Tell the story. I will try not to interrupt. */ + a5229
END	
	
IF ~~ a5229
	SAY @13868 /* [ARAN] Fine, then. Glad to amuse you. On any account, th' mage were tryin' to summon up some help. */
	IF ~~ THEN GOTO a5228
END
	
IF ~~ a5228
	SAY @13869 /* [ARAN] It seemed a right fine idea at th’ time. Unfortunately for us, apparently we were close to some wellmoon, or moonwell, or some sort o’ mystical waters. An’ apparently shadow magic an’ regular summoning’ spells are supposed to be kept separate. */
	++ @13870 /* [PC] Let me guess. He summoned a dragon, and its shadow showed up and ate it. */ + a5231
	++ @13871 /* [PC] I am not really interested in hearing more of this story. I call the shots, Aran. Let's move on. */ + a5241
	++ @13872 /* [PC] I have heard this story at least four times, Aran. Perhaps we could just continue on in silence? */ + a5241
	++ @13873 /* [PC] What do you know about the Moonwells in Moonshea? */ + a5230
	++ @13874 /* [PC] It sounds like you were about to get illuminated by a targeting spell. */ + a5231
END

IF ~~ a5230
	SAY @13875 /* [ARAN] Naught, or less than naught. An' apparently th' mage what were with us knew less than me, eh? We thought things were on th' path to ruin when th' blighted mage started glowin' a strange bluish color. We were sure he were about to explode. */
	IF ~~ THEN GOTO a5231
END

IF ~~ a5231
	SAY @13876 /* [ARAN] Worse than that. Something’ went wrong right proper, it did. Instead o’ summonin’ help, he brought in a pack o’ dire wolves what decided that we were th’ best looking’ source o’ a snack around. */
	++ @13877 /* [PC] You are telling me this story, so obviously you found a way to deal with the situation. */ + a5232
	++ @13878 /* [PC] How did the mage react? Poorly, I suppose. */ + a5232
	++ @13879 /* [PC] Snacks. I could eat, you know. How about less talk and we have some of these berries. They are tasty... */ + a5241
	++ @13880 /* [PC] Easy fix - summon some rabbits or any food source, and then run away while the dire wolves feast. I should have been there to fix everything. */ + a5241
	++ @13881 /* [PC] That sounds.... dangerous. */ + a5232
END

IF ~~ a5232
	SAY @13882 /* [ARAN] Aye. Th’ poor lad panicked, an’ summoned again, an’ sure enough another pack showed up right in th’ midst. We scurried up th’ trees right quick, while th’ two packs fought over which one were going’ to eat us.  */
	++ @13883 /* [PC] So now you are stuck up a tree, you have two packs competing to eat you, and you still have your original enemies. This sounds bad. */ + a5233
	++ @13884 /* [PC] They killed each other? */ + a5237
	++ @13872 /* [PC] I have heard this story at least four times, Aran. Perhaps we could just continue on in silence? */ + a5241
	++ @13885 /* [PC] What about your original enemies? I would think you would attract lots of unwanted attention. */ + a5233
	++ @13886 /* [PC] You do realize I have heard this before, right? */ + a5234
END

IF ~~ a5233
	SAY @13887 /* [ARAN] That be th' whole sum o' it, aye. It did all work out for th' best, though. Our enemies came lookin' to see what all th' noise were about. Two shakes o' a lamb's tail, an' we had front row seats to a grand scrimmage. An when it be over, we just mopped up th' few what were still alive. */
	++ @13888 /* [PC] Are all these stories you tell me truth, or just tall tales? */ + a5239
	++ @13889 /* [PC] Let me guess... then Elminster's Army showed up and you defeated them with your curry. */ + a5240
	++ @13890 /* [PC] I would rather not do any of this, Aran. */ + a5235
	++ @13891 /* [PC] I can see why you like telling stories. They are just hard to believe. */ + a5239
	++ @13892 /* [PC] I think we should visit Moonshea some day. It sounds like it was exciting. */ + a5241
END

IF ~~ a5234
	SAY @13893 /* [ARAN] What do you be thinkin' happened, then? */
	++ @13894 /* [PC] Well, if it was anything like the last time you told this, then the mage managed to summon two sets of creatures at once, they ate each other, and you all lived happily ever after. */ + a5237
	+ ~Class(Player1,MAGE_ALL)~ + @13895 /* [PC] Does it matter? You are telling tall tales anyways. Summoning spells do not interact with the wellsprings on Moonshea. */ + a5239
	+ ~!Class(Player1,MAGE_ALL)~ + @13896 /* [PC] Does it matter? You are telling tall tales anyways. You could say that Cyric Himself showed up and scared you all away. */ + a5239
	++ @13897 /* [PC] The mage polymorphed himself into the shape of a squirrel, and the dire wolves ate him. */ + a5243
	++ @13898 /* [PC] I think the real story is that you fell asleep while on guard duty and had a very vivid dream. */ + a5242
	++ @13899 /* [PC] I really don't care, because the subject of the story should be me, not you. */ + a5242
	++ @13890 /* [PC] I would rather not do any of this, Aran. */ + a5235
END

 IF ~~ a5235 
 	SAY @13900 /* [ARAN] Do any o' what, exactly? */ 
 	 ++ @13901 /* [PC] Any of this talking. You tell a story, I tell a story... it distracts us from accomplishing our goals. */ + a5241   
 	 ++ @13902 /* [PC] I don't want to tell you your story. I don't want to hear you tell it, either. */ + a5242   
 	 ++ @13903 /* [PC] Oh, fine... you had trouble with a mage summoning not one but two separate packs of dire wolves, who ate each other and the enemy. You went home victorious. */ + a5244
 	 ++ @13904 /* [PC] All of the tasks, all of the fighting, all of the running all over, all of the making decisions. Just tell me what to do and I will do it. */ + a5245
 	 ++ @13905 /* [PC] You know me... you tell me. */ + a5245
END
 
IF ~~ a5236
	SAY @13906 /* [ARAN] We may be right powerful, but there always be th' need to communicate an' share. Th' ties what bind, an' all. */
	++ @13907 /* [PC] A philosopher and a sellsword. You never fit into any one category, do you. */ + a5238
	++ @13908 /* [PC] I do not need any ties to bind me to my fellow travelers. Talking about the past is a waste of time. */ + a5241
	++ @13909 /* [PC] I see your point. Telling old stories is a way we can all connect to each other. */ + a5238
	++ @13910 /* [PC] The only "connection" I need is for you to do your job. */ + a5241
	++ @13911 /* [PC] I can see why you like telling stories. Are all of them true? */ + a5239
	+ ~RandomNum(5,5)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3193 /* c-aranshutup60 */
	+ ~RandomNum(5,4)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3194 /* c-aranshutup61 */
	+ ~RandomNum(5,3)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3195 /* c-aranshutup62 */
	+ ~RandomNum(5,2)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3196 /* c-aranshutup63 */
	+ ~RandomNum(5,1)~ + @13836 /* [PC] Not interested. Let's move on, shall we? */ + a3197 /* c-aranshutup64 */	
END
	
IF ~~ a5237
	SAY @13912 /* [ARAN] Mostly, aye. But it ended up even better, on account o’ our original opponents came over to see what all th’ fuss were about, an’ got eaten for their troubles. We ended up wi’ a nice little victory, an’ all we had to do were finish off th’ stragglers on all sides. */
	++ @13888 /* [PC] Are all these stories you tell me truth, or just tall tales? */ + a5239
	++ @13913 /* [PC] That sounds like the best possible outcome for a very bad situation. */ + a2260
	++ @13914 /* [PC] I wish that you would stop telling stories and just tell me what to do to. */ + a5245
	++ @13889 /* [PC] Let me guess... then Elminster's Army showed up and you defeated them with your curry. */ + a5240
    ++ @13890 /* [PC] I would rather not do any of this, Aran. */ + a5235
END

IF ~~ a5238
	SAY @13915 /* [ARAN] Well now, I will shorten th' story up a bit. I were up in Moonshea, an' we had a mage what summoned a pack o' dire wolves what looked at us like we be dinner. Then he paniked, an' summoned a second set o' dire wolves. */ 
	++ @13888 /* [PC] Are all these stories you tell me truth, or just tall tales? */ + a5239
	++ @13916 /* [PC] Let me guess what happened next... */ + a5234
	++ @13889 /* [PC] Let me guess... then Elminster's Army showed up and you defeated them with your curry. */ + a5240
	++ @13899 /* [PC] I really don't care, because the subject of the story should be me, not you. */ + a5242	
    ++ @13890 /* [PC] I would rather not do any of this, Aran. */ + a5235	
END

IF ~~ a5239
	SAY @13917 /* [ARAN] All th’ truth, an’ nothin’ but, on my second sister’s grave. */
	++ @13918 /* [PC] You only have one sister, Aran, and she is very much alive. */ + a5242
	++ @13919 /* [PC] You do realize it is very hard to take you seriously when you exaggerate, right? */ + a5241
	++ @13920 /* [PC] I will take your word for it. */ + a5242
	++ @13921 /* [PC] Some time I will have to tell you about my adventures cleaning the dust out of Candlekeep's Readers Room. Now *there* is a story worth telling. */ + a5242
	++ @13922 /* [PC] Riiiiiiight. */ + a5242
END

IF ~~ a5240
	SAY @13923 /* [ARAN] Bane's Blood, no... we saw naught o' Elminster. An' an army? Does Elminster have an army? Hey, if he does, where be th' nearest recruitment place? A lad's got to look out for th' future, you know. */
	IF ~~ THEN EXIT
END
	
IF ~~ a5241
	SAY @13924 /* [ARAN] You do have a point. */
	IF ~~ THEN EXIT
END

IF ~~ a5242
	SAY @13925 /* [ARAN] Well, fancy that. */
	IF ~~ THEN EXIT
END

IF ~~ a5243
	SAY @13926 /* [ARAN] Hold on a mite bit, an' let me get a pen out o' my gear so's to write that down. That sounds like a better story than th; truth, it do. */
	IF ~~ THEN EXIT
END

IF ~~ a5244
	SAY @13927 /* [ARAN] Bane's Black Heart, I needs must apologise. I must have done told that one to you a dozen times if you know it by heart. */
	IF ~~ THEN EXIT
END

IF ~~ a5245
	SAY @13928 /* [ARAN] On that point, I will say naught. Speak to you, aye, an' often. Speak in support o' you, aye, an' rarely needed. Speak about you, aye. Speak for you, now that be a whole other matter entirely. */
	IF ~~ THEN EXIT
END
/* EXISTING_AYE_STATE found in existing files a2260 for ToB */

/* ToB Love Talk #2 : Aran Romance vs Anomen Romance - Perspectives and Personalities : Global("c-arantobrom","GLOBAL",3) --> Global("c-arantobrom","GLOBAL",4) */
IF ~Global("c-arantobrom","GLOBAL",3)~ THEN BEGIN a5266
  SAY  @13929 /* [ARAN] Mayhap this be a bad time, but you know me... always talkin' out o' turn. I need to ask you, though...  */
  = @13930 /* [ARAN] Any regrets? I mean, so far, you done experienced more trouble than a thousand others what walk Toril. */
  ++ @13931 /* [PC] No regrets. In the end, I will get things accomplished my way. */ DO ~SetGlobal("c-arantobrom","GLOBAL",4) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a5267
  ++ @13932 /* [PC] What's the matter, Aran? Are you having regrets about a life of neverending adventure? */ DO ~SetGlobal("c-arantobrom","GLOBAL",4) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a5268
  ++ @13933 /* [PC] Only one regret, Aran... I regret that I have not had enough time to start building a family with you. */ DO ~SetGlobal("c-arantobrom","GLOBAL",4) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a5269
  ++ @13934 /* [PC] My only regret is you. I should never have brought you here. */ DO ~SetGlobal("c-arantobrom","GLOBAL",4) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a5274
  ++ @13935 /* [PC] Well, I always wanted to be an exotic Calishite dancer.... */ DO ~SetGlobal("c-arantobrom","GLOBAL",4) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a5275 
END
/* GOTO ToB Love Talk #2 : Perspectives and Personalities : replies */

/* ToB Love Talk #2 : Perspectives and Personalities : replies */
IF ~~ a5267
  SAY @13936 /* [ARAN] I don't rightly know whether you be jokin'. Sometimes I feel like th' current sitution be what you love to do. */
  ++ @13937 /* [PC] Joking, of course. Things never work out quite the way I plan. */ + a5278
  ++ @13938 /* [PC] Don't be silly. I am strong enough to bend Fate's pathways to my will. I have you, don't I? */ + a5285
  ++ @13939 /* [PC] Blood, conflict, strife, murder, death, the end of the world as we know it, and I feel fine. Come on, it is exciting, isn't it? */ + a5276
  ++ @13940 /* [PC] None of the above. But the Fates will not be denied. I am just glad that they included you along the way. */ + a5285
  ++ @13941 /* [PC] Hey, is this deep conversation just another way of getting me into your bedroll? */ + a5284  
END

IF ~~ a5268
  SAY @13942 /* [ARAN] Well, mayhap I do. Accomplishin' great deeds an' becomin' the most known name in this part o' th' world, right up there wi' Elmister an' Blackstaff, that seemed like a great idea at the time, eh? */
  = @13943 /* [ARAN]But we have already done all that, an' received naught but more trouble for th' pain.  Even worse, it be your name alone what gets out there, really. */
  + ~CheckStatGT(Player1,12,WIS)~ + @13944 /* [PC] You do not really want that fame for yourself, Aran. You just said it was thankless pain. Does it really hurt you that I am more famous than you? */ + a5278
  + ~CheckStatGT(Player1,15,INT)~ + @13945 /* [PC] So you feel that you are getting less fame than you deserve? Or do you feel I am getting too much credit? */ + a5278
  ++ @13946 /* [PC] Fame, fortune, infamy, power, bard's tales and songs... I would give it all up if I could start life over as an exotic Calishite dancer. */ + a5275 
  + ~Alignment(Player1,MASK_GOOD)~ +  @13947 /* [PC] What is wrong with me being famous? */ + a5271
  + ~!Alignment(Player1,MASK_GOOD)~ +  @13948 /* [PC] What is wrong with me being famous? Or infamous? */ + a5272
  ++ @13949 /* [PC] Your name is out there as much as mine. */ + a5270
  ++ @13950 /* [PC] I did not ask for this. */ + a5270
  ++ @13951 /* [PC] I deserve every bit of fame. You are useful, but secondary. */ + a5274
END

IF ~~ a5269
  SAY @13952 /* [ARAN] Chauntea's Golden Arms. A child, hearth an' home, when you keep gettin' dragged into th' worst parts o' th' god's conflicts? That be an invitation to disaster, eh? But it be a nice dream. */
  IF ~~ THEN GOTO a5270
END

IF ~~ a5270
  SAY @13953 /* [ARAN] You always come out on top, but it be a sure bet that your life will never be what folks call 'ordinary'. */
  ++ @13954 /* [PC] Does that bother you? */ + a5273
  ++ @13955 /* [PC] I like it on top. Actually, I like it on the bottom, and in several other very fun variants... */ + a5284
  ++ @13956 /* [PC] Did you want things to be very different than they are now? */ + a5273
  ++ @13957 /* [PC] I was never ordinary. You, on the other hand, are very ordinary. One of you on every streetcorner. */ + a5274
  ++ @13958 /* [PC] I never wanted to be ordinary. */ + a5267
END

IF ~~ a5271
  SAY @13959 /* [ARAN] Doin' th' right thing by others seems to be more about th' harp edge o' th' sword an' less about talkin'. That do get a bit tirin' to th' spirit, is all. */
  IF ~~ THEN GOTO a5278
END

IF ~~ a5272
  SAY @13960 /* [ARAN] I mean, I know my place, an' you call th' targets. That be th' right o' it. */
  IF ~~ THEN GOTO a5278
END

IF ~~ a5273
  SAY @13961 /* [ARAN] Sometimes. I wish that the world would remake itself, an' leave you a mite bit o' space for yourself. You know, some o' those ordinary dreams we might be makin' together. */
  IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO a5271
  IF ~!Alignment(Player1,MASK_GOOD)~ THEN GOTO a5272
END

IF ~~ a5274
  SAY @13962 /* [ARAN] Well hells, that be right cold o' you. */
  ++ @13963 /* [PC] Truth is cold. Power is cold. I am cold. I think it is about time you stop talking and warmed me up. */ + a5284
  ++ @13964 /* [PC] You never really understand when I am teasing you. Perhaps if I said it with a pouty face, like a Calishite dancer? */ + a5275
  ++ @13965 /* [PC] Try again. You can do better with your compliments. How do you feel when I am here with you? */ + a5281
  ++ @13966 /* [PC] Truth is cold. Power is cold. Reality is reality, and we can do little to change it. */ + a5282
  ++ @13967 /* [PC] I am sorry. You mean well. I am just a little on edge. */ + a5278
END

IF ~~ a5275 
  SAY @13968 /* [ARAN] Now that be a mental image I am not likely to get out o' my head any time soon! I can just see it now - I'd be a right smart protector. Only I'd want all th' dancin' to be for me, eh? */
  ++ @13969 /* [PC] Seriously. I would give it all up. I never wanted to be the sharp edge of a blade gods wield about like crazed bandits. I would rather be a Calshite dancer. It amounts to the same thing... being continually used by others for their own pleasure and profit. */ + a5279
  ++ @13970 /* [PC] And every dance would be for you. Maybe you would even dance for me. Or we could dance together... */ + a5280
  + ~CheckStatGT(Player1,15,INT)~ + @13971 /* [PC] Ahha! I have successfully distracted you from your deep and dreary introspection! I shall follow up with some sharp satire, a witticism or two, followed by an intensive bought of kissing. */ + a5276
  + ~CheckStatGT(Player1,12,WIS)~ + @13972 /* [PC] I know you had some important feelings to discuss, Aran, but I need more distraction and less thinking right now. So you have a woman with low willpower in need of a boost of self-esteem, standing right here, loosening her clothing a little... */ + a5284
  ++ @13973 /* [PC] I was teasing you. Sometimes you are really slow. */ + a5267
  ++ @13974 /* [PC] So tell me why I am worth all this trouble. */ + a5281
END

IF ~~ a5276
  SAY @13975 /* [ARAN] Hey, I be serious here! How is a man supposed to be a right good partner when... */
  ++ @13976 /* [PC] I know how you feel, Aran. You don't have to tell me all the time. */ + a5277
  ++ @13977 /* [PC] You can be a good partner by assuring me that you will always be there for me. */ + a5277
  ++ @13978 /* [PC] I thought we had settled all this long ago. Why does it bother you that you and I have different strengths? */ + a5277
  ++ @13979 /* [PC] We have one area where we will always be equal. We both love each other very, very much. */ + a5277  
  ++ @13980 /* [PC] You are still talking. You are wasting my time. */ + a5279
END

IF ~~ a5277
  SAY @13981 /* [ARAN] I... Melliki's Wild Whiskers. I think I be a bloody idiot. I didn't realize I was bein' such a fool. You be right, <CHARNAME>. An' the only measure o' accomplishment that I need, anyhow, be your comfort. */
  ++ @13941 /* [PC] Hey, is this deep conversation just another way of getting me into your bedroll? */ + a5284
  ++ @13939 /* [PC] Blood, conflict, strife, murder, death, the end of the world as we know it, and I feel fine. Come on, it is exciting, isn't it? */ + a5279
  ++ @13974 /* [PC] So tell me why I am worth all this trouble. */ + a5281
  ++ @13982 /* [PC] I agree that you are an idiot. */ + a5278
  ++ @13983 /* [PC] Well then, you had better get me a really nice set of boots. That would make me more comfortable. */ + a5283
END

IF ~~ a5278
  SAY @13984 /* [ARAN] Look... mayhap my words be all wrong for what I be tryin' to say. I want naught more fame, naught more fortune, as long as I can be wi' you. But... */
  ++ @13985 /* [PC] You don't have to talk to comfort me. You could take action. */ + a5284
  ++ @13986 /* [PC] But. There is always a "but" with you. I thought you were completely mine. */ + a5285
  ++ @13987 /* [PC] Your words were wrong, and you are making it worse. */ + a5279
  ++ @13988 /* [PC] Your words are fine. Your actions are fine. Me, I am not fine. */ + a5285
  ++ @13989 /* [PC] Dreary, boring, talk talk talk. We need to find something to kill, and quickly. */ + a5284
END

IF ~~ a5279
  SAY @13990 /* [ARAN] Aye, now, that be me. Always tryin' to cheer you up a mite bit, an' failin'. */
  ++ @13991 /* [PC] You succeeded. At least you distracted me for a little while, and I could pretend things were normal. */ + a5280
  ++ @13992 /* [PC] You are right. Next time, you could try telling me a story, or acting out part of a play, or something. */ + a5280
  ++ @13993 /* [PC] Next time you want to distract me, you could try something more physical... */ + a5284
  ++ @13994 /* [PC] I am not sure the distraction worked, but I appreciate you trying. */ + a5285
  ++ @13995 /* [PC] There are some situations where nothing you can do can provide comfort. */ + a5285
END

IF ~~ a5280
  SAY @13996 /* [ARAN]  Well, now, if we be play actin', the least I can do is play along, eh? I done heard o' plays where clothin' be optional, too. Mayhap that would be th' right kind o' distraction to cheer you up. */
  IF ~~ THEN EXIT
END

IF ~~ a5281
  SAY @13997 /* [ARAN] Now, you be a sight for sore eyes, an' just bein' by your side makes me feel like I be ten feet tall. */
  ++ @13998 /* [PC] So I damage your eyesight and make you puffed up to the size of a giant. Great. I suppose I also make you gassy? */ + a5279
  ++ @13999 /* [PC] I think you are trying to compliment me... but it is missing the mark. */ + a5278
  ++ @14000 /* [PC] I could compliment you as well, but it is silly. We have more important things to be focused on. */ + a5279
  ++ @14001 /* [PC] And you make me feel practically invinceable, supported, and loved. */ + a5284
  ++ @14002 /* [PC] I know. I have that effect on people. */ + a5285
END

IF ~~ a5282
  SAY @14003 /* [ARAN] I believe some o' that, but not all. */
  IF ~~ THEN GOTO a5285
END

IF ~~ a5283
  SAY @14004 /* [ARAN] One decent pair o' boots? That could be done. I will keep a sharp eye out, eh? */
  IF ~~ THEN EXIT
END

IF ~~ a5284
  SAY @14005 /* [ARAN] Can we skip right to th' part where you tackle me an' start th' kissin'? When you talk like that to me, it gets me right excited, it does! */
  IF ~~ THEN EXIT
END

IF ~~ a5285
  SAY @14006 /* [ARAN] I done signed a contract wi' you in my heart a while back, <CHARNAME>. Good times an' bad times, I be your shield. Small comfort, but comfort to you, I hope. */
  IF ~~ THEN EXIT
END

///////////////// current code to rebuild 

/* NEW !!! */
/* ToB Love Talk #3 : statement of intent for seriousness : Global("c-arantobrom","GLOBAL",5) --> Global("c-arantobrom","GLOBAL",6) */
IF ~Global("c-arantobrom","GLOBAL",5)~ THEN BEGIN a4716
  SAY @11707 // [ARAN] You know, I do be downright lucky.
  ++ @11708 DO ~SetGlobal("c-arantobrom","GLOBAL",6) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718 // [PC] You have me, so that is true.
  ++ @11709 DO ~SetGlobal("c-arantobrom","GLOBAL",6) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718 // [PC] You have fallen in love with me.
  ++ @11710 DO ~SetGlobal("c-arantobrom","GLOBAL",6) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4717 // [PC] Well, so far, your cooking has not actually killed anyone. Though that last curry was a little too hot.
  ++ @11711 DO ~SetGlobal("c-arantobrom","GLOBAL",6) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718 // [PC] I consider myself lucky, as well.
  ++ @11712 DO ~SetGlobal("c-arantobrom","GLOBAL",6) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718 // [PC] Why are you looking at me that way?
END
/* GOTO ToB Love Talk #3 : statement of intent for seriousness : replies */
/* ToB Love Talk #3 : statement of intent for seriousness : replies */
IF ~~ a4717
  SAY @12192 // @12192 = ~[ARAN] Ah, witty reepartay, on account o' you know just how to tease me. I hope I done used that word right.~
  IF ~~ THEN GOTO a4718
END

IF ~~ a4718
  SAY @12193 // @12193 = ~[ARAN] I suspect this be where I tell you I love you, eh?~
  ++ @12194 + a4719 // @12194 = ~[PC] I love it when you say that.~
  ++ @12195 + a4724 // @12195 = ~[PC] Just as long as you don't expect me to say the same.~
  ++ @12196 + a4724 // @12196 = ~[PC] You don't love me. You lust after me. They are two very different things.~
  ++ @12197 + a4721 // @12197 = ~[PC] You have made your feelings very clear. Do you have to speak them out loud? To hear them spoken in return?~
  ++ @12198 + a4724 // @12198 = ~[PC] It would be more romantic if you would hold my hands while saying this, you know.~
END
  
IF ~~ a4719
  SAY @12199   // @12199 = ~[ARAN] So do you have anythin' to say to me?~
  ++ @12200 + a4721 // @12200 = ~[PC] That I love you?~
  ++ @12201 + a4723 // @12201 = ~[PC] I love you.~
  ++ @12202 + a4720 // @12202 = ~[PC] That you should stop looking at me so seriously, and we should move on?~
  ++ @12203 + a4720 // @12203 = ~[PC] No. What would I have to say to you?~
  ++ @12204 + a4720 // @12204 = ~[PC] That you are making a fool of yourself over a woman who will never return the love you seem to have?~
END

IF ~~ a4720
  SAY @12205 // @12205 = ~[ARAN] Hey, give a lad a chance to profess his undyin' love, eh? You be spoilin' th' moment.~ 
  ++ @12206 + a4723 // @12206 = ~[PC] You silly, silly man. Fine. I love you. Go ahead and make a complete fool out of yourself.~
  ++ @12207 + a4723 // @12207 = ~[PC] I have feelings for you too, Aran. I just get embarrassed by talking about them this way.~
  ++ @12208 + a4722 // @12208 = ~[PC] I thought man just wanted that shown.~
  ++ @12209 + a4724 // @12209 = ~[PC] I knew this day would come. Aran, we have a very enjoyable romantic fling. But I don't love you, at least not yet.~
  ++ @12210 + a4724 // @12210 = ~[PC] I do not love you, Aran. And I never will.~
END
  
IF ~~ a4721
  SAY @3601 // @3601 = ~[ARAN] Aye.~
  ++ @12208 + a4722 // @12208 = ~[PC] I thought man just wanted that shown.~
  ++ @12211 + a4724 // @12211 = ~[PC] I knew this day would come. Aran, we have a very enjoyable romantic fling. But I don't love you.~
  ++ @12206 + a4723 //
  ++ @12212 + a4724 //
  ++ @12213 + a4722 //
END
  
IF ~~ a4722
  SAY @12214 //
  ++ @12201 + a4723 //
  ++ @12215 + a4724 //
  ++ @12216 + a4724 // 
  ++ @12217 + a4724 // 
  ++ @12218 + a4724 // 
END

IF ~~ a4723
  SAY @12219 // 
  ++ @12220 + a4724  // 
  ++ @12221 + a4724 // 
  ++ @12222 + a4724 // 
  ++ @12223 + a4724 // 
  ++ @12224 + a4724 // 
END

IF ~~ a4724
  SAY @12225  // 
  ++ @12226 + a4725 // 
  ++ @12227 + a4725 // 
  ++ @12228 + a4725 // 
  ++ @12229 + a4725 // 
  ++ @12230 + a4725 // 
END

IF ~~ a4725
  SAY @12231  // 
  ++ @12232 + a4726 // 
  ++ @12233 + a4726 // 
  ++ @12234 + a4726 // 
  ++ @12235 + a4726 // 
  ++ @12236 + a4726 // 
END

IF ~~ a4726
  SAY @12237  // 
  ++ @12238 + a4727 // 
  ++ @12239 + a4727 // 
  ++ @12240 + a4727  // 
  ++ @12241 + a4736 // 
  ++ @12242 + a4727 // 
END
  
IF ~~ a4727
  SAY @12243
  ++ @12244 + a4736  // 
  ++ @12245 + a4728 // 
  ++ @12246 + a4728 // 
  ++ @12247 + a4728 // 
  ++ @12248 + a4728 // 
END
  
IF ~~ a4728
  SAY @12249  // 
  ++ @12250 + a4729 // 
  ++ @12244 + a4736 // 
  ++ @12251 + a4729 // 
  ++ @12252 + a4729 // 
  ++ @12253 + a4729 //
END
  
IF ~~ a4729
  SAY @12254 //
  ++ @12255 + a4730 //
  ++ @12256 + a4730 //
  ++ @12257 + a4736 //
  ++ @12258 + a4730 //
  ++ @12259 + a4730 //
END

IF ~~ a4730
  SAY @12260 // @12260 = ~[ARAN] Your face be a work Prism himself could have naught in th' way o' sculptin'. Sune Herself would be a mite bit jealous, were th' two o' you to compete.~
  ++ @12261 + a4731 // @12261 = ~[PC] I don't compete in beauty contests. Certainly not with gods or goddesses.~
  ++ @12262 + a4731 // @12262 = ~[PC] Your face might not win a beauty contest, Aran. But I know every crease and can trace every scar as if it were my home.~
  ++ @12263 + a4731 // @12263 = ~[PC] I admit it... I am beautiful.~
  ++ @12264 + a4731 // @12264 = ~[PC] I think beauty is in the eye of the beholder. And you are so in love you can't be objective, anyways.~
  ++ @12265 + a4736 // @12265 = ~[PC] I can't hear any more of this. Aran, if you can't stop making a fool of yourself, we should completely break it off. This was not supposed to get this serious.~
END

IF ~~ a4731
  SAY @12266  // @12266 = ~[ARAN] You have an inner power what be entirely your own. There be somethin' about you, whether there be a god's blood or no, that transcends th' ordinary in a way what can have no rational explanation. An' it be a beautiful, terrible, powerful thing.~
  ++ @12267 + a4732 // @12267 = ~[PC] I have no power. I don't even have the power to stop you pouring your whole heart out to me like this.~
  ++ @12268 + a4732 // @12268 = ~[PC] You have no concept of how much power you have over me. Your happiness is mine, and your sadness mine as well.~
  ++ @12269 + a4732 // @12269 = ~[PC] You give me too much power over you.~
  ++ @12270 + a4736 // @12270 = ~[PC] You know, I thought it would be nice to hear all of this, but it is a little sad. I think we should end anything outside of a professional relationship.~
  ++ @3589 + a4736 // @3589 = ~[PC] SHUT UP.~
END

IF ~~ a4732
  SAY @12271 // @12271 = ~[ARAN] Dear gods, what to you be wantin' to hear? I could go on all blighted day sayin' all th' bits an' pieces o' you what make me want to spend th' rest o' my days wi' you. But it be th' whole package what does that, not any o' th' parts.~
  ++ @12272 + a4735 // @12272 = ~[PC] Well, why didn't you just say that in the first place?~
  ++ @12273 + a4733 // @12273 = ~[PC] You have known me and loved me long enough to know that words never sway me. Actions always speak louder. Shout, Aran. Right now.~
  ++ @12274 + a4736 // @12274 = ~[PC] That was nice to hear. But completely and utterly a waste of time. I am not in love with you.~
  ++ @12275 + a4734 // @12275 = ~[PC] If you are finally finished making a fool of yourself, then I am glad it is out in the open. I love you, too.~
  ++ @12276 + a4736 // @12276 = ~[PC] If you are finally finished making a fool of yourself, then I am glad it is out in the open. Now you can begin to deal with the reality that I don't love you.~
END
  
IF ~~ a4733
  SAY @12277 // @12277 = ~[ARAN] Well, if I could, I would, but there be naught in th' way o' privacy right here an' now. Which brings up a point...~
  IF ~~ THEN GOTO a4735
END

IF ~~ a4734
  SAY @12278 // @12278 = ~[ARAN] Then I be a right happy man.~
  IF ~~ THEN EXIT
END

IF ~~ a4735 // romance continued
  SAY @12279 // @12279 = ~[ARAN] I rightly remember th' last piece o' th' puzzle what drives me mad, an' completely puts me under your spell. You are th' most exasperatin' creature what ever walked th' Planes.~
  IF ~~ THEN EXIT
END

IF ~~ a4736 // romance retired
  SAY @12280 // @12280 = ~[ARAN] I... well, I guess you rightly know your own mind. I have naught in th' way o' power to make you love me, so I'd best not press this any more.~
  = @12281 // @12281 = ~[ARAN] I do say, thought, that you be th' most exasperatin' creature what ever walked th' Planes.~
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ EXIT // full romance shutdown
END


/* ToB Love Talk #4 : ask the big question or not */

IF ~Global("c-arantobrom","GLOBAL",5)~ THEN BEGIN c-arantemporary_question
  SAY ~[ARAN] Now, we be supposed to have a big talk here about marriage an' such. But for now, do you think you might marry me someday?~
  ++ ~[PC] Yes!~ DO ~SetGlobal("c-arantobrom","GLOBAL",6) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + c-aran_exit_temp
  ++ ~[PC] No!~ DO ~SetGlobal("c-arantobrom","GLOBAL",6) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + c-aran_exit_temp
  ++ ~[PC] Never!!~ DO ~SetGlobal("c-arantobrom","GLOBAL",6) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + c-aran_exit_temp
END
  
IF ~~ c-aran_exit_temp
  SAY ~[ARAN] Aye then. That be th' way things will be, then. Until I bring it up in th' next talk, that is.~
  IF ~~ THEN EXIT
END

/* ToB Love Talk #5 : Friends Getting The Knot Tied */

IF ~Global("c-arantobrom","GLOBAL",7)~ THEN BEGIN a4774
  SAY @11713 // [ARAN] I done got word Kartuck be married now. He finally tied th' knot wi' that lass o' his.
  ++ @11714 DO ~SetGlobal("c-arantobrom","GLOBAL",8) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4775 // [PC] So, don't you have something to ask me?
  ++ @11715 DO ~SetGlobal("c-arantobrom","GLOBAL",8) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4776 // [PC] Who is Kartuck?
  ++ @11716 DO ~SetGlobal("c-arantobrom","GLOBAL",8) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4776 // [PC] Were we invited to the wedding?
  ++ @11717 DO ~SetGlobal("c-arantobrom","GLOBAL",8) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4778 // [PC] I like weddings. I like them a lot.
  ++ @11718 DO ~SetGlobal("c-arantobrom","GLOBAL",8) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4777 // [PC] Why on earth would anyone want to get married?
END

IF ~~ a4775
  SAY @11719 // [ARAN] Like what?
  ++ @11720 + a4779 // [PC] I thought you might want some kind of assurance. About our love. Something long term.
  ++ @11721 + a4783 // [PC] Oh, I don't know. Something.
  ++ @11722 + a4782 // [PC] Do I have to prompt you for everything?
  ++ @11723 + a4779 // [PC] Think carefully, Aran. And notice the distinct absence of a ring on my finger, symbolizing the eternal circle of love.
  ++ @11724 + a4779 // [PC] Like why we have not talked about getting married.
END

IF ~~ a4776
  SAY @11725 // [ARAN] Oh, just an ol' friend from th' 'Fist. They knew better than to invite those o' us what be on th' campaign, since we might be pressed hard to make it back for th' ceremonies.
  = @11726 // [ARAN] He an' his lady-love be a right fine pair, they do. They has a Helmite marriage, an' then shipped out to Maztica. Apparently, th' food were great, th' drink was strong, an' th' bachelorette party only had three what needed a healer.
  = @11727 // [ARAN] No troubles wi' th' bachelor party, at least ones talked about, on account o' Hera, she be th' jealous type. But they will be happy enough carvin' out a Freehold in th' colony. His axework be strong, an' her swordwork be quick, an' between th' two there be little what can stop 'em.
  ++ @11717 + a4778 // 
  ++ @11718 + a4777 //
  ++ @11728 + a4779 // [PC] They sound like they are well suited to each other. Kind of like you and I are.
  ++ @11729 + a4778 // [PC] So... is there anything you want to ask me?
END


IF ~~ a4777
  SAY @11730 // [ARAN] So, if someone asked you to marry them, then you would...
  ++ @11731 DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ + a4784 // [PC] ...tell them they are an idiot and that they are wasting their time. Life is to be experienced, not shackled.
  ++ @11732 + a4779 // [PC] It depends on who is asking.
  ++ @11733 + a4779 // [PC] ...tell them that my boyfriend Aran is going to be very upset if I say yes.
  ++ @11734 + a4779 // [PC] ...tell them that I will ask him to marry me when I am ready. I need to make up my own mind on my own terms.
  ++ @11735 + a4784 // [PC] ...ignore the question.
END

IF ~~ a4778
  SAY @11736 // [ARAN] Do that be some kind o' hint?
  ++ @11737 + a4779 // [PC] No, of course not.
  ++ @11738 + a4777 // [PC] Not really. You probably have already realized that I think marriage is a bad idea.
  ++ @11739 + a4777 // [PC] Maybe it is, maybe it isn't.
  ++ @11740 + a4779 // [PC] If by hint, you mean an obvious blazing sign that says "I love you and want to marry you", then sure, I guess it is a hint.
  ++ @1889 + a4777 // [PC] Yes.
END

IF ~~ a4779
  SAY @11741 // [ARAN] I never thought you wanted anythin' like that.
  ++ @11742 + a4780 // [PC] Why not?
  ++ @11743 DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ + a4784 // [PC] I don't. But you might.
  ++ @11744 + a4781 // [PC] Of course. I may not be a woman who wants a small cottage in a nice quiet village with lots of children running around, but that doesn't mean that I don't want love, marriage, and a life partner.
  ++ @11745 + a4781 // [PC] I have a dream that someday, just one little part of my life is normal. A small cottage, a loving husband, children...
  ++ @11746 + a4781 // [PC] I have not really thought about it. But I know I love you, and I know you love me. I think that when that happens, and the time is right, it makes sense that we should be married.
  ++ @11747 + a4785 // [PC] Oh, I am not opposed to the concept of marriage. I am only opposed to the two of us getting married.~
END

IF ~~ a4780
  SAY @11748 // [ARAN] Well, souls bondin' need souls, an' you were missing a fair part o' yours.  I'd be happy with half, but you... probably not.
  ++ @11749 + a4781 // [PC] I have my full soul now.
  ++ @11750 DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ + a4784 // [PC] I don't mind, but I don't really think I am interested in getting married. But you might be.
  ++ @11751 + a4781 // [PC] I would be happy with anything we share.
  ++ @11752 DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ + a4784  // [PC] I suppose you are right. Besides, I have decided I don't really ever want to get married.
END

IF ~~ a4781
  SAY @11753 // [ARAN] Why would you want me?
  ++ @11754 + a4783 // [PC] You have to ask?
  ++ @11755 + a4782 // [PC] Scared?
  ++ @11756 + a4783 // [PC] I don't just want you, Aran. I need you.
  ++ @11757 + a4783 // [PC] I don't want you, don't need you, and I really don't like the whole marriage idea. But then you say something, or turn against the light, and my breath catches in my throat.
  ++ @11758 DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ + a4784  // [PC] I wouldn't want you, or anybody else for that matter. I don't really want to get married.
END

IF ~~ a4782
  SAY @3601 // [ARAN] Aye.
  IF ~~ THEN GOTO a4783
END

IF ~~ a4783
  SAY @11759 //[ARAN] You already know I'd follow you past death's door, an' right into any o' th' various versions o' hell.
  ++ @11760 DO ~SetGlobal("c-aranengagement","GLOBAL",1)~ EXIT // [PC] A woman wants more.
  ++ @8649 DO ~SetGlobal("c-aranengagement","GLOBAL",1)~ EXIT // [PC] Forget I said anything.
  ++ @2782 DO ~SetGlobal("c-aranengagement","GLOBAL",1)~ EXIT // [PC] I know.
  ++ @11761 DO ~SetGlobal("c-aranengagement","GLOBAL",1)~ EXIT // [PC] But how do you know that I would do the same?
  ++ @11762 + a4786 // [PC] You know, I don't think this conversation is headed in the right direction. I am never, ever going to be interested in marrying you.
  ++ @11763 DO ~SetGlobal("c-aranengagement","GLOBAL",1)~ EXIT // [PC] Sometimes you are just so... so... dense.
END

IF ~~ a4784
  SAY @11759 // [ARAN] You already know I'd follow you past death's door, an' right into any o' th' various versions o' hell.
  = @11764 // [ARAN] As for th' whole contract thing, well... I suspect if I were th' marryin' type, it would be you. But since you aren't, then that be a part o' life what I will just skip, on account o' there really never could be anyone else.
  IF ~~ THEN EXIT
END

IF ~~ a4785
  SAY @11765 // [ARAN] I were about to say some blighted romantic thing like you already knowin' I'd follow you past death's door, an' right into any o' th' various versions o' hell, but truth be told that last were a mite bit cold. Mayhap you were jokin'. But I was bein' right serious, I was.
  IF ~~ THEN EXIT
END

IF ~~ a4786
  SAY @11766 // [ARAN] One day, mayhap right soon, I am goin' to run up against th' gods. An' I am goin' to ask them each in turn why in th' nine hells they made me so's I can never understand women in any way, shape, or form.
  IF ~~ THEN DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ EXIT
END


New Change - use this state to determine marriage state and children state if agreed 

IF ~~ talktomemore_aran



/* 
 * EPILOGUE VARS if PC does not accept godhood
 * Global("c-aranrom","GLOBAL",2) in romance | !Global("c-aranrom","GLOBAL",2) not in romance
 * IF !Global("c-aranrom","GLOBAL",2) Alignment(Player1,MASK_EVIL) = evil friend
 * IF !Global("c-aranrom","GLOBAL",2) !Alignment(Player1,MASK_EVIL) = good/neutral friend
 * Global("c-aranepiloguefriend","GLOBAL",0) 	// 0 = alignment check, 1 = friends but part ways, 2 = Adventurers Forever, 3 = City Forever, 4 = Country Forever
 * ALL ROM CONDITIONS (must at least set c-aranepiloguerelation and c-aranepiloguelifestyle above 0 or no epilogue will return true...
 * Global("c-aranepiloguemarried","GLOBAL",0)	// 0 or 1
 * Global("c-aranepiloguechildren","GLOBAL",0)	// 0 or 1
 * Global("c-aranepiloguerelation","GLOBAL",0)	// 1 = AranPrince, 2 = PCPrincess, 3 = Equals
 * Global("c-aranepiloguelifestyle","GLOBAL",0)	// 1 = Adventuring, 2 = City, 3 = Country
*/  

/* ToB: CheckState for Epilogue settings : add to PiD and put into lovetalks */
++ ~[PC] So, Aran, what do you think our future holds? What will we be doing years from now?~ + epilogue_settings_check // goes into management or talk part of PID

CHAIN C-ARN25J epilogue_settings_check
~[ARAN] We may have talked on that a time or two, eh? Let me remember...~
/* friendship */
== C-ARN25J IF ~!Global("c-aranrom","GLOBAL",2) !Alignment(Player1,MASK_EVIL)~ THEN ~[ARAN] I think you be a right fine friend, an' I intend to stick by your side. Mahap even a little in front, if I can.~  // good/neutral friend
== C-ARN25J IF ~!Global("c-aranrom","GLOBAL",2) Alignment(Player1,MASK_EVIL)~ THEN ~[ARAN] You be one difficult Child o' Bhaal, but I don't rightly see me leavin' your side any time soon. Unless you tell me to bugger off or die or somethin'.~ // evil friend
/* specifically defined friendship */
== C-ARN25J IF ~OR(2) Global("c-aranepiloguefriend","GLOBAL",0) Global("c-aranepiloguefriend","GLOBAL",1)~ THEN ~[ARAN] So I expect we will be seein' a bit o' each other from time to time when this all be over. But then again, there be no assurances.~  // 0 = alignment check only 1 = friends but part ways (possible for men and non-romanced)
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",3)~ THEN ~[ARAN] We done parted romantically, so that be somethin' to consider.~ // we broke up so we just have the memories
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguefriend","GLOBAL",1)~ THEN ~[ARAN] We have a good romance, but there mayhap be some doubt about what that might look like in th' future. Mayhap if we have naught in th' way o' bein' more to each other, our friendship be distant.~ // 1 = friends but part ways (active RA=2)
== C-ARN25J IF ~Global("c-aranepiloguefriend","GLOBAL",2)~ THEN ~[ARAN] I suspect we may never leave off adventurin', no matter what be th' rest o' th' tale. But as friends go, we expect to be together.~ // 2 = Adventurers Forever Together (requires active RA=2 to activate)
== C-ARN25J IF ~Global("c-aranepiloguefriend","GLOBAL",3)~ THEN ~[ARAN] I suspect we may settle in a town or mayhap a city, no matter what be th' rest o' th' tale. But as friends go, we expect to be together.~ // 3 = City Forever Together (requires active RA=2 to activate)
== C-ARN25J IF ~Global("c-aranepiloguefriend","GLOBAL",4)~ THEN ~[ARAN] I suspect we may settle in a small village or mayhap somewhere remote, no matter what be th' rest o' th' tale. But as friends go, we expect to be together.~ // 4 = Country Forever Together (requires active RA=2 to activate)
/* romance active and marriage choices */
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguemarried","GLOBAL",0)~ THEN ~[ARAN] No marriage preparations have been made...~ // not married (default)
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguemarried","GLOBAL",1)~ THEN ~[ARAN] We plan on gettin' married, should we make it through all this in a right state o' bein'.~ // married
/* romance active and children choices */
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguechildren","GLOBAL",0)~ THEN ~[ARAN] Probably naught in th' way o' children in our future.~ // no children (default)
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguechildren","GLOBAL",1)~ THEN ~[ARAN] If we do have children, they will be a right blessin' to us both.~ // children
/* romance active and relation choices */
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguerelation","GLOBAL",0)~ THEN ~[ARAN] We have naught in th' way o' clarity on what sort o' relationship we might have, bein' equals, or you takin' lead, or me bein' in charge.~ //not talked about
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguerelation","GLOBAL",1)~ THEN ~[ARAN] I be right proud you want me to take care o' you, an' protect you. ~ // 1 = AranPrince
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguerelation","GLOBAL",2)~ THEN ~[ARAN] I be right proud you mahap let me back you up an' support your leadership.~ // 2 = PCPrincess
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguerelation","GLOBAL",3)~ THEN ~[ARAN] I be right proud you see us bein' equals, sharin' th' work o' life.~ // 3 = Equals
/* romance active and lifestyle choices */
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguelifestyle","GLOBAL",0)~ THEN ~[ARAN] We have naught in th' way o' clarity on what sort o' lifestyle we might have.~ //not talked about
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguelifestyle","GLOBAL",1)~ THEN ~[ARAN] Aye, now, th' truth of it is no matter what th' future holds, we will always be drawn to explore, an' mayhap even travel th' very Planes themselves.~ // 1 = Adventuring
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguelifestyle","GLOBAL",2)~ THEN ~[ARAN] Aye, th' city life would fit us right well, it would.~ // 2 = City
== C-ARN25J IF ~Global("c-aranrom","GLOBAL",2) Global("c-aranepiloguelifestyle","GLOBAL",3)~ THEN ~[ARAN] Aye, th' country life would fit us right well, it would.~ // 3 = Country
EXTERN C-ARN25J epilog_recheck_done // end of chain

APPEND ~C-ARN25J~

IF ~~ epilog_recheck_done
  SAY ~[ARAN] Now, do that match your recollection?~
  /* everything as player expects so exit */
  ++ ~[PC] That is about right. I just find it comfortable to remember that there will be a future at all after all of this.~ + a2260
  /* block of potential changes here */
  ++ ~[PC] That is not quite the way I see things.~ + change_the_epilogue
  ++ ~[PC] Oh, never mind. I guess you remember correctly.~ + a2260
  /* conflicting information */
  IF ~Global("c-aranrom","GLOBAL",2) GlobalGT("c-aranepiloguefriend","GLOBAL",0) OR(4) GlobalGT("c-aranepiloguemarried","GLOBAL",0) GlobalGT("c-aranepiloguechildren","GLOBAL",0) GlobalGT("c-aranepiloguerelation","GLOBAL",0) GlobalGT("c-aranepiloguelifestyle","GLOBAL",0)~ THEN GOTO aran_confused_choices
END

IF ~~ change_the_epilogue
  SAY ~[ARAN] Now what be your recollection?~
  /* non-romance */
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think that we will always be useful to each other.~ + a2260
  /* romance */
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Well, we have talked about many things. I definitely think we might be more than friends after this is all over.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + talktomemore_aran // 0 = Allow RA possibility grid to be enabled and change the marriage and children variables
  /* 1 = friends but part ways */
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I am sure that we would keep our friendship, but we will both move on to other things and other lives, Aran.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",1) SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + a2260
  /* 2 = Adventurers Forever Together */
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I am sure that we would keep our friendship and adventure together, Aran. I do not see a future without the challenges of the open road.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",2) SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + a2260
  /* 3 = City Forever Together */
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I am sure that we would keep our friendship, but we will both move on to other things, Aran. Perhaps we will find ourselves in the same city, exploring urban life.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",3) SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + a2260
  /* 4 = Country Forever Together */
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I am sure that we would keep our friendship, but we will both move on to other things, Aran. Perhaps we will find ourselves in the same small village, arguing over who was the better adventurer for the amusement of tavern patrons.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",4) SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + a2260
  /* all PC states */
  ++ ~[PC] You know me. I change my mind all the time. Are you not used to it by now?~ + a2260 // ok, on the PCs head be it. I tried. aranepiloguefriend will trump all other decisions made, so we will leave the conflict in place.
  ++ ~[PC] I can clarify things, Aran. The future is very flexible, and almost anything could happen.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + a2260 // 0 = Allow RA possibility grid to be enabled or just rely on alignment
END


// SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)


IF ~~ talktomemore_aran
  SAY ~[ARAN] So about th' whole marriage thing, you think it mayhap be in th' future for us?~
  ++ ~[PC] You are useful, for now. I would not like to be bound to a marriage contract.~ DO ~SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_children // 0 or 1
  ++ ~[PC] We will definitely not be married, Aran. I have other interests. But you will always be my lover.~ DO ~SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_children // 0 or 1
  ++ ~[PC] I do not like the idea of being married.~ DO ~SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_children // 0 or 1
  ++ ~[PC] I like the idea of being married. I think it is likely.~ DO ~SetGlobal("c-aranepiloguemarried","GLOBAL",1) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_children   // 0 or 1
  ++ ~[PC] You are so silly. You have my whole heart, and of course I think about marrying you.~ DO ~SetGlobal("c-aranepiloguemarried","GLOBAL",1) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_children   // 0 or 1
  ++ ~[PC] You are useful. A marriage contract would be beneficial.~ DO ~SetGlobal("c-aranepiloguemarried","GLOBAL",1) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_children   // 0 or 1
  ++ ~[PC] I think that I want a clean slate on all of this. I can always come back to you and we can talk this through again.~ DO ~SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + aran_epilogue_vars_blanked	// blank all conditions to go with friend epilogues or reset.
END

IF ~~ ask_about_children
  SAY ~[ARAN] Your decision. Well, mayhap both o' us, to some extent. Where does that leave th' whole next generation, an' our part in creatin' it?~
  ++ ~[PC] If you think I would ever bring another life into this world of pain and suffering, you have not been paying attention.~ DO ~SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_relationship // 0 or 1	
  ++ ~[PC] I do not want children, Aran. Married or not, there is too much to do and see in life and having children gets in the way.~ DO ~SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_relationship // 0 or 1	
  ++ ~[PC] I... no. No children.~ DO ~SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_relationship // 0 or 1
  ++ ~[PC] I... I really want children someday.~ DO ~SetGlobal("c-aranepiloguechildren","GLOBAL",1) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_relationship // 0 or 1
  ++ ~[PC] Well, creating them is fun, and taking care of them might be very fun, with the right person...~ DO ~SetGlobal("c-aranepiloguechildren","GLOBAL",1) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_relationship // 0 or 1
  ++ ~[PC] Of course. How can my legacy be passed on if there are no children?~ DO ~SetGlobal("c-aranepiloguechildren","GLOBAL",1) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + ask_about_relationship // 0 or 1
  ++ ~[PC] I think that I want a clean slate on all of this. I can always come back to you and we can talk this through again.~ DO ~SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + aran_epilogue_vars_blanked	// blank all conditions to go with friend epilogues or reset.
END

IF ~~ ask_about_relationship
  ++ ~[PC] ~ DO ~SetGlobal("c-aranepiloguerelation","GLOBAL",1) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + // 1 = AranPrince, 2 = PCPrincess, 3 = Equals
  ++ ~[PC] ~ DO ~SetGlobal("c-aranepiloguerelation","GLOBAL",2) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + 	// 1 = AranPrince, 2 = PCPrincess, 3 = Equals
  ++ ~[PC] ~ DO ~SetGlobal("c-aranepiloguerelation","GLOBAL",3) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + 	// 1 = AranPrince, 2 = PCPrincess, 3 = Equals
  ++ ~[PC] I think that I want a clean slate on all of this. I can always come back to you and we can talk this through again.~ DO ~SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + aran_epilogue_vars_blanked	// blank all conditions to go with friend epilogues or reset.
END

IF ~~ ask_about_lifestyle
  ++ ~[PC] ~ DO ~SetGlobal("c-aranepiloguelifestyle","GLOBAL",1) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + 	// 1 = Adventuring, 2 = City, 3 = Country
  ++ ~[PC] ~ DO ~SetGlobal("c-aranepiloguelifestyle","GLOBAL",2) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + 	// 1 = Adventuring, 2 = City, 3 = Country
  ++ ~[PC] ~ DO ~SetGlobal("c-aranepiloguelifestyle","GLOBAL",3) SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + 	// 1 = Adventuring, 2 = City, 3 = Country
  ++ ~[PC] I think that I want a clean slate on all of this. I can always come back to you and we can talk this through again.~ DO ~SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + aran_epilogue_vars_blanked	// blank all conditions to go with friend epilogues or reset.
END
 
IF ~~ aran_confused_choices
  SAY ~[ARAN] Now there be a point o' contention, here. I thought we was set on havin' a lastin' friendship after all this, but we done talked about mayhap marriage, or little ones, or mayhap settlin' down somewhere. ~
  ++ ~[PC] Well, we have talked about many things. I definitely think we might be more than friends after this is all over.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + existing_aye_state // 0 = Allow RA possibility grid to be enabled
  /* 1 = friends but part ways */
  ++ ~[PC] I am sure that we would keep our friendship, but we will both move on to other things and other lives, Aran.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",1)~ + a2260
  /* 2 = Adventurers Forever Together */
  ++ ~[PC] I am sure that we would keep our friendship and adventure together, Aran. I do not see a future without the challenges of the open road.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",2)~ + a2260
  /* 3 = City Forever Together */
  ++ ~[PC] I am sure that we would keep our friendship, but we will both move on to other things, Aran. Perhaps we will find ourselves in the same city, exploring urban life.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",3)~ + a2260
  /* 4 = Country Forever Together */
  ++ ~[PC] I am sure that we would keep our friendship, but we will both move on to other things, Aran. Perhaps we will find ourselves in the same small village, arguing over who was the better adventurer for the amusement of tavern patrons.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",4)~ + a2260
  /* all PC states */
  ++ ~[PC] You know me. I change my mind all the time. Are you not used to it by now?~ + a2260 // ok, on the PCs head be it. I tried. aranepiloguefriend will trump all other decisions made, so we will leave the conflict in place.
  ++ ~[PC] I can clarify things, Aran. The future is very flexible, and almost anything could happen.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + a2260 // 0 = Allow RA possibility grid to be enabled
END


IF ~~ aran_epilogue_vars_blanked
  SAY ~[ARAN] Well, I have right strong feelin's about you. I know there be so much happenin' right now that you just have naught in th' way o' energy for plannin' th' future.~
  = ~[ARAN] I hope we have th' time to revisit this, though. I want more o' a long term future with you than just simple friendship an' faded memories o' romance.~
  IF ~~ THEN EXIT
END


END // of append to C-ARN25J


IF ~Global("c-aranrom","GLOBAL",2) OR(2) Global("c-aranepiloguerelation","GLOBAL",0) Global("c-aranepiloguelifestyle","GLOBAL",0)~ THEN GOTO aran_life_choice_point


APPEND ~C-ARN25J~
/* Begin choosing epilogue clarification point */
IF ~~ aran_life_choice_point
  SAY ~[ARAN] Now I want to say right out that a life backin' you up be what I want. But we all have some dreams, eh?~
  = ~[ARAN] When this be all over an' we go on to th' next adventure, what kind o' life do you be seein' us in?~
  ++ ~[PC] I see adventuring for a long, long time. Perhaps forever.~ DO ~SetGlobal("c-aranepiloguelifestyle","GLOBAL",1)~ + next_adventuring_state
  ++ ~[PC] I always saw myself as drawn to the politics and discussions you can only find in a city. I want to be involved in everything.~ DO ~SetGlobal("c-aranepiloguelifestyle","GLOBAL",2)~ + next_city_state
  ++ ~[PC] A quiet life in a country house for me. Something very different from the life I have now.~ DO ~SetGlobal("c-aranepiloguelifestyle","GLOBAL",3)~ + next_country_state
  ++ ~[PC] I... I am not sure. What sort of life do you want?~ + next_pc_asks_aran
  ++ ~[PC] I see next to no life for us. I think that I will never be left alone long enough to really settle down.~ + DO ~SetGlobal("c-aranepiloguelifestyle","GLOBAL",1)~ + next_adventuring_state // forced choice for PC
END
/* Delay by asking Aran */
IF ~~ next_pc_asks_aran
   SAY ~[ARAN] Now that changes by th' day, it do. But right now, I can see us in Waterdeep, all set up in one o' them townhouses. An' then mayhap a country estate. Or even some travel to that freehold my followers have been buildin' along th' Sword Coast.~
   ++ ~[PC] That is a nice dream, but I see us adventuring for a long, long time. Perhaps forever.~ DO ~SetGlobal("c-aranepiloguelifestyle","GLOBAL",1)~ + next_adventuring_state
   ++ ~[PC] That seems very comfortable. The best of both worlds.~ DO ~SetGlobal("c-aranepiloguelifestyle","GLOBAL",2)~ + next_city_state
   ++ ~[PC] I think you would love the townhouse, and I would probably push for us to visit the country estate.~ DO ~SetGlobal("c-aranepiloguelifestyle","GLOBAL",3)~ + next_country_state
   ++ ~[PC] The sea tower. Lighthouse. Whatever it is that you are building on the Sword Coast. Being close to Candlekeep in some way... that sounds romantic.~ + next_country_state
   ++ ~[PC] I see next to no life for us. I think that I will never be left alone long enough to really settle down.~ + DO ~SetGlobal("c-aranepiloguelifestyle","GLOBAL",1)~ + next_adventuring_state // forced choice for PC
END  

IF ~~ next_adventuring_state
  SAY ~[ARAN] Mahap you be right, on account o' th' number o' changes in Toril can lead directly to you. Life sometimes will have naught in th' way o' lettin' someone drop away from th' center o' things.~
  IF ~~ THEN GOTO aran_rel_choice_point
END

IF ~~ next_city_state        
  SAY ~[ARAN] Waterdeep sounds like a right fine destination. Mayhap even one o' th' Dale cities. Just not Calimport, for Sune's own sake... I love th' baths, but I do not want to retire there.~
  IF ~~ THEN GOTO aran_rel_choice_point
END

IF ~~ next_country_state
  SAY ~[ARAN] Well, there be thousands o' nice places fo a small cottage, or mayhap a whole country estate. That might be a right fine retirement.~
  IF ~~ THEN GOTO aran_rel_choice_point
END
/* Player in Romance has now set Global("c-aranepiloguelifestyle","GLOBAL",) to 1, 2, or 3 */
/* Allow Player to define Global("c-aranepiloguerelation","GLOBAL",) */
IF ~~ aran_rel_choice_point
  SAY ~[ARAN] An' mayhap I will be out managin' what needs be managed, an' fendin' off foes, leavin' you to relax an' be happy, eh? A lad could enjoy spendin' th' rest o' his life protection' you.~
   ++ ~[PC] That sounds as if you want to be a charming prince, whisking me away from the world. I like that idea.~ DO ~Global("c-aranepiloguerelation","GLOBAL",1)~ + finish_rel_choice_point // 1 = AranPrince
   ++ ~[PC] Actually, I think you will be too busy cooking and scribing, making sure that my life is free to concentrate on larger challenges.~ DO ~Global("c-aranepiloguerelation","GLOBAL",2)~ + finish_rel_choice_point // 2 = PCPrincess
   ++ ~[PC] I assume that you and I will be doing all of that together, right? After all, a good relationship is built as a conversation between two equals, working for each other.~ DO ~Global("c-aranepiloguerelation","GLOBAL",3)~ + finish_rel_choice_point // 3 = Equals
   ++ ~[PC] No estates. No investments, no contracts... just peace, quiet, and rest. I just want to be cared for.~ DO ~Global("c-aranepiloguerelation","GLOBAL",1)~ + finish_rel_choice_point
   ++ ~[PC] We have so much resting on our shoulders that I suspect we will have to find a way to manage it all together. We may even need extra help.~ DO ~Global("c-aranepiloguerelation","GLOBAL",3)~ +  finish_rel_choice_point
END
/* PC has chosen Global("c-aranepiloguerelation","GLOBAL",) and Global("c-aranepiloguelifestyle","GLOBAL",) - now just needs married and children answers - delayed to another talk. */
IF ~~ finish_rel_choice_point
  SAY ~[ARAN] It would be right fine if that came to be th' future. But for now, I expect th' best we can do is keep movin' an' dreamin'.~
  ++ ~[PC] Aran... you do know you could just ask me. To marry you, I mean.~ + aran_prompted
  ++ ~[PC] I am so glad you have not asked me to marry you. That would never work out.~ + aran_rejected
  ++ ~[PC] Aran, will you marry me?~ + aran_you_asked_to_marry
  ++ ~[PC] You have been useful to me, Aran. But every day is a new day. We probably should not plan ahead that far.~ + aran_aye
  ++ ~[PC] Aran... you do know you talk way too much.~ + aran_aye
END

IF ~~ aran_prompted
  SAY ~[ARAN] Aye,I know that right well. An' mayhap I will, when th' conditions be right.~
  IF ~~ THEN DO ~SetGlobal("c-aranmarriagetalk","GLOBAL",1)~ EXIT
END

IF ~~ aran_you_asked_to_marry
  SAY ~[ARAN] <CHARNAME>, I... ~
  = ~[ARAN] I want to say aye. But there be some matters to attend to, an'...~
  = ~[ARAN] I wanted this moment to be right special. Somewhere elegant. Mayhap we wait a bit an' then talk.~   
  IF ~~ THEN DO ~SetGlobal("c-aranmarriagetalk","GLOBAL",2)~ EXIT
END

IF ~~ aran_rejected
  SAY ~[ARAN] Mayhap, mayhap not. A lad can dream, eh?~
  IF ~~ THEN DO ~SetGlobal("c-aranmarriagetalk","GLOBAL",3)~ EXIT
END

IF ~~ aran_aye
  SAY ~[ARAN]  ~
  IF ~~ THEN EXIT
END


/* The Follow-up Future Lifestyle Choices: Marriage and/or Children */
IF ~~ aran_marriage_children_LT // 
  SAY ~[ARAN] Well, now, I were meanin' to talk to you alone. Mayhap now be just th' right time.~
  IF ~Global("c-aranmarriagetalk","GLOBAL",1)~ THEN GOTO aran_was_prompted
  IF ~Global("c-aranmarriagetalk","GLOBAL",2)~ THEN GOTO aran_was_asked
  IF ~Global("c-aranmarriagetalk","GLOBAL",3)~ THEN GOTO aran_was_rejected
  IF ~Global("c-aranmarriagetalk","GLOBAL",0)~ THEN GOTO aran_was_bypassed
END

aran_was_prompted

aran_was_asked

aran_was_rejected

aran_was_bypassed

END // of append to C-ARN25J



