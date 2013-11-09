/////////////////////////////////////////////////////////
// Aran Whitehand ToB Dialog File - cmorgan - traified //
/////////////////////////////////////////////////////////

/* ToB Interjections and commentary */

BEGIN C-ARN25A /* pre-joined ToB, just summoned */
BEGIN C-ARN25J /* joined ToB */
BEGIN C-ARN25B /* banter ToB */
BEGIN C-ARN25P /* post-joined ToB */
BEGIN C-ARWRTH /* wraith creature dialog */

/* Volo's Talk in Saradush */
EXTEND_BOTTOM SARVOLO 9 /* Which of your companions would you like to hear about now? */
IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN REPLY @11302 DO ~IncrementGlobal("c-aranvolo","GLOBAL",1)~ + a1386
END

CHAIN SARVOLO a1386
@11303
/* 2nd time */
== C-ARN25J IF ~GlobalGT("c-aranvolo","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11304
== SARVOLO IF ~GlobalGT("c-aranvolo","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11305
/* no romance 1st time */
== C-ARN25J IF ~Global("c-aranvolo","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11306
== SARVOLO IF ~Global("c-aranvolo","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11307
== C-ARN25J IF ~Global("c-aranvolo","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11308
== SARVOLO IF ~Global("c-aranvolo","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11309
/* romance 1st time */
== C-ARN25J IF ~Global("c-aranvolo","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11310
== SARVOLO IF ~Global("c-aranvolo","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11311
== C-ARN25J IF ~Global("c-aranvolo","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11312
== SARVOLO IF ~Global("c-aranvolo","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11313
== C-ARN25J IF ~Global("c-aranvolo","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11314
END
IF ~~ THEN EXTERN SARVOLO 9

/* Fate Spirit Summons: Three options, by user choice - friend,  ex-lover (broken up) , or still in the relationship */
EXTEND_TOP FATESP 6 #5
IF ~!Dead("c-aran") !InMyArea("c-aran") Global("c-aransummoned","GLOBAL",0)~ THEN REPLY @11315 DO ~CreateVisualEffect("SPPORTAL",[1999.1218]) Wait(2) CreateCreature("c-aran13",[1999.1218],0) SetGlobal("c-aransummoned","GLOBAL",1)~ GOTO 8
IF ~Gender(Player1,FEMALE) !Dead("c-aran") !InMyArea("c-aran") Global("c-aransummoned","GLOBAL",0)~ THEN REPLY @11316 DO ~CreateVisualEffect("SPPORTAL",[1999.1218]) Wait(2) CreateCreature("c-aran13",[1999.1218],0) SetGlobal("c-aransummoned","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~ GOTO 8
IF ~Gender(Player1,FEMALE) !Dead("c-aran") !InMyArea("c-aran") Global("c-aransummoned","GLOBAL",0)~ THEN REPLY @11317 DO ~CreateVisualEffect("SPPORTAL",[1999.1218]) Wait(2) CreateCreature("c-aran13",[1999.1218],0) SetGlobal("c-aransummoned","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",2)~ GOTO 8
END

/* Joinables */

I_C_T BAERIE25 157 c-arn25bae157 /* It's a boy!  Oh, what a beautiful son we have - look at him wiggle his toes! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11318
END

I_C_T KORGA25J 1 c-arn25korg1 /* Har!  A little pickle tickle with the Sister in the back of the church, eh?  Ye know what they say... nun is better!  HAR! HAR! HAR! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11319
== KORGA25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11320
END

I_C_T NALIA25J 0 c-arn25nalj0 /* I applaud her efforts.  It's the duty and privilege of us of the upper classes to aid the less fortunate by taking them under our protection. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11321
== NALIA25J IF ~Global("c-silencearan","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11322
END

I_C_T SAREV25J 8 c-arn25sarv8 /* <CHARNAME>, I can tell just by looking at the defenses of that stronghold that a direct assault would be pointless. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11323
== SAREV25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11324
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11325
END

/* Non-Joinables */
I_C_T 25SPELL 1 c-arn25sp1 /* Can I interest you in my wares?  I've got a collection of scrolls most mages would die for! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11326
END

I_C_T 25SPELL 8 c-arn25sp8 /* I would normally invite you to look at my magical wares, but alas my shelves are completely bare.  I have not even a single parchment left for you to purchase. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11327
END

I_C_T 25SPELL 22 c-arn25sp22 /* Have you made the exchange with Hectan yet?  Have you recovered my spellbook? */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) !PartyHasItem("PLOT18B") InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11328
END

I_C_T ABAZIGAL 0 c-arn25abaz /* Welcome.  I have watched your progress with great interest.  For a lesser creature you are quite amusing. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11329
END

I_C_T AMARCH02 2 c-arn25ama2 /* I can't be wasting my time yapping with some slack jawed yokel. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11330
END

I_C_T AMBAR01 9 c-arn25amb9 /* The order ignores us.  They apply restrictions on the smugglers and have even killed some, restricting the supplies the village can be brought.  And then there are all the mercenaries... */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11331
END

I_C_T AMBAR01 16 c-arn25amb16 /* I have heard tales of great wars and destruction in the lands beyond the desert, and while the order has never involved itself in such things before, it seems Balthazar has changed things.  He plans a war...a great and terrible war... but I do not know against whom. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11332
END

I_C_T AMBOY01 3 c-arn25amb01/* If I had a sword, Balthazar would pay me to join his army! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11333
END

I_C_T2 AMELM01 7 c-arn25amel7 /* I have to leave again, soon, so I can't help you much.  But I can help you a little, whether you like it or not.  It's important that this all ends, soon, but that doesn't mean I won't lift a finger over it. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11334
END

I_C_T AMLICH01 20 c-arn25lich /* You... you have killed Marlowe?!  Now I shall never collect what he owed to me, fool!  You may be powerful, but I shall strike you down!  To me, undead ones!  Kill the godling!! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11335
== AMLICH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11336
END

I_C_T AMLICH01 21 c-arn25lich /* So... the one with great power that I sensed has arrived at last.  How I... looked forward to tasting your soul, little godling.  You are powerful, yes... but it is a risk I shall take!! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11337
== AMLICH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11336
END

I_C_T AMLICH01 22 c-arn25lich /* I shall wait no longer for our business to be done, godling!  I hunger for your soul, and I shall have it!!  Despite your power, I shall take it!! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11337
== AMLICH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11336
END

I_C_T AMLICH01 28 c-arn25lich /* Hissssss!!  Then you shall die!!  Then you shall all die!! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11337
== AMLICH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11336
END

I_C_T AMLICH01 32 c-arn25lich /* Ah, yes.  That was not part of our bargain, was it?  I should have suspected as much.  So be it, godling... but you shall not find me a simple target!! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11337
== AMLICH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11336
END

I_C_T AMMAYOR 5 c-arn25mayor5 /* My daughter is a compassionate woman, but young and impulsive.  She foolishly stole money from these mercenaries to ease the suffering of the starving children of our town. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11338
END

I_C_T AMSAEMON 3 c-arn25saem3 /* Your arrival is a happy coincidence, given the situation.  You can actually solve my dispute with these rather upset gentlemen. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11339
END

I_C_T AMSAEMON 6 c-arn25saem6 /* I guess <CHARNAME> isn't going to cooperate.  I'm afraid this can only end in violence. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11340
END

I_C_T2 AMTGEN01 1 c-arn25gen1 /* You are a spawn of Bhaal and responsible for the destruction of the city of Saradush.  Your execution has been ordered, <CHARNAME>.  May the gods have mercy on your soul. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11341
END

I_C_T BALTH 22 c-arn25balth22 /* My plan is much more altruistic.  I have vowed to exterminate all of Bhaal's children, forever wiping the Realms clean of his tainted existence.  You have merely helped me in my goal. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11342
END

I_C_T2 BAZDRA01 1 c-arn25dr1 /* No... I see I am wrong.  You are not brothers of the tattooed one.  *sniff*  I smell the taint of Bhaal on you. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11343
END

I_C_T BAZDRA03 1 c-arn25dr03 /* On your knees before you enter the presence of Abazigal!  Bow before his ruthless might! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11344
END

I_C_T BAZDRA03 2 c-arn25dr03 /* The cavern echoes with the voice of the dragon, though the words seem somewhat forced and unnatural: */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11345
END

I_C_T BAZDRA03 13 c-arn25dr03 /* You have the stench of the Bhaalspawn... the same stench as Abazigal, though he tries to hide it behind the more palatable scent of his wyrm-kind heritage. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11345
END

I_C_T BAZEYE01 0 c-arn25beh0 /* You there! Intruder type! Why do you pester Lord Abazigal's most favored servant? */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11346
END

I_C_T  BAZMONK 9 c-arn25bzm9 /* There is something else. *cough*  Something you must do before you can face Abazigal.  The entrance to Abazigal's inner sanctum is protected by a dragon. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11347
END

I_C_T2 BOTSMITH 152 c-arn25cen /* Ummm... Cespenar only serve the great one.  You'se nice, maybe, but you'se still a nobody. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) Name("c-aran",LastTalkedToBy) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11348
END

I_C_T2 BOTSMITH 152 c-arn25cen /* Ummm... Cespenar only serve the great one.  You'se nice, maybe, but you'se still a nobody. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) Name("c-aran",LastTalkedToBy) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11349
END

I_C_T FINMEL01 4 c-arn25finm /* I am disappointed in you, <CHARNAME>.  So much bluster, so much force.  How you have managed to blunder your way through the realms and not perished sooner, I have no idea. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11350
END

I_C_T2 FINSOL01 27 c-arn25endrom /* The choice is difficult, but these are your two options, Bhaalspawn.  This is where your destiny is realized, and your future begins. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11351
END

I_C_T2 FINSOL01 27 c-arn25endnorome /* The choice is difficult, but these are your two options, Bhaalspawn.  This is where your destiny is realized, and your future begins. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Alignment(Player1,MASK_EVIL)~ THEN @11352
END

I_C_T2 FINSOL01 27 c-arn25endnoromg /* The choice is difficult, but these are your two options, Bhaalspawn.  This is where your destiny is realized, and your future begins. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) !Alignment(Player1,MASK_EVIL)~ THEN @11353
END

I_C_T2 FINSOL01 27 c-arn25endbaby /* The choice is difficult, but these are your two options, Bhaalspawn.  This is where your destiny is realized, and your future begins. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) Global("AerieHadBaby","GLOBAL",1) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11354
END

I_C_T GROMG02 3 c-arn25sarg /* Slay the invaders!  Attack! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11355
== GROMG02 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11356
END

I_C_T HGNYA01 2 c-arn25nya /* Why, the Nyalee is I!  The Witch of the Glade, I is called, and for good reason, it is!  But questions...you have so many questions, know I! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11357
END

I_C_T HGNYA01 3 c-arn25nya /* Nyalee survives very well, she does, and Nyalee is I!  The Witch of the Glade, they calls me, hee hee!  But so many questions you have! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11358
END

I_C_T HGNYA01 4 c-arn25nya /* You should know, spawn-child, you should know!  Nyalee served the dead master, once, and Nyalee is I!  Hee hee!  But so many questions you have, questions questions! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11359
END

I_C_T HGNYA01 5 c-arn25nya /* Tricks, yes!  Nyalee knows many tricks!  Witch of the Glade, they calls me, for many good reasons.  Hee hee!  But so many questions you have! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11360
END

I_C_T MARLOWE 16 c-arn25marl /* As I said before, my name is Marlowe... I hail from Calimshan to the south, where I was a merchant.  A successful one.  I... suppose that is where I first came into contact with Vongoethe. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11361
== MARLOWE IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11362
END

I_C_T MELISS01 11 c-arn25mel11 /* Getting rid of one of the Five without it looking like my doing was one thing...but with you already in Saradush, I could turn you on Yaga-Shura as well.  After I let him into Saradush to kill the other Bhaalspawn, of course. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11363
END

I_C_T2 SARBOY01 1 c-arn25sboy /* Gromnir has a big army.  When I grow up I want a big army. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11364
END

I_C_T SARBUL04 3 c-arn25bulf /* (needs passback)  Guess it's time to remind everyone who's in charge around here! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11365
== SARBUL04 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11366
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11367
== SARBUL04 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11368
END

I_C_T SARKIS01 7 c-arn25kisconf /* My utilization of complex locution is more a reflection of my own superincumbent mental acuity than an aspersion on your circumscribed lexicon. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11369
END

I_C_T SARMEL01 17 c-arn25srm17 /* The actions of Gromnir and his soldiers have caused dissension within the town, and made it almost impossible for the loyal Saradush militia to defend the walls.  We must first defeat the enemy within before we can end this siege. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11370
END

I_C_T SARWAI01 1 c-arn25wgg /* I wish someone would stand up to them... but everyone's afraid of Gromnir.  *sniff*  I guess I'll just have to put up with it. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) !Alignment(Player1,MASK_EVIL)~ THEN @11371
END

I_C_T SARWAI01 1 c-arn25wgg /* I wish someone would stand up to them... but everyone's afraid of Gromnir.  *sniff*  I guess I'll just have to put up with it. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Alignment(Player1,MASK_EVIL)~ THEN @11372
END

I_C_T YAGCON 12 c-arn25ygcon12 /* I wanted to become part of his unstoppable war machine, to revel in the slaughter, to have my blade drip with the blood of all those Yaga Shura crushed beneath his mighty boot! ~ */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11373
END

I_C_T YAGCON 18 c-arn25ygcon18 /* I have heard mention of a name from Yaga Shura's past - Nyalee, an old crone who lives in the marshes of the Mir Forests.  She may know Yaga Shura's secrets. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) !Alignment(Player1,MASK_EVIL)~ THEN @11374
END

I_C_T YAGCON 18 c-arn25ygcon18 /* I have heard mention of a name from Yaga Shura's past - Nyalee, an old crone who lives in the marshes of the Mir Forests.  She may know Yaga Shura's secrets. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Alignment(Player1,MASK_EVIL)~ THEN @11375
END

I_C_T SARMEL01 49 c-arn25mls49 /* I can show you where that glade is... but it is only speculation.  The key to the giant's invulnerability might lay there, but it might not.  There may be nothing there at all. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11376
== SARMEL01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11377
END

I_C_T SARMEL01 16 c-arn25mls16 /* But Gromnir is mad.  He has barricaded himself in the castle throne room, and his troops run amok through the town with no regard for the lives and rights of the citizens of Saradush. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11378
== SARMEL01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11379
END

I_C_T SARMEL01 80 c-arn25mls80 /* He runs a monastic order in a remote village in the Calim Desert...it will serve to both hide you from retribution as well as serve as a base from which you can attack the enclaves of Abazigal and Sendai. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11380
END

I_C_T SARPROVF 6 c-arn25prvf6 /* I am not interested in you... I wish only to speak with the leader of your group. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11381
END

I_C_T SARPROVF 0 c-arn25prvf0 /* You look like a mighty fine piece of man-meat.  Why don't we slip away alone?  I promise a night you'll remember for the rest of your life.  Only fifty gold coins. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11382
== SARPROVF IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11383
END

I_C_T SARTHF2 0 c-arn25bth /* What do you want?  You think you can hassle me just because I'm a kid? */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11384
END

I_C_T SENDAI 15 c-arn25sd15 /* NO!  NO!  My Bhaal essence is ripped from my very soul!  Damn you!  But I may yet rob you of the glory of your victory. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11385
== SENDAI IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11386
END

I_C_T SENGUA01 4 c-arn25sgd4 /* Could have been my imagination, though.  I ain't never seen elves with black skin before.  And they were only there for a second before they vanished. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11387
== SENGUA01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11388
END

I_C_T SENBEH01 10 c-arn25behdr10 /* Well, yes.  Can't say I cared overmuch for that, although you *did* release me from one of the most boring tasks in Creation.  Can't keep a good beholder down, I guess, eh?  Heh heh. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11389
== SENBEH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11390
END

I_C_T SARELF01 2 c-arn25srelf /* We have nowhere to stay... we have no choice but to wander the streets.  I fear we will soon run afoul of Gromnir's men once more. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11391
== SARELF01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11392
END

/* ToB Version, Watcher's Keep */
I_C_T FSDRAGON 0 c-arn25dra0 /* I am the fearsome death that awaits those that would break the seal. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @416
== FSDRAGON IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @417
END

I_C_T FSSPIR2 1 c-arn25spi1 /* I am the Keeper of the Key, the One Left Behind.  Duty compels me to remain, to stand guard over one of the keys to the final seal. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11393
== FSSPIR2 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @419
END

I_C_T GORAPP1 6 c-arn25ap6 /* Odren intended it be thee to sacrifice thy life, rather than make his own sacrifice willingly.  He also failed to tell thee the scope of the evil that lies within...the Imprisoned One is Demogorgon, Prince of Demons. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @11394
== GORAPP1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @421
END

I_C_T GORDEMO 1 c-arn25pod1 /* You do not see anything physical within the chamber...but you feel its presence all around you.  A phantasmal hand brushes your cheek, a curious gesture that startles you and is gone just as quickly. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @422
END

I_C_T GORMAD1 1 c-arn25yak1 /* Yakman talk talk talk all the time, he was told... Talkative Yakman!  Once came with party, all looking for treasure, Yakman talk talk talk all the time.  Now they are all dead and only Yakman left, lost lost.  Lonely Yakman! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @423
== GORMAD1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @424
END

I_C_T GORMAD1 34 c-arn25tm34 /* 'Yakman'?  That...that was that ridiculous nickname that atrocious little halfling kept calling me.  My name is Tamorlin.  Wh...where is my party?  Where am I? */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @425
== GORMAD1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @426
END

I_C_T GORODR1 2 c-arn25od2 /* norom - Greetings to you, my friend.  I believe I have heard of you...you are <GABBER>, one of the companions of the Child of Bhaal.  Please, I must speak to <PRO_HIMHER>! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @427
== GORODR1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @428
END

I_C_T GORODR1 2 c-arn25od2 /* rom - Greetings to you, my friend.  I believe I have heard of you...you are <GABBER>, one of the companions of the Child of Bhaal.  Please, I must speak to <PRO_HIMHER>! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @429
== GORODR1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @428
END

I_C_T GORODR1 10 c-arn25od10 /* The old prison would not hold this great evil for long, He said.  Our order would have to maintain a vigil, to watch for the day when the evil would begin to break the great seals and escape. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @430
== GORODR1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @431
END

I_C_T GORODR1 50 c-arn25od50 /* You knew not what you did, <GABBER>, so your foolishness can be forgiven, I am sure.  Farewell to you. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @432
== GORODR1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @433
END

I_C_T GORODR1 53 c-arn25od53 /* The Imprisoned One is none other than Demogorgon, Prince of Demons.  We did not think he could... be defeated... and so we sought someone else to take our place and seal the demon within the Keep. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @434
END

I_C_T GORPRI1 2 c-arn25pipe /* (needs passback) I apologize for my... undeserved reaction.  I will take my slippers and let you finish your work here. Look through the sarcophagus if you wish. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @435
== GORPRI1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @436
END

I_C_T GORSUC01 0 c-arn25suc0 /* Ahhh, look here, dear ladies.  Yet another hapless wanderer, drifting through these endless portals.  Is it lost, do you think?  Shall we ask it? */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @437
== GORSUC01 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @438
END

/* ToB C-ARN25B additions */

/* ToB: Aran > Aerie : Keeping Secrets Secret While Glowing */
CHAIN
IF ~CombatCounter(0) !Detect([ENEMY]) InParty("Aerie") See("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("AerieRomanceActive","GLOBAL",2)
Global("c-aransuspicious","GLOBAL",0) Global("AerieHadBaby","GLOBAL",0) Global("babytalk","GLOBAL",1)~ THEN C-ARN25B a3004
@11395
DO ~SetGlobal("c-aransuspicious","GLOBAL",1)~
== BAERIE25 @11396
== C-ARN25B @11397
== BAERIE25 @11398
== C-ARN25B @11399
== BAERIE25 @11400
== C-ARN25B @11401
== BAERIE25 @11402
== C-ARN25B @11403
== BAERIE25 @11404
== C-ARN25B @11405
EXIT

/* ToB C-ARN25J additions */

APPEND C-ARN25J

/* ToB Scenery Dialog : Romantic Encounters Reactions */
/* Sarevok and PC "disappear" for awhile */
IF ~Global("c-arnRESarev","LOCALS",1)~ THEN BEGIN a4872
   SAY @11406
   IF ~~ THEN EXIT
END

/* In Watcher's Keep, ToB  - both C-ARANJ and C-ARN25J triggered from Global("c-aranwatchkeep","GLOBAL",1) and closed to 2 in dlg */

IF ~Global("c-aranwatchkeep","GLOBAL",1)~ THEN BEGIN a973
 SAY @6471
 ++ @6472 DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a974
 ++ @6473 DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a975
 + ~Class("c-aran",THIEF_ALL)~ + @6474 DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a976
 + ~Class("c-aran",MAGE_ALL)~ + @6475 DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a977
 + ~Class("c-aran",CLERIC_ALL)~ + @6476 DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a978
 + ~Class("c-aran",FIGHTER_ALL)~ + @6477 DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a979
END

IF ~~ a974
 SAY @8517
 ++ @8518 + a982
 ++ @8519 + a981
 ++ @11407 + a980
 + ~Class(Player1,THIEF_ALL)~ + @8521 + a980
 + ~Class(Player1,MAGE_ALL)~ + @8522 + a980
 + ~Class(Player1,CLERIC_ALL)~ + @8523 + a980
 + ~Class(Player1,FIGHTER_ALL)~ + @8524 + a980
END

IF ~~ a975
 SAY @8525
 ++ @8518 + a982
 ++ @8519 + a981
 ++ @11407 + a980
 + ~Class(Player1,THIEF_ALL)~ + @8521 + a980
 + ~Class(Player1,MAGE_ALL)~ + @8522 + a980
 + ~Class(Player1,CLERIC_ALL)~ + @8523 + a980
 + ~Class(Player1,FIGHTER_ALL)~ + @8524 + a980
END

IF ~~ a976
  SAY @8526
  ++ @8519 + a981
  ++ @8518 + a982
  ++ @11407 + a980
  + ~Class(Player1,THIEF_ALL)~ + @8527 + a980
  + ~Class(Player2,THIEF_ALL) !Name("c-aran",Player2)~ + @8528 + a980
  + ~Class(Player3,THIEF_ALL) !Name("c-aran",Player3)~ + @8529 + a980
  + ~Class(Player4,THIEF_ALL) !Name("c-aran",Player4)~ + @8530 + a980
  + ~Class(Player5,THIEF_ALL) !Name("c-aran",Player5)~ + @8531 + a980
  + ~Class(Player6,THIEF_ALL) !Name("c-aran",Player6)~ + @8532 + a980
END

IF ~~ a977
 SAY @8533
 ++ @8519 + a981
 ++ @8518 + a982
 ++ @11407 + a980
 + ~Class(Player1,MAGE_ALL)~ + @8534 + a980
 + ~Class(Player2,MAGE_ALL) !Name("c-aran",Player2)~ + @8528 + a980
 + ~Class(Player3,MAGE_ALL) !Name("c-aran",Player3)~ + @8529 + a980
 + ~Class(Player4,MAGE_ALL) !Name("c-aran",Player4)~ + @8530 + a980
 + ~Class(Player5,MAGE_ALL) !Name("c-aran",Player5)~ + @8531 + a980
 + ~Class(Player6,MAGE_ALL) !Name("c-aran",Player6)~ + @8532 + a980
END

IF ~~ a978
 SAY @8535
 ++ @8519 + a981
 ++ @8518 + a982
 ++ @8520 + a980
 + ~Class(Player1,CLERIC_ALL)~ + @8527 + a980
 + ~Class(Player2,CLERIC_ALL) !Name("c-aran",Player2)~ + @8528 + a980
 + ~Class(Player3,CLERIC_ALL) !Name("c-aran",Player3)~ + @8529 + a980
 + ~Class(Player4,CLERIC_ALL) !Name("c-aran",Player4)~ + @8530 + a980
 + ~Class(Player5,CLERIC_ALL) !Name("c-aran",Player5)~ + @8531 + a980
 + ~Class(Player6,CLERIC_ALL) !Name("c-aran",Player6)~ + @8532 + a980
END

IF ~~ a979
 SAY @8536
 ++ @8519 + a981
 ++ @8518 + a982
 ++ @11408 + a980
 + ~Class(Player1,FIGHTER_ALL)~ + @8537 + a980
 + ~Class(Player2,FIGHTER_ALL) !Name("c-aran",Player2)~ + @8538 + a980
 + ~Class(Player3,FIGHTER_ALL) !Name("c-aran",Player3)~ + @8539 + a980
 + ~Class(Player4,FIGHTER_ALL) !Name("c-aran",Player4)~ + @8540 + a980
 + ~Class(Player5,FIGHTER_ALL) !Name("c-aran",Player5)~ + @8541 + a980
 + ~Class(Player6,FIGHTER_ALL) !Name("c-aran",Player6)~ + @8542 + a980
END

IF ~~ a980 SAY @8543 IF ~~ THEN EXIT END
IF ~~ a981 SAY @8544 IF ~~ THEN EXIT END
IF ~~ a982 SAY @8545 IF ~~ THEN EXIT END

/* ToB Plot Talk 1: Saradush */
IF ~Global("c-aransaradsush","GLOBAL",1)~ THEN BEGIN a2380
  SAY @11409
  ++ @11410 DO ~SetGlobal("c-aransaradsush","GLOBAL",2)~ + a2289
  ++ @11411 DO ~SetGlobal("c-aransaradsush","GLOBAL",2)~ + a2291
  ++ @11412 DO ~SetGlobal("c-aransaradsush","GLOBAL",2)~ + a2292
  + ~Global("c-aranrom","GLOBAL",2)~ + @11413 DO ~SetGlobal("c-aransaradsush","GLOBAL",2)~ + a2295
  ++ @11414 DO ~SetGlobal("c-aransaradsush","GLOBAL",2)~ + a2296
  ++ @11415 DO ~SetGlobal("c-aransaradsush","GLOBAL",2)~ + a2297
END

IF ~~ a2289
  SAY @11416
  IF ~~ THEN GOTO a2290
END

IF ~~ a2290
  SAY @11417
  ++ @11418 + a2294
  ++ @11419 + a2292
  ++ @11420 + a2292
  ++ @11421 + a2300
  ++ @11422 + a2297
END

IF ~~ a2291
  SAY @11423
  IF ~~ THEN GOTO a2290
END

IF ~~ a2292
  SAY @11424
  = @11425
  ++ @11426 + a2293
  ++ @11427 + a2292
  ++ @11428 + a2298
  ++ @11429 + a2299
  ++ @11430 + a2294
  ++ @11431 + a2304
END

IF ~~ a2295
  SAY @11432
  ++ @11433 + a2289
  ++ @11411 + a2291
  ++ @11414 + a2296
  ++ @11415 + a2297
END

IF ~~ a2296
  SAY @11434
  ++ @11435 + a2293
  ++ @11436 + a2289
  ++ @11437 + a2289
  ++ @11438 + a2290
END

IF ~~ a2297
  SAY @11439
  ++ @11440 + a2292
  ++ @11441 + a2302
  ++ @11442 + a2299
  ++ @11443 + a2301
  ++ @11444 + a2292
  ++ @11445 + a2298
END

IF ~~ a2302
  SAY @11446
  ++ @11447 + a2303
  ++ @11448 + a2300
END

IF ~~ a2293 SAY @11449 IF ~~ THEN EXIT END
IF ~~ a2294 SAY @11450 IF ~~ THEN EXIT END
IF ~~ a2298 SAY @11451 IF ~~ THEN EXIT END
IF ~~ a2299 SAY @11452 IF ~~ THEN EXIT END
IF ~~ a2300 SAY @11453 IF ~~ THEN EXIT END
IF ~~ a2301 SAY @11454 = @11455 IF ~~ THEN EXIT END
IF ~~ a2303 SAY @11456 IF ~~ THEN EXIT END
IF ~~ a2304 SAY @11457 = @11458 IF ~~ THEN EXIT END

/* Scenery Dialog : Aran Apologizes */
IF ~Global("c-aranapology","GLOBAL",1)~ THEN BEGIN a4999
  SAY @6485
  IF ~RandomNum(3,1)~ THEN DO ~SetGlobal("c-aranapology","GLOBAL",0)~ GOTO a5000
  IF ~RandomNum(3,2)~ THEN DO ~SetGlobal("c-aranapology","GLOBAL",0)~ GOTO a5001
  IF ~RandomNum(3,3)~ THEN DO ~SetGlobal("c-aranapology","GLOBAL",0)~ GOTO a5002
END

IF ~~ a5000 /* 7 to 11 responses */
  SAY @11459
  + ~Gender(Player2,MALE) !Name("c-aran",Player2)~ + @8766 + a5003
  + ~Gender(Player3,MALE) !Name("c-aran",Player3)~ + @8767 + a5003
  + ~Gender(Player4,MALE) !Name("c-aran",Player4)~ + @8768 + a5003
  + ~Gender(Player5,MALE) !Name("c-aran",Player5)~ + @8769 + a5003
  + ~Gender(Player6,MALE) !Name("c-aran",Player6)~ + @8770 + a5003
  + ~RandomNum(3,1)~ + @8771 + a5004
  + ~RandomNum(3,2)~ + @8772 + a5005
  + ~RandomNum(3,3)~ + @8773 + a5006
  + ~RandomNum(3,1)~ + @8774 + a5007
  + ~RandomNum(3,2)~ + @8775 + a5008
  + ~RandomNum(3,3)~ + @8776 + a5008
  + ~RandomNum(3,1)~ + @8703 + a5009
  + ~RandomNum(3,2)~ + @8735 + a5009
  + ~RandomNum(3,3)~ + @8777 + a5009
  + ~RandomNum(8,1)~ + @8778 + a5010
  + ~RandomNum(8,2)~ + @8779 + a5011
  + ~RandomNum(8,3)~ + @8780 + a5012
  + ~RandomNum(8,4)~ + @8781 + a5013
  + ~RandomNum(8,5)~ + @8782 + a5013
  + ~RandomNum(8,6)~ + @8781 + a5012
  + ~RandomNum(8,7)~ + @8783 + a5011
  + ~RandomNum(8,8)~ + @8778 + a5010
  ++ @8720 + a5014
  ++ @8721 + a5019
END

IF ~~ a5001 /* 8 to 12 responses */
  SAY @8784
  + ~Gender(Player2,MALE) !Name("c-aran",Player2)~ + @8785 + a5003
  + ~Gender(Player3,MALE) !Name("c-aran",Player3)~ + @8786 + a5003
  + ~Gender(Player4,MALE) !Name("c-aran",Player4)~ + @8787 + a5003
  + ~Gender(Player5,MALE) !Name("c-aran",Player5)~ + @8788 + a5003
  + ~Gender(Player6,MALE) !Name("c-aran",Player6)~ + @8770 + a5003
  + ~RandomNum(3,1)~ + @8771 + a5015
  + ~RandomNum(3,2)~ + @8789 + a5005
  + ~RandomNum(3,3)~ + @8773 + a5016
  + ~RandomNum(3,1)~ + @8790 + a5007
  + ~RandomNum(3,2)~ + @8775 + a5017
  + ~RandomNum(3,3)~ + @8776 + a5017
  + ~RandomNum(8,1)~ + @8778 + a5010
  + ~RandomNum(8,2)~ + @8779 + a5011
  + ~RandomNum(8,3)~ + @8780 + a5012
  + ~RandomNum(8,4)~ + @8781 + a5013
  + ~RandomNum(8,5)~ + @8782 + a5013
  + ~RandomNum(8,6)~ + @8781 + a5012
  + ~RandomNum(8,7)~ + @8783 + a5011
  + ~RandomNum(8,8)~ + @8778 + a5010
  + ~RandomNum(4,1)~ + @8725 + a5015
  + ~RandomNum(4,2)~ + @8726 + a5005
  + ~RandomNum(4,3)~ + @8726 + a5018
  + ~RandomNum(4,4)~ + @8724 + a5020
  ++ @8720 + a5014
  ++ @8721 + a5019
  ++ @8791 + a5031
END

IF ~~ a5002 /* lots of states, but only 6 to 8 are available in any given party */
  SAY @8792
  + ~Gender(Player2,MALE) !Name("c-aran",Player2)~ + @8739 + a5003
  + ~Gender(Player3,MALE) !Name("c-aran",Player3)~ + @8740 + a5003
  + ~Gender(Player4,MALE) !Name("c-aran",Player4)~ + @8741 + a5003
  + ~Gender(Player5,MALE) !Name("c-aran",Player5)~ + @8742 + a5003
  + ~Gender(Player6,MALE) !Name("c-aran",Player6)~ + @8743 + a5003
  + ~Gender(Player2,FEMALE) !Name("edwin",Player2) !Name("aerie",Player2) !Name("viconia",Player2) !Name("jaheira",Player2)~ + @8793 + a5003
  + ~Gender(Player3,FEMALE) !Name("edwin",Player3) !Name("aerie",Player3) !Name("viconia",Player3) !Name("jaheira",Player3)~ + @8794 + a5003
  + ~Gender(Player4,FEMALE) !Name("edwin",Player4) !Name("aerie",Player4) !Name("viconia",Player4) !Name("jaheira",Player4)~ + @8795 + a5003
  + ~Gender(Player5,FEMALE) !Name("edwin",Player5) !Name("aerie",Player5) !Name("viconia",Player5) !Name("jaheira",Player5)~ + @8796 + a5003
  + ~Gender(Player6,FEMALE) !Name("edwin",Player6) !Name("aerie",Player6) !Name("viconia",Player6) !Name("jaheira",Player6)~ + @8797 + a5003
  + ~Gender(Player2,FEMALE) Name("edwin",Player2)~ + @8749 + a5003
  + ~Gender(Player3,FEMALE) Name("edwin",Player3)~ + @8749 + a5003
  + ~Gender(Player4,FEMALE) Name("edwin",Player4)~ + @8749 + a5003
  + ~Gender(Player5,FEMALE) Name("edwin",Player5)~ + @8749 + a5003
  + ~Gender(Player6,FEMALE) Name("edwin",Player6)~ + @8749 + a5003
  /* Another female as foil: Aerie */
  + ~Gender(Player2,FEMALE) Name("aerie",Player2)~ + @8798 + a5003
  + ~Gender(Player3,FEMALE) Name("aerie",Player3)~ + @8798 + a5003
  + ~Gender(Player4,FEMALE) Name("aerie",Player4)~ + @8798 + a5003
  + ~Gender(Player5,FEMALE) Name("aerie",Player5)~ + @8798 + a5003
  + ~Gender(Player6,FEMALE) Name("aerie",Player6)~ + @8798 + a5003
  /* Another female as foil: Viconia */
  + ~Gender(Player2,FEMALE) Name("viconia",Player2)~ + @8799 + a5003
  + ~Gender(Player3,FEMALE) Name("viconia",Player3)~ + @8799 + a5003
  + ~Gender(Player4,FEMALE) Name("viconia",Player4)~ + @8799 + a5003
  + ~Gender(Player5,FEMALE) Name("viconia",Player5)~ + @8799 + a5003
  + ~Gender(Player6,FEMALE) Name("viconia",Player6)~ + @8799 + a5003
  /* Another female as foil: Jaheira */
  + ~Gender(Player2,FEMALE) Name("jaheira",Player2)~ + @8800 + a5003
  + ~Gender(Player3,FEMALE) Name("jaheira",Player3)~ + @8800 + a5003
  + ~Gender(Player4,FEMALE) Name("jaheira",Player4)~ + @8800 + a5003
  + ~Gender(Player5,FEMALE) Name("jaheira",Player5)~ + @8800 + a5003
  + ~Gender(Player6,FEMALE) Name("jaheira",Player6)~ + @8800 + a5003
  /* make up */
  + ~RandomNum(3,1)~ + @8801 + a5016
  + ~RandomNum(3,2)~ + @8802 + a5018
  + ~RandomNum(3,3)~ + @8773 + a5015
  /* do not make up */
  + ~RandomNum(3,1)~ + @8803 + a5008
  + ~RandomNum(3,2)~ + @8804 + a5021
  + ~RandomNum(3,3)~ + @8805 + a5003
  /* stop romance */
  ++ @8720 DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~ + a5014
  /* kick him out */
  ++ @8721 + a5019
  /* kick him out for good and try to kill him */
  ++ @8791 + a5031
END

IF ~~ a5003
  SAY @8806
  /* make up */
  + ~RandomNum(3,1)~ + @8807 + a5005
  + ~RandomNum(3,2)~ + @8808 + a5016
  + ~RandomNum(3,3)~ + @8809 + a5018
  /* do not make up */
  + ~RandomNum(3,1)~ + @8810 + a5008
  + ~RandomNum(3,2)~ + @8811 + a5021
  + ~RandomNum(3,3)~ + @8812 + a5022
  /* cry */
  + ~RandomNum(3,1)~ + @8703 + a5009
  + ~RandomNum(3,2)~ + @8735 + a5009
  + ~RandomNum(3,3)~ + @8813 + a5009
  /* PC expects groveling by Aran */
  + ~RandomNum(3,1)~ + @8779 + a5010
  + ~RandomNum(3,2)~ + @8814 + a5011
  + ~RandomNum(3,3)~ + @8815 + a5012
  /* stop romance */
  ++ @8720 + a5014
  /* kick him out */
  ++ @8721 + a5019
  /* kick him out for good and try to kill him */
  ++ @8791 + a5031
END

IF ~~ a5007
  SAY @8816
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ a5017
  SAY @8817
  + ~RandomNum(4,1)~ + @8818 + a5023
  + ~RandomNum(4,2)~ + @8819 + a5024
  + ~RandomNum(4,3)~ + @8820 + a5025
  + ~RandomNum(4,4)~ + @8821 + a5026
  + ~RandomNum(4,1)~ + @8822 + a5015
  + ~RandomNum(4,2)~ + @8823 + a5005
  + ~RandomNum(4,3)~ + @8824 + a5016
  + ~RandomNum(4,4)~ + @8825 + a5018
  ++ @8826 + a5023
END

IF ~~ a5008
  SAY @8827
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ a5021
  SAY @8828
  + ~RandomNum(2,1)~ + @8829 + a5023 /* reconsider, no */
  + ~RandomNum(2,2)~ + @8830 + a5024 /* reconsider, no */
  + ~RandomNum(2,1)~ + @8831 + a5025 /* reconsider, no */
  + ~RandomNum(2,2)~ + @8832 + a5026 /* reconsider, no */
  + ~RandomNum(2,1)~ + @8833 + a5015 /* reconsider, yes */
  + ~RandomNum(2,2)~ + @8834 + a5005 /* reconsider, yes */
  + ~RandomNum(2,1)~ + @8835 + a5016 /* reconsider, yes */
  + ~RandomNum(2,2)~ + @8836 + a5018 /* reconsider, yes */
  ++ @8837 + a5024
END

IF ~~ a5009
  SAY @8838
  ++ @8839 + a5022
  /* make up */
  + ~RandomNum(2,1)~ + @8840 + a5016
  + ~RandomNum(2,2)~ + @8841 + a5018
  ++ @8842 + a5027
  ++ @8843 + a5028
  /* Gratuitous stealing of song lyrics, and if you don't know from which song, you are missing out on some great music... */
  ++ @8844 + a5027
END

IF ~~ a5010
  SAY @8845
  = @8846
  ++ @8847 + a5005
  ++ @8848 + a5005
  ++ @8849 + a5022
  ++ @8850 + a5012
  ++ @8851 + a5020
END

IF ~~ a5011
  SAY @8852
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT /* goes to preexisting without global setting */
END

IF ~~ a5012
  SAY @8853
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT /* goes to preexisting without global setting */
END

IF ~~ a5013
  SAY @8854
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ a5020
  SAY @8855
  = @8856
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT
END

IF ~~ a5027
  SAY @8864
  ++ @8865 + a5029
  ++ @8866 + a5029
  ++ @8867 + a5028
  ++ @8868 + a5030
  ++ @8869 + a5030
END

IF ~~ a5029
  SAY @8870
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT
END

IF ~~ a5030
  SAY @8871
  = @8872
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0)~ EXIT /* no NPC initiated flirt restart  */
END

IF ~~ a5028
  SAY @8873
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT
END

IF ~~ a5004
  SAY @8876
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT
END

IF ~~ a5006
  SAY @8877
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT
END

IF ~~ a5015
  SAY @8878
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT
END

IF ~~ a5005
  SAY @8879
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT
END

IF ~~ a5016
  SAY @8880
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT
END

IF ~~ a5018
  SAY @8881
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT
END

IF ~~ a5023
  SAY @8883
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ a5024
  SAY @8884
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ a5025
  SAY @8885
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ a5026
  SAY @8886
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ a5014
  SAY @8887
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~ EXIT
END  /*  deal with journal entry */

IF ~~ a5019
  SAY @8888
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3) SetGlobal("KickedOut","LOCALS",1) ActionOverride("c-aran",SetLeavePartyDialogFile()) ActionOverride("c-aran",ChangeAIScript("",DEFAULT)) ActionOverride("c-aran",LeaveParty())~ EXIT
END  /*  deal with journal entry */

IF ~~ a5022
  SAY @8859
  ++ @8860 + a5014
  ++ @8721 + a5019
  ++ @8861 + a5031
  ++ @8862 + a5027
  ++ @8842 + a5027
  ++ @8863 DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

/* NightTalk: Stars, Constancy Thereof */
IF ~Global("c-tobnightone","GLOBAL",1)~ THEN BEGIN a4249
  SAY @11460
  ++ @11461 DO ~SetGlobal("c-tobnightone","GLOBAL",2)~ + a4250
  ++ @11462 DO ~SetGlobal("c-tobnightone","GLOBAL",2)~ + a4251
  ++ @11463 DO ~SetGlobal("c-tobnightone","GLOBAL",2)~ + a4251
  ++ @11464 DO ~SetGlobal("c-tobnightone","GLOBAL",2)~ + a4251
  + ~Gender(Player1,MALE)~ + @11465 DO ~SetGlobal("c-tobnightone","GLOBAL",2)~ + a4251
  + ~GlobalGT("c-aranrom","GLOBAL",0) GlobalLT("c-aranrom","GLOBAL",3) Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11466 DO ~SetGlobal("c-tobnightone","GLOBAL",2)~ + a4251
  + ~RandomNum(5,5)~ + @11467 DO ~SetGlobal("c-tobnightone","GLOBAL",2)~ + a3188 /* c-aranshutup55 */
  + ~RandomNum(5,4)~ + @11467 DO ~SetGlobal("c-tobnightone","GLOBAL",2)~ + a3189 /* c-aranshutup56 */
  + ~RandomNum(5,3)~ + @11467 DO ~SetGlobal("c-tobnightone","GLOBAL",2)~ + a3190 /* c-aranshutup57 */
  + ~RandomNum(5,2)~ + @11467 DO ~SetGlobal("c-tobnightone","GLOBAL",2)~ + a3191 /* c-aranshutup58 */
  + ~RandomNum(5,1)~ + @11467 DO ~SetGlobal("c-tobnightone","GLOBAL",2)~ + a3192 /* c-aranshutup59 */
END

IF ~~ a4250
  SAY @11468
  ++ @11469 + a4252
  ++ @11470 + a4251
  + ~OR(3) Global("c-aranrom","GLOBAL",0) Global("c-aranrom","GLOBAL",3) HasItemEquiped("belt05",Player1)~ + @11471 + a4254
  + ~GlobalGT("c-aranrom","GLOBAL",0) GlobalLT("c-aranrom","GLOBAL",3) Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11471 + a4253
  + ~GlobalGT("c-aranrom","GLOBAL",0) GlobalLT("c-aranrom","GLOBAL",3) Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11472 + a4253
  + ~RandomNum(5,5)~ + @11473 + a3188 /* c-aranshutup55 */
  + ~RandomNum(5,4)~ + @11473 + a3189 /* c-aranshutup56 */
  + ~RandomNum(5,3)~ + @11473 + a3190 /* c-aranshutup57 */
  + ~RandomNum(5,2)~ + @11473 + a3191 /* c-aranshutup58 */
  + ~RandomNum(5,1)~ + @11473 + a3192 /* c-aranshutup59 */
END

IF ~~ a4251
  SAY @11474
  IF ~OR(4) Global("c-aranrom","GLOBAL",0) Global("c-aranrom","GLOBAL",3) HasItemEquiped("belt05",Player1) Gender(Player1,MALE)~ THEN GOTO a4254
  IF ~GlobalGT("c-aranrom","GLOBAL",0) GlobalLT("c-aranrom","GLOBAL",3) Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ THEN GOTO a4253
END

IF ~~ a4252
  SAY @11475
  IF ~~ THEN GOTO a4254
END

IF ~~ a4253
  SAY @11476
  ++ @6960 + a3915 /* FEMALE_MOON_LEADS */
  ++ @6961 + a3916 /* ARAN_MOON_LEADS */
  ++ @11477 + a4254
  ++ @6963 + a3918 /* ARAN_MOON_MIND */
  ++ @11478 + a3919 /* MOON_JUST_FRIENDS */
  ++ @11479 + a3918 /* ARAN_MOON_MIND */
  ++ @11480 + a3866 /* FIGHT_EXIT */
END

IF ~~ a4254
  SAY @11481
  IF ~~ THEN EXIT
END


/* ToB Plot Talk : Sarevok chosen as companion: Activate after a week */
/*
~Global("c-aranworriedtob","GLOBAL",1)~
DO ~SetGlobal("c-aranworriedtob","GLOBAL",2)~

GlobalGT("ADAngelSarevok","GLOBAL",2) - crossmod with Sister V
*/

/* ToB Plot Talk : Sarevok chosen as companion: death of Sarevok after warning */
/*
IF ~Global("c-aranworriedtob","GLOBAL",3)~

DO ~SetGlobal("c-aranworriedtob","GLOBAL",4)~

GlobalGT("ADAngelSarevok","GLOBAL",2)
*/

/* ToB Plot Talk : Post Wraith Talk(tm)  */
IF ~Global("c-aranpostwraith","GLOBAL",1)~ THEN BEGIN a2242
  SAY @11482
  ++ @11483 DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2243
  ++ @11484 DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2243
  ++ @3961 DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2244
  ++ @11485 DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2245
  ++ @11486 DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2243
  ++ @11487 DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2243
END

IF ~~ a2244
  SAY @11488
  ++ @11489 + a2243
  ++ @11485 + a2245
  ++ @11490 + a2245
  ++ @11491 + a2243
  ++ @11492 + a2245
END

IF ~~ a2245
  SAY @11493
  IF ~~ THEN GOTO a2243
END

IF ~~ a2243
  SAY @11494
  ++ @11495 + a2246
  ++ @11496 + a2246
  ++ @11497 + a2246
  ++ @11498 + a2246
  ++ @11499 + a2260
END

IF ~~ a2246
  SAY @11500
  = @11501
  = @11502
  + ~Alignment(Player1,MASK_EVIL)~ + @11503 + a2249
  + ~Alignment(Player1,MASK_GOOD)~ + @11503 + a2250
  + ~!Alignment(Player1,MASK_EVIL) !Alignment(Player1,MASK_GOOD)~ + @11503 + a2251
  ++ @11504 + a2260
  ++ @11505 + a2247
END

IF ~~ a2247
  SAY @11506
  = @11507
  = @11508
  ++ @11509 + a2257
  + ~Alignment(Player1,MASK_EVIL)~ + @11503 + a2249
  + ~Alignment(Player1,MASK_GOOD)~ + @11503 + a2250
  + ~!Alignment(Player1,MASK_EVIL) !Alignment(Player1,MASK_GOOD)~ + @11503 + a2251
  ++ @11510 + a2252
  ++ @11511 + a2253
  ++ @11512 + a2248
END

IF ~~ a2248
  SAY @11513
  IF ~~ THEN GOTO a2252
END

IF ~~ a2249
  SAY @11514
  ++ @11515 + a2260
  ++ @11516 + a2260
  ++ @11517 + a2260
  ++ @11518 + a2260
  ++ @11519 + a2260
END

IF ~~ a2250
  SAY @11514
  ++ @11520 + a2258
  ++ @11521 + a2260
  ++ @11517 + a2260
  ++ @11522 + a2258
  ++ @11523 + a2257
END

IF ~~ a2251
  SAY @11514
  ++ @11520 + a2258
  ++ @11517 + a2260
  ++ @11524 + a2258
  ++ @11525 + a2258
  ++ @11523 + a2257
END

IF ~~ a2252
  SAY @11526
  ++ @11527 + a2255
  ++ @11528 + a2257
  ++ @11529 + a2259
  ++ @11530 + a2259
  ++ @11531 + a2260
END

IF ~~ a2253
  SAY @11532
  ++ @11527 + a2255
  ++ @11533 + a2254
  ++ @11534 + a2256
  ++ @11530 + a2259
END

IF ~~ a2254
  SAY @11535
  ++ @11536 + a2257
  ++ @11537 + a2258
  ++ @11538 + a2256
  ++ @11539 + a2258
  ++ @11540 + a2258
END

IF ~~ a2255
  SAY @11541
  ++ @11538 + a2256
  ++ @11542 + a2257
  ++ @11536 + a2257
  ++ @11537 + a2258
  ++ @11539 + a2258
END

IF ~~ a2256
  SAY @11543
  ++ @11544 + a2258
  ++ @11545 + a2258
  ++ @11546 + a2257
  ++ @11547 DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ + a2258
END

IF ~~ a2257
  SAY @1996
  = @1997
  = @11548
  ++ @11549 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3) ActionOverride("c-aran",GivePartyAllEquipment()) ActionOverride("c-aran",LeaveParty()) ActionOverride("c-aran",EscapeArea())~ EXIT
  ++ @11550 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3) ActionOverride("c-aran",GivePartyAllEquipment()) ActionOverride("c-aran",LeaveParty()) ActionOverride("c-aran",EscapeArea())~ EXIT
  ++ @11551 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2260
  ++ @11552 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranpostwraith","GLOBAL",3) SetGlobalTimer("c-aranwraithink","GLOBAL",FOUR_DAYS)~ + a2260 /* don't want a fight to kick this into gear. Needs follow up talk, probably. */
  ++ @11553 + a2260
END

IF ~~ a2258
  SAY @11554
  IF ~~ THEN GOTO a2259
END

IF ~~ a2259
  SAY @11555
  = @11556
  IF ~~ THEN EXIT
END

IF ~~ a2260
  SAY @3601
  IF ~~ THEN EXIT
END


/* for followup: BCS
Global("c-aranpostwraith","GLOBAL",3)
GlobalTimerExpired("c-aranwraithink","GLOBAL",FOUR_DAYS)
SetGlobal("c-aranpostwraith","GLOBAL",4)

IF ~Global("c-aranpostwraith","GLOBAL",4)~ c_are_we_on_or_are_we_done
*/

/* ToB Plot Talk : Big End Battle */
IF ~Global("c-aranisthisit","GLOBAL",1)~ THEN BEGIN a2922 // not set yet; this is a dummy reference for creation later
  SAY @11557
  ++ @11558 DO ~SetGlobal("c-aranisthisit","GLOBAL",2)~ EXIT /* PLACEHOLDER */
/*
  + ~Gender(Player1,FEMALE) Global("c-aransex","GLOBAL",0) Global("c-aranrom","GLOBAL",2)~ + ~[PC] PLACEHOLDER~ +
  + ~Gender(Player1,FEMALE) Global("c-aransex","GLOBAL",1) Global("c-aranrom","GLOBAL",2)~ + ~[PC] PLACEHOLDER~ +
  + ~Gender(Player1,FEMALE) Global("c-aransex","GLOBAL",2) Global("c-aranrom","GLOBAL",2)~ + ~[PC] PLACEHOLDER~ +
  + ~Gender(Player1,FEMALE) Global("c-aransex","GLOBAL",3) Global("c-aranrom","GLOBAL",2)~ + ~[PC] PLACEHOLDER~ +
  + ~Gender(Player1,FEMALE) Global("c-aransex","GLOBAL",4) Global("c-aranrom","GLOBAL",2)~ + ~[PC] PLACEHOLDER~ +
  + ~Gender(Player1,FEMALE) Global("c-aransex","GLOBAL",0) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] PLACEHOLDER~ +
  + ~Gender(Player1,FEMALE) Global("c-aransex","GLOBAL",1) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] PLACEHOLDER~ +
  + ~Gender(Player1,FEMALE) Global("c-aransex","GLOBAL",2) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] PLACEHOLDER~ +
  + ~Gender(Player1,FEMALE) Global("c-aransex","GLOBAL",3) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] PLACEHOLDER~ +
  + ~Gender(Player1,FEMALE) Global("c-aransex","GLOBAL",4) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] PLACEHOLDER~ +
*/
END


/* ToB Friend Talks */

/* ToB FriendTalk 1 : "Sisters" */
IF ~Global("c-aranfriendtob","GLOBAL",1)~ THEN BEGIN a2790
  SAY @11559
  ++ @11560 DO ~SetGlobal("c-ArSisterBranch","GLOBAL",1) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ +  a2791
  ++ @11561 DO ~SetGlobal("c-ArSisterBranch","GLOBAL",2) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ +  a2792
  ++ @11562 DO ~SetGlobal("c-ArSisterBranch","GLOBAL",3) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2793
  + ~RandomNum(3,3)~ + @11563 DO ~SetGlobal("c-ArSisterBranch","GLOBAL",6) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a3204
  + ~RandomNum(3,2)~ + @11563 DO ~SetGlobal("c-ArSisterBranch","GLOBAL",6) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a3205
  + ~RandomNum(3,1)~ + @11563 DO ~SetGlobal("c-ArSisterBranch","GLOBAL",6) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a3206
  ++ @11564 DO ~SetGlobal("c-ArSisterBranch","GLOBAL",4) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2794
  ++ @11565 DO ~SetGlobal("c-ArSisterBranch","GLOBAL",5) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2795
END

/*

Global("c-ArSisterBranch","GLOBAL",1) = neutral/shy
Global("c-ArSisterBranch","GLOBAL",2) = fun group
Global("c-ArSisterBranch","GLOBAL",3) = fun rigid
Global("c-ArSisterBranch","GLOBAL",4) = strong selfish
Global("c-ArSisterBranch","GLOBAL",5) = smart selfish
Global("c-ArSisterBranch","GLOBAL",6) = talk skipped - "hey, you wanna talk now?"

*/
/* ToB FriendTalk 1 : "Sisters"  : goto followup */

/* ToB FriendTalk 2 : "My kingdom for a horse." Complaints of walking. Everywhere. - Idea by Igneous : initial  */
IF ~Global("c-aranfriendtob","GLOBAL",3)~ THEN BEGIN a2764 /*  7 options */
  SAY @11566
  ++ @11567 DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2765
  ++ @11568 DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2766
  + ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ + @11569 DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2767
  + ~OR(2)!InParty("Aerie") StateCheck("Aerie",CD_STATE_NOTVALID)~ + @11569 DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2768
  + ~!Global("c-aranrom","GLOBAL",2)~ + @11570 DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2772
  + ~Global("c-aranrom","GLOBAL",2)~ + @11570 DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2769
  ++ @11571 DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2771
  ++ @11572 DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2770
  + ~RandomNum(3,1)~ + @11573 DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a3146 /* c-aranshutup13 @1323 */
  + ~RandomNum(3,2)~ + @11574 DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a3147 /* c-aranshutup14 @1324 */
  + ~RandomNum(3,3)~ + @11575 DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a3148 /* c-aranshutup15 @1325 */
END
/* ToB FriendTalk 2 : "My kingdom for a horse." Complaints of walking. Everywhere. - Idea by Igneous : goto followup  */

/* I had to give in and basically re-weave the sister branches into one common dialog. Writing six parallel tracks is an awesome idea, but I think I would need a pool of writers; since it is just me, I am leaving the original idea in code as an example on how to deal with the tracking, but to keep rolling on all six tracks means a much longer delay. */
/* ToB FriendTalk 3 : "Sisters Redux", 6 "pathway" talks, only 1 fires */
IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",1)~ THEN BEGIN a2850  /* neutral/shy */
  SAY @11576
  + ~Gender(Player1,MALE)~ + @11577 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2856
  + ~Gender(Player1,FEMALE)~ + @11577 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2857
  ++ @11578 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2858
  ++ @11579 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2859
  ++ @11580 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2874
END

IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",2)~ THEN BEGIN a2851 /* fun group */
  SAY @11576
  ++ @11581 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2859
  ++ @11582 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2860
  ++ @11583 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2861
  ++ @11580 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2874
END

IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",3)~ THEN BEGIN a2852 /* rigid */
  SAY @11576
  ++ @11584 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2862
  ++ @11585 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2863
  ++ @11586 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2863
  ++ @11580 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2874
END

IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",4)~ THEN BEGIN a2853 /* strong selfish */
  SAY @11576
  ++ @11587 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2865
  ++ @11588 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2866
  ++ @11589 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2867
  ++ @11580 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2874
END

IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",5)~ THEN BEGIN a2854 /* smart selfish */
  SAY @11576
  ++ @11590 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2868
  ++ @11588 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2866
  ++ @11591 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2867
  ++ @11580 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2874
END

IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",6)~ THEN BEGIN a2855 /* talk skipped - "hey, you wanna talk now?" */
  SAY @11576
  ++ @11592 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2871
  ++ @11593 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2872
  ++ @11594 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2873
  ++ @11580 DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a2874
END
/* ToB FriendTalk 3 : "Sisters Redux", 6 "pathway" talks, only 1 fires : goto followup */

/* ToB FriendTalk 4 : "Digression" */
IF ~Global("c-aranfriendtob","GLOBAL",7)~ THEN BEGIN a4551
  SAY @11595
  ++ @11596 DO ~SetGlobal("c-aranfriendtob","GLOBAL",8) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a4552
  ++ @11597 DO ~SetGlobal("c-aranfriendtob","GLOBAL",8) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a4553
  ++ @11598 DO ~SetGlobal("c-aranfriendtob","GLOBAL",8) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a4553
  ++ @11599 DO ~SetGlobal("c-aranfriendtob","GLOBAL",8) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a4566
  ++ @11600 DO ~SetGlobal("c-aranfriendtob","GLOBAL",8) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",%ARAN_FTT%)~ + a4553
END
/* ToB FriendTalk 4 : "Digression" : goto followup */


/* ToB Love Talks */

/* ToB Love Talk #1 : back in business */
IF ~Global("c-arantobrom","GLOBAL",2)~ THEN BEGIN a4813
  SAY @11601
  ++ @11602 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4820
  ++ @11603 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4822
  ++ @11604 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4823
  ++ @11605 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4824
  ++ @11606 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4819
  + ~Global("c-aranintimate","GLOBAL",0) Global("c-aranrom","GLOBAL",2)~ + @11607 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4814
  + ~Global("c-aranintimate","GLOBAL",1) Global("c-aranrom","GLOBAL",2)~ + @11607 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4815
  + ~Global("c-aranintimate","GLOBAL",2) Global("c-aranrom","GLOBAL",2)~ + @11607 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4816
  + ~Global("c-aranintimate","GLOBAL",3) Global("c-aranrom","GLOBAL",2)~ + @11608 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4817
  + ~Global("c-aranintimate","GLOBAL",4) Global("c-aranrom","GLOBAL",2)~ + @11608 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4818
  + ~RandomNum(5,5)~ + @11609 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a3183 /* c-aranshutup50 */
  + ~RandomNum(5,4)~ + @11610 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a3184 /* c-aranshutup51 */
  + ~RandomNum(5,3)~ + @11609 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a3185 /* c-aranshutup52 */
  + ~RandomNum(5,2)~ + @11609 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a3186 /* c-aranshutup53 */
  + ~RandomNum(5,1)~ + @11611 DO ~SetGlobal("c-arantobrom","GLOBAL",3) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a3187 /* c-aranshutup54 */
END

IF ~~ a4814
  SAY @11612
  IF ~~ THEN GOTO a4824
END

IF ~~ a4815
  SAY @11613
  IF ~~ THEN GOTO a4824
END

IF ~~ a4816
  SAY @11614
  IF ~~ THEN GOTO a4824
END

IF ~~ a4817
  SAY @11615
  IF ~~ THEN GOTO a4824
END

IF ~~ a4818
  SAY @11616
  IF ~~ THEN GOTO a4824
END

IF ~~ a4819
  SAY @11617
  IF ~~ THEN GOTO a4824
END

IF ~~ a4820
  SAY @11618
  ++ @11619 + a4825
  ++ @11620 + a4826
  ++ @11621 + a4821
  ++ @11622 + a4827
  ++ @11623 + a4822
END

IF ~~ a4821
  SAY @11624
  IF ~~ THEN GOTO a4829
END

IF ~~ a4822
  SAY @11625
  ++ @11626 + a4824
  ++ @11627 + a4828
  ++ @11628 + a4829
END

IF ~~ a4823
  SAY @11629
  ++ @11630 + a4830
  ++ @11631 + a4826
  ++ @11632 + a4840
  ++ @11633 + a4830
END

IF ~~ a4824
  SAY @11634
  + ~Global("c-aransex","GLOBAL",1)~ + @11635 + a4831
  + ~Global("c-aransex","GLOBAL",2)~ + @11636 + a4831
  + ~Global("c-aransex","GLOBAL",3)~ + @11637 + a4831
  + ~Global("c-aransex","GLOBAL",4)~ + @11638 + a4831
  ++ @11639 + a4832
  ++ @11640 + a4832
  ++ @11641 + a4840
  ++ @11642 + a4833
END

IF ~~ a4825
  SAY @11643
  ++ @11644 + a4824
  ++ @11645 + a4828
  ++ @11646 + a4829
  ++ @11647 + a4833
END

IF ~~ a4826
  SAY @11648
  = @11649
  = @11650
  ++ @11651 + a4832
  ++ @11652 + a4827
  ++ @11623 + a4838 
  ++ @11653 + a4834
END

IF ~~ a4827
  SAY @11654
  ++ @11655 + a4828
  ++ @11656 + a4836
  ++ @11657 + a4829
  ++ @11658 + a4830
  ++ @11659 + a4834
END

IF ~~ a4828
  SAY @11660
  ++ @11661 + a4829
  ++ @11662 + a4829
  ++ @11663 + a4829
  ++ @11664 + a4829
  ++ @11656 + a4836
END

IF ~~ a4829
  SAY @11665
  ++ @11666 + a4832
  ++ @11667 + a4830
  ++ @11668 + a4836
  ++ @11669 + a4840
  ++ @11670 + a4833
  ++ @11671 + a4834
END

IF ~~ a4830
  SAY @11672
  ++ @11673 + a4837
  ++ @11674 + a4837
  ++ @11675 + a4837
  ++ @11676 + a4837
  ++ @11677 + a4834
  ++ @11678 + a4834
END

IF ~~ a4831
  SAY @11679
  ++ @11680 + a4832
  ++ @11681 + a4832
  ++ @11682 + a4837 
  ++ @11683 + a4837  
  ++ @11684 + a4837
  ++ @11685 + a4836
  + ~GlobalLT("c-aransex","GLOBAL",3)~ + @11686 + a4832
  + ~GlobalGT("c-aransex","GLOBAL",2)~ + @11687 + a4836
END

IF ~~ a4832
  SAY @11688
  ++ @11689 + a4837 
  ++ @11690 + a4834
  ++ @11691 + a4834
  ++ @11692 + a4834
  ++ @11538 + a4834
  + ~GlobalLT("c-aransex","GLOBAL",3)~ + @11686 + a4832
  + ~GlobalGT("c-aransex","GLOBAL",2)~ + @11687 + a4836
END

IF ~~ a4833
  SAY @11693
  ++ @11694 + a4835
  ++ @11695 + a4835
  ++ @11696 + a4835
  ++ @11697 + a4834
  ++ @11698 + a4834
END

IF ~~ a4834
  SAY @11699
  = @11700
  = @11701
  IF ~~ THEN EXIT
END

IF ~~ a4835
  SAY @11702
  IF ~~ THEN EXIT
END

IF ~~ a4836
  SAY @11703
  IF ~~ THEN EXIT
END

IF ~~ a4837
  SAY @11704
  IF ~~ THEN EXIT
END

IF ~~ a4838 
  SAY @11705
  IF ~~ THEN EXIT
END

IF ~~ a4840
  SAY @11706
  IF ~~ THEN DO ~SetGlobal("c-aranrom","GLOBAL",3)~ EXIT
END
  

/* ToB Love Talk #2 : statement of intent for seriousness : Global("c-arantobrom","GLOBAL",4) --> Global("c-arantobrom","GLOBAL",5) */
IF ~Global("c-arantobrom","GLOBAL",4)~ THEN BEGIN a4716
  SAY @11707 
  ++ @11708 DO ~SetGlobal("c-arantobrom","GLOBAL",5) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718
  ++ @11709 DO ~SetGlobal("c-arantobrom","GLOBAL",5) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718
  ++ @11710 DO ~SetGlobal("c-arantobrom","GLOBAL",5) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4717
  ++ @11711 DO ~SetGlobal("c-arantobrom","GLOBAL",5) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718
  ++ @11712 DO ~SetGlobal("c-arantobrom","GLOBAL",5) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4718
END
/* GOTO ToB Love Talk #2 : statement of intent for seriousness : replies */

/* ToB Love Talk #3 : ask the big question or not */

// SetGlobal("c-aranengagement","GLOBAL",0) = not asked about marriage
// SetGlobal("c-aranengagement","GLOBAL",1) = delay interested in marriage
// SetGlobal("c-aranengagement","GLOBAL",2) = engaged
// SetGlobal("c-aranengagement","GLOBAL",3) = engaged and interested in kids
// SetGlobal("c-aranengagement","GLOBAL",4) = not interested in marriage

IF ~Global("c-arantobrom","GLOBAL",6)~ THEN BEGIN a4774
  SAY @11713
  ++ @11714 DO ~SetGlobal("c-arantobrom","GLOBAL",7) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4775
  ++ @11715 DO ~SetGlobal("c-arantobrom","GLOBAL",7) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4776
  ++ @11716 DO ~SetGlobal("c-arantobrom","GLOBAL",7) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4776
  ++ @11717 DO ~SetGlobal("c-arantobrom","GLOBAL",7) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4778
  ++ @11718 DO ~SetGlobal("c-arantobrom","GLOBAL",7) RealSetGlobalTimer("c-aranromtimer","GLOBAL",%ARAN_LTT%)~ + a4777
END

IF ~~ a4775
  SAY @11719
  ++ @11720 + a4779
  ++ @11721 + a4783
  ++ @11722 + a4782
  ++ @11723 + a4779
  ++ @11724 + a4779
END

IF ~~ a4776
  SAY @11725
  = @11726
  = @11727
  ++ @11717 + a4778
  ++ @11718 + a4777
  ++ @11728 + a4779
  ++ @11729 + a4778
END


IF ~~ a4777
  SAY @11730
  ++ @11731 DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ + a4784
  ++ @11732 + a4779
  ++ @11733 + a4779
  ++ @11734 + a4779
  ++ @11735 + a4784
END

IF ~~ a4778
  SAY @11736
  ++ @11737 + a4779
  ++ @11738 + a4777
  ++ @11739 + a4777
  ++ @11740 + a4779
  ++ @1889 + a4777
END

IF ~~ a4779
  SAY @11741
  ++ @11742 + a4780
  ++ @11743 DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ + a4784
  ++ @11744 + a4781
  ++ @11745 + a4781
  ++ @11746 + a4781
  ++ @11747 + a4785
END

IF ~~ a4780
  SAY @11748
  ++ @11749 + a4781
  ++ @11750 DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ + a4784
  ++ @11751 + a4781
  ++ @11752 DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ + a4784 
END

IF ~~ a4781
  SAY @11753
  ++ @11754 + a4783
  ++ @11755 + a4782
  ++ @11756 + a4783
  ++ @11757 + a4783
  ++ @11758 DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ + a4784 
END

IF ~~ a4782
  SAY @3601 
  IF ~~ THEN GOTO a4783
END

IF ~~ a4783
  SAY @11759
  ++ @11760 DO ~SetGlobal("c-aranengagement","GLOBAL",1)~ EXIT // delay interested in marriage
  ++ @8649 DO ~SetGlobal("c-aranengagement","GLOBAL",1)~ EXIT // delay interested in marriage
  ++ @2782 DO ~SetGlobal("c-aranengagement","GLOBAL",1)~ EXIT // delay interested in marriage
  ++ @11761 DO ~SetGlobal("c-aranengagement","GLOBAL",1)~ EXIT // delay interested in marriage
  ++ @11762 + a4786 // shut down talking about marriage
  ++ @11763 DO ~SetGlobal("c-aranengagement","GLOBAL",1)~ EXIT // delay interested in marriage
END

IF ~~ a4784
  SAY @11759
  = @11764
  IF ~~ THEN EXIT
END

IF ~~ a4785
  SAY @11765
  IF ~~ THEN EXIT
END

IF ~~ a4786
  SAY @11766
  IF ~~ THEN DO ~SetGlobal("c-aranengagement","GLOBAL",4)~ EXIT
END

/* ToB FriendTalk 1 : "Sisters"  : followup */
IF ~~ a2791
  SAY @11767
  ++ @11768 + a2796
  + ~Gender(Player1,MALE)~ + @11769 + a2796
  + ~Gender(Player1,FEMALE)~ + @11770 + a2796
  ++ @11771 + a2796
  ++ @11772 + a2796
  + ~Gender(Player1,MALE)~ + @11773 + a2796
  + ~Gender(Player1,FEMALE)~ + @11774 + a2796
  + ~RandomNum(3,3)~ + @11563 + a3204
  + ~RandomNum(3,2)~ + @11563 + a3205
  + ~RandomNum(3,1)~ + @11563 + a3206
END

/* a2792 is a chain */

IF ~~ a2793
  SAY @11775
  ++ @11776 + a2814
  ++ @11777 + a2815
  ++ @11778 + a2815
  ++ @11779 + a2816
  ++ @11780 + a2817
  + ~RandomNum(3,3)~ + @11563 + a3203
  + ~RandomNum(3,2)~ + @11563 + a3204
  + ~RandomNum(3,1)~ + @11563 + a3205
END

IF ~~ a2794
  SAY @11781
  ++ @11782 + a2833
  ++ @11783 + a2833
  ++ @11784 + a2834
  + ~RandomNum(3,3)~ + @11785 + a3203 /* c-aranshutup70 */
  + ~RandomNum(3,2)~ + @11785 + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,1)~ + @11785 + a3205 /* c-aranshutup72 */
  ++ @11786 + a2835
  ++ @11787 + a2836
END

IF ~~ a2795
  SAY @11788
  ++ @11789 + a2841
  ++ @11790 + a2842
  ++ @11791 + a2842
  ++ @11792 + a2843
  ++ @11793 + a2844
  + ~RandomNum(3,3)~ + @11794 + a3203 /* c-aranshutup70 */
  + ~RandomNum(3,2)~ + @11794 + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,1)~ + @11794 + a3205 /* c-aranshutup72 */
END

IF ~~ a2796
  SAY @11795
  ++ @11796 + a2797
  + ~Gender(Player1,MALE)~ + @11797 + a2797
  + ~Gender(Player1,FEMALE)~ + @11798 + a2797
  + ~RandomNum(3,3)~ + @11563 + a3204
  + ~RandomNum(3,2)~ + @11563 + a3205
  + ~RandomNum(3,1)~ + @11563 + a3206
  ++ @11799 + a2797
  + ~Gender(Player1,MALE)~ + @11800 + a2797
  + ~Gender(Player1,FEMALE)~ + @11801 + a2797
  ++ @11802 + a2797
END

IF ~~ a2797
  SAY @11803
  ++ @11804 + a2798
  + ~Gender(Player1,MALE)~ + @11805 + a2798
  + ~Gender(Player1,FEMALE)~ + @11806 + a2798
  ++ @11807 + a2798
  ++ @11808 + a2798
  ++ @11809 + a2798
END

IF ~~ a2798
  SAY @11810
  ++ @11811 + a2849
  ++ @11812 + a2849
  ++ @11813 + a2849
  ++ @11814 + a2849
  ++ @11815 + a2849
END

IF ~~ a2808
  SAY @11816
  ++ @11817 + a2810
  ++ @11818 + a2810
  ++ @11819 + a2811
END

IF ~~ a2809
  SAY @11820
  ++ @11821 + a2810
  ++ @11822 + a2810
  + ~!Global("c-aranrom","GLOBAL",2)~ + @11823 + a2810
  + ~Global("c-aransex","GLOBAL",0) Global("c-aranrom","GLOBAL",2)~ + @11823 + a2885
  + ~Global("c-aransex","GLOBAL",1) Global("c-aranrom","GLOBAL",2)~ + @11823 + a2886
  + ~Global("c-aransex","GLOBAL",2) Global("c-aranrom","GLOBAL",2)~ + @11823 + a2887
  + ~Global("c-aransex","GLOBAL",3) Global("c-aranrom","GLOBAL",2)~ + @11823 + a2888
  + ~Global("c-aransex","GLOBAL",4) Global("c-aranrom","GLOBAL",2)~ + @11823 + a2889
END

/* a2810 is a chain */

IF ~~ a2811
  SAY @11824
  IF ~~ THEN GOTO a2810
END

/* a2812 is a chain */

/* a2813 is a chain */

IF ~~ a2814
  SAY @11825
  ++ @11826 + a2815
  ++ @11777 + a2815
  ++ @11827 + a2815
  ++ @11828 + a2815
  ++ @11829 + a2818
  + ~RandomNum(3,3)~ + @11830 + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,2)~ + @11830 + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,1)~ + @11830 + a3206 /* c-aranshutup73 */
END

IF ~~ a2815
  SAY @11831
  ++ @11832 + a2819
  ++ @11833 + a2821
  ++ @11834 + a2820
  ++ @11835 + a2820
  ++ @11836 + a2821
END

IF ~~ a2816
  SAY @11837
  ++ @11838 + a2815
  ++ @11839 + a2815
  ++ @11840 + a2815
  ++ @11841 + a2815
  ++ @11842 + a2815
  + ~RandomNum(3,3)~ + @11830 + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,2)~ + @11830 + a3206 /* c-aranshutup73 */
  + ~RandomNum(3,1)~ + @11830 + a3207 /* c-aranshutup74 */
END

IF ~~ a2817
  SAY @11843
  ++ @11826 + a2815
  ++ @11844 + a2815
  ++ @11827 + a2815
  ++ @11828 + a2815
  ++ @11829 + a2818
  + ~RandomNum(3,3)~ + @11830 + a3203 /* c-aranshutup70 */
  + ~RandomNum(3,2)~ + @11830 + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,1)~ + @11830 + a3205 /* c-aranshutup72 */
END

IF ~~ a2818
  SAY @11845
  IF ~~ THEN GOTO a2815
END

IF ~~ a2819
  SAY @11846
  ++ @11847 + a2821
  ++ @11833 + a2821
  ++ @11848 + a2819
  ++ @11835 + a2822
  ++ @11849 + a2822
END

IF ~~ a2820
  SAY @11850
  ++ @11851 + a2829
  ++ @11852 + a2829
  ++ @11853 + a2829
  ++ @11854 + a2829
  ++ @11855 + a2829
END

IF ~~ a2821
  SAY @11856
  ++ @11857 + a2830
  ++ @11858 + a2829
  ++ @11859 + a2829
  ++ @11854 + a2829
  ++ @11860 + a2829
  + ~RandomNum(3,3)~ + @11830 + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,2)~ + @11830 + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,1)~ + @11830 + a3206 /* c-aranshutup73 */
END

IF ~~ a2822
  SAY @11861
  ++ @11862 + a2823
  ++ @11863 + a2824
  ++ @11864 + a2825
  ++ @11865 + a2826
  ++ @11866 + a2827
END

IF ~~ a2823
  SAY @11867
  IF ~~ THEN GOTO a2828
END

IF ~~ a2824
  SAY @11868
  IF ~~ THEN GOTO a2828
END

IF ~~ a2825
  SAY @11869
  IF ~~ THEN GOTO a2828
END

IF ~~ a2826
  SAY @11870
  IF ~~ THEN GOTO a2828
END

IF ~~ a2827
  SAY @11871
  IF ~~ THEN GOTO a2828
END

IF ~~ a2828
  SAY @11872
  IF ~~ THEN EXIT
END

IF ~~ a2829
  SAY @11873
  ++ @11874 + a2831
  ++ @11804 + a2831
  ++ @11875 + a2831
  ++ @11876 + a2828
  ++ @11877 + a2832
END

IF ~~ a2830
  SAY @11878
  ++ @11879 + a2849
  ++ @11880 + a2849
  ++ @11881 + a2829
  ++ @11882 + a2829
  ++ @11883 + a2831
END

IF ~~ a2831
  SAY @11810
  ++ @11811 + a2849
  ++ @11884 + a2849
  ++ @11885 + a2849
  ++ @11886 + a2849
  ++ @11887 + a2849
END

IF ~~ a2832
  SAY @11888
  IF ~~ THEN EXIT
END

IF ~~ a2833
  SAY @11889
  ++ @11890 + a2838
  ++ @11891 + a2838
  ++ @11892 + a2849
  ++ @11893 + a2849
  ++ @11894 + a2849
END

IF ~~ a2834
  SAY @11895
  ++ @11896 + a2833
  + ~RandomNum(3,3)~ + @11897 + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,2)~ + @11897 + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,1)~ + @11897 + a3206 /* c-aranshutup73 */
  ++ @11898 + a2833
  ++ @11899 + a2833
  ++ @11900 + a2837
END

IF ~~ a2835
  SAY @11901
  ++ @11899 + a2833
  + ~RandomNum(3,3)~ + @11902 + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,2)~ + @11902 + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,1)~ + @11902 + a3206 /* c-aranshutup73 */
  ++ @11903 + a2833
  ++ @11904 + a2849
  ++ @11905 + a2849
END

IF ~~ a2836
  SAY @11906
  ++ @11907 + a2833
  + ~RandomNum(3,3)~ + @11908 + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,2)~ + @11908 + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,1)~ + @11908 + a3206 /* c-aranshutup73 */
  ++ @11899 + a2833
  ++ @11909 + a2849
END

IF ~~ a2837
  SAY @11910
  ++ @11911 + a2849
  ++ @11912 + a2849
  ++ @11913 + a2849
  ++ @11914 + a2849
  ++ @11915 + a2849
  ++ @11916 + a2840
END

IF ~~ a2838
  SAY @11917
  ++ @11804 + a2839
  ++ @11918 + a2839
  ++ @11784 + a2834
  ++ @11919 + a2839
  ++ @11916 + a2840
END

IF ~~ a2839
  SAY @11810
  ++ @11920 + a2849
  ++ @11921 + a2849
  ++ @11922 + a2849
  ++ @11923 + a2849
  ++ @11924 + a2837
END

IF ~~ a2840
  SAY @11925
  ++ @11926 + a2849
  ++ @11927 + a2849
  ++ @11928 + a2849
  ++ @11929 + a2849
  ++ @11930 + a2849
END

IF ~~ a2841
  SAY @11931
  ++ @11932 + a2840
  ++ @11933 + a2849
  ++ @11934 + a2845
  ++ @11935 + a2845
  ++ @11936 + a2845
END

IF ~~ a2842
  SAY @11889
  ++ @11937 + a2845
  ++ @11938 + a2841
  ++ @11790 + a2842
  ++ @11791 + a2842
  ++ @11792 + a2843
  ++ @11793 + a2844
  + ~RandomNum(3,3)~ + @11939 + a3203 /* c-aranshutup70 */
  + ~RandomNum(3,2)~ + @11939 + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,1)~ + @11939 + a3205 /* c-aranshutup72 */
END

IF ~~ a2843
  SAY @11940
  ++ @11941 + a2845
  ++ @11942 + a2846
  ++ @11943 + a2847
  ++ @11944 + a2840
  ++ @11945 + a2848
END

IF ~~ a2844
  SAY @11946
  ++ @11947 + a2845
  ++ @11948 + a2846
  ++ @11943 + a2847
  ++ @11944 + a2840
  ++ @11949 + a2848
END

IF ~~ a2845
  SAY @11950
  ++ @11951 + a2846
  ++ @11952 + a2847
  ++ @11953 + a2840
  ++ @11954 + a2848
  ++ @11955 + a2846
END

IF ~~ a2846
  SAY @11810
  ++ @11811 + a2849
  ++ @11956 + a2849
  ++ @11922 + a2849
  ++ @11957 + a2849
  ++ @11924 + a2837
END

IF ~~ a2847
  SAY @11958
  ++ @11959 + a2846
  ++ @11960 + a2846
  ++ @11961 + a2849
  ++ @11962 + a2848
  ++ @11955 + a2846
END

IF ~~ a2848
  SAY @11963
  ++ @11964 + a2846
  ++ @11965 + a2849
  ++ @11966 + a2849
  ++ @11967 +  a2846
END

IF ~~ a2849
  SAY @11968
  IF ~~ THEN EXIT
END

/* ToB 2 : "My kingdom for a horse." Complaints of walking. Everywhere. - Idea by Igneous : followup */
IF ~~ a2765
  SAY @11969
  IF ~~ THEN GOTO a2770
END

IF ~~ a2766
  SAY @11970
  IF ~~ THEN GOTO a2770
END

IF ~~ a2767
  SAY @11971
  IF ~~ THEN GOTO a2770
END

IF ~~ a2768
  SAY @11972
  IF ~~ THEN GOTO a2770
END

IF ~~ a2769 /*  7 options */
  SAY @11973
  ++ @11974 + a2770
  ++ @11975 + a2786
  ++ @11976 + a2770
  ++ @11977 + a2787
  ++ @11978 + a2788
  ++ @11979 + a2787
  ++ @11980 + a2789
END

IF ~~ a2770 /*  6 options */
  SAY @11981
  + ~ReputationGT(Player1,16)~ + @11982 + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + @11982 + a2777
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + @11982 + a2778
  + ~ReputationLT(Player1,9)~ + @11982 + a2779
  ++ @11983 + a2784
  ++ @11984 + a2784
  + ~ReputationGT(Player1,16)~ + @11985 + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + @11985 + a2781
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + @11985 + a2782
  + ~ReputationLT(Player1,9)~ + @11985 + a2783
  ++ @11986 + a2784
  + ~RandomNum(3,1)~ + @11987 + a3146 /* c-aranshutup13 @1323 */
  + ~RandomNum(3,2)~ + @11988 + a3147 /* c-aranshutup14 @1324 */
  + ~RandomNum(3,3)~ + @11989 + a3148 /* c-aranshutup15 @1325 */
  + ~Race(Player1,ELF)~ + @11990 + a2799
  + ~Race(Player1,HUMAN)~ + @11990 + a2800
  + ~Race(Player1,DWARF)~ + @11990 + a2801
  + ~Race(Player1,HALFORC)~ + @11990 + a2802
  + ~Race(Player1,GNOME)~ + @11990 + a2803
  + ~Race(Player1,HALFLING)~ + @11990 + a2804
  + ~Race(Player1,HALF_ELF)~ + @11990 + a2805
END

IF ~~ a2771
  SAY @11991
  ++ @11992 + a2773
  ++ @11993 + a2773
  ++ @11994 + a2774
  + ~Race(Player1,ELF)~ + @11990 + a2799
  + ~Race(Player1,HUMAN)~ + @11990 + a2800
  + ~Race(Player1,DWARF)~ + @11990 + a2801
  + ~Race(Player1,HALFORC)~ + @11990 + a2802
  + ~Race(Player1,GNOME)~ + @11990 + a2803
  + ~Race(Player1,HALFLING)~ + @11990 + a2804
  + ~Race(Player1,HALF_ELF)~ + @11990 + a2805
  ++ @11995 + a2775
  ++ @11996 + a2775
END

IF ~~ a2772 /*  6 options */
  SAY @11973
  ++ @11997 + a2770
  ++ @11998 + a2770
  ++ @11976 + a2770
  ++ @11999 + a2770
  ++ @12000 + a2770
  + ~Race(Player1,ELF)~ + @11990 + a2799
  + ~Race(Player1,HUMAN)~ + @11990 + a2800
  + ~Race(Player1,DWARF)~ + @11990 + a2801
  + ~Race(Player1,HALFORC)~ + @11990 + a2802
  + ~Race(Player1,GNOME)~ + @11990 + a2803
  + ~Race(Player1,HALFLING)~ + @11990 + a2804
  + ~Race(Player1,HALF_ELF)~ + @11990 + a2805
  ++ @12001 + a2770
END

IF ~~ a2773
  SAY @12002
  ++ @12003 + a2775
  + ~ReputationGT(Player1,16)~ + @11982 + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + @11982 + a2777
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + @11982 + a2778
  + ~ReputationLT(Player1,9)~ + @11982 + a2779
  ++ @12004 + a2780
  + ~ReputationGT(Player1,16)~ + @11985 + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + @11985 + a2781
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + @11985 + a2782
  + ~ReputationLT(Player1,9)~ + @11985 + a2783
  ++ @12005 + a2784
  ++ @12006 + a2785
END

IF ~~ a2774
  SAY @12007
  IF ~~ THEN GOTO a2773
END

IF ~~ a2775
  SAY @12008
  + ~ReputationGT(Player1,16)~ + @11982 + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + @11982 + a2777
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + @11982 + a2778
  + ~ReputationLT(Player1,9)~ + @11982 + a2779
  ++ @12009 + a2784
  + ~ReputationGT(Player1,16)~ + @11985 + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + @11985 + a2781
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + @11985 + a2782
  + ~ReputationLT(Player1,9)~ + @11985 + a2783
  ++ @12010 + a2784
END

IF ~~ a2776 /* 5 to 6 options */
  SAY @12011
  + ~Class("c-aran",THIEF_ALL)~ + @12012 + a2784
  + ~Class("c-aran",MAGE_ALL)~ + @12013 + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + @12014 + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + @12015 + a2784
  ++ @12016 + a2784
  ++ @11984 + a2784
  ++ @12017 + a2784
  ++ @12018 + a2784
END

IF ~~ a2777 /* 6 to 7 options */
  SAY @12019
  + ~RandomNum(3,1)~ + @11987 + a3146 /* c-aranshutup13 @1323 */
  + ~RandomNum(3,2)~ + @11988 + a3147 /* c-aranshutup14 @1324 */
  + ~RandomNum(3,3)~ + @11989 + a3148 /* c-aranshutup15 @1325 */
  + ~Class("c-aran",THIEF_ALL)~ + @12020 + a2784
  + ~Class("c-aran",MAGE_ALL)~ + @12021 + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + @12022 + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + @12023 + a2784
  ++ @12016 + a2784
  ++ @11984 + a2784
  ++ @12024 + a2784
  ++ @12025 + a2784
END

IF ~~ a2778 /* 6 to 7 options */
  SAY @12026
  + ~RandomNum(3,1)~ + @11987 + a3146 /* c-aranshutup13 @1323 */
  + ~RandomNum(3,2)~ + @11988 + a3147 /* c-aranshutup14 @1324 */
  + ~RandomNum(3,3)~ + @11989 + a3148 /* c-aranshutup15 @1325 */
  + ~Class("c-aran",THIEF_ALL)~ + @12027 + a2784
  + ~Class("c-aran",MAGE_ALL)~ + @12028 + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + @12029 + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + @12030 + a2784
  ++ @12016 + a2784
  ++ @11984 + a2784
  ++ @12031 + a2784
  ++ @12032 + a2784
  ++ @12033 + a2784
END

IF ~~ a2779
  SAY @12034
  + ~RandomNum(3,1)~ + @11987 + a3146 /* c-aranshutup13 @1323 */
  + ~RandomNum(3,2)~ + @11988 + a3147 /* c-aranshutup14 @1324 */
  + ~RandomNum(3,3)~ + @11989 + a3148 /* c-aranshutup15 @1325 */
  + ~Class("c-aran",THIEF_ALL)~ + @12035 + a2784
  + ~Class("c-aran",MAGE_ALL)~ + @12036 + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + @12029 + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + @12037 + a2784
  ++ @12016 + a2784
  ++ @11984 + a2784
  ++ @12038 + a2784
  ++ @12039 + a2784
END

IF ~~ a2780
  SAY @12040
  + ~Class("c-aran",THIEF_ALL)~ + @12012 + a2784
  + ~Class("c-aran",MAGE_ALL)~ + @12013 + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + @12014 + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + @12015 + a2784
  ++ @12016 + a2784
  ++ @11984 + a2784
  ++ @12017 + a2784
  ++ @12018 + a2784
END

IF ~~ a2781
  SAY @12041
  + ~RandomNum(3,1)~ + @11987 + a3146 /* c-aranshutup13 @1323 */
  + ~RandomNum(3,2)~ + @11988 + a3147 /* c-aranshutup14 @1324 */
  + ~RandomNum(3,3)~ + @11989 + a3148 /* c-aranshutup15 @1325 */
  + ~Class("c-aran",THIEF_ALL)~ + @12020 + a2784
  + ~Class("c-aran",MAGE_ALL)~ + @12021 + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + @12022 + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + @12023 + a2784
  ++ @12016 + a2784
  ++ @11984 + a2784
  ++ @12042 + a2784
  ++ @12043 + a2784
END

IF ~~ a2782
  SAY @12044
  + ~RandomNum(3,1)~ + @11987 + a3146 /* c-aranshutup13 @1323 */
  + ~RandomNum(3,2)~ + @11988 + a3147 /* c-aranshutup14 @1324 */
  + ~RandomNum(3,3)~ + @11989 + a3148 /* c-aranshutup15 @1325 */
  + ~Class("c-aran",THIEF_ALL)~ + @12035 + a2784
  + ~Class("c-aran",MAGE_ALL)~ + @12036 + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + @12029 + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + @12037 + a2784
  ++ @12016 + a2784
  ++ @11984 + a2784
  ++ @12045 + a2784
  ++ @12046 + a2784
END

IF ~~ a2783
  SAY @12047
  + ~RandomNum(3,1)~ + @11987 + a3146 /* c-aranshutup13 @1323 */
  + ~RandomNum(3,2)~ + @11988 + a3147 /* c-aranshutup14 @1324 */
  + ~RandomNum(3,3)~ + @11989 + a3148 /* c-aranshutup15 @1325 */
  + ~Class("c-aran",THIEF_ALL)~ + @12035 + a2784
  + ~Class("c-aran",MAGE_ALL)~ + @12036 + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + @12029 + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + @12037 + a2784
  ++ @12016 + a2784
  ++ @11984 + a2784
  ++ @12045 + a2784
  ++ @12048 EXIT
END

IF ~~ a2784
  SAY @12049
  IF ~~ THEN EXIT
END

IF ~~ a2785
  SAY @12050
  = @12051
  IF ~~ THEN EXIT
END

IF ~~ a2786
  SAY @12052
  IF ~~ THEN GOTO a2770
END

 IF ~~ a2787
  SAY @12053
  IF ~~ THEN GOTO a2770
END

IF ~~ a2788
  SAY @12054
  IF ~~ THEN GOTO a2770
END

IF ~~ a2789
  SAY @12055
  IF ~~ THEN GOTO a2770
END

IF ~~ a2799 /* ELF */
  SAY @12056
  ++ @12057 + a2784
  ++ @12058 + a2784
  + ~GlobalGT("c-aransex","GLOBAL",1) GlobalLT("c-aransex","GLOBAL",4)~ + @12059 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12060 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12061 + a2784
  ++ @12062 + a2806
  ++ @12063 + a2806
END

IF ~~ a2800 /* HUMAN */
  SAY @12064
  ++ @12065 + a2784
  ++ @12066 + a2784
  + ~GlobalGT("c-aransex","GLOBAL",1) GlobalLT("c-aransex","GLOBAL",4)~ + @12067 + a2806
  + ~Global("c-aransex","GLOBAL",4)~ + @12060 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12061 + a2784
  ++ @12068 + a2806
  ++ @12016 + a2784
  ++ @12063 + a2806
END

IF ~~ a2801 /* DWARF */
  SAY @12069
  ++ @12065 + a2784
  ++ @12066 + a2784
  + ~GlobalGT("c-aransex","GLOBAL",1) GlobalLT("c-aransex","GLOBAL",4)~ + @12070 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12060 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12061 + a2784
  ++ @12071 + a2806
  ++ @12016 + a2784
  ++ @12072 + a2806
END

IF ~~ a2802 /* HALFORC */
  SAY @12073
  ++ @12065 + a2784
  ++ @12066 + a2784
  + ~GlobalGT("c-aransex","GLOBAL",1) GlobalLT("c-aransex","GLOBAL",4)~ + @12074 + a2806
  + ~Global("c-aransex","GLOBAL",4)~ + @12060 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12061 + a2784
  ++ @12075 + a2806
  ++ @12016 + a2784
  + ~GlobalGT("c-aransex","GLOBAL",1) GlobalLT("c-aransex","GLOBAL",4)~ + @12076 + a2806
  + ~Global("c-aransex","GLOBAL",4)~ + @12077 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12078 + a2875
END

IF ~~ a2803 /* GNOME */
  SAY @12069
  ++ @12065 + a2784
  ++ @12066 + a2784
  + ~GlobalGT("c-aransex","GLOBAL",1) GlobalLT("c-aransex","GLOBAL",4)~ + @12079 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12060 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12061 + a2784
  ++ @12080 + a2806
  ++ @12016 + a2784
  ++ @12081 + a2806
END

IF ~~ a2804 /* HALFLING */
  SAY @12069
  ++ @12065 + a2784
  ++ @12066 + a2784
  + ~GlobalGT("c-aransex","GLOBAL",1) GlobalLT("c-aransex","GLOBAL",4)~ + @12082 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12060 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12061 + a2784
  ++ @12083 + a2806
  ++ @12016 + a2784
  ++ @12084 + a2806
END

IF ~~ a2805 /* HALF_ELF */
  SAY @12069
  ++ @12065 + a2784
  ++ @12066 + a2784
  + ~GlobalGT("c-aransex","GLOBAL",1) GlobalLT("c-aransex","GLOBAL",4)~ + @12085 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12060 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12061 + a2784
  ++ @12086 + a2806
  ++ @12016 + a2784
  + ~GlobalGT("c-aransex","GLOBAL",1) GlobalLT("c-aransex","GLOBAL",4)~ + @12087 + a2806
  + ~Global("c-aransex","GLOBAL",4)~ + @12088 + a2784
  + ~Global("c-aransex","GLOBAL",4)~ + @12089 + a2875
END

IF ~~ a2806
  SAY  @12090
  ++ @12091 + a2784
  ++ @12092 + a2784
  ++ @12093 + a2784
  ++ @12016 + a2784
  ++ @12094 + a2784
  ++ @12095 + a2784
END

IF ~~ a2807
  SAY @12096
  IF ~~ THEN GOTO a2806
END

IF ~~ a2875
  SAY @12097
  IF ~~ THEN GOTO a2806
END

/* ToB FriendTalk 3 : "Sisters Redux", 6 "pathway" talks, only 1 fires : followup */ 
IF ~~ a2856
  SAY @12098
  ++ @12099 + a2860
  ++ @12100 + a2858
  ++ @12101 + a2870 
  ++ @11579 + a2859
  ++ @11580 + a2874
END

IF ~~ a2857
  SAY @12098
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12102 + a2869
  + ~Global("c-aranrom","GLOBAL",2)~ + @12103 + a2862
  ++ @12100 + a2858
  ++ @12101 + a2870 
  ++ @11579 + a2859
  ++ @11580 + a2874
END

IF ~~ a2858
  SAY @12104
  ++ @12105 + a2865
  ++ @12106 + a2869
  ++ @12107 + a2864
  ++ @12108 + a2872
  ++ @12109 + a2872
END

IF ~~ a2859
  SAY @12110
 IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO a4842
 IF ~!Alignment(Player1,MASK_GOOD)~ THEN GOTO a4843
END

IF ~~ a2860
 SAY @12111
 IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO a4842
 IF ~!Alignment(Player1,MASK_GOOD)~ THEN GOTO a4843
END

IF ~~ a2861
 SAY @12112
 IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO a4842
 IF ~!Alignment(Player1,MASK_GOOD)~ THEN GOTO a4843
END

IF ~~ a2862
 SAY @12113
 IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO a4842
 IF ~!Alignment(Player1,MASK_GOOD)~ THEN GOTO a4843
END

IF ~~ a2863
 SAY @12114
 IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO a4842
 IF ~!Alignment(Player1,MASK_GOOD)~ THEN GOTO a4843
END

IF ~~ a2864 /* good/rigid */
  SAY @12115
  ++ @12116 + a2873
  ++ @12117 + a2873
  ++ @12118 + a2873
  ++ @12119 + a2873
  ++ @12120 + a2873
  ++ @12121 + a2870
END

IF ~~ a2865 /* evil/manipulative */
  SAY @12115
  ++ @12122 + a2866
  ++ @12123 + a2866
  ++ @12124 + a2873
  ++ @12119 + a2873
  ++ @12120 + a2873
END

IF ~~ a2866
 SAY @12125
  ++ @12126 + a4841
  ++ @12127 + a4841  
  ++ @12128 + a4841  
  ++ @12129 + a4841
  ++ @12130 + a2870
END

IF ~~ a2867
 SAY @12131 
 IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO a4842
 IF ~!Alignment(Player1,MASK_GOOD)~ THEN GOTO a4843
END

IF ~~ a2868
  SAY @12132 
 IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO a4842
 IF ~!Alignment(Player1,MASK_GOOD)~ THEN GOTO a4843
END

IF ~~ a2869
 SAY @12133
 IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO a4842
 IF ~!Alignment(Player1,MASK_GOOD)~ THEN GOTO a4843
END

IF ~~ a2870
  SAY @12134
  ++ @12135 + a4841
  ++ @12136 + a4841
  ++ @12137 + a4841
  ++ @12138 + a4841
  ++ @12139 + a4841
END

IF ~~ a2871
  SAY @12140
  IF ~~ THEN GOTO a2873
END

IF ~~ a2872
  SAY @12141
  IF ~~ THEN GOTO a2873
END

IF ~~ a2873
  SAY @12142
  ++ @12143 + a4841
  ++ @12144 + a2870
  ++ @11562 + a4841
  + ~RandomNum(3,3)~ + @12145 + a3204 
  + ~RandomNum(3,2)~ + @12145 + a3205 
  + ~RandomNum(3,1)~ + @12145 + a3206 
  ++ @12146 + a4841
  ++ @12147 + a4841
END

IF ~~ a2874
  SAY @12148
 IF ~~ THEN GOTO a4843
END

IF ~~ a4841
  SAY @12149
  IF ~~ THEN EXIT
END

IF ~~ a4842 /* good/rigid */
  SAY @12150
  ++ @12116 + a4841
  ++ @12151 + a4841
  ++ @12118 + a4841
  ++ @12152 + a2870
  ++ @12120 + a4841
  ++ @12121 + a2870
END

IF ~~ a4843 /* evil/manipulative */
  SAY @12150
  ++ @12122 + a2866
  ++ @12153 + a2866
  ++ @12124 + a2873
  ++ @12154 + a2873
  ++ @12120 + a4841
END

/* ToB FriendTalk 4 : "Digression" :  followup */
IF ~~ a4552 SAY @12155 IF ~~ THEN GOTO a4553 END
IF ~~ a4553 SAY @12156 IF ~~ THEN GOTO a4554 END

IF ~~ a4554
  SAY @12157
  ++ @12158 + a4555
  ++ @12159 + a4556
  ++ @3695 + a4566
  ++ @12160 + a4566
  ++ @12161 + a4566
END

IF ~~ a4555 SAY @12162 IF ~~ THEN GOTO a4557 END
IF ~~ a4556 SAY @12163 IF ~~ THEN GOTO a4557 END

IF ~~ a4557
  SAY @12164
  ++ @12165 + a4558
  ++ @12166 + a4558
  ++ @12167 + a4559
  ++ @12168 + a4565
  ++ @12169 + a4566
END

IF ~~ a4558 SAY @12170 IF ~~ THEN GOTO a4560 END
IF ~~ a4559 SAY @12171 IF ~~ THEN GOTO a4560 END

IF ~~ a4560
  SAY @12172
  ++ @12173 + a4563
  ++ @12174 + a4562
  ++ @12175 + a4565
  ++ @12176 + a4561
  ++ @12177 + a4565
END

IF ~~ a4561
  SAY @12178
  ++ @12179 + a4563
  ++ @12180 + a4566
  ++ @12181 + a4565
END

IF ~~ a4562 SAY @12182 IF ~~ THEN GOTO a4564 END

IF ~~ a4563
  SAY @12183
  ++ @12184 + a4564
  ++ @12185 + a4565
  ++ @12181 + a4565  
END

IF ~~ a4564
  SAY @12186
  ++ @12187 + a4565
  ++ @12188 + a4565
  ++ @12189 + a4566
END

IF ~~ a4565 SAY @12190 IF ~~ THEN EXIT END
IF ~~ a4566 SAY @12191 IF ~~ THEN EXIT END

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

END /* append C-ARN25J */

/* BEGIN C-ARN25P is covered in initial dialog compilation. */

/* Sending the NPC home from the Pocket Plane, and bringing them back */
/* courtesy of berelinde, using Homeward Bound code */

EXTEND_BOTTOM FATESP 6
+ ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ + @12282 DO ~SetGlobal("c-aransenthome","GLOBAL",1)
  ActionOverride("c-aran",SetGlobal("KickedOut","LOCALS",1))
  ActionOverride("c-aran",SetLeavePartyDialogFile())
  ActionOverride("c-aran",ChangeAIScript("",DEFAULT))
  ActionOverride("c-aran",LeaveParty())
  ActionOverride("c-aran",GivePartyAllEquipment())
  ActionOverride("c-aran",MakeGlobal())
  Wait(1)
  CreateVisualEffectObject("SPDIMNDR","c-aran")
  Wait(4)
  MoveGlobal("AR0607","c-aran",[272.294])~ EXIT /* circus tent restored */
+ ~Global("c-aransenthome","GLOBAL",1)~ + @12283 DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
  Wait(2)
  MoveGlobal("AR4500","c-aran",[1999.1228])
  Wait(1)~ + 8
END

APPEND C-ARN25P

/* just kicked out via "reform party" button = no global set. */
IF ~Global("KickedOut","LOCALS",0)~ THEN BEGIN a2753
  SAY @12284
  + ~RandomNum(3,1) !AreaCheck("AR4500")~ + @12285 DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1632
  + ~RandomNum(3,2) !AreaCheck("AR4500")~ + @12285 DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1633
  + ~RandomNum(3,3) !AreaCheck("AR4500")~ + @12285 DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1640 /* c-aranrejoin2tob */
  + ~!AreaCheck("AR5003") !AreaCheck("AR0301") !AreaCheck("AR0302") !AreaCheck("AR0303") !AreaCheck("AR0304") !AreaCheck("AR0305") !AreaCheck("AR0306") !AreaCheck("AR0307") !AreaCheck("AR0509") !AreaCheck("AR0510") !AreaCheck("AR0511") !AreaCheck("AR1102") !AreaCheck("AR1107") !AreaCheck("AR0801") !AreaCheck("AR0803") !AreaCheck("AR1300") !AreaCheck("AR1301") !AreaCheck("AR1302") !AreaCheck("AR1303") !AreaCheck("AR0601") !AreaCheck("AR0602") !AreaCheck("AR0603") !AreaCheck("AR0604") !AreaCheck("AR0605") !AreaCheck("AR0606") !AreaCheck("AR3000") !AreaCheck("AR3001") !AreaCheck("AR3003") !AreaCheck("AR3004") !AreaCheck("AR3005") !AreaCheck("AR3006") !AreaCheck("AR3007") !AreaCheck("AR3008") !AreaCheck("AR3009") !AreaCheck("AR3010") !AreaCheck("AR3011") !AreaCheck("AR3012") !AreaCheck("AR3013") !AreaCheck("AR3014") !AreaCheck("AR3015") !AreaCheck("AR3016") !AreaCheck("AR3017") !AreaCheck("AR3018") !AreaCheck("AR3019") !AreaCheck("AR3020") !AreaCheck("AR3021") !AreaCheck("AR3022") !AreaCheck("AR3023") !AreaCheck("AR3024") !AreaCheck("AR3025") !AreaCheck("AR3026") !AreaCheck("AR3027")~ + @12286 DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1639 /* c-aranwaitsaradush  tob  <<POSSIBLE_TO_LEAVE>> */
  + ~!AreaCheck("AR5003") OR(51) AreaCheck("AR0301") AreaCheck("AR0302") AreaCheck("AR0303") AreaCheck("AR0304") AreaCheck("AR0305") AreaCheck("AR0306") AreaCheck("AR0307") AreaCheck("AR0509") AreaCheck("AR0510") AreaCheck("AR0511") AreaCheck("AR1102") AreaCheck("AR1107") AreaCheck("AR0801") AreaCheck("AR0803") AreaCheck("AR1300") AreaCheck("AR1301") AreaCheck("AR1302") AreaCheck("AR1303") AreaCheck("AR0601") AreaCheck("AR0602") AreaCheck("AR0603") AreaCheck("AR0604") AreaCheck("AR0605") AreaCheck("AR0606") AreaCheck("AR3000") AreaCheck("AR3001") AreaCheck("AR3003") AreaCheck("AR3004") AreaCheck("AR3005") AreaCheck("AR3006") AreaCheck("AR3007") AreaCheck("AR3008") AreaCheck("AR3009") AreaCheck("AR3010") AreaCheck("AR3011") AreaCheck("AR3012") AreaCheck("AR3013") AreaCheck("AR3014") AreaCheck("AR3015") AreaCheck("AR3016") AreaCheck("AR3017") AreaCheck("AR3018") AreaCheck("AR3019") AreaCheck("AR3020") AreaCheck("AR3021") AreaCheck("AR3022") AreaCheck("AR3023") AreaCheck("AR3024") AreaCheck("AR3025") AreaCheck("AR3026") AreaCheck("AR3027")~ + @12286 DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1630 /* c-araninnimpossibletob  <<IMPOSSIBLE_TO_LEAVE>> */
  + ~!AreaCheck("AR5501") !AreaCheck("AR0301") !AreaCheck("AR0302") !AreaCheck("AR0303") !AreaCheck("AR0304") !AreaCheck("AR0305") !AreaCheck("AR0306") !AreaCheck("AR0307") !AreaCheck("AR0509") !AreaCheck("AR0510") !AreaCheck("AR0511") !AreaCheck("AR1102") !AreaCheck("AR1107") !AreaCheck("AR0801") !AreaCheck("AR0803") !AreaCheck("AR1300") !AreaCheck("AR1301") !AreaCheck("AR1302") !AreaCheck("AR1303") !AreaCheck("AR0601") !AreaCheck("AR0602") !AreaCheck("AR0603") !AreaCheck("AR0604") !AreaCheck("AR0605") !AreaCheck("AR0606") !AreaCheck("AR3000") !AreaCheck("AR3001") !AreaCheck("AR3003") !AreaCheck("AR3004") !AreaCheck("AR3005") !AreaCheck("AR3006") !AreaCheck("AR3007") !AreaCheck("AR3008") !AreaCheck("AR3009") !AreaCheck("AR3010") !AreaCheck("AR3011") !AreaCheck("AR3012") !AreaCheck("AR3013") !AreaCheck("AR3014") !AreaCheck("AR3015") !AreaCheck("AR3016") !AreaCheck("AR3017") !AreaCheck("AR3018") !AreaCheck("AR3019") !AreaCheck("AR3020") !AreaCheck("AR3021") !AreaCheck("AR3022") !AreaCheck("AR3023") !AreaCheck("AR3024") !AreaCheck("AR3025") !AreaCheck("AR3026") !AreaCheck("AR3027")~ + @12287 DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1638 /* c-aranwaitsamkethrantob  <<POSSIBLE_TO_LEAVE>> */
  + ~!AreaCheck("AR5501") OR(51) AreaCheck("AR0301") AreaCheck("AR0302") AreaCheck("AR0303") AreaCheck("AR0304") AreaCheck("AR0305") AreaCheck("AR0306") AreaCheck("AR0307") AreaCheck("AR0509") AreaCheck("AR0510") AreaCheck("AR0511") AreaCheck("AR1102") AreaCheck("AR1107") AreaCheck("AR0801") AreaCheck("AR0803") AreaCheck("AR1300") AreaCheck("AR1301") AreaCheck("AR1302") AreaCheck("AR1303") AreaCheck("AR0601") AreaCheck("AR0602") AreaCheck("AR0603") AreaCheck("AR0604") AreaCheck("AR0605") AreaCheck("AR0606") AreaCheck("AR3000") AreaCheck("AR3001") AreaCheck("AR3003") AreaCheck("AR3004") AreaCheck("AR3005") AreaCheck("AR3006") AreaCheck("AR3007") AreaCheck("AR3008") AreaCheck("AR3009") AreaCheck("AR3010") AreaCheck("AR3011") AreaCheck("AR3012") AreaCheck("AR3013") AreaCheck("AR3014") AreaCheck("AR3015") AreaCheck("AR3016") AreaCheck("AR3017") AreaCheck("AR3018") AreaCheck("AR3019") AreaCheck("AR3020") AreaCheck("AR3021") AreaCheck("AR3022") AreaCheck("AR3023") AreaCheck("AR3024") AreaCheck("AR3025") AreaCheck("AR3026") AreaCheck("AR3027")~ + @12287 DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1630 /* c-araninnimpossibletob <<IMPOSSIBLE_TO_LEAVE>> */
  ++ @12288 DO ~SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~AreaCheck("AR4500")~ + @12289 DO ~SetGlobal("KickedOut","LOCALS",1) MoveToPointNoInterrupt([1799.1358]) Face(14)~ EXIT
  ++ @10533 + a3223
  + ~OR(2)AreaCheck("AR5003") AreaCheck("AR5501")~ + @12290 DO ~SetGlobal("KickedOut","LOCALS",1)~ EXIT
  + ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + @12291 DO ~SetGlobal("KickedOut","LOCALS",1)~ EXIT
  + ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + @12292 DO ~SetGlobal("KickedOut","LOCALS",1)
  CreateVisualEffectObject("SPDIMNDR",Myself)
  Wait(2)
  MoveBetweenAreas("AR4500",[1799.1358],14)~ EXIT
END

/* AR4500 = pocketplane || AR5003 = Saradush Inn || AR5501 = Amkethran Inn */

/* Adding a special dialog to the 25P for NPCs sent home from the Pocket Plane */
IF ~Global("c-aransenthome","GLOBAL",1) Global("KickedOut","LOCALS",1)~ THEN BEGIN a1641
  SAY @12293
  ++ @12294 DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",FIGHTER_ALL)~ + @12295 DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",MAGE_ALL)~ + @12296 DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",THIEF_ALL)~ + @12297 DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",BARD_ALL)~ + @12298 DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",RANGER_ALL)~ + @12299 DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",SORCERER)~ + @12300 DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~OR(2) Class("c-aran",CLERIC_ALL) Class("c-aran",PALADIN_ALL)~ + @12301 DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  ++ @10533 DO ~SetGlobal("c-aransenthome","GLOBAL",0)~ + a3223
  ++ @12302 DO ~SetGlobal("c-aransenthome","GLOBAL",0)~ + a1635
  + ~RandomNum(3,1)~ + @12303 DO ~SetGlobal("c-aransenthome","GLOBAL",0)~ + a1635
  + ~RandomNum(3,2)~ + @12303 DO ~SetGlobal("c-aransenthome","GLOBAL",0)~ + a1636
  + ~RandomNum(3,3)~ + @12303 DO ~SetGlobal("c-aransenthome","GLOBAL",0)~ + a1637
END

/* Pocketplane Rejoin */
IF ~Global("KickedOut","LOCALS",1) AreaCheck("AR4500")~ THEN BEGIN a1629
  SAY @12304
  ++ @12305 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",FIGHTER_ALL)~ + @12295 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",MAGE_ALL)~ + @12296 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",THIEF_ALL)~ + @12297 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",BARD_ALL)~ + @12306 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",RANGER_ALL)~ + @12299 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",SORCERER)~ + @12300 DO ~JoinParty()~ EXIT
  + ~OR(2) Class("c-aran",CLERIC_ALL) Class("c-aran",PALADIN_ALL)~ + @12301 DO ~JoinParty()~ EXIT
  ++ @10533 + a3223
  ++ @12307 + a1640
  ++ @12308 + a1642 /* smartalekrejointob */
END

/* Saradush or Amkethran Rejoin */
IF ~Global("KickedOut","LOCALS",1) OR(2) AreaCheck("AR5003") AreaCheck("AR5501")~ THEN BEGIN a1631
  SAY @12309
  ++ @12310 DO ~SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  ++ @12311 + a1632
  ++ @10533 + a3223
  ++ @12290 DO ~SetGlobal("KickedOut","LOCALS",1)~ EXIT
  + ~!AreaCheck("AR5003")~ + @12286 + a1639 /*  c-aranwaitsaradushtob  <<POSSIBLE_TO_LEAVE>> */  
  + ~!AreaCheck("AR5501")~ + @12287 + a1638 /* c-aranwaitsamkethrantob  <<POSSIBLE_TO_LEAVE>> */
  ++ @12292 DO ~SetGlobal("KickedOut","LOCALS",1)
  CreateVisualEffectObject("SPDIMNDR",Myself)
  Wait(2)
  MoveBetweenAreas("AR4500",[1799.1358],14)~ EXIT
END

/* Any Other Area Rejoin */
IF ~Global("KickedOut","LOCALS",1) !AreaCheck("AR4500") !AreaCheck("AR5003") !AreaCheck("AR5501")~ THEN BEGIN a1643
  SAY @12312
  ++ @12310 DO ~SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  ++ @10533 + a3223
  + ~RandomNum(3,1)~ + @12285 + a1632
  + ~RandomNum(3,2)~ + @12285 + a1633
  + ~RandomNum(3,3)~ + @12285 + a1640 /* c-aranrejoin2tob */
  + ~!AreaCheck("AR0301") !AreaCheck("AR0302") !AreaCheck("AR0303") !AreaCheck("AR0304") !AreaCheck("AR0305") !AreaCheck("AR0306") !AreaCheck("AR0307") !AreaCheck("AR0509") !AreaCheck("AR0510") !AreaCheck("AR0511") !AreaCheck("AR1102") !AreaCheck("AR1107") !AreaCheck("AR0801") !AreaCheck("AR0803") !AreaCheck("AR1300") !AreaCheck("AR1301") !AreaCheck("AR1302") !AreaCheck("AR1303") !AreaCheck("AR0601") !AreaCheck("AR0602") !AreaCheck("AR0603") !AreaCheck("AR0604") !AreaCheck("AR0605") !AreaCheck("AR0606") !AreaCheck("AR3000") !AreaCheck("AR3001") !AreaCheck("AR3003") !AreaCheck("AR3004") !AreaCheck("AR3005") !AreaCheck("AR3006") !AreaCheck("AR3007") !AreaCheck("AR3008") !AreaCheck("AR3009") !AreaCheck("AR3010") !AreaCheck("AR3011") !AreaCheck("AR3012") !AreaCheck("AR3013") !AreaCheck("AR3014") !AreaCheck("AR3015") !AreaCheck("AR3016") !AreaCheck("AR3017") !AreaCheck("AR3018") !AreaCheck("AR3019") !AreaCheck("AR3020") !AreaCheck("AR3021") !AreaCheck("AR3022") !AreaCheck("AR3023") !AreaCheck("AR3024") !AreaCheck("AR3025") !AreaCheck("AR3026") !AreaCheck("AR3027")~ + @12286 + a1639 /* c-aranwaitsaradushtob <<POSSIBLE_TO_LEAVE>> */
  + ~OR(51) AreaCheck("AR0301") AreaCheck("AR0302") AreaCheck("AR0303") AreaCheck("AR0304") AreaCheck("AR0305") AreaCheck("AR0306") AreaCheck("AR0307") AreaCheck("AR0509") AreaCheck("AR0510") AreaCheck("AR0511") AreaCheck("AR1102") AreaCheck("AR1107") AreaCheck("AR0801") AreaCheck("AR0803") AreaCheck("AR1300") AreaCheck("AR1301") AreaCheck("AR1302") AreaCheck("AR1303") AreaCheck("AR0601") AreaCheck("AR0602") AreaCheck("AR0603") AreaCheck("AR0604") AreaCheck("AR0605") AreaCheck("AR0606") AreaCheck("AR3000") AreaCheck("AR3001") AreaCheck("AR3003") AreaCheck("AR3004") AreaCheck("AR3005") AreaCheck("AR3006") AreaCheck("AR3007") AreaCheck("AR3008") AreaCheck("AR3009") AreaCheck("AR3010") AreaCheck("AR3011") AreaCheck("AR3012") AreaCheck("AR3013") AreaCheck("AR3014") AreaCheck("AR3015") AreaCheck("AR3016") AreaCheck("AR3017") AreaCheck("AR3018") AreaCheck("AR3019") AreaCheck("AR3020") AreaCheck("AR3021") AreaCheck("AR3022") AreaCheck("AR3023") AreaCheck("AR3024") AreaCheck("AR3025") AreaCheck("AR3026") AreaCheck("AR3027")~ + @12286 + a1630 /* c-araninnimpossibletob  <<IMPOSSIBLE_TO_LEAVE>> */
  + ~!AreaCheck("AR5501") !AreaCheck("AR0301") !AreaCheck("AR0302") !AreaCheck("AR0303") !AreaCheck("AR0304") !AreaCheck("AR0305") !AreaCheck("AR0306") !AreaCheck("AR0307") !AreaCheck("AR0509") !AreaCheck("AR0510") !AreaCheck("AR0511") !AreaCheck("AR1102") !AreaCheck("AR1107") !AreaCheck("AR0801") !AreaCheck("AR0803") !AreaCheck("AR1300") !AreaCheck("AR1301") !AreaCheck("AR1302") !AreaCheck("AR1303") !AreaCheck("AR0601") !AreaCheck("AR0602") !AreaCheck("AR0603") !AreaCheck("AR0604") !AreaCheck("AR0605") !AreaCheck("AR0606") !AreaCheck("AR3000") !AreaCheck("AR3001") !AreaCheck("AR3003") !AreaCheck("AR3004") !AreaCheck("AR3005") !AreaCheck("AR3006") !AreaCheck("AR3007") !AreaCheck("AR3008") !AreaCheck("AR3009") !AreaCheck("AR3010") !AreaCheck("AR3011") !AreaCheck("AR3012") !AreaCheck("AR3013") !AreaCheck("AR3014") !AreaCheck("AR3015") !AreaCheck("AR3016") !AreaCheck("AR3017") !AreaCheck("AR3018") !AreaCheck("AR3019") !AreaCheck("AR3020") !AreaCheck("AR3021") !AreaCheck("AR3022") !AreaCheck("AR3023") !AreaCheck("AR3024") !AreaCheck("AR3025") !AreaCheck("AR3026") !AreaCheck("AR3027")~ + @12287 + a1638 /*  c-aranwaitsamkethrantob  <<POSSIBLE_TO_LEAVE>> */
  + ~!AreaCheck("AR5501") OR(51) AreaCheck("AR0301") AreaCheck("AR0302") AreaCheck("AR0303") AreaCheck("AR0304") AreaCheck("AR0305") AreaCheck("AR0306") AreaCheck("AR0307") AreaCheck("AR0509") AreaCheck("AR0510") AreaCheck("AR0511") AreaCheck("AR1102") AreaCheck("AR1107") AreaCheck("AR0801") AreaCheck("AR0803") AreaCheck("AR1300") AreaCheck("AR1301") AreaCheck("AR1302") AreaCheck("AR1303") AreaCheck("AR0601") AreaCheck("AR0602") AreaCheck("AR0603") AreaCheck("AR0604") AreaCheck("AR0605") AreaCheck("AR0606") AreaCheck("AR3000") AreaCheck("AR3001") AreaCheck("AR3003") AreaCheck("AR3004") AreaCheck("AR3005") AreaCheck("AR3006") AreaCheck("AR3007") AreaCheck("AR3008") AreaCheck("AR3009") AreaCheck("AR3010") AreaCheck("AR3011") AreaCheck("AR3012") AreaCheck("AR3013") AreaCheck("AR3014") AreaCheck("AR3015") AreaCheck("AR3016") AreaCheck("AR3017") AreaCheck("AR3018") AreaCheck("AR3019") AreaCheck("AR3020") AreaCheck("AR3021") AreaCheck("AR3022") AreaCheck("AR3023") AreaCheck("AR3024") AreaCheck("AR3025") AreaCheck("AR3026") AreaCheck("AR3027")~ + @12287 + a1630 /* c-araninnimpossibletob <<IMPOSSIBLE_TO_LEAVE>> */
  ++ @12292 DO ~SetGlobal("KickedOut","LOCALS",1)
  CreateVisualEffectObject("SPDIMNDR",Myself)
  Wait(2)
  MoveBetweenAreas("AR4500",[1799.1358],14)~ EXIT
END

/* Impossible to go to an inn from here */
IF ~~ a1630
  SAY @12313
  IF ~~ THEN EXIT
END
IF ~~ a1642
  SAY @12314
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ a1632 SAY @12315 IF ~~ THEN EXIT END
IF ~~ a1633 SAY @12316 IF ~~ THEN EXIT END
IF ~~ a1635 SAY @12317 IF ~~ THEN EXIT END
IF ~~ a1636 SAY @12318 IF ~~ THEN EXIT END
IF ~~ a1637 SAY @12319 IF ~~ THEN EXIT END
IF ~~ a1640 SAY @12320 IF ~~ THEN EXIT END

IF ~~ a1639
  SAY @12321
  IF ~~ THEN DO
  ~ActionOverride("c-aran",SetGlobal("KickedOut","LOCALS",1))
  ActionOverride("c-aran",SetLeavePartyDialogFile())
  ActionOverride("c-aran",ChangeAIScript("",DEFAULT))
  ActionOverride("c-aran",LeaveParty())
  ActionOverride("c-aran",EscapeAreaMove("AR5003",1074,707,5))~ EXIT
END

IF ~~ a1638
  SAY @12322
  IF ~~ THEN DO ~ActionOverride("c-aran",SetGlobal("KickedOut","LOCALS",1))
  ActionOverride("c-aran",SetLeavePartyDialogFile())
  ActionOverride("c-aran",ChangeAIScript("",DEFAULT))
  ActionOverride("c-aran",LeaveParty())
  EscapeAreaMove("AR5501",410,455,8)~ EXIT
END

END /*  of append to c-arn25p */

/* A complete rebuild of Anomen's ToB pre-joining dialog, expanded, contracted, and warped out of any semblance or resemblance. */

APPEND C-ARN25A

IF ~Gender(Player1,MALE) Global("c-aransummoned","GLOBAL",1)~ THEN a2607
  SAY @12323
  + ~Alignment(Player1,MASK_GOOD)~ + @12324 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2608
  + ~!Alignment(Player1,MASK_GOOD)~ + @12324 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2609
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
/* Feywarden of Corellon */
  IF ~Global("c-feywarden","GLOBAL",1)~ THEN GOTO a2615
/* STRIFELEADER OF CYRIC */
  IF ~Global("c-strifeleader","GLOBAL",1)~ THEN GOTO a2616
/* PAINBEARER OF ILMATER */
  IF ~Global("c-painbearer","GLOBAL",1)~ THEN GOTO a2617
/* LOREKEEPER OF OGHMA - the Binder of What is Known, the Patron of Bards */
  IF ~Global("c-lorekeeper","GLOBAL",1)~ THEN GOTO a2618
/* FIREWALKER OF KOSSUTH - evil - elemental fire - Thay : Global("c-firewalker","GLOBAL",1) */
  IF ~Global("c-firewalker","GLOBAL",1)~ THEN GOTO a2619
/* SILVERSTAR OF SELUNE - Moonmaiden : */
  IF ~Global("c-silverstar","GLOBAL",1)~ THEN GOTO a2620
/* Holy Strategist of the Red Knight - Red Fellowship (only law)  */
  IF ~Global("c-strategist","GLOBAL",1)~ THEN GOTO a2621
/* NIGHTCLOAK OF SHAR - Dark Lady */
  IF ~Global("c-nightcloak","GLOBAL",1)~ THEN GOTO a2622
/* HEARTWARDER OF SUNE - Sune Firehair, Lady Firehair : Global("c-heartwarder","GLOBAL",1) */
  IF ~Global("c-heartwarder","GLOBAL",1)~ THEN GOTO a2623
/* BATTLEGUARD OF TEMPUS - th' Foehammer (chaos) */
  IF ~Global("c-battleguard","GLOBAL",1)~ THEN GOTO a2624
/* Authlim of Iyachtu Xvim - the Godson */
  IF ~Global("c-authlim","GLOBAL",1)~ THEN GOTO a2625
/* MORNINGLORD OF LATHANDER */
  IF ~Kit(Player1,GODLATHANDER) OR(6) Class(Player1,CLERIC) Class(Player1,FIGHTER_CLERIC) Class(Player1,CLERIC_MAGE) Class(Player1,CLERIC_THIEF) Class(Player1,FIGHTER_MAGE_CLERIC) Class(Player1,CLERIC_RANGER)~ THEN GOTO a2626
/* WATCHER OF HELM */
  IF ~Kit(Player1,GODHELM) OR(6) Class(Player1,CLERIC) Class(Player1,FIGHTER_CLERIC) Class(Player1,CLERIC_MAGE) Class(Player1,CLERIC_THIEF) Class(Player1,FIGHTER_MAGE_CLERIC) Class(Player1,CLERIC_RANGER)~ THEN GOTO a2627
/* STORMLORD OF TALOS */
  IF ~Kit(Player1,GODTALOS) OR(6) Class(Player1,CLERIC) Class(Player1,FIGHTER_CLERIC) Class(Player1,CLERIC_MAGE) Class(Player1,CLERIC_THIEF) Class(Player1,FIGHTER_MAGE_CLERIC) Class(Player1,CLERIC_RANGER)~  THEN GOTO a2628
END

IF ~Gender(Player1,FEMALE) !Global("c-aranrom","GLOBAL",2) Global("c-aransummoned","GLOBAL",1)~ THEN a2629
  SAY @12323
  + ~Alignment(Player1,MASK_GOOD)~ + @12324 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2608
  + ~!Alignment(Player1,MASK_GOOD)~ + @12324 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2609
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  ++ @12326 + a2611
  ++ @12331 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  ++ @12332 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
/* Feywarden of Corellon */
  IF ~Global("c-feywarden","GLOBAL",1)~ THEN GOTO a2632
/* STRIFELEADER OF CYRIC */
  IF ~Global("c-strifeleader","GLOBAL",1)~ THEN GOTO a2633
/* PAINBEARER OF ILMATER */
  IF ~Global("c-painbearer","GLOBAL",1)~ THEN GOTO a2634
/* LOREKEEPER OF OGHMA - the Binder of What is Known, the Patron of Bards */
  IF ~Global("c-lorekeeper","GLOBAL",1)~ THEN GOTO a2635
/* FIREWALKER OF KOSSUTH - evil - elemental fire - Thay : Global("c-firewalker","GLOBAL",1) */
  IF ~Global("c-firewalker","GLOBAL",1)~ THEN GOTO a2636
/* SILVERSTAR OF SELUNE - Moonmaiden : */
  IF ~Global("c-silverstar","GLOBAL",1)~ THEN GOTO a2637
/* Holy Strategist of the Red Knight - Red Fellowship (only law)  */
  IF ~Global("c-strategist","GLOBAL",1)~ THEN GOTO a2638
/* NIGHTCLOAK OF SHAR - Dark Lady */
  IF ~Global("c-nightcloak","GLOBAL",1)~ THEN GOTO a2639
/* HEARTWARDER OF SUNE - Sune Firehair, Lady Firehair : Global("c-heartwarder","GLOBAL",1) */
  IF ~Global("c-heartwarder","GLOBAL",1)~ THEN GOTO a2640
/* BATTLEGUARD OF TEMPUS - th' Foehammer (chaos) */
  IF ~Global("c-battleguard","GLOBAL",1)~ THEN GOTO a2641
/* Authlim of Iyachtu Xvim - the Godson */
  IF ~Global("c-authlim","GLOBAL",1)~ THEN GOTO a2642
/* MORNINGLORD OF LATHANDER */
  IF ~Kit(Player1,GODLATHANDER) OR(6) Class(Player1,CLERIC) Class(Player1,FIGHTER_CLERIC) Class(Player1,CLERIC_MAGE) Class(Player1,CLERIC_THIEF) Class(Player1,FIGHTER_MAGE_CLERIC) Class(Player1,CLERIC_RANGER)~ THEN GOTO a2643
/* WATCHER OF HELM */
  IF ~Kit(Player1,GODHELM) OR(6) Class(Player1,CLERIC) Class(Player1,FIGHTER_CLERIC) Class(Player1,CLERIC_MAGE) Class(Player1,CLERIC_THIEF) Class(Player1,FIGHTER_MAGE_CLERIC) Class(Player1,CLERIC_RANGER)~ THEN GOTO a2644
/* STORMLORD OF TALOS */
  IF ~Kit(Player1,GODTALOS) OR(6) Class(Player1,CLERIC) Class(Player1,FIGHTER_CLERIC) Class(Player1,CLERIC_MAGE) Class(Player1,CLERIC_THIEF) Class(Player1,FIGHTER_MAGE_CLERIC) Class(Player1,CLERIC_RANGER)~  THEN GOTO a2645
END

IF ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2) Global("c-aransummoned","GLOBAL",1)~ THEN a2646
  SAY @12333
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD)~ + @12334 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL)~ + @12334 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL)~ + @12334 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  ++ @12335 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  ++ @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  ++ @12337 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  ++ @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  ++ @12339 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
/* Feywarden of Corellon */
  IF ~Global("c-feywarden","GLOBAL",1)~ THEN GOTO a2632
/* STRIFELEADER OF CYRIC */
  IF ~Global("c-strifeleader","GLOBAL",1)~ THEN GOTO a2633
/* PAINBEARER OF ILMATER */
  IF ~Global("c-painbearer","GLOBAL",1)~ THEN GOTO a2634
/* LOREKEEPER OF OGHMA - the Binder of What is Known, the Patron of Bards */
  IF ~Global("c-lorekeeper","GLOBAL",1)~ THEN GOTO a2635
/* FIREWALKER OF KOSSUTH - evil - elemental fire - Thay : Global("c-firewalker","GLOBAL",1) */
  IF ~Global("c-firewalker","GLOBAL",1)~ THEN GOTO a2636
/* SILVERSTAR OF SELUNE - Moonmaiden : */
  IF ~Global("c-silverstar","GLOBAL",1)~ THEN GOTO a2637
/* Holy Strategist of the Red Knight - Red Fellowship (only law)  */
  IF ~Global("c-strategist","GLOBAL",1)~ THEN GOTO a2638
/* NIGHTCLOAK OF SHAR - Dark Lady */
  IF ~Global("c-nightcloak","GLOBAL",1)~ THEN GOTO a2639
/* HEARTWARDER OF SUNE - Sune Firehair, Lady Firehair : Global("c-heartwarder","GLOBAL",1) */
  IF ~Global("c-heartwarder","GLOBAL",1)~ THEN GOTO a2640
/* BATTLEGUARD OF TEMPUS - th' Foehammer (chaos) */
  IF ~Global("c-battleguard","GLOBAL",1)~ THEN GOTO a2641
/* Authlim of Iyachtu Xvim - the Godson */
  IF ~Global("c-authlim","GLOBAL",1)~ THEN GOTO a2642
/* MORNINGLORD OF LATHANDER */
  IF ~Kit(Player1,GODLATHANDER) OR(6) Class(Player1,CLERIC) Class(Player1,FIGHTER_CLERIC) Class(Player1,CLERIC_MAGE) Class(Player1,CLERIC_THIEF) Class(Player1,FIGHTER_MAGE_CLERIC) Class(Player1,CLERIC_RANGER)~ THEN GOTO a2643
/* WATCHER OF HELM */
  IF ~Kit(Player1,GODHELM) OR(6) Class(Player1,CLERIC) Class(Player1,FIGHTER_CLERIC) Class(Player1,CLERIC_MAGE) Class(Player1,CLERIC_THIEF) Class(Player1,FIGHTER_MAGE_CLERIC) Class(Player1,CLERIC_RANGER)~ THEN GOTO a2644
/* STORMLORD OF TALOS */
  IF ~Kit(Player1,GODTALOS) OR(6) Class(Player1,CLERIC) Class(Player1,FIGHTER_CLERIC) Class(Player1,CLERIC_MAGE) Class(Player1,CLERIC_THIEF) Class(Player1,FIGHTER_MAGE_CLERIC) Class(Player1,CLERIC_RANGER)~  THEN GOTO a2645
END

/* Feywarden of Corellon */
IF ~~ a2615
  SAY @12340
  ++ @12341 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* STRIFELEADER OF CYRIC */
IF ~~ a2616
  SAY @12342
  ++ @12343 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* PAINBEARER OF ILMATER */
IF ~~ a2617
  SAY @12344
  ++ @12345 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* LOREKEEPER OF OGHMA - the Binder of What is Known, the Patron of Bards */
IF ~~ a2618
  SAY @12346
  ++ @12347 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* FIREWALKER OF KOSSUTH - evil - elemental fire - Thay : Global("c-firewalker","GLOBAL",1) */
IF ~~ a2619
  SAY @12348
  ++ @12349 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* SILVERSTAR OF SELUNE - Moonmaiden : */
IF ~~ a2620
  SAY @12350
  ++ @12351 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* Holy Strategist of the Red Knight - Red Fellowship (only law)  */
IF ~~ a2621
  SAY @12352
  ++ @12353 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* NIGHTCLOAK OF SHAR - Dark Lady */
IF ~~ a2622
  SAY @12354
  ++ @12355 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* HEARTWARDER OF SUNE - Sune Firehair, Lady Firehair : Global("c-heartwarder","GLOBAL",1) */
IF ~~ a2623
  SAY @12356
  ++ @12357 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* BATTLEGUARD OF TEMPUS - th' Foehammer (chaos) */
IF ~~ a2624
  SAY @12358
  ++ @12359 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* Authlim of Iyachtu Xvim - the Godson */
IF ~~ a2625
  SAY @12360
  ++ @12361 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* MORNINGLORD OF LATHANDER */
IF ~~ a2626
  SAY @12362
  ++ @12363 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
 END
/* WATCHER OF HELM */
IF ~~ a2627
  SAY @12364
  ++ @12365 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* STORMLORD OF TALOS */
IF ~~ a2628
  SAY @12366
  ++ @12367 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* Feywarden of Corellon */
IF ~~ a2632
  SAY @12340
  ++ @12341 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12374 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* STRIFELEADER OF CYRIC */
IF ~~ a2633
  SAY @12342
  ++ @12343 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12374 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* PAINBEARER OF ILMATER */
IF ~~ a2634
  SAY @12344
  ++ @12345 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12374 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* LOREKEEPER OF OGHMA - the Binder of What is Known, the Patron of Bards */
IF ~~ a2635
  SAY @12346
  ++ @12347 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12375 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* FIREWALKER OF KOSSUTH - evil - elemental fire - Thay : Global("c-firewalker","GLOBAL",1) */
IF ~~ a2636
  SAY @12348
  ++ @12349 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12375 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* SILVERSTAR OF SELUNE - Moonmaiden : */
IF ~~ a2637
  SAY @12350
  ++ @12351 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12375 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* Holy Strategist of the Red Knight - Red Fellowship (only law)  */
IF ~~ a2638
  SAY @12352
  ++ @12353 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12375 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* NIGHTCLOAK OF SHAR - Dark Lady */
IF ~~ a2639
  SAY @12354
  ++ @12355 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12375 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* HEARTWARDER OF SUNE - Sune Firehair, Lady Firehair : Global("c-heartwarder","GLOBAL",1) */
IF ~~ a2640
  SAY @12356
  ++ @12357 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12375 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* BATTLEGUARD OF TEMPUS - th' Foehammer (chaos) */
IF ~~ a2641
  SAY @12358
  ++ @12359 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12375 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* Authlim of Iyachtu Xvim - the Godson */
IF ~~ a2642
  SAY @12360
  ++ @12361 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12375 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* MORNINGLORD OF LATHANDER */
IF ~~ a2643
  SAY @12362
  ++ @12363 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12375 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
 END
/* WATCHER OF HELM */
IF ~~ a2644
  SAY @12364
  ++ @12365 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12375 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* STORMLORD OF TALOS */
IF ~~ a2645
  SAY @12366
  ++ @12367 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + @12369 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + @12336 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + @12370 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12338 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + @12371 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12330 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12372 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + @12373 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ @12375 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END

/* crossover state */
IF ~~ a2653
  SAY @12376
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Gender(Player1,FEMALE) Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + @12368 + a2647
  + ~Gender(Player1,FEMALE) Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 + a2648
  + ~Gender(Player1,FEMALE) !Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + @12368 + a2649
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + @12369 + a2650
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + @12336 + a2651
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + @12370 + a2652
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + @12338 + a2652
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + @12371 + a2631
  + ~Gender(Player1,FEMALE) !Global("c-aranrom","GLOBAL",2)~ + @12330 + a2630
  + ~Gender(Player1,FEMALE) !Global("c-aranrom","GLOBAL",2)~ + @12372 + a2654
  + ~Gender(Player1,FEMALE) !Global("c-aranrom","GLOBAL",2)~ + @12373 + a2654
  + ~Gender(Player1,FEMALE)~ + @12375 + a2654
  + ~Gender(Player1,MALE)~ + @12325 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  + ~Gender(Player1,MALE)~ + @12326 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  + ~Gender(Player1,MALE)~ + @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  + ~Gender(Player1,MALE)~ + @12328 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  + ~Gender(Player1,MALE)~ + @12329 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END

IF ~~ a2652
  SAY @12377
  ++ @12378 DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2) JoinParty()~ EXIT
  ++ @12379 DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2655
  ++ @12380 DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2656
  ++ @12381 DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2) JoinParty()~ EXIT
  ++ @12382 DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2657
  ++ @12383 DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2656
END

IF ~~ a2647
  SAY @12384
  ++ @12385 + a2658
  ++ @12386 + a2658
  ++ @12387 + a2659
  ++ @12388 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ @12389 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ @12390 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
END

IF ~~ a2648
  SAY @12391
  = @12384
  ++ @12385 + a2658
  ++ @12386 + a2658
  ++ @12387 + a2659
  ++ @12388 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ @12392 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ @12393 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
END

IF ~~ a2649
  SAY @12394
  = @12395
  ++ @12385 + a2658
  ++ @12396 + a2658
  ++ @12397 + a2659
  ++ @12388 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ @12392 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ @12393 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
END

IF ~~ a2659
  SAY @12398
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2631
END

IF ~~ a2651
  SAY @12399
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2631
END

IF ~~ a2650
  SAY @12400
  ++ @12401 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2611
  ++ @12402 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2611
  + ~Alignment(Player1,MASK_GOOD)~ + @12324 + a2608
  + ~!Alignment(Player1,MASK_GOOD)~ + @12324 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2609
  ++ @12327 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2612
  ++ @12403 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2614
  ++ @12404 DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2660
END

IF ~~ a2660
  SAY @12405
  ++ @12406 + a2661
  ++ @12407 + a2614
  ++ @12408 + a2614
  ++ @12409 + a2614
  ++ @12410 + a2614
  ++ @12411 + a2611
END

IF ~~ a2661
  SAY @10515
  = @12412
  ++ @12413 + a2662
  ++ @12414 + a2662
  ++ @12415 + a2662
  + ~RandomNum(4,4)~ + @12416 + a2663
  + ~RandomNum(4,3)~ + @12416 + a2664
  + ~RandomNum(4,2)~ + @12416 + a2665
  + ~RandomNum(4,1)~ + @12416 + a2666
END

IF ~~ a2611
  SAY @12417
  IF ~~ THEN GOTO a2631
END

IF ~~ a2614
  SAY @12418
  IF ~~ THEN GOTO a2631
END

IF ~~ a2630
  SAY @12419
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ GOTO a2631
END

IF ~~ a2658
  SAY @12420
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",1)~ GOTO a2631
END

IF ~~ a2613
  SAY @12421
  + ~Alignment(Player1,MASK_GOOD)~ + @12324 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2608
  + ~!Alignment(Player1,MASK_GOOD)~ + @12324 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2609
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
END

IF ~~ a2610
  SAY @12422
  ++ @12423 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2667
  + ~Alignment(Player1,MASK_GOOD)~ + @12324 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2608
  + ~!Alignment(Player1,MASK_GOOD)~ + @12324 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2609
  ++ @12327 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  + ~RandomNum(4,4)~ + @12424 + a2663
  + ~RandomNum(4,3)~ + @12424 + a2664
  + ~RandomNum(4,2)~ + @12424 + a2665
  + ~RandomNum(4,1)~ + @12424 + a2666
END

IF ~~ a2667
  SAY @12425
  IF ~~ THEN GOTO a2631
END

IF ~~ a2608
  SAY @12426
  IF ~~ THEN GOTO a2631
END

IF ~~ a2631
  SAY @12427
  ++ @12428 DO ~JoinParty()~ EXIT
  ++ @12429 DO ~JoinParty()~ EXIT
  ++ @12430 + a2668
  ++ @12431 + a2655
  ++ @12432 + a2669
  + ~RandomNum(4,4)~ + @12433 + a2663
  + ~RandomNum(4,3)~ + @12433 + a2664
  + ~RandomNum(4,2)~ + @12433 + a2665
  + ~RandomNum(4,1)~ + @12433 + a2666
END

IF ~~ a2668
  SAY @12434
  ++ @12435 DO ~JoinParty()~ EXIT
  ++ @12379 + a2655
  ++ @12436 + a2656
  + ~RandomNum(4,4)~ + @12433 + a2663
  + ~RandomNum(4,3)~ + @12433 + a2664
  + ~RandomNum(4,2)~ + @12433 + a2665
  + ~RandomNum(4,1)~ + @12433 + a2666
END

IF ~~ a2655
  SAY @12437
  ++ @12438 DO ~JoinParty()~ EXIT
  + ~RandomNum(4,4)~ + @12433 + a2663
  + ~RandomNum(4,3)~ + @12433 + a2664
  + ~RandomNum(4,2)~ + @12433 + a2665
  + ~RandomNum(4,1)~ + @12433 + a2666
  ++ @12439 + a2657
  ++ @12440 + a2656
END

IF ~~ a2662
  SAY @12441
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ a2669
  SAY @12442
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ a2656
  SAY @12443
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~ a2657
  SAY @12444
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ a2609
  SAY @12445
  IF ~~ THEN GOTO a2670
END

IF ~~ a2670
  SAY @12446
  ++ @12447 DO ~JoinParty()~ EXIT
  ++ @12448 GOTO a2671
END

IF ~~ a2671
  SAY @12449
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~ a2612
  SAY @12450
  + ~!Alignment(Player1,MASK_GOOD)~ + @12451 GOTO a2608
  + ~Alignment(Player1,MASK_GOOD)~ + @12451 GOTO a2609
  + ~!Alignment(Player1,MASK_GOOD)~ + @12452 GOTO a2656
  + ~Alignment(Player1,MASK_GOOD)~ + @12453 GOTO a2671
  ++ @8590 + a2694
  ++ @12454 + a2663
  ++ @12455 + a2673
END

IF ~Global("c-aransummoned","GLOBAL",2)~ THEN a2672
  SAY @12456
  ++ @12457 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",FIGHTER_ALL)~ + @12295 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",MAGE_ALL)~ + @12296 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",THIEF_ALL)~ + @12297 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",BARD_ALL)~ + @12306 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",RANGER_ALL)~ + @12299 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",SORCERER)~ + @12300 DO ~JoinParty()~ EXIT
  + ~OR(2) Class("c-aran",CLERIC_ALL) Class("c-aran",PALADIN_ALL)~ + @12301 DO ~JoinParty()~ EXIT
  ++ @8590 + a2694
  + ~RandomNum(4,4)~ + @12458 + a2663
  + ~RandomNum(4,3)~ + @12458 + a2664
  + ~RandomNum(4,2)~ + @12458 + a2665
  + ~RandomNum(4,1)~ + @12458 + a2666
END

IF ~~ a2673
  SAY @12459
  ++ @12460 DO ~JoinParty()~ EXIT
  ++ @12461 EXIT
  + ~RandomNum(4,4)~ + @12462 + a2663
  + ~RandomNum(4,3)~ + @12462 + a2664
  + ~RandomNum(4,2)~ + @12462 + a2665
  + ~RandomNum(4,1)~ + @12462 + a2666
  + ~Class("c-aran",FIGHTER_ALL)~ + @12295 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",MAGE_ALL)~ + @12296 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",THIEF_ALL)~ + @12297 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",BARD_ALL)~ + @12306 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",RANGER_ALL)~ + @12299 DO ~JoinParty()~ EXIT
  + ~Class("c-aran",SORCERER)~ + @12300 DO ~JoinParty()~ EXIT
  + ~OR(2) Class("c-aran",CLERIC_ALL) Class("c-aran",PALADIN_ALL)~ + @12301 DO ~JoinParty()~ EXIT
END

IF ~~ a2663
  SAY @12463
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~ a2664
  SAY @12464
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~ a2665
  SAY @12465
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~ a2666
  SAY @12466
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~ a2654
  SAY @12467
  = @12468
  = @12469
  IF ~~ THEN GOTO a2631
END

END /* of pre-joined file */

APPEND C-ARN25J

/* Setting Aran as Leader (Darios) */
IF ~Global("c-aranleader","LOCALS",1) Global("c-silencearan","GLOBAL",0)~ THEN BEGIN a3020
  SAY @1031
  IF ~~ THEN DO ~SetGlobal("c-aranleader","LOCALS",2) SetGlobalTimer("c-aransmalltalk","GLOBAL",300)~ EXIT
END

/* You look dead on your feet */
IF ~Global("c-aranpctired","LOCALS",1) Global("c-silencearan","GLOBAL",0)~ THEN BEGIN a3021
  SAY @1032
  IF ~~ THEN DO ~SetGlobal("c-aranpctired","LOCALS",2) SetGlobalTimer("c-aransmalltalk","GLOBAL",300)~ EXIT
END

/* Waukeen Temple */
IF ~Global("c-aranwaukeen","LOCALS",1) Global("c-silencearan","GLOBAL",0)~ THEN BEGIN a3022
  SAY @1053
  IF ~~ THEN DO ~SetGlobal("c-aranwaukeen","LOCALS",2) SetGlobalTimer("c-aransmalltalk","GLOBAL",300)~ EXIT
END


/* FLIRTS: SECOND TO LAST IN WEIGHT */

/* Lots of Flirts means Player Wants Action: reply states */

/* Triggered in BCS by lots of flirts */
IF ~Global("c-aranbedflirt","GLOBAL",1)~ THEN BEGIN a4503
  SAY @6478
  ++ @6479 DO ~SetGlobal("c-aranbedflirt","GLOBAL",2)~ + a4498
  ++ @6480 DO ~SetGlobal("c-aranbedflirt","GLOBAL",2)~ + a4497
  ++ @6481 DO ~SetGlobal("c-aranbedflirt","GLOBAL",2)~ + a4505
  ++ @6482 DO ~SetGlobal("c-aranbedflirt","GLOBAL",2)~ + a4498
  IF ~Global("c-aranrom","GLOBAL",2)~ THEN DO ~SetGlobal("c-aranbedflirt","GLOBAL",2)~ GOTO a4504
END

/* NPC Initiated Flirts */
IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN BEGIN a4376
  SAY @6483
 /* NPC Initiated Flirts : Random Light Flirts */
  IF ~RandomNum(32,1)~ THEN GOTO a4377
  IF ~RandomNum(32,2)~ THEN GOTO a4378
  IF ~RandomNum(32,3)~ THEN GOTO a4379
  IF ~RandomNum(32,4)~ THEN GOTO a4380
  IF ~RandomNum(32,5)~ THEN GOTO a4381
  IF ~RandomNum(32,6)~ THEN GOTO a4382
  IF ~RandomNum(32,7)~ THEN GOTO a4383
  IF ~RandomNum(32,8)~ THEN GOTO a4385
  IF ~RandomNum(32,9)~ THEN GOTO a4386
  IF ~RandomNum(32,10)~ THEN GOTO a4387
  IF ~RandomNum(32,11)~ THEN GOTO a4388
  IF ~RandomNum(32,12)~ THEN GOTO a4389
  IF ~RandomNum(32,13)~ THEN GOTO a4390
  IF ~RandomNum(32,14)~ THEN GOTO a4391
  IF ~RandomNum(32,15)~ THEN GOTO a4392
  IF ~RandomNum(32,16)~ THEN GOTO a4393
  IF ~RandomNum(32,17)~ THEN GOTO a4394
  IF ~RandomNum(32,18)~ THEN GOTO a4395
  IF ~RandomNum(32,19)~ THEN GOTO a4396
  IF ~RandomNum(32,20)~ THEN GOTO a4397
  IF ~RandomNum(32,21)~ THEN GOTO a4398
  IF ~RandomNum(32,22)~ THEN GOTO a4399
  IF ~RandomNum(32,23)~ THEN GOTO a4400
  IF ~RandomNum(32,24)~ THEN GOTO a4401
  IF ~RandomNum(32,25)~ THEN GOTO a4402
  IF ~RandomNum(32,26)~ THEN GOTO a4403
  IF ~RandomNum(32,27)~ THEN GOTO a4404
  IF ~RandomNum(32,28)~ THEN GOTO a4405
  IF ~RandomNum(32,29)~ THEN GOTO a4406
  IF ~RandomNum(32,30)~ THEN GOTO a4407
  IF ~RandomNum(32,31)~ THEN GOTO a4408
  IF ~RandomNum(32,32)~ THEN GOTO a4409
 /* NPC Initiated Flirts : Jewelry Light Flirt Additions:  */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL04",Player1) Global("c-aljewel2","LOCALS",0)~ THEN GOTO a4410 /* Studded Necklace with Zios Gems */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL05",Player1) Global("c-aljewel2","LOCALS",0)~ THEN GOTO a4411 /* Bluestone Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL06",Player1) Global("c-aljewel2","LOCALS",0)~ THEN GOTO a4412 /*  Agni Mani Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL07",Player1) Global("c-aljewel2","LOCALS",0)~ THEN GOTO a4413 /*  Rainbow Obsidian Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL08",Player1) Global("c-aljewel2","LOCALS",0)~ THEN GOTO a4414 /*  Tiger Cowrie Shell Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL09",Player1) Global("c-aljewel3","LOCALS",0)~ THEN GOTO a4415 /*  Silver Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL10",Player1) Global("c-aljewel3","LOCALS",0)~ THEN GOTO a4416 /*  Gold Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL11",Player1) Global("c-aljewel3","LOCALS",0)~ THEN GOTO a4417 /*  Pearl Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL16",Player1) Global("c-aljewel1","LOCALS",0)~ THEN GOTO a4418 /* Amulet of Metaspell Influence (+1 2nd level spell) */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL18",Player1) Global("c-aljewel1","LOCALS",0)~ THEN GOTO a4419 /*  Wolfsbane Charm +2 vs Lycanthropes */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL22",Player1) Global("c-aljewel1","LOCALS",0)~ THEN GOTO a4420 /*  Periapt of Proof Against Poison */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL01",Player1) Global("c-aljewel1","LOCALS",0)~ THEN GOTO a4421 /*  Necklace of Missiles */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL12",Player1) Global("c-aljewel1","LOCALS",0)~ THEN GOTO a4422 /* Laeral's Tear Necklace (3000 gp) */
  IF ~RandomNum(2,1) HasItemEquiped("RE_valm",Player1) Global("c-aljewelv","LOCALS",0)~ THEN GOTO a4423 /* Romantic Encounters: Valygar item */
  IF ~RandomNum(2,1) HPPercentLT(Player1,40)~ THEN GOTO a4458
END

/* NPC Initiated Flirts : Random Heavy Flirts */
IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN BEGIN a4459
  SAY @6484
  IF ~RandomNum(36,36)~ THEN GOTO a4398
  IF ~RandomNum(36,35)~ THEN GOTO a4399
  IF ~RandomNum(36,34)~ THEN GOTO a4400
  IF ~RandomNum(36,33)~ THEN GOTO a4401
  IF ~RandomNum(36,32)~ THEN GOTO a4402
  IF ~RandomNum(36,31)~ THEN GOTO a4403
  IF ~RandomNum(36,30)~ THEN GOTO a4404
  IF ~RandomNum(36,29)~ THEN GOTO a4405
  IF ~RandomNum(36,28)~ THEN GOTO a4406
  IF ~RandomNum(36,27)~ THEN GOTO a4407
  IF ~RandomNum(36,26)~ THEN GOTO a4408
  IF ~RandomNum(36,25)~ THEN GOTO a4409
  IF ~RandomNum(36,24)~ THEN GOTO a4409
  IF ~RandomNum(36,23)~ THEN GOTO a4409
  IF ~RandomNum(36,22)~ THEN GOTO a4424
  IF ~RandomNum(36,21)~ THEN GOTO a4425
  IF ~RandomNum(36,20)~ THEN GOTO a4426
  IF ~RandomNum(36,19)~ THEN GOTO a4427
  IF ~RandomNum(36,18)~ THEN GOTO a4428
  IF ~RandomNum(36,17)~ THEN GOTO a4429
  IF ~RandomNum(36,16)~ THEN GOTO a4430
  IF ~RandomNum(36,15)~ THEN GOTO a4431
  IF ~RandomNum(36,14)~ THEN GOTO a4432
  IF ~RandomNum(36,13)~ THEN GOTO a4433
  IF ~RandomNum(36,12)~ THEN GOTO a4434
  IF ~RandomNum(36,11)~ THEN GOTO a4435
  IF ~RandomNum(36,10)~ THEN GOTO a4436
  IF ~RandomNum(36,9)~ THEN GOTO a4437
  IF ~RandomNum(36,8)~ THEN GOTO a4438
  IF ~RandomNum(36,7)~ THEN GOTO a4439
  IF ~RandomNum(36,6)~ THEN GOTO a4440
  IF ~RandomNum(36,5)~ THEN GOTO a4441
  IF ~RandomNum(36,4)~ THEN GOTO a4442
  IF ~RandomNum(36,3)~ THEN GOTO a4443
  IF ~RandomNum(36,2)~ THEN GOTO a4444
  IF ~RandomNum(36,1)~ THEN GOTO a4445
  IF ~AreaType(OUTDOOR) TimeOfDay(NIGHT) Global("c-aranstarflirt","GLOBAL",0)~ THEN GOTO a4446 /* c-aranstarflirt */
  IF ~AreaType(CITY) AreaType(OUTDOOR) Global("c-arancityflirt","GLOBAL",0)~ THEN DO ~SetGlobal("c-arancityflirt","GLOBAL",1)~ GOTO a4447 /* c-arancityflirt */
  IF ~AreaType(DUNGEON) Global("c-arandungeonflirt","GLOBAL",0)~ THEN DO ~SetGlobal("c-arandungeonflirt","GLOBAL",1)~ GOTO a4448  /* c-arandungeonflirt */
  /* Jewelry Light Flirt Additions:  */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL04",Player1) Global("c-ahjewel2","LOCALS",0)~ THEN GOTO a4410 /* Studded Necklace with Zios Gems */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL05",Player1) Global("c-ahjewel2","LOCALS",0)~ THEN GOTO a4411 /* Bluestone Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL06",Player1) Global("c-ahjewel2","LOCALS",0)~ THEN GOTO a4412 /* Agni Mani Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL07",Player1) Global("c-ahjewel2","LOCALS",0)~ THEN GOTO a4413 /*  Rainbow Obsidian Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL08",Player1) Global("c-ahjewel2","LOCALS",0)~ THEN GOTO a4414 /* Tiger Cowrie Shell Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL09",Player1) Global("c-ahjewel3","LOCALS",0)~ THEN GOTO a4415 /*  Silver Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL10",Player1) Global("c-ahjewel3","LOCALS",0)~ THEN GOTO a4416 /*  Gold Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL11",Player1) Global("c-ahjewel3","LOCALS",0)~ THEN GOTO a4417 /* Pearl Necklace */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL16",Player1) Global("c-ahjewel1","LOCALS",0)~ THEN GOTO a4418 /* Amulet of Metaspell Influence (+1 2nd level spell) */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL18",Player1) Global("c-ahjewel1","LOCALS",0)~ THEN GOTO a4419 /* Wolfsbane Charm +2 vs Lycanthropes */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL22",Player1) Global("c-ahjewel1","LOCALS",0)~ THEN GOTO a4420 /* Periapt of Proof Against Poison */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL01",Player1) Global("c-ahjewel1","LOCALS",0)~ THEN GOTO a4421 /*  Necklace of Missiles */
  IF ~RandomNum(2,1) HasItemEquiped("AMUL12",Player1) Global("c-ahjewel1","LOCALS",0)~ THEN GOTO a4422 /*  Laeral's Tear Necklace (3000 gp) */
  IF ~RandomNum(2,1) HasItemEquiped("RE_valm",Player1) Global("c-aljewelv","LOCALS",0)~ THEN GOTO a4423 /* Romantic Encounters: Valygar item */
  IF ~HPPercentLT(Player1,40)~ THEN GOTO a4449
END

IF ~~ a4377
  SAY @9673
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4378
  SAY @9674
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4379
  SAY @9675
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4380
  SAY @9676
  = @9677
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4381
  SAY @9678
  = @9679
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4382
  SAY @9680
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4383
  SAY @9681
  = @9682
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4384
  SAY @12470
  =  @9684
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4385
  SAY @9685
  = @9686
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4386
  SAY @9687
  = @9688
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4387
  SAY @9689
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4388
  SAY @9690
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4389
  SAY @9691
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4390
  SAY @9692
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4391
  SAY @9693
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4392
  SAY @9694
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4393
  SAY @9695
  IF ~!Global("c-heartwarder","GLOBAL",1)~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  IF ~Global("c-heartwarder","GLOBAL",1)~ THEN GOTO a4450
END

IF ~~ a4450
  SAY @9696
  ++ @9697 + a4451
  + ~RandomNum(3,1)~ + @9698 + a4452
  + ~RandomNum(3,2)~ + @9698 + a4453
  + ~RandomNum(3,3)~ + @9698 + a4454
  + ~RandomNum(3,1)~ + @9699 + a4455
  + ~RandomNum(3,2)~ + @9699 + a4457
  + ~RandomNum(3,3)~ + @9699 + a4456
  ++ @9700 + a4451
END

IF ~~ a4451
  SAY @9701
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

/* Inside joke for Domi */
IF ~~ a4452
  SAY @9702
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

/* Inside joke for berelinde */
IF ~~ a4453
  SAY @9703
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4454
  SAY @9704
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

/* Inside joke for RavenBlack */
IF ~~ a4455
  SAY @9705
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

/* Inside joke for Jastey */
IF ~~ a4457
  SAY @9706
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4456
  SAY @9707
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4394
  SAY @9708
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4395
  SAY @9709
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4396
  SAY @9710
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

/* Low HP hijack of flirts early flirts */
IF ~~ a4458
  SAY @9711
  IF ~RandomNum(5,1)~ THEN GOTO a4460
  IF ~RandomNum(5,2)~ THEN GOTO a4461
  IF ~RandomNum(5,3)~ THEN GOTO a4462
  IF ~RandomNum(5,4)~ THEN GOTO a4463
  IF ~RandomNum(5,5)~ THEN GOTO a4464
END

IF ~~ a4460
  SAY @9712
  = @9713
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4461
  SAY @9714
  = @9715
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4462
  SAY @9716
  = @9717
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4463
  SAY @9718
  = @9719
  = @9720
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4464
  SAY @9721
  = @9722
  = @9723
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4397
  SAY @9724
  ++ @9725 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ + a4465
  ++ @9726 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ + a4465
  ++ @9727 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ + a4465
END

IF ~~ a4465 SAY @9728 IF ~~ THEN EXIT END

IF ~~ a4398
  SAY @9729
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4399
  SAY @9730
  = @9731
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4400
  SAY @9732
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4401
  SAY @9733
  = @9734
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4402
  SAY @9735
  = @9736
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4403
  SAY @9737
  = @9738
  = @9739
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4404
  SAY @9740
  =  @9741
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4405
  SAY @9742
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4406
  SAY @9743
  = @9744
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4407
  SAY @12471
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4408
  SAY @9746
  = @9747
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

/* Flirt Gifts Sequence */
IF ~~ a4409
  SAY @9748
  IF ~Global("c-arangift","GLOBAL",0)~ THEN REPLY @12472 DO ~SetGlobal("c-arangift","GLOBAL",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ + a4482
  IF ~Global("c-arangift","GLOBAL",1)~ THEN REPLY @9750 DO ~SetGlobal("c-arangift","GLOBAL",2) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ + a4484
  IF ~Global("c-arangift","GLOBAL",2)~ THEN REPLY @9751 DO ~SetGlobal("c-arangift","GLOBAL",3) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ + a4485
  IF ~Global("c-arangift","GLOBAL",3)~ THEN REPLY @9752 DO ~SetGlobal("c-arangift","GLOBAL",4) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ + a4486
  IF ~Global("c-arangift","GLOBAL",4)~ THEN REPLY @9753 DO ~SetGlobal("c-arangift","GLOBAL",5) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ + a4487
  IF ~Global("c-arangift","GLOBAL",5)~ THEN REPLY @9754 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ + a4488
END

IF ~~ a4424
  SAY @9755
  IF ~~ THEN GOTO a4467
  IF ~Alignment(Player1,MASK_EVIL)~ THEN GOTO a4466
  IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO a4467
  IF ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL)~ THEN GOTO a4468
END

IF ~~ a4425
  SAY  @9756
  = @9757
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4426
  SAY @9758
  = @9759
  = @9760
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4427
  SAY @9761
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4428
  SAY @9762
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4429
  SAY @9763
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4430
  SAY @9764
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4466
  SAY @9765
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4467
  SAY @9766
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4468
  SAY @9767
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4431
  SAY @9768
  ++ @9769 + a4470
  ++ @9770 + a4472
  ++ @9771 + a4471
END

IF ~~ a4470 SAY @9772 IF ~~ THEN EXIT END

IF ~~ a4471
  SAY @9773
  IF ~~ THEN GOTO a4472
END

IF ~~ a4472
  SAY @9774
  + ~Global("c-aranpoetry","GLOBAL",0)~ + @9775 DO ~IncrementGlobal("c-aranpoetry","GLOBAL",1)~ + a4473
  + ~GlobalGT("c-aranpoetry","GLOBAL",0)~ + @9776 DO ~IncrementGlobal("c-aranpoetry","GLOBAL",1)~ + a4474
END

IF ~~ a4473
  SAY @9777
  = @9778
  = @12473
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

/* Race Flirt */
IF ~~ a4432
  SAY @9780
  IF ~Race(Player1,1)~ THEN GOTO a4475
  IF ~Race(Player1,2)~ THEN GOTO a4476
  IF ~Race(Player1,3)~ THEN GOTO a4477
  IF ~Race(Player1,4)~ THEN GOTO a4478
  IF ~Race(Player1,5)~ THEN GOTO a4479
  IF ~Race(Player1,6)~ THEN GOTO a4480
  IF ~Race(Player1,7)~ THEN GOTO a4481
END

IF ~~ a4475
  SAY @9781
  = @9782
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4476
  SAY @9783
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4477
  SAY @9784
  = @9785
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4478
  SAY @9786
  = @9787
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4479
  SAY @9788
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4480
  SAY @9789
  = @12474
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4481
  SAY @9791
  = @9792
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4482
  SAY @9793
  ++ @9794 + a4483
  ++ @9795 + a4550
  ++ @9796 EXIT
  ++ @9797 DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ EXIT
  ++ @9798 + a4550
END

IF ~~ a4483 SAY @9799 IF ~~ THEN EXIT END
IF ~~ a4484 SAY @9800 IF ~~ THEN EXIT END
IF ~~ a4485 SAY @9801 IF ~~ THEN EXIT END
IF ~~ a4486 SAY @9802 IF ~~ THEN EXIT END
IF ~~ a4487 SAY @9803 IF ~~ THEN EXIT END
IF ~~ a4488 SAY @9804 IF ~~ THEN EXIT END

/* Low HP hijack of flirts */
IF ~~ a4449
  SAY @9711
  IF ~RandomNum(5,1)~ THEN GOTO a4489
  IF ~RandomNum(5,2)~ THEN GOTO a4490
  IF ~RandomNum(5,3)~ THEN GOTO a4491
  IF ~RandomNum(5,4)~ THEN GOTO a4492
  IF ~RandomNum(5,5)~ THEN GOTO a4493
END

IF ~~ a4489
  SAY @9712
  = @9805
  = @9806
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4490
  SAY @9807
  = @9808
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4491
  SAY @9809
  = @9810
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4492
  SAY @9718
  = @9719
  = @9720
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4493
  SAY @9721
  = @9722
  = @9723
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4474
  SAY @9811
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

/* Aran-Initiated Physical Flirts */
IF ~~ a4433
  SAY @9812
  ++ @9813 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9814 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9815 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4434
  SAY @9816
  ++ @9817 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9818 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9819 GOTO a4495
  ++ @9820 DO ~SetGlobal("c-aranintimate","GLOBAL",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4435
  SAY @9821
  ++ @9822 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9823 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9824 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4436
  SAY @9825
  ++ @9826 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9827 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9828 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9829 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4437
  SAY @9830
  ++ @9831 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~EXIT
  ++ @9832 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9833 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4438
  SAY @9834
  ++ @9835 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9836 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9837 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4439
  SAY @9838
  ++ @9839 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9840 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9841 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9842 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4440
  SAY @9843
  ++ @9844 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9845 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9846 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9847 + a4494
END

IF ~~ a4441
  SAY @9848
  = @9849
  ++ @9850 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9851 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9852 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4442
  SAY @9853
  ++ @9854 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9855 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9856 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4443
  SAY @9857
  ++ @9858 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9859 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9860 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9861 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4444
  SAY @9862
  ++ @9863 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9864 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9865 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4445
  SAY @9866
  ++ @9867 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9868 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9869 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9870 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4494
  SAY @9871
  = @9872
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4495
  SAY @9873
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4504
  SAY @9874
  ++ @9875 + a4499
  ++ @9876 + a4497
  ++ @9877 + a4497
  ++ @9878 + a4506
  ++ @9879 + a4499
  ++ @9880 + a4499
  ++ @6479 + a4498
END

IF ~~ a4498
  SAY @9881
  ++ @9876 + a4497
  ++ @9879 + a4499
  ++ @9882 + a4499
  ++ @9878 + a4506
  ++ @6482 + a4500
  ++ @9883 + a4497
END

IF ~~ a4497
  SAY @9884
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

/* set the night visit here: Global("c-arangoaded","GLOBAL",1) */
IF ~~ a4499
  SAY @9885
  = @9886
  IF ~~ THEN DO ~SetGlobal("c-aranrom","GLOBAL",2) SetGlobal("c-arangoaded","GLOBAL",1)~ EXIT
END

IF ~~ a4500
  SAY @9887
  IF ~~ THEN DO ~SetGlobal("c-aranrom","GLOBAL",3) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",1)~ EXIT
END

/* End of action wanting #1 */

IF ~~ a4446 /* c-aranstarflirt */
  SAY @9888
  = @9889
  IF ~~ THEN DO ~SetGlobal("c-aranstarflirt","GLOBAL",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4447 /* c-arancityflirt */
  SAY @9890
  ++ @9891 + a4501
  ++ @9892 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9893 + a4502
  ++ @9894 + a4501
  ++ @9895 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4501
  SAY @9896
  IF ~~ THEN DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
END

IF ~~ a4502
  SAY @9897
  IF ~~ THEN DO ~SetGlobal("c-arangardenmakeout","GLOBAL",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT /* PLACEHOLDER */
END

/* NOTE TO  BCS - CUTSCENE OVERRIDE  */

IF ~~ a4448 /* c-arandungeonflirt */
  SAY @9898
  ++ @9899 DO ~SetGlobal("c-arandungeon","GLOBAL",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0)RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @1888 DO ~SetGlobal("c-arandungeon","GLOBAL",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9900 DO ~SetGlobal("c-arandungeon","GLOBAL",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9901 DO ~SetGlobal("c-arandungeon","GLOBAL",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT
  ++ @9902 DO ~SetGlobal("c-arandungeon","GLOBAL",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ + a4507
END

/* set the night visit here: Global("c-arangoaded","GLOBAL",1) */
IF ~~ a4505
  SAY @9885
  = @9886
  IF ~~ THEN DO ~SetGlobal("c-aranrom","GLOBAL",2) SetGlobal("c-arangoaded","GLOBAL",1)~ EXIT
END

IF ~~ a4506 SAY @3591 IF ~~ THEN EXIT END
IF ~~ a4507 SAY @9536 IF ~~ THEN EXIT END

IF ~~ a4422 /* Laeral's Tear Necklace (3000 gp) */
  SAY @9653
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4532 /* expensive */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4533 /* expensive */
END

IF ~~ a4421 /* Necklace of Missiles */
  SAY @9654
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4535 /* missiles */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4536 /* missiles */
END

IF ~~ a4410 /* Studded Necklace with Zios Gems */
  SAY @9655
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4538 /* clunky */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4539 /* clunky */
END

IF ~~ a4411 /* Bluestone Necklace */
  SAY @9656
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4538 /* clunky */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4539 /* clunky */
END

IF ~~ a4412 /* Agni Mani Necklace */
  SAY @9657
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4538 /* clunky */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4539 /* clunky */
END

IF ~~ a4413 /* Rainbow Obsidian Necklace */
  SAY @9658
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4538 /* clunky */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4539 /* clunky */
END

IF ~~ a4414 /* Tiger Cowrie Shell Necklace */
  SAY @9659
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4538 /* clunky */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4539 /* clunky */
END

IF ~~ a4415 /* Silver Necklace */
  SAY @9660
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4540 /* simple */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4541 /* simple */
END

IF ~~ a4416 /* Gold Necklace */
  SAY @9661
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4540 /* simple */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4541 /* simple */
END

IF ~~ a4417 /* Pearl Necklace */
  SAY @9662
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4540 /* simple */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4541 /* simple */
END

IF ~~ a4418 /* Amulet of Metaspell Influence (+1 2nd level spell) */
  SAY @9663
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4542 /* magical */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4543 /* magical */
END

IF ~~ a4419 /* Wolfsbane Charm +2 vs Lycanthropes */
  SAY @9664
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4544 /* anti-wolf  */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4545 /* anti-wolf  */
END

IF ~~ a4420 /* Periapt of Proof Against Poison */
  SAY @9665
  IF ~~ THEN GOTO a4534 /* I GOT HERE BECAUSE SOMETHING IS BROKEN */
  IF ~Global("c-aranlightflirt","GLOBAL",1)~ THEN GOTO a4546 /* anti-poison */
  IF ~Global("c-aranheavyflirt","GLOBAL",1)~ THEN GOTO a4547 /* anti-poison */
END

/* light replies for necklace flirts */
IF ~~ a4532 SAY @9379 IF ~~ THEN DO ~SetGlobal("c-aljewel1","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* expensive */
IF ~~ a4535 SAY @9380 IF ~~ THEN DO ~SetGlobal("c-aljewel1","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* missiles */
IF ~~ a4540 SAY @9381 IF ~~ THEN DO ~SetGlobal("c-aljewel3","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* simple */
IF ~~ a4546 SAY @9382 IF ~~ THEN DO ~SetGlobal("c-aljewel1","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* anti-poison */
IF ~~ a4544 SAY @9383 IF ~~ THEN DO ~SetGlobal("c-aljewel1","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* anti-wolf */
IF ~~ a4542 SAY @9384 IF ~~ THEN DO ~SetGlobal("c-aljewel1","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* magical */
IF ~~ a4538 SAY @9385 IF ~~ THEN DO ~GiveItemCreate("AMUL11",Player1,0,0,0) SetGlobal("c-aljewel2","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranlightflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* clunky */
/* heavy replies for necklace flirts */
IF ~~ a4533 SAY @9386 IF ~~ THEN DO ~SetGlobal("c-ahjewel1","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* expensive */
IF ~~ a4536 SAY @9387 IF ~~ THEN DO ~SetGlobal("c-ahjewel1","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* missiles */
IF ~~ a4541 SAY @9388 = @9389 IF ~~ THEN DO ~SetGlobal("c-ahjewel3","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* simple */
IF ~~ a4547 SAY @9390 IF ~~ THEN DO ~SetGlobal("c-ahjewel1","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* anti-poison */
IF ~~ a4545 SAY @9391 IF ~~ THEN DO ~SetGlobal("c-ahjewel1","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* anti-wolf */
IF ~~ a4543 SAY @9384 IF ~~ THEN DO ~SetGlobal("c-ahjewel1","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* magical */
IF ~~ a4539 SAY @9392 IF ~~ THEN DO ~SetGlobal("c-ahjewel2","LOCALS",1) IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) RealSetGlobalTimer("c-aranflirttimer","GLOBAL",%ARAN_FLIRT%)~ EXIT END /* clunky */

/* Romantic Encounters: Valygar item */
IF ~~ a4423
  SAY @9666
  IF ~InParty("valygar")~ THEN DO ~SetGlobal("c-aljewelv","LOCALS",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0)~ GOTO a4548
  IF ~!InParty("valygar")~ THEN DO ~SetGlobal("c-aljewelv","LOCALS",1) SetGlobal("c-aranheavyflirt","GLOBAL",0) SetGlobal("c-aranlightflirt","GLOBAL",0)~ GOTO a4549
END

IF ~~ a4548 SAY @9393 IF ~~ THEN EXIT END
IF ~~ a4549 SAY @9394 IF ~~ THEN EXIT END
IF ~~ a4534 SAY @12475 IF ~~ THEN EXIT END
IF ~~ a4550 SAY @10249 IF ~~ THEN EXIT END

/* Adult - Land. Attempting to have some fun, Romantic Encounters-style. */

/* moved up to emulate dreamscript eval  IF ~Global("c-arannightvisit","GLOBAL",2)~ THEN BEGIN a3800 START_ARAN_PC_BOOTY_CALL */


/* I. Player Teases with lots and lots of flirts - from .bcs */

IF ~~ a4351 /* TOO_MUCH_TEASING */
  SAY @6486
  + ~GlobalLT("c-aransex","GLOBAL",4)~ + @6487 DO ~SetGlobal("c-arangoaded","GLOBAL",3)~ + a3802 /* UNSURE_GOADED */
  + ~Global("c-aransex","GLOBAL",4)~ + @6488 DO ~SetGlobal("c-arangoaded","GLOBAL",3)~ + a3802 /* UNSURE_GOADED */
  ++ @6489 DO ~SetGlobal("c-arangoaded","GLOBAL",3)~ + a3803 /* PC_DEMANDS_STRENGTH */
  ++ @6490 DO ~SetGlobal("c-arangoaded","GLOBAL",3)~ + a3804 /* SHARE_MY_BED */
  ++ @6491 DO ~SetGlobal("c-arangoaded","GLOBAL",3)~ + a3804 /* SHARE_MY_BED */
  ++ @6492 DO ~SetGlobal("c-arangoaded","GLOBAL",3)~ + a3805 /* GET_YOUR_BUTT_IN_HERE_NOW */
  ++ @6493 DO ~SetGlobal("c-arangoaded","GLOBAL",3)~ + a3806 /* NO_WAY_THIS_OR_ANY_NIGHT */
  ++ @6494 DO ~SetGlobal("c-arangoaded","GLOBAL",3)~ + a3807 /* TONIGHT_HAVE_HEADACHE */
  ++ @6495 DO ~SetGlobal("c-arangoaded","GLOBAL",3)~ + a3808 /* PC_HAVING_AFFAIR */
END

IF ~~ a3807 /* TONIGHT_HAVE_HEADACHE */
  SAY @6496
  IF ~~ THEN DO ~SetGlobal("c-arangoaded","GLOBAL",4) SetGlobalTimer("c-arangoadedtime","GLOBAL",TEN_DAYS)~ EXIT
END

/* II. Player Teases with lots and lots of flirts, but sent Aran away the first time - 1 FR tenday later - from .bcs */

IF ~Global("c-arangoaded","GLOBAL",5)~ THEN BEGIN a3809 /* TOO_MUCH_TEASING_RETRY */
  SAY @6497
  + ~GlobalLT("c-aransex","GLOBAL",4)~ + @6487 DO ~SetGlobal("c-arangoaded","GLOBAL",6)~ + a3810 /* UNSURE_SECOND */
  + ~Global("c-aransex","GLOBAL",4)~ + @6488 DO ~SetGlobal("c-arangoaded","GLOBAL",6)~ + a3810 /* UNSURE_SECOND */
  ++ @6491 DO ~SetGlobal("c-arangoaded","GLOBAL",6)~ + a3804 /* SHARE_MY_BED */
  ++ @6498 DO ~SetGlobal("c-arangoaded","GLOBAL",6)~ + a3805 /* GET_YOUR_BUTT_IN_HERE_NOW */
  ++ @6489 DO ~SetGlobal("c-arangoaded","GLOBAL",6)~ + a3803 /* PC_DEMANDS_STRENGTH */
  ++ @6493 DO ~SetGlobal("c-arangoaded","GLOBAL",6)~ + a3806 /* NO_WAY_THIS_OR_ANY_NIGHT */
  ++ @6499 DO ~SetGlobal("c-arangoaded","GLOBAL",6)~ + a3804 /* SHARE_MY_BED */
  ++ @6494 DO ~SetGlobal("c-arangoaded","GLOBAL",6)~ + a3811 /* ARAN_DECIDES_NO */
  ++ @6495 DO ~SetGlobal("c-arangoaded","GLOBAL",6)~ + a3808 /* PC_HAVING_AFFAIR */
END

IF ~~ a3802 /* UNSURE_GOADED */
  SAY @6500
  ++ @6501 + a3804 /* SHARE_MY_BED */
  ++ @6499 + a3804 /* SHARE_MY_BED */
  ++ @6502 + a3806 /* NO_WAY_THIS_OR_ANY_NIGHT */
  ++ @6494 + a3807 /* TONIGHT_HAVE_HEADACHE */
  ++ @6503 + a3808 /* PC_HAVING_AFFAIR */
  ++ @6504 + a4159 /* ARAN_MOON_SLEEP_2_EXIT */
END

IF ~~ a3810 /* UNSURE_SECOND */
  SAY @6500
  ++ @6501 + a3804 /* SHARE_MY_BED */
  ++ @6499 + a3804 /* SHARE_MY_BED */
  ++ @6505 + a3806 /* NO_WAY_THIS_OR_ANY_NIGHT */
  ++ @6494 + a3811 /* ARAN_DECIDES_NO */
  ++ @6503 + a3808 /* PC_HAVING_AFFAIR */
  ++ @6504 + a4159 /* ARAN_MOON_SLEEP_2_EXIT */
  + ~RandomNum(2,1)~ + @6506 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(2,2)~ + @6506 + a4070 /* ROM_FRIENDS_EXIT_THREE */
END

IF ~~ a3805 /* GET_YOUR_BUTT_IN_HERE_NOW */
  SAY @6507
  IF ~~ THEN GOTO a3804 /* SHARE_MY_BED */
END

IF ~~ a3808 /* PC_HAVING_AFFAIR */
  SAY @6508
  IF ~~ THEN GOTO a3804 /* SHARE_MY_BED */
END

IF ~~ a3803 /* PC_DEMANDS_STRENGTH */
  SAY @6509
  ++ @6510 + a3806 /* NO_WAY_THIS_OR_ANY_NIGHT */
  ++ @6511 + a3812 /* ALL_I_AM_TO_YOU */
  ++ @6512 + a3813 /* PC_WANTS_ROUGHER */
  ++ @6513 + a3804 /* SHARE_MY_BED */
  ++ @6514 + a3814 /* GET_OUT_EXIT */
  ++ @6515 + a4159 /* ARAN_MOON_SLEEP_2_EXIT */
END

IF ~~ a3812 /* ALL_I_AM_TO_YOU */
  SAY @6516
  ++ @6517 + a3813 /* PC_WANTS_ROUGHER */
  ++ @6518 + a3815 /* DO_YOU_EVEN_KNOW_ME */
  ++ @6519 + a3816 /* FINE_IF_WANT_THAT_WAY */
  ++ @6520 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3817 /* ROM_ONE_SLAP_AVOID */
  ++ @6521 + a3818 /* PLEASING_YOU_PLEASES_ME */
  ++ @12476 + a3819 /* UNFULFILLED_TEASED_EXIT */
END

IF ~~ a3804 /* SHARE_MY_BED */
  SAY @6523
  + ~GlobalLT("c-aransex","GLOBAL",4) OR(4) Race(Player1,ELF) Race(Player1,HALF_ELF) Race(Player1,DWARF) Race(Player1,HALFLING)~ + @6524 + a3820 /* PC_IS_SMALL */
  + ~Global("c-aransex","GLOBAL",4) OR(4) Race(Player1,ELF) Race(Player1,HALF_ELF) Race(Player1,DWARF) Race(Player1,HALFLING)~ + @6525 + a3820 /* PC_IS_SMALL */
  ++ @6526 + a3821 /* GET_MORE_THEN_YOU_EXPECT */
  ++ @6527 + a3822 /* SAUCE_FOR_GOOSE_GANDER */
  ++ @6528 + a3823 /* PC_IS_ON_BACK */
  ++ @6529 + a3824 /* LINING_UP_NICELY */
  ++ @6530 + a4148 /* FRONT_TO_ARAN_FINGERS */
  ++ @6531 + a3806 /* NO_WAY_THIS_OR_ANY_NIGHT */
END

IF ~~ a3820 /* PC_IS_SMALL */
  SAY @6532
  = @6533
  ++ @6526 + a3821 /* GET_MORE_THEN_YOU_EXPECT */
  ++ @6534 + a3822 /* SAUCE_FOR_GOOSE_GANDER */
  ++ @6528 + a3823 /* PC_IS_ON_BACK */
  ++ @6529 + a3824 /* LINING_UP_NICELY */
  ++ @6535 + a3825 /* GO_GENTLY_PLEASE */
  ++ @6531 + a3806 /* NO_WAY_THIS_OR_ANY_NIGHT */
END

IF ~~ a3813 /* PC_WANTS_ROUGHER */
  SAY @6536
  ++ @6537 + a3826 /* YOU_CALL_THAT_ROUGH */
  ++ @6538 + a3826 /* YOU_CALL_THAT_ROUGH */
  ++ @6542 + a3812 /* ALL_I_AM_TO_YOU */
  ++ @6543 + a3825 /* GO_GENTLY_PLEASE */
  ++ @6544 + a3819 /* UNFULFILLED_TEASED_EXIT */
END

IF ~~ a3827 /* WAIT_WE_WERE_LOVING */
  SAY @6545
  ++ @6546 + a3828 /* CANT_RESIST_MUST_RESIST */
  ++ @6547 + a3826 /* YOU_CALL_THAT_ROUGH */
  ++ @6548 + a3818 /* PLEASING_YOU_PLEASES_ME */
  ++ @6549 + a3818 /* PLEASING_YOU_PLEASES_ME */
  ++ @6550 + a3819 /* UNFULFILLED_TEASED_EXIT */
END

IF ~~ a3826 /* YOU_CALL_THAT_ROUGH */
  SAY @6551
  ++ @6552 + a3829 /* PC_TURNS_TABLES */
  ++ @6553 + a3830 /* PC_FACE_DOWN_FINISH */
  + ~RandomNum(2,2)~ + @6554 + a3831 /* IN_NINE_HELLS */
  + ~RandomNum(2,1)~ + @6554 + a3832 /* PC_TAUNT_PERHAPS_NOT */
  ++ @6555 + a3819 /* UNFULFILLED_TEASED_EXIT */
  + ~RandomNum(2,2)~ + @6556 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6556 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
END

IF ~~ a3832 /* PC_TAUNT_PERHAPS_NOT */
  SAY @6557
  = @6558
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ a3829 /* PC_TURNS_TABLES */
  SAY @6559
  = @12477
  ++ @6561 + a3835 /* PC_RAKES_CHEST */
  ++ @6562 + a3828 /* CANT_RESIST_MUST_RESIST */
  ++ @6563 + a3828 /* CANT_RESIST_MUST_RESIST */
  ++ @6564 + a3836 /* KISS_AND_TAKE */
  ++ @6565 + a3827 /* WAIT_WE_WERE_LOVING */
  ++ @6566 + a3828 /* CANT_RESIST_MUST_RESIST */
END

IF ~~ a3825 /* GO_GENTLY_PLEASE */
  SAY @6567
  = @6568
  ++ @6569 + a3837 /* ENDGAME_OF_TEASING */
  ++ @6570 + a3806 /* NO_WAY_THIS_OR_ANY_NIGHT */
  ++ @6571 + a3837 /* ENDGAME_OF_TEASING */
  ++ @6572 + a3837 /* ENDGAME_OF_TEASING */
  ++ @6573 + a4148 /* FRONT_TO_ARAN_FINGERS */
END

IF ~~ a3824 /* LINING_UP_NICELY */
  SAY @6574
  ++ @6575 + a3838 /* LINING_NICELY_ENDING */
  ++ @6576 + a3828 /* CANT_RESIST_MUST_RESIST */
  ++ @6577 + a3828 /* CANT_RESIST_MUST_RESIST */
  ++ @6565 + a3827 /* WAIT_WE_WERE_LOVING */
  ++ @6566 + a3828 /* CANT_RESIST_MUST_RESIST */
  ++ @6578 + a3819 /* UNFULFILLED_TEASED_EXIT */
END

IF ~~ a3838 /* LINING_NICELY_ENDING */
  SAY @6579
  ++ @6580 + a4231 /* TRANSITION_TO_ARAN_RELEASE */
  ++ @6581 + a3823 /* PC_IS_ON_BACK */
  ++ @6582 + a4226 /* WAIT_PLEASE */
  ++ @6583 + a3819 /* UNFULFILLED_TEASED_EXIT */
  + ~RandomNum(2,2)~ + @6584 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6584 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
END

IF ~~ a4226 /* WAIT_PLEASE */
  SAY @6585
  ++ @6586 + a3815 /* DO_YOU_EVEN_KNOW_ME */
  ++ @6584 + a4227 /* BARN_DOOR */
  ++ @6587 + a3844 /* ARAN_ADMITS_VULNERABLE */
  ++ @6588 + a4229 /* IM_SCARED */
END

IF ~~ a4227 /* BARN_DOOR */
  SAY @6589
  ++ @6590 + a4228 /* WALK_AWAY */
  ++ @6591 + a3837 /* ENDGAME_OF_TEASING */
  ++ @6592 + a3837 /* ENDGAME_OF_TEASING */
  ++ @6588 + a4229 /* IM_SCARED */
  ++ @6593 + a4230
  ++ @6594 + a4230
END

IF ~~ a4228 /* WALK_AWAY */
  SAY @6595
  IF ~~ THEN EXIT
END

IF ~~ a4229 /* IM_SCARED */
  SAY @6596
  + ~RandomNum(4,1)~ + @6597 + a4011
  + ~RandomNum(4,2)~ + @6597 + a4012
  + ~RandomNum(4,3)~ + @6597 + a4013
  + ~RandomNum(4,4)~ + @6597 + a4014
  ++ @6598 + a4127 /* ROM_TWO_ACTION_GENTLE_TOUCH_FACE */
  ++ @6599 + a3815 /* DO_YOU_EVEN_KNOW_ME */
  ++ @6591 + a3837 /* ENDGAME_OF_TEASING */
  ++ @6593 + a4230
  ++ @6594 + a4230
END

IF ~~ a4230 /* TRANSITION_TO_HOPE */
  SAY @6595
  IF ~~ THEN GOTO a4068 /* ARAN_HOPE_SPRINGS_ETERNAL */
END

IF ~~ a4231 /* TRANSITION_TO_ARAN_RELEASE */
  SAY @6600
  IF ~~ THEN GOTO a4138 /* ARAN_RELEASE */
END

IF ~~ a3828 /* CANT_RESIST_MUST_RESIST */
  SAY @6585
  ++ @6601 + a3839 /* SUNE_CELANIL_ANYONE */
  ++ @6602 + a3818 /* PLEASING_YOU_PLEASES_ME */
  ++ @6603 + a3818 /* PLEASING_YOU_PLEASES_ME */
  ++ @6604 + a3840 /* KISSING_PC_ON_TOP */
  ++ @6605 + a3840 /* KISSING_PC_ON_TOP */
END

IF ~~ a3839 /* SUNE_CELANIL_ANYONE */
  SAY @6606
  ++ @6607 + a3840 /* KISSING_PC_ON_TOP */
  ++ @6608 + a3819 /* UNFULFILLED_TEASED_EXIT */
  ++ @6609 + a3840 /* KISSING_PC_ON_TOP */
  ++ @6583 + a3819 /* UNFULFILLED_TEASED_EXIT */
  ++ @6610 + a3841 /* KISSING_PC_TOP_BREASTS */
  ++ @6611 + a3842 /* FIRST_TIME */
END

IF ~~ a3841 /* KISSING_PC_TOP_BREASTS */
  SAY @6612
  IF ~~ THEN GOTO a4059 /* PC_TOP_GO_ON_OR_NOT */
END

IF ~~ a3840 /* KISSING_PC_ON_TOP */
  SAY @6613
  = @6614
  = @6615
  IF ~~ THEN GOTO a3837 /* ENDGAME_OF_TEASING */
END

IF ~~ a3818 /* PLEASING_YOU_PLEASES_ME */
  SAY @6616
  ++ @6617 + a3837 /* ENDGAME_OF_TEASING */
  ++ @6618 + a3837 /* ENDGAME_OF_TEASING */
  ++ @6619 + a3837 /* ENDGAME_OF_TEASING */
  ++ @6620 + a3842 /* FIRST_TIME */
  ++ @6565 + a3827 /* WAIT_WE_WERE_LOVING */
  ++ @6583 + a3819 /* UNFULFILLED_TEASED_EXIT */
  ++ @6621 + a4159 /* ARAN_MOON_SLEEP_2_EXIT */
  + ~RandomNum(2,2)~ + @6584 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6584 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
END

IF ~~ a3842 /* FIRST_TIME */
  SAY @6622
  ++ @6618 + a3837 /* ENDGAME_OF_TEASING */
  ++ @6623 + a3843 /* ARAN_BACKS_AWAY */
  ++ @6624 + a3844 /* ARAN_ADMITS_VULNERABLE */
  ++ @6619 + a3837 /* ENDGAME_OF_TEASING */
  + ~RandomNum(2,2)~ + @6584 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6584 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  ++ @6583 + a3819 /* UNFULFILLED_TEASED_EXIT */
END

IF ~~ a3844 /* ARAN_ADMITS_VULNERABLE */
  SAY @6625
  IF ~~ THEN GOTO a3837 /* ENDGAME_OF_TEASING */
END

/* yeah, right - only in a fantasy novel. For dudes, way fun; probably not so fun for females. But hey, this is romantic fiction, supposedly, so things will be all happy happy... and just for fun, write two states into one, 50/50 chance */
IF ~~ a3843 /* ARAN_BACKS_AWAY */
  SAY @6626
  + ~RandomNum(2,2)~ + @6627 + a3845 /* PC_ON_BACK_ONE */
  + ~RandomNum(2,1)~ + @6627 + a3846 /* PC_ON_BACK_TWO */
  + ~RandomNum(2,2)~ + @6628 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6628 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  + ~RandomNum(2,2)~ + @6629 + a3837 /* ENDGAME_OF_TEASING */
  + ~RandomNum(2,1)~ + @6629 + a3837 /* ENDGAME_OF_TEASING */
  + ~RandomNum(2,2)~ + @6630 + a3847 /* GODS_KNOW_I_JUST_GOT_MISUNDERSTOOD */
  + ~RandomNum(2,1)~ + @6630 + a3848 /* GODS_KNOW_I_JUST_GOT_CONFUSED */
  + ~RandomNum(2,2)~ + @6631 + a3849 /* SCARED_BUT_TYMORA_LIKES */
  + ~RandomNum(2,1)~ + @6631 + a3850 /* BLIGHTED_SCARED_OF_BOTH */
END

IF ~~ a3833 /* ARAN_AGREES_ONE_CUDDLE */
  SAY @6632
  IF ~~ THEN GOTO a3851 /* CUDDLING_END */
END

IF ~~ a3834 /* ARAN_AGREES_TWO_CUDDLE */
  SAY @6633
  IF ~~ THEN GOTO a3851 /* CUDDLING_END */
END

IF ~~ a3847 /* GODS_KNOW_I_JUST_GOT_MISUNDERSTOOD */
  SAY @6634
  ++ @6635 EXIT
  ++ @6636 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  ++ @6637 + a3852 /* KISSING_EVERY_INCH_OF_ME */
  ++ @6638 + a3812 /* ALL_I_AM_TO_YOU */
END

IF ~~ a3848 /* GODS_KNOW_I_JUST_GOT_CONFUSED */
  SAY @6639
  ++ @6635 EXIT
  ++ @6636 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  ++ @6640 + a4159 /* ARAN_MOON_SLEEP_2_EXIT */
  ++ @6637 + a3852 /* KISSING_EVERY_INCH_OF_ME */
END

IF ~~ a3852 /* KISSING_EVERY_INCH_OF_ME */
  SAY @6641
  = @6642
  IF ~~ THEN GOTO a3837 /* ENDGAME_OF_TEASING */
END
IF ~~ a3849 /* SCARED_BUT_TYMORA_LIKES */
  SAY @6643
  IF ~~ THEN GOTO a3837 /* ENDGAME_OF_TEASING */
END

IF ~~ a3850 /* BLIGHTED_SCARED_OF_BOTH */
  SAY @6644
  IF ~~ THEN GOTO a3837 /* ENDGAME_OF_TEASING */
END

IF ~~ a3821 /* GET_MORE_THEN_YOU_EXPECT */
  SAY @6645
  ++ @6646 + a3822 /* SAUCE_FOR_GOOSE_GANDER */
  ++ @6647 + a3822 /* SAUCE_FOR_GOOSE_GANDER */
  ++ @6648 + a3822 /* SAUCE_FOR_GOOSE_GANDER */
  ++ @6649 + a3827 /* WAIT_WE_WERE_LOVING */
  ++ @6650 + a3853 /* WHAT_ABOUT_HIS_PLAYMATE */
  ++ @6661 + a3819 /* UNFULFILLED_TEASED_EXIT */
END

IF ~~ a3822 /* SAUCE_FOR_GOOSE_GANDER */
  SAY @6651
  IF ~RandomNum(2,2)~ THEN GOTO a3854 /* FINGERTIPS_BRUSH_THIGHS */
  IF ~RandomNum(2,1)~ THEN GOTO a3855 /* FINGERTIPS_BRUSH_HARDNESS */
END

IF ~~ a3854 /* FINGERTIPS_BRUSH_THIGHS */
  SAY @6652
  ++ @6653 + a3856 /* GRIN_AND_BARE_IT */
  ++ @6530 + a4148 /* FRONT_TO_ARAN_FINGERS */
  ++ @6654 + a3856 /* GRIN_AND_BARE_IT */
  + ~GlobalGT("c-aransex","GLOBAL",1)~ + @6655 + a3856 /* GRIN_AND_BARE_IT */
  + ~GlobalLT("c-aransex","GLOBAL",2)~ + @6656 + a3856 /* GRIN_AND_BARE_IT */
  ++ @6657 + a3815 /* DO_YOU_EVEN_KNOW_ME */
  ++ @6504 + a4159 /* ARAN_MOON_SLEEP_2_EXIT */
  ++ @6661 + a3819 /* UNFULFILLED_TEASED_EXIT */
END

IF ~~ a3855 /* FINGERTIPS_BRUSH_HARDNESS */
  SAY @6658
  ++ @6653 + a3856 /* GRIN_AND_BARE_IT */
  ++ @6659 + a3856 /* GRIN_AND_BARE_IT */
  + ~GlobalGT("c-aransex","GLOBAL",1)~ + @6660 + a3856 /* GRIN_AND_BARE_IT */
  + ~GlobalLT("c-aransex","GLOBAL",2)~ + @6656 + a3856 /* GRIN_AND_BARE_IT */
  ++ @6661 + a3819 /* UNFULFILLED_TEASED_EXIT */
END

IF ~~ a3853 /* WHAT_ABOUT_HIS_PLAYMATE */
  SAY @6662
  ++ @6663 + a3856 /* GRIN_AND_BARE_IT */
  ++ @6664 + a3856 /* GRIN_AND_BARE_IT */
  + ~Global("c-aransex","GLOBAL",4)~ + @6665 + a3856 /* GRIN_AND_BARE_IT */
  + ~GlobalLT("c-aransex","GLOBAL",4)~ + @6666 + a3856 /* GRIN_AND_BARE_IT */
  ++ @6667 + a3856 /* GRIN_AND_BARE_IT */
  ++ @6668 + a3815 /* DO_YOU_EVEN_KNOW_ME */
  ++ @6661 + a3819 /* UNFULFILLED_TEASED_EXIT */
END

IF ~~ a3816 /* FINE_IF_WANT_THAT_WAY */
  SAY @6669
  = @6670
  ++ @6537 + a3826 /* YOU_CALL_THAT_ROUGH */
  ++ @6538 + a3826 /* YOU_CALL_THAT_ROUGH */
  ++ @6668 + a3815 /* DO_YOU_EVEN_KNOW_ME */
  ++ @6543 + a3825 /* GO_GENTLY_PLEASE */
  ++ @6544 + a3819 /* UNFULFILLED_TEASED_EXIT */
END

IF ~~ a3815 /* DO_YOU_EVEN_KNOW_ME */
  SAY @6679
  = @6680
  = @6681
  ++ @6682 + a3857 /* AND_THE_HORSE_YOU_RODE_IN_ON_BIATCH */
  ++ @6683 + a3858 /* SOUNDED_LIKE_TEEN_SPIRIT */
  ++ @6684 + a3857 /* AND_THE_HORSE_YOU_RODE_IN_ON_BIATCH */
  ++ @6685 + a3859 /* AT_LEAST_JOB_IS_HONORABLE */
  ++ @6686 + a3858 /* SOUNDED_LIKE_TEEN_SPIRIT */
  ++ @6687 + a4229 /* IM_SCARED */
END

IF ~~ a3856 /* GRIN_AND_BARE_IT */
  SAY @6688
  ++ @6689 + a3823 /* PC_IS_ON_BACK */
  ++ @6690 + a3860 /* MOVING_ON_BACK */
  ++ @6691 + a3823 /* PC_IS_ON_BACK */
  ++ @6692 + a3860 /* MOVING_ON_BACK */
  ++ @6530 + a4148 /* FRONT_TO_ARAN_FINGERS */
  ++ @6693 + a4159 /* ARAN_MOON_SLEEP_2_EXIT */
  ++ @6694 + a3819 /* UNFULFILLED_TEASED_EXIT */
END

IF ~~ a3860 /* MOVING_ON_BACK */
  SAY @6695
  IF ~~ THEN GOTO a3823 /* PC_IS_ON_BACK */
END

IF ~~ a3823 /* PC_IS_ON_BACK */
  SAY @6696
  IF ~~ THEN GOTO a3837 /* ENDGAME_OF_TEASING */
END

/* III. From Within Inn Flirts: Looking */
IF ~~ a3861 /* PC_1_LOOKING */
  SAY @6697
  ++ @6698 + a3862 /* FEM_LEAD_1 */
  ++ @6699 + a3863 /* MALE_LEAD_1 */
  ++ @6700 + a3864 /* FEMALE_EXITS */
  ++ @6701 + a3865 /* LOOKING_MAKE_MIND */
  ++ @6702 + a3865 /* LOOKING_MAKE_MIND */
  ++ @6703 + a3866 /* FIGHT_EXIT */
END

IF ~~ a3865 /* LOOKING_MAKE_MIND */
  SAY @6704
  ++ @6705 + a3862 /* FEM_LEAD_1 */
  + ~Global("c-aransex","GLOBAL",0)~ + @6706 + a3863 /* MALE_LEAD_1 */
  + ~Global("c-aransex","GLOBAL",1)~ + @6707 + a3863 /* MALE_LEAD_1 */
  + ~Global("c-aransex","GLOBAL",2)~ + @6708 + a3863 /* MALE_LEAD_1 */
  + ~Global("c-aransex","GLOBAL",3)~ + @6709 + a3863 /* MALE_LEAD_1 */
  + ~Global("c-aransex","GLOBAL",4)~ + @6710 + a3863 /* MALE_LEAD_1 */
  ++ @6711 + a3862 /* FEM_LEAD_1 */
  ++ @6712 + a3814 /* GET_OUT_EXIT */
  ++ @6713 + a3866 /* FIGHT_EXIT */
  ++ @6714 + a3867 /* LOOKING_JUST_FRIENDS */
  ++ @6715 + a3864 /* FEMALE_EXITS */
END

IF ~~ a3862 /* FEM_LEAD_1 */
  SAY @6716
  IF ~~ THEN GOTO a3868 /* LOOKING_ARAN_RESPONDS */
END

IF ~~ a3863 /* MALE_LEAD_1 */
  SAY @6717
  IF ~~ THEN GOTO a3868 /* LOOKING_ARAN_RESPONDS */
END

IF ~~ a3867 /* LOOKING_JUST_FRIENDS */
  SAY @6718
  ++ @6719 + a3862 /* FEM_LEAD_1 */
  ++ @6720 + a3863 /* MALE_LEAD_1 */
  ++ @6721 + a3863 /* MALE_LEAD_1 */
  ++ @6722 + a3863 /* MALE_LEAD_1 */
  ++ @6723 + a3866 /* FIGHT_EXIT */
  ++ @6724 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6725 + a3869 /* JUST_FRIENDS_INN_EXIT */
END

IF ~~ a3868 /* LOOKING_ARAN_RESPONDS */
  SAY @12478
  ++ @6727 + a3870 /* LOOKING_ARAN_2_RESPONDS */
  ++ @6728 + a3870 /* LOOKING_ARAN_2_RESPONDS */
  ++ @6729 + a3866 /* FIGHT_EXIT */
  ++ @6730 + a3871 /* LOOKING_1_UNSURE */
  ++ @6731 + a3871 /* LOOKING_1_UNSURE */
  ++ @6732 + a3866 /* FIGHT_EXIT */
END

IF ~~ a3871 /* LOOKING_1_UNSURE */
  SAY @6733
  ++ @6735 + a3872 /* SOUL_PASSTHROUGH */
  ++ @6736 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6737 + a3873 /* MAKEOUT_INN_EXIT */
  ++ @6738 + a3870 /* LOOKING_ARAN_2_RESPONDS */
  ++ @6739 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6740 + a3869 /* JUST_FRIENDS_INN_EXIT */
END

IF ~~ a3872 /* SOUL_PASSTHROUGH */
  SAY @6741
  ++ @6742 + a3874 /* NO_I_DONT */
  ++ @6743 + a3875 /* NO_HARM */
  ++ @6744 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6737 + a3873 /* MAKEOUT_INN_EXIT */
  ++ @6740 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6745 + a3869 /* JUST_FRIENDS_INN_EXIT */
END

IF ~~ a3870 /* LOOKING_ARAN_2_RESPONDS */
  SAY @6746
  ++ @6747 + a3876 /* LOOKING_3_RESPOND */
  ++ @6748 + a3876 /* LOOKING_3_RESPOND */
  ++ @6749 + a3876 /* LOOKING_3_RESPOND */
  ++ @6750 + a3877 /* CROSSED_LINE */
  ++ @6751 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6752 + a3878 /* LOOKING_4_RESPOND */
  ++ @6753 + a3873 /* MAKEOUT_INN_EXIT */
END

IF ~~ a3874 /* NO_I_DONT */
  SAY @6754
  = @6755
  ++ @6738 + a3870 /* LOOKING_ARAN_2_RESPONDS */
  ++ @6740 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6756 + a3866 /* FIGHT_EXIT */
  ++ @6757 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6758 + a3870 /* LOOKING_ARAN_2_RESPONDS */
  ++ @6759 + a3869 /* JUST_FRIENDS_INN_EXIT */
END

IF ~~ a3875 /* NO_HARM */
  SAY @6760
  ++ @6738 + a3870 /* LOOKING_ARAN_2_RESPONDS */
  ++ @6761 + a3866 /* FIGHT_EXIT */
  ++ @6740 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6762 + a3878 /* LOOKING_4_RESPOND */
  ++ @6763 + a3864 /* FEMALE_EXITS */
END

IF ~~ a3877 /* CROSSED_LINE */
  SAY @6764
  ++ @6765 + a3879 /* WANT_YOU */
  ++ @6766 + a3866 /* FIGHT_EXIT */
  ++ @6738 + a3876 /* LOOKING_3_RESPOND */
  ++ @6740 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6767 + a3880 /* YELP_PASSTHROUGH */
END

IF ~~ a3879 /* WANT_YOU */
  SAY @6768
  ++ @6769 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6770 + a3878 /* LOOKING_4_RESPOND */
  ++ @6757 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6771 + a3866 /* FIGHT_EXIT */
  ++ @6772 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6773 + a3878 /* LOOKING_4_RESPOND */
END

IF ~~ a3880 /* YELP_PASSTHROUGH */
  SAY @6774
  ++ @6775 + a3876 /* LOOKING_3_RESPOND */
  ++ @6776 + a3876 /* LOOKING_3_RESPOND */
  ++ @6777 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3881 /* LOOKING_ADVANCE_INTIMATE */
  ++ @6778 + a3876 /* LOOKING_3_RESPOND */
  ++ @6779 + a3866 /* FIGHT_EXIT */
  ++ @6780 + a3869 /* JUST_FRIENDS_INN_EXIT */
END

IF ~~ a3881 /* LOOKING_ADVANCE_INTIMATE */
  SAY @6781
  ++ @6782 + a3878 /* LOOKING_4_RESPOND */
  ++ @6783 + a3878 /* LOOKING_4_RESPOND */
  ++ @6784 + a3866 /* FIGHT_EXIT */
  ++ @6785 + a3878 /* LOOKING_4_RESPOND */
  ++ @6786 + a3873 /* MAKEOUT_INN_EXIT */
  ++ @6787 + a3876 /* LOOKING_3_RESPOND */
END

IF ~~ a3876 /* LOOKING_3_RESPOND */
  SAY @6788
  ++ @6782 + a3878 /* LOOKING_4_RESPOND */
  ++ @6789 + a3878 /* LOOKING_4_RESPOND */
  ++ @6790 + a3878 /* LOOKING_4_RESPOND */
  ++ @6784 + a3866 /* FIGHT_EXIT */
  ++ @6783 + a3878 /* LOOKING_4_RESPOND */
  ++ @6791 + a3878 /* LOOKING_4_RESPOND */
  ++ @6757 + a3869 /* JUST_FRIENDS_INN_EXIT */
END

IF ~~ a3878 /* LOOKING_4_RESPOND */
  SAY @6792
  ++ @6793 + a3882 /* SLEEP_NOW_PASSTHROUGH */
  ++ @6794 + a3882 /* SLEEP_NOW_PASSTHROUGH */
  ++ @6795 + a3883 /* MOVE_TO_AREA */
  ++ @6796 + a3883 /* MOVE_TO_AREA */
  ++ @6797 + a3873 /* MAKEOUT_INN_EXIT */
  ++ @6798 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6799 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6800 + a3814 /* GET_OUT_EXIT */
END

IF ~~ a3883 /* MOVE_TO_AREA */
  SAY @6801
  IF ~~ THEN GOTO a3882 /* SLEEP_NOW_PASSTHROUGH */
END

IF ~~ a3882 /* SLEEP_NOW_PASSTHROUGH */
  SAY @6802
  ++ @6803 + a3884 /* SLEEP_NOW_INN_0_EXIT */
  ++ @6804 + a3869 /* JUST_FRIENDS_INN_EXIT */
  ++ @6805 + a3885 /* SLEEP_NOW_INN_1_EXIT */
  ++ @6806 + a3886 /* SLEEP_NOW_INN_2_EXIT */
  ++ @6807 + a3887 /* SLEEP_NOW_INN_3_EXIT */
  ++ @6808 + a3888 /* SLEEP_NOW_INN_4_EXIT */
  ++ @6809 + a3886 /* SLEEP_NOW_INN_2_EXIT */
  ++ @6810 + a3814 /* GET_OUT_EXIT */
END

/* IV:  From Within Inn Flirts: Walking At Day Encounter */

IF ~~ a3889 /* PC_OUTDOOR_PLACE */
  SAY @6811
  ++ @6812 + a3890 /* FEM_LEAD_1_ACTION */
  ++ @6813 + a3891 /* ARAN_LEAD_TRIP_ACTION */
  ++ @6814 + a3892 /* FEMALE_LEAVES */
  ++ @6815 + a3893 /* ARAN_UNDECIDED_OUTDOOR */
  ++ @6816 + a3893 /* ARAN_UNDECIDED_OUTDOOR */
  ++ @6817 + a3814 /* GET_OUT_EXIT */
END

IF ~~ a3893 /* ARAN_UNDECIDED_OUTDOOR */  /* try not to advance action on this one. Not every state needs to move forward - in RL, relationship plateaus exist. (edit: 7 choices) */
  SAY @6818
  ++ @6819 + a3890 /* FEM_LEAD_1_ACTION */
  /* advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @6820 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @6821 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @6822 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @6823 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @6824 + a3894 /* ARAN_LEAD_1_ACTION */
  /* advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @6825 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @4842 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @6826 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @4844 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @4845 + a3894 /* ARAN_LEAD_1_ACTION */
  ++ @6827 + a3814 /* GET_OUT_EXIT */
  ++ @6828 + a3814 /* GET_OUT_EXIT */
  ++ @6829 + a4060 /* FRIEND_OUTDOOR_BENEFITS */
  ++ @6715 + a3892 /* FEMALE_LEAVES */
END

IF ~~ a3891 /* ARAN_LEAD_TRIP_ACTION */
  SAY @6830
  = @6831
  ++ @6832 + a3894 /* ARAN_LEAD_1_ACTION */
  /* advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @6833 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @6834 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @6835 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @6836 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @6837 + a3894 /* ARAN_LEAD_1_ACTION */
  /* advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @6825 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @4842 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @6826 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @4844 + a3895 /* FEM_LEAD_2_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @4845 + a3894 /* ARAN_LEAD_1_ACTION */
  ++ @6838 + a3890 /* FEM_LEAD_1_ACTION */
  ++ @6839 + a3895 /* FEM_LEAD_2_ACTION */
  ++ @6840 + a3896 /* WALK_HANDHOLDING_EXIT */
  ++ @6841 + a3814 /* GET_OUT_EXIT */
END

IF ~~ a3890 /* FEM_LEAD_1_ACTION */
  SAY @1997
  = @6842
  IF ~~ THEN DO ~SetGlobal("c-intimate","GLOBAL",1)~ GOTO a3897 /* ARAN_OUTDOOR_1_RESPONSE */
END

IF ~~ a3895 /* FEM_LEAD_2_ACTION */
  SAY @6843
  ++ @6844 + a3814 /* GET_OUT_EXIT */
  ++ @6845 + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  ++ @6846 + a3899 /* ACTION_DELAY */
  ++ @6847 + a3899 /* ACTION_DELAY */
  ++ @6848 + a3899 /* ACTION_DELAY */
  ++ @6849 + a3900 /* JUST_FRIENDS_EXIT */
  + ~Global("c-aransex","GLOBAL",0)~ + @6825 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @4842 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @6826 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @4844 + a3895 /* FEM_LEAD_2_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @4845 + a3894 /* ARAN_LEAD_1_ACTION */
END

IF ~~ a3899 /* ACTION_DELAY */
  SAY @6850
  IF ~~ THEN GOTO a3894 /* ARAN_LEAD_1_ACTION */
END

IF ~~ a4060 /* FRIEND_OUTDOOR_BENEFITS */
  SAY @6851
  ++ @6852 + a3890 /* FEM_LEAD_1_ACTION */
  ++ @6853 + a3894 /* ARAN_LEAD_1_ACTION */
  /* advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @6721 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @6854 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @6855 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @6856 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @6857 + a3894 /* ARAN_LEAD_1_ACTION */
  /* advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @6825 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @4842 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @6826 + a3894 /* ARAN_LEAD_1_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @4844 + a3895 /* FEM_LEAD_2_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @4845 + a3894 /* ARAN_LEAD_1_ACTION */
  ++ @6858 + a4216 /* MOON_ADVANCE_ACTION */
  ++ @6859 + a3900 /* JUST_FRIENDS_EXIT */
  ++ @6860 + a3901 /* ARAN_RECHECK_WANTED_RESPONSE */
  ++ @6725 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a3894 /* ARAN_LEAD_1_ACTION */
  SAY @6861
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ GOTO a3897 /* ARAN_OUTDOOR_1_RESPONSE */
END

IF ~~ a3897 /* ARAN_OUTDOOR_1_RESPONSE */  /* edit: 8 possible replies */
  SAY @6862
  ++ @6727 + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  ++ @6863 + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  ++ @6864 + a3814 /* GET_OUT_EXIT */
  ++ @6865 + a3901 /* ARAN_RECHECK_WANTED_RESPONSE */
  ++ @6731 + a3901 /* ARAN_RECHECK_WANTED_RESPONSE */
  ++ @6866 + a3900 /* JUST_FRIENDS_EXIT */
  + ~Global("c-aransex","GLOBAL",0)~ + @6867 + a3902 /* ACTION_PASSTHROUGH */
  + ~Global("c-aransex","GLOBAL",1)~ + @6867 + a3902 /* ACTION_PASSTHROUGH */
  + ~Global("c-aransex","GLOBAL",2)~ + @6867 + a3902 /* ACTION_PASSTHROUGH */
  + ~Global("c-aransex","GLOBAL",3)~ + @6867 + a3902 /* ACTION_PASSTHROUGH */
  + ~Global("c-aransex","GLOBAL",4)~ + @4845 + a3902 /* ACTION_PASSTHROUGH */
  + ~Global("c-aransex","GLOBAL",0)~ + @6825 + a3902 /* ACTION_PASSTHROUGH */
  + ~Global("c-aransex","GLOBAL",1)~ + @4842 + a3902 /* ACTION_PASSTHROUGH */
  + ~Global("c-aransex","GLOBAL",2)~ + @6826 + a3902 /* ACTION_PASSTHROUGH */
  + ~Global("c-aransex","GLOBAL",3)~ + @4844 + a3902 /* ACTION_PASSTHROUGH */
  + ~Global("c-aransex","GLOBAL",4)~ + @4845 + a3902 /* ACTION_PASSTHROUGH */
END

IF ~~ a3901 /* ARAN_RECHECK_WANTED_RESPONSE */
  SAY @6869
  ++ @6870 + a3902 /* ACTION_PASSTHROUGH */
  ++ @6871 + a3902 /* ACTION_PASSTHROUGH */
  ++ @6872 + a3900 /* JUST_FRIENDS_EXIT */
  ++ @6873 + a3903 /* MAKEOUT_IN_SHADOWS */
  ++ @6738 + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  ++ @6858 + a4216 /* MOON_ADVANCE_ACTION */
  ++ @6739 + a3900 /* JUST_FRIENDS_EXIT */
  ++ @6874 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a3902 /* ACTION_PASSTHROUGH */
  SAY @6875
  ++ @6744 + a3900 /* JUST_FRIENDS_EXIT */
  ++ @6876 + a3903 /* MAKEOUT_IN_SHADOWS */
  ++ @6740 + a3900 /* JUST_FRIENDS_EXIT */
  /* advancement possible talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @6877 DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  + ~Global("c-aransex","GLOBAL",1)~ + @6878 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  + ~Global("c-aransex","GLOBAL",2)~ + @6879 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  + ~Global("c-aransex","GLOBAL",3)~ + @6880 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  + ~Global("c-aransex","GLOBAL",4)~ + @6881 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  /* advancement possible no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @6882 DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  + ~Global("c-aransex","GLOBAL",1)~ + @6883 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  + ~Global("c-aransex","GLOBAL",2)~ + @6884 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  + ~Global("c-aransex","GLOBAL",3)~ + @6885 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  + ~Global("c-aransex","GLOBAL",4)~ + @6886 + a3904 /* ARAN_HEAVY_RESPONSE */
  ++ @6887 + a3896 /* WALK_HANDHOLDING_EXIT */
  ++ @6739 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a3904 /* ARAN_HEAVY_RESPONSE */
  SAY @6888
  ++ @6889 + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  ++ @12479 + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  ++ @6891 + a3906 /* ARAN_QUESTIONING */
  ++ @6892 + a3908 /* ARAN_RIGHT_THEN */
  ++ @6893 + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  ++ @6894 + a3906 /* ARAN_QUESTIONING */
END

IF ~~ a3906 /* ARAN_QUESTIONING */
  SAY @6895
  ++ @6896 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3907 /* ARAN_SUNES_BLESSINGS */
  ++ @6897 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3907 /* ARAN_SUNES_BLESSINGS */
  ++ @6898 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  ++ @6899 + a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  ++ @6858 + a4216 /* MOON_ADVANCE_ACTION */
  ++ @6900 + a3908 /* ARAN_RIGHT_THEN */
END

IF ~~ a3898 /* ARAN_OUTDOOR_2_RESPONSE */
  SAY @6901
  /* no heavy kissing yet, moving to heavy kissing */
  + ~Global("c-aransex","GLOBAL",0)~ + @6902 DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  + ~Global("c-aransex","GLOBAL",0)~ + @6903 DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  + ~Global("c-aransex","GLOBAL",0)~ + @6904 DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  + ~Global("c-aransex","GLOBAL",0)~ + @6905 DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  + ~Global("c-aransex","GLOBAL",0)~ + @6906 DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  /* heavy kissing, moving to kissing and touching */
  + ~Global("c-aransex","GLOBAL",1)~ + @6907 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  + ~Global("c-aransex","GLOBAL",1)~ + @6908 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  + ~Global("c-aransex","GLOBAL",1)~ + @6909 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  + ~Global("c-aransex","GLOBAL",1)~ + @6910 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  + ~Global("c-aransex","GLOBAL",1)~ + @6911 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  /* kissing and touching, moving to heavy petting */
  + ~Global("c-aransex","GLOBAL",2)~ + @6912 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3907 /* ARAN_SUNES_BLESSINGS */
  + ~Global("c-aransex","GLOBAL",2)~ + @6913 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3907 /* ARAN_SUNES_BLESSINGS */
  + ~Global("c-aransex","GLOBAL",2)~ + @6914 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3907 /* ARAN_SUNES_BLESSINGS */
  + ~Global("c-aransex","GLOBAL",2)~ + @6915 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3907 /* ARAN_SUNES_BLESSINGS */
  + ~Global("c-aransex","GLOBAL",2)~ + @6916 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3907 /* ARAN_SUNES_BLESSINGS */
  /* heavy petting, moving to intercourse */
  + ~GlobalGT("c-aransex","GLOBAL",2)~ + @6917 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3907 /* ARAN_SUNES_BLESSINGS */
  + ~GlobalGT("c-aransex","GLOBAL",2)~ + @6918 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3907 /* ARAN_SUNES_BLESSINGS */
  + ~GlobalGT("c-aransex","GLOBAL",2)~ + @6919 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3909 /* ARAN_TOO_LATE */
  + ~GlobalGT("c-aransex","GLOBAL",2)~ + @6920 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3909 /* ARAN_TOO_LATE */
  + ~GlobalGT("c-aransex","GLOBAL",2)~ + @6921 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3907 /* ARAN_SUNES_BLESSINGS */
  ++ @6922 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  ++ @6923 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  ++ @6924 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3910 /* DEATH_OF_ME */
END

IF ~~ a3907 /* ARAN_SUNES_BLESSINGS */
  SAY @12480
  = @1997
  ++ @6926 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3910 /* DEATH_OF_ME */
  ++ @6927 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3910 /* DEATH_OF_ME */
  ++ @6928 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3910 /* DEATH_OF_ME */
  ++ @6929 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3910 /* DEATH_OF_ME */
  ++ @6930 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3910 /* DEATH_OF_ME */
  ++ @6931 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3911 /* ARAN_CUDDLE_ON_CHEST */
  ++ @6932 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3912 /* ARAN_REASSURE_OUTDOOR */
END

IF ~~ a3909 /* ARAN_TOO_LATE */
  SAY @6933
  ++ @6934 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3910 /* DEATH_OF_ME */
  ++ @6935 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3910 /* DEATH_OF_ME */
  ++ @6936 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3910 /* DEATH_OF_ME */
  ++ @6937 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3911 /* ARAN_CUDDLE_ON_CHEST */
  ++ @6927 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3910 /* DEATH_OF_ME */
  ++ @6938 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3910 /* DEATH_OF_ME */
  ++ @6939 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3912 /* ARAN_REASSURE_OUTDOOR */
END

IF ~~ a3905 /* ARAN_OUTDOOR_3_RESPONSE */
  SAY @6940
  ++ @6782 DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ + a3913 /* ARAN_OUTDOOR_4_RESPONSE */
  ++ @6941 + a3913 /* ARAN_OUTDOOR_4_RESPONSE */
  ++ @6784 + a3814 /* GET_OUT_EXIT */
  ++ @6942 + a3900 /* JUST_FRIENDS_EXIT */
  ++ @6757 + a3900 /* JUST_FRIENDS_EXIT */
  ++ @6943 DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ + a3913 /* ARAN_OUTDOOR_4_RESPONSE */
  ++ @6944 + a3814 /* GET_OUT_EXIT */
END

IF ~~ a3913 /* ARAN_OUTDOOR_4_RESPONSE */
  SAY @6945
  ++ @6946 + a3903 /* MAKEOUT_IN_SHADOWS */
  ++ @6798 + a3900 /* JUST_FRIENDS_EXIT */
  ++ @6947 + a3892 /* FEMALE_LEAVES */
  ++ @6799 + a3900 /* JUST_FRIENDS_EXIT */
  ++ @6948 + a3911 /* ARAN_CUDDLE_ON_CHEST */
  ++ @6949 + a3896 /* WALK_HANDHOLDING_EXIT */
  ++ @6800 + a3814 /* GET_OUT_EXIT */
END

IF ~~ a3912 /* ARAN_REASSURE_OUTDOOR */
  SAY @6950
  = @6951
  ++ @6952 + a3910 /* DEATH_OF_ME */
  ++ @6953 + a3892 /* FEMALE_LEAVES */
  ++ @6954 + a3900 /* JUST_FRIENDS_EXIT */
  ++ @6955 + a3908 /* ARAN_RIGHT_THEN */
  ++ @6956 + a3911 /* ARAN_CUDDLE_ON_CHEST */
  ++ @6957 + a3896 /* WALK_HANDHOLDING_EXIT */
END

IF ~~ a3908 /* ARAN_RIGHT_THEN */
  SAY @6958
  IF ~~ THEN GOTO a3911 /* ARAN_CUDDLE_ON_CHEST */
END

/* V: From Within Inn Flirts: At Nighttime walk */

IF ~~ a3914 /* PC_NIGHT_WATCH */
  SAY @6959
  ++ @6960 + a3915 /* FEMALE_MOON_LEADS */
  ++ @6961 + a3916 /* ARAN_MOON_LEADS */
  ++ @6962 + a3917 /* ARAN_MOON_FEMALE_EXIT */
  ++ @6963 + a3918 /* ARAN_MOON_MIND */
  ++ @6964 + a3919 /* MOON_JUST_FRIENDS */
  ++ @12481 + a3918 /* ARAN_MOON_MIND */
  ++ @6966 + a3866 /* FIGHT_EXIT */
END

IF ~~ a3919 /* MOON_JUST_FRIENDS */
  SAY @6967
  IF ~~ THEN GOTO a3940 /* CAN_I_KISS_YOU */
END

IF ~~ a3918 /* ARAN_MOON_MIND */
  SAY @6968
  ++ @6969 + a3915 /* FEMALE_MOON_LEADS */
  + ~Global("c-aransex","GLOBAL",0)~ + @6970 + a3916 /* ARAN_MOON_LEADS */
  + ~Global("c-aransex","GLOBAL",1)~ + @6970 + a3920 /* ARAN_MOON_LEADS1 */
  + ~Global("c-aransex","GLOBAL",2)~ + @6970 + a3921 /* ARAN_MOON_LEADS2 */
  + ~Global("c-aransex","GLOBAL",3)~ + @6970 + a3922 /* ARAN_MOON_LEADS3 */
  + ~Global("c-aransex","GLOBAL",4)~ + @6970 + a3923 /* ARAN_MOON_LEADS4 */
  ++ @6971 + a3814 /* GET_OUT_EXIT */
  + ~InParty(Player2) Gender(Player2,MALE) !HasItemEquiped("belt05",Player2) !Name("c-aran",Player2)~ + @6972 + a3924 /* MOON_OTHER_OPTIONS */
  + ~InParty(Player3) Gender(Player3,MALE) !HasItemEquiped("belt05",Player3) !Name("c-aran",Player3)~ + @6973 + a3924 /* MOON_OTHER_OPTIONS */
  + ~InParty(Player4) Gender(Player4,MALE) !HasItemEquiped("belt05",Player4) !Name("c-aran",Player4)~ + @6974 + a3924 /* MOON_OTHER_OPTIONS */
  + ~InParty(Player5) Gender(Player5,MALE) !HasItemEquiped("belt05",Player5) !Name("c-aran",Player5)~ + @6975 + a3924 /* MOON_OTHER_OPTIONS */
  + ~InParty(Player6) Gender(Player6,MALE) !HasItemEquiped("belt05",Player6) !Name("c-aran",Player6)~ + @6976 + a3924 /* MOON_OTHER_OPTIONS */
  + ~Global("c-aransex","GLOBAL",0)~ + @6977 + a3925 /* MOON_JUST_CHASTE_FRIENDS */
  + ~Global("c-aransex","GLOBAL",1)~ + @6977 + a3926 /* MOON_JUST_L1_FRIENDS */
  + ~Global("c-aransex","GLOBAL",2)~ + @6977 + a3927 /* MOON_JUST_L2_FRIENDS */
  + ~Global("c-aransex","GLOBAL",3)~ + @6977 + a3928 /* MOON_JUST_L3_FRIENDS */
  + ~Global("c-aransex","GLOBAL",4)~ + @6977 + a3929 /* MOON_JUST_L4_FRIENDS */
  ++ @6978 + a3930 /* FEMALE_MOON_LEADS2 */
  ++ @6979 + a4336 /* HANDINHAND OR CONFUSED */
END

IF ~~ a3924 /* MOON_OTHER_OPTIONS */
  SAY @12482
  + ~Global("c-aransex","GLOBAL",0)~ + @6977 + a3925 /* MOON_JUST_CHASTE_FRIENDS */
  + ~Global("c-aransex","GLOBAL",1)~ + @6977 + a3926 /* MOON_JUST_L1_FRIENDS */
  + ~Global("c-aransex","GLOBAL",2)~ + @6977 + a3927 /* MOON_JUST_L2_FRIENDS */
  + ~Global("c-aransex","GLOBAL",3)~ + @6977 + a3928 /* MOON_JUST_L3_FRIENDS */
  + ~Global("c-aransex","GLOBAL",4)~ + @6977 + a3929 /* MOON_JUST_L4_FRIENDS */
  ++ @6978 + a3930 /* FEMALE_MOON_LEADS2 */
  + ~InParty(Player2) Gender(Player2,FEMALE) !HasItemEquiped("belt05",Player2) !Name("c-aran",Player2)~ + @6981 + a3933 /* WHERE_DID_THAT_IDEA */
  + ~InParty(Player3) Gender(Player3,FEMALE) !HasItemEquiped("belt05",Player3) !Name("c-aran",Player3)~ + @6982 + a3933 /* WHERE_DID_THAT_IDEA */
  + ~InParty(Player4) Gender(Player4,FEMALE) !HasItemEquiped("belt05",Player4) !Name("c-aran",Player4)~ + @6983 + a3933 /* WHERE_DID_THAT_IDEA */
  + ~InParty(Player5) Gender(Player5,FEMALE) !HasItemEquiped("belt05",Player5) !Name("c-aran",Player5)~ + @6984 + a3933 /* WHERE_DID_THAT_IDEA */
  + ~InParty(Player6) Gender(Player6,FEMALE) !HasItemEquiped("belt05",Player6) !Name("c-aran",Player6)~ + @6985 + a3933 /* WHERE_DID_THAT_IDEA */
  ++ @6979 + a4336 /* HANDINHAND OR CONFUSED */
  ++ @6986 + a3934 /* ARAN_MOON_NOT_PRACTICAL */
  ++ @6987 + a4216 /* MOON_ADVANCE_ACTION */
  ++ @6988 + a3866 /* FIGHT_EXIT */
END

IF ~~ a3934 /* ARAN_MOON_NOT_PRACTICAL */
  SAY @6989
  ++ @6990 + a3935 /* CANT_HAVE_MOON */
  ++ @6991 + a3920 /* ARAN_MOON_LEADS1 */
  ++ @6992 + a3935 /* CANT_HAVE_MOON */
  ++ @6740 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @6993 + a3937 /* ARAN_MOON_PLEASEME */
END

IF ~~ a3935 /* CANT_HAVE_MOON */
  SAY @6994
  = @6995
  ++ @6996 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @6997 + a4216 /* MOON_ADVANCE_ACTION */
  ++ @12483 + a3866 /* FIGHT_EXIT */
  ++ @6999 + a3920 /* ARAN_MOON_LEADS1 */
  ++ @7000 + a4216 /* MOON_ADVANCE_ACTION */
  ++ @7001 + a3938 /* ARAN_HOPELESS_ROMANTIC */
END

IF ~~ a3938 /* ARAN_HOPELESS_ROMANTIC */
  SAY @7002
  ++ @7003 + a3925 /* MOON_JUST_CHASTE_FRIENDS */
  ++ @7004 + a3920 /* ARAN_MOON_LEADS1 */
  ++ @7005 + a3925 /* MOON_JUST_CHASTE_FRIENDS */
  ++ @7006 + a3920 /* ARAN_MOON_LEADS1 */
  ++ @7007 + a3939 /* NOW_YOU_ARE_PLAYING_WITH_MY_MIND */
END

IF ~~ a3933 /* WHERE_DID_THAT_IDEA */
  SAY @7008
  ++ @7009 + a3940 /* CAN_I_KISS_YOU */
  ++ @7010 + a3940 /* CAN_I_KISS_YOU */
  ++ @7011 + a3925 /* MOON_JUST_CHASTE_FRIENDS */
  ++ @7012 + a3940 /* CAN_I_KISS_YOU */
  ++ @7013 + a3930 /* FEMALE_MOON_LEADS2 */
END

IF ~~ a3940 /* CAN_I_KISS_YOU */
  SAY @7014
  ++ @7003 + a3925 /* MOON_JUST_CHASTE_FRIENDS */
  ++ @7004 + a3920 /* ARAN_MOON_LEADS1 */
  ++ @7005 + a3925 /* MOON_JUST_CHASTE_FRIENDS */
  ++ @7006 + a3920 /* ARAN_MOON_LEADS1 */
  ++ @7015 + a3934 /* ARAN_MOON_NOT_PRACTICAL */
END

IF ~~ a3915 /* FEMALE_MOON_LEADS */
  SAY @7016
  IF ~~ THEN GOTO a3941 /* MOON_ARAN_ACTS */
END

IF ~~ a3930 /* FEMALE_MOON_LEADS2 */
  SAY @7017
  IF ~~ THEN GOTO a3920 /* ARAN_MOON_LEADS1 */
END

IF ~~ a3916 /* ARAN_MOON_LEADS */
  SAY @7018
  IF ~~ THEN GOTO a3941 /* MOON_ARAN_ACTS */
END

IF ~~ a3920 /* ARAN_MOON_LEADS1 */
  SAY @7019
  IF ~~ THEN GOTO a3931 /* MOON_RECHECK */
END

IF ~~ a3921 /* ARAN_MOON_LEADS2 */
  SAY @7020
  IF ~~ THEN GOTO a3931 /* MOON_RECHECK */
END

IF ~~ a3922 /* ARAN_MOON_LEADS3 */
  SAY @7021
  IF ~~ THEN GOTO a3931 /* MOON_RECHECK */
END

IF ~~ a3923 /* ARAN_MOON_LEADS4 */
  SAY @7022
  IF ~~ THEN GOTO a3931 /* MOON_RECHECK */
END

IF ~~ a3925 /* MOON_JUST_CHASTE_FRIENDS */
  SAY @7023
  ++ @7024 + a3915 /* FEMALE_MOON_LEADS */
  ++ @7025 + a3916 /* ARAN_MOON_LEADS */
  ++ @7026 + a3916 /* ARAN_MOON_LEADS */
  ++ @7027 + a3866 /* FIGHT_EXIT */
  ++ @7028 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7029 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
END

IF ~~ a3926 /* MOON_JUST_L1_FRIENDS */
  SAY @7030
  ++ @7024 + a3915 /* FEMALE_MOON_LEADS */
  ++ @7025 + a3916 /* ARAN_MOON_LEADS */
  ++ @7026 + a3916 /* ARAN_MOON_LEADS */
  ++ @7027 + a3866 /* FIGHT_EXIT */
  ++ @7028 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7029 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
END

IF ~~ a3927 /* MOON_JUST_L2_FRIENDS */
  SAY @7031
  ++ @7024 + a3915 /* FEMALE_MOON_LEADS */
  ++ @7025 + a3916 /* ARAN_MOON_LEADS */
  ++ @7026 + a3916 /* ARAN_MOON_LEADS */
  ++ @7027 + a3866 /* FIGHT_EXIT */
  ++ @7032 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
END

IF ~~ a3928 /* MOON_JUST_L3_FRIENDS */
  SAY @7033
  ++ @7024 + a3915 /* FEMALE_MOON_LEADS */
  ++ @7025 + a3916 /* ARAN_MOON_LEADS */
  ++ @7026 + a3916 /* ARAN_MOON_LEADS */
  ++ @6743 + a3942 /* MOON_NOHARM */
  ++ @7027 + a3866 /* FIGHT_EXIT */
  ++ @7034 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
END

IF ~~ a3929 /* MOON_JUST_L4_FRIENDS */
  SAY @7035
  ++ @7024 + a3915 /* FEMALE_MOON_LEADS */
  ++ @7025 + a3916 /* ARAN_MOON_LEADS */
  ++ @7026 + a3916 /* ARAN_MOON_LEADS */
  ++ @7027 + a3866 /* FIGHT_EXIT */
  ++ @7036 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @6743 + a3942 /* MOON_NOHARM */
END

IF ~~ a3941 /* MOON_ARAN_ACTS */
  SAY @7037
  ++ @6727 + a3943 /* ARAN_MOON_2_RESPOND */
  ++ @7038 + a3943 /* ARAN_MOON_2_RESPOND */
  ++ @7039 + a3866 /* FIGHT_EXIT */
  ++ @7040 + a4336 /* HANDINHAND OR CONFUSED */
  ++ @7041 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7042 + a3944 /* START_NINE_HELLS_PC_ACTION */
  ++ @7043 + a3945 /* MOON_DO_NOT */
END

IF ~~ a4336 /* HANDINHAND OR CONFUSED */
  SAY @7050
  ++ @12484 + a3946 /* ROM_ONE_WARM_LIPS */
  ++ @7046 + a3947 /* ROM_ONE_KISS_ME_AGAIN */
  ++ @12485 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @6737 + a4161 /* ARAN_MOON_SLEEP_1_EXIT */
  ++ @7048 + a3943 /* ARAN_MOON_2_RESPOND */
  ++ @7051 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7052 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7049 + a3866 /* FIGHT_EXIT */
END

IF ~~ a3931 /* MOON_RECHECK */
  SAY @7044
  ++ @7045 + a3946 /* ROM_ONE_WARM_LIPS */
  ++ @7046 + a3947 /* ROM_ONE_KISS_ME_AGAIN */
  ++ @7047 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @6737 + a4161 /* ARAN_MOON_SLEEP_1_EXIT */
  ++ @7048 + a3943 /* ARAN_MOON_2_RESPOND */
  ++ @6739 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7049 + a3866 /* FIGHT_EXIT */
END

IF ~~ a3943 /* ARAN_MOON_2_RESPOND */
  SAY @6746
  ++ @6747 + a3949 /* ARAN_MOON_3_RESPOND */
  ++ @6748 + a3949 /* ARAN_MOON_3_RESPOND */
  ++ @6750 + a3950 /* MOON_CROSSEDLINE */
  ++ @6751 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7053 + a3951 /* ARAN_MOON_4_RESPOND */
  ++ @7054 + a3948 /* ARAN_MOON_MAKEOUT_EXIT */
END

IF ~~ a3945 /* MOON_DO_NOT */
  SAY @7055
  ++ @7056 + a3943 /* ARAN_MOON_2_RESPOND */
  ++ @7057 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7058 + a3952 /* MOON_IRENICUS */
  ++ @6757 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7059 + a3943 /* ARAN_MOON_2_RESPOND */
  ++ @6759 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
END

IF ~~ a3952 /* MOON_IRENICUS */
  SAY @7060
  = @7061
  IF ~~ THEN EXIT
END

IF ~~ a3942 /* MOON_NOHARM */
  SAY @7062
  ++ @7056 + a3943 /* ARAN_MOON_2_RESPOND */
  ++ @6761 + a3866 /* FIGHT_EXIT */
  ++ @6740 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @6993 + a3937 /* ARAN_MOON_PLEASEME */
  ++ @7063 + a3934 /* ARAN_MOON_NOT_PRACTICAL */
  ++ @7064 + a3917 /* ARAN_MOON_FEMALE_EXIT */
  ++ @7065 + a3953 /* ARAN_MOON_STRIP */
END

IF ~~ a3953 /* ARAN_MOON_STRIP */
  SAY @7066
  ++ @7067 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  + ~Global("c-aransex","GLOBAL",0) OR(4) Race(Player1,ELF) Race(Player1,HALF_ELF) Race(Player1,DWARF) Race(Player1,HALFLING)~ + @6524 + a3937 /* ARAN_MOON_PLEASEME */
  + ~GlobalGT("c-aransex","GLOBAL",0) OR(4) Race(Player1,ELF) Race(Player1,HALF_ELF) Race(Player1,DWARF) Race(Player1,HALFLING)~ + @6525 + a3954 /* ROM_TWO_LADIE_LIE_ME_DOWN_WITH_YOU */
  ++ @7068 + a3954 /* ROM_TWO_LADIE_LIE_ME_DOWN_WITH_YOU */
  ++ @7069 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7070 + a3954 /* ROM_TWO_LADIE_LIE_ME_DOWN_WITH_YOU */
  ++ @7071 + a3954 /* ROM_TWO_LADIE_LIE_ME_DOWN_WITH_YOU */
END

IF ~~ a3937 /* ARAN_MOON_PLEASEME */
  SAY @7072
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7073 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7073 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7073 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7073 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7073 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7073 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7073 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7073 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3962 /* SEX_SCENE_EIGHT */
  ++ @7074 + a3947 /* ROM_ONE_KISS_ME_AGAIN */
  ++ @7075 + a4061 /* MOON_ORAL */
  ++ @7076 + a4162 /* ARAN_MOON_WALK_EXIT */
  ++ @7077 + a4222 /* I_ALREADY_DO */
END

IF ~~ a4061 /* MOON_ORAL */
  SAY @7078
  ++ @7079 + a4223 /* ARAN_CRAZY */
  ++ @7080 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7081 + a4223 /* ARAN_CRAZY */
  + ~GlobalLT("c-aransex","GLOBAL",4) OR(4) Race(Player1,ELF) Race(Player1,HALF_ELF) Race(Player1,DWARF) Race(Player1,HALFLING)~ + @7082 + a4062 /* ARAN_MOON_ORAL_AGREE */
  + ~Global("c-aransex","GLOBAL",4) OR(4) Race(Player1,ELF) Race(Player1,HALF_ELF) Race(Player1,DWARF) Race(Player1,HALFLING)~ + @7083 + a4062 /* ARAN_MOON_ORAL_AGREE */
END

IF ~~ a4062 /* ARAN_MOON_ORAL_AGREE */
  SAY @7084
  = @7085
  ++ @7080 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7086 + a4224 /* DO_OR_DO_NOT_NO_TRY */
  ++ @7087 + a4147 /* FRONT_TO_ARAN_EXPLORE */
END

IF ~~ a4224 /* DO_OR_DO_NOT_NO_TRY */
  SAY @7088
  ++ @7089 + a4123 /* ROM_LICK_ARAN */
  ++ @7080 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
END

IF ~~ a4223 /* ARAN_CRAZY */
  SAY @7090
  = @7091
  ++ @7092 + a4066 /* ARAN_CRAZY_EXIT */
  ++ @7093 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7094 + a4068 /* ARAN_HOPE_SPRINGS_ETERNAL */
  ++ @7095 + a4067 /* ARAN_YOU_ARE_WORTH_IT */
END

IF ~~ a4222 /* I_ALREADY_DO */
  SAY @7096
  ++ @7097 + a4221 /* IF_WISHES */
  ++ @7098 + a4221 /* IF_WISHES */
  ++ @7099 + a4221 /* IF_WISHES */
  ++ @7100 + a4162 /* ARAN_MOON_WALK_EXIT */
  ++ @6986 + a3934 /* ARAN_MOON_NOT_PRACTICAL */
END

IF ~~ a4221 /* IF_WISHES */
  SAY @7101
  = @7102
  = @7103
  ++ @7104 + a4220 /* DO_NEXT */
  ++ @7105 + a4162 /* ARAN_MOON_WALK_EXIT */
  ++ @7106 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7107 + a4162 /* ARAN_MOON_WALK_EXIT */
  ++ @7108 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
END

IF ~~ a4220 /* DO_NEXT */
  SAY @7109
  ++ @7110 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @5798 + a4219 /* DO_NEXT_FINAL */
  ++ @7111 + a4218 /* WHERE_IDEAS_COME_FROM */
  ++ @7112 + a4218 /* WHERE_IDEAS_COME_FROM */
  ++ @7113 +  a4218 /* WHERE_IDEAS_COME_FROM */
END

IF ~~ a4219 /* DO_NEXT_FINAL */
  SAY @7114
  ++ @7110 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7111 + a4218 /* WHERE_IDEAS_COME_FROM */
  ++ @7112 + a4218 /* WHERE_IDEAS_COME_FROM */
  ++ @7115 + a4218 /* WHERE_IDEAS_COME_FROM */
  ++ @7116 + a4064 /* ALL_TALK_NO_ACTION */
END

IF ~~ a4218 /* WHERE_IDEAS_COME_FROM */
  SAY @7117
  ++ @7118 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7119 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7120 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7121 + a4213 /* ARAN_MOON_MAYHAP */
  ++ @7122 + a3814 /* GET_OUT_EXIT */
END

IF ~~ a3950 /* MOON_CROSSEDLINE */
  SAY @6764
  ++ @6765 + a4217 /* MOON_WISHES */
  ++ @6766 + a3866 /* FIGHT_EXIT */
  ++ @7048 + a3949 /* ARAN_MOON_3_RESPOND */
  ++ @6740 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7123 + a4162 /* ARAN_MOON_WALK_EXIT */
END

IF ~~ a4217 /* MOON_WISHES */
  SAY @7124
  ++ @7125 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @6770 + a3951 /* ARAN_MOON_4_RESPOND */
  ++ @6757 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @6771 + a3866 /* FIGHT_EXIT */
  ++ @6772 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7126 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
END

IF ~~ a4216 /* MOON_ADVANCE_ACTION */
  SAY @7127
  ++ @6782 + a3951 /* ARAN_MOON_4_RESPOND */
  ++ @7128 + a3951 /* ARAN_MOON_4_RESPOND */
  ++ @6784 + a3866 /* FIGHT_EXIT */
  ++ @7129 + a3951 /* ARAN_MOON_4_RESPOND */
  ++ @6786 + a3948 /* ARAN_MOON_MAKEOUT_EXIT */
  ++ @6787 + a3949 /* ARAN_MOON_3_RESPOND */
END

IF ~~ a3949 /* ARAN_MOON_3_RESPOND */
  SAY @7130
  ++ @7131 + a3951 /* ARAN_MOON_4_RESPOND */
  ++ @7132 + a3951 /* ARAN_MOON_4_RESPOND */
  ++ @7133 + a3866 /* FIGHT_EXIT */
  ++ @7134 + a3951 /* ARAN_MOON_4_RESPOND */
  ++ @6757 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
END

IF ~~ a3951 /* ARAN_MOON_4_RESPOND */
  SAY @6792
  ++ @7141 + a4214 /* ARAN_MOON_SLEEP_PASSTHROUGH */
  ++ @12486 + a4215 /* MOON_MOVE_ACTION */
  ++ @7143 + a4215 /* MOON_MOVE_ACTION */
  ++ @12487 + a4161 /* ARAN_MOON_SLEEP_1_EXIT */
  ++ @6798 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @6799 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @6800 + a3814 /* GET_OUT_EXIT */
END

IF ~~ a4215 /* MOON_MOVE_ACTION */
  SAY @7146
  ++ @7147 + a4153 /* ARAN_MOON_SLEEP_4_EXIT */
  ++ @7148 + a4153 /* ARAN_MOON_SLEEP_4_EXIT */
  ++ @7149 + a4153 /* ARAN_MOON_SLEEP_4_EXIT */
  ++ @7150 + a4153 /* ARAN_MOON_SLEEP_4_EXIT */
  ++ @7151 + a4153 /* ARAN_MOON_SLEEP_4_EXIT */
END

IF ~~ a4214 /* ARAN_MOON_SLEEP_PASSTHROUGH */
  SAY @7152
  ++ @7153 + a4160 /* ARAN_MOON_SLEEP_3_EXIT */
  ++ @7154 + a4160 /* ARAN_MOON_SLEEP_3_EXIT */
  ++ @7155 + a4153 /* ARAN_MOON_SLEEP_4_EXIT */
  ++ @7156 + a4160 /* ARAN_MOON_SLEEP_3_EXIT */
  ++ @7157 + a4215 /* MOON_MOVE_ACTION */
  ++ @7158 + a3814 /* GET_OUT_EXIT */
END

IF ~~ a4213 /* ARAN_MOON_MAYHAP */
  SAY @7159
  ++ @7160 + a4067 /* ARAN_YOU_ARE_WORTH_IT */
  ++ @7161 + a3936 /* ARAN_MOON_FRIENDS_EXIT */
  ++ @7162 + a4068 /* ARAN_HOPE_SPRINGS_ETERNAL */
  ++ @7163 + a3814 /* GET_OUT_EXIT */
  ++ @7164 + a4065 /* SECOND_FIDDLE */
END

/* VI: (actually, VI through infinity) Romance Content: Intimacy Options cycling and recycling Adult Talks - consolidating a number of opportunities in-game called from things like:  In .bcs, reset to cycle through again. IF GlobalGT("c-arankisses","LOCALS",9) THEN RESPONSE #100 SetGlobal("c-arankisses","GLOBAL",0). This gives a relatively large number of Aran statements, and a huge number of player choices/responses, with randomness built into the model. Hopefully, this will allow in-game "booty calls" to be unique for most of a playthrough, even for folks who want to knock boots on a regular basis. */

/* step one - initiation points - 1 */

/* found in female PID stuff */

/* PID requests,  PC = Female PID  - follow up responses */
IF ~~ a4212 /* START_RIGHT_HERE_NOW */
  SAY @7165
  IF ~RandomNum(5,5)~ THEN GOTO a4211 /* NOT_RIGHT_NOW_BUT_LATER */
  IF ~RandomNum(5,4)~ THEN GOTO a4015 /* START_ARMS_ENCIRCLE */
  IF ~RandomNum(5,3)~ THEN GOTO a4021 /* START_SHOULDERS_BLOCK */
  IF ~RandomNum(5,2)~ THEN GOTO a4027 /* START_COME_UP_BEHIND */
  IF ~RandomNum(5,1)~ THEN GOTO a4049 /* START_HOLD_OUT_HANDS */
END

IF ~~ a4210 /* NOT_RIGHT_HERE_NOW_ONE */
  SAY @12488
  ++ @7167 + a4206 /* THIS_IS_ME_MINDING */
  + ~RandomNum(4,4)~ + @7168 + a4204 /* AGREE_TO_MEET_ONE */
  + ~RandomNum(4,3)~ + @7168 + a4203 /* AGREE_TO_MEET_TWO */
  + ~RandomNum(4,2)~ + @7168 + a4202 /* AGREE_TO_MEET_THREE */
  + ~RandomNum(4,1)~ + @7168 + a4201 /* AGREE_TO_MEET_FOUR */
  + ~RandomNum(5,5)~ + @7170 + a4204 /* AGREE_TO_MEET_ONE */
  + ~RandomNum(5,4)~ + @7170 + a4203 /* AGREE_TO_MEET_TWO */
  + ~RandomNum(5,3)~ + @7170 + a4202 /* AGREE_TO_MEET_THREE */
  + ~RandomNum(5,2)~ + @7170 + a4201 /* AGREE_TO_MEET_FOUR */
  + ~RandomNum(5,1)~ + @7171 + a4205 /* WHY_DID_YOU_ASK */
  + ~RandomNum(3,3)~ + @7172 + a4209 /* HELLS_NO_OTHERS */
  + ~RandomNum(3,2)~ + @7172 + a4208 /* LET_ME_CHECK */
  + ~RandomNum(3,1)~ + @7172 + a4207 /* VERY_FUNNY_VERY_FUNNY */
END

IF ~~ a4211 /* NOT_RIGHT_NOW_BUT_LATER */
  SAY @7173
  ++ @7167 + a4206 /* THIS_IS_ME_MINDING */
  + ~RandomNum(4,4)~ + @7168 + a4204 /* AGREE_TO_MEET_ONE */
  + ~RandomNum(4,3)~ + @7168 + a4203 /* AGREE_TO_MEET_TWO */
  + ~RandomNum(4,2)~ + @7168 + a4202 /* AGREE_TO_MEET_THREE */
  + ~RandomNum(4,1)~ + @7168 + a4201 /* AGREE_TO_MEET_FOUR */
  + ~RandomNum(5,5)~ + @7170 + a4204 /* AGREE_TO_MEET_ONE */
  + ~RandomNum(5,4)~ + @7170 + a4203 /* AGREE_TO_MEET_TWO */
  + ~RandomNum(5,3)~ + @7170 + a4202 /* AGREE_TO_MEET_THREE */
  + ~RandomNum(5,2)~ + @7170 + a4201 /* AGREE_TO_MEET_FOUR */
  + ~RandomNum(5,1)~ + @7171 + a4205 /* WHY_DID_YOU_ASK */
  + ~RandomNum(3,3)~ + @7172 + a4209 /* HELLS_NO_OTHERS */
  + ~RandomNum(3,2)~ + @7172 + a4208 /* LET_ME_CHECK */
  + ~RandomNum(3,1)~ + @7172 + a4207 /* VERY_FUNNY_VERY_FUNNY */
END

IF ~~ a4225 /* NOT_RIGHT_HERE_NOW */
  SAY @7174
  ++ @7167 + a4206 /* THIS_IS_ME_MINDING */
  + ~RandomNum(4,4)~ + @7168 + a4204 /* AGREE_TO_MEET_ONE */
  + ~RandomNum(4,3)~ + @7168 + a4203 /* AGREE_TO_MEET_TWO */
  + ~RandomNum(4,2)~ + @7168 + a4202 /* AGREE_TO_MEET_THREE */
  + ~RandomNum(4,1)~ + @7168 + a4201 /* AGREE_TO_MEET_FOUR */
  + ~RandomNum(5,5)~ + @7170 + a4204 /* AGREE_TO_MEET_ONE */
  + ~RandomNum(5,4)~ + @7170 + a4203 /* AGREE_TO_MEET_TWO */
  + ~RandomNum(5,3)~ + @7170 + a4202 /* AGREE_TO_MEET_THREE */
  + ~RandomNum(5,2)~ + @7170 + a4201 /* AGREE_TO_MEET_FOUR */
  + ~RandomNum(5,1)~ + @7171 + a4205 /* WHY_DID_YOU_ASK */
  + ~RandomNum(3,3)~ + @7172 + a4209 /* HELLS_NO_OTHERS */
  + ~RandomNum(3,2)~ + @7172 + a4208 /* LET_ME_CHECK */
  + ~RandomNum(3,1)~ + @7172 + a4207 /* VERY_FUNNY_VERY_FUNNY */
END

IF ~~ a4209 /* HELLS_NO_OTHERS */
  SAY @7175
  IF ~~ THEN DO ~SetGlobal("c-arannightvisit","GLOBAL",1)~ EXIT
END

IF ~~ a4208 /* LET_ME_CHECK */
  SAY @7176
  IF ~~ THEN DO ~SetGlobal("c-arannightvisit","GLOBAL",1)~ EXIT
END

IF ~~ a4207 /* VERY_FUNNY_VERY_FUNNY */
  SAY @7177
  IF ~~ THEN DO ~SetGlobal("c-arannightvisit","GLOBAL",1)~ EXIT
END

IF ~~ a4206 /* THIS_IS_ME_MINDING */
  SAY @7178
  IF ~~ THEN EXIT
END

IF ~~ a4205 /* WHY_DID_YOU_ASK */
  SAY @7179
  IF ~~ THEN DO ~SetGlobal("c-arannightvisit","GLOBAL",0)~ EXIT
END

IF ~~ a4204 /* AGREE_TO_MEET_ONE */
  SAY @7180
  IF ~~ THEN DO ~SetGlobal("c-arannightvisit","GLOBAL",1)~ EXIT
END

IF ~~ a4203 /* AGREE_TO_MEET_TWO */
  SAY @7181
  IF ~~ THEN DO ~SetGlobal("c-arannightvisit","GLOBAL",1)~ EXIT
END

IF ~~ a4202 /* AGREE_TO_MEET_THREE */
  SAY @7182
  IF ~~ THEN DO ~SetGlobal("c-arannightvisit","GLOBAL",1)~ EXIT
END

IF ~~ a4201 /* AGREE_TO_MEET_FOUR */
  SAY @7183
  IF ~~ THEN DO ~SetGlobal("c-arannightvisit","GLOBAL",1)~ EXIT
END

/* Dreamscript Trigger */

/* In DreamScript - remember to set timer so that a PC who wants lots of activity doesn't trigger the flirting one at the same time... a lot too much. P.S. - figure out how to handle the "does he stay overnight or not". Tricky. */

/* MOVED START_ARAN_PC_BOOTY_CALL FROM HERE <<<<< PUT IT IN DREAMSCRIPT EVAL ORDER */

/* Initiating States */

/* STARTING STATES: from PID, from within some dialogs, and available for later lovetalks. */

/* Randomness and Reply - on 3, 2, or 1 of 6, state goes to aran acting first. On 4,5, or 6, state has PC talking. */
IF ~~ a4015 /* START_ARMS_ENCIRCLE */
  SAY @7184
  ++ @7185 + a4016 /* SERVE_YOU_MY_LORD */
  ++ @7186 + a3944 /* START_NINE_HELLS_PC_ACTION */
  ++ @7187 + a4017 /* START_LIP_EXERCISES */
  IF ~RandomNum(6,3)~ THEN GOTO a4018 /* KISS_TIP_CHIN */
  IF ~RandomNum(6,2)~ THEN GOTO a4019 /* KISS_PRESS_SALTY */
  IF ~RandomNum(6,1)~ THEN GOTO a4020 /* ARAN_KISSES_NECK */
END

IF ~~ a4021 /* START_SHOULDERS_BLOCK */
  SAY @7188
  ++ @7189 + a4022 /* KISS_SILENCE_STRAIGHTEN */
  ++ @7190 + a4023 /* START_ARAN_CUTS_TO_CHACE_VOCAL */
  IF ~RandomNum(6,3)~ THEN GOTO a4024 /* KISS_CATCH_HANDS */
  IF ~RandomNum(6,2)~ THEN GOTO a4025 /* START_LADY_OF_THE_WARM_LIPS */
  IF ~RandomNum(6,1)~ THEN GOTO a4026 /* START_WITH_SHOULDER_PULL */
END

IF ~~ a4027 /* START_COME_UP_BEHIND */
  SAY @7191
  ++ @7189 + a4022 /* KISS_SILENCE_STRAIGHTEN */
  ++ @7192 + a4028 /* START_MAYHAP_I_GET_A_KISS */
  ++ @7193 + a3944 /* START_NINE_HELLS_PC_ACTION */
  IF ~RandomNum(6,3)~ THEN GOTO a4029 /* START_TRY_TO_BE_PHYSICAL */
  IF ~RandomNum(6,2)~ THEN GOTO a4030 /* START_GIVE_A_LAD_A_CHANCE */
  IF ~RandomNum(6,1)~ THEN GOTO a4031 /* START_BOTTOM_SWAT */
END

IF ~~ a4031 /* START_BOTTOM_SWAT */
  SAY @7194
  ++ @7195 + a4032 /* ARAN_KISS_BACKSIDE */
  ++ @12489 + a4033 /* ROM_TWO_6 */
  ++ @12490 + a4034 /* QUICKIE_FRONT_PC */
  ++ @7198 + a4035 /* QUICKIE_BEHIND_PC */
  ++ @7199 + a4161 /* ARAN_MOON_SLEEP_1_EXIT */
END

IF ~~ a4034 /* QUICKIE_FRONT_PC */
  SAY @7200
  ++ @7201 EXIT
  ++ @7202 EXIT
  ++ @5210 + a4036 /* I_WANT_MORE */
END

IF ~~ a4035 /* QUICKIE_BEHIND_PC */
  SAY @12491
  ++ @7204 EXIT
  ++ @7202 EXIT
  ++ @5210 + a4036 /* I_WANT_MORE */
END

IF ~~ a4036 /* I_WANT_MORE */
  SAY @7205
  IF ~~ THEN EXIT
END

IF ~~ a4032 /* ARAN_KISS_BACKSIDE */
  SAY @7206
  ++ @7207 + a4037 /* ARAN_BACK_SURE */
  ++ @7208 + a4037 /* ARAN_BACK_SURE */
  ++ @7209 + a4037 /* ARAN_BACK_SURE */
END

IF ~~ a4037 /* ARAN_BACK_SURE */
  SAY @7210
  ++ @7211 + a4038 /* ARAN_STOP_RIGHT_NOW */
  ++ @7212 + a4039 /* ARAN_PLEASE_ORAL_QUICK */
  ++ @7213 + a4039 /* ARAN_PLEASE_ORAL_QUICK */
END

IF ~~ a4039 /* ARAN_PLEASE_ORAL_QUICK */
  SAY @7214
  = @7215
  IF ~~ THEN EXIT
END

IF ~~ a4038 /* ARAN_STOP_RIGHT_NOW */
  SAY @7216
  IF ~~ THEN EXIT
END

IF ~~ a4049 /* START_HOLD_OUT_HANDS */
  SAY @12492
  ++ @7218 + a4040 /* START_BEARING_GIFTS */
  ++ @7219 + a4030 /* START_GIVE_A_LAD_A_CHANCE */
  ++ @7220 + a4041 /* START_SUNES_LIPS */
  ++ @7221 + a4042 /* REMOVE_CLOTHING_DELAY_ONE */
  ++ @7222 + a4043 /* ROM_ONE_3_HANDS */
END

IF ~~ a4025 /* START_LADY_OF_THE_WARM_LIPS */
  SAY @7223
  + ~RandomNum(3,3)~ + @7224 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4044 /* ROM_ONE_CLEAR_SIGNAL */
  + ~RandomNum(3,2)~ + @7225 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4045 /* ROM_ONE_OUCH_WHAT_GAVE_IDEA */
  + ~RandomNum(3,1)~ + @6699 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4044 /* ROM_ONE_CLEAR_SIGNAL */
  + ~RandomNum(4,4)~ + @7226 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,3)~ + @7227 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4044 /* ROM_ONE_CLEAR_SIGNAL */
  + ~RandomNum(4,2)~ + @7228 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4044 /* ROM_ONE_CLEAR_SIGNAL */
  + ~RandomNum(4,1)~ + @7229 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4047 /* ROM_ONE_OUCH_DO_SAME */
  ++ @7230 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4044 /* ROM_ONE_CLEAR_SIGNAL */
  ++ @7231 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3946 /* ROM_ONE_WARM_LIPS */
  + ~RandomNum(5,1)~ + @7232 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3947 /* ROM_ONE_KISS_ME_AGAIN */
  + ~RandomNum(5,2)~ + @7233 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3946 /* ROM_ONE_WARM_LIPS */
  + ~RandomNum(5,3)~ + @7234 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3946 /* ROM_ONE_WARM_LIPS */
  + ~RandomNum(5,4)~ + @7235 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(5,5)~ + @7234 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3946 /* ROM_ONE_WARM_LIPS */
  ++ @7236 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4043 /* ROM_ONE_3_HANDS */
  ++ @7237 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3814 /* GET_OUT_EXIT */
  ++ @7238 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4026 /* START_WITH_SHOULDER_PULL */
  SAY @12493
  + ~RandomNum(3,3)~ + @7240 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(3,2)~ + @7241 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(3,1)~ + @7242 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,4)~ + @7243 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,3)~ + @7244 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,2)~ + @7245 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,1)~ + @7246 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  ++ @7247 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3946 /* ROM_ONE_WARM_LIPS */
  ++ @7235 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(4,1)~ + @7232 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3946 /* ROM_ONE_WARM_LIPS */
  + ~RandomNum(4,2)~ + @7248 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3946 /* ROM_ONE_WARM_LIPS */
  + ~RandomNum(4,3)~ + @6520 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4200 /* ROM_ONE_SLAP */
  + ~RandomNum(4,4)~ + @6520 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3817 /* ROM_ONE_SLAP_AVOID */
  ++ @7249 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4043 /* ROM_ONE_3_HANDS */
  ++ @7250 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3814 /* GET_OUT_EXIT */
  ++ @7251 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3892 /* FEMALE_LEAVES */
END

IF ~~ a4023 /* START_ARAN_CUTS_TO_CHACE_VOCAL */
  SAY @7252
  + ~RandomNum(3,3)~ + @7253 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(3,3)~ + @7254 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(3,3)~ + @7255 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,4)~ + @7256 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,3)~ + @7257 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,2)~ + @7245 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,1)~ + @7258 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  ++ @7259 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3946 /* ROM_ONE_WARM_LIPS */
  ++ @7260 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4057 /* ROM_ONE_URGENT */
  + ~RandomNum(3,1)~ + @7232 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3946 /* ROM_ONE_WARM_LIPS */
  + ~RandomNum(3,2)~ + @6520 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4200 /* ROM_ONE_SLAP */
  + ~RandomNum(3,3)~ + @6520 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3817 /* ROM_ONE_SLAP_AVOID */
  ++ @7261 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4198 /* ROM_ONE_3_PASS */
  ++ @7250 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3814 /* GET_OUT_EXIT */
  ++ @7262 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3892 /* FEMALE_LEAVES */
END

IF ~~ a3944 /* START_NINE_HELLS_PC_ACTION */
  SAY @7263
  + ~RandomNum(3,3)~ + @7264 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4057 /* ROM_ONE_URGENT */
  + ~RandomNum(3,3)~ + @7265 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4057 /* ROM_ONE_URGENT */
  + ~RandomNum(3,3)~ + @7266 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,4)~ + @7267 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,3)~ + @7268 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,2)~ + @7269 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  + ~RandomNum(4,1)~ + @7270 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4046 /* ROM_ONE_YOUR_WISH_MINE */
  ++ @7271 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3946 /* ROM_ONE_WARM_LIPS */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7272 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7272 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7272 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7272 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7272 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7272 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7272 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7272 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3962 /* SEX_SCENE_EIGHT */
  ++ @7273 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4198 /* ROM_ONE_3_PASS */
  ++ @7274 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3814 /* GET_OUT_EXIT */
  ++ @7275 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3892 /* FEMALE_LEAVES */
END

IF ~~ a4028 /* START_MAYHAP_I_GET_A_KISS */
  SAY @7276
  + ~RandomNum(3,3)~ + @7277 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4190 /* ROM_TWO_WONT_WAIT_THEN */
  + ~RandomNum(3,3)~ + @7278 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4190 /* ROM_TWO_WONT_WAIT_THEN */
  + ~RandomNum(3,3)~ + @7279 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4190 /* ROM_TWO_WONT_WAIT_THEN */
  + ~RandomNum(4,4)~ + @7280 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4190 /* ROM_TWO_WONT_WAIT_THEN */
  + ~RandomNum(4,3)~ + @7281 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4190 /* ROM_TWO_WONT_WAIT_THEN */
  + ~RandomNum(4,2)~ + @7282 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4190 /* ROM_TWO_WONT_WAIT_THEN */
  + ~RandomNum(4,1)~ + @6699 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4197 /* ROM_TWO_1a */
  ++ @7283 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7284 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,1)~ + @7285 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,2)~ + @7286 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,3)~ + @7234 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7236 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7287 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3814 /* GET_OUT_EXIT */
  ++ @7288 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3892 /* FEMALE_LEAVES */
  ++ @7238 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4030 /* START_GIVE_A_LAD_A_CHANCE */
  SAY @7289
  + ~RandomNum(3,3)~ + @7277 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4189 /* ROM_TWO_KISS_DRINK_LIPS */
  + ~RandomNum(3,3)~ + @7278 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(3,3)~ + @7279 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(4,4)~ + @7280 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(4,3)~ + @7281 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(4,2)~ + @7282 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(4,1)~ + @6699 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4185 /* ROM_TWO_CHEEK_NUZZLE_LIPS */
  ++ @7283 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7284 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,1)~ + @7285 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,2)~ + @7286 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,3)~ + @7234 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7236 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7287 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3814 /* GET_OUT_EXIT */
  ++ @7288 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3892 /* FEMALE_LEAVES */
  ++ @7238 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4040 /* START_BEARING_GIFTS */
  SAY @7290
  + ~RandomNum(3,3)~ + @7277 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(3,3)~ + @7278 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(3,3)~ + @7279 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4189 /* ROM_TWO_KISS_DRINK_LIPS */
  + ~RandomNum(4,4)~ + @7280 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(4,3)~ + @7281 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4189 /* ROM_TWO_KISS_DRINK_LIPS */
  + ~RandomNum(4,2)~ + @7282 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(4,1)~ + @6699 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4197 /* ROM_TWO_1a */
  ++ @7283 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7284 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4185 /* ROM_TWO_CHEEK_NUZZLE_LIPS */
  + ~RandomNum(3,1)~ + @7285 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,2)~ + @7286 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,3)~ + @7234 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7236 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7287 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3814 /* GET_OUT_EXIT */
  ++ @7288 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3892 /* FEMALE_LEAVES */
  ++ @7238 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4041 /* START_SUNES_LIPS */
  SAY @7291
  + ~RandomNum(3,3)~ + @7277 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(3,3)~ + @7278 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(3,3)~ + @7279 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(4,4)~ + @7280 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(4,3)~ + @7281 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(4,2)~ + @7282 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(4,1)~ + @6699 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7283 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7284 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,1)~ + @7285 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,2)~ + @7286 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4185 /* ROM_TWO_CHEEK_NUZZLE_LIPS */
  + ~RandomNum(3,3)~ + @7234 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7236 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7287 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3814 /* GET_OUT_EXIT */
  ++ @7288 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3892 /* FEMALE_LEAVES */
  ++ @7238 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4029 /* START_TRY_TO_BE_PHYSICAL */
  SAY @7292
  + ~RandomNum(3,3)~ + @7293 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(3,3)~ + @7294 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(3,3)~ + @7295 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(4,4)~ + @7296 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(4,3)~ + @7297 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(4,2)~ + @7298 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  + ~RandomNum(4,1)~ + @7299 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7283 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7284 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,1)~ + @7285 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,2)~ + @7286 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4185 /* ROM_TWO_CHEEK_NUZZLE_LIPS */
  + ~RandomNum(3,3)~ + @7234 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7236 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7287 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3814 /* GET_OUT_EXIT */
  ++ @7288 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3892 /* FEMALE_LEAVES */
  ++ @7238 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4017 /* START_LIP_EXERCISES */
  SAY @7300
  + ~RandomNum(3,3)~ + @7301 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(3,2)~ + @7302 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(3,1)~ + @7279 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(4,4)~ + @7280 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(4,3)~ + @7281 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(4,2)~ + @7282 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  + ~RandomNum(4,1)~ + @6699 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4189 /* ROM_TWO_KISS_DRINK_LIPS */
  ++ @7283 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7284 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,1)~ + @7285 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,2)~ + @7286 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  + ~RandomNum(3,3)~ + @7234 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7236 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7287 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3814 /* GET_OUT_EXIT */
  ++ @7288 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3892 /* FEMALE_LEAVES */
  ++ @7238 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3900 /* JUST_FRIENDS_EXIT */
END

/* Intermediaries #1 */

IF ~~ a4016 /* SERVE_YOU_MY_LORD */
  SAY @7303
  IF ~~ THEN GOTO a4050 /* SHOW_TATTOO_ARAN_STRIPS */
END

IF ~~ a4018 /* KISS_TIP_CHIN */
  SAY @7304
  ++ @7305 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7306 + a4052 /* SUNE_SHUTDOWN_EXIT */
  ++ @7307 + a4053 /* PC_STRIPS_FOR_ARAN */
  ++ @7308 + a4054 /* ARAN_UNLACING_TUNIC */
  ++ @7309 + a4055 /* TAKE_ME_DELAY_THREE */
END

IF ~~ a4019 /* KISS_PRESS_SALTY */
  SAY @7310
  ++ @7308 + a4054 /* ARAN_UNLACING_TUNIC */
  ++ @7305 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7307 + a4053 /* PC_STRIPS_FOR_ARAN */
  ++ @7311 + a4056 /* TAKE_ME_DELAY_FOUR */
END

IF ~~ a4020 /* ARAN_KISSES_NECK */
  SAY @7312
  ++ @7305 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7307 + a4053 /* PC_STRIPS_FOR_ARAN */
  ++ @7313 + a4055 /* TAKE_ME_DELAY_THREE */
END

IF ~~ a4022 /* KISS_SILENCE_STRAIGHTEN */
  SAY @7314
  ++ @7315 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7305 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7316 + a4052 /* SUNE_SHUTDOWN_EXIT */
  ++ @7307 + a4053 /* PC_STRIPS_FOR_ARAN */
  ++ @7317 + a4042 /* REMOVE_CLOTHING_DELAY_ONE */
END

IF ~~ a4024 /* KISS_CATCH_HANDS */
  SAY @7318
  ++ @7319 + a4057 /* ROM_ONE_URGENT */
  ++ @7305 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7320 + a4058 /* TAKE_ME_DELAY_TWO */
  ++ @7307 + a4053 /* PC_STRIPS_FOR_ARAN */
  ++ @7321 + a4052 /* SUNE_SHUTDOWN_EXIT */
END

/* follow-up to first level */

IF ~~ a4058 /* TAKE_ME_DELAY_TWO */
  SAY @7322
  IF ~~ THEN GOTO a4042 /* REMOVE_CLOTHING_DELAY_ONE */
END

IF ~~ a4055 /* TAKE_ME_DELAY_THREE */
  SAY @7323
  IF ~~ THEN GOTO a4042 /* REMOVE_CLOTHING_DELAY_ONE */
END

IF ~~ a4056 /* TAKE_ME_DELAY_FOUR */
  SAY @7324
  IF ~~ THEN GOTO a4042 /* REMOVE_CLOTHING_DELAY_ONE */
END

IF ~~ a4042 /* REMOVE_CLOTHING_DELAY_ONE */
  SAY @7325
  IF ~RandomNum(8,1)~ THEN GOTO a4093 /* ROM_THREE_ARAN_TO_PC */
  IF ~RandomNum(8,2)~ THEN GOTO a3993 /* YOU_TALK_TOO_MUCH */
  IF ~RandomNum(8,3)~ THEN GOTO a4009 /* HANDS_TEASING_BARE */
  IF ~RandomNum(8,4)~ THEN GOTO a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  IF ~RandomNum(8,5)~ THEN GOTO a4051 /* ROM_THREE_PC_TO_ARAN */
  IF ~RandomNum(8,6)~ THEN GOTO a3992 /* YOU_WANT_TO_STOP_ARE_YOU_CRAZY */
  IF ~RandomNum(8,7)~ THEN GOTO a4009 /* HANDS_TEASING_BARE */
  IF ~RandomNum(8,8)~ THEN GOTO a3993 /* YOU_TALK_TOO_MUCH */
END

IF ~~ a4044 /* ROM_ONE_CLEAR_SIGNAL */
  SAY @7326
  IF ~~ THEN GOTO a3947 /* ROM_ONE_KISS_ME_AGAIN */
END

IF ~~ a4045 /* ROM_ONE_OUCH_WHAT_GAVE_IDEA */
  SAY @7327
  IF ~RandomNum(3,1)~ THEN GOTO a3946 /* ROM_ONE_WARM_LIPS */
  IF ~RandomNum(3,2)~ THEN GOTO a3947 /* ROM_ONE_KISS_ME_AGAIN */
  IF ~RandomNum(3,3)~ THEN GOTO a3991 /* ROM_ONE_KISS_ME_ALWAYS */
END

IF ~~ a4046 /* ROM_ONE_YOUR_WISH_MINE */
  SAY @7328
  IF ~~ THEN GOTO a3946 /* ROM_ONE_WARM_LIPS */
END

IF ~~ a4047 /* ROM_ONE_OUCH_DO_SAME */
  SAY @7329
  IF ~RandomNum(3,1)~ THEN GOTO a3946 /* ROM_ONE_WARM_LIPS */
  IF ~RandomNum(3,2)~ THEN GOTO a3947 /* ROM_ONE_KISS_ME_AGAIN */
  IF ~RandomNum(3,3)~ THEN GOTO a3991 /* ROM_ONE_KISS_ME_ALWAYS */
END

IF ~~ a3946 /* ROM_ONE_WARM_LIPS */
  SAY @7330
  IF ~RandomNum(5,5)~ THEN GOTO a3986 /* ROM_ONE_CAN_I_TOUCH */
  IF ~RandomNum(5,4)~ THEN GOTO a3987 /* ROM_ONE_HANDS_UNDER_BUST_ONE */
  IF ~RandomNum(5,3)~ THEN GOTO a3988 /* ROM_ONE_HANDS_UNDER_BUST_TWO */
  IF ~RandomNum(5,2)~ THEN GOTO a3989 /* ROM_ONE_THREATEN_KISS_BUST */
  IF ~RandomNum(5,1)~ THEN GOTO a3990 /* ROM_ONE_HANDS_ON_BODY */
END

IF ~~ a4200 /* ROM_ONE_SLAP */
  SAY @7331
  = @7332
  IF ~~ THEN EXIT
END

IF ~~ a3817 /* ROM_ONE_SLAP_AVOID */
  SAY @7333
  ++ @7334 + a4200 /* ROM_ONE_SLAP */
  ++ @7335 + a3998 /* NOT_MY_WAY */
  ++ @7336 + a4199 /* NOT_MY_WAY_STRENGTH */
  ++ @7337 + a4199 /* NOT_MY_WAY_STRENGTH */
END

IF ~~ a4199 /* NOT_MY_WAY_STRENGTH */
  SAY @7338
  ++ @1889 + a4163 /* NOPE_NOT_WANTED */
  ++ @7339 + a4163 /* NOPE_NOT_WANTED */
  ++ @7340 + a4163 /* NOPE_NOT_WANTED */
  ++ @7341 + a4163 /* NOPE_NOT_WANTED */
  ++ @7342 + a4163 /* NOPE_NOT_WANTED */
END

IF ~~ a3998 /* NOT_MY_WAY */
  SAY @7343
  ++ @1889 + a4163 /* NOPE_NOT_WANTED */
  ++ @7339 + a4163 /* NOPE_NOT_WANTED */
  ++ @7340 + a4163 /* NOPE_NOT_WANTED */
  ++ @7344 + a4163 /* NOPE_NOT_WANTED */
  ++ @7342 + a4163 /* NOPE_NOT_WANTED */
END

IF ~~ a4198 /* ROM_ONE_3_PASS */
  SAY @7345
  ++ @7346 + a4190 /* ROM_TWO_WONT_WAIT_THEN */
  ++ @7347 + a4190 /* ROM_TWO_WONT_WAIT_THEN */
  ++ @7348 + a4190 /* ROM_TWO_WONT_WAIT_THEN */
  ++ @7349 + a4148 /* FRONT_TO_ARAN_FINGERS */
  + ~RandomNum(2,2)~ + @7350 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @7350 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
END

IF ~~ a4057 /* ROM_ONE_URGENT */
  SAY @7351
  = @7352
  ++ @7353 + a4006 /* ARAN_THRUST_CLOTHES */
  ++ @7354 + a4006 /* ARAN_THRUST_CLOTHES */
  + ~RandomNum(4,4)~ + @7355 + a3996 /* PC_ON_TOP_ONE */
  + ~RandomNum(4,3)~ + @7355 + a3999 /* PC_ON_TOP_TWO */
  + ~RandomNum(4,2)~ + @7355 + a4000 /* PC_ON_TOP_THREE */
  + ~RandomNum(4,1)~ + @7355 + a4166 /* PC_ON_TOP_FOUR */
  + ~RandomNum(4,1)~ + @7356 + a4001 /* ARAN_ON_TOP_ONE */
  + ~RandomNum(4,2)~ + @7356 + a4002 /* ARAN_ON_TOP_TWO */
  + ~RandomNum(4,3)~ + @7356 + a4003 /* ARAN_ON_TOP_THREE */
  + ~RandomNum(4,4)~ + @7356 + a4004 /* ARAN_ON_TOP_FOUR */
  ++ @6530 + a4148 /* FRONT_TO_ARAN_FINGERS */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3962 /* SEX_SCENE_EIGHT */
  ++ @6554 + a4069 /* ROM_FRIENDS_EXIT_FOUR */
END

IF ~~ a4197 /* ROM_TWO_1a */
  SAY @7358
  + ~RandomNum(2,2)~ + @6628 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6628 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  ++ @7359 + a4053 /* PC_STRIPS_FOR_ARAN */
  ++ @7360 + a4196 /* ARAN_NOT_BROTHERLY */
  + ~RandomNum(4,4)~ + @7361 + a3996 /* PC_ON_TOP_ONE */
  + ~RandomNum(4,3)~ + @7361 + a3999 /* PC_ON_TOP_TWO */
  + ~RandomNum(4,2)~ + @7361 + a4000 /* PC_ON_TOP_THREE */
  + ~RandomNum(4,1)~ + @7361 + a4166 /* PC_ON_TOP_FOUR */
END


IF ~~ a4196 /* ARAN_NOT_BROTHERLY */
  SAY @7362
  ++ @7363 + a4195 /* ARAN_KILL_BROTHER */
  ++ @7359 + a4053 /* PC_STRIPS_FOR_ARAN */
  ++ @7364 + a4186 /* ROM_TWO_KISS_GENTLE_CHEEK_LIPS */
END

IF ~~ a4195 /* ARAN_KILL_BROTHER */
  SAY @7365
  ++ @7366 + a4194 /* WANT_YOU_OR_NAUGHT */
  ++ @7364 + a4186 /* ROM_TWO_KISS_GENTLE_CHEEK_LIPS */
  ++ @7359 + a4053 /* PC_STRIPS_FOR_ARAN */
END

IF ~~ a4194 /* WANT_YOU_OR_NAUGHT */
  SAY @7367
  + ~RandomNum(3,3)~ + @7368 + a4193 /* WOMAN_WHO_WANTS */
  + ~RandomNum(3,2)~ + @7368 + a4192 /* WOMAN_WHO_RESPONDS */
  + ~RandomNum(3,1)~ + @7368 + a4191 /* WOMAN_WHO_COMMANDS */
  ++ @6530 + a4148 /* FRONT_TO_ARAN_FINGERS */
  ++ @7364 + a4186 /* ROM_TWO_KISS_GENTLE_CHEEK_LIPS */
  + ~RandomNum(2,2)~ + @7369 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @7369 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  ++ @7359 + a4053 /* PC_STRIPS_FOR_ARAN */
END

IF ~~ a4193 /* WOMAN_WHO_WANTS */
  SAY @7370
  ++ @7371 + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7372 + a4189 /* ROM_TWO_KISS_DRINK_LIPS */
  ++ @7359 + a4053 /* PC_STRIPS_FOR_ARAN */
  ++ @7364 + a4186 /* ROM_TWO_KISS_GENTLE_CHEEK_LIPS */
END

IF ~~ a4192 /* WOMAN_WHO_RESPONDS */
  SAY @7373
  ++ @7374 + a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  ++ @7359 + a4053 /* PC_STRIPS_FOR_ARAN */
  ++ @7364 + a4186 /* ROM_TWO_KISS_GENTLE_CHEEK_LIPS */
  ++ @7375 + a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  ++ @7376 + a3814 /* GET_OUT_EXIT */
  ++ @7377 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4191 /* WOMAN_WHO_COMMANDS */
  SAY @7378
  ++ @7359 + a4053 /* PC_STRIPS_FOR_ARAN */
  ++ @7379 + a4190 /* ROM_TWO_WONT_WAIT_THEN */
  ++ @7364 + a4186 /* ROM_TWO_KISS_GENTLE_CHEEK_LIPS */
  ++ @7375 + a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  ++ @7376 + a3814 /* GET_OUT_EXIT */
  ++ @7377 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4190 /* ROM_TWO_WONT_WAIT_THEN */
  SAY @7380
  IF ~~ THEN GOTO a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
END

IF ~~ a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
  SAY @7381
  IF ~RandomNum(3,1)~ THEN GOTO a4183 /* ROM_TWO_2_WANT */
  IF ~RandomNum(3,2)~ THEN GOTO a4182 /* ROM_TWO_2_NO_PRISONERS */
  IF ~RandomNum(3,3)~ THEN GOTO a4181 /* ROM_TWO_2_PC_ACTION */
END

IF ~~ a4189 /* ROM_TWO_KISS_DRINK_LIPS */
  SAY @7382
  IF ~RandomNum(3,1)~ THEN GOTO a4183 /* ROM_TWO_2_WANT */
  IF ~RandomNum(3,2)~ THEN GOTO a4182 /* ROM_TWO_2_NO_PRISONERS */
  IF ~RandomNum(3,3)~ THEN GOTO a4181 /* ROM_TWO_2_PC_ACTION */
END

IF ~~ a4188 /* ROM_TWO_SIGHT_AND_TASTE_LIPS */
  SAY @7383
  IF ~~ THEN GOTO a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
END

IF ~~ a4187 /* ROM_TWO_KISS_WANT_PRIVACY */
  SAY @7384
  IF ~~ THEN GOTO a4048 /* ROM_TWO_ACTION_GUIDE_TO_LIPS */
END

IF ~~ a4186 /* ROM_TWO_KISS_GENTLE_CHEEK_LIPS */
  SAY @7385
  IF ~RandomNum(3,1)~ THEN GOTO a4183 /* ROM_TWO_2_WANT */
  IF ~RandomNum(3,2)~ THEN GOTO a4182 /* ROM_TWO_2_NO_PRISONERS */
  IF ~RandomNum(3,3)~ THEN GOTO a4181 /* ROM_TWO_2_PC_ACTION */
END

IF ~~ a4185 /* ROM_TWO_CHEEK_NUZZLE_LIPS */
  SAY @7386
  IF ~RandomNum(3,1)~ THEN GOTO a4183 /* ROM_TWO_2_WANT */
  IF ~RandomNum(3,2)~ THEN GOTO a4182 /* ROM_TWO_2_NO_PRISONERS */
  IF ~RandomNum(3,3)~ THEN GOTO a4181 /* ROM_TWO_2_PC_ACTION */
END

IF ~~ a4050 /* SHOW_TATTOO_ARAN_STRIPS */
  SAY @7387
  ++ @7305 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7388 + a4184 /* PC_ASKS_TATTOO */
  ++ @7389 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7390 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7391 + a3964 /* SOLID_STOP2 */
END

IF ~~ a4184 /* PC_ASKS_TATTOO */
  SAY @7392
  ++ @7393 + a4174 /* ARAN_TATTOO_STORY_ONE */
  ++ @7394 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7395 + a4174 /* ARAN_TATTOO_STORY_ONE */
  ++ @7396 + a4175 /* PC_HAS_TATTOO */
  ++ @7313 + a4055 /* TAKE_ME_DELAY_THREE */
END

IF ~~ a4053 /* PC_STRIPS_FOR_ARAN */
  SAY @7397
  ++ @7398 + a4008 /* ARAN_HAS_RESTRAINT */
  ++ @7399 + a4008 /* ARAN_HAS_RESTRAINT */
  ++ @7400 + a4178 /* HANDS_EVERYWHERE */
  ++ @7401 + a4179 /* LIPS_EVERYWHERE */
  ++ @7402 + a4050 /* SHOW_TATTOO_ARAN_STRIPS */
END

IF ~~ a4054 /* ARAN_UNLACING_TUNIC */
  SAY @7403
  ++ @7404 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7405 + a4055 /* TAKE_ME_DELAY_THREE */
  ++ @7305 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7406 + a4052 /* SUNE_SHUTDOWN_EXIT */
  ++ @7307 + a4053 /* PC_STRIPS_FOR_ARAN */
  ++ @7407 + a4177 /* GET_A_LITTLE_HELP_HERE */
END

/* intermediaries from everything above this */

IF ~~ a4009 /* HANDS_TEASING_BARE */
  SAY @7408
  ++ @7409 + a4010 /* FINGERS_EXPLORE_CHARMS */
  /* make-out options */
  + ~RandomNum(4,1)~ + @7410 + a4011 /* KISSING_HOLDING_ONE */
  + ~RandomNum(4,2)~ + @7411 + a4012 /* KISSING_HOLDING_TWO */
  + ~RandomNum(4,3)~ + @7412 + a4013 /* KISSING_HOLDING_THREE */
  + ~RandomNum(4,4)~ + @7413 + a4014 /* KISSING_HOLDING_FOUR */
  ++ @7414 + a4008 /* ARAN_HAS_RESTRAINT */
END

IF ~~ a4008 /* ARAN_HAS_RESTRAINT */
  SAY @7415
  ++ @7375 + a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  ++ @7376 + a3814 /* GET_OUT_EXIT */
  ++ @7377 + a3900 /* JUST_FRIENDS_EXIT */
  + ~RandomNum(4,1)~ + @7416 + a4011 /* KISSING_HOLDING_ONE */
  + ~RandomNum(4,2)~ + @7417 + a4012 /* KISSING_HOLDING_TWO */
  + ~RandomNum(4,3)~ + @7199 + a4013 /* KISSING_HOLDING_THREE */
  + ~RandomNum(4,4)~ + @7418 + a4014 /* KISSING_HOLDING_FOUR */
  ++ @7419 + a3994 /* QUICK_ROUGH_ENTRY */
  ++ @7420 + a3994 /* QUICK_ROUGH_ENTRY */
END

IF ~~ a4006 /* ARAN_THRUST_CLOTHES */
  SAY @7421
  ++ @7422 + a4005 /* NOT_SO_TOUGH */
  ++ @7423 + a3994 /* QUICK_ROUGH_ENTRY */
  ++ @7424 + a3994 /* QUICK_ROUGH_ENTRY */
  ++ @7425 + a3994 /* QUICK_ROUGH_ENTRY */
  ++ @7426 + a4005 /* NOT_SO_TOUGH */
END

IF ~~ a4005 /* NOT_SO_TOUGH */
  SAY @7427
  ++ @7428 + a3997 /* MAN_OR_FOOL */
  ++ @7429 + a3998 /* NOT_MY_WAY */
  + ~RandomNum(3,1)~ + @7355 + a3996 /* PC_ON_TOP_ONE */
  + ~RandomNum(3,1)~ + @7355 + a3999 /* PC_ON_TOP_TWO */
  + ~RandomNum(3,1)~ + @7355 + a4000 /* PC_ON_TOP_THREE */
  + ~RandomNum(4,1)~ + @7356 + a4001 /* ARAN_ON_TOP_ONE */
  + ~RandomNum(4,2)~ + @7356 + a4002 /* ARAN_ON_TOP_TWO */
  + ~RandomNum(4,3)~ + @7356 + a4003 /* ARAN_ON_TOP_THREE */
  + ~RandomNum(4,4)~ + @7356 + a4004 /* ARAN_ON_TOP_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7357 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3962 /* SEX_SCENE_EIGHT */
  ++ @7430 + a3997 /* MAN_OR_FOOL */
END

IF ~~ a3994 /* QUICK_ROUGH_ENTRY */
  SAY @7431
  ++ @7432 + a3995 /* ROM_PULSE_DEEP_FACE */
  ++ @7433 + a3996 /* PC_ON_TOP_ONE */
  ++ @7434 + a3831 /* IN_NINE_HELLS */
  ++ @7435 + a3995 /* ROM_PULSE_DEEP_FACE */
  ++ @7436 + a3995 /* ROM_PULSE_DEEP_FACE */
END

IF ~~ a3993 /* YOU_TALK_TOO_MUCH */
  SAY @7437
  ++ @7438 + a3988 /* ROM_ONE_HANDS_UNDER_BUST_TWO */
  ++ @7439 + a4194 /* WANT_YOU_OR_NAUGHT */
  ++ @7440 + a3986 /* ROM_ONE_CAN_I_TOUCH */
  ++ @7441 + a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  ++ @7442 + a3992 /* YOU_WANT_TO_STOP_ARE_YOU_CRAZY */
END

IF ~~ a3947 /* ROM_ONE_KISS_ME_AGAIN */
  SAY @7443
  IF ~RandomNum(5,5)~ THEN GOTO a3986 /* ROM_ONE_CAN_I_TOUCH */
  IF ~RandomNum(5,4)~ THEN GOTO a3987 /* ROM_ONE_HANDS_UNDER_BUST_ONE */
  IF ~RandomNum(5,3)~ THEN GOTO a3988 /* ROM_ONE_HANDS_UNDER_BUST_TWO */
  IF ~RandomNum(5,2)~ THEN GOTO a3989 /* ROM_ONE_THREATEN_KISS_BUST */
  IF ~RandomNum(5,1)~ THEN GOTO a3990 /* ROM_ONE_HANDS_ON_BODY */
END

IF ~~ a3991 /* ROM_ONE_KISS_ME_ALWAYS */
  SAY @7444
  IF ~RandomNum(5,5)~ THEN GOTO a3986 /* ROM_ONE_CAN_I_TOUCH */
  IF ~RandomNum(5,4)~ THEN GOTO a3987 /* ROM_ONE_HANDS_UNDER_BUST_ONE */
  IF ~RandomNum(5,3)~ THEN GOTO a3988 /* ROM_ONE_HANDS_UNDER_BUST_TWO */
  IF ~RandomNum(5,2)~ THEN GOTO a3989 /* ROM_ONE_THREATEN_KISS_BUST */
  IF ~RandomNum(5,1)~ THEN GOTO a3990 /* ROM_ONE_HANDS_ON_BODY */
END

IF ~~ a3986 /* ROM_ONE_CAN_I_TOUCH */
  SAY @7445
  /* no advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7446 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @7447 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @7448 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @7449 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @7450 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  /* no advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7451 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",1)~ + @7452 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",2)~ + @7453 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",3)~ + @7454 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",4)~ + @7455 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  /* advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7456 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @7457 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @7458 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @7459 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @7460 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  /* advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7461 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",1)~ + @7462 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",2)~ + @7463 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",3)~ + @7464 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",4)~ + @7465 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  ++ @7375 + a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  ++ @7376 + a3814 /* GET_OUT_EXIT */
  ++ @7377 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a3987 /* ROM_ONE_HANDS_UNDER_BUST_ONE */
  SAY @7466
  /* no advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7446 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @7447 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @7448 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @7449 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @7450 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  /* no advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7451 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",1)~ + @7452 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",2)~ + @7453 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",3)~ + @7454 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",4)~ + @7455 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  /* advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7456 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @7457 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @7458 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @7459 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @7460 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  /* advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7461 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",1)~ + @7462 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",2)~ + @7463 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",3)~ + @7464 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",4)~ + @7465 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  ++ @7375 + a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  ++ @7376 + a3814 /* GET_OUT_EXIT */
  ++ @7377 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a3988 /* ROM_ONE_HANDS_UNDER_BUST_TWO */
  SAY @7467
  /* no advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7446 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @7447 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @7448 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @7449 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @7450 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  /* no advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7451 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",1)~ + @7452 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",2)~ + @7453 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",3)~ + @7454 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",4)~ + @7455 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  ++ @7375 + a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  ++ @7376 + a3814 /* GET_OUT_EXIT */
  ++ @7377 + a3900 /* JUST_FRIENDS_EXIT */
  /* advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7456 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @7457 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @7458 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @7459 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @7460 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  /* advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7461 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",1)~ + @7462 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",2)~ + @7463 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",3)~ + @7464 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",4)~ + @7465 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
END

IF ~~ a3990 /* ROM_ONE_HANDS_ON_BODY */
  SAY @7468
  /* no advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7469 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @7447 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @7448 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @7449 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @7450 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  /* no advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7451 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",1)~ + @7452 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",2)~ + @7453 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",3)~ + @7454 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",4)~ + @7455 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  /* advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7456 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @7457 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @7458 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @7459 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @7460 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  /* advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7461 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",1)~ + @7462 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",2)~ + @7463 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",3)~ + @7464 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",4)~ + @7465 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  ++ @7375 + a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  ++ @7376 + a3814 /* GET_OUT_EXIT */
  ++ @7377 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a3989 /* ROM_ONE_THREATEN_KISS_BUST */
  SAY @7470
  /* no advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7469 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @7447 + a4076 /* ROM_ONE_FAST_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @7448 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @7449 + a4076 /* ROM_ONE_FAST_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @7450 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  /* no advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7451 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",1)~ + @7452 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",2)~ + @7453 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",3)~ + @7454 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",4)~ + @7455 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  /* advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7456 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @7457 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @7458 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @7459 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @7460 + a4076 /* ROM_ONE_FAST_KISSES_ACTION */
  /* advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7461 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",1)~ + @7462 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",2)~ + @7463 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",3)~ + @7464 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  + ~Global("c-aransex","GLOBAL",4)~ + @7465 + a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  ++ @7375 + a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  ++ @7376 + a3814 /* GET_OUT_EXIT */
  ++ @7377 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4183 /* ROM_TWO_2_WANT */
  SAY @7471
  /* advance  talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7472 + a4176 /* ROM_TWO_CHEST_BARES_TATTOO */
  + ~Global("c-aransex","GLOBAL",1)~ + @7473 + a4176 /* ROM_TWO_CHEST_BARES_TATTOO */
  + ~Global("c-aransex","GLOBAL",2)~ + @7474 + a4176 /* ROM_TWO_CHEST_BARES_TATTOO */
  + ~Global("c-aransex","GLOBAL",3)~ + @7475 + a4176 /* ROM_TWO_CHEST_BARES_TATTOO */
  + ~Global("c-aransex","GLOBAL",4)~ + @7476 + a4176 /* ROM_TWO_CHEST_BARES_TATTOO */
  /* advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7477 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",1)~ + @7478 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",2)~ + @7479 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",3)~ + @7480 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",4)~ + @7481 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  ++ @7482 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,3)~ + @7483 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,2)~ + @7484 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,1)~ + @7485 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7486 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @12494 + a3814 /* GET_OUT_EXIT */
  ++ @12495 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4182 /* ROM_TWO_2_NO_PRISONERS */
  SAY @7489
  /* advance  talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7490 + a4176 /* ROM_TWO_CHEST_BARES_TATTOO */
  + ~Global("c-aransex","GLOBAL",1)~ + @7491 + a4176 /* ROM_TWO_CHEST_BARES_TATTOO */
  + ~Global("c-aransex","GLOBAL",2)~ + @7492 + a4176 /* ROM_TWO_CHEST_BARES_TATTOO */
  + ~Global("c-aransex","GLOBAL",3)~ + @7493 + a4176 /* ROM_TWO_CHEST_BARES_TATTOO */
  + ~Global("c-aransex","GLOBAL",4)~ + @7494 + a4176 /* ROM_TWO_CHEST_BARES_TATTOO */
  /* advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7477 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",1)~ + @7478 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",2)~ + @7495 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",3)~ + @7480 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",4)~ + @7481 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  ++ @7482 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,3)~ + @7483 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,2)~ + @7484 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,1)~ + @7485 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7486 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7496 + a3814 /* GET_OUT_EXIT */
  ++ @7497 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4181 /* ROM_TWO_2_PC_ACTION */
  SAY @7498
  ++ @7499 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  ++ @7500 + a4081 /* PC_TAKES_CHARGE */
  ++ @7501 + a4081 /* PC_TAKES_CHARGE */
  /* advance no talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7477 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",1)~ + @7478 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",2)~ + @7495 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",3)~ + @7480 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  + ~Global("c-aransex","GLOBAL",4)~ + @7481 + a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  ++ @7482 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7502 + a3814 /* GET_OUT_EXIT */
  ++ @7503 + a4180 /* ARAN_UNDOES_PC_FRONT */
  ++ @7504 + a3900 /* JUST_FRIENDS_EXIT */
END

IF ~~ a4180 /* ARAN_UNDOES_PC_FRONT */
  SAY @7505
  IF ~~ THEN GOTO a4171 /* ROM_THREE_HANDS_CUP_UPWARDS */
END

IF ~~ a4179 /* LIPS_EVERYWHERE */
  SAY @7506
  IF ~~ THEN GOTO a4093 /* ROM_THREE_ARAN_TO_PC */
END

IF ~~ a4178 /* HANDS_EVERYWHERE */
  SAY @7507
  IF ~~ THEN GOTO a4093 /* ROM_THREE_ARAN_TO_PC */
END

IF ~~ a4177 /* GET_A_LITTLE_HELP_HERE */
  SAY @7508
  IF ~~ THEN GOTO a4093 /* ROM_THREE_ARAN_TO_PC */
END

IF ~~ a4176 /* ROM_TWO_CHEST_BARES_TATTOO */
  SAY @7509
  IF ~~ THEN GOTO a3954 /* ROM_TWO_LADIE_LIE_ME_DOWN_WITH_YOU */
END

IF ~~ a4175 /* PC_HAS_TATTOO */
  SAY @7510
  ++ @7511 + a3954 /* ROM_TWO_LADIE_LIE_ME_DOWN_WITH_YOU */
  ++ @7512 + a4131 /* ROM_PULSE_DEEP_ABOVE */
  ++ @7513 + a4152 /* BACK_TO_ARAN_GUIDE */
  ++ @7514 + a4174 /* ARAN_TATTOO_STORY_ONE */
  ++ @7394 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7515 + a4174 /* ARAN_TATTOO_STORY_ONE */
END

IF ~~ a4174 /* ARAN_TATTOO_STORY_ONE */
  SAY @7516
  ++ @7517 + a4085 /* ARAN_TATTOO_STORY_TWO */
  ++ @7518 + a4086 /* ARAN_TATTOO_STORY_GETTING_PHYSICAL */
  ++ @7519 + a4084 /* ARAN_TATTOO_STORY_DELAY */
  ++ @7520 + a4052 /* SUNE_SHUTDOWN_EXIT */
  ++ @7521 + a4092 /* ARAN_NEEDS_SOMETHING_WHAT_IS_IT */
END

IF ~~ a4173 /* ROM_TWO_TALK_THEN_TUSSLE */
  SAY @7522
  = @7523
  IF ~~ THEN GOTO a3954 /* ROM_TWO_LADIE_LIE_ME_DOWN_WITH_YOU */
END

/* heavy petting */
IF ~~ a4010 /* FINGERS_EXPLORE_CHARMS */  /* fingers inside */
  SAY @7524
  + ~RandomNum(2,1)~ + @7525 + a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  ++ @7526 + a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  ++ @7527 + a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  ++ @7528 + a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  + ~RandomNum(2,2)~ + @7525 + a4095 /* HOW_DO_YOU_FEEL */
  ++ @7529 + a4241 /* KISSING_GENTLY_TIP */
END

IF ~~ a4241 /* KISSING_GENTLY_TIP */
  SAY @7530
  ++ @7531 + a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  ++ @7532 +  a4240 /*  GODS_WILL_YOU_LET_ME */
  ++ @7533 + a4135 /* ROM_PULSE_MUTUAL_PLEASURE */
  ++ @7534 + a3837 /* ENDGAME_OF_TEASING */
  ++ @6569 + a3837 /* ENDGAME_OF_TEASING */
END

IF ~~ a4240 /* GODS_WILL_YOU_LET_ME  */
  SAY @7535
  ++ @7534 + a3837 /* ENDGAME_OF_TEASING */
  ++ @7536 + a3837 /* ENDGAME_OF_TEASING */
  + ~RandomNum(2,2)~ + @6554 + a3831 /* IN_NINE_HELLS */
  + ~RandomNum(2,1)~ + @6554 + a3832 /* PC_TAUNT_PERHAPS_NOT */
  ++ @6555 + a3819 /* UNFULFILLED_TEASED_EXIT */
  + ~RandomNum(2,2)~ + @6556 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6556 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
END

IF ~~ a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  SAY @7537
  IF ~~ THEN GOTO a4124 /* CONTINUE_OR_STOP_ACTION_ONE */
END

IF ~~ a4171 /* ROM_THREE_HANDS_CUP_UPWARDS */
  SAY @7538
  IF ~~ THEN GOTO a4093 /* ROM_THREE_ARAN_TO_PC */
END

IF ~~ a4095 /* HOW_DO_YOU_FEEL */
  SAY @7539
  ++ @7540 + a4170 /* NO_WHAT_I_MEANT_WAS */
  ++ @1126 + a4170 /* NO_WHAT_I_MEANT_WAS */
  ++ @7526 + a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  ++ @7527 + a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  ++ @7528 + a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  ++ @7541 + a4072 /* ROM_FRIENDS_EXIT_ONE */
END

IF ~~ a4170 /* NO_WHAT_I_MEANT_WAS */
  SAY @7542
  ++ @7543 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  ++ @7526 + a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  ++ @7527 + a4172 /* HANDS_AND_FINGERS_EVERYWHERE */
  + ~RandomNum(6,6)~ + @7544 + a4232 /* ANYWAYYOULIKEIT_3783 */
  + ~RandomNum(6,5)~ + @7544 + a4234 /* ANYWAYYOULIKEIT_3785 */
  + ~RandomNum(6,4)~ + @7544 + a4235 /* ANYWAYYOULIKEIT_3786 */
  + ~RandomNum(6,3)~ + @7544 + a4236 /* ANYWAYYOULIKEIT_3787 */
  + ~RandomNum(6,2)~ + @7544 + a4237 /* ANYWAYYOULIKEIT_3788 */
  + ~RandomNum(6,1)~ + @7544 + a4238 /* ANYWAYYOULIKEIT_3789 */
END

IF ~~ a4232 /* ANYWAYYOULIKEIT_3783 */
  SAY @7545
  ++ @7546 EXIT
  ++ @7547 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  ++ @7548 + a4233 /* TOLD_ACTION_COMPLETED */
  ++ @12496 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~RandomNum(3,3)~ + @7550 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,2)~ + @7484 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,1)~ + @7485 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
END

IF ~~ a4233 /* TOLD_ACTION_COMPLETED */
  SAY @7551
  IF ~~ THEN EXIT
END

IF ~~ a4234 /* ANYWAYYOULIKEIT_3785 */
  SAY @7552
  ++ @7546 EXIT
  ++ @7547 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  ++ @7548 + a4233 /* TOLD_ACTION_COMPLETED */
  ++ @12496 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~RandomNum(3,3)~ + @7550 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,2)~ + @7484 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,1)~ + @7485 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7553 + a3932
END

IF ~~ a3932 SAY @7560 IF ~~ THEN EXIT END

IF ~~ a4235 /* ANYWAYYOULIKEIT_3786 */
  SAY @7554
  ++ @7546 EXIT
  ++ @7547 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  ++ @7548 + a4233 /* TOLD_ACTION_COMPLETED */
  ++ @12496 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~RandomNum(3,3)~ + @7550 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,2)~ + @7484 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,1)~ + @7485 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7553 + a3932
END
IF ~~ a4236 /* ANYWAYYOULIKEIT_3787 */
  SAY @12497
  ++ @7546 EXIT
  ++ @7547 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  ++ @7548 + a4233 /* TOLD_ACTION_COMPLETED */
  ++ @12496 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~RandomNum(3,3)~ + @7550 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,2)~ + @7484 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,1)~ + @7485 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7553 + a3932
END

IF ~~ a4237 /* ANYWAYYOULIKEIT_3788 */
  SAY @7556
  = @7557
  ++ @7546 EXIT
  ++ @7547 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  ++ @7548 + a4233 /* TOLD_ACTION_COMPLETED */
  ++ @12496 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~RandomNum(3,3)~ + @7550 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,2)~ + @7484 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,1)~ + @7485 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7553 + a3932
END

IF ~~ a4238 /* ANYWAYYOULIKEIT_3789 */
  SAY @7558
  = @7559
  ++ @7546 EXIT
  ++ @7547 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  ++ @7548 + a4233 /* TOLD_ACTION_COMPLETED */
  ++ @12496 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~RandomNum(3,3)~ + @7550 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,2)~ + @7484 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(3,1)~ + @7485 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7553 + a3932
END

/* intermediaries from intermediaries, leading to filters */

IF ~~ a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  SAY @7561
  IF ~~ THEN GOTO a4074 /* ROM_ONE_TALK_ABOUT_ACCESS */
END

IF ~~ a4075 /* ROM_ONE_SLOW_KISSES_TALK */
  SAY @7562
  IF ~~ THEN GOTO a4074 /* ROM_ONE_TALK_ABOUT_ACCESS */
END

IF ~~ a4076 /* ROM_ONE_FAST_KISSES_ACTION */
  SAY @7563
  IF ~~ THEN GOTO a4074 /* ROM_ONE_TALK_ABOUT_ACCESS */
END

IF ~~ a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  SAY @7564
  + ~RandomNum(4,1)~ + @7565 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(4,2)~ + @7566 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(4,3)~ + @7567 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(4,4)~ + @7568 + a4077 /* SOLID_STOP4 */
  + ~RandomNum(4,1)~ + @7569 + a4011 /* KISSING_HOLDING_ONE */
  + ~RandomNum(4,2)~ + @7569 + a4012 /* KISSING_HOLDING_TWO */
  + ~RandomNum(4,3)~ + @7569 + a4013 /* KISSING_HOLDING_THREE */
  + ~RandomNum(4,4)~ + @7569 + a4014 /* KISSING_HOLDING_FOUR */
  ++ @7547 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7570 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7571 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7572 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7573 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7574 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7575 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7576 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7576 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3962 /* SEX_SCENE_EIGHT */
END
/* these two can loop - */
IF ~~ a4074 /* ROM_ONE_TALK_ABOUT_ACCESS */
  SAY @7577
  ++ @7578 + a4078 /* ROM_ONE_MATCH_STRIPPING */
  ++ @7579 + a4079 /* ROM_ONE_OFFER_NO_RESISTANCE */
  ++ @7580 + a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3962 /* SEX_SCENE_EIGHT */
  ++ @7582 + a4080 /* SUGGEST_SMALL_ACCESS */
END

IF ~~ a4080 /* SUGGEST_SMALL_ACCESS */
  SAY @7583
  ++ @7584 + a4072 /* ROM_FRIENDS_EXIT_ONE */
  /* no advance talking */
  + ~Global("c-aransex","GLOBAL",0)~ + @7585 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",1)~ + @7586 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",2)~ + @7448 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",3)~ + @7449 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aransex","GLOBAL",4)~ + @7450 + a4073 /* ROM_ONE_SLOW_KISSES_ACTION */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7570 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7587 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7572 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7573 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7574 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7575 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7576 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7576 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3962 /* SEX_SCENE_EIGHT */
END

IF ~~ a4081 /* PC_TAKES_CHARGE */
  SAY @7588
  ++ @7589 + a4082 /* ARAN_ROMANCE_BE_DEAD */
  ++ @7590 + a4082 /* ARAN_ROMANCE_BE_DEAD */
  ++ @7591 + a4082 /* ARAN_ROMANCE_BE_DEAD */
  ++ @7592 + a4083 /* ARAN_SWEAR_ONE */
  ++ @7593 + a4082 /* ARAN_ROMANCE_BE_DEAD */
  ++ @7594 + a3965 /* SOLID_STOP3 */
END

IF ~~ a4084 /* ARAN_TATTOO_STORY_DELAY */
  SAY @7595
  IF ~~ THEN GOTO a4085 /* ARAN_TATTOO_STORY_TWO */
END

IF ~~ a4085 /* ARAN_TATTOO_STORY_TWO */
  SAY @7596
  = @7597
  ++ @7598 + a4086 /* ARAN_TATTOO_STORY_GETTING_PHYSICAL */
  ++ @7599 + a4086 /* ARAN_TATTOO_STORY_GETTING_PHYSICAL */
  ++ @7600 + a4086 /* ARAN_TATTOO_STORY_GETTING_PHYSICAL */
  /* tease/insult options */
  + ~RandomNum(4,1)~ + @7601 + a4097 /* TEASING_ONE */
  + ~RandomNum(4,2)~ + @7602 + a4098 /* TEASING_TWO */
  + ~RandomNum(4,3)~ + @7603 + a4099 /* TEASING_THREE */
  + ~RandomNum(4,4)~ + @7604 + a4100 /* TEASING_FOUR */
END

IF ~~ a4086 /* ARAN_TATTOO_STORY_GETTING_PHYSICAL */
  SAY @7605
  IF ~~ THEN EXIT
END

/* skip to second range */

IF ~~ a4078 /* ROM_ONE_MATCH_STRIPPING */
  SAY @7606
  IF ~~ THEN GOTO a4087 /* ROM_ONE_5 */
END

IF ~~ a4079 /* ROM_ONE_OFFER_NO_RESISTANCE */
  SAY @7607
  IF ~~ THEN GOTO a4087 /* ROM_ONE_5 */
END

IF ~~ a4082 /* ARAN_ROMANCE_BE_DEAD */
  SAY @7608
  ++ @7609 + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7610 + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7611 + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7612 + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7613 + a4089 /* TRY_TO_DELAY */
END

IF ~~ a4089 /* TRY_TO_DELAY */
  SAY @7614
  IF ~~ THEN GOTO a4088 /* ROM_PULSE_DEEP_GRUNT */
END

/* Oral Exploration */

IF ~~ a4090 /* STOP_NOW_OR_CONSEQUENCE */
  SAY @7615
  ++ @7616 + a4091 /* READY_OR_NOT_HERE_I_COME */
  ++ @7617 + a4091 /* READY_OR_NOT_HERE_I_COME */
  ++ @7618 + a4091 /* READY_OR_NOT_HERE_I_COME */
  ++ @7619 + a4091 /* READY_OR_NOT_HERE_I_COME */
  ++ @7620 + a4051 /* ROM_THREE_PC_TO_ARAN */
END

/* filter states first level */

IF ~~ a4092 /* ARAN_NEEDS_SOMETHING_WHAT_IS_IT */
  SAY @7621
  ++ @7622 + a4090 /* STOP_NOW_OR_CONSEQUENCE */
  ++ @7623 + a4093 /* ROM_THREE_ARAN_TO_PC */
  ++ @7620 + a4051 /* ROM_THREE_PC_TO_ARAN */
  ++ @7624 + a3992
  + ~RandomNum(2,1)~ + @6506 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(2,2)~ + @6506 + a4070 /* ROM_FRIENDS_EXIT_THREE */
END

IF ~~ a3992 /* YOU_WANT_TO_STOP_ARE_YOU_CRAZY */
  SAY @7625
  ++ @7626 + a4090 /* STOP_NOW_OR_CONSEQUENCE */
  ++ @7627 + a4093 /* ROM_THREE_ARAN_TO_PC */
END

IF ~~ a4093 /* ROM_THREE_ARAN_TO_PC */
  SAY @7628
  /* aran explores further */
  + ~RandomNum(3,1)~ + @7629 + a4094 /* HAND_CHEEK_BARE_THIGH */
  + ~RandomNum(3,2)~ + @7629 + a4009 /* HANDS_TEASING_BARE */
  + ~RandomNum(3,3)~ + @7630 + a4095 /* HOW_DO_YOU_FEEL */
  /* stop options */
  + ~RandomNum(5,1)~ + @7631 + a4096 /* WILL_YOU_CAN_YOU */
  + ~RandomNum(5,2)~ + @7632 + a4052 /* SUNE_SHUTDOWN_EXIT */
  + ~RandomNum(5,3)~ + @7633 + a4052 /* SUNE_SHUTDOWN_EXIT */
  + ~RandomNum(5,4)~ + @7634 + a4052 /* SUNE_SHUTDOWN_EXIT */
  + ~RandomNum(5,5)~ + @7635 + a4052 /* SUNE_SHUTDOWN_EXIT */
  /* make-out options */
  + ~RandomNum(4,1)~ + @7416 + a4011 /* KISSING_HOLDING_ONE */
  + ~RandomNum(4,2)~ + @7411 + a4012 /* KISSING_HOLDING_TWO */
  + ~RandomNum(4,3)~ + @7199 + a4013 /* KISSING_HOLDING_THREE */
  + ~RandomNum(4,4)~ + @7636 + a4014 /* KISSING_HOLDING_FOUR */
  + ~RandomNum(3,1)~ + @7637 + a4094 /* HAND_CHEEK_BARE_THIGH */
  + ~RandomNum(3,2)~ + @7637 + a4009 /* HANDS_TEASING_BARE */
  + ~RandomNum(3,3)~ + @7630 + a4095 /* HOW_DO_YOU_FEEL */
END

IF ~~ a4051 /* ROM_THREE_PC_TO_ARAN */
  SAY @7638
  /* pc explores further */
  + ~RandomNum(2,1)~ + @7639 + a4094 /* HAND_CHEEK_BARE_THIGH */
  + ~RandomNum(2,2)~ + @7640 + a4009 /* HANDS_TEASING_BARE */
  /* stop options */
  + ~RandomNum(5,1)~ + @7631 + a4096 /* WILL_YOU_CAN_YOU */
  + ~RandomNum(5,2)~ + @7632 + a4052 /* SUNE_SHUTDOWN_EXIT */
  + ~RandomNum(5,3)~ + @7633 + a4052 /* SUNE_SHUTDOWN_EXIT */
  + ~RandomNum(5,4)~ + @7634 + a4052 /* SUNE_SHUTDOWN_EXIT */
  + ~RandomNum(5,5)~ + @7635 + a4052 /* SUNE_SHUTDOWN_EXIT */
  /* adult sequence */
  + ~RandomNum(2,1)~ + @7641 + a4094 /* HAND_CHEEK_BARE_THIGH */
  + ~RandomNum(2,2)~ + @7642 + a4009 /* HANDS_TEASING_BARE */
  /* make-out options */
  + ~RandomNum(4,1)~ + @7416 + a4011 /* KISSING_HOLDING_ONE */
  + ~RandomNum(4,2)~ + @7411 + a4012 /* KISSING_HOLDING_TWO */
  + ~RandomNum(4,3)~ + @7199 + a4013 /* KISSING_HOLDING_THREE */
  + ~RandomNum(4,4)~ + @7636 + a4014 /* KISSING_HOLDING_FOUR */
  /* tease/insult options */
  + ~RandomNum(4,1)~ + @7643 + a4097 /* TEASING_ONE */
  + ~RandomNum(4,2)~ + @7602 + a4098 /* TEASING_TWO */
  + ~RandomNum(4,3)~ + @7603 + a4099 /* TEASING_THREE */
  + ~RandomNum(4,4)~ + @7644 + a4100 /* TEASING_FOUR */
END

/* tease/insult options replies */
IF ~~ a4097 /* TEASING_ONE */
  SAY @7645
  ++ @7646 + a4147 /* FRONT_TO_ARAN_EXPLORE */
  + ~RandomNum(2,1)~ + @6506 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(2,2)~ + @6506 + a4070 /* ROM_FRIENDS_EXIT_THREE */
  ++ @6583 + a3819 /* UNFULFILLED_TEASED_EXIT */
  + ~RandomNum(2,2)~ + @6584 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6584 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
END

IF ~~ a4098 /* TEASING_TWO */
  SAY @7647
  ++ @6583 + a3819 /* UNFULFILLED_TEASED_EXIT */
  + ~RandomNum(2,2)~ + @6584 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6584 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  + ~RandomNum(2,1)~ + @6506 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  ++ @7646 + a4147 /* FRONT_TO_ARAN_EXPLORE */
  + ~RandomNum(2,2)~ + @6506 + a4070 /* ROM_FRIENDS_EXIT_THREE */
END

IF ~~ a4099 /* TEASING_THREE */
  SAY @7648
  + ~RandomNum(2,1)~ + @6506 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  ++ @6583 + a3819 /* UNFULFILLED_TEASED_EXIT */
  + ~RandomNum(2,2)~ + @6584 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6584 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  + ~RandomNum(2,2)~ + @6506 + a4070 /* ROM_FRIENDS_EXIT_THREE */
  ++ @7646 + a4147 /* FRONT_TO_ARAN_EXPLORE */
END

IF ~~ a4100 /* TEASING_FOUR */
  SAY @7649
  ++ @7646 + a4147 /* FRONT_TO_ARAN_EXPLORE */
  + ~RandomNum(2,1)~ + @6506 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(2,2)~ + @6506 + a4070 /* ROM_FRIENDS_EXIT_THREE */
  ++ @6583 + a3819 /* UNFULFILLED_TEASED_EXIT */
  + ~RandomNum(2,2)~ + @6584 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6584 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
END

IF ~~ a3954 /* ROM_TWO_LADIE_LIE_ME_DOWN_WITH_YOU */
  SAY @7650
  ++ @7651 + a4101 /* ROM_TWO_ACTION_FACE_TO_FACE */
  ++ @7652 + a4101 /* ROM_TWO_ACTION_FACE_TO_FACE */
  ++ @7653 + a4102 /* ROM_BACK_TO_HIS_CHEST */
  + ~RandomNum(2,1)~ + @7654 +  a4103 /* ROUGH_CHEEK_BARES_PC_BREASTS */
  + ~RandomNum(2,2)~ + @7655 + a4104 /* SMOOTH_CHEEK_TO_CHEEK_PRESS_CLOSE */
  ++ @7087 + a4147 /* FRONT_TO_ARAN_EXPLORE */
END

/* Just Fingers and Hand-Holds */

IF ~~ a4043 /* ROM_ONE_3_HANDS */
  SAY @7656
  ++ @7657 + a4105 /* PALMS_CLASP_HANDHOLDING */
  ++ @7658 + a4106 /* EXAMINE_FINGERS_HANDHOLDING */
  ++ @7659 + a4107 /* KISS_FINGERS_HANDHOLDING */
  ++ @7660 + a4108 /* PC_KISSES_FINGERTIPS */
  + ~RandomNum(3,1)~ + @7661 + a4109 /* HANDHOLDING_EXIT */
  + ~RandomNum(3,2)~ + @7661 + a4110 /* SIT_TOGETHER_HANDHOLD */
  + ~RandomNum(3,3)~ + @7661 + a4111 /* KISS_PALMS_HANDHOLD */
END

IF ~~ a4105 /* PALMS_CLASP_HANDHOLDING */
  SAY @7662
  IF ~RandomNum(5,1)~ THEN GOTO a4109 /* HANDHOLDING_EXIT */
  IF ~RandomNum(5,2)~ THEN GOTO a4110 /* SIT_TOGETHER_HANDHOLD */
  IF ~RandomNum(5,3)~ THEN GOTO a4111 /* KISS_PALMS_HANDHOLD */
  IF ~RandomNum(5,4)~ THEN GOTO a4107 /* KISS_FINGERS_HANDHOLDING */
  IF ~RandomNum(5,5)~ THEN GOTO a4106 /* EXAMINE_FINGERS_HANDHOLDING */
END

IF ~~ a4110 /* SIT_TOGETHER_HANDHOLD */
  SAY @7663
  IF ~RandomNum(5,1)~ THEN GOTO a4109 /* HANDHOLDING_EXIT */
  IF ~RandomNum(5,2)~ THEN GOTO a4110 /* SIT_TOGETHER_HANDHOLD */
  IF ~RandomNum(5,3)~ THEN GOTO a4111 /* KISS_PALMS_HANDHOLD */
  IF ~RandomNum(5,4)~ THEN GOTO a4107 /* KISS_FINGERS_HANDHOLDING */
  IF ~RandomNum(5,5)~ THEN GOTO a4106 /* EXAMINE_FINGERS_HANDHOLDING */
END

IF ~~ a4107 /* KISS_FINGERS_HANDHOLDING */
  SAY @7664
  IF ~~ THEN GOTO a4109 /* HANDHOLDING_EXIT */
END

IF ~~ a4106 /* EXAMINE_FINGERS_HANDHOLDING */
  SAY @7665
  IF ~~ THEN GOTO a4109 /* HANDHOLDING_EXIT */
END

IF ~~ a4111 /* KISS_PALMS_HANDHOLD */
  SAY @7666
  IF ~~ THEN GOTO a4109 /* HANDHOLDING_EXIT */
END

IF ~~ a4108 /* PC_KISSES_FINGERTIPS */
  SAY @7667
  IF ~~ THEN GOTO a4109 /* HANDHOLDING_EXIT */
END

/* just Kissing */

IF ~~ a4011 /* KISSING_HOLDING_ONE */
  SAY @7668
  IF ~~ THEN GOTO a4112 /* KISSING_END_STATE */
END

IF ~~ a4012 /* KISSING_HOLDING_TWO */
  SAY @7669
  IF ~~ THEN GOTO a4112 /* KISSING_END_STATE */
END

IF ~~ a4013 /* KISSING_HOLDING_THREE */
  SAY @7670
  IF ~~ THEN GOTO a4112 /* KISSING_END_STATE */
END

IF ~~ a4014 /* KISSING_HOLDING_FOUR */
  SAY @7671
  IF ~~ THEN GOTO a4112 /* KISSING_END_STATE */
END

/* second range */

IF ~~ a4087 /* ROM_ONE_5 */
  SAY @7672
  ++ @7673 + a4113 /* ROM_ONE_PERMISSION_TOUCH_TALK */
  ++ @7674 + a4114 /* ROM_ONE_PERMISSION_TOUCH_ACTION */
  ++ @7675 + a4115  /* ROM_ONE_7 */
  ++ @7676 + a4115  /* ROM_ONE_7 */
  ++ @7677 + a4116 /* ROM_ONE_THINK_PRETTY */
END

IF ~~ a4094 /* HAND_CHEEK_BARE_THIGH */
  SAY @7678
  ++ @7409 + a4010 /* FINGERS_EXPLORE_CHARMS */
  /* make-out options */
  + ~RandomNum(4,1)~ + @7416 + a4011 /* KISSING_HOLDING_ONE */
  + ~RandomNum(4,2)~ + @7411 + a4012 /* KISSING_HOLDING_TWO */
  + ~RandomNum(4,3)~ + @7199 + a4013 /* KISSING_HOLDING_THREE */
  + ~RandomNum(4,4)~ + @7636 + a4014 /* KISSING_HOLDING_FOUR */
END

IF ~~ a4096 /* WILL_YOU_CAN_YOU */
  SAY @7679
  ++ @7305 + a4114 /* ROM_ONE_PERMISSION_TOUCH_ACTION */
  ++ @7307 + a4053 /* PC_STRIPS_FOR_ARAN */

END

IF ~~ a4102 /* ROM_BACK_TO_HIS_CHEST */
  SAY @7680
  IF ~~ THEN GOTO a4117 /* ROM_ROUGH_WHISPER_BEHIND_EAR */
END

IF ~~ a4103 /* ROUGH_CHEEK_BARES_PC_BREASTS */
  SAY @7681
  IF ~~ THEN GOTO a4114 /* ROM_ONE_PERMISSION_TOUCH_ACTION */
END

IF ~~ a4104 /* SMOOTH_CHEEK_TO_CHEEK_PRESS_CLOSE */
  SAY @7682
  ++ @7683 + a4113 /* ROM_ONE_PERMISSION_TOUCH_TALK */
  + ~RandomNum(2,1)~ + @6506 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(2,2)~ + @6506 + a4070 /* ROM_FRIENDS_EXIT_THREE */
  ++ @7684 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  ++ @7677 + a4116 /* ROM_ONE_THINK_PRETTY */
END


IF ~~ a4114 /* ROM_ONE_PERMISSION_TOUCH_ACTION */
  SAY @7685
  IF ~~ THEN GOTO a4169 /* ROM_ONE_6 */
END

IF ~~ a4113 /* ROM_ONE_PERMISSION_TOUCH_TALK */
  SAY @7686
  IF ~~ THEN GOTO a4169 /* ROM_ONE_6 */
END

IF ~~ a4116 /* ROM_ONE_THINK_PRETTY */
  SAY @7687
  ++ @7688 + a4121 /* ROM_ONE_8 */
  ++ @7689 + a4121 /* ROM_ONE_8 */
  + ~RandomNum(2,1)~ + @6506 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(2,2)~ + @6506 + a4070 /* ROM_FRIENDS_EXIT_THREE */
  ++ @7690 + a4168 /* ROM_ONE_STRONGER_TOUCH */
END

IF ~~ a4115  /* ROM_ONE_7 */
  SAY @7691
  ++ @7677 + a4116 /* ROM_ONE_THINK_PRETTY */
  ++ @7692 + a4113 /* ROM_ONE_PERMISSION_TOUCH_TALK */
  ++ @7674 + a4114 /* ROM_ONE_PERMISSION_TOUCH_ACTION */
  ++ @7693 + a3965 /* SOLID_STOP3 */
END

/* filters for range 2 */

IF ~~ a4169 /* ROM_ONE_6 */
  SAY @7694
  ++ @7695 + a4116 /* ROM_ONE_THINK_PRETTY */
  ++ @7696 + a4168 /* ROM_ONE_STRONGER_TOUCH */
  ++ @7697 + a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  ++ @7698 + a4168 /* ROM_ONE_STRONGER_TOUCH */
  ++ @7699 + a4165 /* NO_TALK_JUST_THRUST */
  ++ @7700 + a4101 /* ROM_TWO_ACTION_FACE_TO_FACE */
END

IF ~~ a4168 /* ROM_ONE_STRONGER_TOUCH */
  SAY @7701
  IF ~~ THEN GOTO a4121 /* ROM_ONE_8 */
END

IF ~~ a4101 /* ROM_TWO_ACTION_FACE_TO_FACE */
  SAY @7702
  + ~RandomNum(5,5)~ + @7703 + a3982 /* BACK_TO_ARAN_ACTION_POSSIBLE_PIN */
  + ~RandomNum(5,4)~ + @7704 + a3983 /* BACK_TO_ARAN_ACTION_HAND_STROKES */
  + ~RandomNum(5,3)~ + @7705 + a3984 /* BACK_TO_ARAN_TALK_PUSH */
  + ~RandomNum(5,2)~ + @7706 + a3982 /* BACK_TO_ARAN_ACTION_POSSIBLE_PIN */
  + ~RandomNum(5,1)~ + @7707 + a3983 /* BACK_TO_ARAN_ACTION_HAND_STROKES */
  + ~RandomNum(6,6)~ + @7708 + a3976 /* FRONT_TO_ARAN6 */
  + ~RandomNum(6,5)~ + @7709 + a3981 /* FRONT_TO_ARAN1 */
  + ~RandomNum(6,4)~ + @7710 + a3980 /* FRONT_TO_ARAN2 */
  + ~RandomNum(6,3)~ + @7711 + a3979 /* FRONT_TO_ARAN3 */
  + ~RandomNum(6,2)~ + @7712 + a3978 /* FRONT_TO_ARAN4 */
  + ~RandomNum(6,1)~ + @7713 + a3976 /* FRONT_TO_ARAN6 */
  + ~RandomNum(4,1)~ + @7714 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  + ~RandomNum(4,2)~ + @7715 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  + ~RandomNum(4,3)~ + @7716 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  + ~RandomNum(4,4)~ + @7717 + a4128 /* CONTINUE_OR_STOP_ACTION_TWO */
  + ~RandomNum(7,1)~ + @7718 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(7,2)~ + @7718 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(7,3)~ + @7718 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(7,4)~ + @7718 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(7,5)~ + @7718 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(7,6)~ + @7718 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(7,7)~ + @7718 + a3967 /* FIGHT_START */
  + ~RandomNum(3,1)~ + @7719 + a4139 /* GUIDE_HAND_UP */
  + ~RandomNum(3,2)~ + @12498 + a4140 /* GUIDE_HAND_DOWN */
  + ~RandomNum(3,3)~ + @7721 + a4141 /* GUIDE_HAND_IN */
END

IF ~~ a4117 /* ROM_ROUGH_WHISPER_BEHIND_EAR */
  SAY @7722
  ++ @7723 + a4118 /* ROM_TWO_NO_THANK_YOU */
  ++ @1889 + a4119 /* ROM_TWO_YES_I_THINK_SO */
  ++ @7724 + a4120 /* TURN_ME_ROUND_BABY_RIGHT_ROUND */
END

IF ~~ a4121 /* ROM_ONE_8 */
  SAY @7725
  ++ @7580 + a4007 /* ROM_ONE_ASK_ABOUT_STOPPING */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7581 DO ~IncrementGlobal("c-arankisses","GLOBAL",1)~ + a3962 /* SEX_SCENE_EIGHT */
  ++ @7693 + a3965 /* SOLID_STOP3 */
  ++ @7726 + a4122 /* ARAN_FINGERS_ACTION */
  ++ @7087 + a4147 /* FRONT_TO_ARAN_EXPLORE */
  ++ @7727 + a4123 /* ROM_LICK_ARAN */
END

IF ~~ a4124 /* CONTINUE_OR_STOP_ACTION_ONE */
  SAY @7728
  ++ @7729 + a4165 /* NO_TALK_JUST_THRUST */
  + ~Global("c-aransex","GLOBAL",0)~ + @7730 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",1)~ + @7731 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",2)~ + @7732 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",3)~ + @7733 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",4)~ + @7734 + a4125 /* WAY_TOO_GRAPHIC */
  ++ @7735 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(5,1)~ + @7736 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7736 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7736 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7736 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,5)~ + @7736 + a3967 /* FIGHT_START */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7737 + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7737 + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7737 + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7737 + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7737 + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7737 + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7737 + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7737 + a3962 /* SEX_SCENE_EIGHT */
  + ~RandomNum(3,1)~ + @7738 + a4101 /* ROM_TWO_ACTION_FACE_TO_FACE */
  + ~RandomNum(3,2)~ + @7739 + a4126 /* ROM_TWO_ACTION_HEAT_CLOSE_FACE */
  + ~RandomNum(3,3)~ + @7740 + a4127 /* ROM_TWO_ACTION_GENTLE_TOUCH_FACE */
END

IF ~~ a4128 /* CONTINUE_OR_STOP_ACTION_TWO */
  SAY @7741
  ++ @7742 + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  + ~Global("c-aransex","GLOBAL",0)~ + @7730 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",1)~ + @7731 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",2)~ + @7732 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",3)~ + @7733 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",4)~ + @7734 + a4125 /* WAY_TOO_GRAPHIC */
  ++ @7735 + a4070 /* ROM_FRIENDS_EXIT_THREE */
  + ~RandomNum(5,1)~ + @7736 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7736 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7736 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7736 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,5)~ + @7736 + a3967 /* FIGHT_START */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7737 + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7737 + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7737 + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7737 + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7737 + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7737 + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7737 + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7737 + a3962 /* SEX_SCENE_EIGHT */
  + ~RandomNum(8,8)~ + @7743 + a4024 /* KISS_CATCH_HANDS */
  + ~RandomNum(8,7)~ + @7744 + a4008 /* ARAN_HAS_RESTRAINT */
  + ~RandomNum(8,6)~ + @7744 + a4008 /* ARAN_HAS_RESTRAINT */
  + ~RandomNum(8,5)~ + @7745 + a4008 /* ARAN_HAS_RESTRAINT */
  + ~RandomNum(8,4)~ + @7745 + a4008 /* ARAN_HAS_RESTRAINT */
  + ~RandomNum(8,3)~ + @7746 + a4019 /* KISS_PRESS_SALTY */
  + ~RandomNum(8,2)~ + @7747 + a4018 /* KISS_TIP_CHIN */
  + ~RandomNum(8,1)~ + @7748 + a4016 /* SERVE_YOU_MY_LORD */
  + ~RandomNum(3,1)~ + @7738 + a4101 /* ROM_TWO_ACTION_FACE_TO_FACE */
  + ~RandomNum(3,2)~ + @7739 + a4126 /* ROM_TWO_ACTION_HEAT_CLOSE_FACE */
  + ~RandomNum(3,3)~ + @7740 + a4127 /* ROM_TWO_ACTION_GENTLE_TOUCH_FACE */
END

/* action recheck */
IF ~~ a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  SAY @7749
  + ~Global("c-aransex","GLOBAL",0)~ + @7730 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",1)~ + @7731 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",2)~ + @7732 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",3)~ + @7733 + a4125 /* WAY_TOO_GRAPHIC */
  + ~Global("c-aransex","GLOBAL",4)~ + @7734 + a4125 /* WAY_TOO_GRAPHIC */
  ++ @7735 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(5,1)~ + @7736 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7736 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7736 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7736 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,5)~ + @7736 + a3967 /* FIGHT_START */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7737 + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7737 + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7737 + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7737 + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7737 + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7737 + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7737 + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7737 + a3962 /* SEX_SCENE_EIGHT */
  + ~RandomNum(3,1)~ + @7750 + a4101 /* ROM_TWO_ACTION_FACE_TO_FACE */
  + ~RandomNum(3,2)~ + @7750 + a4126 /* ROM_TWO_ACTION_HEAT_CLOSE_FACE */
  + ~RandomNum(3,3)~ + @7750 + a4127 /* ROM_TWO_ACTION_GENTLE_TOUCH_FACE */
END

IF ~~ a4059 /* PC_TOP_GO_ON_OR_NOT */
  SAY @7751
  ++ @7752 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a3996 /* PC_ON_TOP_ONE */
  ++ @7753 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a3996 /* PC_ON_TOP_ONE */
  ++ @7754 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4129 /* ROM_PULSE_DEEP_LIFT */
  ++ @7755 + a4130 /* CELANIL_SAVE_ME */
END

IF ~~ a3996 /* PC_ON_TOP_ONE */
  SAY @7756
  ++ @7757 + a4131 /* ROM_PULSE_DEEP_ABOVE */
  ++ @7758 + a4132 /* CANT_HOLD_ON */
  ++ @7759 + a4247 /* ROM_PULSE_DEEP_ABOVE_TWO */
  ++ @7760 + a4131 /* ROM_PULSE_DEEP_ABOVE */
  ++ @7761 + a4247 /* ROM_PULSE_DEEP_ABOVE_TWO */
END

IF ~~ a4132 /* CANT_HOLD_ON */
  SAY @7762
  ++ @7763 + a4133 /* END_GAME_TOP */
  ++ @7764 + a4133 /* END_GAME_TOP */
  ++ @7765 + a4133 /* END_GAME_TOP */
  ++ @7766 + a4133 /* END_GAME_TOP */
END


/* range 2 passthrough/delay */

IF ~~ a4139 /* GUIDE_HAND_UP */
  SAY @12499
  ++ @7087 + a4147 /* FRONT_TO_ARAN_EXPLORE */
  ++ @7768 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  ++ @7769 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  ++ @7770 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
END

IF ~~ a4140 /* GUIDE_HAND_DOWN */
  SAY @12500
  ++ @7087 + a4147 /* FRONT_TO_ARAN_EXPLORE */
  ++ @7772 + a4033 /* ROM_TWO_6 */
  ++ @7768 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  ++ @7769 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  ++ @7770 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
END

IF ~~ a4141 /* GUIDE_HAND_IN */
  SAY @7773
  ++ @7087 + a4147 /* FRONT_TO_ARAN_EXPLORE */
  ++ @7772 + a4033 /* ROM_TWO_6 */
  ++ @7768 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  ++ @7769 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  ++ @7770 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
END

IF ~~ a4118 /* ROM_TWO_NO_THANK_YOU */
  SAY @7774
  IF ~~ THEN GOTO a4033 /* ROM_TWO_6 */
END

IF ~~ a4119 /* ROM_TWO_YES_I_THINK_SO */
  SAY @7775
  IF ~~ THEN GOTO a4033 /* ROM_TWO_6 */
END

IF ~~ a4033 /* ROM_TWO_6 */
  SAY @7776
  ++ @7777 + a4134 /* LIPS_PRESS_FINGERS_UNTANGLE_BODICE */
  ++ @7778 + a4126 /* ROM_TWO_ACTION_HEAT_CLOSE_FACE */
  + ~RandomNum(5,5)~ + @7718 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7718 + a3967 /* FIGHT_START */
  + ~RandomNum(5,3)~ + @7717 + a4128 /* CONTINUE_OR_STOP_ACTION_TWO */
  + ~RandomNum(5,2)~ + @5026 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,1)~ + @7779 + a3964 /* SOLID_STOP2 */
  ++ @7780 + a4244  /* WHAT_DO_YOU_REALLY_WANT */
END

IF ~~ a4244  /* WHAT_DO_YOU_REALLY_WANT */
  SAY @7781
  + ~RandomNum(4,4)~ + @7782 + a4165 /* NO_TALK_JUST_THRUST */
  + ~RandomNum(4,3)~ + @7782 + a4004 /* ARAN_ON_TOP_FOUR */
  + ~RandomNum(4,2)~ + @7782 + a4003 /* ARAN_ON_TOP_THREE */
  + ~RandomNum(4,1)~ + @7782 + a4002 /* ARAN_ON_TOP_TWO */
  + ~RandomNum(2,1)~ + @6506 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(2,2)~ + @6506 + a4070 /* ROM_FRIENDS_EXIT_THREE */
  ++ @6489 + a3803 /* PC_DEMANDS_STRENGTH */
  ++ @6534 + a3822 /* SAUCE_FOR_GOOSE_GANDER */
  ++ @7783 + a4148 /* FRONT_TO_ARAN_FINGERS */
  ++ @6578 + a3819 /* UNFULFILLED_TEASED_EXIT */
  + ~RandomNum(2,2)~ + @6584 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6584 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  + ~RandomNum(3,3)~ + @7784 + a4112 /* KISSING_END_STATE */
  + ~RandomNum(3,2)~ + @7784 + a3911 /* ARAN_CUDDLE_ON_CHEST */
  + ~RandomNum(3,1)~ + @7784 + a4145 /* QUICK_END_FADEOUT */
END

IF ~~ a4134 /* LIPS_PRESS_FINGERS_UNTANGLE_BODICE */
  SAY @7785
  + ~RandomNum(5,1)~ + @6584 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(5,2)~ + @6584 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  + ~RandomNum(5,1)~ + @7784 + a4112 /* KISSING_END_STATE */
  + ~RandomNum(5,2)~ + @7784 + a4145 /* QUICK_END_FADEOUT */
  IF ~RandomNum(5,3)~ THEN GOTO a4127 /* ROM_TWO_ACTION_GENTLE_TOUCH_FACE */
  IF ~RandomNum(5,4)~ THEN GOTO a4126 /* ROM_TWO_ACTION_HEAT_CLOSE_FACE */
  IF ~RandomNum(5,5)~ THEN GOTO a4148 /* FRONT_TO_ARAN_FINGERS */
END

IF ~~ a4125 /* WAY_TOO_GRAPHIC */
  SAY @7786
  + ~RandomNum(2,2)~ + @6584 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6584 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  + ~RandomNum(3,3)~ + @7784 + a4112 /* KISSING_END_STATE */
  + ~RandomNum(3,2)~ + @7784 + a3911 /* ARAN_CUDDLE_ON_CHEST */
  + ~RandomNum(3,1)~ + @7784 + a4145 /* QUICK_END_FADEOUT */
  ++ @7787 + a4244  /* WHAT_DO_YOU_REALLY_WANT */
END

IF ~~ a3967 /* FIGHT_START */
  SAY @7788
  + ~RandomNum(2,2)~ + @6584 + a3833 /* ARAN_AGREES_ONE_CUDDLE */
  + ~RandomNum(2,1)~ + @6584 + a3834 /* ARAN_AGREES_TWO_CUDDLE */
  ++ @7784 + a4112 /* KISSING_END_STATE */
  + ~RandomNum(5,1)~ + @7789 + a3997 /* MAN_OR_FOOL */
  + ~RandomNum(5,1)~ + @7790 + a3997 /* MAN_OR_FOOL */
  + ~RandomNum(5,2)~ + @7789 + a3811 /* ARAN_DECIDES_NO */
  + ~RandomNum(5,2)~ + @7790 + a3939 /* NOW_YOU_ARE_PLAYING_WITH_MY_MIND */
  + ~RandomNum(5,3)~ + @7789 + a3819 /* UNFULFILLED_TEASED_EXIT */
  + ~RandomNum(5,3)~ + @7790 + a4069 /* ROM_FRIENDS_EXIT_FOUR */
  + ~RandomNum(5,4)~ + @7789 + a3866 /* FIGHT_EXIT */
  + ~RandomNum(5,4)~ + @7790 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(5,5)~ + @7790 + a3806 /* NO_WAY_THIS_OR_ANY_NIGHT */
  + ~RandomNum(5,5)~ + @7789 + a3814 /* GET_OUT_EXIT */
  ++ @7791 + a4070 /* ROM_FRIENDS_EXIT_THREE */
  ++ @7792 + a4077 /* SOLID_STOP4 */
END

/* oral redirects */
IF ~~ a4122 /* ARAN_FINGERS_ACTION */
  SAY @7793
  = @7794
  IF ~~ THEN GOTO a4135 /* ROM_PULSE_MUTUAL_PLEASURE */
END

IF ~~ a4123  /* ROM_LICK_ARAN */
  SAY @7795
  ++ @7796 + a4136 /* ARAN_ORAL_RELEASE */
  ++ @7797 + a4137 /* ARAN_MUTUAL_LICK */
  ++ @7798 + a4137 /* ARAN_MUTUAL_LICK */
  ++ @7799 + a4138 /* ARAN_RELEASE */
  ++ @7800 + a4138 /* ARAN_RELEASE */
  ++ @7801 + a4090 /* STOP_NOW_OR_CONSEQUENCE */
  ++ @7620 + a4051 /* ROM_THREE_PC_TO_ARAN */
  + ~RandomNum(2,1)~ + @6506 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(2,2)~ + @6506 + a4070 /* ROM_FRIENDS_EXIT_THREE */
END

IF ~~ a4136 /* ARAN_ORAL_RELEASE */
  SAY @7802
  = @7803
  = @7804
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ EXIT
END

IF ~~ a3973 /* KNEES_ABOVE_ARAN_ORAL */
  SAY @7805
  ++ @7796 + a4136 /* ARAN_ORAL_RELEASE */
  ++ @7797 + a4137 /* ARAN_MUTUAL_LICK */
  ++ @7798 + a4137 /* ARAN_MUTUAL_LICK */
  ++ @7799 + a4138 /* ARAN_RELEASE */
  ++ @7800 + a4138 /* ARAN_RELEASE */
  ++ @7801 +a4090 /* STOP_NOW_OR_CONSEQUENCE */
  ++ @7620 + a4051 /* ROM_THREE_PC_TO_ARAN */
  + ~RandomNum(2,1)~ + @6506 + a4071 /* ROM_FRIENDS_EXIT_TWO */
  + ~RandomNum(2,2)~ + @6506 + a4070 /* ROM_FRIENDS_EXIT_THREE */
END

IF ~~ a4091 /* READY_OR_NOT_HERE_I_COME */
  SAY @7806
  ++ @7807 + a4138 /* ARAN_RELEASE */
  ++ @7808 + a4138 /* ARAN_RELEASE */
  ++ @7534 + a4138 /* ARAN_RELEASE */
  ++ @7809 + a4158 /* LADIES_FIRST_PLEASE */
END

IF ~~ a4120 /* TURN_ME_ROUND_BABY_RIGHT_ROUND */
  SAY @7810
  IF ~~ THEN GOTO a3984 /* BACK_TO_ARAN_TALK_PUSH */
END

/* downstream filters */

IF ~~ a4126 /* ROM_TWO_ACTION_HEAT_CLOSE_FACE */
  SAY @7811
  + ~RandomNum(3,1)~ + @7719 + a4139 /* GUIDE_HAND_UP */
  + ~RandomNum(3,2)~ + @12498 + a4140 /* GUIDE_HAND_DOWN */
  + ~RandomNum(3,3)~ + @7721 + a4141 /* GUIDE_HAND_IN */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7737 + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7737 + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7737 + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7737 + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7737 + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7737 + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7737 + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7737 + a3962 /* SEX_SCENE_EIGHT */
  + ~RandomNum(5,5)~ + @7812 + a3969 /* PRESENT_TO_ARAN_TALK_FEAST */
  + ~RandomNum(5,4)~ + @7813 + a3968 /* PRESENT_TO_ARAN_ACTION_TEASE */
  + ~RandomNum(5,3)~ + @7814 + a3969 /* PRESENT_TO_ARAN_TALK_FEAST */
  + ~RandomNum(5,2)~ + @7815 + a3969 /* PRESENT_TO_ARAN_TALK_FEAST */
  + ~RandomNum(5,1)~ + @7816 + a3970 /* PRESENT_TO_ARAN_ACTION_HAND_TEASE */
  + ~RandomNum(8,8)~ + @7817 + a3981 /* FRONT_TO_ARAN1 */
  + ~RandomNum(8,7)~ + @7818 + a3980 /* FRONT_TO_ARAN2 */
  + ~RandomNum(8,6)~ + @7708 + a3976 /* FRONT_TO_ARAN6 */
  + ~RandomNum(8,5)~ + @7709 + a3980 /* FRONT_TO_ARAN2 */
  + ~RandomNum(8,4)~ + @7710 + a3979 /* FRONT_TO_ARAN3 */
  + ~RandomNum(8,3)~ + @7711 + a3978 /* FRONT_TO_ARAN4 */
  + ~RandomNum(8,2)~ + @7712 + a3977 /* FRONT_TO_ARAN5 */
  + ~RandomNum(8,1)~ + @7713 + a3976 /* FRONT_TO_ARAN6 */
  + ~RandomNum(7,7)~ + @7819 + a3975 /* KNEES_ABOVE_ARAN_HAND */
  + ~RandomNum(7,6)~ + @7820 + a4167 /* KNEES_ABOVE_ARAN_HANDS_PULL */
  + ~RandomNum(7,5)~ + @7821 + a3974 /* KNEES_ABOVE_ARAN */
  + ~RandomNum(7,4)~ + @7822 + a3974 /* KNEES_ABOVE_ARAN */
  + ~RandomNum(7,3)~ + @7823 + a3973 /* KNEES_ABOVE_ARAN_ORAL */
  + ~RandomNum(7,2)~ + @7824 + a3974 /* KNEES_ABOVE_ARAN */
  + ~RandomNum(7,1)~ + @7825 + a3973 /* KNEES_ABOVE_ARAN_ORAL */
  + ~RandomNum(5,1)~ + @7568 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7568 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7568 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7568 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,5)~ + @7568 + a3967 /* FIGHT_START */
END

IF ~~ a4127 /* ROM_TWO_ACTION_GENTLE_TOUCH_FACE */
  SAY @7826
  + ~RandomNum(9,1)~ + @7707 + a3985 /* BACK_TO_ARAN_ACTION_HAND_INTIMATE */
  + ~RandomNum(9,2)~ + @7827 + a3984 /* BACK_TO_ARAN_TALK_PUSH */
  + ~RandomNum(9,3)~ + @7703 + a3982 /* BACK_TO_ARAN_ACTION_POSSIBLE_PIN */
  + ~RandomNum(9,4)~ + @7704 + a3983 /* BACK_TO_ARAN_ACTION_HAND_STROKES */
  + ~RandomNum(9,5)~ + @7705 + a3985 /* BACK_TO_ARAN_ACTION_HAND_INTIMATE */
  + ~RandomNum(9,6)~ + @7706 + a3984 /* BACK_TO_ARAN_TALK_PUSH */
  + ~RandomNum(9,7)~ + @7707 + a3982 /* BACK_TO_ARAN_ACTION_POSSIBLE_PIN */
  + ~RandomNum(9,8)~ + @7828 + a3983 /* BACK_TO_ARAN_ACTION_HAND_STROKES */
  + ~RandomNum(9,9)~ + @7828 + a3982 /* BACK_TO_ARAN_ACTION_POSSIBLE_PIN */
  + ~RandomNum(8,8)~ + @7817 + a3981 /* FRONT_TO_ARAN1 */
  + ~RandomNum(8,7)~ + @7818 + a3980 /* FRONT_TO_ARAN2 */
  + ~RandomNum(8,6)~ + @7708 + a3976 /* FRONT_TO_ARAN6 */
  + ~RandomNum(8,5)~ + @7709 + a3980 /* FRONT_TO_ARAN2 */
  + ~RandomNum(8,4)~ + @7710 + a3979 /* FRONT_TO_ARAN3 */
  + ~RandomNum(8,3)~ + @7711 + a3978 /* FRONT_TO_ARAN4 */
  + ~RandomNum(8,2)~ + @7712 + a3977 /* FRONT_TO_ARAN5 */
  + ~RandomNum(8,1)~ + @7713 + a3976 /* FRONT_TO_ARAN6 */
  + ~RandomNum(7,7)~ + @7819 + a3975 /* KNEES_ABOVE_ARAN_HAND */
  + ~RandomNum(7,6)~ + @7820 + a3974 /* KNEES_ABOVE_ARAN */
  + ~RandomNum(7,5)~ + @7821 + a3974 /* KNEES_ABOVE_ARAN */
  + ~RandomNum(7,4)~ + @7822 + a3974 /* KNEES_ABOVE_ARAN */
  + ~RandomNum(7,3)~ + @7823 + a3973 /* KNEES_ABOVE_ARAN_ORAL */
  + ~RandomNum(7,2)~ + @7824 + a3974 /* KNEES_ABOVE_ARAN */
  + ~RandomNum(7,1)~ + @7825 + a3973 /* KNEES_ABOVE_ARAN_ORAL */
  + ~RandomNum(6,6)~ + @7829 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  + ~RandomNum(6,5)~ + @7714 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  + ~RandomNum(6,4)~ + @7715 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  + ~RandomNum(6,3)~ + @7716 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  + ~RandomNum(6,2)~ + @7717 + a3972 /* CONTINUE_OR_STOP_ACTION */
  + ~RandomNum(6,1)~ + @7830 + a3971 /* GO_ON_OR_NOT_ASK_WHAT_WRONG */
  + ~RandomNum(5,5)~ + @7812 + a3969 /* PRESENT_TO_ARAN_TALK_FEAST */
  + ~RandomNum(5,4)~ + @7813 + a3968 /* PRESENT_TO_ARAN_ACTION_TEASE */
  + ~RandomNum(5,3)~ + @7814 + a3970 /* PRESENT_TO_ARAN_ACTION_HAND_TEASE */
  + ~RandomNum(5,2)~ + @7815 + a3969 /* PRESENT_TO_ARAN_TALK_FEAST */
  + ~RandomNum(5,1)~ + @7816 + a3968 /* PRESENT_TO_ARAN_ACTION_TEASE */
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7737 + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7737 + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7737 + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7737 + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7737 + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7737 + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7737 + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7737 + a3962 /* SEX_SCENE_EIGHT */
  + ~RandomNum(5,1)~ + @7831 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 + a3967 /* FIGHT_START */
END


IF ~~ a3972 /* CONTINUE_OR_STOP_ACTION */
  SAY @7832
  + ~Global("c-aranpcbedding","LOCALS",1)~ + @7737 + a3955 /* SEX_SCENE_ONE */
  + ~Global("c-aranpcbedding","LOCALS",2)~ + @7737 + a3956 /* SEX_SCENE_TWO */
  + ~Global("c-aranpcbedding","LOCALS",3)~ + @7737 + a3957 /* SEX_SCENE_THREE */
  + ~Global("c-aranpcbedding","LOCALS",4)~ + @7737 + a3958 /* SEX_SCENE_FOUR */
  + ~Global("c-aranpcbedding","LOCALS",5)~ + @7737 + a3959 /* SEX_SCENE_FIVE */
  + ~Global("c-aranpcbedding","LOCALS",6)~ + @7737 + a3960 /* SEX_SCENE_SIX */
  + ~Global("c-aranpcbedding","LOCALS",7)~ + @7737 + a3961 /* SEX_SCENE_SEVEN */
  + ~Global("c-aranpcbedding","LOCALS",0)~ + @7737 + a3962 /* SEX_SCENE_EIGHT */
  + ~RandomNum(5,1)~ + @7833 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7833 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7833 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7833 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7833 + a3967 /* FIGHT_START */
END

/* actions */

IF ~~ a3968 /* PRESENT_TO_ARAN_ACTION_TEASE */
  SAY @7834
  ++ @7835 + a3830 /* PC_FACE_DOWN_FINISH */
  ++ @7836 + a4239
  ++ @7837 + a4240 /* GODS_WILL_YOU_LET_ME */
  ++ @7838 + a3830 /* PC_FACE_DOWN_FINISH */
  + ~RandomNum(5,1)~ + @7833 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7833 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7833 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7833 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7833 + a3967 /* FIGHT_START */

END

IF ~~ a4239
  SAY @7839
  ++ @7840 + a3969 /* PRESENT_TO_ARAN_TALK_FEAST */
  ++ @7841 + a4149 /* KNEES_ABOVE_ARAN_WRESTLE_ONTO_BACK */
  + ~RandomNum(5,1)~ + @7833 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7833 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7833 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7833 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7833 + a3967 /* FIGHT_START */
  ++ @7842 + a4142 /* LIPS_DEVOUR_NECK */
END

IF ~~ a3969 /* PRESENT_TO_ARAN_TALK_FEAST */
  SAY @7843
  ++ @7844 + a4150 /* TAKE_ME_KISS_DEEP */
  ++ @7845 + a4150 /* TAKE_ME_KISS_DEEP */
  ++ @7846 + a4150 /* TAKE_ME_KISS_DEEP */
  ++ @7847 + a4129 /* ROM_PULSE_DEEP_LIFT */
  ++ @7848 + a4150 /* TAKE_ME_KISS_DEEP */
END

IF ~~ a4149 /* KNEES_ABOVE_ARAN_WRESTLE_ONTO_BACK */
  SAY @7849
  IF ~~ THEN GOTO a3845 /* PC_ON_BACK_ONE */
END

IF ~~ a4150 /* TAKE_ME_KISS_DEEP */
  SAY @7850
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ EXIT
END

IF ~~ a3970 /* PRESENT_TO_ARAN_ACTION_HAND_TEASE */
  SAY @7851
  ++ @7835 + a3830 /* PC_FACE_DOWN_FINISH */
  ++ @7852 + a4142 /* LIPS_DEVOUR_NECK */
  ++ @7853 + a4135 /* ROM_PULSE_MUTUAL_PLEASURE */
  ++ @7854 + a3830 /* PC_FACE_DOWN_FINISH */
END

IF ~~ a4142 /* LIPS_DEVOUR_NECK */
  SAY @7855
  ++ @7856 + a4135 /* ROM_PULSE_MUTUAL_PLEASURE */
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7858 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7859 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
END

/* resolutions */

IF ~~ a3974 /* KNEES_ABOVE_ARAN */
  SAY @7860
  ++ @7861 + a4000 /* PC_ON_TOP_THREE */
  ++ @7862 + a4149 /* KNEES_ABOVE_ARAN_WRESTLE_ONTO_BACK */
  + ~RandomNum(6,6)~ + @7544 + a4232 /* ANYWAYYOULIKEIT_3783 */
  + ~RandomNum(6,5)~ + @7544 + a4234 /* ANYWAYYOULIKEIT_3785 */
  + ~RandomNum(6,4)~ + @7544 + a4235 /* ANYWAYYOULIKEIT_3786 */
  + ~RandomNum(6,3)~ + @7544 + a4236 /* ANYWAYYOULIKEIT_3787 */
  + ~RandomNum(6,2)~ + @7544 + a4237 /* ANYWAYYOULIKEIT_3788 */
  + ~RandomNum(6,1)~ + @7544 + a4238 /* ANYWAYYOULIKEIT_3789 */
  + ~RandomNum(5,1)~ + @7831 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 + a3967 /* FIGHT_START */
  ++ @7858 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7859 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7863 + a3836 /* KISS_AND_TAKE */
END

IF ~~ a3975 /* KNEES_ABOVE_ARAN_HAND */
  SAY @7864
  + ~RandomNum(5,1)~ + @7831 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 + a3967 /* FIGHT_START */
  + ~RandomNum(6,6)~ + @7544 + a4232 /* ANYWAYYOULIKEIT_3783 */
  + ~RandomNum(6,5)~ + @7544 + a4234 /* ANYWAYYOULIKEIT_3785 */
  + ~RandomNum(6,4)~ + @7544 + a4235 /* ANYWAYYOULIKEIT_3786 */
  + ~RandomNum(6,3)~ + @7544 + a4236 /* ANYWAYYOULIKEIT_3787 */
  + ~RandomNum(6,2)~ + @7544 + a4237 /* ANYWAYYOULIKEIT_3788 */
  + ~RandomNum(6,1)~ + @7544 + a4238 /* ANYWAYYOULIKEIT_3789 */
  ++ @7861 + a4000 /* PC_ON_TOP_THREE */
  ++ @7862 + a4149 /* KNEES_ABOVE_ARAN_WRESTLE_ONTO_BACK */
  ++ @7858 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7859 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7863 + a3836 /* KISS_AND_TAKE */
END

IF ~~ a4167 /* KNEES_ABOVE_ARAN_HANDS_PULL */
  SAY @7865
  + ~RandomNum(5,1)~ + @7831 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 + a3967 /* FIGHT_START */
  + ~RandomNum(6,6)~ + @7544 + a4232 /* ANYWAYYOULIKEIT_3783 */
  + ~RandomNum(6,5)~ + @7544 + a4234 /* ANYWAYYOULIKEIT_3785 */
  + ~RandomNum(6,4)~ + @7544 + a4235 /* ANYWAYYOULIKEIT_3786 */
  + ~RandomNum(6,3)~ + @7544 + a4236 /* ANYWAYYOULIKEIT_3787 */
  + ~RandomNum(6,2)~ + @7544 + a4237 /* ANYWAYYOULIKEIT_3788 */
  + ~RandomNum(6,1)~ + @7544 + a4238 /* ANYWAYYOULIKEIT_3789 */
  ++ @7861 + a4000 /* PC_ON_TOP_THREE */
  ++ @7862 + a4149 /* KNEES_ABOVE_ARAN_WRESTLE_ONTO_BACK */
  ++ @7858 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7859 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7863 + a3836 /* KISS_AND_TAKE */
END

IF ~~ a3836 /* KISS_AND_TAKE */
  SAY @7866
  ++ @6565 + a3827 /* WAIT_WE_WERE_LOVING */
  ++ @6566 + a3828 /* CANT_RESIST_MUST_RESIST */
  ++ @7867 + a4143 /* FRONT_TO_ARAN_PULSE */
  ++ @6561 + a3835 /* PC_RAKES_CHEST */
  ++ @7868 + a4012 /* KISSING_HOLDING_TWO */
  + ~RandomNum(5,1)~ + @7831 + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 + a3967 /* FIGHT_START */
END

IF ~~ a3835 /* PC_RAKES_CHEST */
  SAY @7869
  = @7870
  ++ @7871 + a3999 /* PC_ON_TOP_TWO */
  ++ @7872 + a3999 /* PC_ON_TOP_TWO */
  ++ @7873 + a4063 /* ARAN_REFUSES */
  ++ @7874 + a4063 /* ARAN_REFUSES */
  ++ @7875 + a4063 /* ARAN_REFUSES */
  ++ @7876 + a4063 /* ARAN_REFUSES */
  ++ @7877 + a4063 /* ARAN_REFUSES */
  ++ @7878 EXIT
END

IF ~~ a3845 /* PC_ON_BACK_ONE */
  SAY @7879
  IF ~RandomNum(5,5)~ THEN GOTO a4144 /* ROM_FINAL_TWO */
  IF ~RandomNum(5,4)~ THEN GOTO a4001 /* ARAN_ON_TOP_ONE */
  IF ~RandomNum(5,3)~ THEN GOTO a4002 /* ARAN_ON_TOP_TWO */
  IF ~RandomNum(5,2)~ THEN GOTO a4003 /* ARAN_ON_TOP_THREE */
  IF ~RandomNum(5,1)~ THEN GOTO a4004 /* ARAN_ON_TOP_FOUR */
END

IF ~~ a3846 /* PC_ON_BACK_TWO */
  SAY @7880
  IF ~RandomNum(5,5)~ THEN GOTO a4144 /* ROM_FINAL_TWO */
  IF ~RandomNum(5,4)~ THEN GOTO a4001 /* ARAN_ON_TOP_ONE */
  IF ~RandomNum(5,3)~ THEN GOTO a4002 /* ARAN_ON_TOP_TWO */
  IF ~RandomNum(5,2)~ THEN GOTO a4003 /* ARAN_ON_TOP_THREE */
  IF ~RandomNum(5,1)~ THEN GOTO a4004 /* ARAN_ON_TOP_FOUR */
END

IF ~~ a3999 /* PC_ON_TOP_TWO */
  SAY @7881
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7882 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7859 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7883 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7884 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7885 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
END

IF ~~ a4000 /* PC_ON_TOP_THREE */
  SAY @7887
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7890 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7892 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
END

IF ~~ a4166 /* PC_ON_TOP_FOUR */
  SAY @7893
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7890 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7894 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  IF ~RandomNum(9,9) Global("c-aransecondguess","GLOBAL",0)~ THEN GOTO a4243 /* SECOND_GUESS */
END

IF ~~ a3984 /* BACK_TO_ARAN_TALK_PUSH */
  SAY @7895
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7890 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7892 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
END

IF ~~ a3982 /* BACK_TO_ARAN_ACTION_POSSIBLE_PIN */
  SAY @7896
  + ~RandomNum(5,1)~ + @7897 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7897 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7897 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7897 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7897 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7890 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7892 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7898 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
END

IF ~~ a3983 /* BACK_TO_ARAN_ACTION_HAND_STROKES */
  SAY @7899
  ++ @7862 + a4149 /* KNEES_ABOVE_ARAN_WRESTLE_ONTO_BACK */
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7900 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @12501 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7902 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @12502 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  IF ~RandomNum(9,9) Global("c-aransecondguess","GLOBAL",0)~ THEN GOTO a4243 /* SECOND_GUESS */
END

IF ~~ a3985 /* BACK_TO_ARAN_ACTION_HAND_INTIMATE */
  SAY @7904
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7862 + a4149 /* KNEES_ABOVE_ARAN_WRESTLE_ONTO_BACK */
  ++ @7890 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7892 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
END

IF ~~ a4147 /* FRONT_TO_ARAN_EXPLORE */
  SAY @7905
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7890 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7892 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
END

IF ~~ a4148 /* FRONT_TO_ARAN_FINGERS */
  SAY @7906
  + ~RandomNum(6,6)~ + @7544 + a4232 /* ANYWAYYOULIKEIT_3783 */
  + ~RandomNum(6,5)~ + @7544 + a4234 /* ANYWAYYOULIKEIT_3785 */
  + ~RandomNum(6,4)~ + @7544 + a4235 /* ANYWAYYOULIKEIT_3786 */
  + ~RandomNum(6,3)~ + @7544 + a4236 /* ANYWAYYOULIKEIT_3787 */
  + ~RandomNum(6,2)~ + @7544 + a4237 /* ANYWAYYOULIKEIT_3788 */
  + ~RandomNum(6,1)~ + @7544 + a4238 /* ANYWAYYOULIKEIT_3789 */
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7907 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ +  a4245  /* WATCH_ME_BE_HAPPY */
  ++ @7908 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4245  /* WATCH_ME_BE_HAPPY */
  ++ @7909 + a4143 /* FRONT_TO_ARAN_PULSE */
END

IF ~~ a4245  /* WATCH_ME_BE_HAPPY */
  SAY @7910
  IF ~~ THEN GOTO a4148 /* FRONT_TO_ARAN_FINGERS */
END

IF ~~ a4143 /* FRONT_TO_ARAN_PULSE */
  SAY @7911
  IF ~~ THEN GOTO a4151 /* TOP_END_RELEASE */
END

IF ~~ a4152 /* BACK_TO_ARAN_GUIDE */
  SAY @7912
  IF ~~ THEN GOTO a4151 /* TOP_END_RELEASE */
END

IF ~~ a3981 /* FRONT_TO_ARAN1 */
  SAY @7913
  IF ~~ THEN GOTO a3845 /* PC_ON_BACK_ONE */
END
// LAST = a4245, next a4246

IF ~~ a3980 /* FRONT_TO_ARAN2 */
  SAY @7914
  ++ @7915 + a3979 /* FRONT_TO_ARAN3 */
  ++ @7916 + a3845 /* PC_ON_BACK_ONE */
  ++ @7917 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4151 /* TOP_END_RELEASE */
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7890 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7892 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  IF ~RandomNum(9,9) Global("c-aransecondguess","GLOBAL",0)~ THEN GOTO a4243 /* SECOND_GUESS */
END

IF ~~ a3979 /* FRONT_TO_ARAN3 */
  SAY @7918
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7890 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7919 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7920 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  + ~RandomNum(6,6)~ + @7544 + a4232 /* ANYWAYYOULIKEIT_3783 */
  + ~RandomNum(6,5)~ + @7544 + a4234 /* ANYWAYYOULIKEIT_3785 */
  + ~RandomNum(6,4)~ + @7544 + a4235 /* ANYWAYYOULIKEIT_3786 */
  + ~RandomNum(6,3)~ + @7544 + a4236 /* ANYWAYYOULIKEIT_3787 */
  + ~RandomNum(6,2)~ + @7544 + a4237 /* ANYWAYYOULIKEIT_3788 */
  + ~RandomNum(6,1)~ + @7544 + a4238 /* ANYWAYYOULIKEIT_3789 */
  IF ~RandomNum(9,9) Global("c-aransecondguess","GLOBAL",0)~ THEN GOTO a4243 /* SECOND_GUESS */
END

IF ~~ a3978 /* FRONT_TO_ARAN4 */
  SAY @7921
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7890 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7892 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  IF ~RandomNum(9,9) Global("c-aransecondguess","GLOBAL",0)~ THEN GOTO a4243 /* SECOND_GUESS */
END

IF ~~ a3977 /* FRONT_TO_ARAN5 */
  SAY @7921
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(6,6)~ + @7544 + a4232 /* ANYWAYYOULIKEIT_3783 */
  + ~RandomNum(6,5)~ + @7544 + a4234 /* ANYWAYYOULIKEIT_3785 */
  + ~RandomNum(6,4)~ + @7544 + a4235 /* ANYWAYYOULIKEIT_3786 */
  + ~RandomNum(6,3)~ + @7544 + a4236 /* ANYWAYYOULIKEIT_3787 */
  + ~RandomNum(6,2)~ + @7544 + a4237 /* ANYWAYYOULIKEIT_3788 */
  + ~RandomNum(6,1)~ + @7544 + a4238 /* ANYWAYYOULIKEIT_3789 */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7890 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7892 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  IF ~RandomNum(9,9) Global("c-aransecondguess","GLOBAL",0)~ THEN GOTO a4243 /* SECOND_GUESS */
END

IF ~~ a3976 /* FRONT_TO_ARAN6 */
  SAY @7922
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7831 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7890 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7892 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
END

IF ~~ a4001 /* ARAN_ON_TOP_ONE */
  SAY @7923
  ++ @7924 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4165 /* NO_TALK_JUST_THRUST */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7925 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7892 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
END

IF ~~ a4165 /* NO_TALK_JUST_THRUST */
  SAY @7926
  IF ~RandomNum(4,4)~ THEN GOTO a3837 /* ENDGAME_OF_TEASING */
  IF ~RandomNum(4,3)~ THEN GOTO a4151 /* TOP_END_RELEASE */
  IF ~RandomNum(4,2)~ THEN GOTO a4144 /* ROM_FINAL_TWO */
  IF ~RandomNum(4,1)~ THEN GOTO a4153 /* ARAN_MOON_SLEEP_4_EXIT */
END

IF ~~ a4002 /* ARAN_ON_TOP_TWO */
  SAY @7927
  IF ~RandomNum(4,4)~ THEN GOTO a3837 /* ENDGAME_OF_TEASING */
  IF ~RandomNum(4,3)~ THEN GOTO a4151 /* TOP_END_RELEASE */
  IF ~RandomNum(4,2)~ THEN GOTO a4144 /* ROM_FINAL_TWO */
  IF ~RandomNum(4,1)~ THEN GOTO a4153 /* ARAN_MOON_SLEEP_4_EXIT */
END

IF ~~ a4003 /* ARAN_ON_TOP_THREE */
  SAY @7928
  IF ~RandomNum(4,4)~ THEN GOTO a3837 /* ENDGAME_OF_TEASING */
  IF ~RandomNum(4,3)~ THEN GOTO a4151 /* TOP_END_RELEASE */
  IF ~RandomNum(4,2)~ THEN GOTO a4144 /* ROM_FINAL_TWO */
  IF ~RandomNum(4,1)~ THEN GOTO a4153 /* ARAN_MOON_SLEEP_4_EXIT */
END

IF ~~ a4004 /* ARAN_ON_TOP_FOUR */
  SAY @7929
  IF ~RandomNum(4,4)~ THEN GOTO a3837 /* ENDGAME_OF_TEASING */
  IF ~RandomNum(4,3)~ THEN GOTO a4151 /* TOP_END_RELEASE */
  IF ~RandomNum(4,2)~ THEN GOTO a4144 /* ROM_FINAL_TWO */
  IF ~RandomNum(4,1)~ THEN GOTO a4153 /* ARAN_MOON_SLEEP_4_EXIT */
END

/* static endings */
/* Having trouble with dictating PC actions; valid feedback reminded me that less control of PC is a darned good thing. But at some point, to write a scene, there has to be some "taking over" of PC if we are going to give her a story that makes sense. So, some 'scripted' byplays, only available when a PC specifically turns over control to Aran. */
IF ~~ a3955 /* SEX_SCENE_ONE */
  SAY @7930
  = @7931
  = @7932
  IF ~~ THEN DO ~SetGlobal("c-aranpcbedding","LOCALS",1) SetGlobal("c-aranintimate","GLOBAL",4)~ EXIT
END

IF ~~ a3956 /* SEX_SCENE_TWO */
  SAY @7933
  = @7934
  IF ~~ THEN DO ~SetGlobal("c-aranpcbedding","LOCALS",2) SetGlobal("c-aranintimate","GLOBAL",4)~ EXIT
END

IF ~~ a3957 /* SEX_SCENE_THREE */
  SAY @7935
  = @7936
  IF ~~ THEN DO ~SetGlobal("c-aranpcbedding","LOCALS",3) SetGlobal("c-aranintimate","GLOBAL",4)~ EXIT
END

IF ~~ a3958 /* SEX_SCENE_FOUR */
  SAY @7937
  = @7938
  = @7939
  IF ~~ THEN DO ~SetGlobal("c-aranpcbedding","LOCALS",4) SetGlobal("c-aranintimate","GLOBAL",4)~ EXIT
END

IF ~~ a3959 /* SEX_SCENE_FIVE */
  SAY @7940
  = @7941
  = @7942
  IF ~~ THEN DO ~SetGlobal("c-aranpcbedding","LOCALS",5) SetGlobal("c-aranintimate","GLOBAL",4)~ EXIT
END

IF ~~ a3960 /* SEX_SCENE_SIX */
  SAY @7943
  = @7944
  = @7945
  IF ~~ THEN DO ~SetGlobal("c-aranpcbedding","LOCALS",6) SetGlobal("c-aranintimate","GLOBAL",4)~ EXIT
END

IF ~~ a3961 /* SEX_SCENE_SEVEN */
  SAY @7946
  = @7947
  = @7948
  IF ~~ THEN DO ~SetGlobal("c-aranpcbedding","LOCALS",7) SetGlobal("c-aranintimate","GLOBAL",4)~ EXIT
END

IF ~~ a3962 /* SEX_SCENE_EIGHT */
  SAY @7949
  = @7950
  IF ~~ THEN DO ~SetGlobal("c-aranpcbedding","LOCALS",0) SetGlobal("c-aranintimate","GLOBAL",4)~ EXIT
END

/* climax and climax/ending combinations */

IF ~~ a3995 /* ROM_PULSE_DEEP_FACE */
  SAY @7951
  ++ @7952 + a3910 /* DEATH_OF_ME */
  ++ @7953 + a4155 /* DIE_HAPPY_NOW */
  ++ @7954 EXIT
  ++ @7955 + a4154 /* SECOND_TIMES_THE_CHARM */
  ++ @7956 + a4155 /* DIE_HAPPY_NOW */
  ++ @7957 + a3910 /* DEATH_OF_ME */
END

IF ~~ a4131 /* ROM_PULSE_DEEP_ABOVE_ONE */
  SAY @7958
  ++ @7959 + a4144 /* ROM_FINAL_TWO */
  ++ @7960 + a4144 /* ROM_FINAL_TWO */
  ++ @7961 + a4144 /* ROM_FINAL_TWO */
  ++ @7962 +  a4144 /* ROM_FINAL_TWO */
  ++ @7963 +  a4144 /* ROM_FINAL_TWO */
END

IF ~~ a4247 /* ROM_PULSE_DEEP_ABOVE_TWO */
  SAY @7964
  ++ @7965 + a4144 /* ROM_FINAL_TWO */
  ++ @7960 + a4144 /* ROM_FINAL_TWO */
  ++ @7966 + a4144 /* ROM_FINAL_TWO */
  ++ @7967 +  a4144 /* ROM_FINAL_TWO */
END

IF ~~ a4135 /* ROM_PULSE_MUTUAL_PLEASURE */
  SAY @7968
  ++ @7969 + a4156 /* ROM_FINAL_ONE */
  ++ @7954 EXIT
  ++ @7970 + a4156 /* ROM_FINAL_ONE */
  ++ @7971 + a4156 /* ROM_FINAL_ONE */
  ++ @7972 +  a4156 /* ROM_FINAL_ONE */
END

IF ~~ a4129 /* ROM_PULSE_DEEP_LIFT can be from intercourse or from heavy petting so set intimacy level elsewhere */
  SAY @7973
  ++ @7969 + a4156 /* ROM_FINAL_ONE */
  ++ @7954 EXIT
  ++ @7960 + a4156 /* ROM_FINAL_ONE */
  ++ @7974 + a4156 /* ROM_FINAL_ONE */
  ++ @7975 + a4156 /* ROM_FINAL_ONE */
END

IF ~~ a4088 /* ROM_PULSE_DEEP_GRUNT */
  SAY @7976
  ++ @7952 + a3910 /* DEATH_OF_ME */
  ++ @7953 + a4155 /* DIE_HAPPY_NOW */
  ++ @7977 EXIT
  ++ @7978 + a4154 /* SECOND_TIMES_THE_CHARM */
  ++ @7956 + a4155 /* DIE_HAPPY_NOW */
  ++ @7957 + a3910 /* DEATH_OF_ME */
END

IF ~~ a4144 /* ROM_FINAL_TWO */
  SAY @7979
  IF ~~ THEN GOTO a4157 /* ROM_FINAL_EXITING */
END

IF ~~ a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  SAY @12503
  = @7981
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ EXIT
END

IF ~~ a4158 /* LADIES_FIRST_PLEASE */
  SAY @7982
  = @7983
  = @7984
  IF ~~ THEN EXIT
END

IF ~~ a4154 /* SECOND_TIMES_THE_CHARM */
  SAY @7985
  IF ~~ THEN EXIT
END

IF ~~ a3837 /* ENDGAME_OF_TEASING */
  SAY @7986
  IF ~~ THEN EXIT
END

IF ~~ a3830 /* PC_FACE_DOWN_FINISH */
  SAY @7987
  = @7988
  IF ~~ THEN EXIT
END

IF ~~ a4133 /* END_GAME_TOP */
  SAY @7989
  IF ~~ THEN EXIT
END

IF ~~ a4243 /* SECOND_GUESS */
  SAY @7990
  = @7991
  ++ @7992 DO ~SetGlobal("c-aransecondguess","GLOBAL",1)~ + a4242 /* OH_FORGET_IT */
  ++ @7993 + a4242 /* OH_FORGET_IT */
  ++ @7994 + a4242 /* OH_FORGET_IT */
  ++ @7995 EXIT
  ++ @7996 + a4151 /* TOP_END_RELEASE */
END

IF ~~ a4242 /* OH_FORGET_IT */
  SAY @7997
  ++ @7924 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4165 /* NO_TALK_JUST_THRUST */
  ++ @7888 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a4145 /* QUICK_END_FADEOUT */
  ++ @7889 DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ + a4145 /* QUICK_END_FADEOUT */
  + ~RandomNum(5,1)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3963 /* SOLID_STOP1 */
  + ~RandomNum(5,2)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3964 /* SOLID_STOP2 */
  + ~RandomNum(5,3)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3965 /* SOLID_STOP3 */
  + ~RandomNum(5,4)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  + ~RandomNum(5,5)~ + @7857 DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ + a3967 /* FIGHT_START */
  ++ @7925 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7891 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4146 /* ROM_CLIMAX_CLIMB_DEEP */
  ++ @7892 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
  ++ @7886 DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ + a4088 /* ROM_PULSE_DEEP_GRUNT */
END

IF ~~ a4151 /* TOP_END_RELEASE */
  SAY @7998
  IF ~~ THEN EXIT
END

IF ~~ a4138 /* ARAN_RELEASE */
  SAY @7999
  IF ~~ THEN EXIT
END

IF ~~ a3888 /* SLEEP_NOW_INN_4_EXIT */
  SAY @8000
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",4) ClearAllActions() StartCutSceneMode() StartCutScene("c-restin")~ EXIT
END

IF ~~ a4153 /* ARAN_MOON_SLEEP_4_EXIT */
  SAY @8001
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",4)~ EXIT
END

/* Multipurpose exits - contextually malleable */

IF ~~ a4145 /* QUICK_END_FADEOUT */
  SAY @8002
  IF ~~ THEN EXIT
END

IF ~~ a4155 /* DIE_HAPPY_NOW */
  SAY @8003
  IF ~~ THEN EXIT
END

IF ~~ a3910 /* DEATH_OF_ME */
  SAY @8004
  IF ~~ THEN EXIT
END

IF ~~ a4156 /* ROM_FINAL_ONE */
  SAY @8005
  IF ~~ THEN EXIT
END

IF ~~ a4157 /* ROM_FINAL_EXITING */
  SAY @8006
  IF ~~ THEN EXIT
END

IF ~~ a3911 /* ARAN_CUDDLE_ON_CHEST */
  SAY @8007
  IF ~~ THEN EXIT
END

IF ~~ a4109 /* HANDHOLDING_EXIT */
  SAY @8008
  IF ~~ THEN EXIT
END

IF ~~ a4112 /* KISSING_END_STATE */
  SAY @8009
  IF ~~ THEN EXIT
END

/* exits: mutual fun but not necessarily intercourse */

IF ~~ a4130 /* CELANIL_SAVE_ME */
  SAY @8010
  = @8011
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ EXIT
END

IF ~~ a3903 /* MAKEOUT_IN_SHADOWS */
  SAY @8012
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ EXIT
END

IF ~~ a3873 /* MAKEOUT_INN_EXIT */
  SAY @8013
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ EXIT
END

IF ~~ a3885 /* SLEEP_NOW_INN_1_EXIT */
  SAY @8014
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("c-restin")~ EXIT
END

IF ~~ a3886 /* SLEEP_NOW_INN_2_EXIT */
  SAY @8015
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",2) ClearAllActions() StartCutSceneMode() StartCutScene("c-restin")~ EXIT
END

IF ~~ a3887 /* SLEEP_NOW_INN_3_EXIT */
  SAY @8016
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",3) ClearAllActions() StartCutSceneMode() StartCutScene("c-restin")~ EXIT
END

IF ~~ a4159 /* ARAN_MOON_SLEEP_2_EXIT */
  SAY @8017
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ EXIT
END

IF ~~ a4160 /* ARAN_MOON_SLEEP_3_EXIT */
  SAY @8018
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",3)~ EXIT
END

IF ~~ a4137 /* ARAN_MUTUAL_LICK */
  SAY @8019
  = @8020
  IF ~~ THEN EXIT
END

IF ~~ a4161 /* ARAN_MOON_SLEEP_1_EXIT */
  SAY @8021
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ EXIT
END

IF ~~ a3948 /* ARAN_MOON_MAKEOUT_EXIT */
  SAY @8022
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",2)~ EXIT
END

IF ~~ a4162 /* ARAN_MOON_WALK_EXIT */
  SAY @8023
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ EXIT
END

/* exits: friendly, unfriendly, or just stop stop the action */

IF ~~ a4083 /* ARAN_SWEAR_ONE */
  SAY @8024
  IF ~~ THEN EXIT
END

IF ~~ a4163 /* NOPE_NOT_WANTED */
  SAY @8025
  = @8026
  IF ~~ THEN EXIT
END

IF ~~ a4164 /* ROM_ARAN_HAD_IT */
  SAY @8027
  IF ~~ THEN EXIT
END

IF ~~ a4052 /* SUNE_SHUTDOWN_EXIT */
  SAY @8028
  IF ~~ THEN EXIT
END

IF ~~ a4072 /* ROM_FRIENDS_EXIT_ONE */
  SAY @8029
  IF ~~ THEN EXIT
END

IF ~~ a3900 /* JUST_FRIENDS_EXIT */
  SAY @8030
  IF ~~ THEN EXIT
END

IF ~~ a3851 /* CUDDLING_END */
  SAY @8031
  IF ~~ THEN EXIT
END

IF ~~ a3896 /* WALK_HANDHOLDING_EXIT */
  SAY @8032
  IF ~~ THEN EXIT
END

IF ~~ a3892 /* FEMALE_LEAVES */
  SAY @8033
  IF ~~ THEN EXIT
END

IF ~~ a3963 /* SOLID_STOP1 */
  SAY @8034
  IF ~~ THEN EXIT
END

IF ~~ a3964 /* SOLID_STOP2 */
  SAY @8035
  = @8036
  IF ~~ THEN EXIT
END

IF ~~ a3965 /* SOLID_STOP3 */
  SAY @8037
  IF ~~ THEN EXIT
END

IF ~~ a4077 /* SOLID_STOP4 */
  SAY @8038
  IF ~~ THEN EXIT
END

IF ~~ a3966 /* ROM_TWO_HARD_TO_STOP_GENTLEMAN */
  SAY @8039
  IF ~~ THEN EXIT
END

IF ~~ a3806 /* NO_WAY_THIS_OR_ANY_NIGHT */
  SAY @8040
  IF ~~ THEN EXIT
END

IF ~~ a3884 /* SLEEP_NOW_INN_0_EXIT */
  SAY @8041
  IF ~~ THEN DO ~SetGlobal("c-aranintimate","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("c-restin")~ EXIT
END

IF ~~ a4071 /* ROM_FRIENDS_EXIT_TWO */
  SAY @8042
  IF ~~ THEN EXIT
END

IF ~~ a4070 /* ROM_FRIENDS_EXIT_THREE */
  SAY @8043
  IF ~~ THEN EXIT
END

IF ~~ a4069 /* ROM_FRIENDS_EXIT_FOUR */
  SAY @8044
  IF ~~ THEN EXIT
END

IF ~~ a4068 /* ARAN_HOPE_SPRINGS_ETERNAL */
  SAY @8045
  IF ~~ THEN EXIT
END

IF ~~ a4067 /* ARAN_YOU_ARE_WORTH_IT */
  SAY @8046
  IF ~~ THEN EXIT
END

IF ~~ a4066 /* ARAN_CRAZY_EXIT */
  SAY @8047
  IF ~~ THEN EXIT
END

IF ~~ a3939 /* NOW_YOU_ARE_PLAYING_WITH_MY_MIND */
  SAY @8048
  IF ~~ THEN EXIT
END

IF ~~ a3811 /* ARAN_DECIDES_NO */
  SAY @8049
  IF ~~ THEN EXIT
END

IF ~~ a3869 /* JUST_FRIENDS_INN_EXIT */
  SAY @8050
  IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("c-restin")~ EXIT
END

IF ~~ a3864 /* FEMALE_EXITS */
  SAY @8051
  IF ~~ THEN EXIT
END

IF ~~ a3917 /* ARAN_MOON_FEMALE_EXIT */
  SAY @8052
  IF ~~ THEN EXIT
END

IF ~~ a3936 /* ARAN_MOON_FRIENDS_EXIT */
  SAY @8053
  IF ~~ THEN EXIT
END

IF ~~ a4065 /* SECOND_FIDDLE */
  SAY @8054
  IF ~~ THEN EXIT
END

IF ~~ a4064 /* ALL_TALK_NO_ACTION */
  SAY @8055
  IF ~~ THEN EXIT
END

IF ~~ a4063 /* ARAN_REFUSES */
  SAY @8056
  = @8057
  IF ~~ THEN EXIT
END

IF ~~ a3858 /* SOUNDED_LIKE_TEEN_SPIRIT */
  SAY @8058
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ a3819 /* UNFULFILLED_TEASED_EXIT */
  SAY @8059 = @8060
  IF ~~ THEN EXIT
END

IF ~~ a3857 /* AND_THE_HORSE_YOU_RODE_IN_ON_BIATCH */
  SAY @8061
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ a3859 /* AT_LEAST_JOB_IS_HONORABLE */
  SAY @8062
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ a3831 /* IN_NINE_HELLS */
  SAY @8063
  = @8064
  IF ~~ THEN DO ~SetGlobalTimer("c-aranismad","GLOBAL",TWO_DAYS)~ GOTO a3997 /* MAN_OR_FOOL */
END

IF ~~ a3997 /* MAN_OR_FOOL */
  SAY @8065
  ++ @8066 + a4164 /* ROM_ARAN_HAD_IT */
  ++ @8067 + a4163 /* NOPE_NOT_WANTED */
END

IF ~~ a3866 /* FIGHT_EXIT */  /* attempt to give PC last word - closer to my RL experience, anyways!  This one needs help, though... */
  SAY @8068
  ++ @8069 DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~ + a3864 /* FEMALE_EXITS */
  ++ @8070 DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~  EXIT
  ++ @8071 DO ~SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobalTimer("c-aranismad","GLOBAL",ONE_DAY)~  EXIT
  ++ @8072 + a3135
  ++ @8073 EXIT
  ++ @8074 + a3148
  ++ @6740 EXIT
END

IF ~~ a3814 /* GET_OUT_EXIT */
  SAY @8075
  IF ~RandomNum(20,1)~ THEN GOTO a3135 /* c-aranshutup2 @1312 */
  IF ~RandomNum(20,2)~ THEN GOTO a3139 /* c-aranshutup6 @1316 */
  IF ~RandomNum(20,3)~ THEN GOTO a3140 /* c-aranshutup7 @1317 */
  IF ~RandomNum(20,4)~ THEN GOTO a3146 /* c-aranshutup13 @1323 */
  IF ~RandomNum(20,5)~ THEN GOTO a3147 /* c-aranshutup14 @1324 */
  IF ~RandomNum(20,6)~ THEN GOTO a3148 /* c-aranshutup15 @1325 */
  IF ~RandomNum(20,7)~ THEN GOTO a3150 /* c-aranshutup17 @1327 */
  IF ~RandomNum(20,8)~ THEN GOTO a3153 /* c-aranshutup20 @1330 */
  IF ~RandomNum(20,9)~ THEN GOTO a3155 /* c-aranshutup22 @1332 */
  IF ~RandomNum(20,10)~ THEN GOTO a3157 /* c-aranshutup24 @1334 */
  IF ~RandomNum(20,11)~ THEN GOTO a3166 /* c-aranshutup33 @1343 */
  IF ~RandomNum(20,12)~ THEN GOTO a3170 /* c-aranshutup37 @1347  */
  IF ~RandomNum(20,13)~ THEN GOTO a3172 /* c-aranshutup39 @1349  */
  IF ~RandomNum(20,14)~ THEN GOTO a3191 /* c-aranshutup58 @1368  */
  IF ~RandomNum(20,15)~ THEN GOTO a3194 /* c-aranshutup61 @1371  */
  IF ~RandomNum(20,16)~ THEN GOTO a3196 /* c-aranshutup63 @1373  */
  IF ~RandomNum(20,17)~ THEN GOTO a3197 /* c-aranshutup64 @1374  */
  IF ~RandomNum(20,18)~ THEN GOTO a3204 /* c-aranshutup71 @1381  */
  IF ~RandomNum(20,19)~ THEN GOTO a3205 /* c-aranshutup72 @1382  */
  IF ~RandomNum(20,20)~ THEN GOTO a3207 /* c-aranshutup74 @1384  */
END


/* END OF ADULT LAND */


/* fixes and additions */

IF ~~ a5031
  SAY @1704
  IF ~~ THEN DO ~SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3) SetGlobal("KickedOut","LOCALS",1) ActionOverride("c-aran",SetLeavePartyDialogFile()) ActionOverride("c-aran",ChangeAIScript("",DEFAULT)) ActionOverride("c-aran",LeaveParty()) ActionOverride("c-aran",Enemy())~ EXIT
END


/* ToB PID Entries - evaluate to last in order */

IF ~!IsGabber(Player1)~ THEN BEGIN a2693
  SAY @8409
  IF ~~ THEN GOTO a2674
  IF ~IsGabber("c-aran")~ THEN GOTO a2675
  IF ~IsGabber("Sarevok")~ THEN GOTO a2676
  IF ~IsGabber("Minsc")~ THEN GOTO a2677
  IF ~IsGabber("Korgan")~ THEN GOTO a2678
  IF ~IsGabber("Keldorn")~ THEN GOTO a2679
  IF ~IsGabber("Valygar")~ THEN GOTO a2680
  IF ~IsGabber("Viconia")~ THEN GOTO a2681
  IF ~IsGabber("Nalia")~ THEN GOTO a2682
  IF ~IsGabber("Mazzy")~ THEN GOTO a2683
  IF ~IsGabber("Jaheira")~ THEN GOTO a2684
  IF ~IsGabber("Jan")~ THEN GOTO a2685
  IF ~IsGabber("Imoen2")~ THEN GOTO a2686
  IF ~IsGabber("HaerDalis")~ THEN GOTO a2687
  IF ~IsGabber("Edwin")~ THEN GOTO a2688
  IF ~IsGabber("Aerie")~ THEN GOTO a2689
  IF ~IsGabber("Anomen")~ THEN GOTO a2690
  IF ~IsGabber("Cernd")~ THEN GOTO a2691
  IF ~IsGabber("Yoshimo")~ THEN GOTO a2692
END

IF ~~ a2674 SAY @8411 IF ~~ THEN EXIT END
IF ~~ a2675 SAY @12504 IF ~~ THEN EXIT END
IF ~~ a2689 SAY @8491 IF ~~ THEN EXIT END
IF ~~ a2690 SAY @8492 IF ~~ THEN EXIT END
IF ~~ a2691 SAY @8493 IF ~~ THEN EXIT END
IF ~~ a2688 SAY @8494 IF ~~ THEN EXIT END
IF ~~ a2687 SAY @8495 IF ~~ THEN EXIT END
IF ~~ a2686 SAY @8496 IF ~~ THEN EXIT END
IF ~~ a2684 SAY @8497 IF ~~ THEN EXIT END
IF ~~ a2685 SAY @8498 IF ~~ THEN EXIT END
IF ~~ a2679 SAY @8499 IF ~~ THEN EXIT END
IF ~~ a2678 SAY @8500 IF ~~ THEN EXIT END
IF ~~ a2683 SAY @8501 IF ~~ THEN EXIT END
IF ~~ a2677 SAY @8502 IF ~~ THEN EXIT END
IF ~~ a2682 SAY @8503 IF ~~ THEN EXIT END
IF ~~ a2680 SAY @8504 IF ~~ THEN EXIT END
IF ~~ a2681 SAY @8505 IF ~~ THEN EXIT END
IF ~~ a2692 SAY @8506 IF ~~ THEN EXIT END

IF ~IsGabber(Player1)~ THEN BEGIN a1866 /* tob PID */
 SAY @12505
  /* General Options, both Male PC and female PC */
  /* voice/string fixer */
  ++ @8599 + a3023 /* c-aranpidvoice */
  /* Some Prefer Silence... Shutdown or re-enable gabby commenting and I_C_Ts */
  + ~Global("c-silencearan","GLOBAL",1)~ + @8549 + a3025 /* c-arantalkok */
  + ~RandomNum(2,1) Global("c-silencearan","GLOBAL",0)~ + @12506 + a1867 /* c-aransilence2 */
  + ~RandomNum(2,2) Global("c-silencearan","GLOBAL",0)~ + @8548 + a3024 /* c-aransilence */
  /* class - dependent , Aran (1 or 2 ) */
  + ~Class("c-aran",MAGE_ALL)~ + @8571 + a3065 /*  c-aranpidmage2 */
  + ~Class("c-aran",FIGHTER_ALL)~ + @8572 + a3066 /*  c-aranpidfighter2 */
  + ~Class("c-aran",THIEF_ALL)~ + @8573 + a3067 /*  c-aranpidthief2 */
  + ~Class("c-aran",CLERIC_ALL)~ + @8574 + a3068 /*  c-aranpidcleric2 */
  + ~Class("c-aran",PALADIN_ALL)~ + @8575 + a3069 /* c-aranpidpally2 */
  + ~Class("c-aran",SORCERER)~ + @8576 + a3070 /*  c-aranpidsorc2 */
  + ~Class("c-aran",MONK)~ + @8577 + a3071 /*  c-aranpidmonk2 */
  + ~Class("c-aran",BARD_ALL)~ + @8578 + a3072 /*  c-aranpidbard2 */
  /* area - dependent advice (1) */
  + ~AreaCheck("AR4500")~ + @8600 + a1982 /* Pocket Plane */
  + ~AreaCheck("AR5000")~ + @8600 + a1983 /* Saradush */
  + ~AreaCheck("AR5001")~ + @8600 + a1984 /* Gromnir 1st Level */
  + ~AreaCheck("AR5002")~ + @8600 + a1985 /* Gromnir's Hideout */
  + ~AreaCheck("AR5003")~ + @8600 + a1986 /* Saradush Tavern (Tankard Tree) */
  + ~AreaCheck("AR5004")~ + @8600 + a1987 /* Temple of Waukeen */
  + ~AreaCheck("AR5005")~ + @8600 + a1988 /* Gromnir's Barracks */
  + ~AreaCheck("AR5006")~ + @8600 + a1989 /* Saradush Prison */
  + ~AreaCheck("AR5007")~ + @8600 + a1990 /* Basement Entrance to Gromnir's Hideout */
  + ~AreaCheck("AR5008")~ + @8600 + a1991 /* Kiser's Home */
  + ~AreaCheck("AR5009")~ + @8600 + a1992 /* House (no exit?) */
  + ~AreaCheck("AR5010")~ + @8600 + a1993 /* Countess Santele's Home */
  + ~AreaCheck("AR5011")~ + @8600 + a1994 /* Arcana Archives */
  + ~AreaCheck("AR5012")~ + @8600 + a1995 /* House */
  + ~AreaCheck("AR5013")~ + @8600 + a1996 /* Sewers beneath Saradush */
  + ~AreaCheck("AR5014")~ + @8600 + a1997 /* Kiser's Home -- Cellar */
  + ~AreaCheck("AR5015")~ + @8600 + a1998 /* Saradush Militia Entrance */
  + ~AreaCheck("AR5016")~ + @8600 + a1999 /* Saradush Castle Jail (Kiser Plot) */
  + ~AreaCheck("AR5200")~ + @8600 + a2000 /* Fire Giant Entrance Area */
  + ~AreaCheck("AR5201")~ + @8600 + a2001 /* Fire Giant Keep */
  + ~AreaCheck("AR5202")~ + @8600 + a2002 /* Nyalee's Hideout; Gorion Wraith */
  + ~AreaCheck("AR5203")~ + @8600 + a2003 /* Yaga-Shura's Camp */
  + ~AreaCheck("AR5204")~ + @8600 + a2004 /* Yaga-Shura's Keep */
  + ~AreaCheck("AR5500")~ + @8600 + a2005 /* Amkethran */
  + ~AreaCheck("AR5501")~ + @8600 + a2006 /* Amkethran Inn */
  + ~AreaCheck("AR5502")~ + @8600 + a2007 /* Kerrick the Smith's House */
  + ~AreaCheck("AR5503")~ + @8600 + a2008 /* Chyil's House */
  + ~AreaCheck("AR5504")~ + @8600 + a2009 /* Smuggler Cave */
  + ~AreaCheck("AR5505")~ + @8600 + a2010 /* Balthazar's Home */
  + ~AreaCheck("AR5506")~ + @8600 + a2011 /* Commoner's Home */
  + ~AreaCheck("AR5507")~ + @8600 + a2012 /* Empty Home */
  + ~AreaCheck("AR5508")~ + @8600 + a2013 /* Faheed's Home */
  + ~AreaCheck("AR5509")~ + @8600 + a2014 /* Amkethran Crypt */
  + ~AreaCheck("AR6000")~ + @8600 + a2015 /* Abazigal's Entrance */
  + ~AreaCheck("AR6001")~ + @8600 + a2016 /* Abazigal's Lair Entrance Hall */
  + ~AreaCheck("AR6002")~ + @8600 + a2017 /* Abazigal's Lair -- Cells */
  + ~AreaCheck("AR6003")~ + @8600 + a2018 /* Abazigal's Lair -- Iycanth the Mad, Bondari */
  + ~AreaCheck("AR6004")~ + @8600 + a2019 /* Abazigal's Lair -- Fll'Yissetat */
  + ~AreaCheck("AR6005")~ + @8600 + a2020 /* Abazigal's Hideout */
  + ~AreaCheck("AR6008")~ + @8600 + a2021 /* Frost Salamander Cave */
  + ~AreaCheck("AR6011")~ + @8600 + a2022 /* Orbs and Gauth */
  + ~AreaCheck("AR6012")~ + @8600 + a2023 /* Pool Home -- breath under water */
  + ~AreaCheck("AR6100")~ + @8600 + a2024 /* Area outside Sendai's Hideout */
  + ~AreaCheck("AR6101")~ + @8600 + a2025 /* Main Entrance Sendai's Lair */
  + ~AreaCheck("AR6102")~ + @8600 + a2026 /* Sendai's Lair -- Slavemaster */
  + ~AreaCheck("AR6103")~ + @8600 + a2027 /* Sendai's Lair -- Spiders */
  + ~AreaCheck("AR6104")~ + @8600 + a2028 /* Sendai's Lair -- Crossway */
  + ~AreaCheck("AR6105")~ + @8600 + a2029 /* Sendai's Lair -- Diaytha, Abishai */
  + ~AreaCheck("AR6106")~ + @8600 + a2030 /* Sendai's Lair -- Captain Egeissag */
  + ~AreaCheck("AR6107")~ + @8600 + a2031 /* Sendai's Lair -- Mithykyl */
  + ~AreaCheck("AR6108")~ + @8600 + a2032 /* Sendai's Lair -- Sendai */
  + ~AreaCheck("AR6109")~ + @8600 + a2033 /* Sendai's Lair -- Drow */
  + ~AreaCheck("AR6110")~ + @8600 + a2034 /* Sendai's Lair -- Odamaron */
  + ~AreaCheck("AR6111")~ + @8600 + a2035 /* Woodcutter's House -- Sendai's Area */
  + ~AreaCheck("AR6200")~ + @8600 + a2036 /* The Throne of Bhaal */
  + ~AreaCheck("AR6300")~ + @8600 + a2037 /* Oasis in Tethyr */
  + ~AreaCheck("AR6400")~ + @8600 + a2038 /* River Area */
  /* reputation - dependent (1) */
  + ~ReputationGT(Player1,17)~ + @8561 + a3060 /*  c-aranpidgood tob_ */
  + ~ReputationLT(Player1,18) ReputationGT(Player1,14)~ + @8561 + a3061 /*  c-aranpidbetter tob_ */
  + ~ReputationLT(Player1,15) ReputationGT(Player1,9)~ + @8561 + a3062 /*  c-aranpidneutral tob_ */
  + ~ReputationLT(Player1,10) ReputationGT(Player1,4)~ + @8561 + a3063 /*  c-aranpidbad tob_ */
  + ~ReputationLT(Player1,5)~ + @8561 + a3064 /* c-aranpidevil tob_ */
  /* Just For Fun... */
  + ~RandomNum(4,1)~ + @12507 + a1873
  + ~RandomNum(4,2)~ + @12508 + a1874
  + ~RandomNum(4,3)~ + @12509 + a1875
  + ~RandomNum(4,4)~ + @12510 + a1876
  /* Watcher's Keep - ToB duplicates  */
  /* AreaCheck("AR3000") Watcher's Keep AreaCheck("AR3001") Watcher's Keep -- Altar level  AreaCheck("AR3003") Watcher's Keep -- Compass level AreaCheck("AR3004") Watcher's Keep */
  + ~Global("c-aranpidWK1","LOCALS",0) OR(4) AreaCheck("AR3000") AreaCheck("AR3001") AreaCheck("AR3003") AreaCheck("AR3004")~ + @8632 DO ~SetGlobal("c-aranpidWK1","LOCALS",1)~ + a3073 /* c-aranpidWK1 tob_ */
  /*  AreaCheck("AR3005")  Watcher's Keep -- tieflings  AreaCheck("AR3006")  Watcher's Keep -- Succubus  AreaCheck("AR3007")  Watcher's Keep -- Cambion  AreaCheck("AR3008")  Watcher's Keep -- Balor (Paladin Sword)  */
  + ~Global("c-aranpidWK2","LOCALS",0) OR(4) AreaCheck("AR3005") AreaCheck("AR3006") AreaCheck("AR3007") AreaCheck("AR3008")~ + @8633 DO ~SetGlobal("c-aranpidWK2","LOCALS",1)~ + a3074 /*  c-aranpidWK2 tob_ */
  /*  AreaCheck("AR3009")  Watcher's Keep  AreaCheck("AR3010")  Watcher's Keep -- Tanarri -- Obelisk  AreaCheck("AR3011")  Watcher's Keep -- Bards Gloves, Manmans Journal  AreaCheck("AR3012")  Watcher's Keep -- Tahazzar  */
  + ~Global("c-aranpidWK3","LOCALS",0) OR(4) AreaCheck("AR3009") AreaCheck("AR3010") AreaCheck("AR3011") AreaCheck("AR3012")~ + @8634 DO ~SetGlobal("c-aranpidWK3","LOCALS",1)~ + a3075 /*  c-aranpidWK3 tob_ */
  /*  AreaCheck("AR3013")  Watcher's Keep -- Karashur  AreaCheck("AR3014")  Watcher's Keep -- White Dragon Scales  AreaCheck("AR3015")  Watcher's Keep -- Aesgareth  AreaCheck("AR3016")  Watcher's Keep -- Chromatic Demon; Elementalist Level  */
  + ~Global("c-aranpidWK4","LOCALS",0) OR(4) AreaCheck("AR3013") AreaCheck("AR3014") AreaCheck("AR3015") AreaCheck("AR3016")~ + @8635 DO ~SetGlobal("c-aranpidWK4","LOCALS",1)~ + a3076 /*  c-aranpidWK4 tob_ */
  /*  AreaCheck("AR3017")  Watcher's Keep -- Carston and the machine  AreaCheck("AR3018")  Watcher's Keep -- Saladrex (Dragon)  AreaCheck("AR3019")  Watcher's Keep -- Helmite Level -- Last Seals  AreaCheck("AR3020")  Watcher's Keep -- Imprisoned One  AreaCheck("AR3021")  Watcher's Keep -- Ilithids  AreaCheck("AR3022")  Watcher's Keep -- Anti-Paladins  */
  + ~Global("c-aranpidWK5","LOCALS",0) OR(6) AreaCheck("AR3017") AreaCheck("AR3018") AreaCheck("AR3019") AreaCheck("AR3020") AreaCheck("AR3021") AreaCheck("AR3022")~ + @8636 DO ~SetGlobal("c-aranpidWK5","LOCALS",1)~ + a3077 /*  c-aranpidWK5 tob_ */
  /*  AreaCheck("AR3023")  Watcher's Keep -- "Adventure Level" (Mini Map!!!)  AreaCheck("AR3024")  Watcher's Keep -- Dragon -- Fear Challenge  AreaCheck("AR3025")  Watcher's Keep -- Orcs -- Ixilos Nail  AreaCheck("AR3026")  Watcher's Keep -- Imp -- Game  AreaCheck("AR3027")  Watcher's Keep -- Crypt -- Demi-Lich  */
  + ~Global("c-aranpidWK6","LOCALS",0) OR(5) AreaCheck("AR3023") AreaCheck("AR3024") AreaCheck("AR3025") AreaCheck("AR3026") AreaCheck("AR3027")~ + @8637 DO ~SetGlobal("c-aranpidWK6","LOCALS",1)~ + a3078 /*  c-aranpidWK6  tob_ */
  ++ @8590 + a3210
  /* FLIRT MENU ADDITIONS, female PC's only */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",1)~ + @8580 + a3026 /* c-aranpidnointerest */
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + @8581 + a3027 /* c-aranpidbreakup */
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",3) Global("c-aranmakeup","GLOBAL",0)~ + @8638 DO ~SetGlobal("c-aranmakeup","GLOBAL",1)~ + a3028 /* c-aranpidbreakupover1 */
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",3) Global("c-aranmakeup","GLOBAL",1)~ + @8638 DO ~SetGlobal("c-aranmakeup","GLOBAL",2)~ + a3120 /* c-aranpidbreakupover2 */
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",3) Global("c-aranmakeup","GLOBAL",2)~ + @8638 + a3121 /* c-aranpidbreakupover3 */
  /* PID Anomen Romance Conflict Toggle */
  + ~InParty("Anomen") 
   OR(10)
   GlobalGT("c-aanocon120","GLOBAL",0)
   GlobalGT("c-aanocon121","GLOBAL",0)
   GlobalGT("c-aanocon158","GLOBAL",0)
   GlobalGT("c-aanocon194","GLOBAL",0)
   GlobalGT("c-aanocon212","GLOBAL",0)
   GlobalGT("c-aanocon224","GLOBAL",0)
   GlobalGT("c-aanocon232","GLOBAL",0)
   GlobalGT("c-aanocon287","GLOBAL",0)
   GlobalGT("c-anomenaran","GLOBAL",0)
   GlobalGT("c-arananomen","GLOBAL",0)
  Global("c-aanoconflict","GLOBAL",0)~ + @8583 + a3029 /* c-aranvsanom1s */
  + ~InParty("Anomen") Global("c-aanoconflict","GLOBAL",1)~ + @8584 + a3030 /* c-aranvsanom1c */
  /* Stop or Restart Flirting; (1) of the three should be active at any one time. None show for males. */
  /*  PC Doesn't Want NPC Initiated flirts */
  + ~Gender(Player1,FEMALE) Global("c-aranflirtstop","GLOBAL",0) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2)~ + @8639 + a3079 /* c-aranrestopflirts tob_ */
  /* PC Wants NPC Initiated Flirts */
  + ~Gender(Player1,FEMALE) Global("c-aranflirtstop","GLOBAL",1) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) Global("c-aranfight","GLOBAL",0)~ + @8588 + a3080 /* c-aranrestartflirts tob_ */
  /* PC Wants NPC Initiated Flirts but Aran is Mad */
  + ~Gender(Player1,FEMALE) Global("c-aranflirtstop","GLOBAL",1) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) Global("c-aranfight","GLOBAL",1)~ + @8588 + a3081 /* c-aranrestartflirtsmad tob_ */
  /*  PC Initiated Flirting;  (1) of the four should be active at any one time. None show for males. */
  /* PC Wants To Initiate A Flirt: ToB */
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) Global("c-aranfight","GLOBAL",0)~ + @8589 + a3059 /*  c-pcflirtsaran3 */
  /* 2d - PC Wants To Initiate A Flirt, But Aran Is Angry - handled within submenu  */
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) RandomNum(5,5)~ + @12511 + a1868
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) RandomNum(5,4)~ + @12511 + a1869
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) RandomNum(5,3)~ + @12511 + a1870
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) RandomNum(5,2)~ + @12511 + a1871
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) RandomNum(5,1)~ + @12511 + a1872
  /* PID requests,  PC = Female PID */
  /* blocking for 'goaded' talk triggered at rest, and var already set - also, no nookie during waking hours in a dungeon. */
  + ~Global("c-aranrom","GLOBAL",2) Gender(Player1,FEMALE) !Global("c-arannightvisit","GLOBAL",1) !Global("c-arangoaded","GLOBAL",1) AreaType(DUNGEON) RandomNum(2,2)~ + @8594 + a4210 /* NOT_RIGHT_HERE_NOW_ONE  */
  + ~Global("c-aranrom","GLOBAL",2) Gender(Player1,FEMALE) !Global("c-arannightvisit","GLOBAL",1) !Global("c-arangoaded","GLOBAL",1) AreaType(DUNGEON) RandomNum(2,1)~ + @8595 + a4225 /* NOT_RIGHT_HERE_NOW  */
  + ~Global("c-aranrom","GLOBAL",2) Gender(Player1,FEMALE) !Global("c-arannightvisit","GLOBAL",1) !Global("c-arangoaded","GLOBAL",1) !AreaType(DUNGEON) RandomNum(2,2)~ + @8594 + a4212 /* START_RIGHT_HERE_NOW  */
  + ~Global("c-aranrom","GLOBAL",2) Gender(Player1,FEMALE) !Global("c-arannightvisit","GLOBAL",1) !Global("c-arangoaded","GLOBAL",1) !AreaType(DUNGEON) RandomNum(2,1)~ + @8595 + a4212 /* START_RIGHT_HERE_NOW  */
  + ~Global("c-aranrom","GLOBAL",2) Gender(Player1,FEMALE) !Global("c-arannightvisit","GLOBAL",1) RandomNum(4,4)~ + @7168 + a4204  /* AGREE_TO_MEET_ONE  */
  + ~Global("c-aranrom","GLOBAL",2) Gender(Player1,FEMALE) !Global("c-arannightvisit","GLOBAL",1) RandomNum(4,3)~ + @7168 + a4203  /* AGREE_TO_MEET_TWO  */
  + ~Global("c-aranrom","GLOBAL",2) Gender(Player1,FEMALE) !Global("c-arannightvisit","GLOBAL",1) RandomNum(4,2)~ + @7168 + a4202  /* AGREE_TO_MEET_THREE  */
  + ~Global("c-aranrom","GLOBAL",2) Gender(Player1,FEMALE) !Global("c-arannightvisit","GLOBAL",1) RandomNum(4,1)~ + @7168 + a4201  /* AGREE_TO_MEET_FOUR  */
  + ~Global("c-aranrom","GLOBAL",2) Gender(Player1,FEMALE) Global("c-arannightvisit","GLOBAL",1) !Global("c-arangoaded","GLOBAL",1)~ + @8596 + a4205 /* WHY_DID_YOU_ASK  */
  /* logic check, so "goaded" or delay of "goaded' does not get an opportunity to shut it down - the point is Aran actually takes initiative to the 'unspoken' request. */
  /* PID Scribing Scrolls Blocks */
  + ~Global("c-arnscrollwork","GLOBAL",0) Global("c-aranscribe","GLOBAL",0)~ + @8591 DO ~SetGlobal("c-arnscrollwork","GLOBAL",1)~ + a3031
  + ~Global("c-arnscrollwork","GLOBAL",1) Global("c-aranscribe","GLOBAL",0)~ + @8592 + a3031
  + ~Global("c-arnscrollwork","GLOBAL",1) Global("c-aranscribe","GLOBAL",0)~ + @8591 + a3043
  + ~Global("c-aranscribe","GLOBAL",1) RandomNum(5,1)~ + @8593 + a3032
  + ~Global("c-aranscribe","GLOBAL",1) RandomNum(5,2)~ + @8593 + a3033
  + ~Global("c-aranscribe","GLOBAL",1) RandomNum(5,3)~ + @8593 + a3034
  + ~Global("c-aranscribe","GLOBAL",1) RandomNum(5,4)~ + @8593 + a3035
  + ~Global("c-aranscribe","GLOBAL",1) RandomNum(5,5)~ + @8593 + a3036
  /* nothing PC wants to talk about escape */
  ++ @8597 + a3127
  /* LEAT21 - Human Flesh +5 evil armor equipped complaints */
  IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",0)~ THEN GOTO a3132
  IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",1) GlobalTimerExpired("c-aranskin","GLOBAL")~ THEN GOTO a3131
  IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",2) GlobalTimerExpired("c-aranskin","GLOBAL")~ THEN GOTO a3130
END

/* voice/string fixer */
IF ~~ a3023 /* c-aranpidvoice */
  SAY @12512
  IF ~~ THEN DO ~SetName(@68)
  SetPlayerSound(Myself,@12513,0) /* INITIAL_MEETING */
  SetPlayerSound(Myself,@12514,1) /* MORALE */
  SetPlayerSound(Myself,@12515,2) /* HAPPY */
  SetPlayerSound(Myself,@12516,3) /* UNHAPPY_ANNOYED */
  SetPlayerSound(Myself,@12517,4) /* UNHAPPY_SERIOUS */
  SetPlayerSound(Myself,@12518,5) /* UNHAPPY_BREAKING_POINT */
  SetPlayerSound(Myself,@12519,6) /* LEADER */
  SetPlayerSound(Myself,@12520,7) /* TIRED */
  SetPlayerSound(Myself,@12521,8) /* BORED */
  SetPlayerSound(Myself,@12522,9) /* BATTLE_CRY1 */
  SetPlayerSound(Myself,@12523,10) /* BATTLE_CRY2 */
  SetPlayerSound(Myself,@12524,11) /* BATTLE_CRY3 */
  SetPlayerSound(Myself,@12525,12) /* BATTLE_CRY4 */
  SetPlayerSound(Myself,@12526,13) /* BATTLE_CRY5 */
  SetPlayerSound(Myself,@12527,18) /* DAMAGE ah... */
  SetPlayerSound(Myself,@84,19) /* DYING aarrgh... */
  SetPlayerSound(Myself,@12528,20) /* HURT */
  SetPlayerSound(Myself,@12529,21) /* AREA_FOREST */
  SetPlayerSound(Myself,@12530,22) /* AREA_CITY */
  SetPlayerSound(Myself,@12531,23) /* AREA_DUNGEON */
  SetPlayerSound(Myself,@12532,24) /* AREA_DAY */
  SetPlayerSound(Myself,@12533,25) /* AREA_NIGHT */
  SetPlayerSound(Myself,@12534,26) /* SELECT_COMMON1 */
  SetPlayerSound(Myself,@12535,27) /* SELECT_COMMON2 */
  SetPlayerSound(Myself,@12536,28) /* SELECT_COMMON3 */
  SetPlayerSound(Myself,@12537,29) /* SELECT_COMMON4 */
  SetPlayerSound(Myself,@12538,30) /* SELECT_COMMON5 */
  SetPlayerSound(Myself,@12539,31) /* SELECT_COMMON6 */
  SetPlayerSound(Myself,@12540,32) /* SELECT_ACTION1 */
  SetPlayerSound(Myself,@12541,33) /* SELECT_ACTION2 */
  SetPlayerSound(Myself,@12542,34) /* SELECT_ACTION3 */
  SetPlayerSound(Myself,@12543,35) /* SELECT_ACTION4 */
  SetPlayerSound(Myself,@12544,36) /* SELECT_ACTION5 */
  SetPlayerSound(Myself,@12545,37) /* SELECT_ACTION6 */
  SetPlayerSound(Myself,@12546,38) /* SELECT_ACTION7 */
  SetPlayerSound(Myself,@12547,63) /* SELECT_RARE1 */
  SetPlayerSound(Myself,@12548,64) /* SELECT_RARE2 */
  SetPlayerSound(Myself,@12549,65) /* CRITICAL_HIT */
  SetPlayerSound(Myself,@12550,66) /* CRITICAL_MISS */
  SetPlayerSound(Myself,@12551,67) /* TARGET_IMMUNE */
  SetPlayerSound(Myself,@12552,68) /* INVENTORY_FULL */
  SetPlayerSound(Myself,@12553,69) /* PICKED_POCKET */
  SetPlayerSound(Myself,@12554,70) /* HIDDEN_IN_SHADOWS */
  SetPlayerSound(Myself,@12555,71) /* SPELL_DISRUPTED */
  SetPlayerSound(Myself,@12556,72) /* SET_A_TRAP */
  SetPlayerSound(Myself,@12557,74)~ /* BIOGRAPHY_TEXT */
  EXIT
END

/* c-aransilence */
IF ~~ a3024 SAY @8912 IF ~~ THEN DO ~SetGlobal("c-silencearan","GLOBAL",1)~ EXIT END
/* c-arantalkok */
IF ~~ a3025 SAY @8913 IF ~~ THEN DO ~SetGlobal("c-silencearan","GLOBAL",0)~ EXIT END

/* LEAT21  Human Flesh +5 evil armor equipped; ToB Content */
/* IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",0)~ THEN GOTO a3132 */ 
/* IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",1) GlobalTimerExpired("c-aranskin","GLOBAL")~ GOTO a3131 */
/* IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",2) GlobalTimerExpired("c-aranskin","GLOBAL")~ GOTO a3130 */

/* tiebacks possible with cut & paste */
IF ~~ a3128 SAY @1499 IF ~~ THEN EXIT END
IF ~~ a3129 SAY @1500 IF ~~ THEN EXIT END

IF ~~ a3130
  SAY @1493
  ++ @1494 DO ~SetGlobal("c-arskinarm","LOCALS",3)~ + a3129
  ++ @1495 DO ~SetGlobal("c-arskinarm","LOCALS",3)~ + a3129
  ++ @1496 DO ~SetGlobal("c-arskinarm","LOCALS",3)~ + a3129
  ++ @1497 DO ~SetGlobal("c-arskinarm","LOCALS",3)~ + a3129
  ++ @1498 DO ~SetGlobal("c-arskinarm","LOCALS",3)~ + a3129
END

IF ~~ a3131
  SAY @1488
  ++ @1489 DO ~SetGlobal("c-arskinarm","LOCALS",2) SetGlobalTimer("c-aranskin","GLOBAL",FOUR_DAYS)~ + a3128
  ++ @1490 DO ~SetGlobal("c-arskinarm","LOCALS",2) SetGlobalTimer("c-aranskin","GLOBAL",FOUR_DAYS)~ + a3128
  ++ @1491 DO ~SetGlobal("c-arskinarm","LOCALS",2) SetGlobalTimer("c-aranskin","GLOBAL",FOUR_DAYS)~ + a3128
  ++ @1492 DO ~SetGlobal("c-arskinarm","LOCALS",2) SetGlobalTimer("c-aranskin","GLOBAL",FOUR_DAYS)~ + a3128
END

IF ~~ a3132
  SAY @5673
  IF ~~ THEN DO ~SetGlobal("c-arskinarm","LOCALS",1) SetGlobalTimer("c-aranskin","GLOBAL",FOUR_DAYS)~ EXIT
END

/* romance - dependent (1) to allow breakup or resume romance. */
IF ~~ a3026 SAY @8958 IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~ EXIT END /* c-aranpidnointerest */
IF ~~ a3027 SAY @8959 IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~ EXIT END /* c-aranpidbreakup */
IF ~~ a3028 SAY @8960 IF ~~ THEN DO ~SetGlobal("c-aranmakeup","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ EXIT END /* c-aranpidbreakupover */
IF ~~ a3029 SAY @8961 IF ~~ THEN DO ~SetGlobal("c-aanoconflict","GLOBAL",1)~ EXIT END /* c-aranvsanom1s */
IF ~~ a3030 SAY @8962 IF ~~ THEN DO ~SetGlobal("c-aanoconflict","GLOBAL",0)~ EXIT END /* c-aranvsanom1c */
IF ~~ a3120 SAY @9649 IF ~~ THEN EXIT END /* c-aranpidbreakupover2 */
IF ~~ a3121 SAY @9650 IF ~~ THEN EXIT END /* c-aranpidbreakupover3 */
IF ~~ a3060 SAY @9456 IF ~~ THEN EXIT END /* c-aranpidgood */
IF ~~ a3061 SAY @9457 IF ~~ THEN EXIT END /* c-aranpidbetter */
IF ~~ a3062 SAY @9458 IF ~~ THEN EXIT END /* c-aranpidneutral */
IF ~~ a3063 SAY @9459 IF ~~ THEN EXIT END /* c-aranpidbad */
IF ~~ a3064 SAY @9460 IF ~~ THEN EXIT END /* c-aranpidevil */
IF ~~ a3073 SAY @9515 IF ~~ THEN EXIT END /* c-aranpidWK1  */
IF ~~ a3074 SAY @12558 IF ~~ THEN EXIT END /*  c-aranpidWK2  */
IF ~~ a3075 SAY @9517 IF ~~ THEN EXIT END /*  c-aranpidWK3  */
IF ~~ a3076 SAY @9518 IF ~~ THEN EXIT END /*  c-aranpidWK4  */
IF ~~ a3077 SAY @9519 IF ~~ THEN EXIT END /*  c-aranpidWK5  */
IF ~~ a3078 SAY @9520 IF ~~ THEN EXIT END /*  c-aranpidWK6  */
IF ~~ a3079 SAY @9521 IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1)~ EXIT END /* c-aranrestopflirts */
IF ~~ a3080 SAY @9522 IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT END /* c-aranrestartflirts */
IF ~~ a3081 SAY @9523 IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT END /* c-aranrestartflirtsmad */
IF ~~ a3065 SAY @9473 IF ~~ THEN EXIT END /* c-aranpidmage2 */
IF ~~ a3066 SAY @9474 IF ~~ THEN EXIT END /* c-aranpidfighter2 */
IF ~~ a3067 SAY @9475 = @9476 = @9477 IF ~~ THEN EXIT END /* c-aranpidthief2 */
IF ~~ a3068 SAY @9478 IF ~~ THEN EXIT END /* c-aranpidcleric2 */
IF ~~ a3069 SAY @9479 = @9480 = @9481 = @9482  IF ~~ THEN EXIT END /* c-aranpidpally2 */
IF ~~ a3070 SAY @9483 IF ~~ THEN EXIT END /* c-aranpidsorc2 */
IF ~~ a3071 SAY @9484 IF ~~ THEN EXIT END /* c-aranpidmonk2 */
IF ~~ a3072 SAY @9485 IF ~~ THEN EXIT END /* c-aranpidbard2 */
IF ~~ a1867 SAY @12559 IF ~~ THEN EXIT END /* c-aransilence2 */
IF ~~ a3127 SAY @8889 IF ~~ THEN EXIT END
IF ~~ a1868 SAY @12560 IF ~~ THEN EXIT END /* not fighting in ToB  1 */
IF ~~ a1869 SAY @12561 IF ~~ THEN EXIT END /* not fighting in ToB  2 */
IF ~~ a1870 SAY @12562 IF ~~ THEN EXIT END /* not fighting in ToB  3 */
IF ~~ a1871 SAY @12563 IF ~~ THEN EXIT END /* not fighting in ToB  4 */
IF ~~ a1872 SAY @12564 IF ~~ THEN EXIT END /* not fighting in ToB  5 */
IF ~~ a1982 SAY @12565 IF ~~ THEN EXIT END /* Pocket Plane */
IF ~~ a1983 SAY @12566 IF ~~ THEN EXIT END /* Saradush */
IF ~~ a1984 SAY @12567 IF ~~ THEN EXIT END /* Gromnir 1st Level */
IF ~~ a1985 SAY @12568 IF ~~ THEN EXIT END /* Gromnir's Hideout */
IF ~~ a1986 SAY @12569 IF ~~ THEN EXIT END /* Saradush Tavern (Tankard Tree) */
IF ~~ a1987 SAY @12570 IF ~~ THEN EXIT END /* Temple of Waukeen */
IF ~~ a1988 SAY @12571 IF ~~ THEN EXIT END /* Gromnir's Barracks */
IF ~~ a1989 SAY @12572 IF ~~ THEN EXIT END /* Saradush Prison */
IF ~~ a1990 SAY @12573 IF ~~ THEN EXIT END /* Basement Entrance to Gromnir's Hideout */
IF ~~ a1991 SAY @12574 IF ~~ THEN EXIT END /* Kiser's Home */
IF ~~ a1992 SAY @12575 IF ~~ THEN EXIT END /* House (no exit?) */
IF ~~ a1993 SAY @12576 IF ~~ THEN EXIT END /* Countess Santele's Home */
IF ~~ a1994 SAY @12577 IF ~~ THEN EXIT END /* Arcana Archives */
IF ~~ a1995 SAY @12578 IF ~~ THEN EXIT END /* House */
IF ~~ a1996 SAY @12579 IF ~~ THEN EXIT END /* Sewers beneath Saradush */
IF ~~ a1997 SAY @12580 IF ~~ THEN EXIT END /* Kiser's Home -- Cellar */
IF ~~ a1998 SAY @12581 IF ~~ THEN EXIT END /* Saradush Militia Entrance */
IF ~~ a1999 SAY @12582 IF ~~ THEN EXIT END /* Saradush Castle Jail (Kiser Plot) */
IF ~~ a2000 SAY @12583 IF ~~ THEN EXIT END /* Fire Giant Entrance Area */
IF ~~ a2001 SAY @12584 IF ~~ THEN EXIT END /* Fire Giant Keep */
IF ~~ a2002 SAY @12585 IF ~~ THEN EXIT END /* Nyalee's Hideout; Gorion Wraith */
IF ~~ a2003 SAY @12586 IF ~~ THEN EXIT END /* Yaga-Shura's Camp */
IF ~~ a2004 SAY @12587 IF ~~ THEN EXIT END /* Yaga-Shura's Keep */
IF ~~ a2005 SAY @12588 IF ~~ THEN EXIT END /* Amkethran */
IF ~~ a2006 SAY @12589 IF ~~ THEN EXIT END /* Amkethran Inn */
IF ~~ a2007 SAY @12590 IF ~~ THEN EXIT END /* Kerrick the Smith's House */
IF ~~ a2008 SAY @12591 IF ~~ THEN EXIT END /* Chyil's House */
IF ~~ a2009 SAY @12592 IF ~~ THEN EXIT END /* Smuggler Cave */
IF ~~ a2010 SAY @12593 IF ~~ THEN EXIT END /* Balthazar's Home */
IF ~~ a2011 SAY @12594 IF ~~ THEN EXIT END /* Commoner's Home */
IF ~~ a2012 SAY @12595 IF ~~ THEN EXIT END /* Empty Home */
IF ~~ a2013 SAY @12596 IF ~~ THEN EXIT END /* Faheed's Home */
IF ~~ a2014 SAY @12597 IF ~~ THEN EXIT END /* Amkethran Crypt */
IF ~~ a2015 SAY @12598 IF ~~ THEN EXIT END /* Abazigal's Entrance */
IF ~~ a2016 SAY @12599 IF ~~ THEN EXIT END /* Abazigal's Lair Entrance Hall */
IF ~~ a2017 SAY @12600 IF ~~ THEN EXIT END /* Abazigal's Lair -- Cells */
IF ~~ a2018 SAY @12601 IF ~~ THEN EXIT END /* Abazigal's Lair -- Iycanth the Mad, Bondari */
IF ~~ a2019 SAY @12602 IF ~~ THEN EXIT END /* Abazigal's Lair -- Fll'Yissetat */
IF ~~ a2020 SAY @12603 IF ~~ THEN EXIT END /* Abazigal's Hideout */
IF ~~ a2021 SAY @12604 IF ~~ THEN EXIT END /* Frost Salamander Cave */
IF ~~ a2022 SAY @12605 IF ~~ THEN EXIT END /* Orbs and Gauth */
IF ~~ a2023 SAY @12606 IF ~~ THEN EXIT END /* Pool Home -- breath under water */
IF ~~ a2024 SAY @12607 IF ~~ THEN EXIT END /* Area outside Sendai's Hideout */
IF ~~ a2025 SAY @12608 IF ~~ THEN EXIT END /* Main Entrance Sendai's Lair */
IF ~~ a2026 SAY @12609 IF ~~ THEN EXIT END /* Sendai's Lair -- Slavemaster */
IF ~~ a2027 SAY @12610 IF ~~ THEN EXIT END /* Sendai's Lair -- Spiders */
IF ~~ a2028 SAY @12611 IF ~~ THEN EXIT END /* Sendai's Lair -- Crossway */
IF ~~ a2029 SAY @12612 IF ~~ THEN EXIT END /* Sendai's Lair -- Diaytha, Abishai */
IF ~~ a2030 SAY @12613 IF ~~ THEN EXIT END /* Sendai's Lair -- Captain Egeissag */
IF ~~ a2031 SAY @12614 IF ~~ THEN EXIT END /* Sendai's Lair -- Mithykyl */
IF ~~ a2032 SAY @12615 IF ~~ THEN EXIT END /* Sendai's Lair -- Sendai */
IF ~~ a2033 SAY @12616 IF ~~ THEN EXIT END /* Sendai's Lair -- Drow */
IF ~~ a2034 SAY @12617 IF ~~ THEN EXIT END /* Sendai's Lair -- Odamaron */
IF ~~ a2035 SAY @12618 IF ~~ THEN EXIT END /* Woodcutter's House -- Sendai's Area */
IF ~~ a2036 SAY @12619 IF ~~ THEN EXIT END /* The Throne of Bhaal */
IF ~~ a2037 SAY @12620 IF ~~ THEN EXIT END /* Oasis in Tethyr */
IF ~~ a2038 SAY @12621 IF ~~ THEN EXIT END /* River Area */

/* PID Scribing Scrolls Responses */

IF ~~ a3031
  SAY @9063
  = @9064
  ++ @9065 + a3039
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + @9066 + a3041
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + @9067 + a3042
  + ~Class("c-aran",MAGE_ALL)~ + @9068 + a3040
  + ~!Class("c-aran",MAGE_ALL)~ + @9069 + a3041
  + ~!Class("c-aran",CLERIC_ALL)~ + @9070 + a3037
  + ~Class("c-aran",CLERIC_ALL)~ + @9070 + a3038
  ++ @9071 + a3047
  IF ~Global("c-arscr0","LOCALS",1)~ THEN GOTO a3043
END

IF ~~ a3032 SAY @9072 IF ~~ THEN EXIT END
IF ~~ a3033 SAY @9073 IF ~~ THEN EXIT END
IF ~~ a3034 SAY @9074 IF ~~ THEN EXIT END
IF ~~ a3035 SAY @12622 IF ~~ THEN EXIT END
IF ~~ a3036 SAY @9076 IF ~~ THEN EXIT END

IF ~~ a3037
  SAY @9077
  ++ @9065 + a3039
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + @9066 + a3048
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + @9067 + a3042
  + ~Class("c-aran",MAGE_ALL)~ + @9068 + a3040
  + ~!Class("c-aran",MAGE_ALL)~ + @9069 + a3041
END

IF ~~ a3038
  SAY @9078
  ++ @9065 + a3039
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + @9066 + a3043
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + @9067 + a3042
  + ~Class("c-aran",MAGE_ALL)~ + @9068 + a3040
  + ~!Class("c-aran",MAGE_ALL)~ + @9069 + a3041
END

IF ~~ a3039
  SAY @9083
  IF ~~ THEN EXIT
END

IF ~~ a3040
  SAY @9079
  = @9080
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + @9066 + a3043
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + @9067 + a3042
  ++ @9065 + a3039
END

IF ~~ a3041
  SAY @9081
  = @9082
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + @9066 + a3043
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + @9067 + a3042
  ++ @9065 + a3039
END

IF ~~ a3042
  SAY @9084
  IF ~~ THEN EXIT
END

IF ~~ a3043
  SAY @9085
  + ~OR(21) HaveSpellParty(2101) HaveSpellParty(2102) HaveSpellParty(2103) HaveSpellParty(2104) HaveSpellParty(2105) HaveSpellParty(2106) HaveSpellParty(2107) HaveSpellParty(2108) HaveSpellParty(2110) HaveSpellParty(2111) HaveSpellParty(2112) HaveSpellParty(2113) HaveSpellParty(2114) HaveSpellParty(2115) HaveSpellParty(2116) HaveSpellParty(2117) HaveSpellParty(2118) HaveSpellParty(2119) HaveSpellParty(2120) HaveSpellParty(2123) HaveSpellParty(2125)~ + @9086 + a3046
  + ~OR(21) HaveSpellParty(2201) HaveSpellParty(2202) HaveSpellParty(2203) HaveSpellParty(2205) HaveSpellParty(2206) HaveSpellParty(2207) HaveSpellParty(2208) HaveSpellParty(2209) HaveSpellParty(2210) HaveSpellParty(2211) HaveSpellParty(2212) HaveSpellParty(2213) HaveSpellParty(2214) HaveSpellParty(2215) HaveSpellParty(2217) HaveSpellParty(2218) HaveSpellParty(2219) HaveSpellParty(2220) HaveSpellParty(2221) HaveSpellParty(2223) HaveSpellParty(2224)~ + @9087 + a3054
  + ~OR(22) HaveSpellParty(2301) HaveSpellParty(2302) HaveSpellParty(2303) HaveSpellParty(2304) HaveSpellParty(2305) HaveSpellParty(2306) HaveSpellParty(2307) HaveSpellParty(2308) HaveSpellParty(2310) HaveSpellParty(2311) HaveSpellParty(2312) HaveSpellParty(2313) HaveSpellParty(2314) HaveSpellParty(2316) HaveSpellParty(2317) HaveSpellParty(2318) HaveSpellParty(2319) HaveSpellParty(2320) HaveSpellParty(2321) HaveSpellParty(2322) HaveSpellParty(2324) HaveSpellParty(2325)~ + @9088 + a3055
  + ~OR(18) HaveSpellParty(2401) HaveSpellParty(2403) HaveSpellParty(2404) HaveSpellParty(2405) HaveSpellParty(2406) HaveSpellParty(2408) HaveSpellParty(2409) HaveSpellParty(2410) HaveSpellParty(2411) HaveSpellParty(2412) HaveSpellParty(2413) HaveSpellParty(2414) HaveSpellParty(2417) HaveSpellParty(2418) HaveSpellParty(2419) HaveSpellParty(2420) HaveSpellParty(2424) HaveSpellParty(2425)~ + @9089 + a3056
  + ~OR(17) HaveSpellParty(2502) HaveSpellParty(2503) HaveSpellParty(2505) HaveSpellParty(2506) HaveSpellParty(2508) HaveSpellParty(2509) HaveSpellParty(2510) HaveSpellParty(2511) HaveSpellParty(2512) HaveSpellParty(2513) HaveSpellParty(2514) HaveSpellParty(2515) HaveSpellParty(2517) HaveSpellParty(2518) HaveSpellParty(2519) HaveSpellParty(2522) HaveSpellParty(2523)~ + @9090 + a3057
  + ~OR(17) HaveSpellParty(2602) HaveSpellParty(2603) HaveSpellParty(2604) HaveSpellParty(2605) HaveSpellParty(2606) HaveSpellParty(2607) HaveSpellParty(2608) HaveSpellParty(2609) HaveSpellParty(2611) HaveSpellParty(2612) HaveSpellParty(2613) HaveSpellParty(2614) HaveSpellParty(2615) HaveSpellParty(2616) HaveSpellParty(2617) HaveSpellParty(2618) HaveSpellParty(2625)~ + @9091 + a3058
  ++ @9092 + a3044
  ++ @9093 + a3039
  IF ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ THEN GOTO a3053
END

IF ~~ a3044
  SAY @9094
  ++ @9095 + a3045
  ++ @9096 + a3039
  ++ @9097 + a3209
END

IF ~~ a3209 SAY @9098 IF ~~ THEN EXIT END

IF ~~ a3045
  SAY @9099
  ++ @9093 + a3039
  + ~OR(21) HaveSpellParty(2101) HaveSpellParty(2102) HaveSpellParty(2103) HaveSpellParty(2104) HaveSpellParty(2105) HaveSpellParty(2106) HaveSpellParty(2107) HaveSpellParty(2108) HaveSpellParty(2110) HaveSpellParty(2111) HaveSpellParty(2112) HaveSpellParty(2113) HaveSpellParty(2114) HaveSpellParty(2115) HaveSpellParty(2116) HaveSpellParty(2117) HaveSpellParty(2118) HaveSpellParty(2119) HaveSpellParty(2120) HaveSpellParty(2123) HaveSpellParty(2125)~ + @9086 + a3046
  + ~OR(21) HaveSpellParty(2201) HaveSpellParty(2202) HaveSpellParty(2203) HaveSpellParty(2205) HaveSpellParty(2206) HaveSpellParty(2207) HaveSpellParty(2208) HaveSpellParty(2209) HaveSpellParty(2210) HaveSpellParty(2211) HaveSpellParty(2212) HaveSpellParty(2213) HaveSpellParty(2214) HaveSpellParty(2215) HaveSpellParty(2217) HaveSpellParty(2218) HaveSpellParty(2219) HaveSpellParty(2220) HaveSpellParty(2221) HaveSpellParty(2223) HaveSpellParty(2224)~ + @9087 + a3054
  + ~OR(22) HaveSpellParty(2301) HaveSpellParty(2302) HaveSpellParty(2303) HaveSpellParty(2304) HaveSpellParty(2305) HaveSpellParty(2306) HaveSpellParty(2307) HaveSpellParty(2308) HaveSpellParty(2310) HaveSpellParty(2311) HaveSpellParty(2312) HaveSpellParty(2313) HaveSpellParty(2314) HaveSpellParty(2316) HaveSpellParty(2317) HaveSpellParty(2318) HaveSpellParty(2319) HaveSpellParty(2320) HaveSpellParty(2321) HaveSpellParty(2322) HaveSpellParty(2324) HaveSpellParty(2325)~ + @9088 + a3055
  + ~OR(18) HaveSpellParty(2401) HaveSpellParty(2403) HaveSpellParty(2404) HaveSpellParty(2405) HaveSpellParty(2406) HaveSpellParty(2408) HaveSpellParty(2409) HaveSpellParty(2410) HaveSpellParty(2411) HaveSpellParty(2412) HaveSpellParty(2413) HaveSpellParty(2414) HaveSpellParty(2417) HaveSpellParty(2418) HaveSpellParty(2419) HaveSpellParty(2420) HaveSpellParty(2424) HaveSpellParty(2425)~ + @9089 + a3056
  + ~OR(17) HaveSpellParty(2502) HaveSpellParty(2503) HaveSpellParty(2505) HaveSpellParty(2506) HaveSpellParty(2508) HaveSpellParty(2509) HaveSpellParty(2510) HaveSpellParty(2511) HaveSpellParty(2512) HaveSpellParty(2513) HaveSpellParty(2514) HaveSpellParty(2515) HaveSpellParty(2517) HaveSpellParty(2518) HaveSpellParty(2519) HaveSpellParty(2522) HaveSpellParty(2523)~ + @9090 + a3057
  + ~OR(17) HaveSpellParty(2602) HaveSpellParty(2603) HaveSpellParty(2604) HaveSpellParty(2605) HaveSpellParty(2606) HaveSpellParty(2607) HaveSpellParty(2608) HaveSpellParty(2609) HaveSpellParty(2611) HaveSpellParty(2612) HaveSpellParty(2613) HaveSpellParty(2614) HaveSpellParty(2615) HaveSpellParty(2616) HaveSpellParty(2617) HaveSpellParty(2618) HaveSpellParty(2625)~ + @9091 + a3058
END

IF ~~ a3046
  SAY @9100
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2101)~ + @9101 DO ~SetGlobal("c-arSCRL66","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3049 /* WIZARD_GREASE */
  + ~HaveSpellParty(2102)~ + @9102 DO ~SetGlobal("c-arSCRL67","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3050 /* WIZARD_ARMOR */
  + ~HaveSpellParty(2103)~ + @9103 DO ~SetGlobal("c-arSCRL68","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3051 /* WIZARD_BURNING_HANDS */
  + ~HaveSpellParty(2104)~ + @9104 DO ~SetGlobal("c-arSCRL69","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3052 /* WIZARD_CHARM_PERSON */
  + ~HaveSpellParty(2105)~ + @9105 DO ~SetGlobal("c-arSCRL70","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3053 /* WIZARD_COLOR_SPRAY */
  + ~HaveSpellParty(2106)~ + @9106 DO ~SetGlobal("c-arSCRL71","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3049 /* WIZARD_BLINDNESS */
  + ~HaveSpellParty(2107)~ + @9107 DO ~SetGlobal("c-arSCRL72","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3050 /* WIZARD_FRIENDS */
  + ~HaveSpellParty(2108)~ + @9108 DO ~SetGlobal("c-arSCRL15","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3051 /* WIZARD_PROTECTION_FROM_PETRIFICATION */
  + ~HaveSpellParty(2110)~ + @9109 DO ~SetGlobal("c-arSCRL75","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3052 /* WIZARD_IDENTIFY */
  + ~HaveSpellParty(2111)~ + @9110 DO ~SetGlobal("c-arSCRL76","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3048 /* WIZARD_INFRAVISION */
  + ~HaveSpellParty(2112)~ + @9111 DO ~SetGlobal("c-arSCRL77","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3049 /* WIZARD_MAGIC_MISSILE */
  + ~HaveSpellParty(2113)~ + @9112 DO ~SetGlobal("c-arSCRL78","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3050 /* WIZARD_PROTECTION_FROM_EVIL */
  + ~HaveSpellParty(2114)~ + @9113 DO ~SetGlobal("c-arSCRL79","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3051 /* WIZARD_SHIELD */
  + ~HaveSpellParty(2115)~ + @9114 DO ~SetGlobal("c-arSCRL80","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3052 /* WIZARD_SHOCKING_GRASP */
  + ~HaveSpellParty(2116)~ + @9115 DO ~SetGlobal("c-arSCRL81","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3048 /* WIZARD_SLEEP */
  + ~HaveSpellParty(2117)~ + @9116 DO ~SetGlobal("c-arSCRL82","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3049 /* WIZARD_CHILL_TOUCH */
  + ~HaveSpellParty(2118)~ + @9117 DO ~SetGlobal("c-arSCRL83","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3050 /* WIZARD_CHROMATIC_ORB */
  + ~HaveSpellParty(2119)~ + @9118 DO ~SetGlobal("c-arSCRL84","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3051 /* WIZARD_LARLOCH_MINOR_DRAIN */
  + ~HaveSpellParty(2120)~ + @9119 DO ~SetGlobal("c-arSCRL5U","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3052 /* WIZARD_REFLECTED_IMAGE */
  + ~HaveSpellParty(2123)~ + @9120 DO ~SetGlobal("c-arSCRL6D","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3048 /* WIZARD_FIND_FAMILAR */
  + ~HaveSpellParty(2125)~ + @9121 DO ~SetGlobal("c-arSCRLA6","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3049 /* WIZARD_SPOOK  */
  ++ @9122 + a3039
  ++ @9123 + a3045
END

IF ~~ a3047
  SAY @9124
  ++ @9065 + a3039
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + @9066 + a3041
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + @9067 + a3042
  + ~Class("c-aran",MAGE_ALL)~ + @9068 + a3040
  + ~!Class("c-aran",MAGE_ALL)~ + @9069 + a3041
  + ~!Class("c-aran",CLERIC_ALL)~ + @9070 + a3037
  + ~Class("c-aran",CLERIC_ALL)~ + @9070 + a3038
END

IF ~~ a3048 SAY @9125 IF ~~ THEN EXIT END
IF ~~ a3049 SAY @9126 IF ~~ THEN EXIT END
IF ~~ a3050 SAY @9127 IF ~~ THEN EXIT END
IF ~~ a3051 SAY @9128 IF ~~ THEN EXIT END
IF ~~ a3052 SAY @9129 IF ~~ THEN EXIT END
IF ~~ a3053 SAY @9130 IF ~~ THEN EXIT END

IF ~~ a3054
  SAY @9100
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2201)~ + @9131 DO ~SetGlobal("c-arSCRL85","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3050 /* WIZARD_BLUR */
  + ~HaveSpellParty(2202)~ + @9132 DO ~SetGlobal("c-arSCRL86","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3051 /* WIZARD_DETECT_EVIL */
  + ~HaveSpellParty(2203)~ + @9133 DO ~SetGlobal("c-arSCRL87","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3052 /* WIZARD_DETECT_INVISIBILITY */
  + ~HaveSpellParty(2205)~ + @9134 DO ~SetGlobal("c-arSCRL89","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3048 /* WIZARD_HORROR */
  + ~HaveSpellParty(2206)~ + @9135 DO ~SetGlobal("c-arSCRL90","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3049 /* WIZARD_INVISIBILITY */
  + ~HaveSpellParty(2207)~ + @9136 DO ~SetGlobal("c-arSCRL91","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3050 /* WIZARD_KNOCK */
  + ~HaveSpellParty(2208)~ + @9137 DO ~SetGlobal("c-arSCRL92","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3051 /* WIZARD_KNOW_ALIGNMENT */
  + ~HaveSpellParty(2209)~ + @9138 DO ~SetGlobal("c-arSCRL93","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3052 /* WIZARD_LUCK */
  + ~HaveSpellParty(2210)~ + @9139 DO ~SetGlobal("c-arSCRL94","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3050 /* WIZARD_RESIST_FEAR */
  + ~HaveSpellParty(2211)~ + @9140 DO ~SetGlobal("c-arSCRL95","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3051 /* WIZARD_MELF_ACID_ARROW */
  + ~HaveSpellParty(2212)~ + @9141 DO ~SetGlobal("c-arSCRL96","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3052 /* WIZARD_MIRROR_IMAGE */
  + ~HaveSpellParty(2213)~ + @9142 DO ~SetGlobal("c-arSCRL97","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3048 /* WIZARD_STINKING_CLOUD */
  + ~HaveSpellParty(2214)~ + @9143 DO ~SetGlobal("c-arSCRL98","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3049 /* WIZARD_STRENGTH */
  + ~HaveSpellParty(2215)~ + @9144 DO ~SetGlobal("c-arSCRL99","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3050 /* WIZARD_WEB */
  + ~HaveSpellParty(2217)~ + @9145 DO ~SetGlobal("c-arSCRL1B","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3051 /* WIZARD_AGANNAZAR_SCORCHER */
  + ~HaveSpellParty(2218)~ + @9146 DO ~SetGlobal("c-arSCRL1C","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3052 /* WIZARD_GHOUL_TOUCH */
  + ~HaveSpellParty(2219)~ + @9147 DO ~SetGlobal("c-arSCRL3G","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3048 /* WIZARD_VOCALIZE */
  + ~HaveSpellParty(2220)~ + @9148 DO ~SetGlobal("c-arSCRL6E","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3049 /* WIZARD_POWER_WORD_SLEEP */
  + ~HaveSpellParty(2221)~ + @9149 DO ~SetGlobal("c-arSCRL6F","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3050 /* WIZARD_RAY_OF_ENFEEBLEMENT */
  + ~HaveSpellParty(2223)~ + @9150 DO ~SetGlobal("c-arSCRLA2","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3051 /* WIZARD_DEAFNESS */
  + ~HaveSpellParty(2224)~ + @9151 DO ~SetGlobal("c-arSCRLA3","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3052 /* WIZARD_GLITTERDUST */
  ++ @9122 + a3039
  ++ @9152 + a3045
END

IF ~~ a3055
  SAY @9100
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2301)~ + @9153 DO ~SetGlobal("c-arSCRL1D","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3048 /* WIZARD_CLAIRVOYANCE */
  + ~HaveSpellParty(2302)~ + @9154 DO ~SetGlobal("c-arSCRL1E","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3052 /* WIZARD_DISPEL_MAGIC */
  + ~HaveSpellParty(2303)~ + @9155 DO ~SetGlobal("c-arSCRL1F","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3051 /* WIZARD_FLAME_ARROW */
  + ~HaveSpellParty(2304)~ + @9156 DO ~SetGlobal("c-arSCRL1G","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3050 /* WIZARD_FIREBALL */
  + ~HaveSpellParty(2305)~ + @9157 DO ~SetGlobal("c-arSCRL1H","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3049 /* WIZARD_HASTE */
  + ~HaveSpellParty(2306)~ + @9158 DO ~SetGlobal("c-arSCRL1I","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3049 /* WIZARD_HOLD_PERSON */
  + ~HaveSpellParty(2307)~ + @9159 DO ~SetGlobal("c-arSCRL1J","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3050 /* WIZARD_INVISIBILITY_10_FOOT */
  + ~HaveSpellParty(2308)~ + @9160 DO ~SetGlobal("c-arSCRL1K","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3051 /* WIZARD_LIGHTNING_BOLT */
  + ~HaveSpellParty(2310)~ + @9161 DO ~SetGlobal("c-arSCRL1M","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3052 /* WIZARD_NON_DETECTION */
  + ~HaveSpellParty(2311)~ + @9162 DO ~SetGlobal("c-arSCRL1N","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3048 /* WIZARD_PROTECTION_FROM_NORMAL_MISSILES */
  + ~HaveSpellParty(2312)~ + @9163 DO ~SetGlobal("c-arSCRL1O","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3048 /* WIZARD_SLOW */
  + ~HaveSpellParty(2313)~ + @9164 DO ~SetGlobal("c-arSCRL1P","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3052 /* WIZARD_SKULL_TRAP */
  + ~HaveSpellParty(2314)~ + @9165 DO ~SetGlobal("c-arSCRL1Q","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3051 /* WIZARD_VAMPIRIC_TOUCH */
  + ~HaveSpellParty(2316)~ + @9166 DO ~SetGlobal("c-arSCRL1S","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3050 /* WIZARD_DIRE_CHARM */
  + ~HaveSpellParty(2317)~ + @9167 DO ~SetGlobal("c-arSCRL1T","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3049 /* WIZARD_GHOST_ARMOR */
  + ~HaveSpellParty(2318)~ + @9168 DO ~SetGlobal("c-arSCRL6G","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3049 /* WIZARD_MINOR_SPELL_DEFLECTION */
  + ~HaveSpellParty(2319)~ + @9169 DO ~SetGlobal("c-arSCRL6H","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3050 /* WIZARD_PROTECTION_FROM_FIRE */
  + ~HaveSpellParty(2320)~ + @9170 DO ~SetGlobal("c-arSCRL6I","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3051 /* WIZARD_PROTECTION_FROM_COLD */
  + ~HaveSpellParty(2321)~ + @9171 DO ~SetGlobal("c-arSCRL6J","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3052 /* WIZARD_SPELL_THRUST */
  + ~HaveSpellParty(2322)~ + @9172 DO ~SetGlobal("c-arSCRL6K","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3048 /* WIZARD_DETECT_ILLUSION */
  + ~HaveSpellParty(2324)~ + @9173 DO ~SetGlobal("c-arSCRL6L","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3052 /* WIZARD_HOLD_UNDEAD */
  + ~HaveSpellParty(2325)~ + @9174 DO ~SetGlobal("c-arSCRLA5","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3051 /* WIZARD_MELF_METEOR */
  ++ @9122 + a3039
  ++ @9152 + a3045
END

IF ~~ a3056
  SAY @9100
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2401)~ + @9175 DO ~SetGlobal("c-arSCRL1U","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3050 /* WIZARD_CONFUSION */
  + ~HaveSpellParty(2403)~ + @9176 DO ~SetGlobal("c-arSCRL1W","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3049 /* WIZARD_FIRE_SHIELD_BLUE */
  + ~HaveSpellParty(2404)~ + @9177 DO ~SetGlobal("c-arSCRL1X","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3049 /* WIZARD_ICE_STORM */
  + ~HaveSpellParty(2405)~ + @9178 DO ~SetGlobal("c-arSCRL1Y","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3050 /* WIZARD_IMPROVED_INVISIBILITY */
  + ~HaveSpellParty(2406)~ + @9179 DO ~SetGlobal("c-arSCRL1Z","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3051 /* WIZARD_MINOR_GLOBE_OF_INVULNERABILITY */
  + ~HaveSpellParty(2408)~ + @9180 DO ~SetGlobal("c-arSCRL1V","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3052 /* WIZARD_STONE_SKIN */
  + ~HaveSpellParty(2409)~ + @9181 DO ~SetGlobal("c-arSCRLA8","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3048 /* WIZARD_CONTAGION */
  + ~HaveSpellParty(2410)~ + @9182 DO ~SetGlobal("c-arSCRL5G","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3052 /* WIZARD_REMOVE_CURSE */
  + ~HaveSpellParty(2411)~ + @9183 DO ~SetGlobal("c-arSCRL5H","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3051 /* WIZARD_EMOTION_HOPELESSNESS */
  + ~HaveSpellParty(2412)~ + @9184 DO ~SetGlobal("c-arSCRL5I","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3050 /* WIZARD_GREATER_MALISON */
  + ~HaveSpellParty(2413)~ + @9185 DO ~SetGlobal("c-arSCRL5J","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3049 /* WIZARD_OTILUKES_RESILIENT_SPHERE */
  + ~HaveSpellParty(2414)~ + @9186 DO ~SetGlobal("c-arSCRL5K","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3049 /* WIZARD_SPIRIT_ARMOR */
  + ~HaveSpellParty(2417)~ + @9187 DO ~SetGlobal("c-arSCRL6M","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3050 /* WIZARD_ENCHANTED_WEAPON */
  + ~HaveSpellParty(2418)~ + @9188 DO ~SetGlobal("c-arSCRL6N","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3051 /* WIZARD_FIRE_SHIELD_RED */
  + ~HaveSpellParty(2419)~ + @9189 DO ~SetGlobal("c-arSCRL6O","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3052 /* WIZARD_SECRET_WORD */
  + ~HaveSpellParty(2420)~ + @9190 DO ~SetGlobal("c-arSCRL6P","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3048 /* WIZARD_MINOR_SEQUENCER */
  + ~HaveSpellParty(2424)~ + @9191 DO ~SetGlobal("c-arSCRLAJ","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3048 /* WIZARD_FAR_SIGHT */
  + ~HaveSpellParty(2425)~ + @9192 DO ~SetGlobal("c-arSCRLA1","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3052 /* WIZARD_EYE */
  ++ @9122 + a3039
  ++ @9152 + a3045
END

IF ~~ a3057
  SAY @9100
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2502)~ + @9193 DO ~SetGlobal("c-arSCRL2E","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3051 /* WIZARD_CLOUDKILL */
  + ~HaveSpellParty(2503)~ + @9194 DO ~SetGlobal("c-arSCRL2F","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3050 /* WIZARD_CONE_OF_COLD */
  + ~HaveSpellParty(2505)~ + @9195 DO ~SetGlobal("c-arSCRL2H","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3049 /* WIZARD_SHADOW_DOOR */
  + ~HaveSpellParty(2506)~ + @9196 DO ~SetGlobal("c-arSCRL5N","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3049 /* WIZARD_DOMINATION */
  + ~HaveSpellParty(2508)~ + @9197 DO ~SetGlobal("c-arSCRL5P","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3050 /* WIZARD_CHAOS */
  + ~HaveSpellParty(2509)~ + @9198 DO ~SetGlobal("c-arSCRL5Q","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3051 /* WIZARD_FEEBLEMIND */
  + ~HaveSpellParty(2510)~ + @9199 DO ~SetGlobal("c-arSCRL6S","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3052 /* WIZARD_SPELL_IMMUNITY */
  + ~HaveSpellParty(2511)~ + @9200 DO ~SetGlobal("c-arSCRL6T","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3048 /* WIZARD_PROTECTION_FROM_NORMAL_WEAPONS */
  + ~HaveSpellParty(2512)~ + @9201 DO ~SetGlobal("c-arSCRL5T","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3048 /* WIZARD_PROTECTION_FROM_ELECTRICITY */
  + ~HaveSpellParty(2513)~ + @9202 DO ~SetGlobal("c-arSCRL6U","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3052 /* WIZARD_BREACH */
  + ~HaveSpellParty(2514)~ + @9203 DO ~SetGlobal("c-arSCRL6V","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3051 /* WIZARD_LOWER_RESISTANCE */
  + ~HaveSpellParty(2515)~ + @9204 DO ~SetGlobal("c-arSCRL6W","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3050 /* WIZARD_ORACLE */
  + ~HaveSpellParty(2517)~ + @9205 DO ~SetGlobal("c-arSCRL6Y","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3049 /* WIZARD_PROTECTION_FROM_ACID */
  + ~HaveSpellParty(2518)~ + @9206 DO ~SetGlobal("c-arSCRL6Z","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3049 /* WIZARD_PHANTOM_BLADE */
  + ~HaveSpellParty(2519)~ + @9207 DO ~SetGlobal("c-arSCRL8X","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3050 /* WIZARD_SPELL_SHIELD */
  + ~HaveSpellParty(2522)~ + @9208 DO ~SetGlobal("c-arSCRL7D","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3051 /* WIZARD_MINOR_SPELL_TURNING */
  + ~HaveSpellParty(2523)~ + @9209 DO ~SetGlobal("c-arSCRLAL","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3052 /* WIZARD_SUN_FIRE */
  ++ @9122 + a3039
  ++ @9152 + a3045
END

IF ~~ a3058
  SAY @9100
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2602)~ + @9210 DO ~SetGlobal("c-arSCRL7F","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3048 /* WIZARD_GLOBE_OF_INVULNERABILITY */
  + ~HaveSpellParty(2603)~ + @9211 DO ~SetGlobal("c-arSCRL7G","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3052 /* WIZARD_TENSERS_TRANSFORMATION */
  + ~HaveSpellParty(2604)~ + @9212 DO ~SetGlobal("c-arSCRL7H","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3051 /* WIZARD_FLESH_TO_STONE */
  + ~HaveSpellParty(2605)~ + @9213 DO ~SetGlobal("c-arSCRL7I","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3050 /* WIZARD_DEATH_SPELL */
  + ~HaveSpellParty(2606)~ + @9214 DO ~SetGlobal("c-arSCRL7J","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3049 /* WIZARD_PROTECTION_FROM_MAGIC_ENERGY */
  + ~HaveSpellParty(2607)~ + @9215 DO ~SetGlobal("c-arSCRL7K","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3049 /* WIZARD_MISLEAD */
  + ~HaveSpellParty(2608)~ + @9216 DO ~SetGlobal("c-arSCRL7L","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3050 /* WIZARD_PIERCE_MAGIC */
  + ~HaveSpellParty(2609)~ + @9217 DO ~SetGlobal("c-arSCRL7M","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3051 /* WIZARD_TRUE_SIGHT */
  + ~HaveSpellParty(2611)~ + @9218 DO ~SetGlobal("c-arSCRL7O","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3052 /* WIZARD_PROTECTION_FROM_MAGIC_WEAPONS */
  + ~HaveSpellParty(2612)~ + @9219 DO ~SetGlobal("c-arSCRL7P","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3048 /* WIZARD_POWER_WORD_SILENCE */
  + ~HaveSpellParty(2613)~ + @9220 DO ~SetGlobal("c-arSCRL7Q","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3048 /* WIZARD_IMPROVED_HASTE */
  + ~HaveSpellParty(2614)~ + @9221 DO ~SetGlobal("c-arSCRL7R","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3052 /* WIZARD_DEATH_FOG */
  + ~HaveSpellParty(2615)~ + @9222 DO ~SetGlobal("c-arSCRL7S","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3051 /* WIZARD_CHAIN_LIGHTNING */
  + ~HaveSpellParty(2616)~ + @9223 DO ~SetGlobal("c-arSCRL7T","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3050 /* WIZARD_DISINTEGRATE */
  + ~HaveSpellParty(2617)~ + @9224 DO ~SetGlobal("c-arSCRL7U","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3049 /* WIZARD_CONTINGENCY */
  + ~HaveSpellParty(2618)~ + @9225 DO ~SetGlobal("c-arSCRL7V","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3050 /* WIZARD_SPELL_DEFLECTION */
  + ~HaveSpellParty(2625)~ + @9226 DO ~SetGlobal("c-arSCRL8C","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3051 /* WIZARD_STONE_TO_FLESH */
  ++ @9122 + a3039
  ++ @9152 + a3045
END

/* Flirt SubMenu: Mature: ToB  */
IF ~~ a3059
  SAY @8967
  /* hugs M */
  + ~RandomNum(4,1)~ + @8969 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3082
  + ~RandomNum(4,2)~ + @9227 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3083
  + ~RandomNum(4,3)~ + @8971 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3084
  + ~RandomNum(4,4)~ + @8972 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3085
  /* kisses M */
  + ~RandomNum(4,1)~ + @9242 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3086
  + ~RandomNum(4,2)~ + @8974 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3087
  + ~RandomNum(4,3)~ + @9261 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3088
  + ~RandomNum(4,4)~ + @8976 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3089
  /* touching M */
  + ~RandomNum(5,1)~ + @8977 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3090
  + ~RandomNum(5,2)~ + @9250 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3091
  + ~RandomNum(5,3)~ + @9252 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3092
  + ~RandomNum(5,4)~ + @9295 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3093
  + ~RandomNum(5,5)~ + @9329 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3094
  /* praises M */
  + ~RandomNum(4,1)~ + @9253 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3095
  + ~RandomNum(4,2)~ + @8982 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3096
  + ~RandomNum(4,3)~ + @9254 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3097
  + ~RandomNum(4,4)~ + @8984 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3098
  /* teasing M */
  + ~RandomNum(4,1)~ + @9263 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3099
  + ~RandomNum(4,2)~ + @9264 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3100
  + ~RandomNum(4,3)~ + @9265 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3101
  + ~RandomNum(4,4)~ + @9266 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3102
  /* quiet/hidden M */
  + ~RandomNum(4,1)~ + @9267 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3103
  + ~RandomNum(4,2)~ + @9268 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3104
  + ~RandomNum(4,3)~ + @9269 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3105
  + ~RandomNum(4,4)~ + @9270 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3106
  /* Spoken M */
  + ~RandomNum(5,1)~ + @8989 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3107
  + ~RandomNum(5,2)~ + @9271 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3108
  + ~RandomNum(5,3)~ + @9330 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3109
  + ~RandomNum(5,4)~ + @9273 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3110
  + ~RandomNum(5,5)~ + @9313 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3133
  /* Spoken H added back */
  + ~RandomNum(5,1)~ + @9314 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3122  /* H spoken 2 */
  + ~RandomNum(5,2)~ + @9314 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3123  /* H spoken 3 */
  + ~RandomNum(5,3)~ + @9314 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3124  /* H spoken 4 */
  + ~RandomNum(5,4)~ + @9315 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3125  /* H spoken 5 */
  + ~RandomNum(5,5)~ + @9316 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3126  /* H spoken 6 */
  /* Manipulative/Autocratic/Demanding  M */
  + ~RandomNum(4,1)~ + @9256 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3111
  + ~RandomNum(4,1)~ + @9257 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3112
  + ~RandomNum(4,3)~ + @9286 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3113
  + ~RandomNum(4,4)~ + @9258 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3114
  /* Not Nice Action  M */
  + ~Global("c-araneviltouch3","LOCALS",0)~ + @9331 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-araneviltouch3","LOCALS",1)~ + a3115
  + ~Global("c-araneviltouch3","LOCALS",1)~ + @9332 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-araneviltouch3","LOCALS",2)~ + a3116
  + ~Global("c-araneviltouch3","LOCALS",2)~ + @9333 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-araneviltouch3","LOCALS",3)~ + a3117
  + ~Global("c-araneviltouch3","LOCALS",3)~ + @9334 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-araneviltouch3","LOCALS",4)~ + a3118
  + ~Global("c-araneviltouch3","LOCALS",4)~ + @9331 DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-araneviltouch3","LOCALS",5)~ + a3119
  /* Situational/Conditional Flirts */
  ++ @8590 + a3210
  ++ @12623 EXIT
END

/* Flirt SubMenu: Mature ToB responses */
/* hugs 1 */
IF ~~ a3082 SAY @9568 IF ~~ THEN EXIT END
IF ~~ a3083 SAY @9569 IF ~~ THEN EXIT END
IF ~~ a3084 SAY @9570 = @9571 IF ~~ THEN EXIT END
IF ~~ a3085 SAY @9572 = @9573 IF ~~ THEN EXIT END
/* kisses 1 */
IF ~~ a3086 SAY @9574 = @9575 = @9576 IF ~~ THEN EXIT END
IF ~~ a3087 SAY @9577 IF ~~ THEN EXIT END
IF ~~ a3088 SAY @9578 = @9579 = @9580 IF ~~ THEN EXIT END
IF ~~ a3089 SAY @9581 = @9582 = @9583 IF ~~ THEN EXIT END
/* touching 1 */
IF ~~ a3090 SAY @9584 = @9585 = @9586 IF ~~ THEN EXIT END
IF ~~ a3091 SAY @9587 = @9588 IF ~~ THEN EXIT END
IF ~~ a3092 SAY @9589 = @9590 = @9591 IF ~~ THEN EXIT END
IF ~~ a3093 SAY @9592 = @9593 = @9594 IF ~~ THEN EXIT END
IF ~~ a3094 SAY @9595 = @9596 IF ~~ THEN EXIT END
/* praises 1 */
IF ~~ a3095 SAY @9597 IF ~~ THEN EXIT END
IF ~~ a3096 SAY @9598 IF ~~ THEN EXIT END
IF ~~ a3097 SAY @9599 = @9600 IF ~~ THEN EXIT END
IF ~~ a3098 SAY @9601 = @9602 IF ~~ THEN EXIT END
 /* teasing 1 */
IF ~~ a3099 SAY @9603 = @9604 IF ~~ THEN EXIT END
IF ~~ a3100 SAY @9605 = @9606 IF ~~ THEN EXIT END
IF ~~ a3101 SAY @9607 IF ~~ THEN EXIT END
IF ~~ a3102 SAY @9608 = @9609 IF ~~ THEN EXIT END
/* quiet/hidden 1 */
IF ~~ a3103 SAY @9610 = @9611 IF ~~ THEN EXIT END
IF ~~ a3104 SAY @9612 IF ~~ THEN EXIT END
IF ~~ a3105 SAY @9613 IF ~~ THEN EXIT END
IF ~~ a3106 SAY @9614 IF ~~ THEN EXIT END
/* Spoken */
IF ~~ a3107 SAY @9615 IF ~~ THEN EXIT END
IF ~~ a3108 SAY @9616 IF ~~ THEN EXIT END
IF ~~ a3109 SAY @9617 = @9618 = @9619 IF ~~ THEN EXIT END
IF ~~ a3110 SAY @9620 = @9621 = @9622 IF ~~ THEN EXIT END
/* Manipulative/Autocratic/Demanding */
IF ~~ a3111 SAY @9623 = @9624 = @9625 IF ~~ THEN EXIT END
IF ~~ a3112 SAY @9626 = @9627 IF ~~ THEN EXIT END
IF ~~ a3113 SAY @9628 IF ~~ THEN EXIT END
IF ~~ a3114 SAY @9629 = @9630 IF ~~ THEN EXIT END
/* Not Nice Action */
IF ~~ a3115 SAY @9631 IF ~~ THEN EXIT END
IF ~~ a3116 SAY @9632 IF ~~ THEN EXIT END
IF ~~ a3117 SAY @9633 = @9634 IF ~~ THEN EXIT END
IF ~~ a3118 SAY @9635 IF ~~ THEN EXIT END
IF ~~ a3119 SAY @9636 = @9637 = @9638 IF ~~ THEN EXIT END
/* H spoken 2 */
IF ~~ a3122 SAY @9355 IF ~~ THEN EXIT END
/* H spoken 3 */
IF ~~ a3123 SAY @9356 IF ~~ THEN EXIT END
/* H spoken 4 */
IF ~~ a3124 SAY @9357 IF ~~ THEN EXIT END
/* H spoken 5 */
IF ~~ a3125 SAY @9358 IF ~~ THEN EXIT END
/* H spoken 6 */
IF ~~ a3126 SAY @9359 IF ~~ THEN EXIT END
IF ~~ a3133 SAY @9435 IF ~~ THEN EXIT END

IF ~~ a1873
  SAY @12624
  + ~RandomNum(4,1)~ + @12625 + a1902
  + ~RandomNum(4,2)~ + @12625 + a1903
  + ~RandomNum(4,3)~ + @12625 + a1904
  + ~RandomNum(4,4)~ + @12625 + a1905
  ++ @12626 + a3134 /* c-aranshutup1 */
  + ~RandomNum(5,5)~ + @11609 + a3134 /* c-aranshutup1 */
  + ~RandomNum(5,4)~ + @12627 + a3135 /* c-aranshutup2 */
  + ~RandomNum(5,3)~ + @12628 + a3136 /* c-aranshutup3 */
  + ~RandomNum(5,2)~ + @12629 + a3137 /* c-aranshutup4 */
  + ~RandomNum(5,1)~ + @12630 + a3138 /* c-aranshutup5 */
  + ~Gender(Player1,MALE)~ + @12631 + a1887
  + ~Gender(Player1,FEMALE)~ + @12632 + a1886
  + ~HPPercentLT("c-aran",40)~ + @12633 + a1877
  + ~HPPercentGT("c-aran",39) HPPercentLT("c-aran",80)~ + @12634 + a1878
  + ~HPPercentGT("c-aran",79)~ + @12635 + a1879
END

IF ~~ a1874
  SAY @12636
  + ~RandomNum(4,1)~ + @12625 + a1902
  + ~RandomNum(4,2)~ + @12625 + a1903
  + ~RandomNum(4,3)~ + @12625 + a1904
  + ~RandomNum(4,4)~ + @12625 + a1905
  + ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @8590 + a3210
  + ~HPPercentLT("c-aran",40)~ + @12633 + a1877
  + ~HPPercentGT("c-aran",39) HPPercentLT("c-aran",80)~ + @12634 + a1878
  + ~HPPercentGT("c-aran",79)~ + @12635 + a1879
  + ~RandomNum(5,5)~ + @12637 + a3139 /* c-aranshutup6 */
  + ~RandomNum(5,4)~ + @12638 + a3140 /* c-aranshutup7 */
  + ~RandomNum(5,3)~ + @12639 + a3141 /* c-aranshutup8 */
  + ~RandomNum(5,2)~ + @12640 + a3142 /* c-aranshutup9 */
  + ~RandomNum(5,1)~ + @11609 + a3143 /* c-aranshutup10 */
  ++ @12641 + a3134 /* c-aranshutup1 */
  + ~Gender(Player1,MALE)~ + @12642 + a1885
  + ~Gender(Player1,FEMALE)~ + @12632 + a1886
END

IF ~~ a1875
  SAY @12643
  ++ @12644 + a3134 /* c-aranshutup1 */
  + ~HPPercentLT("c-aran",40)~ + @12633 + a1877
  + ~HPPercentGT("c-aran",39) HPPercentLT("c-aran",80)~ + @12634 + a1878
  + ~HPPercentGT("c-aran",79)~ + @12635 + a1879
  + ~RandomNum(4,1)~ + @12625 + a1902
  + ~RandomNum(4,2)~ + @12625 + a1903
  + ~RandomNum(4,3)~ + @12625 + a1904
  + ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @8590 + a3210
  + ~RandomNum(4,4)~ + @12625 + a1905
  ++ @12645 + a1897
  + ~RandomNum(5,5)~ + @11609 + a3208 /* c-aranshutup75 */
  + ~RandomNum(5,4)~ + @12646 + a3144 /* c-aranshutup11 */
  + ~RandomNum(5,3)~ + @12629 + a3145 /* c-aranshutup12 */
  + ~RandomNum(5,2)~ + @11609 + a3146 /* c-aranshutup13 */
  + ~RandomNum(5,1)~ + @12628 + a3147 /* c-aranshutup14 */
  ++ @12647 + a1892
END

IF ~~ a1876
  SAY @12648
  + ~RandomNum(4,1)~ + @12625 + a1902
  + ~RandomNum(4,2)~ + @12625 + a1903
  + ~RandomNum(4,3)~ + @12625 + a1904
  + ~RandomNum(4,4)~ + @12625 + a1905
  + ~RandomNum(5,5)~ + @11609 + a3148 /* c-aranshutup15 */
  + ~RandomNum(5,4)~ + @12649 + a3149 /* c-aranshutup16 */
  + ~RandomNum(5,3)~ + @11609 + a3150 /* c-aranshutup17 */
  + ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @8590 + a3210
  + ~RandomNum(5,2)~ + @12628 + a3151 /* c-aranshutup18 */
  + ~RandomNum(5,1)~ + @11609 + a3152 /* c-aranshutup19 */
  + ~HPPercentLT("c-aran",40)~ + @12633 + a1877
  + ~HPPercentGT("c-aran",39) HPPercentLT("c-aran",80)~ + @12634 + a1878
  + ~HPPercentGT("c-aran",79)~ + @12635 + a1879
END

IF ~~ a1877 SAY @12650 IF ~~ THEN EXIT END
IF ~~ a1878 SAY @12651 IF ~~ THEN EXIT END
IF ~~ a1879 SAY @12652 IF ~~ THEN EXIT END
IF ~~ a1880 SAY @12653 IF ~~ THEN EXIT END
IF ~~ a1881 SAY @12654 IF ~~ THEN EXIT END
IF ~~ a1882 SAY @12655 IF ~~ THEN EXIT END
IF ~~ a1883 SAY @12656 IF ~~ THEN EXIT END
IF ~~ a1884 SAY @12657 IF ~~ THEN EXIT END
IF ~~ a1885 SAY @12658 IF ~~ THEN EXIT END
IF ~~ a1886 SAY @12659 IF ~~ THEN EXIT END
IF ~~ a1887 SAY @12660 IF ~~ THEN EXIT END
IF ~~ a1888 SAY @12661 IF ~~ THEN EXIT END
IF ~~ a1889 SAY @12662 IF ~~ THEN EXIT END
IF ~~ a1890 SAY @12663 IF ~~ THEN EXIT END
IF ~~ a1891 SAY @12664 IF ~~ THEN EXIT END
IF ~~ a1892 SAY @12665 IF ~~ THEN EXIT END
IF ~~ a1893 SAY @12666 IF ~~ THEN EXIT END
IF ~~ a1894 SAY @12667 IF ~~ THEN EXIT END
IF ~~ a1895 SAY @12668 IF ~~ THEN EXIT END
IF ~~ a1896 SAY @12669 IF ~~ THEN EXIT END
IF ~~ a1897 SAY @12670 IF ~~ THEN EXIT END
IF ~~ a1899 SAY @12671 IF ~~ THEN EXIT END
IF ~~ a1900 SAY @12672 IF ~~ THEN EXIT END
IF ~~ a1901 SAY @12673 IF ~~ THEN EXIT END
IF ~~ a1898 SAY @12674 IF ~~ THEN EXIT END

IF ~~ a1902
  SAY @12675
  ++ @12676 + a1880
  + ~RandomNum(5,5)~ + @12629 + a3153 /* c-aranshutup20 */
  + ~RandomNum(5,4)~ + @11609 + a3154 /* c-aranshutup21 */
  + ~RandomNum(5,3)~ + @12637 + a3155 /* c-aranshutup22 */
  + ~RandomNum(5,2)~ + @11609 + a3156 /* c-aranshutup23 */
  + ~RandomNum(5,1)~ + @12677 + a3157 /* c-aranshutup24 */
  + ~Gender(Player1,MALE)~ + @12678 + a1881
  + ~Gender(Player1,FEMALE)~ + @12678 + a1882
  ++ @12679 + a1883
  ++ @12680 + a1884
END

IF ~~ a1903
  SAY @12681
  ++ @12682 + a1888
  ++ @12683 + a1889
  ++ @12684 + a1890
  + ~RandomNum(5,5)~ + @12685 + a3158 /* c-aranshutup25 */
  + ~RandomNum(5,4)~ + @12686 + a3159 /* c-aranshutup26 */
  + ~RandomNum(5,3)~ + @12687 + a3160 /* c-aranshutup27 */
  + ~RandomNum(5,2)~ + @11609 + a3161 /* c-aranshutup28 */
  + ~RandomNum(5,1)~ + @12688 + a3162 /* c-aranshutup29 */
  ++ @12689 + a1891
END

IF ~~ a1904
  SAY @12690
  ++ @12691 + a1893
  ++ @12692 + a1894
  + ~RandomNum(5,5)~ + @12693 + a3163 /* c-aranshutup30 */
  + ~RandomNum(5,4)~ + @12694 + a3164 /* c-aranshutup31 */
  + ~RandomNum(5,3)~ + @12628 + a3165 /* c-aranshutup32 */
  + ~RandomNum(5,2)~ + @12629 + a3166 /* c-aranshutup33 */
  + ~RandomNum(5,1)~ + @11609 + a3167 /* c-aranshutup34 */
  ++ @12695 + a1895
  ++ @12696 + a1896
END

IF ~~ a1905
  SAY @12697
  ++ @12698 + a1898
  ++ @12699 + a1899
  + ~RandomNum(5,5)~ + @11609 + a3168 /* c-aranshutup35 */
  + ~RandomNum(5,4)~ + @12700 + a3169 /* c-aranshutup36 */
  + ~RandomNum(5,3)~ + @12701 + a3170 /* c-aranshutup37 */
  + ~RandomNum(5,2)~ + @12702 + a3171 /* c-aranshutup38 */
  + ~RandomNum(5,1)~ + @12703 + a3172 /* c-aranshutup39 */
  ++ @12704 + a1900
  ++ @12705 + a1901
END

/* Standard Exit Blocks (move to end) */
IF ~~ a3134 /* c-aranshutup1 */ SAY @1311 IF ~~ THEN EXIT END
IF ~~ a3135 /* c-aranshutup2 */ SAY @1312 IF ~~ THEN EXIT END
IF ~~ a3136 /* c-aranshutup3 */ SAY @1313 IF ~~ THEN EXIT END
IF ~~ a3137 /* c-aranshutup4 */ SAY @1314 IF ~~ THEN EXIT END
IF ~~ a3138 /* c-aranshutup5 */ SAY @1315 IF ~~ THEN EXIT END
IF ~~ a3139 /* c-aranshutup6 */ SAY @1316 IF ~~ THEN EXIT END
IF ~~ a3140 /* c-aranshutup7 */ SAY @1317 IF ~~ THEN EXIT END
IF ~~ a3141 /* c-aranshutup8 */ SAY @1318 IF ~~ THEN EXIT END
IF ~~ a3142 /* c-aranshutup9 */ SAY @1319 IF ~~ THEN EXIT END
IF ~~ a3143 /* c-aranshutup10 */ SAY @1320 IF ~~ THEN EXIT END
IF ~~ a3144 /* c-aranshutup11 */ SAY @1321 IF ~~ THEN EXIT END
IF ~~ a3145 /* c-aranshutup12 */ SAY @1322 IF ~~ THEN EXIT END
IF ~~ a3146 /* c-aranshutup13 */ SAY @1323 IF ~~ THEN EXIT END
IF ~~ a3147 /* c-aranshutup14 */ SAY @1324 IF ~~ THEN EXIT END
IF ~~ a3148 /* c-aranshutup15 */ SAY @1325 IF ~~ THEN EXIT END
IF ~~ a3149 /* c-aranshutup16 */ SAY @1326 IF ~~ THEN EXIT END
IF ~~ a3150 /* c-aranshutup17 */ SAY @1327 IF ~~ THEN EXIT END
IF ~~ a3151 /* c-aranshutup18 */ SAY @1328 IF ~~ THEN EXIT END
IF ~~ a3152 /* c-aranshutup19 */ SAY @1329 IF ~~ THEN EXIT END
IF ~~ a3153 /* c-aranshutup20 */ SAY @1330 IF ~~ THEN EXIT END
IF ~~ a3154 /* c-aranshutup21 */ SAY @1331 IF ~~ THEN EXIT END
IF ~~ a3155 /* c-aranshutup22 */ SAY @1332 IF ~~ THEN EXIT END
IF ~~ a3156 /* c-aranshutup23 */ SAY @1333 IF ~~ THEN EXIT END
IF ~~ a3157 /* c-aranshutup24 */ SAY @1334 IF ~~ THEN EXIT END
IF ~~ a3158 /* c-aranshutup25 */ SAY @12706 IF ~~ THEN EXIT END
IF ~~ a3159 /* c-aranshutup26 */ SAY @1336 IF ~~ THEN EXIT END
IF ~~ a3160 /* c-aranshutup27 */ SAY @1337 IF ~~ THEN EXIT END
IF ~~ a3161 /* c-aranshutup28 */ SAY @1338 IF ~~ THEN EXIT END
IF ~~ a3162 /* c-aranshutup29 */ SAY @1339 IF ~~ THEN EXIT END
IF ~~ a3163 /* c-aranshutup30 */ SAY @1340 IF ~~ THEN EXIT END
IF ~~ a3164 /* c-aranshutup31 */ SAY @1341 IF ~~ THEN EXIT END
IF ~~ a3165 /* c-aranshutup32 */ SAY @1342 IF ~~ THEN EXIT END
IF ~~ a3166 /* c-aranshutup33 */ SAY @1343 IF ~~ THEN EXIT END
IF ~~ a3167 /* c-aranshutup34 */ SAY @1344 IF ~~ THEN EXIT END
IF ~~ a3168 /* c-aranshutup35 */ SAY @1345 IF ~~ THEN EXIT END
IF ~~ a3169 /* c-aranshutup36 */ SAY @1346 IF ~~ THEN EXIT END
IF ~~ a3170 /* c-aranshutup37 */ SAY @1347 IF ~~ THEN EXIT END
IF ~~ a3171 /* c-aranshutup38 */ SAY @1348 IF ~~ THEN EXIT END
IF ~~ a3172 /* c-aranshutup39 */ SAY @1349 IF ~~ THEN EXIT END
IF ~~ a3173 /* c-aranshutup40 */ SAY @1350 IF ~~ THEN EXIT END
IF ~~ a3174 /* c-aranshutup41 */ SAY @1351 IF ~~ THEN EXIT END
IF ~~ a3175 /* c-aranshutup42 */ SAY @1352 IF ~~ THEN EXIT END
IF ~~ a3176 /* c-aranshutup43 */ SAY @1353 IF ~~ THEN EXIT END
IF ~~ a3177 /* c-aranshutup44 */ SAY @1354 IF ~~ THEN EXIT END
IF ~~ a3178 /* c-aranshutup45 */ SAY @1355 IF ~~ THEN EXIT END
IF ~~ a3179 /* c-aranshutup46 */ SAY @1356 IF ~~ THEN EXIT END
IF ~~ a3180 /* c-aranshutup47 */ SAY @1357 IF ~~ THEN EXIT END
IF ~~ a3181 /* c-aranshutup48 */ SAY @1358 IF ~~ THEN EXIT END
IF ~~ a3182 /* c-aranshutup49 */ SAY @1359 IF ~~ THEN EXIT END
IF ~~ a3183 /* c-aranshutup50 */ SAY @1360 IF ~~ THEN EXIT END
IF ~~ a3184 /* c-aranshutup51 */ SAY @1361 IF ~~ THEN EXIT END
IF ~~ a3185 /* c-aranshutup52 */ SAY @1362 IF ~~ THEN EXIT END
IF ~~ a3186 /* c-aranshutup53 */ SAY @1363 IF ~~ THEN EXIT END
IF ~~ a3187 /* c-aranshutup54 */ SAY @1364 IF ~~ THEN EXIT END
IF ~~ a3188 /* c-aranshutup55 */ SAY @1365 IF ~~ THEN EXIT END
IF ~~ a3189 /* c-aranshutup56 */ SAY @1366 IF ~~ THEN EXIT END
IF ~~ a3190 /* c-aranshutup57 */ SAY @1367 IF ~~ THEN EXIT END
IF ~~ a3191 /* c-aranshutup58 */ SAY @1368 IF ~~ THEN EXIT END
IF ~~ a3192 /* c-aranshutup59 */ SAY @1369 IF ~~ THEN EXIT END
IF ~~ a3193 /* c-aranshutup60 */ SAY @1370 IF ~~ THEN EXIT END
IF ~~ a3194 /* c-aranshutup61 */ SAY @1371 IF ~~ THEN EXIT END
IF ~~ a3195 /* c-aranshutup62 */ SAY @1372 IF ~~ THEN EXIT END
IF ~~ a3196 /* c-aranshutup63 */ SAY @1373 IF ~~ THEN EXIT END
IF ~~ a3197 /* c-aranshutup64 */ SAY @1374 IF ~~ THEN EXIT END
IF ~~ a3198 /* c-aranshutup65 */ SAY @1375 IF ~~ THEN EXIT END
IF ~~ a3199 /* c-aranshutup66 */ SAY @1376 IF ~~ THEN EXIT END
IF ~~ a3200 /* c-aranshutup67 */ SAY @1377 IF ~~ THEN EXIT END
IF ~~ a3201 /* c-aranshutup68 */ SAY @1378 IF ~~ THEN EXIT END
IF ~~ a3202 /* c-aranshutup69 */ SAY @1379 IF ~~ THEN EXIT END
IF ~~ a3203 /* c-aranshutup70 */ SAY @1380 IF ~~ THEN EXIT END
IF ~~ a3204 /* c-aranshutup71 */ SAY @1381 IF ~~ THEN EXIT END
IF ~~ a3205 /* c-aranshutup72 */ SAY @1382 IF ~~ THEN EXIT END
IF ~~ a3206 /* c-aranshutup73 */ SAY @1383 IF ~~ THEN EXIT END
IF ~~ a3207 /* c-aranshutup74 */ SAY @1384 IF ~~ THEN EXIT END
IF ~~ a3208 /* c-aranshutup75 */ SAY @1385 IF ~~ THEN EXIT END


 // unused 'shutup' conversation exit panels :

  // + ~RandomNum(5,5)~ + @12637 + a3173 /* c-aranshutup40 */
  // + ~RandomNum(5,4)~ + @11609 + a3174 /* c-aranshutup41 */
  // + ~RandomNum(5,3)~ + @11609 + a3175 /* c-aranshutup42 */
  // + ~RandomNum(5,2)~ + @11609 + a3176 /* c-aranshutup43 */
  // + ~RandomNum(5,1)~ + @12646 + a3177 /* c-aranshutup44 */

  // + ~RandomNum(5,5)~ + ~[PC] I am trying to think up a random insult to hurl your way, but I'm fresh out of ideas.~ + a3178 /* c-aranshutup45 */
  // + ~RandomNum(5,4)~ + @11609 + a3179 /* c-aranshutup46 */
  // + ~RandomNum(5,3)~ + ~[PC] I would insult you, but I have rules against taking advantage of idiots.~ + a3180 /* c-aranshutup47 */
  // + ~RandomNum(5,2)~ + @12630 + a3181 /* c-aranshutup48 */
  // + ~RandomNum(5,1)~ + ~[PC] To quote a Rashemite insult, thou art a warped ill-nurtured gibberling.~ + a3182 /* c-aranshutup49 */

  // + ~RandomNum(5,5)~ + @11609 + a3183 /* c-aranshutup50 */
  // + ~RandomNum(5,4)~ + @12629 + a3184 /* c-aranshutup51 */
  // + ~RandomNum(5,3)~ + @11609 + a3185 /* c-aranshutup52 */
  // + ~RandomNum(5,2)~ + @11609 + a3186 /* c-aranshutup53 */
  // + ~RandomNum(5,1)~ + @12630 + a3187 /* c-aranshutup54 */

  // + ~RandomNum(5,5)~ + @11609 + a3193 /* c-aranshutup60 */
  // + ~RandomNum(5,4)~ + @12637 + a3194 /* c-aranshutup61 */
  // + ~RandomNum(5,3)~ + @11609 + a3195 /* c-aranshutup62 */
  // + ~RandomNum(5,2)~ + @12630 + a3196 /* c-aranshutup63 */
  // + ~RandomNum(5,1)~ + @11609 + a3197 /* c-aranshutup64 */

  // + ~RandomNum(5,5)~ + @12629 + a3198 /* c-aranshutup65 */
  // + ~RandomNum(5,4)~ + @11609 + a3199 /* c-aranshutup66 */
  // + ~RandomNum(5,3)~ + @11609 + a3200 /* c-aranshutup67 */
  // + ~RandomNum(5,2)~ + @12628 + a3201 /* c-aranshutup68 */
  // + ~RandomNum(5,1)~ + @11609 + a3202 /* c-aranshutup69 */

  // + ~RandomNum(5,5)~ + ~[PC] I am trying to think up a random insult to hurl your way, but I'm fresh out of ideas.~ + a3203 /* c-aranshutup70 */
  // + ~RandomNum(5,4)~ + @11609 + a3204 /* c-aranshutup71 */
  // + ~RandomNum(5,3)~ + @11609 + a3205 /* c-aranshutup72 */
  // + ~RandomNum(5,2)~ + @12637 + a3206 /* c-aranshutup73 */
  // + ~RandomNum(5,1)~ + @11609 + a3207 /* c-aranshutup74 */

 /* wraith response */
IF ~~ a2239
  SAY @12707
  IF ~~ THEN EXTERN HGWRA01 25
END

END /* of append to c-arn25j */

/* Added ToB "PID Started by another NPC" calls. In ToB, I am sticking with the Canonical BioWare(tm) and a standard "IsGabber/<TOKEN>" block to cover any of the others, but Sarevok might be fun to play with: */

CHAIN C-ARN25J a2676
@12708
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",0)~ THEN @12709
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",1)~ THEN @12710
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",2)~ THEN @12711
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",3)~ THEN @12712
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",4)~ THEN @12713
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",5)~ THEN @12714
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",0)~ THEN @12715 DO ~SetGlobal("c-aransarspar","GLOBAL",1)~
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",1)~ THEN @12716 DO ~SetGlobal("c-aransarspar","GLOBAL",2)~
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",2)~ THEN @12717 DO ~SetGlobal("c-aransarspar","GLOBAL",3)~
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",3)~ THEN @12718 DO ~SetGlobal("c-aransarspar","GLOBAL",4)~
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",4)~ THEN @12719 DO ~SetGlobal("c-aransarspar","GLOBAL",5)~
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",5)~ THEN @12720
EXIT

/*
OK, then came the little matter of ToB Joining dialog, and how to set things for Romance. For male PCs, this really doesn't matter. Aran can pick up and run with it. But for female PCs, the same problem Berelinde had with going between BG1 and BG2 with Gavin gets into play here. We have three "Fate Spirit" summons for female PC's, allowing declaration of "friend", "lover", and "former lover", setting the romance variable to 0, 2, or 3. But with the in-depth content in play in BG2, it makes it difficult to follow further whether they have had an on-again off-again relationship, or what they have done together.

There is another consideration - testing. Basically, after each opportunity to flirt or lovetalk or whatever, I want an easy way of determining the status of the relationship without always having to type in the CLUAConsole (because I sink at typing). And a very common player post is about how to set or change the romance variables, or check on them. So, an opportunity that is more in-depth than the standard PID "breakup, flirt, no flirt" options... something that during joining, rejoining, and regular play the player can use to check on (and perhaps change) the status. If playtesters dislike it, we can always drop it - it does mean that a player can "change history" on the fly the way it is currently coded. That might be useful for testing, but might not be so cool in play.

Copies go in pre-joined ToB, Joined ToB, Post-Joined ToB, Post-Joined SoA, and Joined SoA. Initiating links could loop in anywhere, but this probably is best set up as a PID option "status check".
Still to integrate:
c-aranfirstsex = 1 : self-identified no experience (no need to look for whether or not RE content, etc. is in play -  leaves the option for play as a manipulative PC "Oh, I have never done this before" is something that could be said many many ways)

idea presented by Autumn Bard - mirrors some of the close tracking of progress in Berelinde's Gavin and Jastey's Ajantis.

c-aransex = 0 : no intimacy
c-aransex = 1 : kissing
c-aransex = 2 : touching + kissing
c-aransex = 3 : heavy innuendo touching ("petting")
c-aransex = 4 : full physical intimacy

So, a dialog for checking

[code]
  ++ @8590 + a3210
[/code]
*/

/* Aran... what do you think our "relationship" is?  Resetting for players for ToB, but might double as a recheck via PID on both SoA and ToB. Useful for testing, anyways. */
CHAIN C-ARN25A a2694
@11268
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranfight","GLOBAL",0)~ THEN @11269
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-silencearan","GLOBAL",0)~ THEN @11270
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aanoconflict","GLOBAL",0)~ THEN @11271
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0)~ THEN @11272
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1)~ THEN @11273
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",1)~ THEN @11274
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",0)~ THEN @11275
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",1)~ THEN @11276
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",2)~ THEN @11277
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",3)~ THEN @11278
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",4)~ THEN @11279
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",3)~ THEN @11280
== C-ARN25A IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN @11281
== C-ARN25A IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN @11282
== C-ARN25A IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN @11283
== C-ARN25A IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN @11284
== C-ARN25A IF ~HasItemEquiped("belt05",Player1)~ THEN @11285
END
++ @11286 EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + @11287 EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + @11288 DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",1)~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + @11289 EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + @11290 DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",0)~  EXIT
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11291 DO ~SetGlobal("c-aranrom","GLOBAL",3)~ + a2661
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11292 DO ~SetGlobal("c-aranrom","GLOBAL",2)~ + a2698
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11293 DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11294 DO ~SetGlobal("c-aranrom","GLOBAL",1)~ + a2697
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11295 EXTERN C-ARN25A a2695
+ ~HasItemEquiped("belt05",Player1)~ + @12721 EXIT

APPEND C-ARN25A

IF ~~ a2695
  SAY @10518
  ++ @10519 + a2697
  ++ @10520 DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a2697
  ++ @10521 +  a2696
  ++ @10522 + a2697
END

IF ~~ a2696
  SAY @10523
  ++ @10519 + a2697
  ++ @10524 DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a2697
  ++ @10525 DO ~SetGlobal("c-aransex","GLOBAL",1)~ +  a2698
  ++ @10526 DO ~SetGlobal("c-aransex","GLOBAL",2)~ + a2698
  ++ @10527 DO ~SetGlobal("c-aransex","GLOBAL",3)~ + a2698
  ++ @10528 DO ~SetGlobal("c-aransex","GLOBAL",4)~ + a2698
  ++ @10522 + a2697
END

IF ~~ a2697
  SAY @10529
  IF ~~ THEN EXIT
END

IF ~~ a2698
  SAY @10530
  IF ~~ THEN EXIT
END

END /* of APPEND */

/* copy for Joined */

CHAIN C-ARN25J a3210
@11268
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranfight","GLOBAL",0)~ THEN @11269
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-silencearan","GLOBAL",0)~ THEN @11270
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aanoconflict","GLOBAL",0)~ THEN @11271
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0)~ THEN @11272
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1)~ THEN @11273
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",1)~ THEN @11274
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",0)~ THEN @11275
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",1)~ THEN @11276
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",2)~ THEN @11277
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",3)~ THEN @11278
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",4)~ THEN @11279
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",3)~ THEN @11280
== C-ARN25J IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN @11281
== C-ARN25J IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN @11282
== C-ARN25J IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN @11283
== C-ARN25J IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN @11284
== C-ARN25J IF ~HasItemEquiped("belt05",Player1)~ THEN @11285
END
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + @11286 EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + @11287 EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + @11288 DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",1)~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + @11289 EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + @11290 DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",0)~  EXIT
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2)~ + @11291 + a3211
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranrom","GLOBAL",2)~ + @11292 DO ~SetGlobal("c-aranrom","GLOBAL",2)~ + a3215
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11293 DO ~SetGlobal("c-aranrom","GLOBAL",2)~ + a3213
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranrom","GLOBAL",2)~ + @11294 DO ~SetGlobal("c-aranrom","GLOBAL",1)~ + a3214
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11295 EXTERN C-ARN25J a3212
+ ~HasItemEquiped("belt05",Player1)~ + @12721 EXIT

APPEND C-ARN25J

IF ~~ a3211
  SAY @10515
  = @10516
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~  EXIT
END

IF ~~ a3212
  SAY @10518
  ++ @10519 + a3214
  ++ @10520 DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a3214
  ++ @10521 + a3216
  ++ @10522 + a3214
END

IF ~~ a3213
  SAY @10517
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~  EXIT
END

IF ~~ a3214
  SAY @10529
  IF ~~ THEN EXIT
END

IF ~~ a3215
  SAY @10530
  IF ~~ THEN EXIT
END

IF ~~ a3216
  SAY @10523
  ++ @10519 + a3214
  ++ @10524 DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a3214
  ++ @10525 DO ~SetGlobal("c-aransex","GLOBAL",1)~ + a3215
  ++ @10526 DO ~SetGlobal("c-aransex","GLOBAL",2)~ + a3215
  ++ @10527 DO ~SetGlobal("c-aransex","GLOBAL",3)~ + a3215
  ++ @10528 DO ~SetGlobal("c-aransex","GLOBAL",4)~ + a3215
  ++ @10522 + a3214
END
END /* of APPEND */

/* copy for Post */

CHAIN C-ARN25P a3223
@11268
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranfight","GLOBAL",0)~ THEN @11269
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-silencearan","GLOBAL",0)~ THEN @11270
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aanoconflict","GLOBAL",0)~ THEN @11271
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0)~ THEN @11272
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1)~ THEN @11273
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",1)~ THEN @11274
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",0)~ THEN @11275
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",1)~ THEN @11276
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",2)~ THEN @11277
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",3)~ THEN @11278
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",4)~ THEN @11279
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",3)~ THEN @11280
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0)~ THEN @12722
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",1)~ THEN @12723
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN @11281
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN @11282
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN @11283
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN @11284
== C-ARN25P IF ~HasItemEquiped("belt05",Player1)~ THEN @11285
END
++ @11286 EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + @11287 EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + @11288 DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",1)~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + @11289 EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + @11290 DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",0)~  EXIT
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2)~ + @11291 + a3217
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranrom","GLOBAL",2)~ + @11292 DO ~SetGlobal("c-aranrom","GLOBAL",2)~ + a3218
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11293 DO ~SetGlobal("c-aranrom","GLOBAL",2)~ + a3220
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11294 DO ~SetGlobal("c-aranrom","GLOBAL",1)~ + a3221
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + @11295 EXTERN C-ARN25P a3219
+ ~HasItemEquiped("belt05",Player1)~ + @12721 EXIT

APPEND C-ARN25P

IF ~~ a3217
  SAY @10515
  = @10516
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~  EXIT
END

IF ~~ a3220
  SAY @10517
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~  EXIT
END

IF ~~ a3219
  SAY @10518
  ++ @10519 + a3221
  ++ @10520 DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a3221
  ++ @10521 + a3222
  ++ @10522 + a3221
END

IF ~~ a3222
  SAY @10523
  ++ @10519 + a3221
  ++ @10524 DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a3221
  ++ @10525 DO ~SetGlobal("c-aransex","GLOBAL",1)~ +  a3218
  ++ @10526 DO ~SetGlobal("c-aransex","GLOBAL",2)~ + a3218
  ++ @10527 DO ~SetGlobal("c-aransex","GLOBAL",3)~ + a3218
  ++ @10528 DO ~SetGlobal("c-aransex","GLOBAL",4)~ + a3218
  ++ @10522 + a3221
END

IF ~~ a3221
  SAY @10529
  IF ~~ THEN EXIT
END

IF ~~ a3218
  SAY @10530
  IF ~~ THEN EXIT
END

END /* of APPEND */

/* Master Wraith Talk. */

/* break in and set up the talk if in a romance */
EXTEND_BOTTOM HGWRA01 18
IF ~Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("c-aranlovedone","GLOBAL",6)~ EXTERN HGWRA01 a2240
END

/* Create the EXTERN, as we want only one of these to play */
CHAIN HGWRA01 a2240
@12724
== C-ARN25J @12725
EXTERN HGWRA01 24

/* draw off the romance-triggered sob stories to a new one */
EXTEND_BOTTOM HGWRA01 24
IF ~Global("c-aranrom","GLOBAL",2)~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("C-ACT218")~ EXIT
END

/* start the waterworks */
CHAIN IF ~NumTimesTalkedTo(0)~ THEN C-ARWRTH a2241
@12726
== C-ARN25J @12727
== C-ARWRTH @12728
== C-ARN25J @12729
== C-ARWRTH @12730
== C-ARN25J @12731
== C-ARWRTH @12732
== C-ARN25J @12733
== C-ARWRTH @12734
== C-ARN25J @12735
== C-ARWRTH @12736
END
++ @12737 EXTERN HGWRA01 25
++ @12738 EXTERN C-ARN25J a2239
++ @12739 EXTERN HGWRA01 25
++ @12740 EXTERN HGWRA01 25
+ ~CheckStatGT(Player1,16,WIS)~ + @12741 EXTERN C-ARN25J a2239


APPEND C-ARN25J


/* temporary state for missing content. */

IF ~~ c-tobplaceholder SAY @10273 IF ~~ THEN EXIT END

END /* of append to C-ARN25J */

CHAIN C-ARN25J a2792
@12742
== BKORGA25 IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @12743
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @12744
== C-ARN25J IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @12745
== C-ARN25J IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @12746
== BKORGA25 IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @12747
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @12748
== BCERND25 IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @12749
== BJAN25 IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @12750
END
++ @12751 + a2810
+ ~Gender(Player1,MALE)~ + @12752 + a2808
+ ~Gender(Player1,FEMALE)~ + @12752 + a2809
++ @12753 + a2810
++ @12754 + a2810
++ @12755 + a2810


CHAIN C-ARN25J a2810
@12756
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12757
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12758
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @12759
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @12760
END
++ @12761 + a2812
++ @12762 + a2812
++ @12763 + a2812
++ @12764 + a2812
++ @12765 + a2812

CHAIN C-ARN25J a2812
@12766
== BANOME25 IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @12767
== BKELDO25 IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @12768
== BMAZZY25 IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @12769
END
++ @11804 + a2813
++ @12770 + a2813
++ @12771 + a2813
++ @12772 + a2813
++ @12773 + a2813

CHAIN C-ARN25J a2813
@11810
== BEDWIN25 IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @12774
== BMINSC25 IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @12775
END
++ @11811 + a2849
++ @12776 + a2849
++ @12777 + a2849
++ @12778 + a2849
+ ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + @12779 + a2849
+ ~Gender(Player1,FEMALE) !Global("c-aranrom","GLOBAL",2)~ + @12780 + a2849
+ ~Gender(Player1,MALE)~ + @12781 + a2849

CHAIN C-ARN25J a2885 /* no touching; hint */
@12782
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12783
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12784
== C-ARN25J @12785
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12757
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12758
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @12759
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @12760
END
++ @12761 + a2812
++ @12762 + a2812
++ @12763 + a2812
++ @12764 + a2812
++ @12765 + a2812

CHAIN C-ARN25J a2886 /* kissing */
@12786
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12783
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12784
== C-ARN25J @12785
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12757
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12758
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @12759
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @12760
END
++ @12761 + a2812
++ @12762 + a2812
++ @12763 + a2812
++ @12764 + a2812
++ @12765 + a2812

CHAIN C-ARN25J a2887 /* touching */
@12787
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12788
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12784
== C-ARN25J @12785
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12757
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12758
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @12759
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @12760
END
++ @12761 + a2812
++ @12762 + a2812
++ @12763 + a2812
++ @12764 + a2812
++ @12765 + a2812


CHAIN C-ARN25J a2888 /* petting */
@12789
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12790
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12791
== C-ARN25J @12792
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12757
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12758
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @12759
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @12760
END
++ @12761 + a2812
++ @12762 + a2812
++ @12763 + a2812
++ @12764 + a2812
++ @12765 + a2812

CHAIN C-ARN25J a2889 /* sex */
@12793
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12790
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12791
== C-ARN25J @12792
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12757
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12758
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @12759
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @12760
END
++ @12761 + a2812
++ @12762 + a2812
++ @12763 + a2812
++ @12764 + a2812
++ @12765 + a2812


/* ToB Banters */

APPEND C-ARN25B

/* ToB Banters: Aran > Jaheira Back in The Day : Ajantis */
IF ~~ a4255
  SAY @12794
  IF ~~ THEN EXTERN BJAHEI25 a4256
END

/* ToB Banters: Aran > Jaheira Back in The Day : Imoen */
IF ~~ a4257
  SAY @12795
  IF ~~ THEN EXTERN BJAHEI25 a4256
END

/* ToB Banters: Aran > Jaheira Back in The Day : Viconia */
IF ~~ a4258
  SAY @12796
  IF ~~ THEN EXTERN BJAHEI25 a4256
END

/* ToB Banters: Aran > Jaheira Back in The Day : Edwin */
IF ~~ a4259
  SAY @12797
  IF ~~ THEN EXTERN BJAHEI25 a4256
END

/* ToB Banters: Aran > Jaheira Back in The Day : Gavin */
IF ~~ a4260
  SAY @12798
  IF ~~ THEN EXTERN BJAHEI25 a4256
END

/* ToB Banters: Aran > Jaheira Back in The Day : Xan */
IF ~~ a4261
  SAY @12799
  IF ~~ THEN EXTERN BJAHEI25 a4256
END

/* ToB Banters: Aran > Jaheira Back in The Day : Kivan */
IF ~~ a4262
  SAY @12800
  IF ~~ THEN EXTERN BJAHEI25 a4256
END

END

/* ToB Banters: Aran > Nalia : Social Justice */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntob24b","GLOBAL",0) InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID) InParty("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN C-ARN25B c-arantob24b
@12801 DO ~SetGlobal("c-arntob24b","GLOBAL",1)~
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12802 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12803
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12804 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12805
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12806 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12807
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12808 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) InParty("Sarevok")~ THEN @12809
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12810
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12811 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12812
EXIT

/* ToB Banters: Nalia > Aran */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntob8b","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN BNALIA25 c-arantob8b
@12813 DO ~SetGlobal("c-arntob8b","GLOBAL",1)~
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12814
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12815
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12816
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12817 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12818
EXIT

/* ToB Banters: Aran > Sarevok : Trust Is Immaterial */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntob32b","GLOBAL",0) InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID) InParty("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN C-ARN25B c-arantob32b
@12819 DO ~SetGlobal("c-arntob32b","GLOBAL",1)~
== BSAREV25 IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @12820 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12821
== BSAREV25 IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @12822
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12823
== BSAREV25 IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @12824
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12825
== BSAREV25 IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @12826
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12827
== BSAREV25 IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @12828
== BSAREV25 IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @12829
EXIT

/* Only one of these fire per game, dependent on the NPC being in the party; closed by Global("c-arntobtellher","GLOBAL" */

/* ToB Banters: Aran > Aerie : Tell Her */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntobtellher","GLOBAL",0) InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)
!Global("B!KeldornRA","GLOBAL",1) // banter deferred to Keldorn if active
!Global("C#AjantisPCMarriage","GLOBAL",1) // banter shut down if PC is married to Ajantis
!Global("ADAngelMarried","GLOBAL",1) // banter shut down if PC is married to Angelo
OR(2)
Global("c-aranrom","GLOBAL",1)
Global("c-aranrom","GLOBAL",2)
OR(16)
Global("LS#SarevokRomanceActive","GLOBAL",1) 
Global("LS#SarevokRomanceActive","GLOBAL",2)
Global("B!GavRA","GLOBAL",2)
Global("AnomenRomanceActive","GLOBAL",1)
Global("AnomenRomanceActive","GLOBAL",2)
Global("EdwinRomanceActive", "GLOBAL", 1)
Global("EdwinRomanceActive", "GLOBAL", 2)
Global("J#KelseyRomanceActive","GLOBAL",2)
Global("TsujathaRomanceActive","GLOBAL",2)
Global("LS_HaerDalisRomance","GLOBAL",1)
Global("LS_HaerDalisRomance","GLOBAL",2)
Global("ADAngelRomanceActive","GLOBAL",2)
GlobalGT("SolaTalk","GLOBAL",14)
Global("P#KivanRomanceActive","GLOBAL",2)
Global("H#ValygarRomanceActive","GLOBAL",2)
Global("O#XanRomanceActive","GLOBAL",2)~
THEN C-ARN25B c-arantob33b1
@12830 DO ~SetGlobal("c-arntobtellher","GLOBAL",1)~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12831 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12832
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12833 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12834
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12835 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12836
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12837 
/* Haer'Dalis, Aeryn */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("LS_HaerDalisRomance","GLOBAL",1)  Global("LS_HaerDalisRomance","GLOBAL",2)~ THEN @12838
/* Angelo, Sister Vigilante */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("ADAngelRomanceActive","GLOBAL",2)~ THEN @12839
/* Sarevok, Aeryn */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("LS#SarevokRomanceActive","GLOBAL",1) Global("LS#SarevokRomanceActive","GLOBAL",2)~ THEN @12840
/* Kelsey, JCompton */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("J#KelseyRomanceActive","GLOBAL",2)~ THEN @12841
/* Tsujatha, Nethrun and Sillara */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("TsujathaRomanceActive","GLOBAL",2)~ THEN @12842
/* Gavin, Berelinde */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("B!GavRA","GLOBAL",2)~ THEN @12843
/* Anomen, BioWare */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("AnomenRomanceActive","GLOBAL",1) Global("AnomenRomanceActive","GLOBAL",2)~ THEN @12844
/* Edwin, Laufey */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("EdwinRomanceActive", "GLOBAL", 1) Global("EdwinRomanceActive", "GLOBAL", 2)~ THEN @12845
/* Ajantis, Jastey */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("C#AjantisRomanceActive","GLOBAL",2)~ THEN @12846
/* Solaufein, Weimer */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) GlobalGT("SolaTalk","GLOBAL",14)~ THEN @12847
/* Kivan, Domi  */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("P#KivanRomanceActive","GLOBAL",2) !Global("P#KivanRomanceInactive","GLOBAL",1)~ THEN @12848
/* Valygar, CRomantique, Domi */ 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("H#ValygarRomanceActive","GLOBAL",2)~ THEN @12849
/* Xan: materials without referent cover all pathways without worrying about Xan, Valygar, Bonded, not bonded, etc. */ 
/* summary response */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12850
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12851 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12852
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12853 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12854
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12855 
EXIT

/* ToB Banters: Aran > Jaheira : Tell Her */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntobtellher","GLOBAL",0) 
InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)
!Global("B!KeldornRA","GLOBAL",1) // banter deferred to Keldorn if active
!Global("C#AjantisPCMarriage","GLOBAL",1) // banter shut down if PC is married to Ajantis
!Global("ADAngelMarried","GLOBAL",1) // banter shut down if PC is married to Angelo
OR(2)
Global("c-aranrom","GLOBAL",1)
Global("c-aranrom","GLOBAL",2)
OR(16)
Global("LS#SarevokRomanceActive","GLOBAL",1) 
Global("LS#SarevokRomanceActive","GLOBAL",2)
Global("B!GavRA","GLOBAL",2)
Global("AnomenRomanceActive","GLOBAL",1)
Global("AnomenRomanceActive","GLOBAL",2)
Global("EdwinRomanceActive", "GLOBAL", 1)
Global("EdwinRomanceActive", "GLOBAL", 2)
Global("J#KelseyRomanceActive","GLOBAL",2)
Global("TsujathaRomanceActive","GLOBAL",2)
Global("LS_HaerDalisRomance","GLOBAL",1)
Global("LS_HaerDalisRomance","GLOBAL",2)
Global("ADAngelRomanceActive","GLOBAL",2)
GlobalGT("SolaTalk","GLOBAL",14)
Global("P#KivanRomanceActive","GLOBAL",2)
Global("H#ValygarRomanceActive","GLOBAL",2)
Global("O#XanRomanceActive","GLOBAL",2)~
THEN C-ARN25B c-arantob33b2
@12830 DO ~SetGlobal("c-arntobtellher","GLOBAL",1)~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12856 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12832
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12857 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12858
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12859 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12836
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12860 
/* Haer'Dalis, Aeryn */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("LS_HaerDalisRomance","GLOBAL",1)  Global("LS_HaerDalisRomance","GLOBAL",2)~ THEN @12838
/* Angelo, Sister Vigilante */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("ADAngelRomanceActive","GLOBAL",2)~ THEN @12839
/* Sarevok, Aeryn */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("LS#SarevokRomanceActive","GLOBAL",1) Global("LS#SarevokRomanceActive","GLOBAL",2)~ THEN @12840
/* Kelsey, JCompton */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("J#KelseyRomanceActive","GLOBAL",2)~ THEN @12841
/* Tsujatha, Nethrun and Sillara */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("TsujathaRomanceActive","GLOBAL",2)~ THEN @12842
/* Gavin, Berelinde */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("B!GavRA","GLOBAL",2)~ THEN @12843
/* Anomen, BioWare */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("AnomenRomanceActive","GLOBAL",1) Global("AnomenRomanceActive","GLOBAL",2)~ THEN @12844
/* Edwin, Laufey */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("EdwinRomanceActive", "GLOBAL", 1) Global("EdwinRomanceActive", "GLOBAL", 2)~ THEN @12845
/* Ajantis, Jastey */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("C#AjantisRomanceActive","GLOBAL",2)~ THEN @12846
/* Solaufein, Weimer */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) GlobalGT("SolaTalk","GLOBAL",14)~ THEN @12847
/* Kivan, Domi  */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("P#KivanRomanceActive","GLOBAL",2) !Global("P#KivanRomanceInactive","GLOBAL",1)~ THEN @12848
/* Valygar, CRomantique, Domi */ 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("H#ValygarRomanceActive","GLOBAL",2)~ THEN @12849
/* Xan: materials without referent cover all pathways without worrying about Xan, Valygar, Bonded, not bonded, etc. */ 
/* summary response */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12850
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12861 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12862
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12863 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12864
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @12865 
EXIT

/* ToB Banters: Aran > Nalia : Tell Her */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntobtellher","GLOBAL",0) 
InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)
!Global("B!KeldornRA","GLOBAL",1) // banter deferred to Keldorn if active
!Global("C#AjantisPCMarriage","GLOBAL",1) // banter shut down if PC is married to Ajantis
!Global("ADAngelMarried","GLOBAL",1) // banter shut down if PC is married to Angelo
OR(2)
Global("c-aranrom","GLOBAL",1)
Global("c-aranrom","GLOBAL",2)
OR(16)
Global("LS#SarevokRomanceActive","GLOBAL",1) 
Global("LS#SarevokRomanceActive","GLOBAL",2)
Global("B!GavRA","GLOBAL",2)
Global("AnomenRomanceActive","GLOBAL",1)
Global("AnomenRomanceActive","GLOBAL",2)
Global("EdwinRomanceActive", "GLOBAL", 1)
Global("EdwinRomanceActive", "GLOBAL", 2)
Global("J#KelseyRomanceActive","GLOBAL",2)
Global("TsujathaRomanceActive","GLOBAL",2)
Global("LS_HaerDalisRomance","GLOBAL",1)
Global("LS_HaerDalisRomance","GLOBAL",2)
Global("ADAngelRomanceActive","GLOBAL",2)
GlobalGT("SolaTalk","GLOBAL",14)
Global("P#KivanRomanceActive","GLOBAL",2)
Global("H#ValygarRomanceActive","GLOBAL",2)
Global("O#XanRomanceActive","GLOBAL",2)~
THEN C-ARN25B c-arantob33b3
@12830 DO ~SetGlobal("c-arntobtellher","GLOBAL",1)~
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12866 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12832
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12867 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12868
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12869 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12836
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12870 
/* Haer'Dalis, Aeryn */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("LS_HaerDalisRomance","GLOBAL",1)  Global("LS_HaerDalisRomance","GLOBAL",2)~ THEN @12838
/* Angelo, Sister Vigilante */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("ADAngelRomanceActive","GLOBAL",2)~ THEN @12839
/* Sarevok, Aeryn */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("LS#SarevokRomanceActive","GLOBAL",1) Global("LS#SarevokRomanceActive","GLOBAL",2)~ THEN @12840
/* Kelsey, JCompton */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("J#KelseyRomanceActive","GLOBAL",2)~ THEN @12841
/* Tsujatha, Nethrun and Sillara */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("TsujathaRomanceActive","GLOBAL",2)~ THEN @12842
/* Gavin, Berelinde */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("B!GavRA","GLOBAL",2)~ THEN @12843
/* Anomen, BioWare */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("AnomenRomanceActive","GLOBAL",1) Global("AnomenRomanceActive","GLOBAL",2)~ THEN @12844
/* Edwin, Laufey */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("EdwinRomanceActive", "GLOBAL", 1) Global("EdwinRomanceActive", "GLOBAL", 2)~ THEN @12845
/* Ajantis, Jastey */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("C#AjantisRomanceActive","GLOBAL",2)~ THEN @12846
/* Solaufein, Weimer */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) GlobalGT("SolaTalk","GLOBAL",14)~ THEN @12847
/* Kivan, Domi  */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("P#KivanRomanceActive","GLOBAL",2) !Global("P#KivanRomanceInactive","GLOBAL",1)~ THEN @12848
/* Valygar, CRomantique, Domi */ 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("H#ValygarRomanceActive","GLOBAL",2)~ THEN @12849
/* Xan: materials without referent cover all pathways without worrying about Xan, Valygar, Bonded, not bonded, etc. */ 
/* summary response */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12850
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12871 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12872
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12873 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12874
== BNALIA25 IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @12875 
EXIT

/* ToB Banters: Aran > Mazzy : Tell Her */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntobtellher","GLOBAL",0) 
InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)
!Global("B!KeldornRA","GLOBAL",1) // banter deferred to Keldorn if active
!Global("C#AjantisPCMarriage","GLOBAL",1) // banter shut down if PC is married to Ajantis
!Global("ADAngelMarried","GLOBAL",1) // banter shut down if PC is married to Angelo
OR(2)
Global("c-aranrom","GLOBAL",1)
Global("c-aranrom","GLOBAL",2)
OR(16)
Global("LS#SarevokRomanceActive","GLOBAL",1) 
Global("LS#SarevokRomanceActive","GLOBAL",2)
Global("B!GavRA","GLOBAL",2)
Global("AnomenRomanceActive","GLOBAL",1)
Global("AnomenRomanceActive","GLOBAL",2)
Global("EdwinRomanceActive", "GLOBAL", 1)
Global("EdwinRomanceActive", "GLOBAL", 2)
Global("J#KelseyRomanceActive","GLOBAL",2)
Global("TsujathaRomanceActive","GLOBAL",2)
Global("LS_HaerDalisRomance","GLOBAL",1)
Global("LS_HaerDalisRomance","GLOBAL",2)
Global("ADAngelRomanceActive","GLOBAL",2)
GlobalGT("SolaTalk","GLOBAL",14)
Global("P#KivanRomanceActive","GLOBAL",2)
Global("H#ValygarRomanceActive","GLOBAL",2)
Global("O#XanRomanceActive","GLOBAL",2)~
THEN C-ARN25B c-arantob33b4
@12830 DO ~SetGlobal("c-arntobtellher","GLOBAL",1)~
== BMAZZY25 IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @12876 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12832
== BMAZZY25 IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @12877
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12878
== BMAZZY25 IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @12879 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12836
== BMAZZY25 IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @12880 
/* Haer'Dalis, Aeryn */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("LS_HaerDalisRomance","GLOBAL",1)  Global("LS_HaerDalisRomance","GLOBAL",2)~ THEN @12838
/* Angelo, Sister Vigilante */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("ADAngelRomanceActive","GLOBAL",2)~ THEN @12839
/* Sarevok, Aeryn */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("LS#SarevokRomanceActive","GLOBAL",1) Global("LS#SarevokRomanceActive","GLOBAL",2)~ THEN @12840
/* Kelsey, JCompton */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("J#KelseyRomanceActive","GLOBAL",2)~ THEN @12841
/* Tsujatha, Nethrun and Sillara */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("TsujathaRomanceActive","GLOBAL",2)~ THEN @12842
/* Gavin, Berelinde */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("B!GavRA","GLOBAL",2)~ THEN @12843
/* Anomen, BioWare */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("AnomenRomanceActive","GLOBAL",1) Global("AnomenRomanceActive","GLOBAL",2)~ THEN @12844
/* Edwin, Laufey */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("EdwinRomanceActive", "GLOBAL", 1) Global("EdwinRomanceActive", "GLOBAL", 2)~ THEN @12845
/* Ajantis, Jastey */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("C#AjantisRomanceActive","GLOBAL",2)~ THEN @12846
/* Solaufein, Weimer */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) GlobalGT("SolaTalk","GLOBAL",14)~ THEN @12847
/* Kivan, Domi  */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("P#KivanRomanceActive","GLOBAL",2) !Global("P#KivanRomanceInactive","GLOBAL",1)~ THEN @12848
/* Valygar, CRomantique, Domi */ 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("H#ValygarRomanceActive","GLOBAL",2)~ THEN @12849
/* Xan: materials without referent cover all pathways without worrying about Xan, Valygar, Bonded, not bonded, etc. */ 
/* summary response */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12850
== BMAZZY25 IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @12881 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12882
== BMAZZY25 IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @12883 
EXIT

/* ToB Banters: Aran > Keldorn, Romanced Or Not : Tell Her */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntobtellher","GLOBAL",0) 
InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)
!Global("C#AjantisPCMarriage","GLOBAL",1) // banter shut down if PC is married to Ajantis
!Global("ADAngelMarried","GLOBAL",1) // banter shut down if PC is married to Angelo
OR(2)
Global("c-aranrom","GLOBAL",1)
Global("c-aranrom","GLOBAL",2)
OR(17)
Global("B!KeldornRA","GLOBAL",1) // banter deferred to Keldorn if active
Global("LS#SarevokRomanceActive","GLOBAL",1) 
Global("LS#SarevokRomanceActive","GLOBAL",2)
Global("B!GavRA","GLOBAL",2)
Global("AnomenRomanceActive","GLOBAL",1)
Global("AnomenRomanceActive","GLOBAL",2)
Global("EdwinRomanceActive", "GLOBAL", 1)
Global("EdwinRomanceActive", "GLOBAL", 2)
Global("J#KelseyRomanceActive","GLOBAL",2)
Global("TsujathaRomanceActive","GLOBAL",2)
Global("LS_HaerDalisRomance","GLOBAL",1)
Global("LS_HaerDalisRomance","GLOBAL",2)
Global("ADAngelRomanceActive","GLOBAL",2)
GlobalGT("SolaTalk","GLOBAL",14)
Global("P#KivanRomanceActive","GLOBAL",2)
Global("H#ValygarRomanceActive","GLOBAL",2)
Global("O#XanRomanceActive","GLOBAL",2)~
THEN C-ARN25B c-arantob33b5
@12884 DO ~SetGlobal("c-arntobtellher","GLOBAL",1)~
== BKELDO25 IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @12885 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12832
== BKELDO25 IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @12886 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12887
== BKELDO25 IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @12888 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12889
== BKELDO25 IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @12890 
/* Haer'Dalis, Aeryn */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("LS_HaerDalisRomance","GLOBAL",1)  Global("LS_HaerDalisRomance","GLOBAL",2)~ THEN @12838
/* Angelo, Sister Vigilante */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("ADAngelRomanceActive","GLOBAL",2)~ THEN @12839
/* Sarevok, Aeryn */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("LS#SarevokRomanceActive","GLOBAL",1) Global("LS#SarevokRomanceActive","GLOBAL",2)~ THEN @12840
/* Kelsey, JCompton */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("J#KelseyRomanceActive","GLOBAL",2)~ THEN @12841
/* Tsujatha, Nethrun and Sillara */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("TsujathaRomanceActive","GLOBAL",2)~ THEN @12842
/* Gavin, Berelinde */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("B!GavRA","GLOBAL",2)~ THEN @12843
/* Anomen, BioWare */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("AnomenRomanceActive","GLOBAL",1) Global("AnomenRomanceActive","GLOBAL",2)~ THEN @12844
/* Edwin, Laufey */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Global("EdwinRomanceActive", "GLOBAL", 1) Global("EdwinRomanceActive", "GLOBAL", 2)~ THEN @12845
/* Ajantis, Jastey */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("C#AjantisRomanceActive","GLOBAL",2)~ THEN @12846
/* Solaufein, Weimer */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) GlobalGT("SolaTalk","GLOBAL",14)~ THEN @12847
/* Kivan, Domi  */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("P#KivanRomanceActive","GLOBAL",2) !Global("P#KivanRomanceInactive","GLOBAL",1)~ THEN @12848
/* Valygar, CRomantique, Domi */ 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("H#ValygarRomanceActive","GLOBAL",2)~ THEN @12849
/* Xan: materials without referent cover all pathways without worrying about Xan, Valygar, Bonded, not bonded, etc. */ 
/* summary response */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12850
/* Keldorn Not Romanced Extension */
== BKELDO25 IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID) !Global("B!KeldornRA","GLOBAL",1)~ THEN @12891 
/* Keldorn Romance Extension */
== BKELDO25 IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID) Global("B!KeldornRA","GLOBAL",1)~ THEN @12892
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("B!KeldornRA","GLOBAL",1)~ THEN @12893
== BKELDO25 IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID) Global("B!KeldornRA","GLOBAL",1)~ THEN @12894
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @1996
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12895
== BKELDO25 IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @12896 
EXIT

/* need two variants for bad guys */


/* ToB Banters: Aran > Valygar : Classic Eye of the Beholder */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntob25b","GLOBAL",0) InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID) InParty("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN C-ARN25B c-arantob25b
@12897 DO ~SetGlobal("c-arntob25b","GLOBAL",1)~
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @12898 
/* sideline: PC is magic user */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) !Class("c-aran",MAGE_ALL) !Class("c-aran",SORCERER) OR(2) Class(Player1,MAGE_ALL) Class(Player1,SORCERER)~ THEN @12899
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID) !Class("c-aran",MAGE_ALL) !Class("c-aran",SORCERER) OR(2) Class(Player1,MAGE_ALL) Class(Player1,SORCERER)~ THEN @12900 
/* sideline: PC and Aran are magic users */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Class("c-aran",MAGE_ALL) Class("c-aran",SORCERER) OR(2) Class(Player1,MAGE_ALL) Class(Player1,SORCERER)~ THEN @12901
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID) OR(2) Class("c-aran",MAGE_ALL) Class("c-aran",SORCERER) OR(2) Class(Player1,MAGE_ALL) Class(Player1,SORCERER)~ THEN @12902
/* sideline: Aran is magic user */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(2) Class("c-aran",MAGE_ALL) Class("c-aran",SORCERER) !Class(Player1,MAGE_ALL) !Class(Player1,SORCERER)~ THEN @12903
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID) OR(2) Class("c-aran",MAGE_ALL) Class("c-aran",SORCERER) !Class(Player1,MAGE_ALL) !Class(Player1,SORCERER)~ THEN @12904 
/* moving on... */
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12905
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @12906 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12907
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @12908 
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12909
EXIT

/* ToB Banters: Haer'Dalis > Aran */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntob1b","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) InParty(Myself) !StateCheck(Myself,CD_STATE_NOTVALID)~ THEN BHAERD25 c-arantob1b
@12910 DO ~SetGlobal("c-arntob1b","GLOBAL",1)~
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12911
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @12912
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12913
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @12914
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12915
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @12916
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12917
EXIT

/* ToB Banters: Aran > Haer'Dalis : Stop Writing Fanfic */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntob17b","GLOBAL",0) InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID) InParty("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN C-ARN25B c-arantob17b
@12918 DO ~SetGlobal("c-arntob17b","GLOBAL",1)~
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @12919
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12920
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @12921
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12922
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @12923
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @1997
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12924
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @12925
== C-ARN25B IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN @12926
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @12927
EXIT


/* ToB Banters: Aran > Jaheira Back in The Day : Romanceables */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntob18b","GLOBAL",0) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID) InParty("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) OR(7) InParty("Viconia") InParty("c#ajantis") InParty("Imoen2") InParty("Edwin") InParty("B!Gavin2") InParty("O#Xan") InParty("P#KIVAN")~ THEN C-ARN25B a4263
@12928 DO ~SetGlobal("c-arntob18b","GLOBAL",1)~
== BJAHEI25 @12929
== C-ARN25B @12930
END
IF ~!InParty("Viconia") !InParty("c#ajantis") !InParty("Imoen2") !InParty("Edwin") !InParty("B!Gavin2") !InParty("O#Xan") !InParty("P#KIVAN")~ EXTERN BJAHEI25 a4256
IF ~InParty("Viconia")~ EXTERN C-ARN25B a4258
IF ~InParty("c#ajantis")~ EXTERN C-ARN25B a4255
IF ~InParty("Imoen2")~ EXTERN C-ARN25B a4257
IF ~InParty("Edwin")~ EXTERN C-ARN25B a4259
IF ~InParty("B!Gavin2")~ EXTERN C-ARN25B a4260
IF ~InParty("O#Xan")~ EXTERN C-ARN25B a4261
IF ~InParty("P#KIVAN")~ EXTERN C-ARN25B a4262

CHAIN BJAHEI25 a4256
@12931
== C-ARN25B @12932
== BJAHEI25 @12933
END
IF ~InParty("Jaheira") Global("JaheiraRomanceActive","GLOBAL",2)~ EXTERN C-ARN25B a4264
IF ~InParty("Jaheira") !Global("JaheiraRomanceActive","GLOBAL",2)~ EXTERN C-ARN25B a4265
IF ~InParty("Viconia") OR(2) Global("ViconiaRomanceActive","GLOBAL",1) Global("ViconiaRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4266
IF ~InParty("Viconia") !Global("ViconiaRomanceActive","GLOBAL",1) !Global("ViconiaRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4265
IF ~InParty("c#ajantis") Global("C#AjantisRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4267
IF ~InParty("c#ajantis") !Global("C#AjantisRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4265
IF ~InParty("Imoen2") OR(2) Global("ImoenRomanceActive","GLOBAL",1) Global("ImoenRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4268
IF ~InParty("Imoen2") !Global("ImoenRomanceActive","GLOBAL",1) !Global("ImoenRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4265
IF ~InParty("Edwin") Global("EdwinRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4269
IF ~InParty("Edwin") !Global("EdwinRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4265
IF ~InParty("B!Gavin2") Global("B!GavRA","GLOBAL",2)~ THEN EXTERN C-ARN25B a4270
IF ~InParty("B!Gavin2") !Global("B!GavRA","GLOBAL",2)~ THEN EXTERN C-ARN25B a4265
IF ~InParty("O#Xan") Global("O#XanRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4271
IF ~InParty("O#Xan") !Global("O#XanRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4265
IF ~InParty("P#KIVAN") Global("P#KivanRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4272
IF ~InParty("P#KIVAN") !Global("P#KivanRomanceActive","GLOBAL",2)~ THEN EXTERN C-ARN25B a4265

CHAIN C-ARN25B a4264
@12934
== BJAHEI25 @12935
== C-ARN25B @12936
== BJAHEI25 @12937
EXTERN C-ARN25B a4265

CHAIN C-ARN25B a4267
@12938
== C-ARN25B IF ~Global("C#AjantisPCMarriage","GLOBAL",1)~ THEN @12939
== BJAHEI25 @12940
EXTERN C-ARN25B a4265

CHAIN C-ARN25B a4268
@12941
== BJAHEI25 @12942
EXTERN C-ARN25B a4265

CHAIN C-ARN25B a4266
@12943
== BJAHEI25 @12944
EXTERN C-ARN25B a4265

CHAIN C-ARN25B a4269
@12945
== BJAHEI25 @12946
EXTERN C-ARN25B a4265

CHAIN C-ARN25B a4270
@12947
== BJAHEI25 @12948
EXTERN C-ARN25B a4265

CHAIN C-ARN25B a4271
@12949
== BJAHEI25 @12950
EXTERN C-ARN25B a4265

CHAIN C-ARN25B a4272
@12951
== BJAHEI25 @12952
EXTERN C-ARN25B a4265

CHAIN C-ARN25B a4265
@12953
== C-ARN25B @12954
== BJAHEI25 @12955
EXIT

/* ToB Banters: Aran > Jaheira Back in The Day : Non-Romanceables */
CHAIN IF ~CombatCounter(0) !Detect([ENEMY]) Global("c-arntob18b","GLOBAL",0) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID) InParty("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN C-ARN25B a4273
@12928 DO ~SetGlobal("c-arntob18b","GLOBAL",1)~
== BJAHEI25 @12956
== C-ARN25B IF ~InParty("WLBRAN")~ THEN @12957
== C-ARN25B IF ~InParty("DL#BWN")~ THEN @12957
== C-ARN25B IF ~InParty("Coran")~ THEN @12958
== C-ARN25B IF ~InParty("O#Coran")~ THEN @12959
== C-ARN25B IF ~InParty("M#Eldoth")~ THEN @12960
== C-ARN25B IF ~InParty("Minsc")~ THEN @12961
== C-ARN25B IF ~InParty("QUAYLE")~ THEN @12962
== C-ARN25B IF ~InParty("Sharteel")~ THEN @12963
== C-ARN25B IF ~InParty("shartel")~ THEN @12963
== C-ARN25B IF ~InParty("Skiedv") !InParty("M#Eldoth")~ THEN @12964
== C-ARN25B IF ~InParty("Skiedv") InParty("M#Eldoth")~ THEN @12965
== C-ARN25B IF ~InParty("O#Tiax")~ THEN @12966
== C-ARN25B IF ~InParty("Yesli")~ THEN @12967== C-ARN25B IF ~InParty("CMALORA")~ THEN @12968
== C-ARN25B @12969
EXTERN BJAHEI25 a4256


APPEND PLAYER1

/* I. Player Teases with lots and lots of flirts - from .bcs */

IF ~Global("c-arangoaded","GLOBAL",2) GlobalGT("Chapter","GLOBAL",7)~ THEN BEGIN a3801 /* TOO_MUCH_TEASING */
  SAY @11298
  IF ~~ THEN EXTERN C-ARN25J a4351
END

IF ~Global("c-arangoaded","GLOBAL",5) GlobalGT("Chapter","GLOBAL",7)~ THEN BEGIN a4350 /* TOO_MUCH_TEASING_RETRY */
  SAY @11298
  IF ~~ THEN EXTERN C-ARN25J a3809
END

/* Night Visit from requests or flirts */
IF ~Global("c-arannightvisit","GLOBAL",2) GlobalGT("Chapter","GLOBAL",7)~ THEN BEGIN a3799 /* START_ARAN_PC_BOOTY_CALL */
  SAY @11299 
  ++ @11300 DO ~SetGlobal("c-arannightvisit","GLOBAL",0) SetGlobalTimer("c-aransmalltalk","GLOBAL",300) RealSetGlobalTimer("c-arandreamtalk","GLOBAL",300)~ EXIT
  + ~Global("c-arankisses","GLOBAL",0)~ + @11301 DO ~SetGlobal("c-arannightvisit","GLOBAL",0) SetGlobalTimer("c-aransmalltalk","GLOBAL",300) RealSetGlobalTimer("c-arandreamtalk","GLOBAL",300)~ EXTERN C-ARN25J a4025 /* START_LADY_OF_THE_WARM_LIPS */
  + ~Global("c-arankisses","GLOBAL",1)~ + @11301 DO ~SetGlobal("c-arannightvisit","GLOBAL",0) SetGlobalTimer("c-aransmalltalk","GLOBAL",300) RealSetGlobalTimer("c-arandreamtalk","GLOBAL",300)~ EXTERN C-ARN25J a4028 /* START_MAYHAP_I_GET_A_KISS */
  + ~Global("c-arankisses","GLOBAL",2)~ + @11301 DO ~SetGlobal("c-arannightvisit","GLOBAL",0) SetGlobalTimer("c-aransmalltalk","GLOBAL",300) RealSetGlobalTimer("c-arandreamtalk","GLOBAL",300)~ EXTERN C-ARN25J a4026 /* START_WITH_SHOULDER_PULL */
  + ~Global("c-arankisses","GLOBAL",3)~ + @11301 DO ~SetGlobal("c-arannightvisit","GLOBAL",0) SetGlobalTimer("c-aransmalltalk","GLOBAL",300) RealSetGlobalTimer("c-arandreamtalk","GLOBAL",300)~ EXTERN C-ARN25J a4030 /* START_GIVE_A_LAD_A_CHANCE */
  + ~Global("c-arankisses","GLOBAL",4)~ + @11301 DO ~SetGlobal("c-arannightvisit","GLOBAL",0) SetGlobalTimer("c-aransmalltalk","GLOBAL",300) RealSetGlobalTimer("c-arandreamtalk","GLOBAL",300)~ EXTERN C-ARN25J a4023 /* START_ARAN_CUTS_TO_CHACE_VOCAL */
  + ~Global("c-arankisses","GLOBAL",5)~ + @11301 DO ~SetGlobal("c-arannightvisit","GLOBAL",0) SetGlobalTimer("c-aransmalltalk","GLOBAL",300) RealSetGlobalTimer("c-arandreamtalk","GLOBAL",300)~ EXTERN C-ARN25J a4040 /* START_BEARING_GIFTS */
  + ~Global("c-arankisses","GLOBAL",6)~ + @11301 DO ~SetGlobal("c-arannightvisit","GLOBAL",0) SetGlobalTimer("c-aransmalltalk","GLOBAL",300) RealSetGlobalTimer("c-arandreamtalk","GLOBAL",300)~ EXTERN C-ARN25J a3944 /* START_NINE_HELLS_PC_ACTION */
  + ~Global("c-arankisses","GLOBAL",7)~ + @11301 DO ~SetGlobal("c-arannightvisit","GLOBAL",0) SetGlobalTimer("c-aransmalltalk","GLOBAL",300) RealSetGlobalTimer("c-arandreamtalk","GLOBAL",300)~ EXTERN C-ARN25J a4041 /* START_SUNES_LIPS */
  + ~Global("c-arankisses","GLOBAL",8)~ + @11301 DO ~SetGlobal("c-arannightvisit","GLOBAL",0) SetGlobalTimer("c-aransmalltalk","GLOBAL",300) RealSetGlobalTimer("c-arandreamtalk","GLOBAL",300)~ EXTERN C-ARN25J a4029 /* START_TRY_TO_BE_PHYSICAL */
  + ~GlobalGT("c-arankisses","GLOBAL",8)~ + @11301 DO ~SetGlobal("c-arannightvisit","GLOBAL",0) SetGlobal("c-arankisses","GLOBAL",0) SetGlobalTimer("c-aransmalltalk","GLOBAL",300) RealSetGlobalTimer("c-arandreamtalk","GLOBAL",300)~ EXTERN C-ARN25J a4017 /* START_LIP_EXERCISES */
END

END
