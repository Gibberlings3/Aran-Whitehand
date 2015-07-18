/////////////////////////////////////////////////////////////////////////////
//// Aran Whitehand BGII:EE SoA and ToB Dialog File - cmorgan - traified ////
/////////////////////////////////////////////////////////////////////////////

/* SoA: Neera > Aran : A rose by any other name... */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-neerasoaaran","GLOBAL",0) 
InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN BNEERA a5102
@13300
DO ~SetGlobal("c-neerasoaaran","GLOBAL",1)~
== C-ARANB @3601
== BNEERA @13301
== C-ARANB @13302
== BNEERA @13303
== BNEERA @13304
== C-ARANB @8650
== BNEERA @13305
== C-ARANB @13306
== BNEERA @13307
== C-ARANB @13308
== BNEERA @13309
== C-ARANB @13310
== BNEERA @13311
EXIT

/* SoA: Aran > Neera : Wild magic */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-aransoaneera","GLOBAL",0)
InParty("Neera") InMyArea("Neera") !StateCheck("Neera",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN C-ARANB a5101
@13312
DO ~SetGlobal("c-aransoaneera","GLOBAL",1)~
== BNEERA @13313
== C-ARANB @13314
== BNEERA @13315
== C-ARANB @13316
== BNEERA @13317
== C-ARANB @13318
== C-ARANB @13319
== C-ARANB @13320 
EXIT

/* ToB: Aran > Neera : Potted Plants */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arantobneera","GLOBAL",0) 
InParty("Neera") InMyArea("Neera") !StateCheck("Neera",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN C-ARN25B a5095
@13321
DO ~SetGlobal("c-arantobneera","GLOBAL",1)~
== BNEERA25 @13322
== C-ARN25B @13323
== BNEERA25 @13324
== C-ARN25B @13325
== BNEERA25 @13326
== C-ARN25B @13327
EXIT

APPEND BNEERA25
/* ToB: Neera > Aran : Flirting on the Wild Side  */
IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-neeratobaran","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN BEGIN a5096
  SAY @13328
  IF ~!Global("NeeraRomanceActive","GLOBAL",2) !Global("c-aranrom","GLOBAL",2)~ DO ~SetGlobal("c-neeratobaran","GLOBAL",1)~ EXTERN C-ARN25B a5097
  IF ~Global("NeeraRomanceActive","GLOBAL",2) !Global("c-aranrom","GLOBAL",2)~ DO ~SetGlobal("c-neeratobaran","GLOBAL",1)~ EXTERN C-ARN25B a5098
  IF ~!Global("NeeraRomanceActive","GLOBAL",2) Global("c-aranrom","GLOBAL",2)~ DO ~SetGlobal("c-neeratobaran","GLOBAL",1)~ EXTERN C-ARN25B a5099
  IF ~Global("NeeraRomanceActive","GLOBAL",2) Global("c-aranrom","GLOBAL",2)~ DO ~SetGlobal("c-neeratobaran","GLOBAL",1)~ EXTERN BNEERA25 a5100
END

END // of append

/* no romances with Neera or Aran */
CHAIN C-ARN25B a5097
@13329
== BNEERA25 @13330
== C-ARN25B @13331
== BNEERA25 @13332
== C-ARN25B @13333
EXIT
/* PC romance with Neera */
CHAIN C-ARN25B a5098
@13334
== BNEERA25 @13335
== C-ARN25B @13336
== BNEERA25 @13337
== C-ARN25B @13338
EXIT
/* PC romance with Aran */
CHAIN C-ARN25B a5099
@13339
== BNEERA25 @13335
== C-ARN25B @13336
== BNEERA25 @13340
== C-ARN25B @13341
== BNEERA25 @13342
EXIT
/* Aran and Neera concurrent romances with PC */
CHAIN BNEERA25 a5100
@13343
== C-ARN25B @13344
== BNEERA25 @13345
== C-ARN25B @13346 
EXIT



