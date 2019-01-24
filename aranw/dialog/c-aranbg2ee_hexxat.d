//////////////////////////////////////////////////////////////////////////////////////
//// Aran Whitehand BGII:EE SoA and ToB Dialog File - cmorgan - traified - HEXXAT ////
//////////////////////////////////////////////////////////////////////////////////////

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
InParty("Hexxat") InMyArea("Hexxat") !StateCheck("Hexxat",CD_STATE_NOTVALID) 
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


