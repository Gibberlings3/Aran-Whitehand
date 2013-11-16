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

/* SoA: Aran > Hexxat : Bloodlusts */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-aransoahexxat","GLOBAL",0) 
InParty("Hexxat") InMyArea("Hexxat") !StateCheck("Hexxat",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN C-ARANB a5108
@13347
DO ~SetGlobal("c-aransoahexxat","GLOBAL",1)~
== BHEXXAT @13348
== C-ARANB @13349
== BHEXXAT @13350
== C-ARANB @13351
EXIT

/* SoA: Hexxat > Aran : Opposites */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) 
InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)
Global("c-hexxatsoaaran","GLOBAL",0)~ THEN BHEXXAT a5109
@13352
DO ~SetGlobal("c-hexxatsoaaran","GLOBAL",1)~
== C-ARANB @3601
== BHEXXAT @13353
== C-ARANB @13354
== BHEXXAT @13355
== C-ARANB @13356
== BHEXXAT @13357
== C-ARANB @13358
EXIT

/* ToB: Aran > Hexxat : Trust */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) 
InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)
Global("c-arantobhexxat","GLOBAL",0)~ THEN C-ARN25B a5110
@13359
DO ~SetGlobal("c-arantobhexxat","GLOBAL",1)~
== BHEXXA25 @13360
== C-ARN25B @13361
== BHEXXA25 @13362
== C-ARN25B @13363
== BHEXXA25 @13364
== C-ARN25B @13365
EXIT

/* ToB: Hexxat > Aran : Frenemies, minus the FR */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) 
InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) 
InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)
Global("c-hexxattobaran","GLOBAL",0)~ THEN BHEXXA25 a5111
@13366
DO ~SetGlobal("c-hexxattobaran","GLOBAL",1)~
== C-ARN25B @13367
== BHEXXA25 @13368
== C-ARN25B @13369
== BHEXXA25 @13370
== C-ARN25B @13371
EXIT

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
  IF ~!Gender(Player1,FEMALE)~ THEN GOTO a5116
  IF ~Gender(Player1,FEMALE)~ THEN GOTO a5117
  IF ~Gender(Player2,FEMALE) !Name("c-aran",Player2) !Name("Viconia",Player2) !Name("Hexxat",Player2)~ THEN GOTO a5118
  IF ~Gender(Player3,FEMALE) !Name("c-aran",Player3) !Name("Viconia",Player3) !Name("Hexxat",Player3)~ THEN GOTO a5119
  IF ~Gender(Player4,FEMALE) !Name("c-aran",Player4) !Name("Viconia",Player4) !Name("Hexxat",Player4)~ THEN GOTO a5120
  IF ~Gender(Player5,FEMALE) !Name("c-aran",Player5) !Name("Viconia",Player5) !Name("Hexxat",Player5)~ THEN GOTO a5121
  IF ~Gender(Player6,FEMALE) !Name("c-aran",Player6) !Name("Viconia",Player6) !Name("Hexxat",Player6)~ THEN GOTO a5122
END

IF ~~ a5116 SAY @13397 IF ~~ THEN GOTO a5123 END
IF ~~ a5117 SAY @13398 IF ~~ THEN GOTO a5123 END
IF ~~ a5118 SAY @13399 IF ~~ THEN GOTO a5123 END
IF ~~ a5119 SAY @13400 IF ~~ THEN GOTO a5123 END 
IF ~~ a5120 SAY @13401 IF ~~ THEN GOTO a5123 END 
IF ~~ a5121 SAY @13402 IF ~~ THEN GOTO a5123 END 
IF ~~ a5122 SAY @13403 IF ~~ THEN GOTO a5123 END 

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



