
/// WARNING
////  WORKSPACE
///////   DOI NOT COMPILE!!!



///////////////// current code to rebuild 
/* ToB Love Talk #2 : statement of intent for seriousness : Global("c-arantobrom","GLOBAL",4) --> Global("c-arantobrom","GLOBAL",5) */
IF ~Global("c-arantobrom","GLOBAL",3)~ THEN BEGIN a4716
  SAY @11707 // [ARAN] You know, I do be downright lucky.
  ++ @11708 DO ~SetGlobal("c-arantobrom","GLOBAL",4) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718 // [PC] You have me, so that is true.
  ++ @11709 DO ~SetGlobal("c-arantobrom","GLOBAL",4) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718 // [PC] You have fallen in love with me.
  ++ @11710 DO ~SetGlobal("c-arantobrom","GLOBAL",4) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4717 // [PC] Well, so far, your cooking has not actually killed anyone. Though that last curry was a little too hot.
  ++ @11711 DO ~SetGlobal("c-arantobrom","GLOBAL",4) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718 // [PC] I consider myself lucky, as well.
  ++ @11712 DO ~SetGlobal("c-arantobrom","GLOBAL",4) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718 // [PC] Why are you looking at me that way?
END
/* GOTO ToB Love Talk #2 : statement of intent for seriousness : replies */
/* ToB Love Talk #2 : statement of intent for seriousness : replies */
IF ~~ a4717
  SAY @12192
  IF ~~ THEN GOTO a4718
END

IF ~~ a4718
  SAY @12193
  ++ @12194 + a4719
  ++ @12195 + a4724
  ++ @12196 + a4724
  ++ @12197 + a4721
  ++ @12198 + a4724
END
  
IF ~~ a4719
  SAY @12199  
  ++ @12200 + a4721
  ++ @12201 + a4723
  ++ @12202 + a4720
  ++ @12203 + a4720
  ++ @12204 + a4720
END

IF ~~ a4720
  SAY @12205
  ++ @12206 + a4723
  ++ @12207 + a4723
  ++ @12208 + a4722
  ++ @12209 + a4724
  ++ @12210 + a4724
END
  
IF ~~ a4721
  SAY @3601
  ++ @12208 + a4722
  ++ @12211 + a4724
  ++ @12206 + a4723
  ++ @12212 + a4724
  ++ @12213 + a4722
END
  
IF ~~ a4722
  SAY @12214
  ++ @12201 + a4723
  ++ @12215 + a4724
  ++ @12216 + a4724
  ++ @12217 + a4724
  ++ @12218 + a4724
END

IF ~~ a4723
  SAY @12219
  ++ @12220 + a4724
  ++ @12221 + a4724
  ++ @12222 + a4724
  ++ @12223 + a4724
  ++ @12224 + a4724
END

IF ~~ a4724
  SAY @12225
  ++ @12226 + a4725
  ++ @12227 + a4725
  ++ @12228 + a4725
  ++ @12229 + a4725
  ++ @12230 + a4725
END

IF ~~ a4725
  SAY @12231
  ++ @12232 + a4726
  ++ @12233 + a4726
  ++ @12234 + a4726
  ++ @12235 + a4726
  ++ @12236 + a4726
END

IF ~~ a4726
  SAY @12237 
  ++ @12238 + a4727
  ++ @12239 + a4727
  ++ @12240 + a4727 
  ++ @12241 + a4736
  ++ @12242 + a4727
END
  
IF ~~ a4727
  SAY @12243
  ++ @12244 + a4736
  ++ @12245 + a4728
  ++ @12246 + a4728
  ++ @12247 + a4728
  ++ @12248 + a4728
END
  
IF ~~ a4728
  SAY @12249 
  ++ @12250 + a4729
  ++ @12244 + a4736
  ++ @12251 + a4729
  ++ @12252 + a4729
  ++ @12253 + a4729
END
  
IF ~~ a4729
  SAY @12254 
  ++ @12255 + a4730
  ++ @12256 + a4730
  ++ @12257 + a4736
  ++ @12258 + a4730
  ++ @12259 + a4730
END

IF ~~ a4730
  SAY @12260 
  ++ @12261 + a4731
  ++ @12262 + a4731
  ++ @12263 + a4731
  ++ @12264 + a4731
  ++ @12265 + a4736
END

IF ~~ a4731
  SAY @12266 
  ++ @12267 + a4732
  ++ @12268 + a4732
  ++ @12269 + a4732
  ++ @12270 + a4736
  ++ @3589 + a4736
END

IF ~~ a4732
  SAY @12271 
  ++ @12272 + a4735
  ++ @12273 + a4733
  ++ @12274 + a4736
  ++ @12275 + a4734
  ++ @12276 + a4736
END
  
