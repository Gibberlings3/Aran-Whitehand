/* Adding a gift to Berelinde's gift store in GavinToB - way cool idea. Idea stolen from Sandrah NPC by Roxanne, but built fdrom the original source and adjusted */
/* Berelinde's work there is in alphabetical order by NPC. So I need to insert it as a reply state... */
EXTEND_TOP ~B!GIFT~ 0 3 END
  IF ~Global("B!GiftAranw","AR0700",0) InParty("c-aran")InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN REPLY ~I'm looking for a gift for Aran.~ GOTO c-giftberelinde
END

CHAIN ~B!GIFT~ c-giftberelinde
~Hmmmm. A warrior, but with inkstains on his hands, and especially his thumb...~
== C-ARANJ ~[ARAN] An' here I thought I had washed right fine. Guess there be some things what never leave a lad, eh?~
== ~B!GIFT~ ~[B!GIFT] I think I have just the item. Perhaps I could entice you to feel the leather of this fine documents case? A steal at a mere 400 gold.~
== C-ARANJ ~[ARAN] Oghma's Oracular Omnibus... that be... th' leather be...~
END
++ ~[PC] Well, anything that has Aran practically speechless is a good purchase. I will take it.~ DO ~SetGlobal("B!GiftAranw","AR0700",1) GiveItemCreate("c-bkcase","c-aran",0,0,0) TakePartyGold(400) DestroyGold(400)~ EXTERN C-ARANJ c-gift2berelinde
++ ~Not right now, thanks.~ EXTERN ~B!GIFT~ c-giftnottaken

APPEND ~C-ARANJ~ 
IF ~~ c-gift2berelinde
	SAY ~[ARAN] Now that were a right fine gift, <CHARNAME>. I do appreciate it.~
	++ ~[PC] You deserve it.~ EXTERN ~B!GIFT~ c-enjoyit 
	++ ~[PC] Oh, I just needed you to be even more of a pack mule for me. We will fill it soon enough.~  EXTERN ~B!GIFT~ c-enjoyit
	++ ~[PC] Perhaps you will be able to organize more of the mess you call your backpack.~ EXTERN ~B!GIFT~ c-enjoyit
	++ ~[PC] Do not mention it. Seriously, forget I ever gave it to you.~ EXTERN ~B!GIFT~ c-enjoyit
	++ ~[PC] I like your work, Aran. Every once in awhile, it is nice to be able to acknowledge your support.~ EXTERN ~B!GIFT~ c-enjoyit
END

END // of append to c-aranj

APPEND ~B!GIFT~

IF ~~ c-giftnottaken 
	SAY ~Some other time, then. Have a nice day.~ 
	IF ~~ THEN EXIT 
END 

IF ~~ c-enjoyit 
	SAY ~Enjoy it in good health.~ 
	IF ~~ THEN EXIT 
END 

END // of append to b!gift