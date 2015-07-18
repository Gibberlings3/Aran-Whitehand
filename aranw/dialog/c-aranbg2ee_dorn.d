////////////////////////////////////////////////////////////////////////////////////
//// Aran Whitehand BGII:EE SoA and ToB Dialog File - cmorgan - traified - DORN ////
////////////////////////////////////////////////////////////////////////////////////

/* SoA: Dorn > Aran : A House Divided */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-dornsoaaran","GLOBAL",0) 
InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN BDORN a5106
@13419
DO ~SetGlobal("c-dornsoaaran","GLOBAL",1)~
== C-ARANB @13420
== BDORN @13421
== C-ARANB @13422
== BDORN @13423
== C-ARANB @13424
== BDORN @13425
== C-ARANB @13426
== BDORN @13427
EXIT

/* SoA: Aran > Dorn : Allies */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-aransoadorn","GLOBAL",0) 
InParty("Dorn") InMyArea("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN C-ARANB a5105
@13428
DO ~SetGlobal("c-aransoadorn","GLOBAL",1)~
== BDORN @13429
== C-ARANB @13430
== BDORN @13431
== C-ARANB @13432
== BDORN @13433
== C-ARANB @13434
== BDORN @13435
== C-ARANB @13436
EXIT

/* ToB: Dorn > Aran : Puppetry and the Common Faerunian */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-dorntobaran","GLOBAL",0) 
OR(2) Global("OHD_urgothoz_patron","GLOBAL",1) Global("OHD_azothet_patron","GLOBAL",1)
InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)
~ THEN BDORN25 a5104
@13437
DO ~SetGlobal("c-dorntobaran","GLOBAL",1)~
== C-ARN25B @13438
== BDORN25 IF ~Global("OHD_urgothoz_patron","GLOBAL",1)~ THEN @13439
== BDORN25 IF ~Global("OHD_azothet_patron","GLOBAL",1)~ THEN  @13440
== C-ARN25B @13441
== BDORN25 @13442
== C-ARN25B @13443
== BDORN25 @13444
== C-ARN25B @13445
== BDORN25 @13446
EXIT

/* ToB: Aran > Dorn : Patrons, Shmatrons. */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) 
Global("OHD_azothet_patron","GLOBAL",0)
Global("OHD_urgothoz_patron","GLOBAL",0)
Global("c-arantobdorn2","GLOBAL",0)
InParty("Dorn") InMyArea("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN C-ARN25B a5107
@13447
DO ~SetGlobal("c-arantobdorn2","GLOBAL",1)~
== BDORN25 @13448
== C-ARN25B @13449
== BDORN25 @13450
== C-ARN25B @13451
== BDORN25 @13452
EXIT

/* ToB: Aran > Dorn : Once an Alpha Male, Always an Alpha Male. */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arantobdorn","GLOBAL",0)
InParty("Dorn") InMyArea("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN C-ARN25B a5103
@13453
DO ~SetGlobal("c-arantobdorn","GLOBAL",1)~
== BDORN25 @13454
== C-ARN25B @13455
== BDORN25 @13456
== C-ARN25B @13457
== BDORN25 @13458
== C-ARN25B @13459
== BDORN25 @13460
== C-ARN25B @13461
== BDORN25 @13462
EXIT