IF ~~ a4733
  SAY @12277
  IF ~~ THEN GOTO a4735
END

IF ~~ a4734
  SAY @12278
  IF ~~ THEN EXIT
END

IF ~~ a4735 // romance continued
  SAY @12279
  IF ~~ THEN EXIT
END

IF ~~ a4736 // romance retired
  SAY @12280 
  = @12281
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ EXIT // full romance shutdown
END



/* ToB Love Talk #3 : ask the big question or not */

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

/* ToB Love Talk #4 :  */

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


// @185  = 
// @186  = 
// @187  = 
// @188  = 
// @13736  is the last dilled .tra number


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
  ++ ~[PC] That is about right. I just find it comfortable to remember that there will be a future at all after all of this.~ + existing_aye_state
  /* block of potential changes here */
  ++ ~[PC] That is not quite the way I see things.~ + change_the_epilogue
  ++ ~[PC] Oh, never mind. I guess you remember correctly.~ + existing_aye_state
  /* conflicting information */
  IF ~Global("c-aranrom","GLOBAL",2) GlobalGT("c-aranepiloguefriend","GLOBAL",0) OR(4) GlobalGT("c-aranepiloguemarried","GLOBAL",0) GlobalGT("c-aranepiloguechildren","GLOBAL",0) GlobalGT("c-aranepiloguerelation","GLOBAL",0) GlobalGT("c-aranepiloguelifestyle","GLOBAL",0)~ THEN GOTO aran_confused_choices
END

IF ~~ change_the_epilogue
  SAY ~[ARAN] Now what be your recollection?~
  /* non-romance */
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think that we will always be useful to each other.~ + existing_aye_state
  /* romance */
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Well, we have talked about many things. I definitely think we might be more than friends after this is all over.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + talktomemore_aran // 0 = Allow RA possibility grid to be enabled and change the marriage and children variables
  /* 1 = friends but part ways */
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I am sure that we would keep our friendship, but we will both move on to other things and other lives, Aran.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",1) SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + existing_aye_state
  /* 2 = Adventurers Forever Together */
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I am sure that we would keep our friendship and adventure together, Aran. I do not see a future without the challenges of the open road.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",2) SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + existing_aye_state
  /* 3 = City Forever Together */
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I am sure that we would keep our friendship, but we will both move on to other things, Aran. Perhaps we will find ourselves in the same city, exploring urban life.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",3) SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + existing_aye_state
  /* 4 = Country Forever Together */
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I am sure that we would keep our friendship, but we will both move on to other things, Aran. Perhaps we will find ourselves in the same small village, arguing over who was the better adventurer for the amusement of tavern patrons.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",4) SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)~ + existing_aye_state
  /* all PC states */
  ++ ~[PC] You know me. I change my mind all the time. Are you not used to it by now?~ + existing_aye_state // ok, on the PCs head be it. I tried. aranepiloguefriend will trump all other decisions made, so we will leave the conflict in place.
  ++ ~[PC] I can clarify things, Aran. The future is very flexible, and almost anything could happen.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + existing_aye_state // 0 = Allow RA possibility grid to be enabled or just rely on alignment
END


SetGlobal("c-aranepiloguemarried","GLOBAL",0) SetGlobal("c-aranepiloguechildren","GLOBAL",0) SetGlobal("c-aranepiloguerelation","GLOBAL",0) SetGlobal("c-aranepiloguelifestyle","GLOBAL",0)


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
  ++ ~[PC] I am sure that we would keep our friendship, but we will both move on to other things and other lives, Aran.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",1)~ + existing_aye_state
  /* 2 = Adventurers Forever Together */
  ++ ~[PC] I am sure that we would keep our friendship and adventure together, Aran. I do not see a future without the challenges of the open road.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",2)~ + existing_aye_state
  /* 3 = City Forever Together */
  ++ ~[PC] I am sure that we would keep our friendship, but we will both move on to other things, Aran. Perhaps we will find ourselves in the same city, exploring urban life.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",3)~ + existing_aye_state
  /* 4 = Country Forever Together */
  ++ ~[PC] I am sure that we would keep our friendship, but we will both move on to other things, Aran. Perhaps we will find ourselves in the same small village, arguing over who was the better adventurer for the amusement of tavern patrons.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",4)~ + existing_aye_state
  /* all PC states */
  ++ ~[PC] You know me. I change my mind all the time. Are you not used to it by now?~ + existing_aye_state // ok, on the PCs head be it. I tried. aranepiloguefriend will trump all other decisions made, so we will leave the conflict in place.
  ++ ~[PC] I can clarify things, Aran. The future is very flexible, and almost anything could happen.~ DO ~SetGlobal("c-aranepiloguefriend","GLOBAL",0)~ + existing_aye_state // 0 = Allow RA possibility grid to be enabled
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



