//////////////////////////////////////////////////////////////////////////////////////
//// Aran Whitehand BGII:EE SoA and ToB Dialog File - cmorgan - traified - RASAAD ////
//////////////////////////////////////////////////////////////////////////////////////

/* SoA: Aran > Rasaad : Down Calimport Way  */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) 
InParty("Rasaad") InMyArea("Rasaad") !StateCheck("Rasaad",CD_STATE_NOTVALID)
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID) 
Global("c-aransoarassad1","GLOBAL",0)~ THEN C-ARANB a5112
@13372
DO ~SetGlobal("c-aransoarassad1","GLOBAL",1)~
== BRASAAD @13373
== C-ARANB @13374
== BRASAAD @13375
== C-ARANB @13376
== BRASAAD @13377
== C-ARANB @13378
== BRASAAD @13379
== C-ARANB @13380
EXIT

/* SoA: Aran > Rasaad : Concentration */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) 
InParty("Rasaad") InMyArea("Rasaad") !StateCheck("Rasaad",CD_STATE_NOTVALID)
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)
Global("c-aransoarassad2","GLOBAL",0)~ THEN C-ARANB a5113
@13381
DO ~SetGlobal("c-aransoarassad2","GLOBAL",1)~
== BRASAAD @13382
== C-ARANB @13383
== BRASAAD @13384
== C-ARANB @13385
== BRASAAD @13386
== C-ARANB @13387
== C-ARANB @13388
== BRASAAD @13389
== C-ARANB @13387
== C-ARANB @13387
== C-ARANB @13387
== C-ARANB @13390
== BRASAAD @13391
EXIT

/* SoA: Rasaad > Aran : Concentration and the Single Man */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) 
InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)
Global("c-rasaadsoaaran1","GLOBAL",0)~ THEN BRASAAD a5114
@13392
DO ~SetGlobal("c-rasaadsoaaran1","GLOBAL",1)~ 
== C-ARANB @13393
EXTERN BRASAAD a5115

CHAIN ~BRASAAD~ a5123
@13394
== C-ARANB @13395
EXIT

APPEND ~BRASAAD~

IF ~~ a5115
  SAY @13396
  IF ~!Gender(Player1,FEMALE)~ THEN EXTERN C-ARANB a5116
  IF ~Gender(Player1,FEMALE)~ THEN EXTERN C-ARANB a5117
  IF ~Gender(Player2,FEMALE) !Name("c-aran",Player2) !Name("Viconia",Player2) !Name("Hexxat",Player2)~ THEN EXTERN C-ARANB a5118
  IF ~Gender(Player3,FEMALE) !Name("c-aran",Player3) !Name("Viconia",Player3) !Name("Hexxat",Player3)~ THEN EXTERN C-ARANB a5119
  IF ~Gender(Player4,FEMALE) !Name("c-aran",Player4) !Name("Viconia",Player4) !Name("Hexxat",Player4)~ THEN EXTERN C-ARANB a5120
  IF ~Gender(Player5,FEMALE) !Name("c-aran",Player5) !Name("Viconia",Player5) !Name("Hexxat",Player5)~ THEN EXTERN C-ARANB a5121
  IF ~Gender(Player6,FEMALE) !Name("c-aran",Player6) !Name("Viconia",Player6) !Name("Hexxat",Player6)~ THEN EXTERN C-ARANB a5122
END

END

APPEND ~C-ARANB~ 

IF ~~ a5116 SAY @13397 IF ~~ THEN EXTERN BRASAAD a5123 END
IF ~~ a5117 SAY @13398 IF ~~ THEN EXTERN BRASAAD a5123 END
IF ~~ a5118 SAY @13399 IF ~~ THEN EXTERN BRASAAD a5123 END
IF ~~ a5119 SAY @13400 IF ~~ THEN EXTERN BRASAAD a5123 END 
IF ~~ a5120 SAY @13401 IF ~~ THEN EXTERN BRASAAD a5123 END 
IF ~~ a5121 SAY @13402 IF ~~ THEN EXTERN BRASAAD a5123 END 
IF ~~ a5122 SAY @13403 IF ~~ THEN EXTERN BRASAAD a5123 END 

END // of append

/* ToB: Aran > Rasaad : Meditating Sheep */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) 
InParty("Rasaad") InMyArea("Rasaad") !StateCheck("Rasaad",CD_STATE_NOTVALID)
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID) 
Global("c-arantobrasaad1","GLOBAL",0)~ THEN C-ARN25B a5124
@13404
DO ~SetGlobal("c-arantobrasaad1","GLOBAL",1)~
== BRASAA25 @13405
== C-ARN25B @13406
== BRASAA25 @13407
== C-ARN25B @13408
== BRASAA25 @13409
== C-ARN25B @13410
== BRASAA25 @13411
EXIT

/* ToB: Aran > Rasaad : Wealth */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arantobrasaad2","GLOBAL",0)
InParty("Rasaad") InMyArea("Rasaad") !StateCheck("Rasaad",CD_STATE_NOTVALID)
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN C-ARN25B a5125
@13412
DO ~SetGlobal("c-arantobrasaad2","GLOBAL",1)~
== BRASAA25 @13413
== C-ARN25B @13414
== BRASAA25 @13415
== C-ARN25B @13416
== BRASAA25 @13417
== C-ARN25B @13418
EXIT

