/* Adding a gift to Berelinde's gift store in GavinToB - way cool idea. Idea stolen from Sandrah NPC by Roxanne, but built from the original source and adjusted  */
/* Berelinde's work there is in alphabetical order by NPC. So I need to insert it as a reply state... */
EXTEND_TOP ~B!GIFT~ 0 3 END
  IF ~Global("B!GiftAranw","AR0700",0) InParty("c-aran")InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN REPLY @13722 GOTO c-giftberelinde
END

CHAIN ~B!GIFT~ c-giftberelinde
@13723
== C-ARANJ @13724
== ~B!GIFT~ @13725
== C-ARANJ @13726
END
++ @13727 DO ~SetGlobal("B!GiftAranw","AR0700",1) GiveItemCreate("c-bkcase","c-aran",0,0,0) TakePartyGold(400) DestroyGold(400)~ EXTERN C-ARANJ c-gift2berelinde 
++ @13728 EXTERN ~B!GIFT~ c-giftnottaken

APPEND ~C-ARANJ~ 
IF ~~ c-gift2berelinde
	SAY @13729 
	++ @13730 EXTERN ~B!GIFT~ c-enjoyit
	++ @13731 EXTERN ~B!GIFT~ c-enjoyit
	++ @13732 EXTERN ~B!GIFT~ c-enjoyit 
	++ @13733 EXTERN ~B!GIFT~ c-enjoyit
	++ @13734 EXTERN ~B!GIFT~ c-enjoyit
END

END // of append to c-aranj

APPEND ~B!GIFT~

IF ~~ c-giftnottaken SAY @13735 IF ~~ THEN EXIT END 

IF ~~ c-enjoyit SAY @13736 IF ~~ THEN EXIT END 

END // of append to b!gift