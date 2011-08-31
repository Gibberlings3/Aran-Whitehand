/* ToB Interjections and commentary */

BEGIN C-ARN25A /* pre-joined ToB, just summoned */
BEGIN C-ARN25J  /* joined ToB */
BEGIN C-ARN25B  /* banter ToB */
BEGIN C-ARN25P  /* post-joined ToB */
BEGIN C-ARWRTH  /* wraith creature dialog */

/* Volo's Talk in Saradush */
EXTEND_BOTTOM SARVOLO 9 /* Which of your companions would you like to hear about now? */
IF ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN REPLY ~Tell me about Aran Whitehand.~ DO ~IncrementGlobal("c-aranvolo","GLOBAL",1)~ + a1386
END

CHAIN SARVOLO a1386
~[VOLO] Of all the great warrior poets and scribes to walk the face of Faerun, Aran is the most... unrefined. His swearing has reached legendary status, and sparked theological debates as far as Rasheman. Indeed, it is said that the gods themselves wager on his inventiveness.~
/* 2nd time */
== C-ARN25J IF ~GlobalGT("c-aranvolo","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Denir's Quaint Quill, you done said that already.~
== SARVOLO IF ~GlobalGT("c-aranvolo","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[VOLO] Fill my glass, and perhaps I might be persuaded to change my mind. But probably not. I do have a reputation for independence to maintain, after all.~
/* no romance 1st time */
== C-ARN25J IF ~Global("c-aranvolo","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Mystul's Glass Skull, you make out like every word I say be a blighted swearword.~
== SARVOLO IF ~Global("c-aranvolo","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[VOLO] You of all people should know, dear boy, that a bard relies on exaggeration to better entertain his listeners.~
== C-ARN25J IF ~Global("c-aranvolo","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Well, Mystra's Mantle, that be mite bit o' consolation, I guess. So I don't swear every bloody minute, eh?~
== SARVOLO IF ~Global("c-aranvolo","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[VOLO] That depends. Are you speaking during each minute?~
/* romance 1st time */
== C-ARN25J IF ~Global("c-aranvolo","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Mystul's Glass Skull, no words on me an' th' lady here? Nothin' about dangerous romance, an'...~
== SARVOLO IF ~Global("c-aranvolo","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[VOLO] Ah, the plot thickens! Hold on, do let me get a quill. I sense a great story here...~
== C-ARN25J IF ~Global("c-aranvolo","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Blighted... err... I was makin' it up. Nothin' to discuss, actually. None o' your business, an' all.~
== SARVOLO IF ~Global("c-aranvolo","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[VOLO] Oh, come now, my lad. Such claims would elevate you to legendary status. The Man Who Tamed <CHARNAME>? The humble, ill-mannered sellsword who enticed the most powerful woman on the face of Toril?~
== C-ARN25J IF ~Global("c-aranvolo","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Bloody hells, man, are you tryin' to get me killed? Either that is a glint o' laughter in her eyes, or she's about to kill you or me or both o' us at once. Forget I said anythin', eh? I needs be gettin about findin' a suitable gift to get out o' th' doghouse.~
END
IF ~~ THEN EXTERN SARVOLO 9

/* Fate Spirit Summons: Three options, by user choice - friend,  ex-lover (broken up) , or still in the relationship */
EXTEND_TOP FATESP 6 #5
IF ~!Dead("c-aran") !InMyArea("c-aran") Global("c-aransummoned","GLOBAL",0)~ THEN REPLY ~[PC]Bring me Aran Whitehand, the fighter and scribe.~ DO ~CreateVisualEffect("SPPORTAL",[1999.1218]) Wait(2) CreateCreature("c-aran13",[1999.1218],0) SetGlobal("c-aransummoned","GLOBAL",1)~ GOTO 8
IF ~Gender(Player1,FEMALE) !Dead("c-aran") !InMyArea("c-aran") Global("c-aransummoned","GLOBAL",0)~ THEN REPLY ~[PC]Bring me my former lover, Aran Whitehand.~ DO ~CreateVisualEffect("SPPORTAL",[1999.1218]) Wait(2) CreateCreature("c-aran13",[1999.1218],0) SetGlobal("c-aransummoned","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~ GOTO 8
IF ~Gender(Player1,FEMALE) !Dead("c-aran") !InMyArea("c-aran") Global("c-aransummoned","GLOBAL",0)~ THEN REPLY ~[PC]Bring me my love, Aran Whitehand.~ DO ~CreateVisualEffect("SPPORTAL",[1999.1218]) Wait(2) CreateCreature("c-aran13",[1999.1218],0) SetGlobal("c-aransummoned","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",2)~ GOTO 8
END

/* Joinables */

I_C_T BAERIE25 157 c-arn25bae157 /* It's a boy!  Oh, what a beautiful son we have - look at him wiggle his toes! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] That be a nice sight, there, Aerie. Congratulations. Just watch out where he points that other 'finger', eh? An' I might suggest a bit o' cloth, for when he gets an urge to... heh. Too late.~
END

I_C_T KORGA25J 1 c-arn25korg1 /* Har!  A little pickle tickle with the Sister in the back of the church, eh?  Ye know what they say... nun is better!  HAR! HAR! HAR! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Ilmater's Mercy, shut up, Korgan. We don't be wantin' to offend th' nice priestess what can help us, now, do we, laddie?~
== KORGA25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[KORGAN] You never did have any humor, jackass. You can kiss my arse.~
END

I_C_T NALIA25J 0 c-arn25nalj0 /* I applaud her efforts.  It's the duty and privilege of us of the upper classes to aid the less fortunate by taking them under our protection. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Well, there be my standin' offer for you to take me under anythin' you want, eh?~
== NALIA25J IF ~Global("c-silencearan","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[NALIA] Hey, keep your hands to yourself!~
END

I_C_T SAREV25J 8 c-arn25sarv8 /* <CHARNAME>, I can tell just by looking at the defenses of that stronghold that a direct assault would be pointless. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] An' by pointless, he means that there'd be lots o' blood, some screamin', an' unfortunately none o' it would be theirs. That whole curtain wall, there, that be...~
== SAREV25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[SAREVOK] ...~
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Right. What he said. Shuttin' up.~
END

/* Non-Joinables */
I_C_T 25SPELL 1 c-arn25sp1 /* Can I interest you in my wares?  I've got a collection of scrolls most mages would die for! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] I'd be a mite more interested in what you have in th' way o' quills, myself.~
END

I_C_T 25SPELL 8 c-arn25sp8 /* I would normally invite you to look at my magical wares, but alas my shelves are completely bare.  I have not even a single parchment left for you to purchase. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Grumbar's Glands. I needed some good parchment to restock, an' mayhap some ingredients for ink, too.~
END

I_C_T 25SPELL 22 c-arn25sp22 /* Have you made the exchange with Hectan yet?  Have you recovered my spellbook? */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) !PartyHasItem("PLOT18B") InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Bloody one-track mind, <CHARNAME>. I done had those feelin's myself, when I couldn't find naught for supplies. Until we find that blighted spellbook o' his, two gold says he's not goin' to talk about anythin' else.~
END

I_C_T ABAZIGAL 0 c-arn25abaz /* Welcome.  I have watched your progress with great interest.  For a lesser creature you are quite amusing. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Do all you wyrms get together an' swap notes? Seems like all o' you have been watchin' us all in great amusement. Hells, you could get more fun out o' a night in a Calishite harem an' be done wi' it, eh?~
END

I_C_T AMARCH02 2 c-arn25ama2 /* I can't be wasting my time yapping with some slack jawed yokel. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Oi! I resemble that remark!~
END

I_C_T AMBAR01 9 c-arn25amb9 /* The order ignores us.  They apply restrictions on the smugglers and have even killed some, restricting the supplies the village can be brought.  And then there are all the mercenaries... */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] We mercenaries prefer th' term 'sellswords', or 'bastards what can kill things for coin', or just plain 'sir'.~
END

I_C_T AMBAR01 16 c-arn25amb16 /* I have heard tales of great wars and destruction in the lands beyond the desert, and while the order has never involved itself in such things before, it seems Balthazar has changed things.  He plans a war...a great and terrible war... but I do not know against whom. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Ten tradebars an' a bottle o' D'Tranion Ale says he isn't buildin' all this up for a takeover o' Tethyr. Monks usually be more subtle than that.~
END

I_C_T AMBOY01 3 c-arn25amb01/* If I had a sword, Balthazar would pay me to join his army! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Cyric's Bloody Breath, boyo... don't be wishin' for that life. Go learn an honest trade, like bartender. Or blacksmith. Th' hours are better, an' th' ladies like a man what has solid, steady work.~
END

I_C_T2 AMELM01 7 c-arn25amel7 /* I have to leave again, soon, so I can't help you much.  But I can help you a little, whether you like it or not.  It's important that this all ends, soon, but that doesn't mean I won't lift a finger over it. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] I think they should change th' motto o' th' Harpers to 'Enigmatic Information Given, Lives Screwed'. Either that, or 'What, I Didn't Mention There Would Be Dragons?'.~
END

I_C_T AMLICH01 20 c-arn25lich /* You... you have killed Marlowe?!  Now I shall never collect what he owed to me, fool!  You may be powerful, but I shall strike you down!  To me, undead ones!  Kill the godling!! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] The problem wi' undead liches is that they are so bloody predictable. O' course, the other problem is they are tough to kill, on account o' they be dead already.~
== AMLICH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[LICH] We shall start the killings with the mouthy one!~
END

I_C_T AMLICH01 21 c-arn25lich /* So... the one with great power that I sensed has arrived at last.  How I... looked forward to tasting your soul, little godling.  You are powerful, yes... but it is a risk I shall take!! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] The problem wi' undead liches is that they are so bloody predictable. O' course, the other problem is they are tough to kill, on account o' they are already dead.~
== AMLICH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[LICH] We shall start the killings with the mouthy one!~
END

I_C_T AMLICH01 22 c-arn25lich /* I shall wait no longer for our business to be done, godling!  I hunger for your soul, and I shall have it!!  Despite your power, I shall take it!! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] The problem wi' undead liches is that they are so bloody predictable. O' course, the other problem is they are tough to kill, on account o' they are already dead.~
== AMLICH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[LICH] We shall start the killings with the mouthy one!~
END

I_C_T AMLICH01 28 c-arn25lich /* Hissssss!!  Then you shall die!!  Then you shall all die!! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] The problem wi' undead liches is that they are so bloody predictable. O' course, the other problem is they are tough to kill, on account o' they are already dead.~
== AMLICH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[LICH] We shall start the killings with the mouthy one!~
END

I_C_T AMLICH01 32 c-arn25lich /* Ah, yes.  That was not part of our bargain, was it?  I should have suspected as much.  So be it, godling... but you shall not find me a simple target!! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] The problem wi' undead liches is that they are so bloody predictable. O' course, the other problem is they are tough to kill, on account o' they are already dead.~
== AMLICH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[LICH] We shall start the killings with the mouthy one!~
END

I_C_T AMMAYOR 5 c-arn25mayor5 /* My daughter is a compassionate woman, but young and impulsive.  She foolishly stole money from these mercenaries to ease the suffering of the starving children of our town. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Corellon's Bowhand, tell me she did not. There be mercenary companies where th' whole town would be slaughtered, just to make a point. Hells, even th' 'Fist would hang a thief what's been caught in th' act.~
END

I_C_T AMSAEMON 3 c-arn25saem3 /* Your arrival is a happy coincidence, given the situation.  You can actually solve my dispute with these rather upset gentlemen. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Well, now, I be thinkin' we'd rather help these upset gentlemen take you apart, piece by piece, real slow-like.~
END

I_C_T AMSAEMON 6 c-arn25saem6 /* I guess <CHARNAME> isn't going to cooperate.  I'm afraid this can only end in violence. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] I'd say it might end wi' your head makin' th' sound a ripe melon makes when it's been dropped from th' top o' a watchtower.~
END

I_C_T2 AMTGEN01 1 c-arn25gen1 /* You are a spawn of Bhaal and responsible for the destruction of the city of Saradush.  Your execution has been ordered, <CHARNAME>.  May the gods have mercy on your soul. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Torm's Left Testicle. Now we be fightin' whole armies. I hope there be a raise in pay comin' soon, eh?~
END

I_C_T BALTH 22 c-arn25balth22 /* My plan is much more altruistic.  I have vowed to exterminate all of Bhaal's children, forever wiping the Realms clean of his tainted existence.  You have merely helped me in my goal. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Bloody hells. Either you be mad, or you be th' most driven individual I ever done met.~
END

I_C_T2 BAZDRA01 1 c-arn25dr1 /* No... I see I am wrong.  You are not brothers of the tattooed one.  *sniff*  I smell the taint of Bhaal on you. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Is that what that smell is? An' here I thought I'd just spiced up th' curry too much.~
END

I_C_T BAZDRA03 1 c-arn25dr03 /* On your knees before you enter the presence of Abazigal!  Bow before his ruthless might! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Wyrms. Th' gods have no sense o' imagination. No giant toadstools barrin' our paths, no huge grasshoppers, just th' same ol' three... Liches, Vampires, an' Dragons, oh my. Just once, I'd like to see a giant cup o' tea barrin' th' path, wi' a side o' toast.~
END

I_C_T BAZDRA03 2 c-arn25dr03 /* The cavern echoes with the voice of the dragon, though the words seem somewhat forced and unnatural: */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Wyrms. Th' gods have no sense o' imagination. No giant toadstools barrin' our paths, no huge grasshoppers, just th' same ol' three... Liches, Vampires, on Dragons, oh my. Just once, I'd like to see a giant cup o' tea barrin' th' path, wi' a side o' toast.~
END

I_C_T BAZDRA03 13 c-arn25dr03 /* You have the stench of the Bhaalspawn... the same stench as Abazigal, though he tries to hide it behind the more palatable scent of his wyrm-kind heritage. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Wyrms. Th' gods have no sense o' imagination. No giant toadstools barrin' our paths, no huge grasshoppers, just th' same ol' three... Liches, Vampires, on Dragons, oh my. Just once, I'd like to see a giant cup o' tea barrin' th' path, wi' a side o' toast.~
END

I_C_T BAZEYE01 0 c-arn25beh0 /* You there! Intruder type! Why do you pester Lord Abazigal's most favored servant? */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Every time we turn around, there be another layer o' servants. I gotta get me some o' them. Spruce a place up, they do.~
END

I_C_T  BAZMONK 9 c-arn25bzm9 /* There is something else. *cough*  Something you must do before you can face Abazigal.  The entrance to Abazigal's inner sanctum is protected by a dragon. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] O'course it is. You sure there be no liches? What about a bloodsuckin' vampiric dragon-lich? We wouldn't want to make this easier, eh?~
END

I_C_T2 BOTSMITH 152 c-arn25cen /* Ummm... Cespenar only serve the great one.  You'se nice, maybe, but you'se still a nobody. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) Name("c-aran",LastTalkedToBy) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] You bloody well sound like that lass I was tryin' to spark with back when I was in Calimport.~
END

I_C_T2 BOTSMITH 152 c-arn25cen /* Ummm... Cespenar only serve the great one.  You'se nice, maybe, but you'se still a nobody. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) Name("c-aran",LastTalkedToBy) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] You bloody well sound like that lass I was tryin' to spark with back when I was in Calimport. Err... that was a mite o' time before I met you, <CHARNAME>.~
END

I_C_T FINMEL01 4 c-arn25finm /* I am disappointed in you, <CHARNAME>.  So much bluster, so much force.  How you have managed to blunder your way through the realms and not perished sooner, I have no idea. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Now, to be fair, <PRO_HESHE> had a mite bit o' help, eh? Speakin' for myself, I'm not always th' sharpest tack in th' toolshed, but I get th' job done.~
END

I_C_T2 FINSOL01 27 c-arn25endrom /* The choice is difficult, but these are your two options, Bhaalspawn.  This is where your destiny is realized, and your future begins. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Go on, <CHARNAME>, don't hesitate, on either path. At least not on account o' me. You done become a goddess in my heart a long, long time ago.~
END

I_C_T2 FINSOL01 27 c-arn25endnorome /* The choice is difficult, but these are your two options, Bhaalspawn.  This is where your destiny is realized, and your future begins. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Alignment(Player1,MASK_EVIL)~ THEN ~[ARAN] You know, I think I told you once, I swear by plenty o' gods, <CHARNAME>. I done served you well, but I beg you, let some other poor bastard get stuck bein' a god. We could go take over Tethyr, or kick th' Caliphs out o' Calimshaw.~
END

I_C_T2 FINSOL01 27 c-arn25endnoromg /* The choice is difficult, but these are your two options, Bhaalspawn.  This is where your destiny is realized, and your future begins. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) !Alignment(Player1,MASK_EVIL)~ THEN ~[ARAN] You know, I think I told you once, I swear by plenty o' gods, <CHARNAME>. But I got more faith that you will prevail than in th' entire pantheon. If you leave it to me, I'll choose to back your play, no matter what you be choosin'.~
END

I_C_T2 FINSOL01 27 c-arn25endbaby /* The choice is difficult, but these are your two options, Bhaalspawn.  This is where your destiny is realized, and your future begins. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) Global("AerieHadBaby","GLOBAL",1) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] I be not the most polished knight, but I have been right loyal to you. Whatever you decide, your son has my sword pledged to his cause, for good or ill.~
END

I_C_T GROMG02 3 c-arn25sarg /* Slay the invaders!  Attack! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] What, no foreplay?~
== GROMG02 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[GUARD] Sound the alarm!~
END

I_C_T HGNYA01 2 c-arn25nya /* Why, the Nyalee is I!  The Witch of the Glade, I is called, and for good reason, it is!  But questions...you have so many questions, know I! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] A witch? Will she turn me into a newyt?~
END

I_C_T HGNYA01 3 c-arn25nya /* Nyalee survives very well, she does, and Nyalee is I!  The Witch of the Glade, they calls me, hee hee!  But so many questions you have! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Just one. Why in th' nine hells are all you witches messed up in th' head?~
END

I_C_T HGNYA01 4 c-arn25nya /* You should know, spawn-child, you should know!  Nyalee served the dead master, once, and Nyalee is I!  Hee hee!  But so many questions you have, questions questions! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Nyalee is I  - nope, accordin' to <CHARNAME>, here, that should be 'I am Nyalee'. See, I done listened to all that teachin' you keep pushin' on me.~
END

I_C_T HGNYA01 5 c-arn25nya /* Tricks, yes!  Nyalee knows many tricks!  Witch of the Glade, they calls me, for many good reasons.  Hee hee!  But so many questions you have! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Somehow, I doubt there be any good in those reasons, eh, on account o' th' whole servin' evil thing.~
END

I_C_T MARLOWE 16 c-arn25marl /* As I said before, my name is Marlowe... I hail from Calimshan to the south, where I was a merchant.  A successful one.  I... suppose that is where I first came into contact with Vongoethe. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] To be a successful merchant in Calimshan, that takes a bit o' ruthlessness, a bit o' magic, an' a large amount o' coin.~
== MARLOWE IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[MARLOWE] It took all of that, and some... assistance.~
END

I_C_T MELISS01 11 c-arn25mel11 /* Getting rid of one of the Five without it looking like my doing was one thing...but with you already in Saradush, I could turn you on Yaga-Shura as well.  After I let him into Saradush to kill the other Bhaalspawn, of course. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Now, you be slippery little bitch, eh? Right smart. Waste o' a nice lookin' body, too, when we have to carve it all up into pieces, eh?~
END

I_C_T2 SARBOY01 1 c-arn25sboy /* Gromnir has a big army.  When I grow up I want a big army. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Don't we all, boyo, don't we all. It would come in right handy for us right about now.~
END

I_C_T SARBUL04 3 c-arn25bulf /* (needs passback)  Guess it's time to remind everyone who's in charge around here! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Now, there, lad... back wi' th' Fist, we didn't take kindly to...~
== SARBUL04 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[MERCENARY] The Flaming Fist are weak-bellied buttock-licking camp followers.~
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Tsk, tsk. Such language. Burn's a lad's ears, it does. Suit yourself.~
== SARBUL04 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[MERCENARY] Attack!~
END

I_C_T SARKIS01 7 c-arn25kisconf /* My utilization of complex locution is more a reflection of my own superincumbent mental acuity than an aspersion on your circumscribed lexicon. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Chauntea's Basket - what in th' nine hells did he just say?~
END

I_C_T SARMEL01 17 c-arn25srm17 /* The actions of Gromnir and his soldiers have caused dissension within the town, and made it almost impossible for the loyal Saradush militia to defend the walls.  We must first defeat the enemy within before we can end this siege. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Politics. Even durin' a crisis, no one pulls together. Ilmater's Mercy, <CHARNAME>, there be times when I think you should just start takin' over th' world. At least then we'd know where we all stood, eh?~
END

I_C_T SARWAI01 1 c-arn25wgg /* I wish someone would stand up to them... but everyone's afraid of Gromnir.  *sniff*  I guess I'll just have to put up with it. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) !Alignment(Player1,MASK_EVIL)~ THEN ~[ARAN] Torm's Breath! There be limits to havin' fun wi' th' help. Mayhap we see how they like a little o' turnabout, eh?~
END

I_C_T SARWAI01 1 c-arn25wgg /* I wish someone would stand up to them... but everyone's afraid of Gromnir.  *sniff*  I guess I'll just have to put up with it. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Alignment(Player1,MASK_EVIL)~ THEN ~[ARAN] Torm's Breath! I know, I know, might makes right. I'll shut my mouth an' go stand in th' corner like a good little sellsword. But if it were up to me, I'd show 'em some right strong might, myself.~
END

I_C_T YAGCON 12 c-arn25ygcon12 /* I wanted to become part of his unstoppable war machine, to revel in the slaughter, to have my blade drip with the blood of all those Yaga Shura crushed beneath his mighty boot! ~ */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Bloody hells, girl, you be in serious need o' a drink. You seem to have a mite too much energy. Make that several drinks.~
END

I_C_T YAGCON 18 c-arn25ygcon18 /* I have heard mention of a name from Yaga Shura's past - Nyalee, an old crone who lives in the marshes of the Mir Forests.  She may know Yaga Shura's secrets. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) !Alignment(Player1,MASK_EVIL)~ THEN ~[ARAN] Now if I had a trade bar for every evil creature what confided in an old crone in th' wilds, I'd be a rich man. Good thing you don't rightly need one, <CHARNAME>.~
END

I_C_T YAGCON 18 c-arn25ygcon18 /* I have heard mention of a name from Yaga Shura's past - Nyalee, an old crone who lives in the marshes of the Mir Forests.  She may know Yaga Shura's secrets. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Alignment(Player1,MASK_EVIL)~ THEN ~[ARAN] Now if I had a trade bar for every evil creature what did that, I'd be a rich man. Speakin' o' that, where be your old crone confidant, <CHARNAME>?~
END

I_C_T SARMEL01 49 c-arn25mls49 /* I can show you where that glade is... but it is only speculation.  The key to the giant's invulnerability might lay there, but it might not.  There may be nothing there at all. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Given our bloody luck, there'd be a might more'n nothin'. More like a whole pile o' trouble.~
== SARMEL01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[MELISSAN] I wish that I had a better answer for you.~
END

I_C_T SARMEL01 16 c-arn25mls16 /* But Gromnir is mad.  He has barricaded himself in the castle throne room, and his troops run amok through the town with no regard for the lives and rights of the citizens of Saradush. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Been there, eh? Not a pretty sight. No control, an' a bit o' trouble spirals into murder, rape, an' worse.~
== SARMEL01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[MELISSAN] You say that as if there could be worse.~
END

I_C_T SARMEL01 80 c-arn25mls80 /* He runs a monastic order in a remote village in the Calim Desert...it will serve to both hide you from retribution as well as serve as a base from which you can attack the enclaves of Abazigal and Sendai. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Monks. Well, I done fought alongside some. Might be a base o' operations after all.~
END

I_C_T SARPROVF 6 c-arn25prvf6 /* I am not interested in you... I wish only to speak with the leader of your group. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Sune's Bouncin' Breasts, <CHARNAME> gets all the fun.~
END

I_C_T SARPROVF 0 c-arn25prvf0 /* You look like a mighty fine piece of man-meat.  Why don't we slip away alone?  I promise a night you'll remember for the rest of your life.  Only fifty gold coins. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Shar's Silvery Strands, fifty gold? A trained wench in Calimport only costs 5 gold, an' is happy to do anythin' anyone could ever dream up. What do you get for fifty gold?~
== SARPROVF IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[PROSTIVAMP] More than you could possibly imagine.~
END

I_C_T SARTHF2 0 c-arn25bth /* What do you want?  You think you can hassle me just because I'm a kid? */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] You got quick eyes, an' big ears, eh? Might be you could profit by usin' em instead o' that smart mouth o' yours.~
END

I_C_T SENDAI 15 c-arn25sd15 /* NO!  NO!  My Bhaal essence is ripped from my very soul!  Damn you!  But I may yet rob you of the glory of your victory. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Th' only good Drow be a dead Drow, eh? Kiss Shar's arse for me.~
== SENDAI IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[SENDAI] I spit on you.~
END

I_C_T SENGUA01 4 c-arn25sgd4 /* Could have been my imagination, though.  I ain't never seen elves with black skin before.  And they were only there for a second before they vanished. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Ilmater's Bloody Hands, that sounds like Drow-bastards. Did they be carryin' crossbows?~
== SENGUA01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[WOODCUTTER] I didn't see.~
END

I_C_T SENBEH01 10 c-arn25behdr10 /* Well, yes.  Can't say I cared overmuch for that, although you *did* release me from one of the most boring tasks in Creation.  Can't keep a good beholder down, I guess, eh?  Heh heh. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Cyric's Balls. Never did see th' day when one o' you one-eyed wonders was a right good sort.~
== SENBEH01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[FUNBEHOLDER] Don't let it get around. I have a long memory, and a great work ethic. Wouldn't want to have to hunt you down, you know.~
END

I_C_T SARELF01 2 c-arn25srelf /* We have nowhere to stay... we have no choice but to wander the streets.  I fear we will soon run afoul of Gromnir's men once more. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] My mother always told me never miss a good chance to shut up... but then again I'm not rightly one to follow advice. I hate to leave folks to fate, but we don't have enough supplies to run a refuge, eh?~
== SARELF01 IF ~Global("c-silencearan","GLOBAL",0) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ELFLEADER] We would not ask such a thing.~
END

/* ToB Version, Watcher's Keep */
I_C_T FSDRAGON 0 c-arn25dra0 /* I am the fearsome death that awaits those that would break the seal. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Helm's Hard Horn, that there be truth in advertisin', eh? Where do they spawn all these bastards, is what I want to know. On account' o' I never, never want to go there.~
== FSDRAGON IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[FSDRAGON] Turn back now.~
END

I_C_T FSSPIR2 1 c-arn25spi1 /* I am the Keeper of the Key, the One Left Behind.  Duty compels me to remain, to stand guard over one of the keys to the final seal. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Whatever Guild you belong to, I'd be havin' a talk wi' your representative, eh? You done got th' worst assignment I can think of, short o'cleanin' up ogre pens in a circus.~
== FSSPIR2 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[GHOST] Helm is Duty. I serve Helm.~
END

I_C_T GORAPP1 6 c-arn25ap6 /* Odren intended it be thee to sacrifice thy life, rather than make his own sacrifice willingly.  He also failed to tell thee the scope of the evil that lies within...the Imprisoned One is Demogorgon, Prince of Demons. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Melikki's Mithral Mane, that slippery bastard be havin' us walkin' into a trap?~
== GORAPP1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[GORAPP1] Yes.~
END

I_C_T GORDEMO 1 c-arn25pod1 /* You do not see anything physical within the chamber...but you feel its presence all around you.  A phantasmal hand brushes your cheek, a curious gesture that startles you and is gone just as quickly. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Bloody hells... what was that? Felt like someone just walked on my grave.~
END

I_C_T GORMAD1 1 c-arn25yak1 /* Yakman talk talk talk all the time, he was told... Talkative Yakman!  Once came with party, all looking for treasure, Yakman talk talk talk all the time.  Now they are all dead and only Yakman left, lost lost.  Lonely Yakman! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Riiiiight. Now I know what you mean when you say I talk too blighted much, eh?~
== GORMAD1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[GORMAD1] Talk, talk, talk, talk, talk!~
END

I_C_T GORMAD1 34 c-arn25tm34 /* 'Yakman'?  That...that was that ridiculous nickname that atrocious little halfling kept calling me.  My name is Tamorlin.  Wh...where is my party?  Where am I? */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Well, by my reckonin', about a tenday's walk from th' left armpit o' th' universe.~
== GORMAD1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[GORMAD1] What do you mean?~
END

I_C_T GORODR1 2 c-arn25od2 /* norom - Greetings to you, my friend.  I believe I have heard of you...you are <GABBER>, one of the companions of the Child of Bhaal.  Please, I must speak to <PRO_HIMHER>! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Hey - I be almost famous!~
== GORODR1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) !Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[GORODR1] Could you introduce me to <PRO-HIMHER>? I have pressing business with the Child of Bhaal.~
END

I_C_T GORODR1 2 c-arn25od2 /* rom - Greetings to you, my friend.  I believe I have heard of you...you are <GABBER>, one of the companions of the Child of Bhaal.  Please, I must speak to <PRO_HIMHER>! */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Hey, I be th' almost famous companion o' <CHARNAME>! Well, I guess it be better than 'you there - the disposable bedwarmer'.~
== GORODR1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) Global("c-aranrom","GLOBAL",2) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[GORODR1] Could you introduce me to <PRO-HIMHER>? I have pressing business with the Child of Bhaal.~
END

I_C_T GORODR1 10 c-arn25od10 /* The old prison would not hold this great evil for long, He said.  Our order would have to maintain a vigil, to watch for the day when the evil would begin to break the great seals and escape. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] I done heard an officer once say that evil always wins, unless good be very, very careful.~
== GORODR1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[GORODR1] The Vigilant One agrees with this assessment.~
END

I_C_T GORODR1 50 c-arn25od50 /* You knew not what you did, <GABBER>, so your foolishness can be forgiven, I am sure.  Farewell to you. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Hey, Odren - stick it up your arse, an' twist.~
== GORODR1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[GORODR1] May Helm grant you wisdom. Or may He at least grant us your silence.~
END

I_C_T GORODR1 53 c-arn25od53 /* The Imprisoned One is none other than Demogorgon, Prince of Demons.  We did not think he could... be defeated... and so we sought someone else to take our place and seal the demon within the Keep. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] Th' Prince o'... hey, Odren, you ever think o' workin' for th' Zhents? I would swear that level o' manipulation smacked o' th' Black Tower.~
END

I_C_T GORPRI1 2 c-arn25pipe /* (needs passback) I apologize for my... undeserved reaction.  I will take my slippers and let you finish your work here. Look through the sarcophagus if you wish. */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] I done thought bein' undead might be a rough contract, what with all th' long downtime an' all. But with slippers, a pipe, a nice fire, an' mayhap a dog to fetch an' carry, it sounds pretty decent, eh? If you can get over th' whole bein' dead thing.~
== GORPRI1 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[GORPRI1] It has its own rewards, that is true.~
END

I_C_T GORSUC01 0 c-arn25suc0 /* Ahhh, look here, dear ladies.  Yet another hapless wanderer, drifting through these endless portals.  Is it lost, do you think?  Shall we ask it? */
== C-ARN25J IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[ARAN] ... eyes up front, not on th' curves - eyes up front, not on th' curves - ...~
== GORSUC01 IF ~Global("c-silencearan","GLOBAL",0) GlobalGT("Chapter","GLOBAL",7) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ THEN ~[GORSUC01] We should definitely ask it.~
END

/* ToB C-ARN25B additions */

CHAIN
IF ~CombatCounter(0) !Detect([ENEMY]) InParty("Aerie") See("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID) InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID) Global("AerieRomanceActive","GLOBAL",2)
Global("c-aransuspicious","GLOBAL",0) Global("AerieHadBaby","GLOBAL",0) Global("babytalk","GLOBAL",1)~ THEN C-ARN25B a3004
~[ARAN] Hey, you look right happy, you do. Why so chipper?~
DO ~SetGlobal("c-aransuspicious","GLOBAL",1)~
== BAERIE25 ~[AERIE] No particular reason.~
== C-ARN25B ~[ARAN] Oh, come on now, you can tell an old friend. Between you an' me, your usual attitude is a fair bit south o' worried, wi' a slight spice o' sad. Things started improvin' when you finally got it in your head that <CHARNAME> were th' best thing that ever happened to you, but now, look at you. You even eat!~
== BAERIE25 ~[AERIE] I'm just happy, that is all.~
== C-ARN25B ~[ARAN] Happy? You look positively beamin'. An' let me tell you, it looks a might bit fairer than th' usual keen sense o' dispair you sometimes projected, back in th' day. Let me guess. He proposed to you.~
== BAERIE25 ~[AERIE] The Avariel do not have all these rituals, Aran.~
== C-ARN25B ~[ARAN] Blighted hells, girl, <CHARNAME> must o' proposed to you in secret, an' that be why you are so happy! Well, good wishes an' a long life to both o' you. Just tell me when th' weddin' be, an' I will be there.~
== BAERIE25 ~[AERIE] (sigh) I don't think you are hearing me, or listening...~
== C-ARN25B ~[ARAN] What, I be good enough to watch your back on th' trail, but not good enough for attendin' th' weddin'? That don't rightly sound like you.~
== BAERIE25 ~[AERIE] Absolutely, Aran. If we have a formal wedding, you will be invited.~
== C-ARN25B ~[ARAN] Oh, right... mum's th' word, 'til th' banns be announced. Now, I got me a mite bit o' research to do, on account o' I need to find a gift. Do you two be allergic to any particular foods or such?~
EXIT

/* ToB C-ARN25J additions */

APPEND C-ARN25J

/* In Watcher's Keep, ToB  - both C-ARANJ and C-ARN25J triggered from Global("c-aranwatchkeep","GLOBAL",1) and closed to 2 in dlg */

IF ~Global("c-aranwatchkeep","GLOBAL",1)~ THEN BEGIN a973
 SAY ~[ARAN] I don't rightly think this were a good idea, <CHARNAME>.~ [c-aws114]
 ++ ~[PC] Well, that is great to know, Aran. But I make the decisions.~ DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a974
 ++ ~[PC] What is the problem?.~ DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a975
 + ~Class("c-aran",THIEF_ALL)~ + ~[PC] Look, you are good at getting information. Rather than complaining about the task, why not go find out what traps await us?~ DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a976
 + ~Class("c-aran",MAGE_ALL)~ + ~[PC] You did memorize a divination spell or two, right? Rather than complaining about the task, why not get your magical energies flowing.~ DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a977
 + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] A prayer or two, perhaps a Chant or Bless might be a good idea. I would rather have you helping than worrying.~ DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a978
 + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] There is nothing here your weapons will not take care of quickly, Aran. The troubles will be far deeper than the first level, I am sure.~ DO ~SetGlobal("c-aranwatchkeep","GLOBAL",2)~ + a979
END

IF ~~ a974
 SAY ~[ARAN] I know that. I just be thinkin' we have enough troubles wi' out messin' with a great big stone cairn filled wi' unspeakable evil. We have already done that a few times, eh?~
 ++ ~[PC] I did not have us take this task lightly. This could provide us with advantages we need later on in our travels.~ + a982
 ++ ~[PC] Do not worry, Aran. We have prevailed so far. We will be laughing about this later on.~ + a981
 ++ ~[PC] As I recall, there was a good bit of you running around yelling 'Kill it! Kill it! Cyric's Blood, kill it now!', while screaming like a little girl..~ + a980
 + ~Class(Player1,THIEF_ALL)~ + ~[PC] Look, I am good at getting information. Rather than complaining about the task, I think I will go find out what traps await us.~ + a980
 + ~Class(Player1,MAGE_ALL)~ + ~[PC] I have a divination spell or two up my sleeve. Rather than complaining about the task, I think I will get my magical energies flowing.~ + a980
 + ~Class(Player1,CLERIC_ALL)~ + ~[PC] A prayer or two, perhaps a Chant or Bless might be a good idea. I will let you do all of the silly worrying by yourself.~ + a980
 + ~Class(Player1,FIGHTER_ALL)~ + ~[PC] The troubles will be far deeper than the first level, I am sure. But if we keep a watchful eye, this adventure could be very useful to us. Or have you lost your courage?~ + a980
END

IF ~~ a975
 SAY ~[ARAN] Oh, no problem, exactly. Except we seem to be traipsin' about, messin' with a great big stone cairn filled wi' unspeakable evil. We have already done that a few times, eh?~
 ++ ~[PC] I did not have us take this task lightly. This could provide us with advantages we need later on in our travels.~ + a982
 ++ ~[PC] Do not worry, Aran. We have prevailed so far. We will be laughing about this later on.~ + a981
 ++ ~[PC] As I recall, there was a good bit of you running around yelling 'Kill it! Kill it! Cyric's Blood, kill it now!', while screaming like a little girl..~ + a980
 + ~Class(Player1,THIEF_ALL)~ + ~[PC] Look, I am good at getting information. Rather than complaining about the task, I think I will go find out what traps await us.~ + a980
 + ~Class(Player1,MAGE_ALL)~ + ~[PC] I have a divination spell or two up my sleeve. Rather than complaining about the task, I think I will get my magical energies flowing.~ + a980
 + ~Class(Player1,CLERIC_ALL)~ + ~[PC] A prayer or two, perhaps a Chant or Bless might be a good idea. I will let you do all of the silly worrying by yourself.~ + a980
 + ~Class(Player1,FIGHTER_ALL)~ + ~[PC] The troubles will be far deeper than the first level, I am sure. But if we keep a watchful eye, this adventure could be very useful to us. Or have you lost your courage?~ + a980
END

IF ~~ a976
  SAY ~[ARAN] I might just do that. But I'm not sure about messin' with a great big stone cairn filled wi' unspeakable evil. We have already done that a few times, eh?~
  ++ ~[PC] Do not worry, Aran. We have prevailed so far. We will be laughing about this later on.~ + a981
  ++ ~[PC] I did not have us take this task lightly. This could provide us with advantages we need later on in our travels.~ + a982
  ++ ~[PC] As I recall, there was a good bit of you running around yelling 'Kill it! Kill it! Cyric's Blood, kill it now!', while screaming like a little girl..~ + a980
  + ~Class(Player1,THIEF_ALL)~ + ~[PC] Would you rather I do it, Aran? I mean, if you think you need the help...~ + a980
  + ~Class(Player2,THIEF_ALL) !Name("c-aran",Player2)~ + ~[PC] Would you rather <PLAYER2> do it, Aran? I mean, if you think you need the help...~ + a980
  + ~Class(Player3,THIEF_ALL) !Name("c-aran",Player3)~ + ~[PC] Would you rather <PLAYER3> do it, Aran? I mean, if you think you need the help...~ + a980
  + ~Class(Player4,THIEF_ALL) !Name("c-aran",Player4)~ + ~[PC] Would you rather <PLAYER4> do it, Aran? I mean, if you think you need the help...~ + a980
  + ~Class(Player5,THIEF_ALL) !Name("c-aran",Player5)~ + ~[PC] Would you rather <PLAYER5> do it, Aran? I mean, if you think you need the help...~ + a980
  + ~Class(Player6,THIEF_ALL) !Name("c-aran",Player6)~ + ~[PC] Would you rather <PLAYER6> do it, Aran? I mean, if you think you need the help...~ + a980
END

IF ~~ a977
 SAY ~[ARAN] I can get th' energies flowin' right fine. I just am a mite worried about messin' with a great big stone cairn filled wi' unspeakable evil. We have already done that a few times, eh?~
 ++ ~[PC] Do not worry, Aran. We have prevailed so far. We will be laughing about this later on.~ + a981
 ++ ~[PC] I did not have us take this task lightly. This could provide us with advantages we need later on in our travels.~ + a982
 ++ ~[PC] As I recall, there was a good bit of you running around yelling 'Kill it! Kill it! Cyric's Blood, kill it now!', while screaming like a little girl..~ + a980
 + ~Class(Player1,MAGE_ALL)~ + ~[PC] Would you rather I cast some preparatory spells, Aran? I mean, if you think you need the help...~ + a980
 + ~Class(Player2,MAGE_ALL) !Name("c-aran",Player2)~ + ~[PC] Would you rather <PLAYER2> do it, Aran? I mean, if you think you need the help...~ + a980
 + ~Class(Player3,MAGE_ALL) !Name("c-aran",Player3)~ + ~[PC] Would you rather <PLAYER3> do it, Aran? I mean, if you think you need the help...~ + a980
 + ~Class(Player4,MAGE_ALL) !Name("c-aran",Player4)~ + ~[PC] Would you rather <PLAYER4> do it, Aran? I mean, if you think you need the help...~ + a980
 + ~Class(Player5,MAGE_ALL) !Name("c-aran",Player5)~ + ~[PC] Would you rather <PLAYER5> do it, Aran? I mean, if you think you need the help...~ + a980
 + ~Class(Player6,MAGE_ALL) !Name("c-aran",Player6)~ + ~[PC] Would you rather <PLAYER6> do it, Aran? I mean, if you think you need the help...~ + a980
END

IF ~~ a978
 SAY ~[ARAN] I can call on my spiritual side right fine. I just am a mite worried about messin' with a great big stone cairn filled wi' unspeakable evil. We have already done that a few times, eh?~
 ++ ~[PC] Do not worry, Aran. We have prevailed so far. We will be laughing about this later on.~ + a981
 ++ ~[PC] I did not have us take this task lightly. This could provide us with advantages we need later on in our travels.~ + a982
 ++ ~[PC] As I recall, there was a good bit of you running around screaming 'Kill it! Kill it! Cyric's Blood, kill it now!', while screaming like a little girl..~ + a980
 + ~Class(Player1,CLERIC_ALL)~ + ~[PC] Would you rather I do it, Aran? I mean, if you think you need the help...~ + a980
 + ~Class(Player2,CLERIC_ALL) !Name("c-aran",Player2)~ + ~[PC] Would you rather <PLAYER2> do it, Aran? I mean, if you think you need the help...~ + a980
 + ~Class(Player3,CLERIC_ALL) !Name("c-aran",Player3)~ + ~[PC] Would you rather <PLAYER3> do it, Aran? I mean, if you think you need the help...~ + a980
 + ~Class(Player4,CLERIC_ALL) !Name("c-aran",Player4)~ + ~[PC] Would you rather <PLAYER4> do it, Aran? I mean, if you think you need the help...~ + a980
 + ~Class(Player5,CLERIC_ALL) !Name("c-aran",Player5)~ + ~[PC] Would you rather <PLAYER5> do it, Aran? I mean, if you think you need the help...~ + a980
 + ~Class(Player6,CLERIC_ALL) !Name("c-aran",Player6)~ + ~[PC] Would you rather <PLAYER6> do it, Aran? I mean, if you think you need the help...~ + a980
END

IF ~~ a979
 SAY ~[ARAN] I'm right proud to say I bet we can lick just about anythin' fair an' square, an' that's before we start fightin' dirty. I just am a mite worried about messin' with a great big stone cairn filled wi' unspeakable evil. We have already done that a few times, eh?~
 ++ ~[PC] Do not worry, Aran. We have prevailed so far. We will be laughing about this later on.~ + a981
 ++ ~[PC] I did not have us take this task lightly. This could provide us with advantages we need later on in our travels.~ + a982
 ++ ~[PC] Somehow, the mental image of you licking our adversaries just turns my stomach. And maybe excites me a little, too.~ + a980
 + ~Class(Player1,FIGHTER_ALL)~ + ~[PC] Would you rather I take point, Aran? I mean, if you think you need to guard the rear...~ + a980
 + ~Class(Player2,FIGHTER_ALL) !Name("c-aran",Player2)~ + ~[PC] We could always have <PLAYER2> lead out. I mean, if you think you cannot handle taking point...~ + a980
 + ~Class(Player3,FIGHTER_ALL) !Name("c-aran",Player3)~ + ~[PC] We could always have <PLAYER3> lead out. I mean, if you think you cannot handle taking point...~ + a980
 + ~Class(Player4,FIGHTER_ALL) !Name("c-aran",Player4)~ + ~[PC] We could always have <PLAYER4> lead out. I mean, if you think you cannot handle taking point...~ + a980
 + ~Class(Player5,FIGHTER_ALL) !Name("c-aran",Player5)~ + ~[PC] We could always have <PLAYER5> lead out. I mean, if you think you cannot handle taking point...~ + a980
 + ~Class(Player6,FIGHTER_ALL) !Name("c-aran",Player6)~ + ~[PC] We could always have <PLAYER6> lead out. I mean, if you think you cannot handle taking point...~ + a980
END

IF ~~ a980 SAY ~[ARAN] Oooh, you know how to hurt a lad, you do. Right, then. I'll get about adventurin'.~ IF ~~ THEN EXIT END
IF ~~ a981 SAY ~[ARAN] The question is, are we goin' to be laughin' a good, comradely belly laugh, or a shrill hysterical terror-filled laugh? 'Cause I be much more in favor o' th' first.~ IF ~~ THEN EXIT END
IF ~~ a982 SAY ~[ARAN] Right. I should o' guessed that was th' idea. Go mess with th' big evil thing what's been locked up, so's we can have some nice treasure an' get some great magical weapons. Tiamat's Terrible Teeth, I'd think you were jokin', if it didn't sound like what we do every day, all day....~ IF ~~ THEN EXIT END

/* ToB Plot Talk 1: Saradush */
IF ~Global("c-aransaradsush","GLOBAL",1)~ THEN BEGIN a2380
  SAY ~[ARAN] That were an ugly sight, for sure. Th' whole city sacked. Enough to give anyone a right nasty set o' dreams.~
  ++ ~[PC] I couldn't close my eyes at all. I kept seeing the city of Saradush... burning.~ + a2289
  ++ ~[PC] I slept well enough, though I do have sympathy for those hurt because of my kind.~ + a2291
  ++ ~[PC] What? Did I miss something? I slept like the dead.~ + a2292
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had you as a distraction. I slept well enough.~ + a2295
  ++ ~[PC] I have seen worse. Saradush is not the first time I have experienced full-scale slaughter of innocents.~ + a2296
  ++ ~[PC] I... I do not want to talk about it.~ + a2297
END

IF ~~ a2289
  SAY ~[ARAN] I feel th' same. I worried a mite bit that you would feel distant. I went through that, for a time. It... well, it didn't turn out to be th' best way to handle things.~
  IF ~~ THEN GOTO a2290
END

IF ~~ a2290
  SAY ~[ARAN] <CHARNAME>, you have a depth to you what makes th' difference between those what rise to power at every cost an' those who pick an' choose th' costs. That marks you as different from most wi' th' kind o' power you wield.~
  ++ ~[PC] I am not sure you are correct, but I share your concern. I will see to it that this kind of thing cannot happen again.~ + a2294
  ++ ~[PC] I don't choose. War is like any other large force, like wind, or lightning. We can seek to control part of it, but unless we are gods, we can only change a very small portion. We only have so much power to change things.~ + a2292
  ++ ~[PC] I know, and I am tired of the choices others are making. I will be noticed. I will be a power to be reckoned with.~ + a2292
  ++ ~[PC] I am sick of having so much power, but no way to change things for the better. I don't think I can handle this.~ + a2300
  ++ ~[PC] I don't want to talk about this.~ + a2297
END

IF ~~ a2291
  SAY ~[ARAN] Those o' your... blighted hells, <PRO_MANWOMAN>, what exactly be "your kind"? I be hopin' you haven't lost your senses. We done already seen that 'Bhaalspawn' be varied just like any other race - if you can call it such.~
  IF ~~ THEN GOTO a2290
END

IF ~~ a2292
  SAY ~[ARAN] War an' power go hand in hand, true enough. Th' expense o' the fallen in Saradush - if you look at th' pain an' sufferin', it be wrong. If you look at th' waste o' useful lives, even potential slaves, it be wrong. If you look at th' loss o' goods an' services, it be wrong. Hells, even if you be a soul-eatin' demonic Drow-child, this be just plain useless to anyone's plans.~
  = ~[ARAN] There be only two ways this makes sense; one, someone tryin' to create a legion o' undead, or two, someone who revels in chaos an' sufferin'.~
  ++ ~[PC] Either way, the chaos will to be my advantage. I will use this as an excuse to eradicate every power which refuses to follow my wishes.~ + a2293
  ++ ~[PC] It does not matter. I will make sure things like this never happen again.~ + a2292
  ++ ~[PC] War and power may go hand in hand, but love can bind those hands and still them.~ + a2298
  ++ ~[PC] You are forgetting the true cost. This means all of the Prophecies are coming true. There will be no refuge or allies for us, anywhere. We will be hunted like animals.~ + a2299
  ++ ~[PC] Pain. Suffering. Waste. These are just symptoms. Someone has to wipe out war itself.~ + a2294
  ++ ~[PC] I look at things like this, and I just want to turn back time. I want to go back to Candlekeep, and hide somewhere in the stacks, locked away, protected from all this madness and death.~ + a2304
END

IF ~~ a2295
  SAY ~[ARAN] Distraction may be nice, but a thing like this will scar any man or woman what sees it.~
  ++ ~[PC] I keep seeing the city of Saradush... burning. It is not a pleasant sight.~ + a2289
  ++ ~[PC] I slept well enough, though I do have sympathy for those hurt because of my kind.~ + a2291
  ++ ~[PC] I have seen worse. Saradush is not the first time I have experienced full-scale slaughter of innocents.~ + a2296
  ++ ~[PC] I... I do not want to talk about it.~ + a2297
END

IF ~~ a2296
  SAY ~[ARAN] Me neither. But I never got so callous as not to feel anythin'. Th' waste, th' ugliness...~
  ++ ~[PC] It is beautiful, isn't it? The raw power, loosed untamed and unfettered, drenching everything in blood and meaningless death...~ + a2293
  ++ ~[PC] It is sickening.~ + a2289
  ++ ~[PC] I want revenge. I want the... things. The things that did this. I want them to suffer.~ + a2289
  ++ ~[PC] None of this is our concern. We did the best we could to save the city.~ + a2290
END

IF ~~ a2297
  SAY ~[ARAN] No bein' in their right mind does. But you will sleep better if you do.~
  ++ ~[PC] What is there to say? The weak get killed by the strong. War has a power of its own. There is nothing I can do about it.~ + a2292
  ++ ~[PC] It is my fault. I should have split the party, leaving behind someone to help.~ + a2302
  ++ ~[PC] I said I don't want to talk about it. Be quiet, or I will make sure you can't speak for a whole day.~ + a2299
  ++ ~[PC] You have been in war. What do you do with the feelings of guilt?~ + a2301
  ++ ~[PC] I sleep just fine, thank you. I understand that some things are beyond my power to control.~ + a2292
  ++ ~[PC] If I ever get a chance, I am going to put a stop to all this bloodshed.~ + a2298
END

IF ~~ a2293
  SAY ~[ARAN] <CHARNAME>, I think this be not th' first time I have mentioned that you scare th' livin' crap out o' me.~
  IF ~~ THEN EXIT
END

IF ~~ a2294
  SAY ~[ARAN] Impossible. Unless you eradicate every creature on this plane o' existence, an' mayhap beyond, you won't stop somethin' as ugly, wasteful, an' horrible from happenin' again, even if you were Ao incarnate. But I sure as Helm's Ever-Seein' Eyes will back you tryin' to make sure it don't happen very often.~
  IF ~~ THEN EXIT
END

IF ~~ a2298
  SAY ~[ARAN] That be a nice sentiment. I don't think it be practical, but then again, if you say it... mayhap it will come true.~
  IF ~~ THEN EXIT
END

IF ~~ a2299
  SAY ~[ARAN] Now, that be an awful thought.~
  IF ~~ THEN EXIT
END

IF ~~ a2300
  SAY ~[ARAN] No sane one o' us could. But you have a right bit o' depth to you, <CHARNAME>. You can handle this, an' more. Just remember, right or wrong, good or bad, I'd rather have you makin' th' choices rather than th' bastards what would slaughter everyone for no reason at all. I have faith. You will prevail.~
  IF ~~ THEN EXIT
END

IF ~~ a2301
  SAY ~[ARAN] Before I met you, I tried to forget. I drank, I caroused, I swore, I did anythin' what made me feel like I had some control over a small portion o' my life.~
  = ~[ARAN] Now that I have met you, I put those feelin's into a task, an' an idea. Basically, you be th' reason I can deal wi' everythin'. For right or wrong, when I be at your side, I have a place an' a purpose. That be enough for me.~
  IF ~~ THEN EXIT
END

IF ~~ a2302
  SAY ~[ARAN] Th' end result would have been worse. One o' us tryin' to take on an entire army might have delayed things an hour or so. But even th' avatar of a god can be taken down when th' odds are thousands to one.~
  ++ ~[PC] Does saying that make you feel better?~ + a2303
  ++ ~[PC] I guess you are right. I just keep feeling that this is so wrong, so utterly wrong. I can't get it out of my mind.~ + a2300
END

IF ~~ a2303
  SAY ~[ARAN] No. But it be a good thing to remind any o' us mere mortals that we are not th' center o' everythin'. An' we can look at this an' let it fuel our revenge, on account o' th' perpetrators o' this atrocity needs be hunted down an' slain like th' beasts they be.~
  IF ~~ THEN EXIT
END

IF ~~ a2304
  SAY ~[ARAN] That be a nice sentiment. I don't think it be practical, but then again, sometimes I make myself a little space in my head an' go there, all by myself, just to remember what I be fightin' for. Just... just don't be stayin' there too long, eh?~
  = ~[ARAN] Th' problem wi' hidin' away in your head is that your head be attached to th' mortal world. An' hidin' for a little mayhap gives some respite, but it does naught for actually changin' things or protectin' us from bein' th' next target o' this bloodshed.~
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
  SAY ~[ARAN] Gods.~
  ++ ~[PC] They had a little to do with it, I think. But not much. We survived through our own strength.~ DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2243
  ++ ~[PC] Was... was what that ...thing... what it said. Was it true?~ DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2243
  ++ ~[PC] Are you crying?~ DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2244
  ++ ~[PC] (Throw yourself into his arms and press your face against his chest.)~ DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2245
  ++ ~[PC] I don't know what to say.~ DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2243
  ++ ~[PC] So, a little history lesson for both of us?~ DO ~SetGlobal("c-aranpostwraith","GLOBAL",2)~ + a2243
END

IF ~~ a2244
  SAY ~[ARAN] Th' sounds... gods.~
  ++ ~[PC] You *are* crying. You let it get to you.~ + a2243
  ++ ~[PC] (Throw yourself into his arms and press your face against his chest.)~  + a2245
  ++ ~[PC] It was so real. An illusion, but so real. I could hear Gorion, and it sounded just like him. See, I am crying, too.~ + a2245
  ++ ~[PC] Stop. There is no point in letting the shades of our pasts hurt us like this.~ + a2243
  ++ ~[PC] Don't... don't cry. I can't hold things together when you cry.~ + a2245
END

IF ~~ a2245
  SAY ~[ARAN] (His arms crush you close, his face hidden from your sight.)~
  IF ~~ THEN GOTO a2243
END

IF ~~ a2243
  SAY ~[ARAN] That thing... it might have been only a powerful spirit, a reflection. But... It spoke o' things we have not talked about.~
  ++ ~[PC] It spoke twisted lies to hurt and confuse us, and to separate us.~ + a2246
  ++ ~[PC] I don't want to hear any more. The past is the past. For both of us, the past is the past.~ + a2246
  ++ ~[PC] (Look into his eyes.)~ + a2246
  ++ ~[PC] Aran, look at me... Look into my eyes. I love you.~ + a2246
  ++ ~[PC] You heard a twisted view of my life. I heard a twisted view of yours. It is over, and I never want to discuss it ever again. We need to move on, now. Pick up your gear, and help me get things back in order.~ + a2260
END

IF ~~ a2246
  SAY ~[ARAN] Truth be th' only way to really clear this burden. What that abomination said, it were true, to a point.~
  = ~[ARAN] There be times when you know an order be just plain wrong, an' you have to make a choice. I chose to follow.~
  = ~[ARAN] Th' details don't rightly matter, but th' result be an ugly truth. Good men can do horrible evil, just by followin' instead o' thinkin'.~
  + ~Alignment(Player1,MASK_EVIL)~ + ~[PC] Then you have more strength in you than I thought.~ + a2249
  + ~Alignment(Player1,MASK_GOOD)~ + ~[PC] Then you have more strength in you than I thought.~ + a2250
  + ~!Alignment(Player1,MASK_EVIL) !Alignment(Player1,MASK_GOOD)~ + ~[PC] Then you have more strength in you than I thought.~ + a2251
  ++ ~[PC] I don't want to hear any more. The past is the past. For both of us, the past is the past. Can we stop discussing this?~ + a2260
  ++ ~[PC] You really burned innocent children alive, and broke down in battle?~ + a2247
END

IF ~~ a2247
  SAY ~[ARAN] I'd say it different. I'd say I followed th' orders to set th' village afire. I'd say I thought there might be some innocents there, an' mayhap th' enemy was shieldin' themselves. I'd say that when I saw th' sight an' heard th' screams, I ran to see if I could undo what had been done...~
  = ~[ARAN] What I had done.~
  = ~[ARAN] But when it be th' truth between my soul an' you, yes. I did.~
  ++ ~[PC] Get. Away. From. Me.~ + a2257
  + ~Alignment(Player1,MASK_EVIL)~ + ~[PC] Then you have more strength in you than I thought.~ + a2249
  + ~Alignment(Player1,MASK_GOOD)~ + ~[PC] Then you have more strength in you than I thought.~ + a2250
  + ~!Alignment(Player1,MASK_EVIL) !Alignment(Player1,MASK_GOOD)~ + ~[PC] Then you have more strength in you than I thought.~ + a2251
  ++ ~[PC] You had no choice. An order is an order. You could not have been sure. It was not your place to make that choice.~ + a2252
  ++ ~[PC] Why have you not told me this before now?~ + a2253
  ++ ~[PC] I could say that everything that has happened to us is my fault. That would not be truth. It would be self-pity.~ + a2248
END

IF ~~ a2248
  SAY ~[ARAN] You could say that it be self pity. But there be a difference in my case. You didn't choose your blood or th' things what followed. Me, I could say I had no choices...~
  IF ~~ THEN GOTO a2252
END

IF ~~ a2249
  SAY ~[ARAN] What do you mean?~
  ++ ~[PC] You knew I would see this as an opportunity, a weakness in your character that I could exploit. You held it from me, even while showing me how much you care for me. That kind of inner strength, I can respect. Can you understand that?~ + a2260
  ++ ~[PC] You followed orders, even when you felt that they were wrong. You may have regretted doing so, but you followed. I know now that you will do anything for me, even if it goes against your very soul to do so. That is the kind of control I crave.  Can you understand that?~ + a2260
  ++ ~[PC] I do not see things the same way you do, Aran. I know you are hurting, and I hurt because you hurt... but in my eyes, you are blameless. War destroys all it touches, which is why we wield it very carefully. Can you understand that?~ + a2260
  ++ ~[PC] You knew even I have limits on what I am willing to do to further my own ends, and you sought to hide something I would never condone so that you could be with me. I don't like that, but I respect that.  Can you understand that?~ + a2260
  ++ ~[PC] You risked everything to tell me the truth. If that is not love, then I do not know what love really is.  Can you understand that?~ + a2260
END

IF ~~ a2250
  SAY ~[ARAN] What do you mean?~
  ++ ~[PC] You knew I would not be able to handle the burden of your feelings and my own guilt and frustration. You held this burden away from me. That takes strength.~ + a2258
  ++ ~[PC] You risked everything to tell me the truth. If that is not love, then I do not know what love really is. Do you understand what I am saying to you?~ + a2260
  ++ ~[PC] I do not see things the same way you do, Aran. I know you are hurting, and I hurt because you hurt... but in my eyes, you are blameless. War destroys all it touches, which is why we wield it very carefully. Can you understand that?~ + a2260
  ++ ~[PC] I try to do the right thing. But my hands are stained with innocent blood too; there can be no mortal way of stopping the consequences of violent action. But the pain you feel, the guilt, shows a strong conscience. I can love a man who takes responsibility for his actions.~ + a2258
  ++ ~[PC] You managed to lie to me every day that we have known each other. You know, I do not need your twisting and hiding the truth. You should leave.~ + a2257
END

IF ~~ a2251
  SAY ~[ARAN] What do you mean?~
  ++ ~[PC] You knew I would not be able to handle the burden of your feelings and my own guilt and frustration. You held this burden away from me. That takes strength.~ + a2258
  ++ ~[PC] I do not see things the same way you do, Aran. I know you are hurting, and I hurt because you hurt... but in my eyes, you are blameless. War destroys all it touches, which is why we wield it very carefully. Can you understand that?~ + a2260
  ++ ~[PC] There is no right or wrong in these things, Aran. The same hand that sweeps away a Tyrant kills innocents. Balance, chaos, order... all of those are a part of life on Faerun. We just have to make sense of this for ourselves, and remember we are just passengers on this plane of existence. Do you understand?~ + a2258
  ++ ~[PC] Strength of character. You decided when to tell me what you are capable of. I can love a man who shows that kind of restraint.~ + a2258
  ++ ~[PC] You managed to lie to me every day that we have known each other. You know, I do not need your twisting and hiding the truth. You should leave.~ + a2257
END

IF ~~ a2252
  SAY ~[ARAN] That be a lie. We all have choices, every second o' every day. An' when we make th' wrong ones, we with death in our hands an' blood in our hearts... we kill people. We make that choice.~
  ++ ~[PC] Would you ever have told me?~ + a2255
  ++ ~[PC] Then I am making a choice right now. I think you should leave.~ + a2257
  ++ ~[PC] Then I make a choice every minute of every day. I chose to love you.~ + a2259
  ++ ~[PC] Aran... You and I know you are not the only person in my life. But I keep choosing to be with you. That should tell you that I can handle both the good and the bad in you. I love you.~ + a2259
  ++ ~[PC] I have done worse things than you could ever imagine. War claims all in its path as victims. As I see it, you have no more need of self-recrimination than I need apologize for being the child of a dead god. I can live with that. Can you?~ + a2260
END

IF ~~ a2253
  SAY ~[ARAN] I have told no one. Never. Until now.~
  ++ ~[PC] Would you ever have told me?~ + a2255
  ++ ~[PC] And you say you love me. You really think I am that weak.~ + a2254
  ++ ~[PC] Thank you for telling me the truth. I understand... there are things in all of our pasts that we want buried forever. Do you love me?~ + a2256
  ++ ~[PC] Aran... You and I know you are not the only person in my life. But I keep choosing to be with you. That should tell you that I can handle both the good and the bad in you. I love you.~ + a2259
END

IF ~~ a2254
  SAY ~[ARAN] Now, hold on, I was tryin' to keep th' guilt off of...~
  ++ ~[PC] I can handle guilt. I can handle blood. I was born to it. What I can't handle is someone who claims to love me, but will hide things from me. You should leave. Now.~ + a2257
  ++ ~[PC] I... I understand. You did not think I was strong enough. I don't think you realize how strong a woman can be for the man she loves.~ + a2258
  ++ ~[PC] Don't you love me?~ + a2256
  ++ ~[PC] I have held things back from you, too. Did you know that I envied Imoen? That I hated Gorion for keeping me away from a life outside the library? That I have killed without remorse, tricked and lied my way through life, and that in spite of it all I can't stop loving a silly do-gooder who can't seem to see exactly how wrong I am for him? Love stinks, doesn't it.~ + a2258
  ++ ~[PC] No, you misunderstand me. I am that weak. I... I can see myself, and I hate that woman. I needed to think you were different. Perhaps it is time I grew up, and realized that we all carry burdens. I... I just need your help, sharing  the weight between the two of us.~ + a2258
END

IF ~~ a2255
  SAY ~[ARAN] Told you wi' out all this? On th' truth an' respect I have for you... no. I would not.~
  ++ ~[PC] Don't you love me?~ + a2256
  ++ ~[PC] You were wise. I can't have the blood and guilt you bring added to my burdens. You need to find your own path.~ + a2257
  ++ ~[PC] I can handle guilt. I can handle blood. I was born to it. What I can't handle is someone who claims to love me, but will hide things from me. You should leave. Now.~ + a2257
  ++ ~[PC] I... I understand. You did not think I was strong enough. I don't think you realize how strong a woman can be for the man she loves.~ + a2258
  ++ ~[PC] I have held things back from you, too. Did you know that I envied Imoen? That I hated Gorion for keeping me away from a life outside the library? That I have killed without remorse, tricked and lied my way through life, and that in spite of it all I can't stop loving a silly do-gooder who can't seem to see exactly how wrong I am for him? Love stinks, doesn't it.~ + a2258
END

IF ~~ a2256
  SAY ~[ARAN] O' course I do.~
  ++ ~[PC] Then trust me. No secrets. I am a Child of Murder. If I can handle that truth, then I can handle your truth.~ + a2258
  ++ ~[PC] Then say no more about this. What is past is past, and we have a future to plan. Don't let old blood drown a new life together.~ + a2258
  ++ ~[PC] Then... I need you to leave. I have the weight of my own guilt to carry. I can't handle both yours and mine.~ + a2257
  ++ ~[PC] Then kiss me, and forget the past. We have to focus on what is ahead of us, not what is behind us.~ DO ~SetGlobal("c-aranintimate","GLOBAL",1)~ + a2258
END

IF ~~ a2257
  SAY ~[ARAN] I... ~
  = ~[ARAN] ... ~
  = ~[ARAN] You want me to go.~
  ++ ~[PC] (Turn your back to him, walking away silently.)~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3) ActionOverride("c-aran",GivePartyAllEquipment()) ActionOverride("c-aran",LeaveParty()) ActionOverride("c-aran",EscapeArea())~ EXIT
  ++ ~[PC] Leave.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3) ActionOverride("c-aran",GivePartyAllEquipment()) ActionOverride("c-aran",LeaveParty()) ActionOverride("c-aran",EscapeArea())~ EXIT
  ++ ~[PC] No. Stay with the party. But stay away from me.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2260
  ++ ~[PC] I need time to understand what you did. Just leave me alone for awhile, while I think.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranpostwraith","GLOBAL",3) SetGlobalTimer("c-aranwraithink","GLOBAL",FOUR_DAYS)~ + a2260 /* don't want a fight to kick this into gear. Needs follow up talk, probably. */
END

IF ~~ a2258
  SAY ~[ARAN] Mayhap you be right. I learn somethin' new about you almost every day.~
  IF ~~ THEN GOTO a2259
END

IF ~~ a2259
  SAY ~[ARAN] I don't think I say this right strong enough, or often enough.~
  = ~[ARAN] I love you.~
  IF ~~ THEN EXIT
END

IF ~~ a2260
  SAY ~[ARAN] Aye.~
  IF ~~ THEN EXIT
END


/* for followup: BCS
Global("c-aranpostwraith","GLOBAL",3)
GlobalTimerExpired("c-aranwraithink","GLOBAL",FOUR_DAYS)
SetGlobal("c-aranpostwraith","GLOBAL",4)

IF ~Global("c-aranpostwraith","GLOBAL",4)~ c_are_we_on_or_are_we_done
*/

/* ToB Plot Talk : Big End Battle */
IF ~Global("c-aranisthisit","GLOBAL",1)~ THEN BEGIN a2922
  SAY ~[ARAN] Right. Check my gear, eh? It might just be that this ends up as th' mother o' all battles.~
  ++ ~[PC] Oh, relax.~ DO ~SetGlobal("c-aransaradsush","GLOBAL",2)~ EXIT /* PLACEHOLDER */
/*
  + ~Gender(Player1,FEMALE) Global("c-aranintimate","GLOBAL",0) Global("c-aranrom","GLOBAL",2)~ + ~[PC] ~ +
  + ~Gender(Player1,FEMALE) Global("c-aranintimate","GLOBAL",1) Global("c-aranrom","GLOBAL",2)~ + ~[PC] ~ +
  + ~Gender(Player1,FEMALE) Global("c-aranintimate","GLOBAL",2) Global("c-aranrom","GLOBAL",2)~ + ~[PC] ~ +
  + ~Gender(Player1,FEMALE) Global("c-aranintimate","GLOBAL",3) Global("c-aranrom","GLOBAL",2)~ + ~[PC] ~ +
  + ~Gender(Player1,FEMALE) Global("c-aranintimate","GLOBAL",4) Global("c-aranrom","GLOBAL",2)~ + ~[PC] ~ +
  + ~Gender(Player1,FEMALE) Global("c-aranintimate","GLOBAL",0) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] ~ +
  + ~Gender(Player1,FEMALE) Global("c-aranintimate","GLOBAL",1) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] ~ +
  + ~Gender(Player1,FEMALE) Global("c-aranintimate","GLOBAL",2) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] ~ +
  + ~Gender(Player1,FEMALE) Global("c-aranintimate","GLOBAL",3) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] ~ +
  + ~Gender(Player1,FEMALE) Global("c-aranintimate","GLOBAL",4) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] ~ +
*/
END


/* ToB Friend Talks */

/* ToB 2 : "My kingdom for a horse." Complaints of walking. Everywhere. - Idea by Igneous */

IF ~Global("c-aranfriendtob","GLOBAL",3)~ THEN BEGIN a2764 /*  7 options */
  SAY ~[ARAN] Now, this be just plain silly. Why in Gond's Great Gears do we have to be blighted walkin' everywhere?~
  ++ ~[PC] What does that have to do with my mission?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2765
  ++ ~[PC] I know it is slow and sometimes painful, but I don't see any alternatives.~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2766
  + ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ + ~[PC] We walk because we have feet. Did you want to try sprouting wings?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2767
  + ~OR(2)!InParty("Aerie") StateCheck("Aerie",CD_STATE_NOTVALID)~ + ~[PC] We walk because we have feet. Did you want to try sprouting wings?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2768
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Because you would get tired of carrying me on your back?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2772
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Because you would get tired of carrying me on your back?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2769
  ++ ~[PC] I agree. We should get some horses. Do you know where we can get some?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2771
  ++ ~[PC] If there is some way I could support you on this, please, let me know. I just don't see any good alternatives to using our feet.~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~  + a2770
  + ~RandomNum(3,1)~ + ~[PC] Just shut up and let's keep moving.~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a3146 /* c-aranshutup13 ~[ARAN] Lolth's Cruel Fingernails, you can cut a man down. Sure. Shuttin' up.~ */
  + ~RandomNum(3,2)~ + ~[PC] Less complaining, or I will cut out your tongue and use it as fishbait.~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a3147 /* c-aranshutup14 ~[ARAN] Umberlee's Fickle Breath, I'll shut my blighted mouth, then.~ */
  + ~RandomNum(3,3)~ + ~[PC] Were you talking, or did you just break wind?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",4) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a3148 /* c-aranshutup15 ~[ARAN] Malar's Sharp Teeth. Shuttin' up an' soldierin'.~ */
END

IF ~~ a2765
  SAY ~[C-ARAN] Well, it does, a bit. We could move a might faster, you know.~
  IF ~~ THEN GOTO a2770
END

IF ~~ a2766
  SAY ~[C-ARAN] I see a right fine set o' alternatives, I do...~
  IF ~~ THEN GOTO a2770
END

IF ~~ a2767
  SAY ~[C-ARAN] Blighted hells... keep your voice down, eh? I know Aerie has a mite bit more self confidence now, but th' whole wing thing most likely will bother her on some level for th' rest o' her life. No provokin' more waterworks, for all th' god's sake.~
  IF ~~ THEN GOTO a2770
END

IF ~~ a2768
  SAY ~[C-ARAN] Now that would be a right fine joke, now, wouldn't it. I don't see where I'd be stuffin' a set o' wings in this here armor, that be for sure.~
  IF ~~ THEN GOTO a2770
END

IF ~~ a2769 /*  7 options */
  SAY ~[C-ARAN] Do we be talkin' physically, or just metaphorically?~
  ++ ~[PC] Watch it, sellsword. I am an easy woman to understand. I *always* mean physically.~ + a2770
  ++ ~[PC] I can just see it, the two of us, battling dragons, me riding your shoulders, cuddled up around your head...~ + a2786
  ++ ~[PC] Do you even know what 'metaphorically' means?~ + a2770
  ++ ~[PC] I could try to ride your front, if you want, instead... but somehow I think that would be a little distracting. Especially when I kiss you.~ + a2787
  ++ ~[PC] It would be more romantic if you carried me in your arms, instead.~ + a2788
  ++ ~[PC] Don't you want to feel my thighs clasped firmly around you, holding on tight?~ + a2787
  ++ ~[PC] Oh, come on, Aran.... give me a piggy-back ride!~ + a2789
END

IF ~~ a2770 /*  6 options */
  SAY ~[C-ARAN] Look, we be one o' th' most powerful forces on th' face o' Toril, but do we ride horses around? Do we use one o' them flyin' Calimshan carpet contraptions? Do we summon levitation spells an' waft are way about, pretty as a feather? No. We blighted slog through th' crap like we was green recruits doin' basic trainin'. ~
  + ~ReputationGT(Player1,16)~ + ~[PC] I am doing just fine on my own two feet.~ + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + ~[PC] I am doing just fine on my own two feet.~ + a2777
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + ~[PC] I am doing just fine on my own two feet.~ + a2778
  + ~ReputationLT(Player1,9)~ + ~[PC] I am doing just fine on my own two feet.~ + a2779
  ++ ~[PC] We would if we could. But we need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] Have you seen any horses to buy, or carpets to steal? Have you ever managed to cast a levitate spell that lasts for hours on end and doesn't subject us to the first strong wind blowing us into a ravine?~ + a2784
  + ~ReputationGT(Player1,16)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2781
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2782
  + ~ReputationLT(Player1,9)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2783
  ++ ~[PC] I may be one of the most powerful forces on the face of Toril. You are just the smelliest.~ + a2784
  + ~RandomNum(3,1)~ + ~[PC] Now you are just whining. Shut up, or I will trade you in for something useful, like a smart-talking two-handed sword with delusions of grandeur.~ + a3146 /* c-aranshutup13 ~[ARAN] Lolth's Cruel Fingernails, you can cut a man down. Sure. Shuttin' up.~ */
  + ~RandomNum(3,2)~ + ~[PC] Dear gods, you never shut up, do you?~ + a3147 /* c-aranshutup14 ~[ARAN] Umberlee's Fickle Breath, I'll shut my blighted mouth, then.~ */
  + ~RandomNum(3,3)~ + ~[PC] All I hear is whine, whimper, cry. Are you really a sellsword, or do you just play one at the Ten Taverns Amateur Acting Night?~ + a3148 /* c-aranshutup15 ~[ARAN] Malar's Sharp Teeth. Shuttin' up an' soldierin'.~ */
  + ~Race(Player1,ELF)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2799
  + ~Race(Player1,HUMAN)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2800
  + ~Race(Player1,DWARF)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2801
  + ~Race(Player1,HALFORC)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2802
  + ~Race(Player1,GNOME)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2803
  + ~Race(Player1,HALFLING)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2804
  + ~Race(Player1,HALF_ELF)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2805
END

IF ~~ a2771
  SAY ~[C-ARAN] Well, I might... but there be a big problem. I somehow think a horse might not last in that little plane o' th' hells you created. They might make th' trip, but keepin' 'em in their right mind might be dangerous.~
  ++ ~[PC] I could make it calming for them, I think.~ + a2773
  ++ ~[PC] Good point. So basically, horses are a bad idea.~ + a2773
  ++ ~[PC] Well, what about some of those flying Calimshan carpets? Do you have any sources for those?~ + a2774
  + ~Race(Player1,ELF)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2799
  + ~Race(Player1,HUMAN)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2800
  + ~Race(Player1,DWARF)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2801
  + ~Race(Player1,HALFORC)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2802
  + ~Race(Player1,GNOME)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2803
  + ~Race(Player1,HALFLING)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2804
  + ~Race(Player1,HALF_ELF)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2805
  ++ ~[PC] There is also that whole talk you gave me one night about how horses are force multipliers, but come with heavy costs.... food, care, and the fact that you become a big shiny monster target...~ + a2775
  ++ ~[PC] I do remember something about how keeping close to the ground and reducing the potential angles of attack made better tactical sense. In fact, I think you have said that about two hundred times.~ + a2775
END

IF ~~ a2772 /*  6 options */
  SAY ~[C-ARAN] Do we be talkin' physically, or just metaphorically?~
  ++ ~[PC] Watch it, sellsword. Joking with me is gambling with Fate. Not many have bet against her and lived.~ + a2770
  ++ ~[PC] Physically, of course. I can just see it, the two of us, battling dragons, me riding your shoulders like a child...~ + a2770
  ++ ~[PC] Do you even know what 'metaphorically' means?~ + a2770
  ++ ~[PC] You carry your fair share of battles, Aran. I was only joking about with you.~ + a2770
  ++ ~[PC] I love a man with quick wit. When are you going to introduce me to one?~ + a2770
  + ~Race(Player1,ELF)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2799
  + ~Race(Player1,HUMAN)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2800
  + ~Race(Player1,DWARF)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2801
  + ~Race(Player1,HALFORC)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2802
  + ~Race(Player1,GNOME)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2803
  + ~Race(Player1,HALFLING)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2804
  + ~Race(Player1,HALF_ELF)~ + ~[PC] Oh, fine. You get on my back, and I will carry you.~ + a2805
  ++ ~[PC] I love a man with quick wit. It lightens my day. ~ + a2770
END

IF ~~ a2773
  SAY ~[C-ARAN] To be fair, this whole poppin' in an' out o' existence cuts down a fair bit on th' walkin'. I do remember traipsin' around a good deal more back when we didn't have no option like that.~
  ++ ~[PC] So why were you complaining?~ + a2775
  + ~ReputationGT(Player1,16)~ + ~[PC] I am doing just fine on my own two feet.~ + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + ~[PC] I am doing just fine on my own two feet.~ + a2777
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + ~[PC] I am doing just fine on my own two feet.~ + a2778
  + ~ReputationLT(Player1,9)~ + ~[PC] I am doing just fine on my own two feet.~ + a2779
  ++ ~[PC] I think of it as my home away from home, complete with butler. Hey, I don't have to worry about you there! Nothing for you to break!~ + a2780
  + ~ReputationGT(Player1,16)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2781
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2782
  + ~ReputationLT(Player1,9)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2783
  ++ ~[PC] I am glad that having sections of my soul torn and ripping open the fabric of reality let you take it easy on your feet. Next time, it is your turn to be the primary target of a dead god and his minions.~ + a2784
  ++ ~[PC] Aran, there is an old Candlekeep saying... "Let not the reader complain of the words already enscribed, for they are the past. Let the knowledge in them carry the future forward".~ + a2785
END

IF ~~ a2774
  SAY ~[C-ARAN] Well, I might... but there be a big problem. I somehow think a group o' us flyin' off between areas on a raft o' them contraptions might give away our position, an' make it a bit tougher to be stealthy. Plus, Dragons. They fly. Though it might cut down on th' number o' undead we run across... wait, nope. Vampires fly too. Blighted hells.~
  IF ~~ THEN GOTO a2773
END

IF ~~ a2775
  SAY ~[ARAN] I do guess we might bring up some problems wi' th' whole idea. I just don't like walkin' around. Everywhere. Constantly. Especially when there be wagons, carts, airships, magical equipment, boats.... well, you get th' idea.~
  + ~ReputationGT(Player1,16)~ + ~[PC] I am doing just fine on my own two feet.~ + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + ~[PC] I am doing just fine on my own two feet.~ + a2777
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + ~[PC] I am doing just fine on my own two feet.~ + a2778
  + ~ReputationLT(Player1,9)~ + ~[PC] I am doing just fine on my own two feet.~ + a2779
  ++ ~[PC] I wish there were a better way, Aran. But I think we are stuck with just using our feet. It has served well enough for a long time now.~ + a2784
  + ~ReputationGT(Player1,16)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2776
  + ~ReputationLT(Player1,17) ReputationGT(Player1,11)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2781
  + ~ReputationLT(Player1,12) ReputationGT(Player1,8)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2782
  + ~ReputationLT(Player1,9)~ + ~[PC] You are doing just fine on your own two feet. Think of it as muscle maintenance.~ + a2783
  ++ ~[PC] Just think of how wonderful that footbath and massage will feel when you finally get a chance to indulge..~ + a2784
END

IF ~~ a2776 /* 5 to 6 options */
  SAY ~[C-ARAN] Right. I guess I be doin' too much grousin', on account o' you mostly do th' right thing by people. If you saw th' need, you would provide it.~
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] I figure you are smart, dexterous, and tough. A little walking won't kill you. It will make you stronger and more able to pick those locks and dodge those traps.~ + a2784
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] You may be wielding some decent magic now, but I always think it is good to stick to basics, too. You wouldn't want to lose all that fighting muscle, now, would you?~ + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] The gods provide you with spells, but you have to be strong enough to carry the gear and protect yourself. There is no sense in taking the easy way out.~ + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] Just think of it as a necessary evil bound to the fighting profession. Besides, getting up on a horse makes you a much larger target, or so you have told me...~ + a2784
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] Have you seen any horses to buy, or carpets to steal? Have you ever managed to cast a levitate spell that lasts for hours on end and doesn't subject us to the first strong wind blowing us into a ravine?~ + a2784
  ++ ~[PC] Plus, I tend to listen when a trusted military advisor says "no horses... too big, too hard to feed, to hard to heal, and too hard to keep quiet when a blighted great dragon comes swooping down on you. Wasn't it you who said "swooping is bad"? Or was it someone else?~ + a2784
  ++ ~[PC] It would be so much easier if you would just understand that I am right. Well, once I thought I was wrong, but it turns out I was mistaken, so I was actually right.~ + a2784
END

IF ~~ a2777 /* 6 to 7 options */
  SAY ~[C-ARAN] You know, sometimes it be more than about you, eh? You do right by most folks, I know. But this walkin' business, it don't seem like you are lookin out for th' party.~
  + ~RandomNum(3,1)~ + ~[PC] Now you are just whining. Shut up, or I will trade you in for something useful, like a smart-talking two-handed sword with delusions of grandeur.~ + a3146 /* c-aranshutup13 ~[ARAN] Lolth's Cruel Fingernails, you can cut a man down. Sure. Shuttin' up.~ */
  + ~RandomNum(3,2)~ + ~[PC] Dear gods, you never shut up, do you?~ + a3147 /* c-aranshutup14 ~[ARAN] Umberlee's Fickle Breath, I'll shut my blighted mouth, then.~ */
  + ~RandomNum(3,3)~ + ~[PC] All I hear is whine, whimper, cry. Are you really a sellsword, or do you just play one at the Ten Taverns Amateur Acting Night?~ + a3148 /* c-aranshutup15 ~[ARAN] Malar's Sharp Teeth. Shuttin' up an' soldierin'.~ */
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] A little walking won't kill you. It will make you stronger and more able to pick those locks and dodge those traps. You don't have to sulk about it.~ + a2784
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] You may be wielding some decent magic now, but you wouldn't want to lose all that fighting muscle, now, would you?~ + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] The gods provide you with spells, but you have to be strong enough to carry the gear and protect yourself. If you don't like it, you could try praying for some support.~ + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] I thought you said getting up on a horse makes you a much larger target, and that flying opponents are much more vulnerable.~ + a2784
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] Have you seen any horses to buy, or carpets to steal? Have you ever managed to cast a levitate spell that lasts for hours on end and doesn't subject us to the first strong wind blowing us into a ravine?~ + a2784
  ++ ~[PC] It sounds more like you are just grumbling about your feet, and not really thinking things through. I think I have proven that I look out for more than my own interests.~ + a2784
  ++ ~[PC] That isn't fair at all. I talk to you, and I take your ideas into consideration. This isn't about me, or my needs. If I could have found alternatives, I would have.~ + a2784
END

IF ~~ a2778 /* 6 to 7 options */
  SAY ~[C-ARAN] That would figure. Another way to torture me an' still make it be all about you.~
  + ~RandomNum(3,1)~ + ~[PC] Now you are just whining. Shut up, or I will trade you in for something useful, like a smart-talking two-handed sword with delusions of grandeur.~ + a3146 /* c-aranshutup13 ~[ARAN] Lolth's Cruel Fingernails, you can cut a man down. Sure. Shuttin' up.~ */
  + ~RandomNum(3,2)~ + ~[PC] Dear gods, you never shut up, do you?~ + a3147 /* c-aranshutup14 ~[ARAN] Umberlee's Fickle Breath, I'll shut my blighted mouth, then.~ */
  + ~RandomNum(3,3)~ + ~[PC] All I hear is whine, whimper, cry. Are you really a sellsword, or do you just play one at the Ten Taverns Amateur Acting Night?~ + a3148 /* c-aranshutup15 ~[ARAN] Malar's Sharp Teeth. Shuttin' up an' soldierin'.~ */
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] Walking will make you stronger and more able to pick those locks and dodge those traps, doing my bidding. You don't have to sulk about it.~ + a2784
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] You may be wielding magic now, but I don't want to have you lose all that fighting muscle.~ + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] The gods provide you with spells, but you have to be strong enough to carry the gear and protect yourself. If you don't like it, take it up with them. Until then, stop crying about it.~ + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] Your words, your analysis... you said getting up on a horse makes you a much larger target, and that flying opponents are much more vulnerable.~ + a2784
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] Have you seen any horses to buy, or carpets to steal? Have you ever managed to cast a levitate spell that lasts for hours on end and doesn't subject us to the first strong wind blowing us into a ravine?~ + a2784
  ++ ~[PC] I don't want to torture you, Aran. I want to make sure you are useful to my goals. If I make you suffer, it is for a reason.~ + a2784
  ++ ~[PC] If it were all about you, do you think I would be here?~ + a2784
  ++ ~[PC] True, all too true. After all, my usual day starts with squishing small squirrels, and wandering about thinking up ways to torture you and make your life miserable. Then I eat a hearty breakfast, and get to the job of making your life a living hell.~ + a2784
END

IF ~~ a2779
  SAY ~[C-ARAN] I done forgot again. Everythin' be about you.~
  + ~RandomNum(3,1)~ + ~[PC] Now you are just whining. Shut up, or I will trade you in for something useful, like a smart-talking two-handed sword with delusions of grandeur.~ + a3146 /* c-aranshutup13 ~[ARAN] Lolth's Cruel Fingernails, you can cut a man down. Sure. Shuttin' up.~ */
  + ~RandomNum(3,2)~ + ~[PC] Dear gods, you never shut up, do you?~ + a3147 /* c-aranshutup14 ~[ARAN] Umberlee's Fickle Breath, I'll shut my blighted mouth, then.~ */
  + ~RandomNum(3,3)~ + ~[PC] All I hear is whine, whimper, cry. Are you really a sellsword, or do you just play one at the Ten Taverns Amateur Acting Night?~ + a3148 /* c-aranshutup15 ~[ARAN] Malar's Sharp Teeth. Shuttin' up an' soldierin'.~ */
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] Walking will make you stronger and more able to pick those locks and dodge those traps, doing my bidding. Think of it as job protection.~ + a2784
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] I won't have you lose all that fighting muscle. Spells will only take you so far, and I expect you to be both might and magic, if I am going to have a use for you here.~ + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] The gods provide you with spells, but you have to be strong enough to carry the gear and protect yourself. If you don't like it, take it up with them. Until then, stop crying about it.~ + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] You said getting up on a horse makes you a much larger target, and that flying opponents are much more vulnerable. Don't cry when I actually take your advice... be thankful I acknowledge that you are useful to me, in a minor way.~ + a2784
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] Have you seen any horses to buy, or carpets to steal? Have you ever managed to cast a levitate spell that lasts for hours on end and doesn't subject us to the first strong wind blowing us into a ravine?~ + a2784
  ++ ~[PC] Absolutely. And don't forget it again. A man who serves me well could accomplish many things. A man who annoys me could accomplish many things, but none of them would be the sort of thing they really want.~ + a2784
  ++ ~[PC] Don't make it be about you. There is only room for one leader.~ + a2784
END

IF ~~ a2780
  SAY ~[C-ARAN] Funny, funny, funny. Don't trouble yourself none... I will find somethin' to break even there, by Tymora's Bright Coin. But I still think we could do better than usin' our feet.~
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] I figure you are smart, dexterous, and tough. A little walking won't kill you. It will make you stronger and more able to pick those locks and dodge those traps.~ + a2784
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] You may be wielding some decent magic now, but I always think it is good to stick to basics, too. You wouldn't want to lose all that fighting muscle, now, would you?~ + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] The gods provide you with spells, but you have to be strong enough to carry the gear and protect yourself. There is no sense in taking the easy way out.~ + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] Just think of it as a necessary evil bound to the fighting profession. Besides, getting up on a horse makes you a much larger target, or so you have told me...~ + a2784
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] Have you seen any horses to buy, or carpets to steal? Have you ever managed to cast a levitate spell that lasts for hours on end and doesn't subject us to the first strong wind blowing us into a ravine?~ + a2784
  ++ ~[PC] Plus, I tend to listen when a trusted military advisor says "no horses... too big, too hard to feed, to hard to heal, and too hard to keep quiet when a blighted great dragon comes swooping down on you. Wasn't it you who said "swooping is bad"? Or was it someone else?~ + a2784
  ++ ~[PC] It would be so much easier if you would just understand that I am right. Well, once I thought I was wrong, but it turns out I was mistaken, so I was actually right.~ + a2784
END

IF ~~ a2781
  SAY ~[C-ARAN] I suppose you be right. Most times, you are. But my feet get right sore, an' I don't have no other outlet than to complain, eh?~
  + ~RandomNum(3,1)~ + ~[PC] Now you are just whining. Shut up, or I will trade you in for something useful, like a smart-talking two-handed sword with delusions of grandeur.~ + a3146 /* c-aranshutup13 ~[ARAN] Lolth's Cruel Fingernails, you can cut a man down. Sure. Shuttin' up.~ */
  + ~RandomNum(3,2)~ + ~[PC] Dear gods, you never shut up, do you?~ + a3147 /* c-aranshutup14 ~[ARAN] Umberlee's Fickle Breath, I'll shut my blighted mouth, then.~ */
  + ~RandomNum(3,3)~ + ~[PC] All I hear is whine, whimper, cry. Are you really a sellsword, or do you just play one at the Ten Taverns Amateur Acting Night?~ + a3148 /* c-aranshutup15 ~[ARAN] Malar's Sharp Teeth. Shuttin' up an' soldierin'.~ */
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] A little walking won't kill you. It will make you stronger and more able to pick those locks and dodge those traps. You don't have to sulk about it.~ + a2784
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] You may be wielding some decent magic now, but you wouldn't want to lose all that fighting muscle, now, would you?~ + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] The gods provide you with spells, but you have to be strong enough to carry the gear and protect yourself. If you don't like it, you could try praying for some support.~ + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] I thought you said getting up on a horse makes you a much larger target, and that flying opponents are much more vulnerable.~ + a2784
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] Have you seen any horses to buy, or carpets to steal? Have you ever managed to cast a levitate spell that lasts for hours on end and doesn't subject us to the first strong wind blowing us into a ravine?~ + a2784
  ++ ~[PC] I think we are better served by complaining only about things we can actually do something about.~ + a2784
  ++ ~[PC] What is the use of complaining? The gods seem to have a strange sense of humor on that one. Complain too little, and they cause you mischief. Complain too much, and they give you more mischief.~ + a2784
END

IF ~~ a2782
  SAY ~[C-ARAN] I suppose you might look at it that way, you havin' a mean streak an' all. Though I suppose I should be thankful you don't come up wi' more insidious ways o' makin' my life hell.~
  + ~RandomNum(3,1)~ + ~[PC] Now you are just whining. Shut up, or I will trade you in for something useful, like a smart-talking two-handed sword with delusions of grandeur.~ + a3146 /* c-aranshutup13 ~[ARAN] Lolth's Cruel Fingernails, you can cut a man down. Sure. Shuttin' up.~ */
  + ~RandomNum(3,2)~ + ~[PC] Dear gods, you never shut up, do you?~ + a3147 /* c-aranshutup14 ~[ARAN] Umberlee's Fickle Breath, I'll shut my blighted mouth, then.~ */
  + ~RandomNum(3,3)~ + ~[PC] All I hear is whine, whimper, cry. Are you really a sellsword, or do you just play one at the Ten Taverns Amateur Acting Night?~ + a3148 /* c-aranshutup15 ~[ARAN] Malar's Sharp Teeth. Shuttin' up an' soldierin'.~ */
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] Walking will make you stronger and more able to pick those locks and dodge those traps, doing my bidding. Think of it as job protection.~ + a2784
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] I won't have you lose all that fighting muscle. Spells will only take you so far, and I expect you to be both might and magic, if I am going to have a use for you here.~ + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] The gods provide you with spells, but you have to be strong enough to carry the gear and protect yourself. If you don't like it, take it up with them. Until then, stop crying about it.~ + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] You said getting up on a horse makes you a much larger target, and that flying opponents are much more vulnerable. Don't cry when I actually take your advice... be thankful I acknowledge that you are useful to me, in a minor way.~ + a2784
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] Have you seen any horses to buy, or carpets to steal? Have you ever managed to cast a levitate spell that lasts for hours on end and doesn't subject us to the first strong wind blowing us into a ravine?~ + a2784
  ++ ~[PC] Stop thinking. It makes it harder for me to control you, and therefore makes you less useful to my goals. I like you, Aran. I wouldn't want to have to get rid of you.~ + a2784
  ++ ~[PC] Actually, I thought about having you carry some rocks in your gear, just to toughen you up more, but I need you rested enough for combat. I may have my own interests at heart, but my interests do end up lining your pocket and making you more powerful, so it might be time to shut up and soldier, soldier.~ + a2784
END

IF ~~ a2783
  SAY ~[C-ARAN] Figures. Right, right, got it... strength an' control gives th' biggest rewards. I should look for ways o' turnin' th' walkin' into an advantage. None o' that soft goodie-twoshoes help th' other guy out... toughen up or get th' blighted hells out o' th' way.~
  + ~RandomNum(3,1)~ + ~[PC] Now you are just whining. Shut up, or I will trade you in for something useful, like a smart-talking two-handed sword with delusions of grandeur.~ + a3146 /* c-aranshutup13 ~[ARAN] Lolth's Cruel Fingernails, you can cut a man down. Sure. Shuttin' up.~ */
  + ~RandomNum(3,2)~ + ~[PC] Dear gods, you never shut up, do you?~ + a3147 /* c-aranshutup14 ~[ARAN] Umberlee's Fickle Breath, I'll shut my blighted mouth, then.~ */
  + ~RandomNum(3,3)~ + ~[PC] All I hear is whine, whimper, cry. Are you really a sellsword, or do you just play one at the Ten Taverns Amateur Acting Night?~ + a3148 /* c-aranshutup15 ~[ARAN] Malar's Sharp Teeth. Shuttin' up an' soldierin'.~ */
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] Walking will make you stronger and more able to pick those locks and dodge those traps, doing my bidding. Think of it as job protection.~ + a2784
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] I won't have you lose all that fighting muscle. Spells will only take you so far, and I expect you to be both might and magic, if I am going to have a use for you here.~ + a2784
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] The gods provide you with spells, but you have to be strong enough to carry the gear and protect yourself. If you don't like it, take it up with them. Until then, stop crying about it.~ + a2784
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] You said getting up on a horse makes you a much larger target, and that flying opponents are much more vulnerable. Don't cry when I actually take your advice... be thankful I acknowledge that you are useful to me, in a minor way.~ + a2784
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] Have you seen any horses to buy, or carpets to steal? Have you ever managed to cast a levitate spell that lasts for hours on end and doesn't subject us to the first strong wind blowing us into a ravine?~ + a2784
  ++ ~[PC] Stop thinking. It makes it harder for me to control you, and therefore makes you less useful to my goals. I like you, Aran. I wouldn't want to have to get rid of you.~ + a2784
  ++ ~[PC] Absolutely. You are learning. I have high hopes, for you, Aran. Either you will be a valuable asset, or a strong rival. I look forward to the day when you finally grow a spine, and I get to crush you back into submission.~ EXIT
END

IF ~~ a2784
  SAY ~[ARAN] You do have a good point there. I think I'd best be shuttin' up an' gettin' back to th' job at hand.~
  IF ~~ THEN EXIT
END

IF ~~ a2785
  SAY ~[ARAN] It be a real surprise you survived that place. I like a simpler way o' sayin' it... 'Don't bother complaining - just fix it, kill it, or ignore it, and move on'.~
  = ~[ARAN] (mutter) Blighted hells... 'Let not th' Shar-kissed book-looker get <PRO_HISHER> panties in a twist, or <PRO_HESHE will blighted well use Cyric-Buggerin' fancy-pants phraseology an' bore th' livin' daylights out o' th' poor sod who just doesn't want his feet to hurt so bad...~
  IF ~~ THEN EXIT
END

IF ~~ a2786
  SAY ~[C-ARAN] Aye... it be all fun an' games, until th' wyrm strikes and we find ourselves a mite toasty main course! But on that walkin' thing...~
  IF ~~ THEN GOTO a2770
END

 IF ~~ a2787
  SAY ~[C-ARAN] Now that be a right fine thought. Makes this armor feel a mite constrainin', but it still be one blighted wonderful thought. But on that walkin' thing...~
  IF ~~ THEN GOTO a2770
END

IF ~~ a2788
  SAY ~[C-ARAN] I could do that. Only I might have a mite bit o' trouble carryin' on, as I would want to stop every few paces an' kiss th' livin' daylights out o' you. But on that walkin' thing...~
  IF ~~ THEN GOTO a2770
END

IF ~~ a2789
  SAY ~[C-ARAN] I'd be right happy to, but I have enough gear on right now that it would be a sorry sight, me staggerin' around. Tell you what, next time we see a nice meadow, we'll try it out. Mayhap somethin' else will happen, too. But on that walkin' thing...~
  IF ~~ THEN GOTO a2770
END

IF ~~ a2799 /* ELF */
  SAY ~[C-ARAN] N'Tel’Quessir n'iarelia vodi Tel’Quessir, amin arwin alcarinqua vanima roche.~
  ++ ~[PC] You just blended three different Elven dialects, mispronounced 'horse', and I think in Waterdeep slang you may have just called me your gloriously beautiful sex toy. Perhaps you should quit while you still have a foot to put in your mouth.~ + a2784
  ++ ~[PC] No, non-elves do not usually ride elves. Something about weight, body size, and general politeness. But you wanted alternatives to walking...~ + a2784
  + ~GlobalGT("c-aranintimate","GLOBAL",1) GlobalLT("c-aranintimate","GLOBAL",4)~ + ~[PC] The way you said that, it sounded like you want to escalate our relationship a bit, but are worried I might not say yes because you are a human, and I am an elf. Let me worry about both of those things, please.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] Hmmmm. I think we have actually done that, if I recall... you were very, very happy.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] True. Unless you work it around the other way, in which case I think we have done that... you were very, very happy.~ + a2784
  ++ ~[PC] You are so cute when you try to speak my language!~ + a2806
  ++ ~[PC] I don't mind, really. Hop on, and I will carry you.~ + a2806
END

IF ~~ a2800 /* HUMAN */
  SAY ~[C-ARAN] Well, now, a lad don't usually go about ridin' his lady's back, an'... blighted hells, that came out all wrong, didn't it?~
  ++ ~[PC] Why, Aran, you naughty boy. Did you just make a sly innuendo? Perhaps you should quit while you still have a foot to put in your mouth.~ + a2784
  ++ ~[PC] No, you probably would look a little silly. Something about weight, body size, and general politeness. But you wanted alternatives to walking...~ + a2784
  + ~GlobalGT("c-aranintimate","GLOBAL",1) GlobalLT("c-aranintimate","GLOBAL",4)~ + ~[PC] The way you said that, it sounded like you want to escalate our relationship a bit, but are worried I might not say yes. There is no harm in asking, you know.~ + a2806
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] Hmmmm. I think we have actually done that, if I recall... you were very, very happy.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] True. Unless you work it around the other way, in which case I think we have done that... you were very, very happy.~ + a2784
  ++ ~[PC] Never doubt the strength of a determined woman. Or stand between her and chocolate.~ + a2806
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] I don't mind, really. Hop on, and I will carry you.~ + a2806
END

IF ~~ a2801 /* DWARF */
  SAY ~[C-ARAN] Well, now, a lad don't usually go about ridin' his lady's back, an' there be a mite bit o' a size difference... blighted hells, that came out all wrong, didn't it?~
  ++ ~[PC] Why, Aran, you naughty boy. Did you just make a sly innuendo? Perhaps you should quit while you still have a foot to put in your mouth.~ + a2784
  ++ ~[PC] No, you probably would look a little silly. Something about weight, body size, and general politeness. But you wanted alternatives to walking...~ + a2784
  + ~GlobalGT("c-aranintimate","GLOBAL",1) GlobalLT("c-aranintimate","GLOBAL",4)~ + ~[PC] The way you said that, it sounded like you want to escalate our relationship a bit, but are worried I might not say yes because you are a human, and I am dwarven. Let me worry about that, please.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] Hmmmm. I think we have actually done that, if I recall... you were very, very happy.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] True. Unless you work it around the other way, in which case I think we have done that... you were very, very happy.~ + a2784
  ++ ~[PC] Never doubt the strength of a determined woman. Or stand between her and a precious stone.~ + a2806
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] I don't mind, really. Hop on, and I will carry you. Dwarven women are strong enough inside and out to hold the caverns of Toril on their shoulders.~ + a2806
END

IF ~~ a2802 /* HALFORC */
  SAY ~[C-ARAN] Well, now, a lad don't usually go about ridin' his lady's back, an' then... blighted hells, that came out all wrong, didn't it?~
  ++ ~[PC] Why, Aran, you naughty boy. Did you just make a sly innuendo? Perhaps you should quit while you still have a foot to put in your mouth.~ + a2784
  ++ ~[PC] No, you probably would look a little silly. Something about weight, body size, and general politeness. But you wanted alternatives to walking...~ + a2784
  + ~GlobalGT("c-aranintimate","GLOBAL",1) GlobalLT("c-aranintimate","GLOBAL",4)~ + ~[PC] The way you said that, it sounded like you want to escalate our relationship a bit, but are worried I might not say yes because you are a human, and I have orcish blood. Try me.~ + a2806
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] Hmmmm. I think we have actually done that, if I recall... you were very, very happy.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] True. Unless you work it around the other way, in which case I think we have done that... you were very, very happy.~ + a2784
  ++ ~[PC] Never doubt the strength of a determined woman.~ + a2806
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  + ~GlobalGT("c-aranintimate","GLOBAL",1) GlobalLT("c-aranintimate","GLOBAL",4)~ + ~[PC] I don't mind, really. Hop on, and I will carry you. Apparently, I have hidden untapped depths.~ + a2806
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] I don't mind, really. Hop on, and I will carry you. Apparently I have hidden untapped depths... oops. That came out wrong, didn't it?~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] I don't mind, really. Hop on, and I will carry you. Apparently I have hidden untapped depths....~ + a2875
END

IF ~~ a2803 /* GNOME */
  SAY ~[C-ARAN] Well, now, a lad don't usually go about ridin' his lady's back, an' there be a mite bit o' a size difference... blighted hells, that came out all wrong, didn't it?~
  ++ ~[PC] Why, Aran, you naughty boy. Did you just make a sly innuendo? Perhaps you should quit while you still have a foot to put in your mouth.~ + a2784
  ++ ~[PC] No, you probably would look a little silly. Something about weight, body size, and general politeness. But you wanted alternatives to walking...~ + a2784
  + ~GlobalGT("c-aranintimate","GLOBAL",1) GlobalLT("c-aranintimate","GLOBAL",4)~ + ~[PC] The way you said that, it sounded like you want to escalate our relationship a bit, but are worried I might not say yes because you are a human, and I am a gnome. Let me worry about both of those things, please.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] Hmmmm. I think we have actually done that, if I recall... you were very, very happy.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] True. Unless you work it around the other way, in which case I think we have done that... you were very, very happy.~ + a2784
  ++ ~[PC] Never doubt the strength of a determined woman. Or stand between her and a precious stone, or anything that resembles a stalagmite...~ + a2806
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] I don't mind, really. Hop on, and I will carry you. Gnomish women are strong enough inside and out to hold the line with Gnomish men. You haven't seen stubborn until you have to tell your cousin that it is an hour past dinnertime and he has to put his tools away for the night...~ + a2806
END

IF ~~ a2804 /* HALFLING */
  SAY ~[C-ARAN] Well, now, a lad don't usually go about ridin' his lady's back, an' there be a mite bit o' a size difference... blighted hells, that came out all wrong, didn't it?~
  ++ ~[PC] Why, Aran, you naughty boy. Did you just make a sly innuendo? Perhaps you should quit while you still have a foot to put in your mouth.~ + a2784
  ++ ~[PC] No, you probably would look a little silly. Something about weight, body size, and general politeness. But you wanted alternatives to walking...~ + a2784
  + ~GlobalGT("c-aranintimate","GLOBAL",1) GlobalLT("c-aranintimate","GLOBAL",4)~ + ~[PC] The way you said that, it sounded like you want to escalate our relationship a bit, but are worried I might not say yes because you are a human, and I am a halfling. Let me worry about both of those things, please.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] Hmmmm. I think we have actually done that, if I recall... you were very, very happy.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] True. Unless you work it around the other way, in which case I think we have done that... you were very, very happy.~ + a2784
  ++ ~[PC] Never doubt the strength of a determined woman. Or stand between her and something she covets.~ + a2806
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] I don't mind, really. Hop on, and I will carry you. Halfling women may look small, but we always have a trick or two up our sleeves.~ + a2806
END

IF ~~ a2805 /* HALF_ELF */
  SAY ~[C-ARAN] Well, now, a lad don't usually go about ridin' his lady's back, an' there be a mite bit o' a size difference... blighted hells, that came out all wrong, didn't it?~
  ++ ~[PC] Why, Aran, you naughty boy. Did you just make a sly innuendo? Perhaps you should quit while you still have a foot to put in your mouth.~ + a2784
  ++ ~[PC] No, you probably would look a little silly. Something about weight, body size, and general politeness. But you wanted alternatives to walking...~ + a2784
  + ~GlobalGT("c-aranintimate","GLOBAL",1) GlobalLT("c-aranintimate","GLOBAL",4)~ + ~[PC] The way you said that, it sounded like you want to escalate our relationship a bit, but are worried I might not say yes. Something about 'The human and the <PRO_RACE>' is just so cliche. Let me worry about that, please.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] Hmmmm. I think we have actually done that, if I recall... you were very, very happy.~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] True. Unless you work it around the other way, in which case I think we have done that... you were very, very happy.~ + a2784
  ++ ~[PC] Never doubt the strength of a determined woman. Better yet, never doubt me, regardless of my state of determination.~ + a2806
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  + ~GlobalGT("c-aranintimate","GLOBAL",1) GlobalLT("c-aranintimate","GLOBAL",4)~ + ~[PC] I don't mind, really. Hop on, and I will carry you. I have the strength of both human and elven blood flowing in my veins, and apparently I have hidden untapped depths.~ + a2806
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] I don't mind, really. Hop on, and I will carry you. I have the strength of both human and elven blood flowing in my veins, and apparently I have hidden untapped depths... oops. That came out wrong, didn't it?~ + a2784
  + ~Global("c-aranintimate","GLOBAL",4)~ + ~[PC] I don't mind, really. Hop on, and I will carry you. I have the strength of both human and elven blood flowing in my veins, and apparently I have hidden untapped depths...~ + a2875
END

IF ~~ a2806
  SAY  ~[ARAN] I just got a mental image o' you hoistin' me over your head wi' one hand, an' daintily blowin' on your other hand's fingernails, yawnin' at th' next monster we encounter.~
  ++ ~[PC] Stranger things than that have already happened to us.~ + a2784
  ++ ~[PC] A few spells, a Belt of Giant Strength, and I might do more than just lift you up. Aran-tossing contest, anyone? Things could get very interesting...~ + a2784
  ++ ~[PC] I many not have always know what I really am capable of, but so far I seem to be doing the unexpected on a daily basis!~ + a2784
  ++ ~[PC] We need to concentrate on basics. Feeding and protecting animals, securing magical items, all of that distracts from our mission. We can't expend magic on things that we can do with our own two feet.~ + a2784
  ++ ~[PC] I think I would much rather you carry me. I think I would be very happy and safe in your arms.~ + a2784
  ++ ~[PC] Oh, you are so silly!~ + a2784
END

IF ~~ a2807
  SAY ~[ARAN] Now look who be makin' sly innuendo! Your depths might be untapped, but by Sune's Lips it is not for th' lack o' me tryin!~
  IF ~~ THEN GOTO a2806
END

IF ~~ a2875
  SAY ~[ARAN] Now look who be makin' sly innuendo! I do think we done explored some o' those depths, m'lady. Unless all that noise you were makin' was snorin'?~
  IF ~~ THEN GOTO a2806
END

END /* append C-ARN25J */

/* BEGIN C-ARN25P is covered in initial dialog compilation. */

/* Sending the NPC home from the Pocket Plane, and bringing them back */
/* courtesy of berelinde, using Homeward Bound code */

EXTEND_BOTTOM FATESP 6
+ ~InParty("c-aran") InMyArea("c-aran") !StateCheck("c-aran",CD_STATE_NOTVALID)~ + ~Send Aran Whitehand home to Amn.~ DO ~SetGlobal("c-aransenthome","GLOBAL",1)
  ActionOverride("c-aran",SetGlobal("KickedOut","LOCALS",1))
  ActionOverride("c-aran",SetLeavePartyDialogFile())
  ActionOverride("c-aran",ChangeAIScript("",DEFAULT))
  ActionOverride("c-aran",LeaveParty())
  ActionOverride("c-aran",GivePartyAllEquipment())
  ActionOverride("c-aran",MakeGlobal())
  Wait(1)
  CreateVisualEffectObject("SPDIMNDR","c-aran")
  Wait(4)
  MoveGlobal("AR0607","c-aran",[272.294])~ EXIT
+ ~Global("c-aransenthome","GLOBAL",1)~ + ~Bring Aran Whitehand back from Amn.~ DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
  Wait(2)
  MoveGlobal("AR4500","c-aran",[1999.1228])
  Wait(1)~ + 8
END

APPEND C-ARN25P

/* just kicked out via "reform party" button = no global set. */
IF ~Global("KickedOut","LOCALS",0)~ THEN BEGIN a2753
  SAY ~[ARAN] Do you be certain you want me to go?~
  + ~RandomNum(3,1) !AreaCheck("AR4500")~ + ~[PC] Not right now. I might be back later, though. Stay right here and wait for me.~  DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1632
  + ~RandomNum(3,2) !AreaCheck("AR4500")~ + ~[PC] Not right now. I might be back later, though. Stay right here and wait for me.~  DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1633
  + ~RandomNum(3,3) !AreaCheck("AR4500")~ + ~[PC] Not right now. I might be back later, though. Stay right here and wait for me.~  DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1640 /* c-aranrejoin2tob */
  + ~!AreaCheck("AR5003") !AreaCheck("AR0301") !AreaCheck("AR0302") !AreaCheck("AR0303") !AreaCheck("AR0304") !AreaCheck("AR0305") !AreaCheck("AR0306") !AreaCheck("AR0307") !AreaCheck("AR0509") !AreaCheck("AR0510") !AreaCheck("AR0511") !AreaCheck("AR1102") !AreaCheck("AR1107") !AreaCheck("AR0801") !AreaCheck("AR0803") !AreaCheck("AR1300") !AreaCheck("AR1301") !AreaCheck("AR1302") !AreaCheck("AR1303") !AreaCheck("AR0601") !AreaCheck("AR0602") !AreaCheck("AR0603") !AreaCheck("AR0604") !AreaCheck("AR0605") !AreaCheck("AR0606") !AreaCheck("AR3000") !AreaCheck("AR3001") !AreaCheck("AR3003") !AreaCheck("AR3004") !AreaCheck("AR3005") !AreaCheck("AR3006") !AreaCheck("AR3007") !AreaCheck("AR3008") !AreaCheck("AR3009") !AreaCheck("AR3010") !AreaCheck("AR3011") !AreaCheck("AR3012") !AreaCheck("AR3013") !AreaCheck("AR3014") !AreaCheck("AR3015") !AreaCheck("AR3016") !AreaCheck("AR3017") !AreaCheck("AR3018") !AreaCheck("AR3019") !AreaCheck("AR3020") !AreaCheck("AR3021") !AreaCheck("AR3022") !AreaCheck("AR3023") !AreaCheck("AR3024") !AreaCheck("AR3025") !AreaCheck("AR3026") !AreaCheck("AR3027")~ + ~[PC] Why don't you find a good inn and wait for us there? Perhaps in Saradush?~ DO ~SetGlobal("KickedOut","LOCALS",1)~  + a1639 /* c-aranwaitsaradush  tob  <<POSSIBLE_TO_LEAVE>> */
  + ~!AreaCheck("AR5003") OR(51) AreaCheck("AR0301") AreaCheck("AR0302") AreaCheck("AR0303") AreaCheck("AR0304") AreaCheck("AR0305") AreaCheck("AR0306") AreaCheck("AR0307") AreaCheck("AR0509") AreaCheck("AR0510") AreaCheck("AR0511") AreaCheck("AR1102") AreaCheck("AR1107") AreaCheck("AR0801") AreaCheck("AR0803") AreaCheck("AR1300") AreaCheck("AR1301") AreaCheck("AR1302") AreaCheck("AR1303") AreaCheck("AR0601") AreaCheck("AR0602") AreaCheck("AR0603") AreaCheck("AR0604") AreaCheck("AR0605") AreaCheck("AR0606") AreaCheck("AR3000") AreaCheck("AR3001") AreaCheck("AR3003") AreaCheck("AR3004") AreaCheck("AR3005") AreaCheck("AR3006") AreaCheck("AR3007") AreaCheck("AR3008") AreaCheck("AR3009") AreaCheck("AR3010") AreaCheck("AR3011") AreaCheck("AR3012") AreaCheck("AR3013") AreaCheck("AR3014") AreaCheck("AR3015") AreaCheck("AR3016") AreaCheck("AR3017") AreaCheck("AR3018") AreaCheck("AR3019") AreaCheck("AR3020") AreaCheck("AR3021") AreaCheck("AR3022") AreaCheck("AR3023") AreaCheck("AR3024") AreaCheck("AR3025") AreaCheck("AR3026") AreaCheck("AR3027")~ + ~[PC] Why don't you find a good inn and wait for us there? Perhaps in Saradush?~ DO ~SetGlobal("KickedOut","LOCALS",1)~  + a1630 /* c-araninnimpossibletob  <<IMPOSSIBLE_TO_LEAVE>> */
  + ~!AreaCheck("AR5501") !AreaCheck("AR0301") !AreaCheck("AR0302") !AreaCheck("AR0303") !AreaCheck("AR0304") !AreaCheck("AR0305") !AreaCheck("AR0306") !AreaCheck("AR0307") !AreaCheck("AR0509") !AreaCheck("AR0510") !AreaCheck("AR0511") !AreaCheck("AR1102") !AreaCheck("AR1107") !AreaCheck("AR0801") !AreaCheck("AR0803") !AreaCheck("AR1300") !AreaCheck("AR1301") !AreaCheck("AR1302") !AreaCheck("AR1303") !AreaCheck("AR0601") !AreaCheck("AR0602") !AreaCheck("AR0603") !AreaCheck("AR0604") !AreaCheck("AR0605") !AreaCheck("AR0606") !AreaCheck("AR3000") !AreaCheck("AR3001") !AreaCheck("AR3003") !AreaCheck("AR3004") !AreaCheck("AR3005") !AreaCheck("AR3006") !AreaCheck("AR3007") !AreaCheck("AR3008") !AreaCheck("AR3009") !AreaCheck("AR3010") !AreaCheck("AR3011") !AreaCheck("AR3012") !AreaCheck("AR3013") !AreaCheck("AR3014") !AreaCheck("AR3015") !AreaCheck("AR3016") !AreaCheck("AR3017") !AreaCheck("AR3018") !AreaCheck("AR3019") !AreaCheck("AR3020") !AreaCheck("AR3021") !AreaCheck("AR3022") !AreaCheck("AR3023") !AreaCheck("AR3024") !AreaCheck("AR3025") !AreaCheck("AR3026") !AreaCheck("AR3027")~ + ~[PC] Why don't you find a good inn and wait for us there? I hear there is an inn somewhere around Amkethran...~ DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1638 /* c-aranwaitsamkethrantob   <<POSSIBLE_TO_LEAVE>> */
  + ~!AreaCheck("AR5501") OR(51) AreaCheck("AR0301") AreaCheck("AR0302") AreaCheck("AR0303") AreaCheck("AR0304") AreaCheck("AR0305") AreaCheck("AR0306") AreaCheck("AR0307") AreaCheck("AR0509") AreaCheck("AR0510") AreaCheck("AR0511") AreaCheck("AR1102") AreaCheck("AR1107") AreaCheck("AR0801") AreaCheck("AR0803") AreaCheck("AR1300") AreaCheck("AR1301") AreaCheck("AR1302") AreaCheck("AR1303") AreaCheck("AR0601") AreaCheck("AR0602") AreaCheck("AR0603") AreaCheck("AR0604") AreaCheck("AR0605") AreaCheck("AR0606") AreaCheck("AR3000") AreaCheck("AR3001") AreaCheck("AR3003") AreaCheck("AR3004") AreaCheck("AR3005") AreaCheck("AR3006") AreaCheck("AR3007") AreaCheck("AR3008") AreaCheck("AR3009") AreaCheck("AR3010") AreaCheck("AR3011") AreaCheck("AR3012") AreaCheck("AR3013") AreaCheck("AR3014") AreaCheck("AR3015") AreaCheck("AR3016") AreaCheck("AR3017") AreaCheck("AR3018") AreaCheck("AR3019") AreaCheck("AR3020") AreaCheck("AR3021") AreaCheck("AR3022") AreaCheck("AR3023") AreaCheck("AR3024") AreaCheck("AR3025") AreaCheck("AR3026") AreaCheck("AR3027")~ + ~[PC] Why don't you find a good inn and wait for us there? I hear there is an inn somewhere around Amkethran...~ DO ~SetGlobal("KickedOut","LOCALS",1)~ + a1630 /* c-araninnimpossibletob <<IMPOSSIBLE_TO_LEAVE>> */
  ++ ~[PC] Actually, I've changed my mind. Stay with the party.~ DO ~SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~AreaCheck("AR4500")~ + ~I'm sure.~ DO ~SetGlobal("KickedOut","LOCALS",1) MoveToPointNoInterrupt([1799.1358]) Face(14)~ EXIT
  ++ ~[PC] Actually, I wanted to talk to you about how things are between us.~ + a3223
  + ~OR(2)AreaCheck("AR5003") AreaCheck("AR5501")~ + ~[PC] Stay here, and don't gather any attention to yourself. That means no fighting, no drinking to excess, and no wenching.~ DO ~SetGlobal("KickedOut","LOCALS",1)~ EXIT
  + ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + ~[PC] I'm sure. Just wait right here, for now.~ DO ~SetGlobal("KickedOut","LOCALS",1)~ EXIT
  + ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ + ~[PC] I am sending you back to the Pocket Plane, Aran. I need you there right now.~ DO ~SetGlobal("KickedOut","LOCALS",1)
  CreateVisualEffectObject("SPDIMNDR",Myself)
  Wait(2)
  MoveBetweenAreas("AR4500",[1799.1358],14)~ EXIT
END

/* AR4500 = pocketplane || AR5003 = Saradush Inn || AR5501 = Amkethran Inn */

/* Adding a special dialog to the 25P for NPCs sent home from the Pocket Plane */
IF ~Global("c-aransenthome","GLOBAL",1) Global("KickedOut","LOCALS",1)~ THEN BEGIN a1641
  SAY ~[ARAN] Aye then, <CHARNAME>. What's th' word? You need me?~
  ++ ~[PC] Yes, come with me, Aran.~ DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] Gods help me, I actually need your fighting skills. You had better come along.~  DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] It pains me to say it, but your magic is a necessary part of my party. Come on, and don't dawdle.~ DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] Stop pickpocketing me, and you can come along.~ DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",BARD_ALL)~ + ~[PC] I need your lore and inspiring oratory, Aran. Just please stop the whole 'try to teach yourself a stringed instrument" thing. It sounds like cats being thrown in a shower.~ DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",RANGER_ALL)~ + ~[PC] Come on. I seem to have need of your tracking skills. Notice I said "tracking", not "talking"...~ DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~Class("c-aran",SORCERER)~ + ~[PC] You are gaining enough power as a sorcerer that you might actually be useful. Come on, I need you.~ DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  + ~OR(2) Class("c-aran",CLERIC_ALL) Class("c-aran",PALADIN_ALL)~ + ~[PC] I need a healer, and you fit the bill. Gear up, boyo... we are heading out.~ DO ~SetGlobal("c-aransenthome","GLOBAL",0) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  ++ ~[PC] Actually, I wanted to talk to you about how things are between us.~ DO ~SetGlobal("c-aransenthome","GLOBAL",0)~ + a3223
  ++ ~[PC] Quit whining, and toughen up. I will tell you when I need you.~ DO ~SetGlobal("c-aransenthome","GLOBAL",0)~ + a1635
  + ~RandomNum(3,1)~ + ~[PC] Actually, wait here awhile longer, Aran. I need you close by.~ DO ~SetGlobal("c-aransenthome","GLOBAL",0)~ + a1635
  + ~RandomNum(3,2)~ + ~[PC] Actually, wait here awhile longer, Aran. I need you close by.~ DO ~SetGlobal("c-aransenthome","GLOBAL",0)~ + a1636
  + ~RandomNum(3,3)~ + ~[PC] Actually, wait here awhile longer, Aran. I need you close by.~ DO ~SetGlobal("c-aransenthome","GLOBAL",0)~ + a1637
END

/* Pocketplane Rejoin */
IF ~Global("KickedOut","LOCALS",1) AreaCheck("AR4500")~ THEN BEGIN a1629
  SAY ~[ARAN] Aye, I be listenin'. Do you want me along? There's naught to do here worth doin'.~
  ++ ~[PC] Come on, Aran. We are off to have yet another battle.~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] Gods help me, I actually need your fighting skills. You had better come along.~  DO ~JoinParty()~ EXIT
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] It pains me to say it, but your magic is a necessary part of my party. Come on, and don't dawdle.~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] Stop pickpocketing me, and you can come along.~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",BARD_ALL)~ + ~[PC] I need your lore and inspiring oratory, Aran. Just please stop the whole 'try to teach yourself a stringed instrument by reading old manuscripts' thing. It sounds like cats being thrown in a shower.~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",RANGER_ALL)~ + ~[PC] Come on. I seem to have need of your tracking skills. Notice I said "tracking", not "talking"...~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",SORCERER)~ + ~[PC] You are gaining enough power as a sorcerer that you might actually be useful. Come on, I need you.~ DO ~JoinParty()~ EXIT
  + ~OR(2) Class("c-aran",CLERIC_ALL) Class("c-aran",PALADIN_ALL)~ + ~[PC] I need a healer, and you fit the bill. Gear up, boyo... we are heading out.~ DO ~JoinParty()~ EXIT
  ++ ~[PC] Actually, I wanted to talk to you about how things are between us.~ + a3223
  ++ ~[PC] Not right now, thanks.~ + a1640
  ++ ~[PC] Well, I came back to this oh-so-pleasant place, and I came over here to talk to you. Do you think it was because I wanted a status report on the massive amount of things going on around here?~ + a1642 /* smartalekrejointob */
END

/* Saradush or Amkethran Rejoin */
IF ~Global("KickedOut","LOCALS",1) OR(2) AreaCheck("AR5003") AreaCheck("AR5501")~ THEN BEGIN a1631
  SAY ~[ARAN] I can keep myself a mite busy by drinkin', here, but I'd rather be fightin' alongside you. Take me along?~
  ++ ~[PC] Of course. Join up, so we can go save the world.~ DO ~SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  ++ ~[PC] Not right now. I might be back later, though.~ + a1632
  ++ ~[PC] Actually, I wanted to talk to you about how things are between us.~ + a3223
  ++ ~[PC] Stay here, and don't gather any attention to yourself. That means no fighting, no drinking to excess, and no wenching.~ DO ~SetGlobal("KickedOut","LOCALS",1)~ EXIT
  + ~!AreaCheck("AR5003")~ + ~[PC] Why don't you find a good inn and wait for us there? Perhaps in Saradush?~ + a1639 /*  c-aranwaitsaradushtob  <<POSSIBLE_TO_LEAVE>> */  
  + ~!AreaCheck("AR5501")~ + ~[PC] Why don't you find a good inn and wait for us there? I hear there is an inn somewhere around Amkethran...~ + a1638 /* c-aranwaitsamkethrantob  <<POSSIBLE_TO_LEAVE>> */
  ++ ~[PC] I am sending you back to the Pocket Plane, Aran. I need you there right now.~ DO ~SetGlobal("KickedOut","LOCALS",1)
  CreateVisualEffectObject("SPDIMNDR",Myself)
  Wait(2)
  MoveBetweenAreas("AR4500",[1799.1358],14)~ EXIT
END

/* Any Other Area Rejoin */
IF ~Global("KickedOut","LOCALS",1) !AreaCheck("AR4500") !AreaCheck("AR5003") !AreaCheck("AR5501")~ THEN BEGIN a1643
  SAY ~[ARAN] Right, then. There you are. There's naught for me to do here, an' I'd rather be fightin' alongside you. Take me along?~ [c-aws133]
  ++ ~[PC] Of course. Join up, so we can go save the world.~ DO ~SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
  ++ ~[PC] Actually, I wanted to talk to you about how things are between us.~ + a3223
  + ~RandomNum(3,1)~ + ~[PC] Not right now. I might be back later, though. Stay right here and wait for me.~ + a1632
  + ~RandomNum(3,2)~ + ~[PC] Not right now. I might be back later, though. Stay right here and wait for me.~ + a1633
  + ~RandomNum(3,3)~ + ~[PC] Not right now. I might be back later, though. Stay right here and wait for me.~ + a1640 /* c-aranrejoin2tob */
  + ~!AreaCheck("AR0301") !AreaCheck("AR0302") !AreaCheck("AR0303") !AreaCheck("AR0304") !AreaCheck("AR0305") !AreaCheck("AR0306") !AreaCheck("AR0307") !AreaCheck("AR0509") !AreaCheck("AR0510") !AreaCheck("AR0511") !AreaCheck("AR1102") !AreaCheck("AR1107") !AreaCheck("AR0801") !AreaCheck("AR0803") !AreaCheck("AR1300") !AreaCheck("AR1301") !AreaCheck("AR1302") !AreaCheck("AR1303") !AreaCheck("AR0601") !AreaCheck("AR0602") !AreaCheck("AR0603") !AreaCheck("AR0604") !AreaCheck("AR0605") !AreaCheck("AR0606") !AreaCheck("AR3000") !AreaCheck("AR3001") !AreaCheck("AR3003") !AreaCheck("AR3004") !AreaCheck("AR3005") !AreaCheck("AR3006") !AreaCheck("AR3007") !AreaCheck("AR3008") !AreaCheck("AR3009") !AreaCheck("AR3010") !AreaCheck("AR3011") !AreaCheck("AR3012") !AreaCheck("AR3013") !AreaCheck("AR3014") !AreaCheck("AR3015") !AreaCheck("AR3016") !AreaCheck("AR3017") !AreaCheck("AR3018") !AreaCheck("AR3019") !AreaCheck("AR3020") !AreaCheck("AR3021") !AreaCheck("AR3022") !AreaCheck("AR3023") !AreaCheck("AR3024") !AreaCheck("AR3025") !AreaCheck("AR3026") !AreaCheck("AR3027")~ + ~[PC] Why don't you find a good inn and wait for us there? Perhaps in Saradush?~ + a1639 /* c-aranwaitsaradushtob <<POSSIBLE_TO_LEAVE>> */
  + ~OR(51) AreaCheck("AR0301") AreaCheck("AR0302") AreaCheck("AR0303") AreaCheck("AR0304") AreaCheck("AR0305") AreaCheck("AR0306") AreaCheck("AR0307") AreaCheck("AR0509") AreaCheck("AR0510") AreaCheck("AR0511") AreaCheck("AR1102") AreaCheck("AR1107") AreaCheck("AR0801") AreaCheck("AR0803") AreaCheck("AR1300") AreaCheck("AR1301") AreaCheck("AR1302") AreaCheck("AR1303") AreaCheck("AR0601") AreaCheck("AR0602") AreaCheck("AR0603") AreaCheck("AR0604") AreaCheck("AR0605") AreaCheck("AR0606") AreaCheck("AR3000") AreaCheck("AR3001") AreaCheck("AR3003") AreaCheck("AR3004") AreaCheck("AR3005") AreaCheck("AR3006") AreaCheck("AR3007") AreaCheck("AR3008") AreaCheck("AR3009") AreaCheck("AR3010") AreaCheck("AR3011") AreaCheck("AR3012") AreaCheck("AR3013") AreaCheck("AR3014") AreaCheck("AR3015") AreaCheck("AR3016") AreaCheck("AR3017") AreaCheck("AR3018") AreaCheck("AR3019") AreaCheck("AR3020") AreaCheck("AR3021") AreaCheck("AR3022") AreaCheck("AR3023") AreaCheck("AR3024") AreaCheck("AR3025") AreaCheck("AR3026") AreaCheck("AR3027")~ + ~[PC] Why don't you find a good inn and wait for us there? Perhaps in Saradush?~ + a1630 /* c-araninnimpossibletob  <<IMPOSSIBLE_TO_LEAVE>> */
  + ~!AreaCheck("AR5501") !AreaCheck("AR0301") !AreaCheck("AR0302") !AreaCheck("AR0303") !AreaCheck("AR0304") !AreaCheck("AR0305") !AreaCheck("AR0306") !AreaCheck("AR0307") !AreaCheck("AR0509") !AreaCheck("AR0510") !AreaCheck("AR0511") !AreaCheck("AR1102") !AreaCheck("AR1107") !AreaCheck("AR0801") !AreaCheck("AR0803") !AreaCheck("AR1300") !AreaCheck("AR1301") !AreaCheck("AR1302") !AreaCheck("AR1303") !AreaCheck("AR0601") !AreaCheck("AR0602") !AreaCheck("AR0603") !AreaCheck("AR0604") !AreaCheck("AR0605") !AreaCheck("AR0606") !AreaCheck("AR3000") !AreaCheck("AR3001") !AreaCheck("AR3003") !AreaCheck("AR3004") !AreaCheck("AR3005") !AreaCheck("AR3006") !AreaCheck("AR3007") !AreaCheck("AR3008") !AreaCheck("AR3009") !AreaCheck("AR3010") !AreaCheck("AR3011") !AreaCheck("AR3012") !AreaCheck("AR3013") !AreaCheck("AR3014") !AreaCheck("AR3015") !AreaCheck("AR3016") !AreaCheck("AR3017") !AreaCheck("AR3018") !AreaCheck("AR3019") !AreaCheck("AR3020") !AreaCheck("AR3021") !AreaCheck("AR3022") !AreaCheck("AR3023") !AreaCheck("AR3024") !AreaCheck("AR3025") !AreaCheck("AR3026") !AreaCheck("AR3027")~ + ~[PC] Why don't you find a good inn and wait for us there? I hear there is an inn somewhere around Amkethran...~ + a1638 /*  c-aranwaitsamkethrantob   <<POSSIBLE_TO_LEAVE>> */
  + ~!AreaCheck("AR5501") OR(51) AreaCheck("AR0301") AreaCheck("AR0302") AreaCheck("AR0303") AreaCheck("AR0304") AreaCheck("AR0305") AreaCheck("AR0306") AreaCheck("AR0307") AreaCheck("AR0509") AreaCheck("AR0510") AreaCheck("AR0511") AreaCheck("AR1102") AreaCheck("AR1107") AreaCheck("AR0801") AreaCheck("AR0803") AreaCheck("AR1300") AreaCheck("AR1301") AreaCheck("AR1302") AreaCheck("AR1303") AreaCheck("AR0601") AreaCheck("AR0602") AreaCheck("AR0603") AreaCheck("AR0604") AreaCheck("AR0605") AreaCheck("AR0606") AreaCheck("AR3000") AreaCheck("AR3001") AreaCheck("AR3003") AreaCheck("AR3004") AreaCheck("AR3005") AreaCheck("AR3006") AreaCheck("AR3007") AreaCheck("AR3008") AreaCheck("AR3009") AreaCheck("AR3010") AreaCheck("AR3011") AreaCheck("AR3012") AreaCheck("AR3013") AreaCheck("AR3014") AreaCheck("AR3015") AreaCheck("AR3016") AreaCheck("AR3017") AreaCheck("AR3018") AreaCheck("AR3019") AreaCheck("AR3020") AreaCheck("AR3021") AreaCheck("AR3022") AreaCheck("AR3023") AreaCheck("AR3024") AreaCheck("AR3025") AreaCheck("AR3026") AreaCheck("AR3027")~ + ~[PC] Why don't you find a good inn and wait for us there? I hear there is an inn somewhere around Amkethran...~ + a1630 /* c-araninnimpossibletob <<IMPOSSIBLE_TO_LEAVE>> */
  ++ ~[PC] I am sending you back to the Pocket Plane, Aran. I need you there right now.~ DO ~SetGlobal("KickedOut","LOCALS",1)
  CreateVisualEffectObject("SPDIMNDR",Myself)
  Wait(2)
  MoveBetweenAreas("AR4500",[1799.1358],14)~ EXIT
END

/* Impossible to go to an inn from here */
IF ~~ a1630
  SAY ~[ARAN] Aye, that would be a nice trick, now wouldn't it. I'd oblige, if I could, but you know right well I can't leave here alone. Enough wi' th' jokes, eh?~
  IF ~~ THEN EXIT
END
IF ~~ a1642
  SAY ~[ARAN] My, a mite bit snarky today, are we? Don't tell me... yet another impossibly convoluted schemin' bastard decided to give you a pain in th' neck. Come on, let me get my gear, an' we'll both go jam Bane's Bones up his arse.~
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ a1632 SAY ~[ARAN] Right, then. I'll just wait. The barmaid looks pretty fetchin' anyways.~ IF ~~ THEN EXIT END
IF ~~ a1633 SAY ~[ARAN] Right, then. I'll just wait. Didn't want to go on no Shar-kissed adventure, nohow. I'll go take a blighted nap an' be done wi' it.~ IF ~~ THEN EXIT END
IF ~~ a1635 SAY ~[ARAN] Aye, I'll wait. Tyr's Eye, I left th' blighted rolls o' silk behind. I had in mind to live like a king this time. Guess th' old bedroll will just have to do.~ IF ~~ THEN EXIT END
IF ~~ a1636 SAY ~[ARAN] Aye, I'll wait. Mask's Left hand, I left th' blighted cookin' spices behind. Oh well - there'll be some opportunity to restock sometime, I suppose.~ IF ~~ THEN EXIT END
IF ~~ a1637 SAY ~[ARAN] Aye, I'll wait. By the way, I'm feelin' a bit nekkid, an' all, on account o' bein' swooped up here wi' naught for gear. Lend a lad a sword, please, eh?~ IF ~~ THEN EXIT END
IF ~~ a1640 SAY ~[ARAN] Bane's Bones, I'd much rather fight a bit than sit around with a stick up my arse. But you call th' shots, <CHARNAME>. I'll be here when you need me.~ IF ~~ THEN EXIT END

IF ~~ a1639
  SAY ~[ARAN] Fine. I'll be waitin' at the pub in Saradush, when you need me. I think I can do some advance scoutin' ahead, or behind, or whatever.~
  IF ~~ THEN DO
  ~ActionOverride("c-aran",SetGlobal("KickedOut","LOCALS",1))
  ActionOverride("c-aran",SetLeavePartyDialogFile())
  ActionOverride("c-aran",ChangeAIScript("",DEFAULT))
  ActionOverride("c-aran",LeaveParty())
  ActionOverride("c-aran",EscapeAreaMove("AR5003",1074,707,5))~ EXIT
END

IF ~~ a1638
  SAY ~[ARAN] Fine. I'll be waitin' at the pub in Amkethran, when you need me.~
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
  SAY ~[ARAN] Now there be a neat trick. I go for a few drinks to figure out what th' nine hells I am supposed to be doin', on account o' you took off. I just get to thinkin', an' suddenly I be... where? Where in th' blighted...~
  + ~Alignment(Player1,MASK_GOOD)~ + ~[PC] I need your help, Aran. I need you to travel with me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2608
  + ~!Alignment(Player1,MASK_GOOD)~ + ~[PC] I need your help, Aran. I need you to travel with me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2609
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconscious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
/* Feywarden of Correlon */
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
  SAY ~[ARAN] Now there be a neat trick. I go for a few drinks to figure out what th' nine hells I am supposed to be doin', on account o' you took off. I just get to thinkin', an' suddenly I be... where? Where in th' blighted...~
  + ~Alignment(Player1,MASK_GOOD)~ + ~[PC] I need your help, Aran. I need you to travel with me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2608
  + ~!Alignment(Player1,MASK_GOOD)~ + ~[PC] I need your help, Aran. I need you to travel with me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2609
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ + a2611
  ++ ~[PC] It is nice to have a good friend watching my back. Just not too closely, please... I said 'friends', not 'woman to be hit on'.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  ++ ~[PC] You seemed much more interested in those twins, and how little of their chests were covered up in that leather armor. Not that I mind - it was very funny to watch you try to act suave and sophisticated.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
/* Feywarden of Correlon */
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
  SAY ~[ARAN] Now there be a neat trick. I go for a few drinks to figure out what th' nine hells I did wrong this time, an' you just up an' take off. I just get to thinkin', an' suddenly I be... where? Where in th' blighted...~
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD)~ + ~[PC] I summoned you here because I need you, but I need to be clear about us, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL)~ + ~[PC] I summoned you here because I need you, but I need to be clear about us, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL)~ + ~[PC] I summoned you here because I need you, but I need to be clear about us, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  ++ ~[PC] I need you here with me, but I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  ++ ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  ++ ~[PC] I need your help, but I also need you to keep a low profile. I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  ++ ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  ++ ~[PC] You didn't do anything wrong. I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
/* Feywarden of Correlon */
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

/* Feywarden of Correlon */
IF ~~ a2615
  SAY ~[ARAN] You blighted Feywardens be all th' same. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Corellon knows where.~
  ++ ~[PC] I am impressed. Swearing by Corellon? I didn't know you were hoping to be resurrected as Tel'Quessir. Should I mention in my prayers that you want to become one of the People?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* STRIFELEADER OF CYRIC */
IF ~~ a2616
  SAY ~[ARAN] Cyric-buggerin' Strifeleader. You should have done a bit more prayin'. Looks like ol' Bloody Bones has decided you need more random chaos an' murder in your life, an' now I get dragged along for th' ride.~
  ++ ~[PC] I am impressed. Calling on Cyric, and insulting His name directly? Should I mention in my prayers that you have joined the fold?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* PAINBEARER OF ILMATER */
IF ~~ a2617
  SAY ~[ARAN] You may be a blighted Painbearer, but I might want to actually enjoy life once or twice, an' not always be tryin' to outdo th' Cryin' God.~
  ++ ~[PC] Ilmater has a plan, Aran. But it sounds as if you question my faith. Should I mention in my prayers that you think my faith is more about personal achievement and less about alleviating the suffering of others?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* LOREKEEPER OF OGHMA - the Binder of What is Known, the Patron of Bards */
IF ~~ a2618
  SAY ~[ARAN] You blighted Lorekeepers be all th' same. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Oghma only knows where.~
  ++ ~[PC] I am impressed. Swearing by Oghma? I didn't know you were coming to see the light. Should I mention in my prayers that you have joined the fold?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* FIREWALKER OF KOSSUTH - evil - elemental fire - Thay : Global("c-firewalker","GLOBAL",1) */
IF ~~ a2619
  SAY ~[ARAN] You blighted Firewalkers be all th' same, carin' for not much but th' burn. I was restin' up proper, an' here you have to go get all lighted up an' on fire again.~
  ++ ~[PC] We come from the Fire, we go to the Fire. Why waste time questioning Kossuth's motives? Though you seem to have a good idea of what we believe. Should I mention in my prayers that you have joined the fold?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* SILVERSTAR OF SELUNE - Moonmaiden : */
IF ~~ a2620
  SAY ~[ARAN] Silverstars may have th' Moonmaiden in their corner, but when I look around this place, it looks like we won't be seein' much o' Her face any time soon.~
  ++ ~[PC] Selune will find us, even in this place.But I didn't know you were coming to see the light. Should I mention in my prayers that you have joined the fold?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* Holy Strategist of the Red Knight - Red Fellowship (only law)  */
IF ~~ a2621
  SAY ~[ARAN] I would o' thought a Holy Strategist wouldn't get caught wi' their trousers down an' all their parts exposed. You know, have some backup? One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to th' Red Lady only knows where.~
  ++ ~[PC] The Red Fellowship has had some bad miscalculations before. I seem to have done the same. Perhaps I need more study and prayer.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* NIGHTCLOAK OF SHAR - Dark Lady */
IF ~~ a2622
  SAY ~[ARAN] I thought I was used to all your Nightcloak ways, but Shar's Caress... one hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Shar only knows where.~
  ++ ~[PC] Shar's secrets are not to be shared with outsiders. Unless... should I mention in my prayers that you wish to join the fold?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* HEARTWARDER OF SUNE - Sune Firehair, Lady Firehair : Global("c-heartwarder","GLOBAL",1) */
IF ~~ a2623
  SAY ~[ARAN] Lady Firehair will be pleased as punch one o' Her Heartwarders be disappeared down some hole in th' nine hells. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Sune only knows where.~
  ++ ~[PC] We Heartwarders pursue beauty wherever we find it. We even find it in that thing you wear on your skull, and call a face. Shall we get you some help in that department?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* BATTLEGUARD OF TEMPUS - th' Foehammer (chaos) */
IF ~~ a2624
  SAY ~[ARAN] You blighted Battleguards don't think beyond th' edge o' an axe or hammer, do you? One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Tempus knows where.~
  ++ ~[PC] Why waste time waiting for you when I could get things done? Do you question the way of Tempus? I believe the best way to question is to engage me in battle...~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* Authlim of Iyachtu Xvim - the Godson */
IF ~~ a2625
  SAY ~[ARAN] You blighted Authlim be all th' same. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Xvim knows where. You bloody well know I'm no competition on th' shares o' any find. I'm just th' hired help.~
  ++ ~[PC] You of all people should realize that my motives are my own, and not for questioning. Do not mention Xvim unless you wish to serve him directly, and in that case, you would need to challenge me...~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* MORNINGLORD OF LATHANDER */
IF ~~ a2626
  SAY ~[ARAN] Morninglords may needs be shinin' th' Light into dark places, but by Lathander's Golden Poop, blighted well let a lad know where you be goin'. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to His Suniness knows where.~
  ++ ~[PC] Sunny-ness or Sune-i-ness, Aran? I never did get whom you venerate most. Did you want me to try to pray for some great spell to reverse time itself, and undo the past?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
 END
/* WATCHER OF HELM */
IF ~~ a2627
  SAY ~[ARAN] You blighted Watchers be all th' same. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Helm knows where. You bloody well know I'd be a help watchin' your back.~
  ++ ~[PC] Helm watches all things. Unfortunately, His followers are not quite omnipotent or omniscient. Or are you saying you have never made a mistake?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* STORMLORD OF TALOS */
IF ~~ a2628
  SAY ~[ARAN] You blighted well did it again. Look, I know you blighted Stormlords an' Stormladies all want to go around blastin' th' crap out o' th' universe, sewin' seeds o' chaos an' evil, but by Talos' Tempestuous Tresses, you should know by now that goin' wi' out backup is just stupid. Yet there you be. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to gods knows where.~
  ++ ~[PC] Why waste time waiting for you when I could get things done? Do you question the way of Talos? I believe the best way to question is to engage me in battle...~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  ++ ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  ++ ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  ++ ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  ++ ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END
/* Feywarden of Correlon */
IF ~~ a2632
  SAY ~[ARAN] You blighted Feywardens be all th' same. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Corellon knows where.~
  ++ ~[PC] I am impressed. Swearing by Corellon? I didn't know you were hoping to be resurrected as Tel'Quessir. Should I mention in my prayers that you want to become one of the People?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind all that. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* STRIFELEADER OF CYRIC */
IF ~~ a2633
  SAY ~[ARAN] Cyric-buggerin' Strifeleader. You should have done a bit more prayin'. Looks like ol' Bloody Bones has decided you need more random chaos an' murder in your life, an' now I get dragged along for th' ride.~
  ++ ~[PC] I am impressed. Calling on Cyric, and insulting His name directly? Should I mention in my prayers that you have joined the fold?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind all that. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* PAINBEARER OF ILMATER */
IF ~~ a2634
  SAY ~[ARAN] You may be a blighted Painbearer, but I might want to actually enjoy life once or twice, an' not always be tryin' to outdo th' Cryin' God.~
  ++ ~[PC] Ilmater has a plan, Aran. But it sounds as if you question my faith. Should I mention in my prayers that you think my faith is more about personal achievement and less about alleviating the suffering of others?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind all that. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* LOREKEEPER OF OGHMA - the Binder of What is Known, the Patron of Bards */
IF ~~ a2635
  SAY ~[ARAN] You blighted Lorekeepers be all th' same. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Oghma only knows where.~
  ++ ~[PC] I am impressed. Swearing by Oghma? I didn't know you were coming to see the light. Should I mention in my prayers that you have joined the fold?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* FIREWALKER OF KOSSUTH - evil - elemental fire - Thay : Global("c-firewalker","GLOBAL",1) */
IF ~~ a2636
  SAY ~[ARAN] You blighted Firewalkers be all th' same, carin' for not much but th' burn. I was restin' up proper, an' here you have to go get all lighted up an' on fire again.~
  ++ ~[PC] We come from the Fire, we go to the Fire. Why waste time questioning Kossuth's motives? Though you seem to have a good idea of what we believe. Should I mention in my prayers that you have joined the fold?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* SILVERSTAR OF SELUNE - Moonmaiden : */
IF ~~ a2637
  SAY ~[ARAN] Silverstars may have th' Moonmaiden in their corner, but when I look around this place, it looks like we won't be seein' much o' Her face any time soon.~
  ++ ~[PC] Selune will find us, even in this place.But I didn't know you were coming to see the light. Should I mention in my prayers that you have joined the fold?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* Holy Strategist of the Red Knight - Red Fellowship (only law)  */
IF ~~ a2638
  SAY ~[ARAN] I would o' thought a Holy Strategist wouldn't get caught wi' their trousers down an' all their parts exposed. You know, have some backup? One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to th' Red Lady only knows where.~
  ++ ~[PC] The Red Fellowship has had some bad miscalculations before. I seem to have done the same. Perhaps I need more study and prayer.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* NIGHTCLOAK OF SHAR - Dark Lady */
IF ~~ a2639
  SAY ~[ARAN] I thought I was used to all your Nightcloak ways, but Shar's Caress... one hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Shar only knows where.~
  ++ ~[PC] Shar's secrets are not to be shared with outsiders. Unless... should I mention in my prayers that you wish to join the fold?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* HEARTWARDER OF SUNE - Sune Firehair, Lady Firehair : Global("c-heartwarder","GLOBAL",1) */
IF ~~ a2640
  SAY ~[ARAN] Lady Firehair will be pleased as punch one o' Her Heartwarders be disappeared down some hole in th' nine hells. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Sune only knows where.~
  ++ ~[PC] We Heartwarders pursue beauty wherever we find it. We even find it in that thing you wear on your skull, and call a face. Shall we get you some help in that department?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* BATTLEGUARD OF TEMPUS - th' Foehammer (chaos) */
IF ~~ a2641
  SAY ~[ARAN] You blighted Battleguards don't think beyond th' edge o' an axe or hammer, do you? One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Tempus knows where.~
  ++ ~[PC] Why waste time waiting for you when I could get things done? Do you question the way of Tempus? I believe the best way to question is to engage me in battle...~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* Authlim of Iyachtu Xvim - the Godson */
IF ~~ a2642
  SAY ~[ARAN] You blighted Authlim be all th' same. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Xvim knows where. You bloody well know I'm no competition on th' shares o' any find. I'm just th' hired help.~
  ++ ~[PC] You of all people should realize that my motives are my own, and not for questioning. Do not mention Xvim unless you wish to serve him directly, and in that case, you would need to challenge me...~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* MORNINGLORD OF LATHANDER */
IF ~~ a2643
  SAY ~[ARAN] Morninglords may needs be shinin' th' Light into dark places, but by Lathander's Golden Poop, blighted well let a lad know where you be goin'. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to His Suniness knows where.~
  ++ ~[PC] Sunny-ness or Sune-i-ness, Aran? I never did get whom you venerate most. Did you want me to try to pray for some great spell to reverse time itself, and undo the past?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
 END
/* WATCHER OF HELM */
IF ~~ a2644
  SAY ~[ARAN] You blighted Watchers be all th' same. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to Helm knows where. You bloody well know I'd be a help watchin' your back.~
  ++ ~[PC] Helm watches all things. Unfortunately, His followers are not quite omnipotent or omniscient. Or are you saying you have never made a mistake?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END
/* STORMLORD OF TALOS */
IF ~~ a2645
  SAY ~[ARAN] You blighted well did it again. Look, I know you blighted Stormlords an' Stormladies all want to go around blastin' th' crap out o' th' universe, sewin' seeds o' chaos an' evil, but by Talos' Tempestuous Tresses, you should know by now that goin' wi' out backup is just stupid. Yet there you be. One hint o' some esoteric Tel'Qessirim ruin, an' you go an' investigate alone, an' get magically swept to gods knows where.~
  ++ ~[PC] Why waste time waiting for you when I could get things done? Do you question the way of Talos? I believe the best way to question is to engage me in battle...~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2653
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2647
  + ~Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2648
  + ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2649
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2650
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2651
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2631
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2630
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~  DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
  ++ ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2654
END

/* crossover state */
IF ~~ a2653
  SAY ~[ARAN] I didn't say I wanted none o' that. I just get a mite grumpy when I be unceremoniously whisked away from a perfectly good drink at your whim. Somethin' that wouldn't have happened if you had let me stay right close by, instead o' harin' off on your own.~
  /* Relationship Adjustment */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Gender(Player1,FEMALE) Alignment(Player1,MASK_GOOD) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ + a2647
  + ~Gender(Player1,FEMALE) Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ + a2648
  + ~Gender(Player1,FEMALE) !Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you any more.~ + a2649
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we were headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ + a2650
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + ~[PC] Look, I know we have had a rough patch... and I don't know who really started the fight. But I love you, and I need your help.~ + a2651
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I said we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we can keep our affair.~ + a2652
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I had to clear my head, and to think. I did not expect to be ambushed and taken to this place. Can we talk about this later, and get back to the business at hand?~ + a2652
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I need you to focus. Look at me... we are still together. Just focus on getting your bearings and joining me.~ + a2631
  + ~Gender(Player1,FEMALE) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] Aran.... after all I have been through, I think it is time for me to take action. I have some feelings for you. Do you think we could become more than just friends?~ + a2630
  + ~Gender(Player1,FEMALE) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] Don't you love me any more? I think I want you back.~ + a2654
  + ~Gender(Player1,FEMALE) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] I know we have had ups and downs in the past, but the whole chaotic 'love me, love me not' thing is so exciting. Can we go back to that?~ + a2654
  + ~Gender(Player1,FEMALE)~ + ~[PC] Oh, never mind. I am being silly, and rethinking our whole relationship. We should just leave things the way they are right now, and continue being friends.~ + a2654
  + ~Gender(Player1,MALE)~ + ~[PC] I told you I was heading out to investigate those old stone heads, but you just had to stay and try to flirt with those twins.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2610
  + ~Gender(Player1,MALE)~ + ~[PC] Focus. Battles ahead. Big battles. I need you. Are you in, or out?~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2611
  + ~Gender(Player1,MALE)~ + ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  + ~Gender(Player1,MALE)~ + ~[PC] It is all a dream, your fevered imagination, and that extra round of Bitterblack Beer you ordered... I am just an odd bit of subconsious thought.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2613
  + ~Gender(Player1,MALE)~ + ~[PC] You don't need to know where. You need to know what I want to get accomplished, and what you have to kill in order to get it done.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2614
END

IF ~~ a2652
  SAY ~[ARAN] Now that be right fine. I am sorry for whatever I did what made you go off alone, but we can talk about that later. What do you be needin' right now?~
   ++ ~[PC] Come with me. I need your help.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2) JoinParty()~ EXIT
  ++ ~[PC] You'll do what I say or you'll rot here, do you understand that?~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2655
  ++ ~[PC] Wait here for now.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2656
  ++ ~[PC] Fine. We can talk later. That's good enough for me.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2) JoinParty()~ EXIT
  ++ ~[PC] Get in line and don't bother me.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2657
  ++ ~[PC] Stay here, my love. I will be back for you as soon as I can.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2656
END

IF ~~ a2647
  SAY ~[ARAN] I... I guess I saw that comin', eh? There be little enough I can offer you, except mayhap some service. Fine. I can do that.~
  ++ ~[PC] I... I thought you did not want me any more. If you do... well, we could try...~ + a2658
  ++ ~[PC] Hey, I pulled you here because I have some feelings for you, but you had no right to flirt with her like that. I expect you to try harder to be the man I need you to be.~ + a2658
  ++ ~[PC] You have many things to offer. I just needed to see how you would react. I am happy to have you as my lover again, if you behave yourself.~ + a2659
  ++ ~[PC] Good. I have someone else in my life right now, and I don't want this to distract from our work.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ ~[PC] I am sorry to hurt you like this, but it is for the best. I need friends right now, not romance.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ ~[PC] It was all in your mind, anyways. You should be glad that you can go about your drinking and womanizing without having to look over your shoulder every few seconds.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
END

IF ~~ a2648
  SAY ~[ARAN] Now, you selfish little minx, I blighted well put up wi' your evil ways for all that time, an'...~
  = ~[ARAN] I... I guess I saw that comin', eh? There be little enough I can offer you, except mayhap some service. Fine. I can do that.~
  ++ ~[PC] I... I thought you did not want me any more. If you do... well, we could try...~ + a2658
  ++ ~[PC] Hey, I pulled you here because I have some feelings for you, but you had no right to flirt with her like that. I expect you to try harder to be the man I need you to be.~ + a2658
  ++ ~[PC] You have many things to offer. I just needed to see how you would react. I am happy to have you as my lover again, if you behave yourself.~ + a2659
  ++ ~[PC] Good. I have someone else in my life right now, and I don't want this to distract from our work.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ ~[PC] I am sorry to hurt you like this, but it is for the best. I need your loyal service, not your love.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ ~[PC] It was all in your mind, anyways. You should be glad that you can go about your drinking and womanizing without having to look over your shoulder every few seconds. Just be careful... if I get a little jealous, someone might end up dead.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
END

IF ~~ a2649
  SAY ~[ARAN] I don't rightly know whether you be comin', goin' or just playin' wi' me. By th' gods, you blighted little...~
  = ~[ARAN] I... I guess I saw that comin', eh? There be little enough I can offer you, except mayhap some service. Fine. I can do that.~
  ++ ~[PC] I... I thought you did not want me any more. If you do... well, we could try...~ + a2658
  ++ ~[PC] Hey, I pulled you here because I have some feelings for you, but you don't seem to be able to handle our relationship the way I need you to. I expect you to try harder to be the man I need you to be.~ + a2658
  ++ ~[PC] You have many things to offer. I just needed to see how you would react. I am happy to have you as my lover again.~ + a2659
  ++ ~[PC] Good. I have someone else in my life right now, and I don't want this to distract from our work.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ ~[PC] I am sorry to hurt you like this, but it is for the best. I need your loyal service, not your love.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
  ++ ~[PC] It was all in your mind, anyways. You should be glad that you can go about your drinking and womanizing without having to look over your shoulder every few seconds. Just be careful... if I get a little jealous, someone might end up dead.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2631
END

IF ~~ a2659
  SAY ~[ARAN] I am th' one left bloody well holdin' th' drinks, while you... you.... oh, hells. I don't rightly know what I did wrong, but I know I can't blighted well live wi' out you in my life.~
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2631
END

IF ~~ a2651
  SAY ~[ARAN] I want to be mad, I do... I am th' one left bloody well behind. But when you look at me like that, I am not rightly goin' to resist, eh? I can't blighted well live wi' out you in my life.~
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ + a2631
END

IF ~~ a2650
  SAY ~[ARAN] Well, that be a nice thing to say. Do I get a bonus,too, or do you want me to see if I can get into th' Whores' Guild while I be at it? ~
  ++ ~[PC] If you can't handle being friends, then I don't need you around sulking like a stupid little apprentice whining over his lost love. Are you in, or out?~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2611
  ++ ~[PC] I am sorry if I hurt your feelings, but this is the way it has to be. Are you in, or out?~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2611
  + ~Alignment(Player1,MASK_GOOD)~ + ~[PC] I need your help, Aran. I need you to travel with me.~ + a2608
  + ~!Alignment(Player1,MASK_GOOD)~ + ~[PC] I need your help, Aran. I need you to travel with me.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2609
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2612
  ++ ~[PC] So being friends is out. Fine. Can you serve me, or should I find someone else who can do the job instead?~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2614
  ++ ~[PC] Prostitute, sellsword... there is a difference? I was not aware of any, except the kind of sword they handle.~ DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",3)~ + a2660
END

IF ~~ a2660
  SAY ~[ARAN] I fought for you, an' worked my hardest to be a right fine person. I expected you would be more than a few little games o' 'ruffle th' covers'.~
  ++ ~[PC] I don't know what your fevered imagination dreamed up, but you have not ruffled any of my covers, and you won't be doing any of that now.~ + a2661
  ++ ~[PC] The ruffling was substandard, and I really am not that interested in you romantically any more.~ + a2614
  ++ ~[PC] I told you to be discreet. You were less than discreet. I can't take the chance of messing that relationship up, so it is over between you and I.~ + a2614
  ++ ~[PC] I have fallen in love with someone else. I can't keep flirting and teasing with you. It is over between us.~ + a2614
  ++ ~[PC] I know you tried, but I am not in love with you any more. I don't know what the future will bring, but for right now, it has to be this way. Can you handle this?~ + a2614
  ++ ~[PC] Grow a spine. You were never strong enough to be anything more than a fling. Now, get hold of yourself and make a decision. Battles ahead. Gold, magic, power, and my favor to those who serve well. Are you in, or out?~ + a2611
END

IF ~~ a2661
  SAY ~[ARAN] You... fine. You want to be that way, it be your loss. I have more interestin' women to hunt anyways. Ones what appreciate what I can give.~
  = ~[ARAN] So why did you yank me out o' my life an' drag me here... just lookin' to screw wi' my life an' torture me before discardin' me on th' trash heap?~
  ++ ~[PC] Don't be bitter. I need your help. Join me, and we can gain power and security together.~ + a2662
  ++ ~[PC] I need your help. Join me, and perhaps you could change my mind about the status of our relationship.~ + a2662
  ++ ~[PC] I know you are hurting, but we have heavier matters to address. I need your skills, so join me.~ + a2662
  + ~RandomNum(4,4)~ + ~[PC] Stay here awhile longer, then. A little sulk might be good for you.~ + a2663
  + ~RandomNum(4,3)~ + ~[PC] Stay here awhile longer, then. A little sulk might be good for you.~ + a2664
  + ~RandomNum(4,2)~ + ~[PC] Stay here awhile longer, then. A little sulk might be good for you.~ + a2665
  + ~RandomNum(4,1)~ + ~[PC] Stay here awhile longer, then. A little sulk might be good for you.~ + a2666
END

IF ~~ a2611
  SAY ~[ARAN] In.~
  IF ~~ THEN GOTO a2631
END

IF ~~ a2614
  SAY ~[ARAN] Right. I can serve you. Just a little rattled, but I have taken worse in th' gut an' come out swingin'.~
  IF ~~ THEN GOTO a2631
END

IF ~~ a2630
  SAY ~[ARAN] I have been waitin' to hear that. I have been well past that boundary for a good bit o' time now. I'd be right happy to be more than friends.~
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ GOTO a2631
END

IF ~~ a2658
  SAY ~[ARAN] I would be right happy to try a bit harder, on my part. We could slow down a mite, an' see what happens.~
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",1)~ GOTO a2631
END

IF ~~ a2613
  SAY ~[ARAN] Hey, now, that be unfair, takin' advantage o' me when I was just drinkin' brandy. Or was it kissin' Brandy, an' drinkin' scotch? You can't blighted fool me, <CHARNAME>. You done spirited me away to some strange place.~
  + ~Alignment(Player1,MASK_GOOD)~ + ~[PC] I need your help, Aran. I need you to travel with me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2608
  + ~!Alignment(Player1,MASK_GOOD)~ + ~[PC] I need your help, Aran. I need you to travel with me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2609
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
END

IF ~~ a2610
  SAY ~[ARAN] TWINS. Blighted... <CHARNAME>, send me back, eh? Right now... There be a pair o' ladies what are goin' to be searchin' Faerun for revenge, if I don't get back there right quick!~
  ++ ~[PC] Your lovelife is your own problem. We have some bigger challenges to face.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2667
  + ~Alignment(Player1,MASK_GOOD)~ + ~[PC] I need your help, Aran. I need you to travel with me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2608
  + ~!Alignment(Player1,MASK_GOOD)~ + ~[PC] I need your help, Aran. I need you to travel with me.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2609
  ++ ~[PC] I don't have much use for you, Aran, unless you can figure things out faster than that.~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2612
  + ~RandomNum(4,4)~ + ~[PC] Oh, cry me a river. You have fun while I get sucked into a vortex, and not in a good way. Stay here awhile... little sulk might be good for you.~ + a2663
  + ~RandomNum(4,3)~ + ~[PC] Oh, cry me a river. You have fun while I get sucked into a vortex, and not in a good way. Stay here awhile... little sulk might be good for you.~ + a2664
  + ~RandomNum(4,2)~ + ~[PC] Oh, cry me a river. You have fun while I get sucked into a vortex, and not in a good way. Stay here awhile... little sulk might be good for you.~ + a2665
  + ~RandomNum(4,1)~ + ~[PC] Oh, cry me a river. You have fun while I get sucked into a vortex, and not in a good way. Stay here awhile... little sulk might be good for you.~ + a2666
END

IF ~~ a2667
  SAY ~[ARAN] I don't like th' tone o' that, seein' as there be no fury like a woman scorned, an' somehow I just done that to two, what be twin sisters, an' most likely Guild. An' I don't mean th' Baker's Guild, neither. But I have been in your service long enough to know that th' danger be high, th' fame large, an' th' goals... well, they don't rightly matter as long as I be on your side, eh?~
  IF ~~ THEN GOTO a2631
END

IF ~~ a2608
  SAY ~[ARAN] I don't rightly know what to say. I thought we had a contract, but then I looked up, an' you had disappeared. But I guess we could pick right up where we left off. I had little enough time to figure out what I was doin'.~
  IF ~~ THEN GOTO a2631
END

IF ~~ a2631
  SAY ~[ARAN] I seem to have lost some o' my gear, an' might need a bit o' remindin' what I do for you. Between th' drink an' bein' whisked in here, I need a mite bit o' time to figure myself straight.~
  ++ ~[PC] Fair enough. Join me. I'll help you settle your gear, and then we can figure out what comes next.~ DO ~JoinParty()~ EXIT
  ++ ~[PC] What am I, your wet-nurse? Shake it off, settle your own gear, join up, and then we can figure out what comes next.~ DO ~JoinParty()~ EXIT
  ++ ~[PC] Don't drown me with your troubles. You don't know what I have had to deal with. Morality, causality, and a whole other family of '-ality's. ~ + a2668
  ++ ~[PC] Just a reminder... You'll do what I say or you'll rot here.~ + a2655
  ++ ~[PC] It is great to have you with me again, Aran.~ + a2669
  + ~RandomNum(4,4)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2663
  + ~RandomNum(4,3)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2664
  + ~RandomNum(4,2)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2665
  + ~RandomNum(4,1)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2666
END

IF ~~ a2668
  SAY ~[ARAN] I wasn't threatenin' to drown you wi' my troubles, an' I be naught but a decent right arm for you. What in th' nine hells has gotten under your skin?  I don't give a rat's arse what cause you serve, on account o' my job be to make sure things on th' ground get done. You handle most o' th' morality, an' I look for things what be in the way, an' kill 'em.~
  ++ ~[PC] Come with me, then.~  DO ~JoinParty()~ EXIT
  ++ ~[PC] You'll do what I say or you'll rot here, do you understand that?~ + a2655
  ++ ~[PC] You'll wait here for now.~ + a2656
  + ~RandomNum(4,4)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2663
  + ~RandomNum(4,3)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2664
  + ~RandomNum(4,2)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2665
  + ~RandomNum(4,1)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2666
END

IF ~~ a2655
  SAY ~[ARAN] I don't break a contract. Unless you be sellin' slaves, I am backin' you. I may not agree, but that be a conversation for another time.~
  ++ ~[PC] Fine. That's good enough for me. Join me.~ DO ~JoinParty()~ EXIT
  + ~RandomNum(4,4)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2663
  + ~RandomNum(4,3)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2664
  + ~RandomNum(4,2)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2665
  + ~RandomNum(4,1)~ + ~[PC] Stay here awhile longer. I will be back for you as soon as I can.~ + a2666
  ++ ~[PC] Damn straight. Get in line and don't bother me.~ + a2657
  ++ ~[PC] Stay here, then. I might be back. Or perhaps I won't.~ + a2656
END

IF ~~ a2662
  SAY ~[ARAN]Fine. But someone else better do th' blighted dishes. I'll fight, but none o' that camaraderie crap.~
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ a2669
  SAY ~[ARAN] I feel th' same way.~
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ a2656
  SAY ~[ARAN] Well, if th' fates have brought me around, it seems I don't rightly ought to argue wi' em. I have learned you do things your own way. But I do question stayin' here an' not accompanyin' you, on account o' th' nearest alcohol be a long, long ways off.~
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~ a2657
  SAY ~[ARAN] I should have known that rest an' recreation were somethin' only normal people have. Just help me look through my gear an' get straight, an' I will be good to travel.~
  IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ a2609
  SAY ~[ARAN] You need my help, eh? I was thinkin' mayhap it was time for me to retire from things, an' settle down. You... you be right powerful, but some o' th' things you do don't sit so well wi' me. On th' other hand, I didn't get where I be without a fair amount o' backin' your play, so I should just shut up an' soldier, eh?~
  IF ~~ THEN GOTO a2670
END

IF ~~ a2670
  SAY ~[ARAN] I was th' one who begged on in th' first place, wantin excitement an' adventure, an' a quick trip out o' th' range of an angry father or two, as I do recall.~
  ++ ~[PC] Fine, let's go.~ DO ~JoinParty()~ EXIT
  ++ ~[PC] Then wait here for now.  I'll come back for you.~ GOTO a2671
END

IF ~~ a2671
  SAY ~[ARAN] Not much to do here. Mayhap you could think me up a way to make things nicer. Alcohol? A cute little half-elf half-nymph sex fiend? Both?~
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~ a2612
  SAY ~[ARAN] Nice way to treat a lad. Mayhap you want to give me a cut, an' drop a little lemon on it, too. Cut th' crap, an' tell me why I got dragged to... wherever 'here' be.~
  + ~!Alignment(Player1,MASK_GOOD)~ + ~[PC] I need you to travel with me.~ GOTO a2608
  + ~Alignment(Player1,MASK_GOOD)~ + ~[PC] I need you to travel with me.~ GOTO a2609
  + ~!Alignment(Player1,MASK_GOOD)~ + ~[PC] Forget it. Stay here and rot... I'll decide what to do with you later.~ GOTO a2656
  + ~Alignment(Player1,MASK_GOOD)~ + ~[PC] Forget it. Stay here. I'll decide what to do with you later.~ GOTO a2671
  ++ ~[PC] Before we go any further, Aran... what do you think our "relationship" is?~ + a2694
  ++ ~[PC] I am sorry. This is a little much to take in all at once. Stay here, and let me think for a minute or two.~ + a2663
  ++ ~[PC] I have to be cruel to be kind, in the right measure... some bard in Candlekeep kept singing that. I think it had something to do with the tightness of his leather pants, and something about whips and chains.~ + a2673
END

IF ~Global("c-aransummoned","GLOBAL",2)~ THEN a2672
  SAY ~[ARAN] What be th' word?~
  ++ ~[PC] Come with me.~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] Gods help me, I actually need your fighting skills. You had better come along.~  DO ~JoinParty()~ EXIT
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] It pains me to say it, but your magic is a necessary part of my party. Come on, and don't dawdle.~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] Stop pickpocketing me, and you can come along.~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",BARD_ALL)~ + ~[PC] I need your lore and inspiring oratory, Aran. Just please stop the whole 'try to teach yourself a stringed instrument by reading old manuscripts' thing. It sounds like cats being thrown in a shower.~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",RANGER_ALL)~ + ~[PC] Come on. I seem to have need of your tracking skills. Notice I said "tracking", not "talking"...~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",SORCERER)~ + ~[PC] You are gaining enough power as a sorcerer that you might actually be useful. Come on, I need you.~ DO ~JoinParty()~ EXIT
  + ~OR(2) Class("c-aran",CLERIC_ALL) Class("c-aran",PALADIN_ALL)~ + ~[PC] I need a healer, and you fit the bill. Gear up, boyo... we are heading out.~ DO ~JoinParty()~ EXIT
  ++ ~[PC] Before we go any further, Aran... what do you think our "relationship" is?~ + a2694
  + ~RandomNum(4,4)~ + ~[PC] Stay here awhile longer.~ + a2663
  + ~RandomNum(4,3)~ + ~[PC] Stay here awhile longer.~ + a2664
  + ~RandomNum(4,2)~ + ~[PC] Stay here awhile longer.~ + a2665
  + ~RandomNum(4,1)~ + ~[PC] Stay here awhile longer.~ + a2666
END

IF ~~  a2673
  SAY ~[ARAN] That sounds like somethin' I don't rightly want to think on much, eh? I never did find pain all that fun.~
  ++ ~[PC] Oh, stop all this chatter. Just come with me.~ DO ~JoinParty()~ EXIT
  ++ ~[PC] Just a little something to think about while you wait... perhaps I might enjoy that a little?~ EXIT
  + ~RandomNum(4,4)~ + ~[PC] Stay here awhile. I have to figure out what to do.~ + a2663
  + ~RandomNum(4,3)~ + ~[PC] Stay here awhile. I have to figure out what to do.~ + a2664
  + ~RandomNum(4,2)~ + ~[PC] Stay here awhile. I have to figure out what to do.~ + a2665
  + ~RandomNum(4,1)~ + ~[PC] Stay here awhile. I have to figure out what to do.~ + a2666
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] Gods help me, I actually need your fighting skills. You had better come along.~  DO ~JoinParty()~ EXIT
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] It pains me to say it, but your magic is a necessary part of my party. Come on, and don't dawdle.~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] Stop pickpocketing me, and you can come along.~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",BARD_ALL)~ + ~[PC] I need your lore and inspiring oratory, Aran. Just please stop the whole 'try to teach yourself a stringed instrument by reading old manuscripts' thing. It sounds like cats being thrown in a shower.~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",RANGER_ALL)~ + ~[PC] Come on. I seem to have need of your tracking skills. Notice I said "tracking", not "talking"...~ DO ~JoinParty()~ EXIT
  + ~Class("c-aran",SORCERER)~ + ~[PC] You are gaining enough power as a sorcerer that you might actually be useful. Come on, I need you.~ DO ~JoinParty()~ EXIT
  + ~OR(2) Class("c-aran",CLERIC_ALL) Class("c-aran",PALADIN_ALL)~ + ~[PC] I need a healer, and you fit the bill. Gear up, boyo... we are heading out.~ DO ~JoinParty()~ EXIT
END

IF ~~ a2663
  SAY ~[ARAN] Well, I will, but I don't rightly know why you would have me just stand around here wi' my sword up my arse. I guess I will take a look around an' see what can occupy my time.~
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~  a2664
  SAY ~[ARAN] I could join up right now, an' save myself one hells of a lot of boredom. This place needs one o' them 'interior decorator' types.~
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~ a2665
  SAY ~[ARAN] Xvim's Spit. Whoops... probably better curb my language a mite in here. Looks like I might be loser to th' source.~
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~ a2666
  SAY ~[ARAN] Make up your blighted Lolth-kissed mind, will you? If you don't need me, I got twin blonds to calm. An' I need to find both gems an' chocolate, right quick.~
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1470.1400]) Face(0)~ EXIT
END

IF ~~ a2654
  SAY ~[ARAN] I don't rightly know what to say. On th' work side, I thought we had a contract, but then I looked up, an' you had disappeared. But I guess we could pick right up where we left off. I had little enough time to figure out what I was doin'.~
  = ~[ARAN] As far as th' whole romance thing goes, sometimes I wonder why I let myself get all wrapped up in you. Then I look at you, or hear  your voice, or mayhap smell a bit o' your hair, an' I can't rightly help myself. I might not be th' most powerful man around, but I love you.~
  = ~[ARAN] If you ever want to change things between th' two o' us, all you have to do is ask. I be strong enough to do what you want, no matter th' cost.~
  IF ~~ THEN GOTO a2631
END

END /* of pre-joined file */

APPEND C-ARN25J

/* Setting Aran as Leader (Darios) */
IF ~Global("c-aranleader","LOCALS",1) Global("c-silencearan","GLOBAL",0)~ THEN BEGIN a3020
  SAY ~[ARAN] Well, now, that be right kind o' you to put me as leader. I'll take point if you want me to, but you still be callin' th' shots, eh? On account o' I don't rightly trust my own judgment at times. I'm likely to go pokin' my nose into somethin' you don't want to disturb.~ [c-aws064]
  IF ~~ THEN DO ~SetGlobal("c-aranleader","LOCALS",2) SetGlobalTimer("c-aransmalltalk","GLOBAL",300)~ EXIT
END

/* You look dead on your feet */
IF ~Global("c-aranpctired","LOCALS",1) Global("c-silencearan","GLOBAL",0)~ THEN BEGIN a3021
  SAY ~[ARAN] Umberlee's Fickle Breath, you look tired, <CHARNAME>. We had better find some place t' rest a bit, eh? Some nice tea, a bit to eat, sleep... does a body good, you know.~ [c-aws065]
  IF ~~ THEN DO ~SetGlobal("c-aranpctired","LOCALS",2) SetGlobalTimer("c-aransmalltalk","GLOBAL",300)~ EXIT
END

/* Waukeen Temple */
IF ~Global("c-aranwaukeen","LOCALS",1) Global("c-silencearan","GLOBAL",0)~ THEN BEGIN a3022
  SAY ~[ARAN] Now here's a goddess worth lookin' to. She be no Tymora, bless her Golden Coin, but between Tymora's Luck, Waukeen's Bounty, an' Ilmater's Mercy, there's naught a man can do but prosper, eh?~ [c-aws072]
  IF ~~ THEN DO ~SetGlobal("c-aranwaukeen","LOCALS",2) SetGlobalTimer("c-aransmalltalk","GLOBAL",300)~ EXIT
END


/* ToB PID Entries - evaluate to last in order */

IF ~!IsGabber(Player1)~ THEN BEGIN a2693
  SAY ~[ARAN] Well, now, you might want to talk, but I do have a bit on my mind.~ [c-aws116]
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

IF ~~ a2674 SAY ~[ARAN] No offense, <GABBER>, I just don't rightly have much to say to you right now.~ IF ~~ THEN EXIT END
IF ~~ a2675 SAY ~[ARAN] Now why in Mystra's Magical Name do I be talkin' to myself? If I keep repeatin' this, th' gods must be punishin' me.~ IF ~~ THEN EXIT END
IF ~~ a2689 SAY ~[ARAN] Not meanin' to be short, m'darlin lassie, but I'd rather we have a talk later. Are you up for a walk tonight, Aerie? Mayhap just you an' me, under th' stars?~ IF ~~ THEN EXIT END
IF ~~ a2690 SAY ~[ARAN] Anomen, if this is about my gear bein' not quite tidy enough, I done rightly heard you the first three times. An' I'll say it again - I don't answer to you, nohow. So bugger on about your business, m'lord, an' leave me to mine.~ IF ~~ THEN EXIT END
IF ~~ a2691 SAY ~[ARAN] If it that talk you were wantin' to give me on th' ways o' th' birds an' th' bees, Cernd, well - that ship sailed a couple o' years ago. Though I can tell you o' some things I've learned what's great in th' bedroom, but don't quite fit under th' headin' o 'natural'...~ IF ~~ THEN EXIT END
IF ~~ a2688 SAY ~[ARAN] Unless it be more stories o' your conquests, o' course, Edwin. You got more o' those, well, step right on over, an' we'll have a mite o' a chat. I still can't rightly believe a Chondathan girl can be trained to do what you described last time. Didn't know they bent that way.~ IF ~~ THEN EXIT END
IF ~~ a2687 SAY ~[ARAN] An' lay of th' 'sparrowhawk', 'dovewing', an' birdy-birdy language for a mite, there, HaerDalis, eh? If you do, I'll let you look at a scrap o' parchment I found in a library outside o' Beregost, what's written in th' tongue o' Gold Dwarves...~ IF ~~ THEN EXIT END
IF ~~ a2686 SAY ~[ARAN] I'm not pushin' you away, Imoen, really I'm not. I just know you have a mite on your mind, too, an' I'm not happy company right now. I'll walk by you for a bit, though, if you want.~ IF ~~ THEN EXIT END
IF ~~ a2684 SAY ~[ARAN] Yes, Jaheira, I packed up my bedroll right tightly. No, Jaheira, I did not eat too much o' th' hardtack, an' cramp my bowels. Yes, Jaheira, I read that list o' spices you wanted me to try to get into th' dinner roster. Mielikki's Mysterious Mouth, I'm no bloody half-elf out o' your loins, I'm just a friend, eh? Go easy on th' motherin', for th' love of our friendship!~ IF ~~ THEN EXIT END
IF ~~ a2685 SAY ~[ARAN] Tell you what, Jan. If th' story is about turnips, relatives, or craftin' new inventions, I can tell you I done heard it. In fact, if it was turnips, I done heard it twice. But we will have time to take on meal prep, an' then you can tell me about th' time the cute female turnip golem who was really your third cousin on your uncle's side managed to get you an idea for an invention what turned out to be th' best thing since th' gods created womenfolk.~ IF ~~ THEN EXIT END
IF ~~ a2679 SAY ~[ARAN] I don't mean no disrespect, Keldorn. If you have somethin' you want me to do, just say the word. Otherwise, I need to attend to my duties right proper.~ IF ~~ THEN EXIT END
IF ~~ a2678 SAY ~[ARAN] If this is about th' sharpenin' bar, Korgan, here it is. I don't need it no more nohow. An' I'm not so happy wi' havin' to rent it for two iron crescents an' a Trademeet trade bar. Xvim's Spit, that's bloody highway robbery.~ IF ~~ THEN EXIT END
IF ~~ a2683 SAY ~[ARAN] I'll be happy to help on th' weapons cleanin' later, though, Mazzy. I want to see how you sharpen those arrows so fierce.~ IF ~~ THEN EXIT END
IF ~~ a2677 SAY ~[ARAN] Oh, I'm right sorry, Minsc - didn't mean to be so short. Though when I'm standin' close to you, short is the word what springs to mind right quick, it does. You are blockin' most o' my view, big boy. You mind steppin' over a bit, so's I can see where we are headed?~ IF ~~ THEN EXIT END
IF ~~ a2682 SAY ~[ARAN] An' I am not one o' th' Great Unwashed Little People, neither, Nalia. I 'll have you know I took a bath just last week. Well, parts o' me, anyways. Wanna see?~ IF ~~ THEN EXIT END
IF ~~ a2680 SAY ~[ARAN] I'm right suprised you want to talk, anyways, Valygar. You haven't put two words together wi' me in nigh on a tenday.~ IF ~~ THEN EXIT END
IF ~~ a2681 SAY ~[ARAN] On second thought, Viconia, don't even bother. I've got naught to say to a Shar-kissed spawn o' th' Nether Planes. Bugger off an' go screw an ettin, or somethin'.~ IF ~~ THEN EXIT END
IF ~~ a2692 SAY ~[ARAN] Tell you what, Yoshimo - we'll talk next time we camp. I want to try that card game again. I don't rightly know how you won all five hands, an' I want a chance to make some o' those wages back.~ IF ~~ THEN EXIT END

IF ~IsGabber(Player1)~ THEN BEGIN a1866 /* tob PID */
 SAY ~[ARAN]  (Aran walks beside you, watching the surroundings carefully.) ~
  /* General Options, both Male PC and female PC */
  /* voice/string fixer */
  ++ ~[PC] Your voice sounds strange. Have you been drinking again?~ + a3023 /* c-aranpidvoice */
  /* Some Prefer Silence... Shutdown or re-enable gabby commenting and I_C_Ts */
  + ~Global("c-silencearan","GLOBAL",1)~ + ~[PC] Hey, I have changed my mind. Go ahead and say what you want to say, Aran, any time you want to say it. Random comments are fine.~ + a3025 /* c-arantalkok */
  + ~RandomNum(2,1) Global("c-silencearan","GLOBAL",0)~ + ~[PC] You know, I have put up with your stupid chatter for months of travel, across half of Amn. If you don't shut the hells up, I am going to stuff your mouth full of mud. STOP COMMENTING ON EVERYTHING.~ + a1867 /* c-aransilence2 */
  + ~RandomNum(2,2) Global("c-silencearan","GLOBAL",0)~ + ~[PC] I hate random comments. Only talk about important things, Aran. Even then, try not to talk.~ + a3024 /* c-aransilence */
  /* class - dependent , Aran (1 or 2 ) */
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] I think your spellcasting is getting better. At least, you seem less likely to catch part of me in your spell by accident.~ + a3065 /*  c-aranpidmage2 */
  + ~Class("c-aran",FIGHTER_ALL)~ + ~[PC] We should discuss your fighting tactics sometime.~ + a3066 /*  c-aranpidfighter2 */
  + ~Class("c-aran",THIEF_ALL)~ + ~[PC] Have you worked on those lock-picking and de-trapping skills of yours lately?~ + a3067 /*  c-aranpidthief2 */
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] Perhaps you should ask your god what we should do next, Aran.~ + a3068 /*  c-aranpidcleric2 */
  + ~Class("c-aran",PALADIN_ALL)~ + ~[PC] How did a rough and tumble character like you ever get to become a paladin, anyways?~ + a3069 /* c-aranpidpally2 */
  + ~Class("c-aran",SORCERER)~ + ~[PC] Aran, you are doing it again. Your left hand is sparking. Can you control yourself?~ + a3070 /*  c-aranpidsorc2 */
  + ~Class("c-aran",MONK)~ + ~[PC] I thought monks were quiet, introspective, and subtle. That does not seem to be your style.~ + a3071 /*  c-aranpidmonk2 */
  + ~Class("c-aran",BARD_ALL)~ + ~[PC] So, how is the great Chronicler coming along with the story?~ + a3072 /*  c-aranpidbard2 */
  /* area - dependent advice (1) */
  + ~AreaCheck("AR4500")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1982 /* Pocket Plane */
  + ~AreaCheck("AR5000")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1983 /* Saradush */
  + ~AreaCheck("AR5001")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1984 /* Gromnir 1st Level */
  + ~AreaCheck("AR5002")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1985 /* Gromnir's Hideout */
  + ~AreaCheck("AR5003")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1986 /* Saradush Tavern (Tankard Tree) */
  + ~AreaCheck("AR5004")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1987 /* Temple of Waukeen */
  + ~AreaCheck("AR5005")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1988 /* Gromnir's Barracks */
  + ~AreaCheck("AR5006")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1989 /* Saradush Prison */
  + ~AreaCheck("AR5007")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1990 /* Basement Entrance to Gromnir's Hideout */
  + ~AreaCheck("AR5008")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1991 /* Kiser's Home */
  + ~AreaCheck("AR5009")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1992 /* House (no exit?) */
  + ~AreaCheck("AR5010")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1993 /* Countess Santele's Home */
  + ~AreaCheck("AR5011")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1994 /* Arcana Archives */
  + ~AreaCheck("AR5012")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1995 /* House */
  + ~AreaCheck("AR5013")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1996 /* Sewers beneath Saradush */
  + ~AreaCheck("AR5014")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1997 /* Kiser's Home -- Cellar */
  + ~AreaCheck("AR5015")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1998 /* Saradush Militia Entrance */
  + ~AreaCheck("AR5016")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a1999 /* Saradush Castle Jail (Kiser Plot) */
  + ~AreaCheck("AR5200")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2000 /* Fire Giant Entrance Area */
  + ~AreaCheck("AR5201")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2001 /* Fire Giant Keep */
  + ~AreaCheck("AR5202")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2002 /* Nyalee's Hideout; Gorion Wraith */
  + ~AreaCheck("AR5203")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2003 /* Yaga-Shura's Camp */
  + ~AreaCheck("AR5204")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2004 /* Yaga-Shura's Keep */
  + ~AreaCheck("AR5500")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2005 /* Amkethran */
  + ~AreaCheck("AR5501")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2006 /* Amkethran Inn */
  + ~AreaCheck("AR5502")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2007 /* Kerrick the Smith's House */
  + ~AreaCheck("AR5503")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2008 /* Chyil's House */
  + ~AreaCheck("AR5504")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2009 /* Smuggler Cave */
  + ~AreaCheck("AR5505")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2010 /* Balthazar's Home */
  + ~AreaCheck("AR5506")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2011 /* Commoner's Home */
  + ~AreaCheck("AR5507")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2012 /* Empty Home */
  + ~AreaCheck("AR5508")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2013 /* Faheed's Home */
  + ~AreaCheck("AR5509")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2014 /* Amkethran Crypt */
  + ~AreaCheck("AR6000")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2015 /* Abazigal's Entrance */
  + ~AreaCheck("AR6001")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2016 /* Abazigal's Lair Entrance Hall */
  + ~AreaCheck("AR6002")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2017 /* Abazigal's Lair -- Cells */
  + ~AreaCheck("AR6003")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2018 /* Abazigal's Lair -- Iycanth the Mad, Bondari */
  + ~AreaCheck("AR6004")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2019 /* Abazigal's Lair -- Fll'Yissetat */
  + ~AreaCheck("AR6005")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2020 /* Abazigal's Hideout */
  + ~AreaCheck("AR6008")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2021 /* Frost Salamander Cave */
  + ~AreaCheck("AR6011")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2022 /* Orbs and Gauth */
  + ~AreaCheck("AR6012")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2023 /* Pool Home -- breath under water */
  + ~AreaCheck("AR6100")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2024 /* Area outside Sendai's Hideout */
  + ~AreaCheck("AR6101")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2025 /* Main Entrance Sendai's Lair */
  + ~AreaCheck("AR6102")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2026 /* Sendai's Lair -- Slavemaster */
  + ~AreaCheck("AR6103")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2027 /* Sendai's Lair -- Spiders */
  + ~AreaCheck("AR6104")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2028 /* Sendai's Lair -- Crossway */
  + ~AreaCheck("AR6105")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2029 /* Sendai's Lair -- Diaytha, Abishai */
  + ~AreaCheck("AR6106")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2030 /* Sendai's Lair -- Captain Egeissag */
  + ~AreaCheck("AR6107")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2031 /* Sendai's Lair -- Mithykyl */
  + ~AreaCheck("AR6108")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2032 /* Sendai's Lair -- Sendai */
  + ~AreaCheck("AR6109")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2033 /* Sendai's Lair -- Drow */
  + ~AreaCheck("AR6110")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2034 /* Sendai's Lair -- Odamaron */
  + ~AreaCheck("AR6111")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2035 /* Woodcutter's House -- Sendai's Area */
  + ~AreaCheck("AR6200")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2036 /* The Throne of Bhaal */
  + ~AreaCheck("AR6300")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2037 /* Oasis in Tethyr */
  + ~AreaCheck("AR6400")~ + ~[PC] Well, do you have any advice for me, Aran?~ + a2038 /* River Area */
  /* reputation - dependent (1) */
  + ~ReputationGT(Player1,17)~ + ~[PC] We seem to be getting quite a reputation.~ + a3060 /*  c-aranpidgood tob_ */
  + ~ReputationLT(Player1,18) ReputationGT(Player1,14)~ + ~[PC] We seem to be getting quite a reputation.~ + a3061 /*  c-aranpidbetter tob_ */
  + ~ReputationLT(Player1,15) ReputationGT(Player1,9)~ + ~[PC] We seem to be getting quite a reputation.~ + a3062 /*  c-aranpidneutral tob_ */
  + ~ReputationLT(Player1,10) ReputationGT(Player1,4)~ + ~[PC] We seem to be getting quite a reputation.~ + a3063 /*  c-aranpidbad tob_ */
  + ~ReputationLT(Player1,5)~ + ~[PC] We seem to be getting quite a reputation.~ + a3064 /* c-aranpidevil tob_ */
  /* Just For Fun... */
  + ~RandomNum(4,1)~ + ~[PC] (Stare at Aran.)~ + a1873
  + ~RandomNum(4,2)~ + ~[PC] (Toss a pebble near Aran.)~ + a1874
  + ~RandomNum(4,3)~ + ~[PC] Hey, you don't look half bad, for a beat up old adventuring hack.~ + a1875
  + ~RandomNum(4,4)~ + ~[PC] Don't step there, Aran... it looks like something left a nice big deposit of digested food just for us to enjoy.~ + a1876
  /* Watcher's Keep - ToB duplicates  */
  /* AreaCheck("AR3000") Watcher's Keep AreaCheck("AR3001") Watcher's Keep -- Altar level  AreaCheck("AR3003") Watcher's Keep -- Compass level AreaCheck("AR3004") Watcher's Keep */
  + ~Global("c-aranpidWK1","LOCALS",0) OR(4) AreaCheck("AR3000") AreaCheck("AR3001") AreaCheck("AR3003") AreaCheck("AR3004")~ + ~[PC] Well, we are off to do some good old fashioned dungeon exploring, eh, Aran?~ DO ~SetGlobal("c-aranpidWK1","LOCALS",1)~ + a3073 /* c-aranpidWK1 tob_ */
  /*  AreaCheck("AR3005")   Watcher's Keep -- tieflings  AreaCheck("AR3006")   Watcher's Keep -- Succubus  AreaCheck("AR3007")   Watcher's Keep -- Cambion  AreaCheck("AR3008")   Watcher's Keep -- Balor (Paladin Sword)  */
  + ~Global("c-aranpidWK2","LOCALS",0) OR(4) AreaCheck("AR3005") AreaCheck("AR3006") AreaCheck("AR3007") AreaCheck("AR3008")~ + ~[PC] Well, what do you think of this place?~  DO ~SetGlobal("c-aranpidWK2","LOCALS",1)~ + a3074 /*  c-aranpidWK2 tob_ */
  /*  AreaCheck("AR3009")   Watcher's Keep  AreaCheck("AR3010")   Watcher's Keep -- Tanarri -- Obelisk  AreaCheck("AR3011")   Watcher's Keep -- Bards Gloves, Manmans Journal  AreaCheck("AR3012")   Watcher's Keep -- Tahazzar  */
  + ~Global("c-aranpidWK3","LOCALS",0) OR(4) AreaCheck("AR3009") AreaCheck("AR3010") AreaCheck("AR3011") AreaCheck("AR3012")~ + ~[PC] I do not think that this place was designed to let us in easily.~ DO ~SetGlobal("c-aranpidWK3","LOCALS",1)~ + a3075 /*  c-aranpidWK3 tob_ */
  /*  AreaCheck("AR3013")   Watcher's Keep -- Karashur  AreaCheck("AR3014")   Watcher's Keep -- White Dragon Scales  AreaCheck("AR3015")   Watcher's Keep -- Aesgareth  AreaCheck("AR3016")   Watcher's Keep -- Chromatic Demon; Elementalist Level  */
  + ~Global("c-aranpidWK4","LOCALS",0) OR(4) AreaCheck("AR3013") AreaCheck("AR3014") AreaCheck("AR3015") AreaCheck("AR3016") ~ + ~[PC] Have you had enough wandering around in the dark trying not to get killed?~  DO ~SetGlobal("c-aranpidWK4","LOCALS",1)~ + a3076 /*  c-aranpidWK4 tob_ */
  /*  AreaCheck("AR3017")   Watcher's Keep -- Carston and the machine  AreaCheck("AR3018")   Watcher's Keep -- Saladrex (Dragon)  AreaCheck("AR3019")   Watcher's Keep -- Helmite Level -- Last Seals  AreaCheck("AR3020")   Watcher's Keep -- Imprisoned One  AreaCheck("AR3021")   Watcher's Keep -- Ilithids  AreaCheck("AR3022")   Watcher's Keep -- Anti-Paladins  */
  + ~Global("c-aranpidWK5","LOCALS",0) OR(6) AreaCheck("AR3017") AreaCheck("AR3018") AreaCheck("AR3019") AreaCheck("AR3020") AreaCheck("AR3021") AreaCheck("AR3022") ~ + ~[PC] Our challenges seem to be getting harder to overcome.~ DO ~SetGlobal("c-aranpidWK5","LOCALS",1)~ + a3077 /*  c-aranpidWK5 tob_ */
  /*  AreaCheck("AR3023")   Watcher's Keep -- "Adventure Level" (Mini Map!!!)  AreaCheck("AR3024")   Watcher's Keep -- Dragon -- Fear Challenge  AreaCheck("AR3025")   Watcher's Keep -- Orcs -- Ixilos Nail  AreaCheck("AR3026")   Watcher's Keep -- Imp -- Game  AreaCheck("AR3027")   Watcher's Keep -- Crypt -- Demi-Lich  */
  + ~Global("c-aranpidWK6","LOCALS",0) OR(5) AreaCheck("AR3023") AreaCheck("AR3024") AreaCheck("AR3025") AreaCheck("AR3026") AreaCheck("AR3027") ~ + ~[PC] You are looking a little pale, Aran. Here, have some iron rations, and a bit of something to drink.~ DO ~SetGlobal("c-aranpidWK6","LOCALS",1)~ + a3078 /*  c-aranpidWK6  tob_ */
  ++ ~[PC] Before we go any further, Aran... what do you think our "relationship" is?~ + a3210
  /* FLIRT MENU ADDITIONS, female PC's only */
  /* romance - dependent (1) to allow breakup or resume romance. */
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",1)~ + ~[PC] I need to be clear about this, Aran. I am not interested in a romance with you. Stop talking about it.~ + a3026 /* c-aranpidnointerest */
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we are headed down the wrong path, Aran. It was fun while it lasted, but it is over. Let's just be friends.~ + a3027 /* c-aranpidbreakup */
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",3) Global("c-aranmakeup","GLOBAL",0)~ + ~[PC] Look, I know it is over between us. But I think I have changed my mind. Perhaps a romance with you might be interesting after all.~ DO ~SetGlobal("c-aranmakeup","GLOBAL",1)~ + a3028 /* c-aranpidbreakupover1 */
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",3) Global("c-aranmakeup","GLOBAL",1)~ + ~[PC] Look, I know it is over between us. But I think I have changed my mind. Perhaps a romance with you might be interesting after all.~ DO ~SetGlobal("c-aranmakeup","GLOBAL",2)~  + a3120 /* c-aranpidbreakupover2 */
  + ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",3) Global("c-aranmakeup","GLOBAL",2)~ + ~[PC] Look, I know it is over between us. But I think I have changed my mind. Perhaps a romance with you might be interesting after all.~ + a3121 /* c-aranpidbreakupover3 */
  /* PID Anomen Romance Conflict Toggle */
  + ~InParty("Anomen") Global("c-aanoconflict","GLOBAL",0)~ + ~[PC] I like Anomen well enough, Aran. But you keep fighting with him. I want you to stop doing that.~ + a3029 /* c-aranvsanom1s */
  + ~InParty("Anomen") Global("c-aanoconflict","GLOBAL",1)~ + ~[PC] I have changed my mind about fighting with Anomen, Aran. Go ahead and speak your mind.~ + a3030 /* c-aranvsanom1c */
  /* Stop or Restart Flirting; (1) of the three should be active at any one time. None show for males. */
  /*  PC Doesn't Want NPC Initiated flirts */
  + ~Gender(Player1,FEMALE) Global("c-aranflirtstop","GLOBAL",0) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2)~ + ~[PC] You have to stop coming up to me and flirting. I do not want that behavior to continue.~ + a3079 /* c-aranrestopflirts tob_ */
  /* PC Wants NPC Initiated Flirts */
  + ~Gender(Player1,FEMALE) Global("c-aranflirtstop","GLOBAL",1) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) Global("c-aranfight","GLOBAL",0)~ + ~[PC] You do not pay attention to me the way you used to, Aran. I miss your company.~ + a3080 /* c-aranrestartflirts tob_ */
  /* PC Wants NPC Initiated Flirts but Aran is Mad */
  + ~Gender(Player1,FEMALE) Global("c-aranflirtstop","GLOBAL",1) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) Global("c-aranfight","GLOBAL",1)~ + ~[PC] You do not pay attention to me the way you used to, Aran. I miss your company.~ + a3081 /* c-aranrestartflirtsmad tob_ */
  /*  PC Initiated Flirting;  (1) of the four should be active at any one time. None show for males. */
  /* PC Wants To Initiate A Flirt: ToB */
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) Global("c-aranfight","GLOBAL",0)~ + ~[PC] (You decide to flirt with Aran)~ + a3059 /*  c-pcflirtsaran3 */
  /* 2d - PC Wants To Initiate A Flirt, But Aran Is Angry - handled within submenu  */
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) RandomNum(5,5)~ + ~[PC] How come we never fight anymore?~ + a1868
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) RandomNum(5,4)~ + ~[PC] How come we never fight anymore?~ + a1869
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) RandomNum(5,3)~ + ~[PC] How come we never fight anymore?~ + a1870
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) RandomNum(5,2)~ + ~[PC] How come we never fight anymore?~ + a1871
  + ~Gender(Player1,FEMALE) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) RandomNum(5,1)~ + ~[PC] How come we never fight anymore?~ + a1872
  /* PID Scribing Scrolls Blocks */
  + ~Global("c-arnscrollwork","GLOBAL",0) Global("c-aranscribe","GLOBAL",0)~ + ~[PC] Can you scribe a scroll for me?~ DO ~SetGlobal("c-arnscrollwork","GLOBAL",1)~ + a3031
  + ~Global("c-arnscrollwork","GLOBAL",1) Global("c-aranscribe","GLOBAL",0)~ + ~[PC] Tell me again how you work with scrolls and spells.~ + a3031
  + ~Global("c-arnscrollwork","GLOBAL",1) Global("c-aranscribe","GLOBAL",0)~ + ~[PC] Can you scribe a scroll for me?~ + a3043
  + ~Global("c-aranscribe","GLOBAL",1) RandomNum(5,1)~ + ~[PC] Is that scroll done yet?~ + a3032
  + ~Global("c-aranscribe","GLOBAL",1) RandomNum(5,2)~ + ~[PC] Is that scroll done yet?~ + a3033
  + ~Global("c-aranscribe","GLOBAL",1) RandomNum(5,3)~ + ~[PC] Is that scroll done yet?~ + a3034
  + ~Global("c-aranscribe","GLOBAL",1) RandomNum(5,4)~ + ~[PC] Is that scroll done yet?~ + a3035
  + ~Global("c-aranscribe","GLOBAL",1) RandomNum(5,5)~ + ~[PC] Is that scroll done yet?~ + a3036
  /* nothing PC wants to talk about escape */
  ++ ~[PC] Actually, never mind. I don't really have anything to talk to you about.~ + a3127
  /* LEAT21 - Human Flesh +5 evil armor equipped complaints */
  IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",0)~ THEN GOTO a3132
  IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",1) GlobalTimerExpired("c-aranskin","GLOBAL")~ THEN GOTO a3131
  IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",2) GlobalTimerExpired("c-aranskin","GLOBAL")~ THEN GOTO a3130
END

/* voice/string fixer */
IF ~~ a3023 /* c-aranpidvoice */
  SAY ~[ARAN] *cough*~ [c-aws120]
  IF ~~ THEN DO ~SetName(%Aran%)
  SetPlayerSound(Myself,%[c-awsini] Now, there be an idea... joinin' up on an adventure.% [c-awsini],0) /* INITIAL_MEETING */
  SetPlayerSound(Myself,%[c-aws001] Helm's bones - RETREAT!% [c-aws001],1) /* MORALE */
  SetPlayerSound(Myself,%[c-aws002] Aye, 'tis a fair group. 'Tis better than a clear day on Trade Way.% [c-aws002],2) /* HAPPY */
  SetPlayerSound(Myself,%[c-aws003] By Tymorra's bright coin, you make some strange decisions. I don't rightly agree.% [c-aws003],3) /* UNHAPPY_ANNOYED */
  SetPlayerSound(Myself,%[c-aws004] I gave up some serious opportunities to travel with you. Wasn't expectin' this kind of 'adventure'. Stop this, or I'll dissolve th' contract.% [c-aws004],4) /* UNHAPPY_SERIOUS */
  SetPlayerSound(Myself,%[c-aws005] I'll see you in the hands o' Kelemvor, but not one second before.% [c-aws005],5) /* UNHAPPY_BREAKING_POINT */
  SetPlayerSound(Myself,%[c-aws006] I'll lead, but 'tisn't my strong point.% [c-aws006],6) /* LEADER */
  SetPlayerSound(Myself,%[c-aws007] Time to make camp. This gear is startin' to chafe.% [c-aws007],7) /* TIRED */
  SetPlayerSound(Myself,%[c-aws008] By Torm's Blood, are we beggin' to be ambushed? Standin' 'round with our swords up our...% [c-aws008],8) /* BORED */
  SetPlayerSound(Myself,%[c-aws009] Archers to th' rear!% [c-aws009],9) /* BATTLE_CRY1 */
  SetPlayerSound(Myself,%[c-aws010] Spellcasters die first!% [c-aws010],10) /* BATTLE_CRY2 */
  SetPlayerSound(Myself,%[c-aws011] By Tymorra's Luck!% [c-aws011],11) /* BATTLE_CRY3 */
  SetPlayerSound(Myself,%[c-aws012] By Sune's Bottom!% [c-aws012],12) /* BATTLE_CRY4 */
  SetPlayerSound(Myself,%[c-aws013] Send 'em to Kelemvor's Scythe!% [c-aws013],13) /* BATTLE_CRY5 */
  SetPlayerSound(Myself,%[c-aws014]% [c-aws014],18) /* DAMAGE ah... */
  SetPlayerSound(Myself,%[c-aws015]% [c-aws015],19) /* DYING aarrgh... */
  SetPlayerSound(Myself,%[c-aws016] Send the rest o' them to hell for me...% [c-aws016],20) /* HURT */
  SetPlayerSound(Myself,%[c-aws017] Need less trees, more road. Too many places for enemies to hide.% [c-aws017],21) /* AREA_FOREST */
  SetPlayerSound(Myself,%[c-aws018] Trade time! Some trade, then some drinkin', then some sleep... or more drinkin'.% [c-aws018],22) /* AREA_CITY */
  SetPlayerSound(Myself,%[c-aws019] I gave up comfortable inns an' guardin' simple caravans to poke around this dank musty place. I'm a bloody idiot.% [c-aws019],23) /* AREA_DUNGEON */
  SetPlayerSound(Myself,%[c-aws020] Lathander's fat arse is up at last. 'Bout time he shed some light around here.% [c-aws020],24) /* AREA_DAY */
  SetPlayerSound(Myself,%[c-aws021] Bloody dark. Good for coverin' enemies an' ambushes. Someone light a torch, eh?% [c-aws021],25) /* AREA_NIGHT */
  SetPlayerSound(Myself,%[c-aws022] Yep?% [c-aws022],26) /* SELECT_COMMON1 */
  SetPlayerSound(Myself,%[c-aws023] What's to be done?% [c-aws023],27) /* SELECT_COMMON2 */
  SetPlayerSound(Myself,%[c-aws024] Do I needs lead?% [c-aws024],28) /* SELECT_COMMON3 */
  SetPlayerSound(Myself,%[c-aws025] Aye?% [c-aws025],29) /* SELECT_COMMON4 */
  SetPlayerSound(Myself,%[c-aws026] Yes?% [c-aws026],30) /* SELECT_COMMON5 */
  SetPlayerSound(Myself,%[c-aws027] I'm listenin'.% [c-aws027],31) /* SELECT_COMMON6 */
  SetPlayerSound(Myself,%[c-aws028] Got it.% [c-aws028],32) /* SELECT_ACTION1 */
  SetPlayerSound(Myself,%[c-aws029] Sune's sweet cheeks, I heard.% [c-aws029],33) /* SELECT_ACTION2 */
  SetPlayerSound(Myself,%[c-aws030] On it.% [c-aws030],34) /* SELECT_ACTION3 */
  SetPlayerSound(Myself,%[c-aws031] Understood.% [c-aws031],35) /* SELECT_ACTION4 */
  SetPlayerSound(Myself,%[c-aws032] Sune's Bosom, I'm movin', already!.% [c-aws032],36) /* SELECT_ACTION5 */
  SetPlayerSound(Myself,%[c-aws033] Ilmater's Blood. I said I'd do it.% [c-aws033],37) /* SELECT_ACTION6 */
  SetPlayerSound(Myself,%[c-aws034] Less talk, more action.% [c-aws034],38) /* SELECT_ACTION7 */
  SetPlayerSound(Myself,%[c-aws035] Watch where you point that thing.% [c-aws035],63) /* SELECT_RARE1 */
  SetPlayerSound(Myself,%[c-aws036] Aye, I'm here.% [c-aws036],64) /* SELECT_RARE2 */
  SetPlayerSound(Myself,%[c-aws037] Good.% [c-aws037],65) /* CRITICAL_HIT */
  SetPlayerSound(Myself,%[c-aws038] Cyric's Black Heart!% [c-aws038],66) /* CRITICAL_MISS */
  SetPlayerSound(Myself,%[c-aws039] Bounced off. Damn.% [c-aws039],67) /* TARGET_IMMUNE */
  SetPlayerSound(Myself,%[c-aws040] I'm already carryin' more than my share.% [c-aws040],68) /* INVENTORY_FULL */
  SetPlayerSound(Myself,%[c-aws041] Hey, look what I found.% [c-aws041],69) /* PICKED_POCKET */
  SetPlayerSound(Myself,%[c-aws042] Huntin'...% [c-aws042],70) /* HIDDEN_IN_SHADOWS */
  SetPlayerSound(Myself,%[c-aws043] Never did get that one right...% [c-aws043],71) /* SPELL_DISRUPTED */
  SetPlayerSound(Myself,%[c-aws044] Try that, you bugger.% [c-aws044],72) /* SET_A_TRAP */
  SetPlayerSound(Myself,%[c-aranbio] When you ask him about his past, ARAN WHITEHAND grasps at a nearby twig to chew on. He explains that he grew up in a small independent family-run Coster plying the Trade Way and Coast Way from Waterdeep both north and south. Working as both Pen and Sword (scribe and fighting guard) made him attractive as an independent, since he could balance accounts, keep inventory, and still operate as a sellsword. A few campaigns with mercenary companies, a few battles, and lots of wandering about has brought him to Amn. He hastens to note that he is not the man to send in to negotiate anything, preferring to wield weapons rather than the spoken word - but if you want a trading contract written up, he's the right man for the job.% [C-ABLANK],74)~ /* BIOGRAPHY_TEXT */
  EXIT
END

/* c-aransilence */
IF ~~ a3024 SAY ~[ARAN] Right. Got it. Business only, an' cut the chatter. I can do that.~ [c-aws121] IF ~~ THEN DO ~SetGlobal("c-silencearan","GLOBAL",1)~ EXIT END
/* c-arantalkok */
IF ~~ a3025 SAY ~[ARAN] Right. Got it. Chatter away like a crazed monkey, on account o' the fact that it might spice up the usual borin' routine o' see somethin', listen to it deliver an evil monologue o' doom an' destruction, kill it, loot its belongings, rinse, an' repeat.~ [c-aws122] IF ~~ THEN DO ~SetGlobal("c-silencearan","GLOBAL",0)~ EXIT END

/* LEAT21  Human Flesh +5 evil armor equipped; ToB Content */
/* IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",0)~ THEN GOTO a3132 */ 
/* IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",1) GlobalTimerExpired("c-aranskin","GLOBAL")~ GOTO a3131 */
/* IF ~HasItemEquiped("LEAT21",Player1) Global("c-arskinarm","LOCALS",2) GlobalTimerExpired("c-aranskin","GLOBAL")~ GOTO a3130 */

/* tiebacks possible with cut & paste */
IF ~~ a3128 SAY ~[ARAN] Hey, I don't go around second guessin' you. So if I be sayin' it, you know there be one hells of a lot more people who have noticed. Might fit your ideas, but it be bad tactics to give away your position that way.~ IF ~~ THEN EXIT END
IF ~~ a3129 SAY ~[ARAN] Cyric's Black Heart, I don't run out on contracts. But you smell worse than a charnelhouse. If I throw up, you will be knowin' why.~ IF ~~ THEN EXIT END

IF ~~ a3130
  SAY ~[ARAN] Look, I do a good bit around here, an' I know you be th' leader. I'm just sayin', that armor makes it blighted hard for me to do my job. Th' smell be only part o' it. Shar's Kiss, get rid o' it, eh?~ [c-aws135]
  ++ ~[PC] Or you will run crying like a weakling child, break your contract, and leave?~ DO ~SetGlobal("c-arskinarm","LOCALS",3)~ + a3129
  ++ ~[PC] Shut up, Aran. I heard you the first two times. I will use what tools I see fit to advance my goals.~ DO ~SetGlobal("c-arskinarm","LOCALS",3)~ + a3129
  ++ ~[PC] Are you volunteering to add more skin to this armor? Speak again, and I will ~ DO ~SetGlobal("c-arskinarm","LOCALS",3)~ + a3129
  ++ ~[PC] I may very well take it off. You are useful. But then again, I might put it back on. You will have to get used to it, or leave.~ DO ~SetGlobal("c-arskinarm","LOCALS",3)~ + a3129
  ++ ~[PC] You do very little, and I am tired of your whining. That is the lasty warning you will get.~ DO ~SetGlobal("c-arskinarm","LOCALS",3)~ + a3129
END

IF ~~ a3131
  SAY ~[ARAN] You stll be wearin' that Grumbar-lovin' Cyric-blighted armor? Gives me th' chills, it does.~ [c-aws134]
  ++ ~[PC] If it bothers you that much, I will take it off.~ DO ~SetGlobal("c-arskinarm","LOCALS",2) SetGlobalTimer("c-aranskin","GLOBAL",FOUR_DAYS)~ + a3128
  ++ ~[PC] I think it has a great effect on our opponents' morale. You are just going to have to get used to it.~ DO ~SetGlobal("c-arskinarm","LOCALS",2) SetGlobalTimer("c-aranskin","GLOBAL",FOUR_DAYS)~ + a3128
  ++ ~[PC] If I wanted you opinion, I would have asked.~ DO ~SetGlobal("c-arskinarm","LOCALS",2) SetGlobalTimer("c-aranskin","GLOBAL",FOUR_DAYS)~ + a3128
  ++ ~[PC] Shut up, or your ears will add decoration to it.~ DO ~SetGlobal("c-arskinarm","LOCALS",2) SetGlobalTimer("c-aranskin","GLOBAL",FOUR_DAYS)~ + a3128
END

IF ~~ a3132
  SAY ~[ARAN] Hey, by the way, your armor be all wrong. I know you be th' scourge o' Faerun, but you don't have to wear your heart on your sleeve, eh? In this case, someone else's, by th' look. Not a great morale boostin' thing, by my account.~ [c-aws075]
  IF ~~ THEN DO ~SetGlobal("c-arskinarm","LOCALS",1) SetGlobalTimer("c-aranskin","GLOBAL",FOUR_DAYS)~ EXIT
END

/* romance - dependent (1) to allow breakup or resume romance. */
IF ~~ a3026 SAY ~[ARAN] Well, Mielikki's Quick Temper, why didn't you say somethin' before? Here I go all pesterin' you an' buggin' you, and you let me ramble on like a fool! Sorry, <CHARNAME>, I didn't mean no harm. I'll quit pesterin' you, an' stick to bein' friends.~ IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~ EXIT END /* c-aranpidnointerest */
IF ~~ a3027 SAY ~[ARAN] Well, by Halani Celanil's Leafy Tresses, you do be a fickle one, eh? Leadin' me on like that, It be downright wrong. I done got no choice, I guess.~ IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~ EXIT END /* c-aranpidbreakup */
IF ~~ a3028 SAY ~[ARAN] I can't say that I don't want you, <CHARNAME>. But be careful, eh? I can be a right bastard to anythin' crossin' my path, but you... wi' you, I seem to wear my heart outside th' armor, so to speak.~ IF ~~ THEN DO ~SetGlobal("c-aranmakeup","GLOBAL",1) SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranfight","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~ EXIT END /* c-aranpidbreakupover */
IF ~~ a3029 SAY ~[ARAN] Right, then. Got it. I'll be keepin' my mouth to myself. Not on account o' Anomen, just on account o' you. I can live wi' that.~ IF ~~ THEN DO ~SetGlobal("c-aanoconflict","GLOBAL",1)~ EXIT END /* c-aranvsanom1s */
IF ~~ a3030 SAY ~[ARAN] Right, then. Got it. I can live wi' that. I'll be easy on th' blighted stuffy bastard, I will, just for your sake.~ IF ~~ THEN DO ~SetGlobal("c-aanoconflict","GLOBAL",0)~ EXIT END /* c-aranvsanom1c */
IF ~~ a3120 SAY ~[ARAN] Now you be playin' wi' me, right? On account o' you done broke my heart once before. But there be somethin' about you I just can't rightly walk away from. So I am ready to give it another shot.~ IF ~~ THEN EXIT END /* c-aranpidbreakupover2 */
IF ~~ a3121 SAY ~[ARAN] Gond's Mischievous Machinations, you be treatin' me like a toy. I am drawn to you, like a moth to a flame, but by th' gods, this be torture. You could be kind, an' just kill me.~ IF ~~ THEN EXIT END /* c-aranpidbreakupover3 */
IF ~~ a3060 SAY ~[ARAN] Yep. We have done so much good, our Cyric-blighted poop don't stink. Not that I mind, eh?~ IF ~~ THEN EXIT END /* c-aranpidgood */
IF ~~ a3061 SAY ~[ARAN] Well, some good, some non-committal, but in general, we are on th' side o' Solars an' Planetars, eh? Good place to be, unless we are headed to Calimport next.~ IF ~~ THEN EXIT END /* c-aranpidbetter */
IF ~~ a3062 SAY ~[ARAN] If by reputation, you mean "who the hells are those idiots standin' over in the corner wi' all the fancy gear', then aye. Most folks just don't rightly know what to make o' us.~ IF ~~ THEN EXIT END /* c-aranpidneutral */
IF ~~ a3063 SAY ~[ARAN] Yep. Red Wizards, Xanathar's Guild, Zhents, an' us. Gets th' job done right quick when we say '<CHARNAME', an' folks start tremblin' an' hidin' their children.~ IF ~~ THEN EXIT END /* c-aranpidbad */
IF ~~ a3064 SAY ~[ARAN] Sure. Hells, that last bar, I mentioned your name to a Red Wizard an' he pissed himself. That be power o' a kind, I guess.~ IF ~~ THEN EXIT END /* c-aranpidevil */
IF ~~ a3073 SAY ~[ARAN] Laugh away, <CHARNAME>. In all those bard's stories, the protagonist goes in wi' a valiant band o' followers, an' by the end <PRO_HESHE> is valiantly strugglin' out while aforesaid band o' followers valiantly bleeds to death protectin' aforesaid protagonist's arse.~ IF ~~ THEN EXIT END /* c-aranpidWK1  */
IF ~~ a3074 SAY ~[ARAN] Well, th' wildlife has right perky breasts, long fangs, an' an unaccountable taste for a poor lad's blood. So far, I'd give it a nine out o' ten on th' 'stay the hells away' vacation list.~ IF ~~ THEN EXIT END /*  c-aranpidWK2  */
IF ~~ a3075 SAY ~[ARAN] I don't rightly think it wants us out, either. At least, not alive an' kickin'.~ IF ~~ THEN EXIT END /*  c-aranpidWK3  */
IF ~~ a3076 SAY ~[ARAN] Do that be a trick question?~ IF ~~ THEN EXIT END /*  c-aranpidWK4  */
IF ~~ a3077 SAY ~[ARAN] Now, relax, m'<PRO_BOYGIRL>... so far, we just get to battle improbably rare creatures from darkest deepest legend. Hells, as long as we are not battlin' a god or an arch-demon, we have nothin' to fear. All part o' th' job.~ IF ~~ THEN EXIT END /*  c-aranpidWK5  */
IF ~~ a3078 SAY ~[ARAN] Unless that drink is mostly hard liquor, forget it. I would say this place is gettin' on my nerves, but that would be an understatement.~ IF ~~ THEN EXIT END /*  c-aranpidWK6  */
IF ~~ a3079 SAY ~[ARAN] Tymora's against me today, I see. She's a fickle one, that one. Right. Business only. Got it.~ IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1)~ EXIT END /* c-aranrestopflirts */
IF ~~ a3080 SAY ~[ARAN] Sune's... well, I'd be a liar if I said I wasn't thinkin' about it. Can't figure if you want me to express appreciation, or not. Women. Naught but trouble, they are.~ IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT END /* c-aranrestartflirts */
IF ~~ a3081 SAY ~[ARAN] I'm still bloody well mad at you, <CHARNAME>. I'd be a liar if I said I wasn't thinkin' about you, though. Can't figure if you want me to express appreciation, or not. Women. Naught but trouble, they are.~ IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0)~ EXIT END /* c-aranrestartflirtsmad */
IF ~~ a3065 SAY ~[ARAN] Well, I been practicin'. Last night, I only set my hair on fire twice, an' I am pretty sure I managed no polymorph that cup back into... hells. Nope. It's still in spider form, an' crawlin' around in my gear.~ IF ~~ THEN EXIT END /* c-aranpidmage2 */
IF ~~ a3066 SAY ~[ARAN] Last person to say that was my old trainer. If you be anythin' like him, I suspect that really means 'Aran, you stupid bastard, next chance I get I am goin' to show you how to kill things by beatin' th' crap out o' you.' ~ IF ~~ THEN EXIT END /* c-aranpidfighter2 */
IF ~~ a3067 SAY ~[ARAN] Why, absolutely, workin' on one right now. Here, let me...~ = ~[ARAN] (*click*)~ = ~[ARAN] Cyric's Black Blood. Damned thing just caught my finger.~ IF ~~ THEN EXIT END /* c-aranpidthief2 */
IF ~~ a3068 SAY ~[ARAN] I was thinkin' th' same thing. Only, my god usually helps those who help themselves. So I be savin' up my askin' for guidance for when things get real bad. Like when we run out o' ale.~ IF ~~ THEN EXIT END /* c-aranpidcleric2 */
IF ~~ a3069 SAY ~[ARAN] It be a funny story. I was fightin' alongside some right fine paladins up near Cloakwood, an' one o' the young ones got stuck fightin' off some Chill. We got separated, an' things looked right desperate.~ = ~[ARAN] Well, the poor lad got a mite bit scared, but he was an officer, so no matter. I helped him out a bit, an' he got all puffed up an' promised if he lived through the day, he would see me inducted for bravery.~ = ~[ARAN] Long story short, we lived. An' th' damned fool came along an' brought me into the order, claimin' he could not go back on his word, made in front o' his god an' all.~ = ~[ARAN] I tried to let him know officers promise all sorts o' crap all the time to get men an' women to lay down their lives - it be part o' the job. But I didn't have th' heart to say no to the lad, he seemed so serious. So, here I be, the swearin'est, dirtiest, roughest son o' a bitch to be put in the Order. Somewhere, somebody be havin' a right fine cosmic joke, eh?~  IF ~~ THEN EXIT END /* c-aranpidpally2 */
IF ~~ a3070 SAY ~[ARAN] If I could control myself, do you think I'd be anywhere near here?~ IF ~~ THEN EXIT END /* c-aranpidsorc2 */
IF ~~ a3071 SAY ~[ARAN] You know, you have a bloody gift for understatement.~ IF ~~ THEN EXIT END /* c-aranpidmonk2 */
IF ~~ a3072 SAY ~[ARAN] Well, so far, the little princess has escaped the evil sorcerer, scammed her way into the prince's bedchamber, an' is busy teachin' th' lad how to wield his... oh. You mean th' journal o' our travels. They be comin' along fine.~ IF ~~ THEN EXIT END /* c-aranpidbard2 */
IF ~~ a1867 SAY ~[ARAN] Cyric's Grinnin' Teeth, you been waitin' to say that awhile, eh? Fine. Shuttin' up. Didn't want to talk to your sorry smelly arse anyways.~ IF ~~ THEN EXIT END /* c-aransilence2 */
IF ~~ a3127 SAY ~[ARAN] Suit yourself, as it be pleasin' you. I got little or naught else to do anyways.~ IF ~~ THEN EXIT END
IF ~~ a1868 SAY ~[ARAN] I got blighted tired o' losin'?~ IF ~~ THEN EXIT END /* not fighting in ToB  1 */
IF ~~ a1869 SAY ~[ARAN] Hey, we fight. I think. Don't we? Mayhap we don't. I don't rightly remember. Whatever you say, it probably is right.~ IF ~~ THEN EXIT END /* not fighting in ToB  2 */
IF ~~ a1870 SAY ~[ARAN] You leavin' me like that an' wanderin' off to a netherworld in a sub-dimention o' th' Nine Rings o' hell created out o' your subconsious kind o' put things into perspective. As in, if I want to be around her, I'd bloody well pick an' choose when to get a good discussion goin', an' when to say "yes dear".~ IF ~~ THEN EXIT END /* not fighting in ToB  3 */
IF ~~ a1871 SAY ~[ARAN] We fight. Just not in front o' th' children. Wait... we don't have no children. Say, there be a right interestin' idea in there somewheres...~ IF ~~ THEN EXIT END /* not fighting in ToB  4 */
IF ~~ a1872 SAY ~[ARAN] I don't remember us fightin'. Wait, hold on... oh, I remember. Th' sick feelin' in my gut, the angry looks, th' whole lack o' physical contact.... nope. Don't miss that one bit.~ IF ~~ THEN EXIT END /* not fighting in ToB  5 */
IF ~~ a1982 SAY ~[ARAN] That depends on what kind o' advice you be lookin' for, eh? I got some decent advice on decoratin', an mayhap some ideas on how to spruce th' place up a bit. Other than that, I am not sure I know what to say. I still am not even sure where 'here' be.~ IF ~~ THEN EXIT END /* Pocket Plane */
IF ~~ a1983 SAY ~[ARAN] There be naught in th' way o' knowledge personal-like, on account o' I have not been here before. But I can tell you that th' best defense be a right solid offence, when it comes to sieges like this. It seems like you could stay tight behind th' wall, but anyone who has giants lobbin' great blighted boulders at us has th' resources to slag th' walls to mud through magic. Then where do you be?~ IF ~~ THEN EXIT END /* Saradush */
IF ~~ a1984 SAY ~[ARAN] Blighted bad place to be standin' around jawin'. Too many entrances an' lots o' soldiers to close by for some comfort. Let's get to a place we can defend, eh?~ IF ~~ THEN EXIT END /* Gromnir 1st Level */
IF ~~ a1985 SAY ~[ARAN] Up that staircase or down, don't seem to matter much. There be a hells o' a racket comin' from above, though. Should we go check it out?~ IF ~~ THEN EXIT END /* Gromnir's Hideout */
IF ~~ a1986 SAY ~[ARAN] Th' only advice I have right now is to make th' most important choice you can make at a time like this... ale, wine, or harder spirits.~ IF ~~ THEN EXIT END /* Saradush Tavern (Tankard Tree) */
IF ~~ a1987 SAY ~[ARAN] I say we drop a coin or two as a nice little gesture. Never hurts to get th' word out, an' may make people think better o' us.~ IF ~~ THEN EXIT END /* Temple of Waukeen */
IF ~~ a1988 SAY ~[ARAN] Bloody poor defenses, if you ask me. We can probably waltz through this place wi' out much pain. This bastard doesn't seem to believe in trainin' his followers so well.~ IF ~~ THEN EXIT END /* Gromnir's Barracks */
IF ~~ a1989 SAY ~[ARAN] I'd rather not leave none o' us separate, on account o' all these blighted cells. No tellin' what be hidin' where. Not that thrilled wi' bein' no snack for whatever keeps this place so deserted, eh?~ IF ~~ THEN EXIT END /* Saradush Prison */
IF ~~ a1990 SAY ~[ARAN] Save everyone we can, an' watch everythin' right careful. There be more traps here than in some mad wizard's fantasy.~ IF ~~ THEN EXIT END /* Basement Entrance to Gromnir's Hideout */
IF ~~ a1991 SAY ~[ARAN] I don't trust that slippery bastard. I say we loot th' whole blighted place. It might not be th' nicest thing to do, but somethin' tells me th' bastard has it comin'.~ IF ~~ THEN EXIT END /* Kiser's Home */
IF ~~ a1992 SAY ~[ARAN] That bed be lookin' right invitin'. Pity there be such blighted noise none o' us could sleep.~ IF ~~ THEN EXIT END /* House (no exit?) */
IF ~~ a1993 SAY ~[ARAN] Chauntea's Basket, that kitchen be right fine. A steady source o' clean water, some o' th' finest produce... I'd be right happy to spend a few hours in there, eh?~ IF ~~ THEN EXIT END /* Countess Santele's Home */
IF ~~ a1994 SAY ~[ARAN] I say give me th' party purse, an' walk away. I bet there be some o' th' nicest scrolls an' supplies this side o' Neverwinter, an' wi' a little persuasion an' some coin we could get some right fine materials! look at th' quality o' th' scraps left behind. Think o' what his private stores must be like!~ IF ~~ THEN EXIT END /* Arcana Archives */
IF ~~ a1995 SAY ~[ARAN] Blighted hells, it be a house. What do you expect me to say - move in an' take up residence? Hey, when are we goin' to get back to our real job, an' stop all this wanderin' into random stranger's homes?~ IF ~~ THEN EXIT END /* House */
IF ~~ a1996 SAY ~[ARAN] We are traipsin' about in a sewer. A sewer. Bane's Blackened Bones, what do you think my advice is goin' to be? Don't drink th' water, don't breath in too deep, an' when you think you see somethin' movin', By Tymora's Coin let a lad know before he gets pulled down an' digested by somethin' that literally eats crap for dinner every night!~ IF ~~ THEN EXIT END /* Sewers beneath Saradush */
IF ~~ a1997 SAY ~[ARAN] Never saw no cellar what didn't have a secret or two. Or good root vegetables hidden away. That reminds me... I'm gettin' a mite peckish. What say we wrap up this visit real quick, an' find us somethin' nice to eat?~ IF ~~ THEN EXIT END /* Kiser's Home -- Cellar */
IF ~~ a1998 SAY ~[ARAN] I say we don't get too close to the recruiter, on account o' we might just end up havin' to man the walls instead o' bein' free to do as we please.~ IF ~~ THEN EXIT END /* Saradush Militia Entrance */
IF ~~ a1999 SAY ~[ARAN] Well, I don't recommend hangin' around long in jails. Though this one is at least a bit cleaner than some I done seen the insides of. An' at least we haven't been thrown down here to rot. Kind o' nice bein' just a visitor.~ IF ~~ THEN EXIT END /* Saradush Castle Jail (Kiser Plot) */
IF ~~ a2000 SAY ~[ARAN] I'd avoid fightin' with giants on general principle, myself. An' this place looks like it has had a few large footprints. Plus, some o' these boulders didn't levitate themselves randomly. So, I'm for makin' our way real quiet-like from now on, I think.~ IF ~~ THEN EXIT END /* Fire Giant Entrance Area */
IF ~~ a2001 SAY ~[ARAN] Find somethin' large to hide in, an' make sure you run like th' nine hells when someone starts singin' about grindin' our bones for their bread?~ IF ~~ THEN EXIT END /* Fire Giant Keep */
IF ~~ a2002 SAY ~[ARAN] I say this place looks like a trap hidden inside an ambush an' wrapped in horsedung. What say we step off to a nice range an' throw Fireballs an' some huge area o' effect spells until nothin' moves, then come in an' bring a body or two to someone who can speak wi' the dead? Might save us a world o' hurt.~ IF ~~ THEN EXIT END /* Nyalee's Hideout; Gorion Wraith */
IF ~~ a2003 SAY ~[ARAN] Defendin' a bridge be easy enough wi' ranged weapons an' magic. I say we pull back an' let th' bastards keep pilin' on. Th' only problem be when they decide to levitate across, or  there be so mant bodies that they can walk across on top o' 'em. Gond's Bladder, i saw that once.~ IF ~~ THEN EXIT END /* Yaga-Shura's Camp */
IF ~~ a2004 SAY ~[ARAN] Shiny floor, skull decorations, braziers o' fire... I like what he did wi' th' place. Well, not really. Blighted hells, <CHARNAME>, don't ask me... we came here to kill this Bane Kissed bastard an' figure out what this all be about!~ IF ~~ THEN EXIT END /* Yaga-Shura's Keep */
IF ~~ a2005 SAY ~[ARAN] I say we stock up on water. An' I don't mean wine, or naught else but plain, clean, clear water. Just lookin' at this Cyric-blighted place makes a man thirsty.~ IF ~~ THEN EXIT END /* Amkethran */
IF ~~ a2006 SAY ~[ARAN] Shades o' Calimport. This do take me back. Well, almost... there seem to be no real bath, an' th' servin' wenches wear a fair sight more than they did at some o' th' more interestin... err.... well, that be another story. Look careful in your drink before drinkin', eh? Thses people have an interestin' idea what constitutes 'fit for consumption'.~ IF ~~ THEN EXIT END /* Amkethran Inn */
IF ~~ a2007 SAY ~[ARAN] Gond's Gears! That be th' most interestin' contraption I ever did see. Hells, lets get this shortaxe wahtever it takes to get it workin' again. I just want to see it in action.~ IF ~~ THEN EXIT END /* Kerrick the Smith's House */
IF ~~ a2008 SAY ~[ARAN] Waukeen's Wise Ways, it be right nice to see th' Lady o' Coin be not completely forgotten. I'd say we could stay here an' relax a mite, if it weren't for th' fact that th' place be as barren o' sleepin' places as your average dungeon or cave. Pretty, though.~ IF ~~ THEN EXIT END /* Chyil's House */
IF ~~ a2009 SAY ~[ARAN] I say we stay out o' th' whole thing. An' stay out o' here, as well. Gettin' between crazed monks, an army o' mercenaries, an' a well supplied an' organized smugglin' operation sound like just th' sort o' thing to get all three o' th' sides to band together against the intelopers. An' by interlopers, that be meanin' ours truly.~ IF ~~ THEN EXIT END /* Smuggler Cave */
IF ~~ a2010 SAY ~[ARAN] Stairs, stairs, an' more bloody stairs. An' steep ones at that. My advice be to get us some o' those levitatin' boots. Or just avoid fightin' in here, anyways, on account o' fightin' uphill be a serious pain in th' arse.~ IF ~~ THEN EXIT END /* Balthazar's Home */
IF ~~ a2011 SAY ~[ARAN] Shhh! Llira's Joy, con't you rightly see they both be sleepin'? Let's be gettin' out right quick, an' right quiet.~ IF ~~ THEN EXIT END /* Commoner's Home */
IF ~~ a2012 SAY ~[ARAN] I don't rightly know. There be priorities, an' then there be priorities. I wish I had a right good answer for you, but I think I need to consult th' journal an' see what in th' nine hells we have finfshed up, an' what we have left undone.~ IF ~~ THEN EXIT END /* Empty Home */
IF ~~ a2013 SAY ~[ARAN] Mayhap talk to everyone, an' figure out what to do from there? That broken chair over there don't rightly make for much o' a conversation starter, but beggars can't rightly be choosers.~ IF ~~ THEN EXIT END /* Faheed's Home */
IF ~~ a2014 SAY ~[ARAN] Aye. When you find yourself in a bloody great bronzed chamber wi' all manner o' arcane carvin's, start lookin' for th' quickes way to GET TH" HELLS OUT.~ IF ~~ THEN EXIT END /* Amkethran Crypt */
IF ~~ a2015 SAY ~[ARAN] Dragon carvin's everywhere. Dark. Smells worse than my ffeet after a nine day march. My advice? Stage a tactical withrdawal. I be thinkin' a good place to be regroupin' be this quaint little tavern, mayhap you have heard of... Th' Friendly Arms Inn?~ IF ~~ THEN EXIT END /* Abazigal's Entrance */
IF ~~ a2016 SAY ~[ARAN] There be somethin' odd about those pools. I say we take a closer look. Mayhap we can find somethin' to our advantage. Or mayhap we just end up as mits o' sausage in someone's soup, eh?~ IF ~~ THEN EXIT END /* Abazigal's Lair Entrance Hall */
IF ~~ a2017 SAY ~[ARAN] Kill anythin' that wiggles, an' remind me to get somethin' what cuts fish-oil smell off o' gear.~ IF ~~ THEN EXIT END /* Abazigal's Lair -- Cells */
IF ~~ a2018 SAY ~[ARAN] I say we poke about in every single corner o' this place. Selune's Silver Strands, there be a fortune in vellum an' ink to plunder, an' have you seen th' rare inks he has just lyin' out there for th' takin'? I be like to jump out o' my skin!~ IF ~~ THEN EXIT END /* Abazigal's Lair -- Iycanth the Mad, Bondari */
IF ~~ a2019 SAY ~[ARAN] Brilliant. Just bloody brilliant. A whole room full o' pools, an' on top o' it, dragon poop. Why don't we just go fr th' whole trifecta, an' get a vampiric lich wi' halitosis. My advice? We need to take a blighted break. Every time we start makin' our way forward, we seem to step right into another wonderful experience just like this one.~ IF ~~ THEN EXIT END /* Abazigal's Lair -- Fll'Yissetat */
IF ~~ a2020 SAY ~[ARAN] PLACEHOLDER~ IF ~~ THEN EXIT END /* Abazigal's Hideout */
IF ~~ a2021 SAY ~[ARAN] Dive back through th' pool?~ IF ~~ THEN EXIT END /* Frost Salamander Cave */
IF ~~ a2022 SAY ~[ARAN] PLACEHOLDER~ IF ~~ THEN EXIT END /* Orbs and Gauth */
IF ~~ a2023 SAY ~[ARAN] I might have some advice, but I think I just swallowed a minnow. That be just wrong, that be.~ IF ~~ THEN EXIT END /* Pool Home -- breath under water */
IF ~~ a2024 SAY ~[ARAN] PLACEHOLDER~ IF ~~ THEN EXIT END /* Area outside Sendai's Hideout */
IF ~~ a2025 SAY ~[ARAN] We sure as Shar's Spit don't stand awound jawin'. This place be crawlin wi' those blighted Drow bastards.~ IF ~~ THEN EXIT END /* Main Entrance Sendai's Lair */
IF ~~ a2026 SAY ~[ARAN] My advice be to shut th' hells up an' kill everythin' we can. I'd say do it slow an' make 'em suffer, but right now speed be th' smartst route, I think.~ IF ~~ THEN EXIT END /* Sendai's Lair -- Slavemaster */
IF ~~ a2027 SAY ~[ARAN] Get out quick. Flame everythin'.~ IF ~~ THEN EXIT END /* Sendai's Lair -- Spiders */
IF ~~ a2028 SAY ~[ARAN] PLACEHOLDER~ IF ~~ THEN EXIT END /* Sendai's Lair -- Crossway */
IF ~~ a2029 SAY ~[ARAN] Small area. Confined spaces. We should throw up some defenses, an' blast area o' effect spells any time somethin' moves.~ IF ~~ THEN EXIT END /* Sendai's Lair -- Diaytha, Abishai */
IF ~~ a2030 SAY ~[ARAN] What do you be askin' me for? We don't rightly have much choice. We go forward, we go back... eaither way, we are bound to run into trouble. Drow travel in packs, like seriously screwed up gibberlings.~ IF ~~ THEN EXIT END /* Sendai's Lair -- Captain Egeissag */
IF ~~ a2031 SAY ~[ARAN] We done come this far. No sense not to go one more step forward, eh? By th' way,. I done made out a last will an' testament, just in case. Probably a bit late for it, on account of if you be needin' to read it, we probably will have all taken th' great dirt nap, eh?~ IF ~~ THEN EXIT END /* Sendai's Lair -- Mithykyl */
IF ~~ a2032 SAY ~[ARAN] Nope. I got nothin'.~ IF ~~ THEN EXIT END /* Sendai's Lair -- Sendai */
IF ~~ a2033 SAY ~[ARAN] PLACEHOLDER~ IF ~~ THEN EXIT END /* Sendai's Lair -- Drow */
IF ~~ a2034 SAY ~[ARAN] Every time we be seein' those funny tusk-like projections circlin' 'round some dias, it seems there be a whole load o' trouble headin' our way. I say we start lookin' in th' doors careful like, an' every time we see somethin' that looks like this, just walk away.~ IF ~~ THEN EXIT END /* Sendai's Lair -- Odamaron */
IF ~~ a2035 SAY ~[ARAN] Smells funny. Odd food supplies for a woodcutter. We'd best poke around a bit. But I think I'll be leavin' those mushrooms over there alone, on account o' I think they be right poisonous.~ IF ~~ THEN EXIT END /* Woodcutter's House -- Sendai's Area */
IF ~~ a2036 SAY ~[ARAN] Kill anythin' that moves. Then kill it again. Mayhap dig it up an' kill it a third time, just to be sure. Gods don't rightly die quick, is my guess.~ IF ~~ THEN EXIT END /* The Throne of Bhaal */
IF ~~ a2037 SAY ~[ARAN] You know, short o' th' standard combat tactics, I really got nothin' here. Ever since we started poppin' in an' out o' that blighted section o' hell, my sense o' what be possible has had to have some readjustin'. I'm not rightly sure I have a good handle on what we can do. Right now, it looks like we can take on half o' Faerun in battle an' win. I'm just not sure that be th' best way to get your point across, eh? But one thing be for sure... we needs be gatherin' what we can o' that water.~ IF ~~ THEN EXIT END /* Oasis in Tethyr */
IF ~~ a2038 SAY ~[ARAN] Anyone for a nice swim? That water looks right peaceful an' happy, it does. Or not.~ IF ~~ THEN EXIT END /* River Area */

/* PID Scribing Scrolls Responses */

IF ~~ a3031
  SAY ~[ARAN] Aye, I can scribe some scrolls, sometimes. If someone knows some mage spell, an' we work together for a bit, I can usually come up wi' a decent usable scroll. No summonin' spells, and naught o' copywork from existin' scroll, though.~
  = ~[ARAN] It be a mite slower than gettin' th' experienced folks to do it, but it works - an' I do it for free, on account o' I just really do enjoy th' work. I'll even buy my own supplies, or make 'em. What do you want me to work on, eh?~
  ++ ~[PC] On second thought, never mind. You need to get sleep, and so does the rest of the party.~ + a3039
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + ~[PC] We have some mage spells available in the party, so scribe one of those.~ + a3041
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + ~[PC] We have no mages available in the party, but can you scribe one anyways?~ + a3042
  + ~Class("c-aran",MAGE_ALL)~ + ~Hey, you are a mage yourself - why does this take so long? I hear high level mages can run one of these out in a day!~ + a3040
  + ~!Class("c-aran",MAGE_ALL)~ + ~[PC] Hey, you are no mage - you can not scribe a scroll of something you do not have the magic to cast!~ + a3041
  + ~!Class("c-aran",CLERIC_ALL)~ + ~[PC] Can you scribe cleric scrolls?~ + a3037
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] Can you scribe cleric scrolls?~ + a3038
  ++ ~[PC] Why no summoning scrolls or copying existing scrolls?~ + a3047
  IF ~Global("c-arscr0","LOCALS",1)~ THEN GOTO a3043
END

IF ~~ a3032 SAY ~[ARAN] Keep your shirt on, eh? I'm still workin' on it. I said how long it might be, an' I hold to my contracts, written or spoken.~ IF ~~ THEN EXIT END
IF ~~ a3033 SAY ~[ARAN] Aye. It is finished. See, I just magically added a whole extra bunch o' time to today, an' somehow a whole week passed in an instant, an' while I was at it, I grew bunnie ears an' married a Drowess.~ IF ~~ THEN EXIT END
IF ~~ a3034 SAY ~[ARAN] No. Not done yet, eh?~ IF ~~ THEN EXIT END
IF ~~ a3035 SAY ~[ARAN] Ilmater's Sufferin', do you ask questions like 'are we there yet?' 'how long until th' next town?' 'why is th' grass green?' 'why is Aran about to make a blighted rude gesture in your general direction?' What are you, <PRO_BOYGIRL>, a four year old?~ IF ~~ THEN EXIT END
IF ~~ a3036 SAY ~[ARAN] Now, I'm rightly a patient man. Well, sort o' patient. So I'm goin' to say this, slow - like, just in case you didn't quite understand me. N O T Y E T.~ IF ~~ THEN EXIT END

IF ~~ a3037
  SAY ~[ARAN] No, it don't rightly work that way. See, this be more copywork than inspiration, an' trickin' th' magic into thinkin' it be th' right place to be don't rightly work so well when there be a god actively grantin' th' power. Trickin' gods, well, that's a bit more dangerous than most people want to be tryin'.~
  ++ ~[PC] On second thought, never mind. You need to get sleep, and so does the rest of the party.~ + a3039
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + ~[PC] We have some mage spells available in the party, so scribe one of those.~ + a3048
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + ~[PC] We have no mages available in the party, but can you scribe one anyways?~ + a3042
  + ~Class("c-aran",MAGE_ALL)~ + ~[PC] Hey, you are a mage yourself - why does this take so long? I hear high level mages can run one of these out in a day!~ + a3040
  + ~!Class("c-aran",MAGE_ALL)~ + ~[PC] Hey, you are no mage - you can not scribe a scroll of something you do not have the magic to cast!~ + a3041
END

IF ~~ a3038
  SAY ~[ARAN] Mayhap someday, when my god decides to get that whole side o' my faith active. But not through this process, ever. See, this be more copywork than inspiration, an' trickin' th' magic into thinkin' it be th' right place to be don't rightly work so well when there be a god actively grantin' th' power. Trickin' gods, well, that's a bit more dangerous than most people want to be tryin'.~
  ++ ~[PC] On second thought, never mind. You need to get sleep, and so does the rest of the party.~ + a3039
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + ~[PC] We have some mage spells available in the party, so scribe one of those.~ + a3043
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + ~[PC] We have no mages available in the party, but can you scribe one anyways?~ + a3042
  + ~Class("c-aran",MAGE_ALL)~ + ~Hey, you are a mage yourself - why does this take so long? I hear high level mages can run one of these out in a day!~ + a3040
  + ~!Class("c-aran",MAGE_ALL)~ + ~[PC] Hey, you are no mage - you can not scribe a scroll of something you do not have the magic to cast!~ + a3041
END

IF ~~ a3039
  SAY ~[ARAN] Sure, I will take a break. I have a mite o' letter writin' to catch up on, anyways.~
  IF ~~ THEN EXIT
END

IF ~~ a3040
  SAY ~[ARAN] Look, I get th' same skills as anyone else what studies magic. I get strong enough an' experienced enough, th' bloody things write themselves right out o' my head an' onto the blank parchment, pretty as you please. I can do what any mage does, an' write spells out o' my own head, if I have 'em memorized myself.~
  = ~[ARAN] This work, it be right different. This be more copywork, an' then trickin' th' magic into thinkin' it be th' right place to be, sort of. There's advantages to this, though. It be cheaper, works wi' any mage in th' party what has spells ready to cast,  an' most o' all, no one has to rest for th' spell. The magic, it just builds up, see?~
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + ~[PC] We have some mage spells available in the party, so scribe one of those.~ + a3043
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + ~[PC] We have no mages available in the party, but can you scribe one anyways?~ + a3042
  ++ ~[PC] On second thought, never mind. You need to get sleep, and so does the rest of the party.~ + a3039
END

IF ~~ a3041
  SAY ~[ARAN] Look, I got a touch, I do. I know a mage what's strong enough an' experienced enough, they just prepare an' then th' bloody things write themselves right out o' their head an' onto the blank parchment, pretty as you please.~
  = ~[ARAN] This work, it be right different. This be more copywork, an' then trickin' th' magic into thinkin' it be th' right place to be, sort of. There's advantages to this, though. It be cheaper, it needs no high level magickin' an' most o' all, no one has to rest for th' spell. Th' magic, it just builds up, see?~
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + ~[PC] We have some mage spells available in the party, so scribe one of those.~ + a3043
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + ~[PC] We have no mages available in the party, but can you scribe one anyways?~ + a3042
  ++ ~[PC] On second thought, never mind. You need to get sleep, and so does the rest of the party.~ + a3039
END

IF ~~ a3042
  SAY ~[ARAN] Right. Sure. If you can pull a live rabbit out of your arse, an' mayhap ask Mystra to grant me special powers. Until then, I needs be workin' with a mage what can guide me, an' give magic to th' words on th' page.~
  IF ~~ THEN EXIT
END

IF ~~ a3043
  SAY ~[ARAN] Let me take a look... how long you want me to be workin'?~
  + ~OR(21) HaveSpellParty(2101) HaveSpellParty(2102) HaveSpellParty(2103) HaveSpellParty(2104) HaveSpellParty(2105) HaveSpellParty(2106) HaveSpellParty(2107) HaveSpellParty(2108) HaveSpellParty(2110) HaveSpellParty(2111) HaveSpellParty(2112) HaveSpellParty(2113) HaveSpellParty(2114) HaveSpellParty(2115) HaveSpellParty(2116) HaveSpellParty(2117) HaveSpellParty(2118) HaveSpellParty(2119) HaveSpellParty(2120) HaveSpellParty(2123) HaveSpellParty(2125)~ + ~[PC] Show me what you have that takes a day or two.~ + a3046
  + ~OR(21) HaveSpellParty(2201) HaveSpellParty(2202) HaveSpellParty(2203) HaveSpellParty(2205) HaveSpellParty(2206) HaveSpellParty(2207) HaveSpellParty(2208) HaveSpellParty(2209) HaveSpellParty(2210) HaveSpellParty(2211) HaveSpellParty(2212) HaveSpellParty(2213) HaveSpellParty(2214) HaveSpellParty(2215) HaveSpellParty(2217) HaveSpellParty(2218) HaveSpellParty(2219) HaveSpellParty(2220) HaveSpellParty(2221) HaveSpellParty(2223) HaveSpellParty(2224)~ + ~[PC] Show me what you have that takes two or three days.~ + a3054
  + ~OR(22) HaveSpellParty(2301) HaveSpellParty(2302) HaveSpellParty(2303) HaveSpellParty(2304) HaveSpellParty(2305) HaveSpellParty(2306) HaveSpellParty(2307) HaveSpellParty(2308) HaveSpellParty(2310) HaveSpellParty(2311) HaveSpellParty(2312) HaveSpellParty(2313) HaveSpellParty(2314) HaveSpellParty(2316) HaveSpellParty(2317) HaveSpellParty(2318) HaveSpellParty(2319) HaveSpellParty(2320) HaveSpellParty(2321) HaveSpellParty(2322) HaveSpellParty(2324) HaveSpellParty(2325)~ + ~[PC] Show me what you have that takes three or four days.~ + a3055
  + ~OR(18) HaveSpellParty(2401) HaveSpellParty(2403) HaveSpellParty(2404) HaveSpellParty(2405) HaveSpellParty(2406) HaveSpellParty(2408) HaveSpellParty(2409) HaveSpellParty(2410) HaveSpellParty(2411) HaveSpellParty(2412) HaveSpellParty(2413) HaveSpellParty(2414) HaveSpellParty(2417) HaveSpellParty(2418) HaveSpellParty(2419) HaveSpellParty(2420) HaveSpellParty(2424) HaveSpellParty(2425)~ + ~[PC] Show me what you have that takes four or five days.~ + a3056
  + ~OR(17) HaveSpellParty(2502) HaveSpellParty(2503) HaveSpellParty(2505) HaveSpellParty(2506) HaveSpellParty(2508) HaveSpellParty(2509) HaveSpellParty(2510) HaveSpellParty(2511) HaveSpellParty(2512) HaveSpellParty(2513) HaveSpellParty(2514) HaveSpellParty(2515) HaveSpellParty(2517) HaveSpellParty(2518) HaveSpellParty(2519) HaveSpellParty(2522) HaveSpellParty(2523)~ + ~[PC] Show me what you have that takes about five or six days.~ + a3057
  + ~OR(17) HaveSpellParty(2602) HaveSpellParty(2603) HaveSpellParty(2604) HaveSpellParty(2605) HaveSpellParty(2606) HaveSpellParty(2607) HaveSpellParty(2608) HaveSpellParty(2609) HaveSpellParty(2611) HaveSpellParty(2612) HaveSpellParty(2613) HaveSpellParty(2614) HaveSpellParty(2615) HaveSpellParty(2616) HaveSpellParty(2617) HaveSpellParty(2618) HaveSpellParty(2625)~ + ~[PC] Show me what you have that takes about six or seven days.~ + a3058
  ++ ~[PC] I suppose if this list is blank, you don't have anything available, right... you could just say so, you know.~ + a3044
  ++ ~[PC] Never mind. Forget the whole thing.~ + a3039
  IF ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ THEN GOTO a3053
END

IF ~~ a3044
  SAY ~[ARAN] Aye... well, on second thought... Mystra's Mysterious Mouth, I be findin' naught that matches between my skills an' what th' party has memorized. I guess I am not goin' to be able to help you. Try me again when we are all rested an' up to speed, eh? Or mayhap when someone memorizes a new spell.~
  ++ ~[PC] Check again.~ + a3045
  ++ ~[PC] Fine. Go on about your business, then.~ + a3039
  ++ ~[PC] Perhaps later. I think I will move on, now.~ + a3209
END

IF ~~ a3209 SAY ~[ARAN] Suit yourself. I think I be runnin' low on supplies anyways.~ IF ~~ THEN EXIT END

IF ~~ a3045
  SAY ~[ARAN] Sure thing. Let me check again...~
  ++ ~[PC] Never mind. Forget the whole thing.~ + a3039
  + ~OR(21) HaveSpellParty(2101) HaveSpellParty(2102) HaveSpellParty(2103) HaveSpellParty(2104) HaveSpellParty(2105) HaveSpellParty(2106) HaveSpellParty(2107) HaveSpellParty(2108) HaveSpellParty(2110) HaveSpellParty(2111) HaveSpellParty(2112) HaveSpellParty(2113) HaveSpellParty(2114) HaveSpellParty(2115) HaveSpellParty(2116) HaveSpellParty(2117) HaveSpellParty(2118) HaveSpellParty(2119) HaveSpellParty(2120) HaveSpellParty(2123) HaveSpellParty(2125)~ + ~[PC] Show me what you have that takes a day or two.~ + a3046
  + ~OR(21) HaveSpellParty(2201) HaveSpellParty(2202) HaveSpellParty(2203) HaveSpellParty(2205) HaveSpellParty(2206) HaveSpellParty(2207) HaveSpellParty(2208) HaveSpellParty(2209) HaveSpellParty(2210) HaveSpellParty(2211) HaveSpellParty(2212) HaveSpellParty(2213) HaveSpellParty(2214) HaveSpellParty(2215) HaveSpellParty(2217) HaveSpellParty(2218) HaveSpellParty(2219) HaveSpellParty(2220) HaveSpellParty(2221) HaveSpellParty(2223) HaveSpellParty(2224)~ + ~[PC] Show me what you have that takes two or three days.~ + a3054
  + ~OR(22) HaveSpellParty(2301) HaveSpellParty(2302) HaveSpellParty(2303) HaveSpellParty(2304) HaveSpellParty(2305) HaveSpellParty(2306) HaveSpellParty(2307) HaveSpellParty(2308) HaveSpellParty(2310) HaveSpellParty(2311) HaveSpellParty(2312) HaveSpellParty(2313) HaveSpellParty(2314) HaveSpellParty(2316) HaveSpellParty(2317) HaveSpellParty(2318) HaveSpellParty(2319) HaveSpellParty(2320) HaveSpellParty(2321) HaveSpellParty(2322) HaveSpellParty(2324) HaveSpellParty(2325)~ + ~[PC] Show me what you have that takes three or four days.~ + a3055
  + ~OR(18) HaveSpellParty(2401) HaveSpellParty(2403) HaveSpellParty(2404) HaveSpellParty(2405) HaveSpellParty(2406) HaveSpellParty(2408) HaveSpellParty(2409) HaveSpellParty(2410) HaveSpellParty(2411) HaveSpellParty(2412) HaveSpellParty(2413) HaveSpellParty(2414) HaveSpellParty(2417) HaveSpellParty(2418) HaveSpellParty(2419) HaveSpellParty(2420) HaveSpellParty(2424) HaveSpellParty(2425)~ + ~[PC] Show me what you have that takes four or five days.~ + a3056
  + ~OR(17) HaveSpellParty(2502) HaveSpellParty(2503) HaveSpellParty(2505) HaveSpellParty(2506) HaveSpellParty(2508) HaveSpellParty(2509) HaveSpellParty(2510) HaveSpellParty(2511) HaveSpellParty(2512) HaveSpellParty(2513) HaveSpellParty(2514) HaveSpellParty(2515) HaveSpellParty(2517) HaveSpellParty(2518) HaveSpellParty(2519) HaveSpellParty(2522) HaveSpellParty(2523)~ + ~[PC] Show me what you have that takes about five or six days.~ + a3057
  + ~OR(17) HaveSpellParty(2602) HaveSpellParty(2603) HaveSpellParty(2604) HaveSpellParty(2605) HaveSpellParty(2606) HaveSpellParty(2607) HaveSpellParty(2608) HaveSpellParty(2609) HaveSpellParty(2611) HaveSpellParty(2612) HaveSpellParty(2613) HaveSpellParty(2614) HaveSpellParty(2615) HaveSpellParty(2616) HaveSpellParty(2617) HaveSpellParty(2618) HaveSpellParty(2625)~ + ~[PC] Show me what you have that takes about six or seven days.~ + a3058
END

IF ~~ a3046
  SAY ~[ARAN] Based on what we have memorized in th' party, an' what materials I have right here, I can start on one o' these. You chose, an' I'll get it.~
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2101)~ + ~[PC] Grease, 2 days.~ DO ~SetGlobal("c-arSCRL66","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3049 /* WIZARD_GREASE */
  + ~HaveSpellParty(2102)~ + ~[PC] Armor, 2 days.~ DO ~SetGlobal("c-arSCRL67","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3050 /* WIZARD_ARMOR */
  + ~HaveSpellParty(2103)~ + ~[PC] Burning Hands, 2 days.~ DO ~SetGlobal("c-arSCRL68","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3051 /* WIZARD_BURNING_HANDS */
  + ~HaveSpellParty(2104)~ + ~[PC] Charm Person, 2 days.~ DO ~SetGlobal("c-arSCRL69","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3052 /* WIZARD_CHARM_PERSON */
  + ~HaveSpellParty(2105)~ + ~[PC] Color Spray, 2 days.~ DO ~SetGlobal("c-arSCRL70","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3053 /* WIZARD_COLOR_SPRAY */
  + ~HaveSpellParty(2106)~ + ~[PC] Blindness, 2 days.~ DO ~SetGlobal("c-arSCRL71","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3049 /* WIZARD_BLINDNESS */
  + ~HaveSpellParty(2107)~ + ~[PC] Friends, 2 days.~ DO ~SetGlobal("c-arSCRL72","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3050 /* WIZARD_FRIENDS */
  + ~HaveSpellParty(2108)~ + ~[PC] Protection from Petrification, 2 days.~ DO ~SetGlobal("c-arSCRL15","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3051 /* WIZARD_PROTECTION_FROM_PETRIFICATION */
  + ~HaveSpellParty(2110)~ + ~[PC] Identify, 2 days.~ DO ~SetGlobal("c-arSCRL75","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3052 /* WIZARD_IDENTIFY */
  + ~HaveSpellParty(2111)~ + ~[PC] Infravision, 2 days.~ DO ~SetGlobal("c-arSCRL76","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3048 /* WIZARD_INFRAVISION */
  + ~HaveSpellParty(2112)~ + ~[PC] Magic Missile, 2 days.~ DO ~SetGlobal("c-arSCRL77","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3049 /* WIZARD_MAGIC_MISSILE */
  + ~HaveSpellParty(2113)~ + ~[PC] Protection from Evil, 2 days.~ DO ~SetGlobal("c-arSCRL78","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3050 /* WIZARD_PROTECTION_FROM_EVIL */
  + ~HaveSpellParty(2114)~ + ~[PC] Shield, 2 days.~ DO ~SetGlobal("c-arSCRL79","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3051 /* WIZARD_SHIELD */
  + ~HaveSpellParty(2115)~ + ~[PC] Shocking Grasp, 2 days.~ DO ~SetGlobal("c-arSCRL80","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3052 /* WIZARD_SHOCKING_GRASP */
  + ~HaveSpellParty(2116)~ + ~[PC] Sleep, 2 days.~ DO ~SetGlobal("c-arSCRL81","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3048 /* WIZARD_SLEEP */
  + ~HaveSpellParty(2117)~ + ~[PC] Chill Touch, 2 days.~ DO ~SetGlobal("c-arSCRL82","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3049 /* WIZARD_CHILL_TOUCH */
  + ~HaveSpellParty(2118)~ + ~[PC] Chromatic Orb, 2 days.~ DO ~SetGlobal("c-arSCRL83","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3050 /* WIZARD_CHROMATIC_ORB */
  + ~HaveSpellParty(2119)~ + ~[PC] Larloch's Minor Drain, 2 days.~ DO ~SetGlobal("c-arSCRL84","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3051 /* WIZARD_LARLOCH_MINOR_DRAIN */
  + ~HaveSpellParty(2120)~ + ~[PC] Reflected Image, 2 days.~ DO ~SetGlobal("c-arSCRL5U","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3052 /* WIZARD_REFLECTED_IMAGE */
  + ~HaveSpellParty(2123)~ + ~[PC] Find Familiar, 2 days.~ DO ~SetGlobal("c-arSCRL6D","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3048 /* WIZARD_FIND_FAMILAR */
  + ~HaveSpellParty(2125)~ + ~[PC] Spook, 2 days.~ DO ~SetGlobal("c-arSCRLA6","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",TWO_DAYS)~ + a3049 /* WIZARD_SPOOK  */
  ++ ~[PC] I do not want any of these. Forget the whole thing.~ + a3039
  ++ ~[PC] I do not want any of these. Can I see what else you can scribe?~ + a3045
END

IF ~~ a3047
  SAY ~[ARAN] Summonin' anythin' requires perfection, an' more skill than I would trust. Copyin', well, that be awkward... I can't rightly say why it won't work, but trust me. Th' last time I tried it, I had to scramble for cover when the fool thing blew up in my face.~
  ++ ~[PC] On second thought, never mind. You need to get sleep, and so does the rest of the party.~ + a3039
  + ~OR(6) Class(Player1,MAGE_ALL) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + ~[PC] We have some mage spells available in the party, so scribe one of those.~ + a3041
  + ~!Class(Player1,MAGE_ALL) !Class(Player2,MAGE_ALL) !Class(Player3,MAGE_ALL) !Class(Player4,MAGE_ALL) !Class(Player5,MAGE_ALL) !Class(Player6,MAGE_ALL)~ + ~[PC] We have no mages available in the party, but can you scribe one anyways?~ + a3042
  + ~Class("c-aran",MAGE_ALL)~ + ~Hey, you are a mage yourself - why does this take so long? I hear high level mages can run one of these out in a day!~ + a3040
  + ~!Class("c-aran",MAGE_ALL)~ + ~[PC] Hey, you are no mage - you can not scribe a scroll of something you do not have the magic to cast!~ + a3041
  + ~!Class("c-aran",CLERIC_ALL)~ + ~[PC] Can you scribe cleric scrolls?~ + a3037
  + ~Class("c-aran",CLERIC_ALL)~ + ~[PC] Can you scribe cleric scrolls?~ + a3038
END

IF ~~ a3048 SAY ~[ARAN] Aye, then. Mystra's Magnificent Mouth, it looks like I have my work cut out for me. Then again, I do rightly enjoy th' challenge.~ IF ~~ THEN EXIT END
IF ~~ a3049 SAY ~[ARAN] Aye, then. Mystra's Grey Eyes, it looks like I have my work cut out for me. Then again, I do rightly enjoy th' challenge.~ IF ~~ THEN EXIT END
IF ~~ a3050 SAY ~[ARAN] Aye, then. Torm's Trusty Two-hander, it looks like I have my work cut out for me. Then again, I do rightly enjoy th' challenge.~ IF ~~ THEN EXIT END
IF ~~ a3051 SAY ~[ARAN] Aye, then. Mystra's Magical Mantle, it looks like I have my work cut out for me. Then again, I do rightly enjoy th' challenge.~ IF ~~ THEN EXIT END
IF ~~ a3052 SAY ~[ARAN] Aye, then. Mystra's Mighty Magics, it looks like I have my work cut out for me. Then again, I do rightly enjoy th' challenge.~ IF ~~ THEN EXIT END
IF ~~ a3053 SAY ~[ARAN] O' course, we need a mage in th' party, eh? So when we get one, let me know.~ IF ~~ THEN EXIT END

IF ~~ a3054
  SAY ~[ARAN] Based on what we have memorized in th' party, an' what materials I have right here, I can start on one o' these. You chose, an' I'll get it.~
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2201)~ + ~[PC] Blur, 3 days.~ DO ~SetGlobal("c-arSCRL85","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3050 /* WIZARD_BLUR */
  + ~HaveSpellParty(2202)~ + ~[PC] Detect Evil, 3 days.~ DO ~SetGlobal("c-arSCRL86","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3051 /* WIZARD_DETECT_EVIL */
  + ~HaveSpellParty(2203)~ + ~[PC] Detect Invisibility, 3 days.~ DO ~SetGlobal("c-arSCRL87","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3052 /* WIZARD_DETECT_INVISIBILITY */
  + ~HaveSpellParty(2205)~ + ~[PC] Horror, 3 days.~ DO ~SetGlobal("c-arSCRL89","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3048 /* WIZARD_HORROR */
  + ~HaveSpellParty(2206)~ + ~[PC] Invisibility, 3 days.~ DO ~SetGlobal("c-arSCRL90","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3049 /* WIZARD_INVISIBILITY */
  + ~HaveSpellParty(2207)~ + ~[PC] Knock, 3 days.~ DO ~SetGlobal("c-arSCRL91","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3050 /* WIZARD_KNOCK */
  + ~HaveSpellParty(2208)~ + ~[PC] Know Alignment, 3 days.~ DO ~SetGlobal("c-arSCRL92","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3051 /* WIZARD_KNOW_ALIGNMENT */
  + ~HaveSpellParty(2209)~ + ~[PC] Luck, 3 days.~ DO ~SetGlobal("c-arSCRL93","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3052 /* WIZARD_LUCK */
  + ~HaveSpellParty(2210)~ + ~[PC] Resist Fear, 3 days.~ DO ~SetGlobal("c-arSCRL94","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3050 /* WIZARD_RESIST_FEAR */
  + ~HaveSpellParty(2211)~ + ~[PC] Melf's Acid Arrow, 3 days.~ DO ~SetGlobal("c-arSCRL95","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3051 /* WIZARD_MELF_ACID_ARROW */
  + ~HaveSpellParty(2212)~ + ~[PC] Mirror Image, 3 days.~ DO ~SetGlobal("c-arSCRL96","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3052 /* WIZARD_MIRROR_IMAGE */
  + ~HaveSpellParty(2213)~ + ~[PC] Stinking Cloud, 3 days.~ DO ~SetGlobal("c-arSCRL97","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3048 /* WIZARD_STINKING_CLOUD */
  + ~HaveSpellParty(2214)~ + ~[PC] Strength, 3 days.~ DO ~SetGlobal("c-arSCRL98","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3049 /* WIZARD_STRENGTH */
  + ~HaveSpellParty(2215)~ + ~[PC] Web, 3 days.~ DO ~SetGlobal("c-arSCRL99","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3050 /* WIZARD_WEB */
  + ~HaveSpellParty(2217)~ + ~[PC] Agannazar's Scorcher, 3 days.~ DO ~SetGlobal("c-arSCRL1B","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3051 /* WIZARD_AGANNAZAR_SCORCHER */
  + ~HaveSpellParty(2218)~ + ~[PC] Ghoul Touch, 3 days.~ DO ~SetGlobal("c-arSCRL1C","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3052 /* WIZARD_GHOUL_TOUCH */
  + ~HaveSpellParty(2219)~ + ~[PC] Vocalize, 3 days.~ DO ~SetGlobal("c-arSCRL3G","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3048 /* WIZARD_VOCALIZE */
  + ~HaveSpellParty(2220)~ + ~[PC] Power Word, Sleep, 3 days.~ DO ~SetGlobal("c-arSCRL6E","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3049 /* WIZARD_POWER_WORD_SLEEP */
  + ~HaveSpellParty(2221)~ + ~[PC] Ray of Enfeeblement, 3 days.~ DO ~SetGlobal("c-arSCRL6F","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3050 /* WIZARD_RAY_OF_ENFEEBLEMENT */
  + ~HaveSpellParty(2223)~ + ~[PC] Deafness, 3 days.~ DO ~SetGlobal("c-arSCRLA2","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3051 /* WIZARD_DEAFNESS */
  + ~HaveSpellParty(2224)~ + ~[PC] Glitterdust, 3 days.~ DO ~SetGlobal("c-arSCRLA3","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",THREE_DAYS)~ + a3052 /* WIZARD_GLITTERDUST */
  ++ ~[PC] I do not want any of these. Forget the whole thing.~ + a3039
  ++ ~[PC] I do not want any of these. Can I see what else you can do?~ + a3045
END

IF ~~ a3055
  SAY ~[ARAN] Based on what we have memorized in th' party, an' what materials I have right here, I can start on one o' these. You chose, an' I'll get it.~
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2301)~ + ~[PC] Clairvoyance, 4 days.~ DO ~SetGlobal("c-arSCRL1D","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3048 /* WIZARD_CLAIRVOYANCE */
  + ~HaveSpellParty(2302)~ + ~[PC] Dispel Magic, 4 days.~ DO ~SetGlobal("c-arSCRL1E","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3052 /* WIZARD_DISPEL_MAGIC */
  + ~HaveSpellParty(2303)~ + ~[PC] Flame Arrow, 4 days.~ DO ~SetGlobal("c-arSCRL1F","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3051 /* WIZARD_FLAME_ARROW */
  + ~HaveSpellParty(2304)~ + ~[PC] Fireball, 4 days.~ DO ~SetGlobal("c-arSCRL1G","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3050 /* WIZARD_FIREBALL */
  + ~HaveSpellParty(2305)~ + ~[PC] Haste, 4 days.~ DO ~SetGlobal("c-arSCRL1H","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3049 /* WIZARD_HASTE */
  + ~HaveSpellParty(2306)~ + ~[PC] Hold Person, 4 days.~ DO ~SetGlobal("c-arSCRL1I","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3049 /* WIZARD_HOLD_PERSON */
  + ~HaveSpellParty(2307)~ + ~[PC] Invisibility 10' radius, 4 days.~ DO ~SetGlobal("c-arSCRL1J","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3050 /* WIZARD_INVISIBILITY_10_FOOT */
  + ~HaveSpellParty(2308)~ + ~[PC] Lightning Bolt, 4 days.~ DO ~SetGlobal("c-arSCRL1K","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3051 /* WIZARD_LIGHTNING_BOLT */
  + ~HaveSpellParty(2310)~ + ~[PC] NonDetection, 4 days.~ DO ~SetGlobal("c-arSCRL1M","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3052 /* WIZARD_NON_DETECTION */
  + ~HaveSpellParty(2311)~ + ~[PC] Protection from Normal Missiles, 4 days.~ DO ~SetGlobal("c-arSCRL1N","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3048 /* WIZARD_PROTECTION_FROM_NORMAL_MISSILES */
  + ~HaveSpellParty(2312)~ + ~[PC] Slow, 4 days.~ DO ~SetGlobal("c-arSCRL1O","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3048 /* WIZARD_SLOW */
  + ~HaveSpellParty(2313)~ + ~[PC] Skull Trap, 4 days.~ DO ~SetGlobal("c-arSCRL1P","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3052 /* WIZARD_SKULL_TRAP */
  + ~HaveSpellParty(2314)~ + ~[PC] Vampiric Touch, 4 days.~ DO ~SetGlobal("c-arSCRL1Q","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3051 /* WIZARD_VAMPIRIC_TOUCH */
  + ~HaveSpellParty(2316)~ + ~[PC] Dire Charm, 4 days.~ DO ~SetGlobal("c-arSCRL1S","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3050 /* WIZARD_DIRE_CHARM */
  + ~HaveSpellParty(2317)~ + ~[PC] Ghost Armor, 4 days.~ DO ~SetGlobal("c-arSCRL1T","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3049 /* WIZARD_GHOST_ARMOR */
  + ~HaveSpellParty(2318)~ + ~[PC] Minor Spell Deflection, 4 days.~ DO ~SetGlobal("c-arSCRL6G","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3049 /* WIZARD_MINOR_SPELL_DEFLECTION */
  + ~HaveSpellParty(2319)~ + ~[PC] Protection from Fire, 4 days.~ DO ~SetGlobal("c-arSCRL6H","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3050 /* WIZARD_PROTECTION_FROM_FIRE */
  + ~HaveSpellParty(2320)~ + ~[PC] Protection from Cold, 4 days.~ DO ~SetGlobal("c-arSCRL6I","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3051 /* WIZARD_PROTECTION_FROM_COLD */
  + ~HaveSpellParty(2321)~ + ~[PC] Spell Thrust, 4 days.~ DO ~SetGlobal("c-arSCRL6J","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3052 /* WIZARD_SPELL_THRUST */
  + ~HaveSpellParty(2322)~ + ~[PC] Detect Illusion, 4 days.~ DO ~SetGlobal("c-arSCRL6K","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3048 /* WIZARD_DETECT_ILLUSION */
  + ~HaveSpellParty(2324)~ + ~[PC] Hold Undead, 4 days.~ DO ~SetGlobal("c-arSCRL6L","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3052 /* WIZARD_HOLD_UNDEAD */
  + ~HaveSpellParty(2325)~ + ~[PC] Melf's Minute Meteors, 4 days.~ DO ~SetGlobal("c-arSCRLA5","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FOUR_DAYS)~ + a3051 /* WIZARD_MELF_METEOR */
  ++ ~[PC] I do not want any of these. Forget the whole thing.~ + a3039
  ++ ~[PC] I do not want any of these. Can I see what else you can do?~ + a3045
END

IF ~~ a3056
  SAY ~[ARAN] Based on what we have memorized in th' party, an' what materials I have right here, I can start on one o' these. You chose, an' I'll get it.~
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2401)~ + ~[PC] Confusion, 5 days.~ DO ~SetGlobal("c-arSCRL1U","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3050 /* WIZARD_CONFUSION */
  + ~HaveSpellParty(2403)~ + ~[PC] Fireshield (Blue), 5 days.~ DO ~SetGlobal("c-arSCRL1W","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3049 /* WIZARD_FIRE_SHIELD_BLUE */
  + ~HaveSpellParty(2404)~ + ~[PC] Ice Storm, 5 days.~ DO ~SetGlobal("c-arSCRL1X","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3049 /* WIZARD_ICE_STORM */
  + ~HaveSpellParty(2405)~ + ~[PC] Improved Invisibility, 5 days.~ DO ~SetGlobal("c-arSCRL1Y","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3050 /* WIZARD_IMPROVED_INVISIBILITY */
  + ~HaveSpellParty(2406)~ + ~[PC] Minor Globe of Invulnerability, 5 days.~ DO ~SetGlobal("c-arSCRL1Z","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3051 /* WIZARD_MINOR_GLOBE_OF_INVULNERABILITY */
  + ~HaveSpellParty(2408)~ + ~[PC] Stoneskin, 5 days.~ DO ~SetGlobal("c-arSCRL1V","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3052 /* WIZARD_STONE_SKIN */
  + ~HaveSpellParty(2409)~ + ~[PC] Contagion, 5 days.~ DO ~SetGlobal("c-arSCRLA8","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3048 /* WIZARD_CONTAGION */
  + ~HaveSpellParty(2410)~ + ~[PC] Remove Curse, 5 days.~ DO ~SetGlobal("c-arSCRL5G","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3052 /* WIZARD_REMOVE_CURSE */
  + ~HaveSpellParty(2411)~ + ~[PC] Emotion, 5 days.~ DO ~SetGlobal("c-arSCRL5H","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3051 /* WIZARD_EMOTION_HOPELESSNESS */
  + ~HaveSpellParty(2412)~ + ~[PC] Greater Malison, 5 days.~ DO ~SetGlobal("c-arSCRL5I","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3050 /* WIZARD_GREATER_MALISON */
  + ~HaveSpellParty(2413)~ + ~[PC] Otiluke's Resilient Sphere, 5 days.~ DO ~SetGlobal("c-arSCRL5J","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3049 /* WIZARD_OTILUKES_RESILIENT_SPHERE */
  + ~HaveSpellParty(2414)~ + ~[PC] Spirit Armor, 5 days.~ DO ~SetGlobal("c-arSCRL5K","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3049 /* WIZARD_SPIRIT_ARMOR */
  + ~HaveSpellParty(2417)~ + ~[PC] Enchanted Weapon, 5 days.~ DO ~SetGlobal("c-arSCRL6M","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3050 /* WIZARD_ENCHANTED_WEAPON */
  + ~HaveSpellParty(2418)~ + ~[PC] Fireshield (Red), 5 days.~ DO ~SetGlobal("c-arSCRL6N","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3051 /* WIZARD_FIRE_SHIELD_RED */
  + ~HaveSpellParty(2419)~ + ~[PC] Secret Word, 5 days.~ DO ~SetGlobal("c-arSCRL6O","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3052 /* WIZARD_SECRET_WORD */
  + ~HaveSpellParty(2420)~ + ~[PC] Minor Sequencer, 5 days.~ DO ~SetGlobal("c-arSCRL6P","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3048 /* WIZARD_MINOR_SEQUENCER */
  + ~HaveSpellParty(2424)~ + ~[PC] Farsight, 5 days.~ DO ~SetGlobal("c-arSCRLAJ","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3048 /* WIZARD_FAR_SIGHT */
  + ~HaveSpellParty(2425)~ + ~[PC] Wizard Eye, 5 days.~ DO ~SetGlobal("c-arSCRLA1","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",FIVE_DAYS)~ + a3052 /* WIZARD_EYE */
  ++ ~[PC] I do not want any of these. Forget the whole thing.~ + a3039
  ++ ~[PC] I do not want any of these. Can I see what else you can do?~ + a3045
END

IF ~~ a3057
  SAY ~[ARAN] Based on what we have memorized in th' party, an' what materials I have right here, I can start on one o' these. You chose, an' I'll get it.~
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2502)~ + ~[PC] Cloudkill, 6 days.~ DO ~SetGlobal("c-arSCRL2E","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3051 /* WIZARD_CLOUDKILL */
  + ~HaveSpellParty(2503)~ + ~[PC] Cone of Cold, 6 days.~ DO ~SetGlobal("c-arSCRL2F","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3050 /* WIZARD_CONE_OF_COLD */
  + ~HaveSpellParty(2505)~ + ~[PC] Shadow Door, 6 days.~ DO ~SetGlobal("c-arSCRL2H","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3049 /* WIZARD_SHADOW_DOOR */
  + ~HaveSpellParty(2506)~ + ~[PC] Domination, 6 days.~ DO ~SetGlobal("c-arSCRL5N","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3049 /* WIZARD_DOMINATION */
  + ~HaveSpellParty(2508)~ + ~[PC] Chaos, 6 days.~ DO ~SetGlobal("c-arSCRL5P","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3050 /* WIZARD_CHAOS */
  + ~HaveSpellParty(2509)~ + ~[PC] Feeblemind, 6 days.~ DO ~SetGlobal("c-arSCRL5Q","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3051 /* WIZARD_FEEBLEMIND */
  + ~HaveSpellParty(2510)~ + ~[PC] Spell Immunity, 6 days.~ DO ~SetGlobal("c-arSCRL6S","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3052 /* WIZARD_SPELL_IMMUNITY */
  + ~HaveSpellParty(2511)~ + ~[PC] Protection from Normal Weapons, 6 days.~ DO ~SetGlobal("c-arSCRL6T","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3048 /* WIZARD_PROTECTION_FROM_NORMAL_WEAPONS */
  + ~HaveSpellParty(2512)~ + ~[PC] Protection from Electricity, 6 days.~ DO ~SetGlobal("c-arSCRL5T","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3048 /* WIZARD_PROTECTION_FROM_ELECTRICITY */
  + ~HaveSpellParty(2513)~ + ~[PC] Breach, 6 days.~ DO ~SetGlobal("c-arSCRL6U","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3052 /* WIZARD_BREACH */
  + ~HaveSpellParty(2514)~ + ~[PC] Lower Resistance, 6 days.~ DO ~SetGlobal("c-arSCRL6V","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3051 /* WIZARD_LOWER_RESISTANCE */
  + ~HaveSpellParty(2515)~ + ~[PC] Oracle, 6 days.~ DO ~SetGlobal("c-arSCRL6W","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3050 /* WIZARD_ORACLE */
  + ~HaveSpellParty(2517)~ + ~[PC] Protection from Acid, 6 days.~ DO ~SetGlobal("c-arSCRL6Y","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3049 /* WIZARD_PROTECTION_FROM_ACID */
  + ~HaveSpellParty(2518)~ + ~[PC] Phantom Blade, 6 days.~ DO ~SetGlobal("c-arSCRL6Z","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3049 /* WIZARD_PHANTOM_BLADE */
  + ~HaveSpellParty(2519)~ + ~[PC] Spell Shield, 6 days.~ DO ~SetGlobal("c-arSCRL8X","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3050 /* WIZARD_SPELL_SHIELD */
  + ~HaveSpellParty(2522)~ + ~[PC] Minor Spell Turning, 6 days.~ DO ~SetGlobal("c-arSCRL7D","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3051 /* WIZARD_MINOR_SPELL_TURNING */
  + ~HaveSpellParty(2523)~ + ~[PC] Sunfire, 6 days.~ DO ~SetGlobal("c-arSCRLAL","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SIX_DAYS)~ + a3052 /* WIZARD_SUN_FIRE */
  ++ ~[PC] I do not want any of these. Forget the whole thing.~ + a3039
  ++ ~[PC] I do not want any of these. Can I see what else you can do?~ + a3045
END

IF ~~ a3058
  SAY ~[ARAN] Based on what we have memorized in th' party, an' what materials I have right here, I can start on one o' these. You chose, an' I'll get it.~
  /* Wizard spells below 7th level, no summoning spells, 1 day per level. Positive: free. Aran does not have to know it. Negative: party must have spell memorized. takes time. */
  + ~HaveSpellParty(2602)~ + ~[PC] Globe of Invulnerability, 7 days.~ DO ~SetGlobal("c-arSCRL7F","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3048 /* WIZARD_GLOBE_OF_INVULNERABILITY */
  + ~HaveSpellParty(2603)~ + ~[PC] Tenser's Transformation, 7 days.~ DO ~SetGlobal("c-arSCRL7G","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3052 /* WIZARD_TENSERS_TRANSFORMATION */
  + ~HaveSpellParty(2604)~ + ~[PC] Flesh to Stone, 7 days.~ DO ~SetGlobal("c-arSCRL7H","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3051 /* WIZARD_FLESH_TO_STONE */
  + ~HaveSpellParty(2605)~ + ~[PC] Death Spell, 7 days.~ DO ~SetGlobal("c-arSCRL7I","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3050 /* WIZARD_DEATH_SPELL */
  + ~HaveSpellParty(2606)~ + ~[PC] Protection from Magic, 7 days.~ DO ~SetGlobal("c-arSCRL7J","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3049 /* WIZARD_PROTECTION_FROM_MAGIC_ENERGY */
  + ~HaveSpellParty(2607)~ + ~[PC] Mislead, 7 days.~ DO ~SetGlobal("c-arSCRL7K","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3049 /* WIZARD_MISLEAD */
  + ~HaveSpellParty(2608)~ + ~[PC] Pierce Magic, 7 days.~ DO ~SetGlobal("c-arSCRL7L","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3050 /* WIZARD_PIERCE_MAGIC */
  + ~HaveSpellParty(2609)~ + ~[PC] True Sight, 7 days.~ DO ~SetGlobal("c-arSCRL7M","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3051 /* WIZARD_TRUE_SIGHT */
  + ~HaveSpellParty(2611)~ + ~[PC] Protection from Magical Weapons, 7 days.~ DO ~SetGlobal("c-arSCRL7O","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3052 /* WIZARD_PROTECTION_FROM_MAGIC_WEAPONS */
  + ~HaveSpellParty(2612)~ + ~[PC] Power Word, Silence, 7 days.~ DO ~SetGlobal("c-arSCRL7P","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3048 /* WIZARD_POWER_WORD_SILENCE */
  + ~HaveSpellParty(2613)~ + ~[PC] Improved Haste, 7 days.~ DO ~SetGlobal("c-arSCRL7Q","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3048 /* WIZARD_IMPROVED_HASTE */
  + ~HaveSpellParty(2614)~ + ~[PC] Death Fog, 7 days.~ DO ~SetGlobal("c-arSCRL7R","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3052 /* WIZARD_DEATH_FOG */
  + ~HaveSpellParty(2615)~ + ~[PC] Chain Lightning, 7 days.~ DO ~SetGlobal("c-arSCRL7S","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3051 /* WIZARD_CHAIN_LIGHTNING */
  + ~HaveSpellParty(2616)~ + ~[PC] Disintegrate, 7 days.~ DO ~SetGlobal("c-arSCRL7T","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3050 /* WIZARD_DISINTEGRATE */
  + ~HaveSpellParty(2617)~ + ~[PC] Contingency, 7 days.~ DO ~SetGlobal("c-arSCRL7U","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3049 /* WIZARD_CONTINGENCY */
  + ~HaveSpellParty(2618)~ + ~[PC] Spell Deflection, 7 days.~ DO ~SetGlobal("c-arSCRL7V","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3050 /* WIZARD_SPELL_DEFLECTION */
  + ~HaveSpellParty(2625)~ + ~[PC] Stone to Flesh, 7 days.~ DO ~SetGlobal("c-arSCRL8C","LOCALS",1) SetGlobal("c-aranscribe","GLOBAL",1) SetGlobalTimer("c-aranscribing","GLOBAL",SEVEN_DAYS)~ + a3051 /* WIZARD_STONE_TO_FLESH */
  ++ ~[PC] I do not want any of these. Forget the whole thing.~ + a3039
  ++ ~[PC] I do not want any of these. Can I see what else you can do?~ + a3045
END

/* Flirt SubMenu: Mature: ToB  */
IF ~~ a3059
  SAY ~(Aran is near you, watching the surrounding area carefully.)~
  /* hugs M */
  + ~RandomNum(4,1)~ + ~[PC] (Gently place your hand on his shoulder.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3082
  + ~RandomNum(4,2)~ + ~[PC] (Rest your face gently on his back, pressing close to him.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3083
  + ~RandomNum(4,3)~ + ~[PC] (Wrap your arms around Aran's neck, and pull him close.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3084
  + ~RandomNum(4,4)~ + ~[PC] (Drape his arm across your shoulders, and lean into him.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3085
  /* kisses M */
  + ~RandomNum(4,1)~ + ~[PC] (Quietly press a kiss on his shoulder.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3086
  + ~RandomNum(4,2)~ + ~[PC] (Kiss him on the cheek.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3087
  + ~RandomNum(4,3)~ + ~[PC] (Pick up his hand and kiss the back of his hand.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3088
  + ~RandomNum(4,4)~ + ~[PC] (Brush your lips across his cheek.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3089
  /* touching M */
  + ~RandomNum(5,1)~ + ~[PC] (Run your fingers through his hair.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3090
  + ~RandomNum(5,2)~ + ~[PC] (Brush his hair back from his brow.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3091
  + ~RandomNum(5,3)~ + ~[PC] (Gently put one hand on his upper arm.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3092
  + ~RandomNum(5,4)~ + ~[PC] Come here, Aran. I want you to hold me. This blouse is just beautiful, is it not?~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3093
  + ~RandomNum(5,5)~ + ~[PC] I am all tense, Aran. And I seem to have such cold hands. Whatever shall I do?~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3094
  /* praises M */
  + ~RandomNum(4,1)~ + ~[PC] So, do all the men in your family have such big... shoulders?~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3095
  + ~RandomNum(4,2)~ + ~[PC] I think you are a good friend, Aran. A really good friend.~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3096
  + ~RandomNum(4,3)~ + ~[PC] I like that color on you, Aran.~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3097
  + ~RandomNum(4,4)~ + ~[PC] (Smile boldly, and lower your eyelashes glancing down his body when he looks at you.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3098
  /* teasing M */
  + ~RandomNum(4,1)~ + ~[PC] (Tug Aran's hair firmly.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3099
  + ~RandomNum(4,2)~ + ~[PC] (Lightly punch him in the shoulder.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3100
  + ~RandomNum(4,3)~ + ~[PC] (Look at him with wide-eyed innocence, while tipping some of your waterskin on him.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3101
  + ~RandomNum(4,4)~ + ~[PC] Oh dear - I am just a poor helpless little female. Whatever *shall* I do. I can't reach that pack strap. I need a big strong man to help me out!~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3102
  /* quiet/hidden M */
  + ~RandomNum(4,1)~ + ~[PC] (Quietly watch him out of the corner of your eye, tracing his form with your eyes.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3103
  + ~RandomNum(4,2)~ + ~[PC] (Gently smooth your hair and twist one strand of it around a finger, casting glances at him.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3104
  + ~RandomNum(4,3)~ + ~[PC] (Slip a small wildflower into Aran's beltpouch.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3105
  + ~RandomNum(4,4)~ + ~[PC] Could you teach me how to speed up my parry when we camp, Aran?~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3106
  /* Spoken M */
  + ~RandomNum(5,1)~ + ~[PC] So, how do you like my outfit?~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3107
  + ~RandomNum(5,2)~ + ~[PC] Does this getup make me look fat?~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3108
  + ~RandomNum(5,3)~ + ~[PC] Have you ever kissed a woman, Aran? I mean *really* kissed her? Not the timid way you kiss me...~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3109
  + ~RandomNum(5,4)~ + ~[PC] If you could have anything in the world right now, Aran, what would it be?~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3110
  + ~RandomNum(5,5)~ + ~[PC] Why do you like me, Aran?~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3133
  /* Spoken H added back */
  + ~RandomNum(5,1)~ + ~[PC] Tell me something completely true about you. Don't think, just answer.~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3122  /* H spoken 2 */
  + ~RandomNum(5,2)~ + ~[PC] Tell me something completely true about you. Don't think, just answer.~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3123  /* H spoken 3 */
  + ~RandomNum(5,3)~ + ~[PC] Tell me something completely true about you. Don't think, just answer.~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3124  /* H spoken 4 */
  + ~RandomNum(5,4)~ + ~[PC] You could do me. Right here. Right now. But you refuse to claim me the way our ancestors did - through raw force.~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3125  /* H spoken 5 */
  + ~RandomNum(5,5)~ + ~[PC] Are all the women you have met less pretty than me?~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3126  /* H spoken 6 */
  /* Manipulative/Autocratic/Demanding  M */
  + ~RandomNum(4,1)~ + ~[PC] Aran, I am bored. Let's see if you can liven things up. Entertain me.~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3111
  + ~RandomNum(4,1)~ + ~[PC] Oh, I have dropped my pouch. Pick it up for me, Aran.~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3112
  + ~RandomNum(4,3)~ + ~[PC] (Grab Aran by the collar and press your lips fiercely to his.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3113
  + ~RandomNum(4,4)~ + ~[PC] I want something pretty, Aran.~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1)~ + a3114
  /* Not Nice Action  M */
  + ~Global("c-araneviltouch3","LOCALS",0)~ + ~[PC] (You slap Aran's cheek, hard enough to snap his head to the side and leave an angry red mark.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-araneviltouch3","LOCALS",1)~ + a3115
  + ~Global("c-araneviltouch3","LOCALS",1)~ + ~[PC] (You slap Aran's cheek violently, cupping your hand to increase the sound.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-araneviltouch3","LOCALS",2)~ + a3116
  + ~Global("c-araneviltouch3","LOCALS",2)~ + ~[PC] (You slap Aran's cheek with all of your strength behind it, leaving your fingers stinging.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-araneviltouch3","LOCALS",3)~ + a3117
  + ~Global("c-araneviltouch3","LOCALS",3)~ + ~[PC] (You slap Aran's cheek and .)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-araneviltouch3","LOCALS",4)~ + a3118
  + ~Global("c-araneviltouch3","LOCALS",4)~ + ~[PC] (You slap Aran's cheek, hard enough to snap his head to the side and leave an angry red mark.)~ DO ~IncrementGlobal("c-aranflirt","GLOBAL",1) SetGlobal("c-araneviltouch3","LOCALS",5)~ + a3119
  /* Situational/Conditional Flirts */
  ++ ~[PC] Before we go any further, Aran... what do you think our "relationship" is?~ + a3210
  ++ ~[PC] (You decide not to flirt with Aran).~ EXIT
END

/* Flirt SubMenu: Mature ToB responses */
/* hugs 1 */
IF ~~ a3082 SAY ~[ARAN] That be right nice, to feel you close to me. I'd give a good bit o' coin to dump all this crap, go grab a piece o' a nice riverbank wi' you, an' just stare up at th' clouds for a day.~ IF ~~ THEN EXIT END
IF ~~ a3083 SAY ~[ARAN] Come around front, lassie, an' I can warm my hands up right proper, eh?~ IF ~~ THEN EXIT END
IF ~~ a3084 SAY ~[ARAN] (Warm lips seek yours, the rough-shaven cheek scratching your face.)~ = ~[ARAN] Mayhap you want a moment away from troubles an' cares? If we can find a quiet spot, my lips an' fingers, an' anythin' else be at your command.~ IF ~~ THEN EXIT END
IF ~~ a3085 SAY ~[ARAN] (Aran's face is a study of mock horror and surprise, until his grin threatens to split his face in two.)~ = ~[ARAN] You be gettin' right friendly, there, girl. Whatever shall we call th' children, darlin'?~ IF ~~ THEN EXIT END
/* kisses 1 */
IF ~~ a3086 SAY ~[ARAN] (He spins to face you, arm catching at your waist and body pressing close in a solid, intimate kiss.)~ = ~[ARAN] Just when you feel that you will pass out from lack of air, he breaks away and steadies you by your shoulders.)~ = ~[ARAN] There, now. When I do a thing, I do it right proper.~ IF ~~ THEN EXIT END
IF ~~ a3087 SAY ~[ARAN] Now, that be right sweet. But I was thinkin' I'd return the kiss... a little further south, if you know what I be sayin'. We should go find us some privacy, eh?~ IF ~~ THEN EXIT END
IF ~~ a3088 SAY ~[ARAN] Now, m'lady, I be no courtier. I rightly appreciate th' sentiment, but this...~ = ~[ARAN] (Strong arms close around your waist, and you feel yourself lifted into the air to look down on him.)~ = ~[ARAN] I want naught o' a pedestal, on account o' you deserve a much higher one. Grants me more freedom to explore, too, eh?~ IF ~~ THEN EXIT END
IF ~~ a3089 SAY ~[ARAN] (His return kiss starts at your cheekbone, feasts on your lips, and is well down your bosom before you realize he has managed to get his hands inside to caress your bare skin.)~ = ~[ARAN] He breaks away quickly, flushed and panting).~ = ~[ARAN] Well that were fun. But I can do better if there was to be some privacy, an' mayhap someplace soft where to lay you down.~ IF ~~ THEN EXIT END
/* touching 1 */
IF ~~ a3090 SAY ~[ARAN] I can do that too, if you like. Here, let me try...~ = ~[ARAN] (His rough hands tangle and pull for a moment, but suddenly he stops. Frowning, he digs through his belt pouch and produces a small comb. He starts carefully at the ends of your tresses, working gently through the tangles.)~ = ~[ARAN] There. Never did realize workin' wi' horse manes an' tails would be so useful in th' romance department. Darned glad I had to learn!~ IF ~~ THEN EXIT END
IF ~~ a3091 SAY ~[ARAN] Do I have somethin' on my forehead? (He leans forward and touches heads with you, nose to nose, staring into your eyes.)~ = ~[ARAN] On account o' I have th' most beautiful woman in th' world on my mind. Or at least, starin' me in th' face.~ IF ~~ THEN EXIT END
IF ~~ a3092 SAY ~[ARAN] (His arms surround you quickly, and you find yourself pressed against his chest.)~ = ~[ARAN] (He presses closer, kisses raining on your face, your shoulders, and one of his hands makes unsuccessful attempts to disengage anything standing between your skin and his.)~ = ~[ARAN] (He breaks away suddenly, hands gripping your arms.) Sune's Lips! Bloody hells, I forgot myself. I need a cold bath. Mayhap more than one.~ IF ~~ THEN EXIT END
IF ~~ a3093 SAY ~[ARAN] Aye, it is right beautiful. But I needs be checkin' the quality o' the cloth, eh?~ = ~[ARAN] (He turns you slowly around, his gaze following your every contour. As your shoulderblades nestles against his chest, his hands slip beneath the smooth silk of your bodice and caress your skin.)~ = ~[ARAN] (As his hands gently and intimately caress you, his lips plant small warm seeds along your neck, each flowering into warmth and a slight shudder of excitement.)~ IF ~~ THEN EXIT END
IF ~~ a3094 SAY ~[ARAN] (He takes your hands in his, and rubs them gently. A broad mischievous grin plays about his lips.)~ = ~[ARAN] Now, I do have some places a mite warmer, but right here an' right now, this will have to do, eh?~ IF ~~ THEN EXIT END
/* praises 1 */
IF ~~ a3095 SAY ~[ARAN] Shoulders? Oh.. OH. No, all average, m' lady. Size don't rightly count - it be what you do wi' it that gets things right happy, eh? ~ IF ~~ THEN EXIT END
IF ~~ a3096 SAY ~[ARAN] Since we done explored every inch o' your body, inside an' out, I think that be a mite bit o' an understatement. Unless you want me to discover uncharted territory all over again?~ IF ~~ THEN EXIT END
IF ~~ a3097 SAY ~[ARAN] (He sketches a mocking bow, coming up quickly and grabbing you around the waist, lifting you under his arm.)~ = ~[ARAN] (A swift kiss misses its mark, landing quite low on your neck.) Now, I do be likin' that color on me, too. But more than that, I be likin' you on me, eh?~ IF ~~ THEN EXIT END
IF ~~ a3098 SAY ~[ARAN] (His gaze is ferocious, greedily drinking in your form.)~ = ~[ARAN] Gods, <CHARNAME>... just lookin' at you be enough to make my pulse roar in my ears an' get me ready for battle, be it o' th' fightin' variety, or th' romantic variety.~ IF ~~ THEN EXIT END
 /* teasing 1 */
IF ~~ a3099 SAY ~[ARAN] (His laughter breaks out as he returns the tug, and following up with a rough kiss.)~ = ~[ARAN] Now, enough o' th' foreplay. I'd rather be tuggin' at those clothes o' yours, than payin' child games wi' our hair, eh? Ill be given you a minute to run an' hide, an' then I am goin' to 'seek' you right into next tenday!~ IF ~~ THEN EXIT END
IF ~~ a3100 SAY ~[ARAN] hay, naught o' that. You want to fight me, I have an alternative suggestion...~ = ~[ARAN] (His kiss is fierce on your lips, and your tongues fence in a dizzying counterpoint of passion and laughter.)~ IF ~~ THEN EXIT END
IF ~~ a3101 SAY ~[ARAN] Well, now. I do think what be sauce for th' goose be sauce for th' gander. But I am delayin' my revenge, an' waitin' until you be in a nice white blouse. I do rightly suspect the resultin' view will be quite... magnificent!~ IF ~~ THEN EXIT END
IF ~~ a3102 SAY ~[ARAN] (His hands grasp the pack and lift quite suddenly, bending your body at the waist and holding your posterior against him until you can feel every line of his body pressed like steel against you. His voice whispers rough and unsteady in your ear as he works the strap... ) ~ = ~[ARAN] I can meet any needs you may have, m'lady . An' just lookin' at you be makin' me harder than my armor.)~ IF ~~ THEN EXIT END
/* quiet/hidden 1 */
IF ~~ a3103 SAY ~[ARAN] (He grins boldly at you, and raises his eyebrows.)~ = ~[ARAN] See anythin' you like? I surely do...~ IF ~~ THEN EXIT END
IF ~~ a3104 SAY ~[ARAN] Now, if I had a way o' capturin' just that sight on canvas, it would be lauded as a fair depiction o' a Solar. Luckily for me, I prefer to work in clay. So you could come over here, an' let me check all your measurements, eh?~ IF ~~ THEN EXIT END
IF ~~ a3105 SAY ~[ARAN] (Aran's hands catch gently at yours, twining fingers and pulling you into an embrace. His kiss is light and quick, but his smile promises much, much more later.) ~ IF ~~ THEN EXIT END
IF ~~ a3106 SAY ~[ARAN] M'dearest, sweetest creature, I done just about died several times durin' that last teachin' session. How about we try usin' weapons this time? A poor lad can only take so much.~ IF ~~ THEN EXIT END
/* Spoken */
IF ~~ a3107 SAY ~[ARAN] (His gaze is steady, measuring, and possessive.) I like it. More than that, I like what be under it.~ IF ~~ THEN EXIT END
IF ~~ a3108 SAY ~[ARAN] Well, if by 'fat' you mean 'inspirin' men to wanton acts o' lust an' amorous devotion', then it be makin' you look right huge, eh?~ IF ~~ THEN EXIT END
IF ~~ a3109 SAY ~[ARAN] Now you be teasin' me right fierce, <CHARNAME>, which means only one thing...~ = ~[ARAN] He presses you close to his body, mouth devouring yours.) ~ = ~[ARAN] An' if you forget what it feels like again, well, there be more kisses to try, an' more ways o' kissin'. I intend to explore every possible variation.~ IF ~~ THEN EXIT END
IF ~~ a3110 SAY ~[ARAN] (His face turns upward, and he pauses for a moment.)~ = ~[ARAN] I know not long ago, I'd have said all I wanted be you. But now...~ = ~[ARAN] ...now, I be thinkin' I would change that to 'you safe from harm'.~ IF ~~ THEN EXIT END
/* Manipulative/Autocratic/Demanding */
IF ~~ a3111 SAY ~[ARAN] (Aran drops his pack and reaches for his armor. Slamming his armor to the ground, he strips quickly to the waist, and turns your direction.)~ = ~[ARAN] Now, let's be seein' just what sort o' entertainment you want.~ = ~[ARAN] ) He cradles you close against his bare chest, tipping your chin up with one hand. His kiss is fire and steel, rough enough with passion to hurt.~ IF ~~ THEN EXIT END
IF ~~ a3112 SAY ~[ARAN] (Aran kneels quickly and retrieves the pouch, and as one hand returns it the other hand hidden by his motions traces up the inside of your leg, up, up, up... ) ~ = ~[ARAN] Now, I do believe this be yours, <CHARNAME>. I'd be happy to help explore th' contents, an' make sure everythin' be in order...~ IF ~~ THEN EXIT END
IF ~~ a3113 SAY ~[ARAN] (He returns your kiss with fervor, and his hands caress your body as best they can with the restrictions of clothing and armor.) ~ IF ~~ THEN EXIT END
IF ~~ a3114 SAY ~[ARAN] Look in a mirror. No jewel be as pretty as you be.~ = ~[ARAN] Now, don't get all pouty an' worried, I caught your meanin', I did. I'll be lookin' around for somethin' right special for you.~ IF ~~ THEN EXIT END
/* Not Nice Action */
IF ~~ a3115 SAY ~[ARAN] (He looks steadily at you, then turns and ignores you.)~ IF ~~ THEN EXIT END
IF ~~ a3116 SAY ~[ARAN] (He returns the slap, lightly tapping you on the cheek.) You be playin' , or just in th' mood for some rough an' tumble?~ IF ~~ THEN EXIT END
IF ~~ a3117 SAY ~[ARAN] (His slap matches yours in intensity, the stinging palmprint rising red on your cheek.) ~ = ~[ARAN] If you want me, you can bloody well have me wi' out all this kind o' rough play, girl. Or do you want me to tear your clothes off an' have my way wi' you?~ IF ~~ THEN EXIT END
IF ~~ a3118 SAY ~[ARAN] (He takes the slap, then grabs you by both shoulders and draws you into a crushing embrace. His kiss is rough and hard, a battle against your lips and tongue.)~ IF ~~ THEN EXIT END
IF ~~ a3119 SAY ~[ARAN] (With a beast-like roar, he slams his body into yours, tackling you and crushing you beneath him. His lips seek yours, and his restraint appears to have vanished in a berserker rage.)~ = ~[ARAN] (Just as quickly, he stops, gets up, and dusts himself off as if nothing had happened.)~ = ~[ARAN] Right. Gave you what you wanted, then. But not th' whole thing, I suspect... you want that, you come on my terms. I don't play beast in th' sack for no one. An' I expect some mutual pleasure, not Cyric-blighted pain.~ IF ~~ THEN EXIT END
/* H spoken 2 */
IF ~~ a3122 SAY ~[ARAN] I can't take my eyes off o' you.~ IF ~~ THEN EXIT END
/* H spoken 3 */
IF ~~ a3123 SAY ~[ARAN] Your left eye be just as beautiful as a shinin' star. But your right eye, it can pierce th' depths o' a man's soul, it can.~ IF ~~ THEN EXIT END
/* H spoken 4 */
IF ~~ a3124 SAY ~[ARAN] I could quit all this, an' just be happy makin' love to you every time you wanted. Probably more.~ IF ~~ THEN EXIT END
/* H spoken 5 */
IF ~~ a3125 SAY ~[ARAN] Now, m'lady, no call for that kind o' talk. A man's got some principles, eh? I sign on for partnerships, not raw matin' like gibberlin's in heat. Though I do be a mite tempted...~ IF ~~ THEN EXIT END
/* H spoken 6 */
IF ~~ a3126 SAY ~[ARAN] Well, to tell th' truth, there was this one half-elven lass, a Sensate... no, she were right forward, an' could drive a man to distraction, but it were all glitter an' sex. Wi' you, there be so much more.~ IF ~~ THEN EXIT END
IF ~~ a3133 SAY ~[ARAN] Well, I like you on account o' when my hand goes right... there, you make a little sound in th' back ' th' throat. An' when I kiss you right... here, you make a little groan what makes parts o' me stand at attention right quick. An' when I move against you like... this... I think th' rest o' this conversation might be better off carried out in a bedroll, on account o' it be hard to show you. No pun intended, o' course.~ IF ~~ THEN EXIT END

IF ~~ a1873
  SAY ~[ARAN] What do you be lookin' at, <CHARNAME>?~
  + ~RandomNum(4,1)~ + ~[PC] Oh, nothing much.~ + a1902
  + ~RandomNum(4,2)~ + ~[PC] Oh, nothing much.~ + a1903
  + ~RandomNum(4,3)~ + ~[PC] Oh, nothing much.~ + a1904
  + ~RandomNum(4,4)~ + ~[PC] Oh, nothing much.~ + a1905
  ++ ~[PC] Forget it, Aran. I don't really need anything.~ + a3134 /* c-aranshutup1 */
  + ~RandomNum(5,5)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3134 /* c-aranshutup1 */
  + ~RandomNum(5,4)~ + ~[PC] They say silence is golden. Pay yourself.~ + a3135 /* c-aranshutup2 */
  + ~RandomNum(5,3)~ + ~[PC] Oh, just shut up, will you?~ + a3136 /* c-aranshutup3 */
  + ~RandomNum(5,2)~ + ~[PC] Can a <PRO_BOYGIRL> get a little peace and quiet around here?~ + a3137 /* c-aranshutup4 */
  + ~RandomNum(5,1)~ + ~[PC] Forget it. And stop yammering on, will you? Give it a rest.~ + a3138 /* c-aranshutup5 */
  + ~Gender(Player1,MALE)~ + ~[PC] I was looking at you. Do you have a problem with that?~ + a1887
  + ~Gender(Player1,FEMALE)~ + ~[PC] I was looking at you. Did you know that your bottom is really tight and muscular?~ + a1886
  + ~HPPercentLT("c-aran",40)~ + ~[PC] Just checking that everything is in order. You seem to be dripping blood everywhere, so I guess you need some serious healing.~ + a1877
  + ~HPPercentGT("c-aran",39) HPPercentLT("c-aran",80)~ + ~[PC] Just checking that everything is in order. You don't look so good, so I guess you might need a little healing.~ + a1878
  + ~HPPercentGT("c-aran",79)~ + ~[PC] Just checking that everything is in order. You don't look so badly off, so I guess you don't need healing.~ + a1879
END

IF ~~ a1874
  SAY ~[ARAN] Got my attention, anyhow. Any particular reason you be lookin' my way?~
  + ~RandomNum(4,1)~ + ~[PC] Oh, nothing much.~ + a1902
  + ~RandomNum(4,2)~ + ~[PC] Oh, nothing much.~ + a1903
  + ~RandomNum(4,3)~ + ~[PC] Oh, nothing much.~ + a1904
  + ~RandomNum(4,4)~ + ~[PC] Oh, nothing much.~ + a1905
  + ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] Before we go any further, Aran... what do you think our "relationship" is?~ + a3210
  + ~HPPercentLT("c-aran",40)~ + ~[PC] Just checking that everything is in order. You seem to be dripping blood everywhere, so I guess you need some serious healing.~ + a1877
  + ~HPPercentGT("c-aran",39) HPPercentLT("c-aran",80)~ + ~[PC] Just checking that everything is in order. You don't look so good, so I guess you might need a little healing.~ + a1878
  + ~HPPercentGT("c-aran",79)~ + ~[PC] Just checking that everything is in order. You don't look so badly off, so I guess you don't need healing.~ + a1879
  + ~RandomNum(5,5)~ + ~[PC] Is there any way I could pursuade you to just shut the hells up? Short of physical violence, I mean.~ + a3139 /* c-aranshutup6 */
  + ~RandomNum(5,4)~ + ~[PC] Just listening to you talk to yourself about nothing. You know we can hear you when you do that, right?~ + a3140 /* c-aranshutup7 */
  + ~RandomNum(5,3)~ + ~[PC] Oh, just trying to distract you enough that you stop muttering under your breath.~ + a3141 /* c-aranshutup8 */
  + ~RandomNum(5,2)~ + ~[PC] Did I ask you to talk to me? Because if I did, I really didn't mean to.~ + a3142 /* c-aranshutup9 */
  + ~RandomNum(5,1)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3143 /* c-aranshutup10 */
  ++ ~[PC] No particular reason. I don't really need anything.~ + a3134 /* c-aranshutup1 */
  + ~Gender(Player1,MALE)~ + ~[PC] I was trying to discover the source of that really sharp sulfurous odor.~ + a1885
  + ~Gender(Player1,FEMALE)~ + ~[PC] I was looking at you. Did you know that your bottom is really tight and muscular?~ + a1886
END

IF ~~ a1875
  SAY ~[ARAN] Right back at you. Why do you be lookin' my way, anyways? Just enjoyin' th' view?~
  ++ ~[PC] Forget it, Aran. Sorry I bothered you.~ + a3134 /* c-aranshutup1 */
  + ~HPPercentLT("c-aran",40)~ + ~[PC] Just checking that everything is in order. You seem to be dripping blood everywhere, so I guess you need some serious healing.~ + a1877
  + ~HPPercentGT("c-aran",39) HPPercentLT("c-aran",80)~ + ~[PC] Just checking that everything is in order. You don't look so good, so I guess you might need a little healing.~ + a1878
  + ~HPPercentGT("c-aran",79)~ + ~[PC] Just checking that everything is in order. You don't look so badly off, so I guess you don't need healing.~ + a1879
  + ~RandomNum(4,1)~ + ~[PC] Oh, nothing much.~ + a1902
  + ~RandomNum(4,2)~ + ~[PC] Oh, nothing much.~ + a1903
  + ~RandomNum(4,3)~ + ~[PC] Oh, nothing much.~ + a1904
  + ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] Before we go any further, Aran... what do you think our "relationship" is?~ + a3210
  + ~RandomNum(4,4)~ + ~[PC] Oh, nothing much.~ + a1905
  ++ ~[PC] Yes, you are a sight for sore eyes. Well, close, anyways - the sight of you makes my eyes sore...~ + a1897
  + ~RandomNum(5,5)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3208 /* c-aranshutup75 */
  + ~RandomNum(5,4)~ + ~[PC] Just leave me alone, ok? I didn't mean to disturb your industrious scratching of various body parts. Go back to doing whatever it is you were doing.~ + a3144 /* c-aranshutup11 */
  + ~RandomNum(5,3)~ + ~[PC] Can a <PRO_BOYGIRL> get a little peace and quiet around here?~ + a3145 /* c-aranshutup12 */
  + ~RandomNum(5,2)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3146 /* c-aranshutup13 */
  + ~RandomNum(5,1)~ + ~[PC] Oh, just shut up, will you?~ + a3147 /* c-aranshutup14 */
  ++ ~[PC] Actually, you were blocking my view. Have you put on a few pounds?~ + a1892
END

IF ~~ a1876
  SAY ~[ARAN] Whoa... Cyric's balls, that were a right close thing. I might o' had to scrub my footgear for a week. Good eyes, for noticin'... or were you just starin' at me?~
  + ~RandomNum(4,1)~ + ~[PC] Oh, nothing much.~ + a1902
  + ~RandomNum(4,2)~ + ~[PC] Oh, nothing much.~ + a1903
  + ~RandomNum(4,3)~ + ~[PC] Oh, nothing much.~ + a1904
  + ~RandomNum(4,4)~ + ~[PC] Oh, nothing much.~ + a1905
  + ~RandomNum(5,5)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3148 /* c-aranshutup15 */
  + ~RandomNum(5,4)~ + ~[PC] You know, you impress me. You write very well, considering you look as if you have trouble spelling your name without help.~ + a3149 /* c-aranshutup16 */
  + ~RandomNum(5,3)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3150 /* c-aranshutup17 */
  + ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] Before we go any further, Aran... what do you think our "relationship" is?~ + a3210
  + ~RandomNum(5,2)~ + ~[PC] Oh, just shut up, will you?~ + a3151 /* c-aranshutup18 */
  + ~RandomNum(5,1)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3152 /* c-aranshutup19 */
  + ~HPPercentLT("c-aran",40)~ + ~[PC] Just checking that everything is in order. You seem to be dripping blood everywhere, so I guess you need some serious healing.~ + a1877
  + ~HPPercentGT("c-aran",39) HPPercentLT("c-aran",80)~ + ~[PC] Just checking that everything is in order. You don't look so good, so I guess you might need a little healing.~ + a1878
  + ~HPPercentGT("c-aran",79)~ + ~[PC] Just checking that everything is in order. You don't look so badly off, so I guess you don't need healing.~ + a1879
END

IF ~~ a1877 SAY ~[ARAN] I'd bloody well fix myself up, if it didn't hurt so much to breathe. Hey, lend a lad a hand, will you? Just get me one o' them nice potions or a spell or somethin'.~ IF ~~ THEN EXIT END
IF ~~ a1878 SAY ~[ARAN] I's just a flesh wound. I figure if worst comes to worst, I can distract 'em wi' a mite bit o' blood. mayhap even scare 'em wi' some of my bruises. But thanks for lookin' in on me, eh?~ IF ~~ THEN EXIT END
IF ~~ a1879 SAY ~[ARAN] If that be some kind o' crack about hangin' back in combat, m'<PRO_BOYGIRL>, I go where you be tellin' me an' do what you be tellin' me, so more's th' fault wi' you!.~ IF ~~ THEN EXIT END
IF ~~ a1880 SAY ~[ARAN] Laugh away, monkey<PRO-BOYGIRL>. I know where you sleep!~ IF ~~ THEN EXIT END
IF ~~ a1881 SAY ~[ARAN] I keep askin' an' they keep tossin'. Problem is, it is vegetables, not skirts!~ IF ~~ THEN EXIT END
IF ~~ a1882 SAY ~[ARAN] You let me know when you be volunteerin'!~ IF ~~ THEN EXIT END
IF ~~ a1883 SAY ~[ARAN] Funny, funny - I handle my weapon quite well, m'<PRO_BOYGIRL>. I just like it better when some fair maiden handles it for me!~ IF ~~ THEN EXIT END
IF ~~ a1884 SAY ~[ARAN] No, seriously. Somethin' there? Did I forget to wash some blood off? A spider? Cyric's Black Heart, <CHARNAME>, you are messin' with me!~ IF ~~ THEN EXIT END
IF ~~ a1885 SAY ~[ARAN] Well, you found it. An' there be more where that came form, so I'd move upwind if I was you.~ IF ~~ THEN EXIT END
IF ~~ a1886 SAY ~[ARAN] Now how in th' hells you know that when I be wearin' armor is a question for th' ages. Most armor makes my arse look as big as a barn door. But thank you right kindly. Now, I would start complimentin' your various body parts, but I think I will avoid th' slappin' that will accompany my discussion o' your various curves an' byways, eh?~ IF ~~ THEN EXIT END
IF ~~ a1887 SAY ~[ARAN] No problem. Only I would have slicked my hair back a bit an' struck a pose if you had let me know, eh?~ IF ~~ THEN EXIT END
IF ~~ a1888 SAY ~[ARAN] I don't rightly know. By Tymorra's Bright Eyes, there's more than enough adventure around here for this lad. I could use a good belt o' hard spirits. Th' drinkin' kind, I mean.~ IF ~~ THEN EXIT END
IF ~~ a1889 SAY ~[ARAN] Never did get it done. Helm's Arse, if it hasn't broken free again.~ IF ~~ THEN EXIT END
IF ~~ a1890 SAY ~[ARAN] Does a Suneite enjoy a great piece o' art? Hells, yes. Except I want to use my own dice this time. I still owe you three dragons an' a crescent from last time.~ IF ~~ THEN EXIT END
IF ~~ a1891 SAY ~[ARAN] That's right fine wi' me. I have been preppin' for somethin' special. Always thought all this slaughter was goin' to waste, so I was figurin' on doin' a nice stew with our next adversary as th' main course. Exceptin' humans, that is. Or litches. Rehydration might be a bitch. Or elementals. Too tough to cook. An' no spiders. A nice dragon curry, perhaps?~ IF ~~ THEN EXIT END
IF ~~ a1892 SAY ~[ARAN] Well, now that you mention it, NO. But I di put more paddin' under my armor. That last combat, I got me a blighted bruise th' size o' two hands, on account o' my paddin' was a mite understrength. Serves me right for not checkin' on it.~ IF ~~ THEN EXIT END
IF ~~ a1893 SAY ~[ARAN] Am I doin' that again? I don't now where I picked that up. Probably one o' them damned bards, I guess. Sorry.~ IF ~~ THEN EXIT END
IF ~~ a1894 SAY ~[ARAN] Well, we got that, for sure. Tymorra's Light Fingers, if I'd have been smart, I would have wished for a ton o' gold, instead. I just figured the gods weren't listenin', so I got all wise with my mouth. Serves me right.~ IF ~~ THEN EXIT END
IF ~~ a1895 SAY ~[ARAN] Cyric's Stinkin' Arse, I didn't expect them to take me serious. All I asked was for a little adventure, and here we get stuck wi' changin' the whole world!~ IF ~~ THEN EXIT END
IF ~~ a1896 SAY ~[ARAN] You know, you scare th' crap out o' me when you say things like that. Somehow I suspect your next statement will be 'Demonic Dragons with Wraith Henchmen? Pfft. Aran, go take care of them, while I boil us up a nice pot of tea'.~ IF ~~ THEN EXIT END
IF ~~ a1897 SAY ~[ARAN] Oh, watch that sharp wit o' yours. You could harm a lad that way, you know. That is, if I gave a rat's arse!~ IF ~~ THEN EXIT END
IF ~~ a1899 SAY ~[ARAN] Lolth's Stinkin' Arse... oh, funny. Real funny. Did I ever tell you about th' time we got a little revenge on Kravich for his breakin' wind all th' time? It involved a bucket o' lukewarm water, a sleepin' roll, an' his left hand. Now I wonder if that might make a repeat performance...~ IF ~~ THEN EXIT END
IF ~~ a1900 SAY ~[ARAN] I'll have you know I was right drunk at th' time. An' it weren't me, it had to be my evil twin brother, separated at birth. Now, that be my story, an' I am stickin' wi' it!~ IF ~~ THEN EXIT END
IF ~~ a1901 SAY ~[ARAN] Heh. You're killin' me, here. Wi' friends like you, I think I might just see what th' other side has to offer!~ IF ~~ THEN EXIT END
IF ~~ a1898 SAY ~[ARAN] Now, last time you buttered me up like that, it was on account o' you had some clever plan what involved me runnin' out on point an' seein' if there was anythin' interested in whackin' us...~ IF ~~ THEN EXIT END

IF ~~ a1902
  SAY ~[ARAN] Have I got somethin' on my face? I have a bit o' food somewhere, don't I.~
  ++ ~[PC] Yep, that's it. Green, kinda slimy looking, and... oh, wait... that's your nose.~ + a1880
  + ~RandomNum(5,5)~ + ~[PC] Can a <PRO_BOYGIRL> get a little peace and quiet around here?~ + a3153 /* c-aranshutup20 */
  + ~RandomNum(5,4)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3154 /* c-aranshutup21 */
  + ~RandomNum(5,3)~ + ~[PC] Is there any way I could pursuade you to just shut the hells up? Short of physical violence, I mean.~ + a3155 /* c-aranshutup22 */
  + ~RandomNum(5,2)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3156 /* c-aranshutup23 */
  + ~RandomNum(5,1)~ + ~[PC] If you only swung your weaponry as fast as you move your mouth... well, it would be a good thing.~ + a3157 /* c-aranshutup24 */
  + ~Gender(Player1,MALE)~ + ~[PC] No, I was joking. Really, I was just wondering when you are going to smarten up and ask some lovely young thing to toss up her skirts for you.~ + a1881
  + ~Gender(Player1,FEMALE)~ + ~[PC] No, I was joking. Really, I was just wondering when you are going to smarten up and ask some lovely young thing to toss up her skirts for you.~ + a1882
  ++ ~[PC] No food, but I just keep wondering how someone so pretty can handle that weapon so well.~ + a1883
  ++ ~[PC] Oh, of course not.~ + a1884
END

IF ~~ a1903
  SAY ~[ARAN] Well, then, what do you want? You're not payin' attention to our surroundin's much.~
  ++ ~[PC] Just checking in with you to see if you are doing well.~ + a1888
  ++ ~[PC] Did you ever get that pack stitched? It looks a little loose.~ + a1889
  ++ ~[PC] Are you in for a game of dice tonight?~ + a1890
  + ~RandomNum(5,5)~ + ~[PC] Look, where I put my attention is my own damned business. Just shut up already.~ + a3158 /* c-aranshutup25 */
  + ~RandomNum(5,4)~ + ~[PC] Look, just shut up already. I don't want anything. You talk too much.~ + a3159 /* c-aranshutup26 */
  + ~RandomNum(5,3)~ + ~[PC] I was going to say something about the great ugly lump of fat that was attacking your head, but then I realized that was your face...~ + a3160 /* c-aranshutup27 */
  + ~RandomNum(5,2)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3161 /* c-aranshutup28 */
  + ~RandomNum(5,1)~ + ~[PC] Thou art a paunchy boil-brained pigeon-egg. See, I study, too.~ + a3162 /* c-aranshutup29 */
  ++ ~[PC] It's your turn to cook tonight.~ + a1891
END

IF ~~ a1904
  SAY ~[ARAN] Well, I'd advise we keep lookin' out for trouble, then, on account o' it sure knows where to find us.~
  ++ ~[PC] It might not find it so fast if you would stop whistling through your teeth like that.~ + a1893
  ++ ~[PC] Hey, you wanted adventure, right?~ + a1894
  + ~RandomNum(5,5)~ + ~[PC] Look, that wasn't funny. Just shut up already. You talk too much.~ + a3163 /* c-aranshutup30 */
  + ~RandomNum(5,4)~ + ~[PC] If I wanted an idiot's opinion... wait... yep, I would have asked you, all right.~ + a3164 /* c-aranshutup31 */
  + ~RandomNum(5,3)~ + ~[PC] Oh, just shut up, will you?~ + a3165 /* c-aranshutup32 */
  + ~RandomNum(5,2)~ + ~[PC] Can a <PRO_BOYGIRL> get a little peace and quiet around here?~ + a3166 /* c-aranshutup33 */
  + ~RandomNum(5,1)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3167 /* c-aranshutup34 */
  ++ ~[PC] You shouldn't have put that advertisement out, then.~ + a1895
  ++ ~[PC] Well, now the tables are turned. We are going looking for it.~ + a1896
END

IF ~~ a1905
  SAY ~[ARAN] I think when scholars write 'watch your compatriots' back', it's a figure o' speech, not literal.~
  ++ ~[PC] Laugh all you want, monkey boy. I just like seeing a good friend doing the job right.~ + a1898
  ++ ~[PC] Well, you watch my back, I'll watch yours... sounded like a good idea. Especially as you have a pretty hairy insect crawling on your left shoulder...~ + a1899
  + ~RandomNum(5,5)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3168 /* c-aranshutup35 */
  + ~RandomNum(5,4)~ + ~[PC] If that was meant to be funny, then you should keep your day job. At least then you will be bad at one thing instead of two.~ + a3169 /* c-aranshutup36 */
  + ~RandomNum(5,3)~ + ~[PC] I'd watch your back, but your buttocks are so large I would need a Wizard's eye to see all of it.~ + a3170 /* c-aranshutup37 */
  + ~RandomNum(5,2)~ + ~[PC] "Literally". The bighted word is "literally". And while we are at it, when are you going to learn how to pronounce the ends of words?~ + a3171 /* c-aranshutup38 */
  + ~RandomNum(5,1)~ + ~[PC] For a man who can't say "g" at the end of a word, "compatriot' is a little high class, isn't it?~ + a3172 /* c-aranshutup39 */
  ++ ~[PC] Funny. Hey, didn't I see you at the Blade and Stars, once? You were the starting act for those Singing Dwarves. Classic.~ + a1900
  ++ ~[PC] Pay attention, boyo. I don't want a repeat of the last five times we were ambushed while you were on watch...~ + a1901
END

/* Standard Exit Blocks (move to end) */
IF ~~ a3134 /* c-aranshutup1 */ SAY ~[ARAN] Aye, then. Shuttin' up.~ IF ~~ THEN EXIT END
IF ~~ a3135 /* c-aranshutup2 */ SAY ~[ARAN] By the Cryin' God's tears, you are in a mood.~ IF ~~ THEN EXIT END
IF ~~ a3136 /* c-aranshutup3 */ SAY ~[ARAN] Sure.~ IF ~~ THEN EXIT END
IF ~~ a3137 /* c-aranshutup4 */ SAY ~[ARAN] Fine. I'll be over there.~ IF ~~ THEN EXIT END
IF ~~ a3138 /* c-aranshutup5 */ SAY ~[ARAN] Sune's Lusty Lips, you can sure kill a conversation.~ IF ~~ THEN EXIT END
IF ~~ a3139 /* c-aranshutup6 */ SAY ~[ARAN] Corellon's Bowhand, you have an attitude today.~ IF ~~ THEN EXIT END
IF ~~ a3140 /* c-aranshutup7 */ SAY ~[ARAN] Shar's Arsehole, shut me down, will ya? Fine.~ IF ~~ THEN EXIT END
IF ~~ a3141 /* c-aranshutup8 */ SAY ~[ARAN] By the Cryin' God's Tears - I was just makin' conversation.~ IF ~~ THEN EXIT END
IF ~~ a3142 /* c-aranshutup9 */ SAY ~[ARAN] Well, I'll just bugger off, then. This is me, see, mindin' my own business.~ IF ~~ THEN EXIT END
IF ~~ a3143 /* c-aranshutup10 */ SAY ~[ARAN] Cyric's Twisted Tongue. Just wanted to talk, y'know.~ IF ~~ THEN EXIT END
IF ~~ a3144 /* c-aranshutup11 */ SAY ~[ARAN] Grumbar's Clay Fist. I'm shuttin' up, already.~ IF ~~ THEN EXIT END
IF ~~ a3145 /* c-aranshutup12 */ SAY ~[ARAN] Sure. Kossuth's Burning Bones, I thought we were just passin' time conversin'.~ IF ~~ THEN EXIT END
IF ~~ a3146 /* c-aranshutup13 */ SAY ~[ARAN] Lolth's Cruel Fingernails, you can cut a man down. Sure. Shuttin' up.~ IF ~~ THEN EXIT END
IF ~~ a3147 /* c-aranshutup14 */ SAY ~[ARAN] Umberlee's Fickle Breath, I'll shut my blighted mouth, then.~ IF ~~ THEN EXIT END
IF ~~ a3148 /* c-aranshutup15 */ SAY ~[ARAN] Malar's Sharp Teeth. Shuttin' up an' soldierin'.~ IF ~~ THEN EXIT END
IF ~~ a3149 /* c-aranshutup16 */ SAY ~[ARAN] Tiamat's Grasping Hands. You don't want to talk, fine by me.~ IF ~~ THEN EXIT END
IF ~~ a3150 /* c-aranshutup17 */ SAY ~[ARAN] Talona's Pestilence - is my breath that bad?~ IF ~~ THEN EXIT END
IF ~~ a3151 /* c-aranshutup18 */ SAY ~[ARAN] Jergal's Mouldy Wrappings... this conversation's dead.~ IF ~~ THEN EXIT END
IF ~~ a3152 /* c-aranshutup19 */ SAY ~[ARAN] Shaundakul's Mighty Breath, I guess I was yammerin' on again.~ IF ~~ THEN EXIT END
IF ~~ a3153 /* c-aranshutup20 */ SAY ~[ARAN] Well, that was colder than Auril's Tits in th' Ten Towns. Shuttin' up.~ IF ~~ THEN EXIT END
IF ~~ a3154 /* c-aranshutup21 */ SAY ~[ARAN] Kelemvor's Scythe - you cut me off quick, there, <CHARNAME>.~ IF ~~ THEN EXIT END
IF ~~ a3155 /* c-aranshutup22 */ SAY ~[ARAN] Bane's Broken Bones, but you are in a mood.~ IF ~~ THEN EXIT END
IF ~~ a3156 /* c-aranshutup23 */ SAY ~[ARAN] Waukeen's Avarice, you want all th' conversation to yourself?~ IF ~~ THEN EXIT END
IF ~~ a3157 /* c-aranshutup24 */ SAY ~[ARAN] Lathander's Shining Buttocks, I'll just shut my mouth an' keep to myself, then.~ IF ~~ THEN EXIT END
IF ~~ a3158 /* c-aranshutup25 */ SAY ~[ARAN] Talos's Hideous Strength, I wasn't tryin' to butt in. Just wanted to talk, you know.~ IF ~~ THEN EXIT END
IF ~~ a3159 /* c-aranshutup26 */ SAY ~[ARAN] Shar's Blackened Bodice, all's I wanted was to talk a mite. I know, I know - 'shut up an' soldier, soldier'.~ IF ~~ THEN EXIT END
IF ~~ a3160 /* c-aranshutup27 */ SAY ~[ARAN] Aye, then. Kelemvor's Dry Breath, but conversations get judged quick around here, eh? An' found wantin', apparently.~ IF ~~ THEN EXIT END
IF ~~ a3161 /* c-aranshutup28 */ SAY ~[ARAN] Bugger all. Bane's Bones, <PRO_MANWOMAN>. Just makin' conversation.~ IF ~~ THEN EXIT END
IF ~~ a3162 /* c-aranshutup29 */ SAY ~[ARAN] Sweet merciful patience... by Mystra's Pale Cheeks, all I was sayin' was... never mind.~ IF ~~ THEN EXIT END
IF ~~ a3163 /* c-aranshutup30 */ SAY ~[ARAN] Torm's Mailed Fist, you slammed that conversation shut solid.~ IF ~~ THEN EXIT END
IF ~~ a3164 /* c-aranshutup31 */ SAY ~[ARAN] Sons of the Seldarine, you know how to close up a conversation right quick.~ IF ~~ THEN EXIT END
IF ~~ a3165 /* c-aranshutup32 */ SAY ~[ARAN] Daughters of the Seldarine, I'll just shut my mouth tight, then.~ IF ~~ THEN EXIT END
IF ~~ a3166 /* c-aranshutup33 */ SAY ~[ARAN] Larethian's Sharp Sword, you got a bad case o' attitude, eh?~ IF ~~ THEN EXIT END
IF ~~ a3167 /* c-aranshutup34 */ SAY ~[ARAN] Larethian's Mighty Bow, you be in a sharp mood. Fine, shuttin' up.~ IF ~~ THEN EXIT END
IF ~~ a3168 /* c-aranshutup35 */ SAY ~[ARAN] Correlon's Bent Bow. Th' next thing you will be sayin' is to stick my conversation where the sun don't shine.~ IF ~~ THEN EXIT END
IF ~~ a3169 /* c-aranshutup36 */ SAY ~[ARAN] Correlon's Silvery Sword, didn't anyone ever tell you conversation unburdens th' soul, an' opens new horizons?~ IF ~~ THEN EXIT END
IF ~~ a3170 /* c-aranshutup37 */ SAY ~[ARAN] Avoreen's Bowhand, I'll just be a good little boy an' go play wi' myself, then.~ IF ~~ THEN EXIT END
IF ~~ a3171 /* c-aranshutup38 */ SAY ~[ARAN] Avoreen's Sling, you'd think I were interruptin' some deep important thoughts or somethin'.~ IF ~~ THEN EXIT END
IF ~~ a3172 /* c-aranshutup39 */ SAY ~[ARAN] Clanggedin's Hammer. Fine. Be that way.~ IF ~~ THEN EXIT END
IF ~~ a3173 /* c-aranshutup40 */ SAY ~[ARAN] Brightaxe's Brilliant Beard, you know how to tell a guy to shut it.~ IF ~~ THEN EXIT END
IF ~~ a3174 /* c-aranshutup41 */ SAY ~[ARAN] Kelemvor's Cold Cathedral, I 'd get better conversation out o' that there pile o' rocks.~ IF ~~ THEN EXIT END
IF ~~ a3175 /* c-aranshutup42 */ SAY ~[ARAN] Kelemvor's Sharp Scythe, you have a keen wit. Make sure you don't cut yourself while tellin' poor little old me to shut up for the twenty-thousandth time. I got feelin's, you know.~ IF ~~ THEN EXIT END
IF ~~ a3176 /* c-aranshutup43 */ SAY ~[ARAN] Lathander's Lively Lusts, I can think o' several things other than talkin' I'd rather be doin', too. But you be th' boss. No more talkin', I guess.~ IF ~~ THEN EXIT END
IF ~~ a3177 /* c-aranshutup44 */ SAY ~[ARAN] Lathander's Leaping Legs, screw you anyways. I was just makin' conversation.~ IF ~~ THEN EXIT END
IF ~~ a3178 /* c-aranshutup45 */ SAY ~[ARAN] Lathander's Luminous Lips, there be better ways o' tellin' a lad he talks too much.~ IF ~~ THEN EXIT END
IF ~~ a3179 /* c-aranshutup46 */ SAY ~[ARAN] Lathander's Golden Poop, are you goin' to lighten up soon, or do I need to get you some kind o' shroud? Sounds like you'd rather just go stick yourself in th' ground than talk to me, eh?~ IF ~~ THEN EXIT END
IF ~~ a3180 /* c-aranshutup47 */ SAY ~[ARAN] Lathander's Lusty Light, I do believe you just told me to shut my fat ugly mouth. I'd be offended, if I gave a rat's arse.~ IF ~~ THEN EXIT END
IF ~~ a3181 /* c-aranshutup48 */ SAY ~[ARAN] Sune's Sweet Smile, you have such a lovely disposition today. Such refinement an' politeness as you tell me to sod off an' shut my bloody mouth.~ IF ~~ THEN EXIT END
IF ~~ a3182 /* c-aranshutup49 */ SAY ~[ARAN] By th' Black Hand of Tyranny, I done been put in my place. Fine. Conversation done. I'll go find someone else what to talk with.~ IF ~~ THEN EXIT END
IF ~~ a3183 /* c-aranshutup50 */ SAY ~[ARAN] Talos' Storms, you got a short temper.~ IF ~~ THEN EXIT END
IF ~~ a3184 /* c-aranshutup51 */ SAY ~[ARAN] Tempus' Shield. I'll shut my flappin' jaw, then.~ IF ~~ THEN EXIT END
IF ~~ a3185 /* c-aranshutup52 */ SAY ~[ARAN] Torm's Blood, you shut this down cold. I must have touched some nerve there, eh?~ IF ~~ THEN EXIT END
IF ~~ a3186 /* c-aranshutup53 */ SAY ~[ARAN] Tyr's Torn Tonsure just makin' conversation.~ IF ~~ THEN EXIT END
IF ~~ a3187 /* c-aranshutup54 */ SAY ~[ARAN] Ubtao's Great Beginning, I thought we had a mite to talk about. I guess I be wrong.~ IF ~~ THEN EXIT END
IF ~~ a3188 /* c-aranshutup55 */ SAY ~[ARAN] Auril's Icy Aura, that chilled things right quick, it did.~ IF ~~ THEN EXIT END
IF ~~ a3189 /* c-aranshutup56 */ SAY ~[ARAN] Tymora's Fickle fortune, an' here I thought we had a good conversation goin'.~ IF ~~ THEN EXIT END
IF ~~ a3190 /* c-aranshutup57 */ SAY ~[ARAN] Umberlee's Undulations, you cut me off quick. Fine. I can take a hint.~ IF ~~ THEN EXIT END
IF ~~ a3191 /* c-aranshutup58 */ SAY ~[ARAN] Umberlee's Dark Depths, That were cold. Fine. No more on this talk, I be guessin'.~ IF ~~ THEN EXIT END
IF ~~ a3192 /* c-aranshutup59 */ SAY ~[ARAN] Waukeen's Wanderin' Worshipers, I was just makin' conversation.~ IF ~~ THEN EXIT END
IF ~~ a3193 /* c-aranshutup60 */ SAY ~[ARAN] Azuth's Mysterious Mages. Shuttin' up right quick, I am.~ IF ~~ THEN EXIT END
IF ~~ a3194 /* c-aranshutup61 */ SAY ~[ARAN] Deneir's Sharp Quill, you cut that conversation right short.~ IF ~~ THEN EXIT END
IF ~~ a3195 /* c-aranshutup62 */ SAY ~[ARAN] Deneir's Everlasting Parchment, I do believe you don't want to talk no more, eh? Fine by me.~ IF ~~ THEN EXIT END
IF ~~ a3196 /* c-aranshutup63 */ SAY ~[ARAN] Deneir's Indelible Ink. You would think I'd know not to bother you by now. But I be a slow learner, I guess.~ IF ~~ THEN EXIT END
IF ~~ a3197 /* c-aranshutup64 */ SAY ~[ARAN] Eldath's Sweet Song, I was hopin'... well, never mind.~ IF ~~ THEN EXIT END
IF ~~ a3198 /* c-aranshutup65 */ SAY ~[ARAN] Lliira's Joyful Lips, I can take a hint. Especially when it be no hint, but a bald-faced "Shut your stinkin' mouth, sellsword".~ IF ~~ THEN EXIT END
IF ~~ a3199 /* c-aranshutup66 */ SAY ~[ARAN] Malar's Beastial Breath, I am shuttin' up.~ IF ~~ THEN EXIT END
IF ~~ a3200 /* c-aranshutup67 */ SAY ~[ARAN] Milil's Robust Voice. You don't have to cut e down that harsh. A mild "shut your stinkin' hole you stupid sellsword" would have got your point across right fine.~ IF ~~ THEN EXIT END
IF ~~ a3201 /* c-aranshutup68 */ SAY ~[ARAN] Shaundakul's Wandering Ways, I didn't mean to... fine. Shuttin' my mouth an' soldierin'.~ IF ~~ THEN EXIT END
IF ~~ a3202 /* c-aranshutup69 */ SAY ~[ARAN] Talona's Mericless Poisons, I be shuttin' up.~ IF ~~ THEN EXIT END
IF ~~ a3203 /* c-aranshutup70 */ SAY ~[ARAN] Garagos' Mighty Halberd, I wasn't tryin' to tick you off.~ IF ~~ THEN EXIT END
IF ~~ a3204 /* c-aranshutup71 */ SAY ~[ARAN] Hoar's Swift Justice, you shot that down right quick.~ IF ~~ THEN EXIT END
IF ~~ a3205 /* c-aranshutup72 */ SAY ~[ARAN] The Red Knight's Rump, I think I be makin' a tactical withdrawal. In layman's terms, that be "run away! run away!"~ IF ~~ THEN EXIT END
IF ~~ a3206 /* c-aranshutup73 */ SAY ~[ARAN] Savras' Foresight, I should have known you didn't want none o' that talk.~ IF ~~ THEN EXIT END
IF ~~ a3207 /* c-aranshutup74 */ SAY ~[ARAN] Sharess' Sensual Caress, I was not expectin' to be cut off at th' knees like that.~ IF ~~ THEN EXIT END
IF ~~ a3208 /* c-aranshutup75 */ SAY ~[ARAN] Velsharoon's Vicious Vampires, you done sucked th' blood out o' that whole talk.~ IF ~~ THEN EXIT END


 // unused 'shutup' conversation exit panels :

  // + ~RandomNum(5,5)~ + ~[PC] Is there any way I could pursuade you to just shut the hells up? Short of physical violence, I mean.~ + a3173 /* c-aranshutup40 */
  // + ~RandomNum(5,4)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3174 /* c-aranshutup41 */
  // + ~RandomNum(5,3)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3175 /* c-aranshutup42 */
  // + ~RandomNum(5,2)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3176 /* c-aranshutup43 */
  // + ~RandomNum(5,1)~ + ~[PC] Just leave me alone, ok? I didn't mean to disturb your industrious scratching of various body parts. Go back to doing whatever it is you were doing.~ + a3177 /* c-aranshutup44 */

  // + ~RandomNum(5,5)~ + ~[PC] I am trying to think up a random insult to hurl your way, but I'm fresh out of ideas.~ + a3178 /* c-aranshutup45 */
  // + ~RandomNum(5,4)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3179 /* c-aranshutup46 */
  // + ~RandomNum(5,3)~ + ~[PC] I would insult you, but I have rules against taking advantage of idiots.~ + a3180 /* c-aranshutup47 */
  // + ~RandomNum(5,2)~ + ~[PC] Forget it. And stop yammering on, will you? Give it a rest.~ + a3181 /* c-aranshutup48 */
  // + ~RandomNum(5,1)~ + ~[PC] To quote a Rashemite insult, thou art a warped ill-nurtured gibberling.~ + a3182 /* c-aranshutup49 */

  // + ~RandomNum(5,5)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3183 /* c-aranshutup50 */
  // + ~RandomNum(5,4)~ + ~[PC] Can a <PRO_BOYGIRL> get a little peace and quiet around here?~ + a3184 /* c-aranshutup51 */
  // + ~RandomNum(5,3)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3185 /* c-aranshutup52 */
  // + ~RandomNum(5,2)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3186 /* c-aranshutup53 */
  // + ~RandomNum(5,1)~ + ~[PC] Forget it. And stop yammering on, will you? Give it a rest.~ + a3187 /* c-aranshutup54 */

  // + ~RandomNum(5,5)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3188 /* c-aranshutup55 */
  // + ~RandomNum(5,4)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3189 /* c-aranshutup56 */
  // + ~RandomNum(5,3)~ + ~[PC] Oh, just shut up, will you?~ + a3190 /* c-aranshutup57 */
  // + ~RandomNum(5,2)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3191 /* c-aranshutup58 */
  // + ~RandomNum(5,1)~ + ~[PC] I think you should stand downwind of me. Perhaps that will make your muttering to yourself less obvious.~ + a3192 /* c-aranshutup59 */

  // + ~RandomNum(5,5)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3193 /* c-aranshutup60 */
  // + ~RandomNum(5,4)~ + ~[PC] Is there any way I could pursuade you to just shut the hells up? Short of physical violence, I mean.~ + a3194 /* c-aranshutup61 */
  // + ~RandomNum(5,3)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3195 /* c-aranshutup62 */
  // + ~RandomNum(5,2)~ + ~[PC] Forget it. And stop yammering on, will you? Give it a rest.~ + a3196 /* c-aranshutup63 */
  // + ~RandomNum(5,1)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3197 /* c-aranshutup64 */

  // + ~RandomNum(5,5)~ + ~[PC] Can a <PRO_BOYGIRL> get a little peace and quiet around here?~ + a3198 /* c-aranshutup65 */
  // + ~RandomNum(5,4)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3199 /* c-aranshutup66 */
  // + ~RandomNum(5,3)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3200 /* c-aranshutup67 */
  // + ~RandomNum(5,2)~ + ~[PC] Oh, just shut up, will you?~ + a3201 /* c-aranshutup68 */
  // + ~RandomNum(5,1)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3202 /* c-aranshutup69 */

  // + ~RandomNum(5,5)~ + ~[PC] I am trying to think up a random insult to hurl your way, but I'm fresh out of ideas.~ + a3203 /* c-aranshutup70 */
  // + ~RandomNum(5,4)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3204 /* c-aranshutup71 */
  // + ~RandomNum(5,3)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3205 /* c-aranshutup72 */
  // + ~RandomNum(5,2)~ + ~[PC] Is there any way I could pursuade you to just shut the hells up? Short of physical violence, I mean.~ + a3206 /* c-aranshutup73 */
  // + ~RandomNum(5,1)~ + ~[PC] Look, just shut up already. You talk too much.~ + a3207 /* c-aranshutup74 */

 /* wraith response */
IF ~~ a2239
  SAY ~[ARAN] By Ilmater's Tears, that don't help th' feelin's this bastard be slappin' me with. For th' sake o' mercy, can we shut him th' blighted hells up?~
  IF ~~ THEN EXTERN HGWRA01 25
END

END /* of append to c-arn25j */

/* Added ToB "PID Started by another NPC" calls. In ToB, I am sticking with the Canonical BioWare(tm) and a standard "IsGabber/<TOKEN>" block to cover any of the others, but Sarevok might be fun to play with: */

CHAIN ~C-ARN25J~ a2676
~[ARAN] What do you want, Sarevok?~
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",0)~ THEN ~[ARAN] I'd be right happy to lend you a dagger. You could slit your gods-blighted throat, an' make us all a great deal happier.~
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",1)~ THEN ~[ARAN] You have no ability to make children, right? On account o' I think Faerun has blighted well had enough wi' just one o' you.~
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",2)~ THEN ~[ARAN] I want nothin' out o' you but breathin'. Strike that... I meant to say, I want you to quit breathin'.~
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",3)~ THEN ~[ARAN] Why don't you die already, an' go take over some nice corner o' th' nine hells, like a good little bastard? Wait... done forgot. You tried that, an' failed.~
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",4)~ THEN ~[ARAN] You got yourself a strikin' face, there. Hold still, an' I'd be right happy to strike it. Mayhap I might even stop after a bit.~
== C-ARN25J IF ~Global("c-aransarspar","GLOBAL",5)~ THEN ~[ARAN] Look, you stinkin' power-hungry evil bastard, I only put up wi' you on account o' <CHARNAME>'s wishes. Don't sleep too sound, or I might forget what <PRO_HESHE> done said, an' rid us all o' your unnatural presence.~
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",0)~ THEN ~[SAREVOK] You would be more amusing, sellsword, if you were not so weak.~ DO ~SetGlobal("c-aransarspar","GLOBAL",1)~
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",1)~ THEN ~[SAREVOK] The barking of stray dogs does not bother me, sellsword.~ DO ~SetGlobal("c-aransarspar","GLOBAL",2)~
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",2)~ THEN ~[SAREVOK] Ah, the breaking of wind. The sellsword must be talking again.~ DO ~SetGlobal("c-aransarspar","GLOBAL",3)~
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",3)~ THEN ~[SAREVOK] If you wish to act in <CHARNAME>'s best interest, fall on your sword now. Take care not to place it near your head, though, as it might not do enough damage on so hard a rock as that.~  DO ~SetGlobal("c-aransarspar","GLOBAL",4)~
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",4)~ THEN ~[SAREVOK] Ah, the mewling of an infant who realizes he will never be a powerful force to be reckoned with.~  DO ~SetGlobal("c-aransarspar","GLOBAL",5)~
== SAREV25J IF ~Global("c-aransarspar","GLOBAL",5)~ THEN ~[SAREVOK] I merely wished to see if you had become more inventive in your invective. Sadly, you have the wit of a dull dagger.~
EXIT

/*
OK, then came the little matter of ToB Joining dialog, and how to set things for Romance. For male PCs, this really doesn't matter. Aran can pick up and run with it. But for female PCs, the same problem Berelinde had with going between BG1 and BG2 with Gavin gets into play here. We have three "Fate Spirit" summons for female PC's, allowing declaration of "friend", "lover", and "former lover", setting the romance variable to 0, 2, or 3. But with the in-depth content in play in BG2, it makes it difficult to follow further whether they have had an on-again off-again relationship, or what they have done together.

There is another consideration - testing. Basically, after each opportunity to flirt or lovetalk or whatever, I want an easy way of determining the status of the relationship without always having to type in the CLUAConsole (because I sink at typing). And a very common player post is about how to set or change the romance variables, or check on them. So, an opportunity that is more in-depth than the standard PID "breakup, flirt, no flirt" options... something that during joining, rejoining, and regular play the player can use to check on (and perhaps change) the status. If playtesters dislike it, we can always drop it - it does mean that a player can "change history" on the fly the way it is currently coded. That might be useful for testing, but might not be so cool in play.

Copis go in pre-joined ToB, Joined ToB, Post-Joined ToB, Post-Joined SoA, and Joined SoA. Initiating links could loop in anywhere, but this probably is best set up as a PID option "status check".
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
  ++ ~[PC] Before we go any further, Aran... what do you think our "relationship" is?~ + a3210
[/code]
*/

/* Aran... what do you think our "relationship" is?  Resetting for players for ToB, but might double as a recheck via PID on both SoA and ToB. Useful for testing, anyways. */
CHAIN C-ARN25A a2694
~[ARAN] Well now, let me think a bit... our relationship. Put a lad on th' spot, eh?~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranfight","GLOBAL",0)~ THEN ~[ARAN] Currently, we be fightin' mad at eachother, or so it seems.~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You done told me to quit makin' all sorts o' random comments.~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aanoconflict","GLOBAL",0)~ THEN ~[ARAN] You done told me I should be leavin' Anomen alone an' not fightin' wi' him.~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0)~ THEN ~[ARAN] I seem to not have ticked you off to th' point where you drop me for good, eh? I think even be friends. Why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1)~ THEN ~[ARAN] I seem to not have ticked you off to th' point where you drop me for good, eh? You done told me no sellsword has th' right to be called "friend". Why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",1)~ THEN ~[ARAN] You haven't told me to not try a bit o' sparkin' from time to time. Then again, You done got a huge amount to think about lately. I think we be friends, more's th' pity. Why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",0)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. Mayhap I can coax you into a kiss or two someday. Why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",1)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. Mayhap I can coax you into more than a kiss or two someday. Why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",2)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. Mayhap I can coax you into somethin' more than kissin' an' touchin' someday. Why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",3)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. I can rightly say I live for th' times when we get physical wi' eachother. Mayhap someday we will take that final step. Why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",4)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. An' I won't never forget spendin' time wi' you all tangled up, explorin' everythin'... why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",3)~ THEN ~[ARAN] I seem to not have ticked you off to th' point were you drop me for good, eh? I think we even be friends. We could have a bit more, but I guess things didn't work out th' way you wanted. Why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You haven't told me to bugger off permanent, though you do seem a trifle short wi' me from time to time. Then again, You done got a huge amount to think about lately. You also let me prattle on an' on about whatever I like, which is blighted nice o' you. I think we be friends. Why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You told me to not try to confuse things by bein' friends, so we be supposed to keep to th' professional side. You command, I follow. Then you pay me. You do let me prattle on an' on about whatever I like, which is blighted nice o' you.  Why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You haven't told me to bugger off permanent, though you do seem a trifle short wi' me from time to time. Then again, You done got a huge amount to think about lately. You also told me not to talk so much. I think we be friends. Why do you be askin'?~
== C-ARN25A IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You told me to not try to confuse things by bein' friends, so we be supposed to keep to th' professional side. I also am supposed to keep my blighted mouth shut most o' th' time. You command, I follow. Then you pay me. Why do you be askin'?~
== C-ARN25A IF ~HasItemEquiped("belt05",Player1)~ THEN ~[ARAN] Hey... you know, I be havin' one hells o' a blighted time figurin' out just what I think o' our relationship. I mean, that belt... it confuses me right proper, it do.~
END
++ ~[PC] I was just wondering.~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + ~[PC] Oh, I just thought you might realize that I depend on you as one of my closest friends. I may not treat you exactly the way you would like, but I count on you..~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + ~[PC] No sellsword ever has the right to call me "friend".~ DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",1)~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + ~[PC] It is good to know that you know your place.~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + ~[PC] In your case, I will make an exception. I think we are friends.~ DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",0)~  EXIT
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] I think we have headed down the wrong path, Aran. Let's just be friends.~ DO ~SetGlobal("c-aranrom","GLOBAL",3)~ + a2661
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] I think I am... very interested in you. Romantically speaking.~ DO ~SetGlobal("c-aranrom","GLOBAL",2)~ + a2698
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] I think we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we might just see what happens...~ DO ~SetGlobal("c-aransummoned","GLOBAL",2)~ + a2652
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] I think I am... interested in you. But I don't like things to move so fast. Perhaps we should be friends, and explore becoming more?~ DO ~SetGlobal("c-aranrom","GLOBAL",1)~ + a2697
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] I can't believe you have forgotten all of the passion. You are so physical, but you can't remember with whom?~ EXTERN C-ARN25A a2695
+ ~HasItemEquiped("belt05",Player1)~ + ~[PC] Just checking.~ EXIT

APPEND C-ARN25A

IF ~~ a2695
  SAY ~[ARAN] Mayhap I have been knocked on th' head, but I am sure I would remember anythin' to do with you, <CHARNAME>. I... why, what do you know that I don't?~
  ++ ~[PC] You remember it correctly, Aran. I was just teasing you.~ + a2697
  ++ ~[PC] You remember it correctly, Aran. All except.. well, I thought we had a few stray glances, and the way your eyes look at me, I think you want more than just a little friendship. Nothing has really happened.~ DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a2697
  ++ ~[PC] Shall I jog your memory, and describe some of the things we have done together?~ +  a2696
  ++ ~[PC] No. I think you have it just the way I want it. Thank the gods for memory lapses.~ + a2697
END

IF ~~ a2696
  SAY ~[ARAN] I would love that.~
  ++ ~[PC] You remember it correctly, Aran. I was just teasing you.~ + a2697
  ++ ~[PC] You remember it correctly, Aran. All except the stray glances, whispers, and the way you look at me. It is like you are hungry, but not for food.~ DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a2697
  ++ ~[PC] You remember it correctly, Aran. All except the bold glances, whispered conversations, and some very deep kisses.~ DO ~SetGlobal("c-aransex","GLOBAL",1)~ +  a2698
  ++ ~[PC] You remember it correctly, Aran. All except the stolen whispered conversations, the feel of your fingers tracing runes my body, the feel of the bare skin of your chest under my palms... and kisses that set us both on fire.~ DO ~SetGlobal("c-aransex","GLOBAL",2)~ + a2698
  ++ ~[PC] Aran... we have spent so much time together, the only thing we haven't done is... ~  DO ~SetGlobal("c-aransex","GLOBAL",3)~ + a2698
  ++ ~[PC] Aran... I know the touch of you, the feel of all you, and that little strained look you get just before you... ~  DO ~SetGlobal("c-aransex","GLOBAL",4)~ + a2698
  ++ ~[PC] No. I think you have it just the way I want it. Thank the gods for memory lapses.~ + a2697
END

IF ~~ a2697
  SAY ~[ARAN] Well, you had me off balance, there. I be right happy we both agree. I was worried, mayhap because any time a woman asks about 'relationship status', there be a powerful lot o' pitfalls an' traps a lad can fall into, eh?~
  IF ~~ THEN EXIT
END

IF ~~ a2698
  SAY ~[ARAN] I can stop you right there, with a kiss. I can't rightly forget anythin' about us, but it sure does feel good to hear you speakin' o' us like this. I was just a mite off balance, is all. Mayhap because any time a woman asks about 'relationship status', there be a powerful lot o' pitfalls an' traps a lad can fall into, eh?~
  IF ~~ THEN EXIT
END

END /* of APPEND */

/* copy for Joined */

CHAIN C-ARN25J a3210
~[ARAN] Well now, let me think a bit... our relationship. Put a lad on th' spot, eh?~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranfight","GLOBAL",0)~ THEN ~[ARAN] Currently, we be fightin' mad at eachother, or so it seems.~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You done told me to quit makin' all sorts o' random comments.~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aanoconflict","GLOBAL",0)~ THEN ~[ARAN] You done told me I should be leavin' Anomen alone an' not fightin' wi' him.~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0)~ THEN ~[ARAN] I seem to not have ticked you off to th' point where you drop me for good, eh? I think even be friends. Why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1)~ THEN ~[ARAN] I seem to not have ticked you off to th' point where you drop me for good, eh? You done told me no sellsword has th' right to be called "friend". Why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",1)~ THEN ~[ARAN] You haven't told me to not try a bit o' sparkin' from time to time. Then again, You done got a huge amount to think about lately. I think we be friends, more's th' pity. Why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",0)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. Mayhap I can coax you into a kiss or two someday. Why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",1)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. Mayhap I can coax you into more than a kiss or two someday. Why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",2)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. Mayhap I can coax you into somethin' more than kissin' an' touchin' someday. Why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",3)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. I can rightly say I live for th' times when we get physical wi' eachother. Mayhap someday we will take that final step. Why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",4)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. An' I won't never forget spendin' time wi' you all tangled up, explorin' everythin'... why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",3)~ THEN ~[ARAN] I seem to not have ticked you off to th' point where you drop me for good, eh? I think we even be friends. We could have a bit more, but I guess things didn't work out th' way you wanted. Why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You haven't told me to bugger off permanent, though you do seem a trifle short wi' me from time to time. Then again, You done got a huge amount to think about lately. You also let me prattle on an' on about whatever I like, which is blighted nice o' you. I think we be friends. Why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You told me to not try to confuse things by bein' friends, so we be supposed to keep to th' professional side. You command, I follow. Then you pay me. You do let me prattle on an' on about whatever I like, which is blighted nice o' you.  Why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You haven't told me to bugger off permanent, though you do seem a trifle short wi' me from time to time. Then again, You done got a huge amount to think about lately. You also told me not to talk so much. I think we be friends. Why do you be askin'?~
== C-ARN25J IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You told me to not try to confuse things by bein' friends, so we be supposed to keep to th' professional side. I also am supposed to keep my blighted mouth shut most o' th' time. You command, I follow. Then you pay me. Why do you be askin'?~
== C-ARN25J IF ~HasItemEquiped("belt05",Player1)~ THEN ~[ARAN] Hey... you know, I be havin' one hells o' a blighted time figurin' out just what I think o' our relationship. I mean, that belt... it confuses me right proper, it do.~
END
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + ~[PC] I was just wondering.~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + ~[PC] Oh, I just thought you might realize that I depend on you as one of my closest friends. I may not treat you exactly the way you would like, but I count on you.~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + ~[PC] No sellsword ever has the right to call me "friend".~ DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",1)~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + ~[PC] It is good to know that you know your place.~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + ~[PC] In your case, I will make an exception. I think we are friends.~ DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",0)~  EXIT
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we have headed down the wrong path, Aran. Let's just be friends.~ + a3211
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think I am... very interested in you. Romantically speaking.~ DO ~SetGlobal("c-aranrom","GLOBAL",2)~ + a3215
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] I think we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we might just see what happens...~ DO ~SetGlobal("c-aranrom","GLOBAL",2)~ + a3213
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think I am... interested in you. But I don't like things to move so fast. Perhaps we should be friends, and explore becoming more?~ DO ~SetGlobal("c-aranrom","GLOBAL",1)~ + a3214
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] I can't believe you have forgotten all of the passion. You are so physical, but you can't remember with whom?~ EXTERN C-ARN25J a3212
+ ~HasItemEquiped("belt05",Player1)~ + ~[PC] Just checking.~ EXIT

APPEND C-ARN25J

IF ~~ a3211
  SAY ~[ARAN] You... fine. You want to be that way, it be your loss. I have more interestin' women to hunt anyways. Ones what appreciate what I can give.~
  = ~[ARAN] You know, I deserve a bit more than to be dumped in th' refuse pit like I was some cast-off toy. You yank me out o' my life an' drag me here... just lookin' to screw wi' my life an' torture me before discardin' me on th' trash heap? Mayhap I be rough an' not th' finest, but I be bloody loyal.~
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~  EXIT
END

IF ~~ a3212
  SAY ~[ARAN] Mayhap I have been knocked on th' head, but I am sure I would remember anythin' to do with you, <CHARNAME>. I... why, what do you know that I don't?~
  ++ ~[PC] You remember it correctly, Aran. I was just teasing you.~ + a3214
  ++ ~[PC] You remember it correctly, Aran. All except.. well, I thought we had a few stray glances, and the way your eyes look at me, I think you want more than just a little friendship. Nothing has really happened.~ DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a3214
  ++ ~[PC] Shall I jog your memory, and describe some of the things we have done together?~ + a3216
  ++ ~[PC] No. I think you have it just the way I want it. Thank the gods for memory lapses.~ + a3214
END

IF ~~ a3213
  SAY ~[ARAN] Aye, now... that be a plan I can live with. I might even seal it wi' a kiss, when there be none to see. You will just have to be expectin' th' unexpected.~
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~  EXIT
END

IF ~~ a3214
  SAY ~[ARAN] Well, you had me off balance, there. I be right happy we both agree. I was worried, mayhap because any time a woman asks about 'relationship status', there be a powerful lot o' pitfalls an' traps a lad can fall into, eh?~
  IF ~~ THEN EXIT
END

IF ~~ a3215
  SAY ~[ARAN] I can stop you right there, with a kiss. I can't rightly forget anythin' about us, but it sure does feel good to hear you speakin' o' us like this. I was just a mite off balance, is all. Mayhap because any time a woman asks about 'relationship status', there be a powerful lot o' pitfalls an' traps a lad can fall into, eh?~
  IF ~~ THEN EXIT
END

IF ~~ a3216
  SAY ~[ARAN] I would love that.~
  ++ ~[PC] You remember it correctly, Aran. I was just teasing you.~ + a3214
  ++ ~[PC] You remember it correctly, Aran. All except the stray glances, whispers, and the way you look at me. It is like you are hungry, but not for food.~ DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a3214
  ++ ~[PC] You remember it correctly, Aran. All except the bold glances, whispered conversations, and some very deep kisses.~ DO ~SetGlobal("c-aransex","GLOBAL",1)~ + a3215
  ++ ~[PC] You remember it correctly, Aran. All except the stolen whispered conversations, the feel of your fingers tracing runes my body, the feel of the bare skin of your chest under my palms... and kisses that set us both on fire.~ DO ~SetGlobal("c-aransex","GLOBAL",2)~ + a3215
  ++ ~[PC] Aran... we have spent so much time together, the only thing we haven't done is... ~  DO ~SetGlobal("c-aransex","GLOBAL",3)~ + a3215
  ++ ~[PC] Aran... I know the touch of you, the feel of all you, and that little strained look you get just before you... ~  DO ~SetGlobal("c-aransex","GLOBAL",4)~ + a3215
  ++ ~[PC] No. I think you have it just the way I want it. Thank the gods for memory lapses.~ + a3214
END
END /* of APPEND */

/* copy for Post */

CHAIN C-ARN25P a3223
~[ARAN] Well now, let me think a bit... our relationship. Put a lad on th' spot, eh?~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranfight","GLOBAL",0)~ THEN ~[ARAN] Currently, we be fightin' mad at eachother, or so it seems.~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You done told me to quit makin' all sorts o' random comments.~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aanoconflict","GLOBAL",0)~ THEN ~[ARAN] You done told me I should be leavin' Anomen alone an' not fightin' wi' him.~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0)~ THEN ~[ARAN] I seem to not have ticked you off to th' point where you drop me for good, eh? I think even be friends. Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1)~ THEN ~[ARAN] I seem to not have ticked you off to th' point where you drop me for good, eh? You done told me no sellsword has th' right to be called "friend". Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",1)~ THEN ~[ARAN] You haven't told me to not try a bit o' sparkin' from time to time. Then again, You done got a huge amount to think about lately. I think we be friends, more's th' pity. Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",0)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. Mayhap I can coax you into a kiss or two someday. Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",1)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. Mayhap I can coax you into more than a kiss or two someday. Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",2)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. Mayhap I can coax you into somethin' more than kissin' an' touchin' someday. Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",3)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. I can rightly say I live for th' times when we get physical wi' eachother. Mayhap someday we will take that final step. Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2) Global("c-aransex","GLOBAL",4)~ THEN ~[ARAN] We might rightly be called 'involved', I think. I am not sure what you get out o' th' deal, but I'm not rightly complainin'. An' I won't never forget spendin' time wi' you all tangled up, explorin' everythin'... why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",3)~ THEN ~[ARAN] I seem to not have ticked you off to th' point where you drop me for good, eh? I think we even be friends. We could have a bit more, but I guess things didn't work out th' way you wanted. Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0)~ THEN ~[ARAN] You haven't told me to bugger off permanent, though you do seem a trifle short wi' me from time to time. Then again, You done got a huge amount to think about lately. I think we be friends. Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",1)~ THEN ~[ARAN] You told me to not try to confuse things by bein' friends, so we be supposed to keep to th' professional side. You command, I follow. Then you pay me. Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You haven't told me to bugger off permanent, though you do seem a trifle short wi' me from time to time. Then again, You done got a huge amount to think about lately. You also let me prattle on an' on about whatever I like, which is blighted nice o' you. I think we be friends. Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You told me to not try to confuse things by bein' friends, so we be supposed to keep to th' professional side. You command, I follow. Then you pay me. You do let me prattle on an' on about whatever I like, which is blighted nice o' you.  Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You haven't told me to bugger off permanent, though you do seem a trifle short wi' me from time to time. Then again, You done got a huge amount to think about lately. You also told me not to talk so much. I think we be friends. Why do you be askin'?~
== C-ARN25P IF ~Gender(Player1,MALE) !HasItemEquiped("belt05",Player1) !Global("c-apcdeclaresellsword","GLOBAL",0) !Global("c-silencearan","GLOBAL",0)~ THEN ~[ARAN] You told me to not try to confuse things by bein' friends, so we be supposed to keep to th' professional side. I also am supposed to keep my blighted mouth shut most o' th' time. You command, I follow. Then you pay me. Why do you be askin'?~
== C-ARN25P IF ~HasItemEquiped("belt05",Player1)~ THEN ~[ARAN] Hey... you know, I be havin' one hells o' a blighted time figurin' out just what I think o' our relationship. I mean, that belt... it confuses me right proper, it do.~
END
++ ~[PC] I was just wondering.~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + ~[PC] Oh, I just thought you might realize that I depend on you as one of my closest friends. I may not treat you exactly the way you would like, but I count on you.~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",0) !HasItemEquiped("belt05",Player1)~ + ~[PC] No sellsword ever has the right to call me "friend".~ DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",1)~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + ~[PC] It is good to know that you know your place.~ EXIT
+ ~Global("c-aranrom","GLOBAL",0) Global("c-apcdeclaresellsword","GLOBAL",1) !HasItemEquiped("belt05",Player1)~ + ~[PC] In your case, I will make an exception. I think we are friends.~ DO ~SetGlobal("c-apcdeclaresellsword","GLOBAL",0)~  EXIT
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think we have headed down the wrong path, Aran. Let's just be friends.~ + a3217
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] I think I am... very interested in you. Romantically speaking.~ DO ~SetGlobal("c-aranrom","GLOBAL",2)~ + a3218
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] I think we could be together, if you were discreet. I have other lovers who are much less forgiving than you. Play by my rules, and we might just see what happens...~ DO ~SetGlobal("c-aranrom","GLOBAL",2)~ + a3220
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] I think I am... interested in you. But I don't like things to move so fast. Perhaps we should be friends, and explore becoming more?~ DO ~SetGlobal("c-aranrom","GLOBAL",1)~ + a3221
+ ~Gender(Player1,FEMALE) !HasItemEquiped("belt05",Player1)~ + ~[PC] I can't believe you have forgotten all of the passion. You are so physical, but you can't remember with whom?~ EXTERN C-ARN25P a3219
+ ~HasItemEquiped("belt05",Player1)~ + ~[PC] Just checking.~ EXIT

APPEND C-ARN25P

IF ~~ a3217
  SAY ~[ARAN] You... fine. You want to be that way, it be your loss. I have more interestin' women to hunt anyways. Ones what appreciate what I can give.~
  = ~[ARAN] You know, I deserve a bit more than to be dumped in th' refuse pit like I was some cast-off toy. You yank me out o' my life an' drag me here... just lookin' to screw wi' my life an' torture me before discardin' me on th' trash heap? Mayhap I be rough an' not th' finest, but I be bloody loyal.~
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",1) SetGlobal("c-aranfight","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~  EXIT
END

IF ~~ a3220
  SAY ~[ARAN] Aye, now... that be a plan I can live with. I might even seal it wi' a kiss, when there be none to see. You will just have to be expectin' th' unexpected.~
  IF ~~ THEN DO ~SetGlobal("c-aranflirtstop","GLOBAL",0) SetGlobal("c-aranrom","GLOBAL",2)~  EXIT
END

IF ~~ a3219
  SAY ~[ARAN] Mayhap I have been knocked on th' head, but I am sure I would remember anythin' to do with you, <CHARNAME>. I... why, what do you know that I don't?~
  ++ ~[PC] You remember it correctly, Aran. I was just teasing you.~ + a3221
  ++ ~[PC] You remember it correctly, Aran. All except... well, I thought we had a few stray glances, and the way your eyes look at me, I think you want more than just a little friendship. Nothing has really happened.~ DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a3221
  ++ ~[PC] Shall I jog your memory, and describe some of the things we have done together?~ + a3222
  ++ ~[PC] No. I think you have it just the way I want it. Thank the gods for memory lapses.~ + a3221
END

IF ~~ a3222
  SAY ~[ARAN] I would love that.~
  ++ ~[PC] You remember it correctly, Aran. I was just teasing you.~ + a3221
  ++ ~[PC] You remember it correctly, Aran. All except the stray glances, whispers, and the way you look at me. It is like you are hungry, but not for food.~ DO ~SetGlobal("c-aransex","GLOBAL",0)~ + a3221
  ++ ~[PC] You remember it correctly, Aran. All except the bold glances, whispered conversations, and some very deep kisses.~ DO ~SetGlobal("c-aransex","GLOBAL",1)~ +  a3218
  ++ ~[PC] You remember it correctly, Aran. All except the stolen whispered conversations, the feel of your fingers tracing runes my body, the feel of the bare skin of your chest under my palms... and kisses that set us both on fire.~ DO ~SetGlobal("c-aransex","GLOBAL",2)~ + a3218
  ++ ~[PC] Aran... we have spent so much time together, the only thing we haven't done is... ~  DO ~SetGlobal("c-aransex","GLOBAL",3)~ + a3218
  ++ ~[PC] Aran... I know the touch of you, the feel of all you, and that little strained look you get just before you... ~  DO ~SetGlobal("c-aransex","GLOBAL",4)~ + a3218
  ++ ~[PC] No. I think you have it just the way I want it. Thank the gods for memory lapses.~ + a3221
END

IF ~~ a3221
  SAY ~[ARAN] Well, you had me off balance, there. I be right happy we both agree. I was worried, mayhap because any time a woman asks about 'relationship status', there be a powerful lot o' pitfalls an' traps a lad can fall into, eh?~
  IF ~~ THEN EXIT
END

IF ~~ a3218
  SAY ~[ARAN] I can stop you right there, with a kiss. I can't rightly forget anythin' about us, but it sure does feel good to hear you speakin' o' us like this. I was just a mite off balance, is all. Mayhap because any time a woman asks about 'relationship status', there be a powerful lot o' pitfalls an' traps a lad can fall into, eh?~
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
~What of the inevitable pain you must cause to the one you love? This man, the one whom you call "Aran".~
== C-ARN25J ~[ARAN] What in Cyric's Blighted Breath do this windbag be talkin' about? You be in control o' th' bloodurges...~
EXTERN HGWRA01 24

/* draw off the romance-triggered sob stories to a new one */
EXTEND_BOTTOM HGWRA01 24
IF ~Global("c-aranrom","GLOBAL",2)~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("C-ACT218")~ EXIT
END

/* start the waterworks */
CHAIN IF ~NumTimesTalkedTo(0)~ THEN C-ARWRTH a2241
~[C-ARWRTH] Aran? Whitehand, light a torch or somethin'. It is as dark as hells here...~ [C-ARW001]
== C-ARN25J ~[ARAN] What in th' nine hells... you be dead an' buried. Someone get me some holy water right quick, eh? You were no good when you was alive, an' I don't rightly want to see you now you be dead.~ [ARAN_SOUND_HERE]
== C-ARWRTH ~[C-ARWRTH] You have come up in th' world. Who is th' wench?~ [C-ARW002]
== C-ARN25J ~[ARAN] Keep a guard on your tongue, bastard.~ [ARAN_SOUND_HERE]
== C-ARWRTH ~[C-ARWRTH] Oho, a new lover? Stedd sees all now, Whitehand. You sorry weakling, you actually think you can keep her? Does she know?~ [C-ARW003]
== C-ARN25J ~[ARAN] Shut your filthy mouth.~ [ARAN_SOUND_HERE]
== C-ARWRTH ~[C-ARWRTH] Hah! She doesn't know! You remember, don't you? Th' smell of flesh burnin', th' screams of th' children...~ [C-ARW004]
== C-ARN25J ~[ARAN] I did what you ordered. Bane Blight your soul, I didn't know.~ [ARAN_SOUND_HERE]
== C-ARWRTH ~[C-ARWRTH] You lie, you piece of dung. You acted so high an' mighty, and then you go blindly followin' without a acre or thought in th' world. Th' blood's on your hands, and those screams will haunt you past death's door. Think you will keep her precious lips close to you now, mercenary?~ [C-ARW005]
== C-ARN25J ~[ARAN] Gods...~ [ARAN_SOUND_HERE]
== C-ARWRTH ~[C-ARWRTH] Murderers all, we happy few. And you with th' weak stomach cryin' like a baby, battin' at the flames while your comrades died. Twice murderous, bastard. Charred flesh was not about to rise, an' we died because you had no stomach for th' collateral damage. Are you cryin' now?~ [C-ARW006]
END
++ ~[PC] Don't say those things to Aran! He did what he had to!~ EXTERN HGWRA01 25
++ ~[PC] I... I knew you had done some difficult things in your past, but you never told me about this, Aran.~ EXTERN C-ARN25J a2239
++ ~[PC] Stop tormenting Aran, spirit! ~ EXTERN HGWRA01 25
++ ~[PC] Gorion, stop this! I won't let this go any further!~ EXTERN HGWRA01 25
+ ~CheckStatGT(Player1,16,WIS)~ + ~[PC] Aran, this isn't real. Don't listen to it!~ EXTERN C-ARN25J a2239


APPEND C-ARN25J

/* ToB FriendTalk 1 : "Sisters" */

IF ~Global("c-aranfriendtob","GLOBAL",1)~ THEN BEGIN a2790
  SAY ~[ARAN] I don't rightly know how you dealt wi' th' feelin's about that bastard takin' that sister o' yours. It be one thing to have things pushed on you, but on family, that be a heavy burden to carry.~
  ++ ~[PC] She... she isn't really my sister by blood. Or, she is, but not by mortal blood, you know.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",1) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ +  a2791
  ++ ~[PC] Sisters, sisters... can't live with them, can't live without them. Don't worry, We set him straight. Or rather, we chopped him into little pieces. Why the deep sibling introspection?.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",2) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ +  a2792
  ++ ~[PC] Sometimes the greater good requires some sacrifices, but where Imoen is concerned, I think less about the big picture and more about making sure she is safe.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",3) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2793
  + ~RandomNum(3,3)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",6) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a3204
  + ~RandomNum(3,2)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",6) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a3205
  + ~RandomNum(3,1)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",6) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a3206
  ++ ~[PC] Stop rehashing old history. Irenicus transgressed, I hit back with everything I had, and now I am here and he no longer has any power at all.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",4) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2794
  ++ ~[PC] There is always more at play than it seems, Aran. I wanted Imoen back, but there was far more to be gained by hunting down Irenicus then simply rescuing my 'sister'.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",5) SetGlobal("c-aranfriendtob","GLOBAL",2) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2795
END

/*

Global("c-ArSisterBranch","GLOBAL",1) = neutral/shy
Global("c-ArSisterBranch","GLOBAL",2) = fun group
Global("c-ArSisterBranch","GLOBAL",3) = fun rigid
Global("c-ArSisterBranch","GLOBAL",4) = strong selfish
Global("c-ArSisterBranch","GLOBAL",5) = smart selfish
Global("c-ArSisterBranch","GLOBAL",6) = talk skipped - "hey, you wanna talk now?"

*/

IF ~~ a2791
  SAY ~[ARAN] Aye, I understand. But you grew up wi' her, and it seems like th' bond is more than many feel for their own true sisters.~
  ++ ~[PC] I thought you had a sister for whom you cared deeply.~ + a2796
  + ~Gender(Player1,MALE)~ + ~[PC] I care for Imoen as a close sister. Given that picture you showed me of your Elena, I think I might... I... oh, never mind.~ + a2796
  + ~Gender(Player1,FEMALE)~ + ~[PC] I feel a bond. Usually it is her tying something around me. Why, do you want me to ask her to... oh, sorry. I should not be saying things like that.~ + a2796
  ++ ~[PC] I feel a bond. A bond, or a burden, or perhaps a small heavy rock in my shoe. But I shouldn't be talking this freely about such matters.~ + a2796
  ++ ~[PC] That is private. But yes, I think so. I mean, I think I have a close bond with Imoen.  Don't you feel close to your sister?~ + a2796
  + ~Gender(Player1,MALE)~ + ~[PC] Sometimes I think about her. I mean, sometimes... look, she is pretty.~ + a2796
  + ~Gender(Player1,FEMALE)~ + ~[PC] I... You don't think about your sister in a strange way, right? I don't. Most times.~ + a2796
  + ~RandomNum(3,3)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ + a3204
  + ~RandomNum(3,2)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ + a3205
  + ~RandomNum(3,1)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ + a3206
END

/* a2792 is a chain */

IF ~~ a2793
  SAY ~[ARAN] I feel th' same way. I mean, I feel th' same way about my sister. I was goin' through some old letters o' Elena's sent on from th' Waterdeep Mage Academy. I guess I get worried I won't be around for to protect her, th' way you did your sister.~
  ++ ~[PC] Are you close to your sister? If that isn't too personal, I mean.~ + a2814
  ++ ~[PC] Helping the greater good also helps your sister.~ + a2815
  ++ ~[PC] I know it is hard to decide which is more important... the people we care about or the common good.~ + a2815
  ++ ~[PC] I sympathize, but I need you to put aside your worries and concentrate on what we are doing.~ + a2816
  ++ ~[PC] Oh, no worries. After all, a sister's primary responsibility is to drive her older siblings crazy. Early on, it is "hide the books" or "tattletale". When they get older, it is "Help, help, I'm captured by an evil mage and spirited away to be tortured". But you still have to go help.~ + a2817
  + ~RandomNum(3,3)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ + a3203
  + ~RandomNum(3,2)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ + a3204
  + ~RandomNum(3,1)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ + a3205
END

IF ~~ a2794
  SAY ~[ARAN] I know, I know. But Imoen reminds me somethin' o my sister Elena, apprenticed away in Waterdeep. An' I find it right hard to avoid thinkin' on how far away from her I am right now, an' how she could get into trouble an' not have her big brother around to protect her.~
  ++ ~[PC] If your sister is strong, she does not need you. If she is weak, then it is better that she learn how to grow strong without you.~ + a2833
  ++ ~[PC] I suppose you are close to your sister. That seems like it would be inconvenient.~ + a2833
  ++ ~[PC] I need concentrated, strong forces to face what I am facing. Do you need to take some time and get your head on straight?~ + a2834
  + ~RandomNum(3,3)~ + ~[PC] This is too personal for me. Just move along, and cut the chatter, Aran.~ + a3203 /* c-aranshutup70 */
  + ~RandomNum(3,2)~ + ~[PC] This is too personal for me. Just move along, and cut the chatter, Aran.~ + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,1)~ + ~[PC] This is too personal for me. Just move along, and cut the chatter, Aran.~ + a3205 /* c-aranshutup72 */
  ++ ~[PC] I need you more than she does. ~ + a2835
  ++ ~[PC] Oh, great. Another delay or distraction. What is it now, a troublesome sister who has been captured and held for ransom?~ + a2836
END

IF ~~ a2795
  SAY ~[ARAN] I figured you might o' been playin' more than one angle there, on account o' you did wander around a bit, doin' all sorts o' things. But Imoen reminds me somethin' o my sister Elena, apprenticed away in Waterdeep. An' I find it right hard to avoid thinkin' on how far away from her I am right now, an' how she could get into trouble an' not have her big brother around to protect her.~
  ++ ~[PC] It seems like a rather personal concern. I am not sure it is a good idea to share feelings that can be used against you.~ + a2841
  ++ ~[PC] It is not always in your best interests to be there for family. Sometimes they need to learn self reliance.~ + a2842
  ++ ~[PC] If you really care for her, let her toughen up and learn how to work things to her advantage using just her own skills.~ + a2842
  ++ ~[PC] What does your sister have to do with me?~ + a2843
  ++ ~[PC] If we are comparing sisters, perhaps we should get some clothing measurements, go out and chat over tea... wait a moment, did you just admit to having a feminine side?~ + a2844
  + ~RandomNum(3,3)~ + ~[PC] Look, we need to move along. I understand you miss your sister. Let's talk about this later.~ + a3203 /* c-aranshutup70 */
  + ~RandomNum(3,2)~ + ~[PC] Look, we need to move along. I understand you miss your sister. Let's talk about this later.~ + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,1)~ + ~[PC] Look, we need to move along. I understand you miss your sister. Let's talk about this later.~ + a3205 /* c-aranshutup72 */
END

IF ~~ a2796
  SAY ~[ARAN] I be a right proud o' Elena, her wi' her Academy apprenticeship, an' all that mage study she writes about in her letters. True enough, I wish I could go see her. She could light up a room with her eyes literal, now, instead o' figuratively.~
  ++ ~[PC] You might miss your sister, but do you... do you think is it more important than what we are doing right now?~ + a2797
  + ~Gender(Player1,MALE)~ + ~[PC] It seems you are a fan. Not that I blame you, or anything. I think I would want to go see her, too, based on that picture. I would, I mean. Not you.~ + a2797
  + ~Gender(Player1,FEMALE)~ + ~[PC] Should I be jealous of her? She is not the only one who might need some help. Don't you think... aren't I facing greater dangers than she is?~ + a2797
  + ~RandomNum(3,3)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ + a3204
  + ~RandomNum(3,2)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ + a3205
  + ~RandomNum(3,1)~ + ~[PC] This is a bit too personal for me right now. Just move along, and cut the chatter, Aran.~ + a3206
  ++ ~[PC] I could say something about you having a big effect on people, too, only with you it is emptying the area with your breath. But that might be rude.~ + a2797
  + ~Gender(Player1,MALE)~ + ~[PC] I think I would be proud of her, too. I know Imoen is strong enough to stand on her own two feet, but perhaps it helps to have a big brother in the background, assisting where he can.~ + a2797
  + ~Gender(Player1,FEMALE)~ + ~[PC] I think you should be proud of her. I know I am proud Imoen is strong enough to stand on her own two feet, and I would like to think I helped in some way.~ + a2797
  ++ ~[PC] So she spits fire from her eyes? I heard that things were strange in Waterdeep, but I... I never actually believed all the stories. Is she in more danger that we are?~ + a2797
END

IF ~~ a2797
  SAY ~[ARAN] I am not sure. I don't expect I have more to worry about than th' usual what happens at Academies. Young lads sniffin' round, stray spells makin' mischief, an' that sort o' thing.~
  ++ ~[PC] Nothing is stopping you from visiting her.~ + a2798
  + ~Gender(Player1,MALE)~ + ~[PC] I might be a lad. I mean, I am a lad. And your sister is very pretty. But I can't go anywhere. Perhaps you should go.~ + a2798
  + ~Gender(Player1,FEMALE)~ + ~[PC] There might be a family connection. I mean, you are.. well, girls seem to like you. And your sister is very pretty. But I can't go anywhere. Perhaps you should go.~ + a2798
  ++ ~[PC] So you don't trust young lads around your sister, I bet... because you think they think like you do!~ + a2798
  ++ ~[PC] Perhaps you should go visit her, just to settle your mind. If you want to, that is. I have to keep moving forward, I think.~ + a2798
  ++ ~[PC] Stray spells and young lads sounds very fun. If I were able to, I might like to visit, and see what people there do. As an observer, you know. Do you want to go check on her?~ + a2798
END

IF ~~ a2798
  SAY ~[ARAN]  I'll not lightly leave your side.~
  ++ ~[PC] That is up to you. I'm not pushing you.~ + a2849
  ++ ~[PC] I am glad of that. Sometimes, I am not sure I know what I would do without you.~ + a2849
  ++ ~[PC] You will not go anywhere lightly, I think. I suspect you have, well... have put on several pounds from all that cooking you do.~ + a2849
  ++ ~[PC] I know. And I would go with you, if I could.~ + a2849
  ++ ~[PC] Oh, you might. I mean, you do seem to like looking at young ladies, and I bet the whole academy is full of temptations.~ + a2849
END

IF ~~ a2808
  SAY ~[ARAN] Why, sure, on account o' you bein' so girly, an' all. I said to myself th' other day, "self, <CHARNAME> would make a right fine little sister, on account o' th' way he always do be actin' all girly."~
  ++ ~[PC] So you really want to be stripped and sent naked into a spider's lair, just so we can steal your gear and move on? I think you are asking for trouble, boyo.~ + a2810
  ++ ~[PC] We could get a song and dance team going, and title ourselves "Faerun's Fighting Females". Gods, did I just say that? What a horrible idea. And dangerous, too.~ + a2810
  ++ ~[PC] Girly, shmirly. I get the job done, in spite of the dangers we face. Liches, dragons, the occasional accidental injury caused by inattentive comrades...~ + a2811
END

IF ~~ a2809
  SAY ~[ARAN] Now, that be completely wrong, I don't rightly think o' you in that way at all.~
  ++ ~[PC] I was teasing you, Aran. I don't think you have as much to worry about as I did, though.~ + a2810
  ++ ~[PC] What a pity. I would make such a good little sister for you. I would have you worrying about all sorts of interesting things, most of whom are poisonous, dangerous, undead, or all three combined.~ + a2810
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] That is a good thing, as I think some of the things we might feel about each other might be considered inappropriate. Wait, that was a poor choice of words...~ + a2810
  + ~Global("c-aranintimate","GLOBAL",0) Global("c-aranrom","GLOBAL",2)~ + ~[PC] That is a good thing, as I think some of the things we might feel about each other might be considered inappropriate. Wait, that was a poor choice of words...~ + a2885
  + ~Global("c-aranintimate","GLOBAL",1) Global("c-aranrom","GLOBAL",2)~ + ~[PC] That is a good thing, as I think some of the things we might feel about each other might be considered inappropriate. Wait, that was a poor choice of words...~ + a2886
  + ~Global("c-aranintimate","GLOBAL",2) Global("c-aranrom","GLOBAL",2)~ + ~[PC] That is a good thing, as I think some of the things we might feel about each other might be considered inappropriate. Wait, that was a poor choice of words...~ + a2887
  + ~Global("c-aranintimate","GLOBAL",3) Global("c-aranrom","GLOBAL",2)~ + ~[PC] That is a good thing, as I think some of the things we might feel about each other might be considered inappropriate. Wait, that was a poor choice of words...~ + a2888
  + ~Global("c-aranintimate","GLOBAL",4) Global("c-aranrom","GLOBAL",2)~ + ~[PC] That is a good thing, as I think some of the things we might feel about each other might be considered inappropriate. Wait, that was a poor choice of words...~ + a2889
END

/* a2810 is a chain */

IF ~~ a2811
  SAY ~[ARAN] Hey, that be unfair! That were an accident, by Helm's Fist. I just didn't' see you there. I done apologized, too! But on th' dangers we face, compared to the usual, well...~
  IF ~~ THEN GOTO a2810
END

/* a2812 is a chain */

/* a2813 is a chain */

IF ~~ a2814
  SAY ~[ARAN] No, not too personal. I think I am right close to her. I write to her often enough.~
  ++ ~[PC] I don't mean to pry into your business. It is just... well, I have a had time balancing what is right, and what is right for Imoen.~ + a2815
  ++ ~[PC] Helping the greater good also helps your sister.~ + a2815
  ++ ~[PC] It sounds like you have found a way to balance both being part of her life and following our cause.~ + a2815
  ++ ~[PC] It sounds like you have found some balance in your life. I am glad, as it helps you be a stronger companion when you have more vested interest in my cause.~ + a2815
  ++ ~[PC] I suppose that would work for some people. Me, I have a hard time being close to a person through a bunch of scratchy ink blots on some vellum.~ + a2818
  + ~RandomNum(3,3)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,2)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,1)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3206 /* c-aranshutup73 */
END

IF ~~ a2815
  SAY ~[ARAN] I don't rightly know if there be a good balance to be had. On th' one hand, protectin' you is protectin' her from some seriously nasty things happenin' to her as well as th' world. On th' other hand, she be my responsibility, directly.~
  ++ ~[PC] Sometimes just being there is not the right decision. Sometimes... sometimes being there puts a sister in more danger.~ + a2819
  ++ ~[PC] I failed to protect Imoen. Irenicus took her and tortured her, and I will never be truly able to atone for that.~ + a2821
  ++ ~[PC] I guess feelings about protecting little sisters are the same everywhere, to some degree. We agree on that.~ + a2820
  ++ ~[PC] We both care about our 'family', whether bonded by the blood of  god, the blood of a normal parent, or just bonded because of our adopted companions.~ + a2820
  ++ ~[PC] If you call having to chase Imoen's captors across the face of Toril while scrounging for coin and resources in the process "protecting", then I don't think that word means what you think it means. ~ + a2821
END

IF ~~ a2816
  SAY ~[ARAN] Do you give naught in th' way o' thinkin' about balancin' th' two sides?~
  ++ ~[PC] I give it thought. But the common good always ends up being the course I try to take.~ + a2815
  ++ ~[PC] Not really. There is doing the right thing, and then after that if there is a way of taking personal feelings into account, I do that, too.~ + a2815
  ++ ~[PC] Think about it? Yes. Actually find a balance? Well, look at the last few months, and you have your answer.~ + a2815
  ++ ~[PC] Fortunately or unfortunately, Imoen is my weak spot. After she is safe, I start thinking about the rest of the world.~ + a2815
  ++ ~[PC] Balancing acts are for circuses. I don't have time to think farther than the next battle, the next challenge, and the next creature trying to rip the flesh from my bones or the spirit from my body.~ + a2815
  + ~RandomNum(3,3)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,2)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3206 /* c-aranshutup73 */
  + ~RandomNum(3,1)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3207 /* c-aranshutup74 */
END

IF ~~ a2817
  SAY ~[ARAN] I can say naught but support for that. I have been on th' receivin' end o' more than my own share o' teasin'. I give as good as I get, though. It be harder now that most o' th' time we speak only through letters.~
  ++ ~[PC] I don't mean to pry into your business. It is just... well, I have a had time balancing what is right, and what is right for Imoen.~ + a2815
  ++ ~[PC] So you communicate with her regularly, and that balances out not living closer to her? ~ + a2815
  ++ ~[PC] It sounds like you have found a way to balance both being part of her life and following our cause.~ + a2815
  ++ ~[PC] It sounds like you have found some balance in your life. I am glad, as it helps you be a stronger companion when you have more vested interest in my cause.~ + a2815
  ++ ~[PC] I suppose that would work for some people. Me, I have a hard time being close to a person through a bunch of scratchy ink blots on some vellum.~ + a2818
  + ~RandomNum(3,3)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3203 /* c-aranshutup70 */
  + ~RandomNum(3,2)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,1)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3205 /* c-aranshutup72 */
END

IF ~~ a2818
  SAY ~[ARAN] Elena an' I have had plenty o' practice at that kind o' communication. I sent her back letters from every place I could get to, an' she has kept in touch wi' me th' same way. Sometimes it is a mite bit o' a delay from th' time we say somethin' to th' time it gets read. It is right hard to keep family ties goin' when everyone has so much physical distance between them.~
  IF ~~ THEN GOTO a2815
END

IF ~~ a2819
  SAY ~[ARAN] On balance, I think th' kinds o' trouble I get into wi' you are th' kinds where if we don't take care o' it right away, Elena will feel th' effects for th' rest o' her life. Or do you be talkin' about Imoen?~
  ++ ~[PC] Imoen.~ + a2821
  ++ ~[PC] I failed to protect Imoen. Irenicus took her and tortured her, and I will never be truly able to atone for that.~ + a2821
  ++ ~[PC] I guess feelings about protecting little sisters are the same everywhere, to some degree. ~ + a2819
  ++ ~[PC] We both care about our 'family', whether bonded by the blood of  god, the blood of a normal parent, or just bonded because of our adopted companions.~ + a2822
  ++ ~[PC] Just how many sisters do you think I have? Wait a moment... OK, let me rephrase. I don't consider Bhaal wandering around sowing his seed all over creation as creating a family. Imoen, on the other hand, is the only real family I have left.~ + a2822
END

IF ~~ a2820
  SAY ~[ARAN] That we do. But there be times when they have to just take care o' themselves, I guess.~
  ++ ~[PC] Sometimes the best way to help is... standing back and letting things happen.~ + a2829
  ++ ~[PC] I don't think standing in the background doing nothing is easy. Sometimes it is all we can do.~ + a2829
  ++ ~[PC] She is your sister. You can't just sit there and ignore your feelings. You have to do something.~ + a2829
  ++ ~[PC] You are worried about your sister. I am worried about the Prophecies currently bathing Faerun in a sea of blood.~ + a2829
  ++ ~[PC] At least the power-hungry arch-villain mage suitor scenario seems unlikely.~ + a2829
END

IF ~~  a2821
  SAY ~[ARAN] Hey, now, by Corellon's Bow-hand, there were naught you could do. He captured you, too, by your account. Th' worry wi' Elena be much less than that kind o' situation. I be worried on account o' lads sniffin' 'round, not on account o' twisted power-mad villains draggin' her off.~
  ++ ~[PC] I think there is always more that I could do. I just don't have the confidence to do it.~ + a2830
  ++ ~[PC] The power-hungry arch-villain mage suitor scenario seems unlikely.~ + a2829
  ++ ~[PC] Just because it is not a power-mad arch enemy does not mean your feelings are unimportant. But listen to what you just said - you are worried about her suitors, not her life being in danger.~ + a2829
  ++ ~[PC] You are worried about your sister. I am worried about the Prophecies currently bathing Faerun in a sea of blood.~ + a2829
  ++ ~[PC] Well, I suppose we could send a warning message to our enemies, letting them know that they should delay taking over all of creation while we check on who your sister is thinking of dating...~ + a2829
  + ~RandomNum(3,3)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,2)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,1)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up the way I did Imoen. Let's talk about this later.~ + a3206 /* c-aranshutup73 */
END

IF ~~ a2822
  SAY ~[ARAN] True enough. Do you ever tell her that?~
  ++ ~[PC] Hells, no.~ + a2823
  ++ ~[PC] Hells, yes. Daily. Or whenever I can.~ + a2824
  ++ ~[PC] I... look, I have some difficulties expressing my feelings sometimes.~ + a2825
  ++ ~[PC] Do you tell your sister that you love her and feel like you need to protect her?~ + a2826
  ++ ~[PC] Imoen knows. I don't have to tell her.~ + a2827
END

IF ~~ a2823
  SAY ~[ARAN] Well, I do. Not Imoen, o' course. I mean I tell Elena.~
  IF ~~ THEN GOTO a2828
END

IF ~~ a2824
  SAY ~[ARAN] I do, too. Not Imoen, o' course. I mean I tell Elena.~
  IF ~~ THEN GOTO a2828
END

IF ~~ a2825
  SAY ~[ARAN] Well, I do. Not Imoen, o' course. I mean I tell Elena. Expressin' those feelin's be easier in a letter, though. Face to face, it just seems kind o' awkward.~
  IF ~~ THEN GOTO a2828
END

IF ~~ a2826
  SAY ~[ARAN] Hells, yes. I do. Not Imoen, o' course. I mean I tell Elena, every single letter.~
  IF ~~ THEN GOTO a2828
END

IF ~~ a2827
  SAY ~[ARAN] I suppose that might be true. But sisters be females, an' it seems to me that it don't hurt none to be right clear about th' whole feelin's thing right up front. She might punch your arm an' get all silly, but it be worth it to make sure she knows how you feel.~
  IF ~~ THEN GOTO a2828
END

IF ~~ a2828
  SAY ~[ARAN] I guess I should not worry about Elena so much. I write to her as often as I be able, an' I tell her every time right specific that I value her. I keep right on it, on account o' Faerun be a hazardous place to make a life, an' backin' you increases th' odds that any one o' those letters might be th' last one. I don't want to be beggin' Tymora for a moment to set things clear wi' her.~
  IF ~~ THEN EXIT
END

IF ~~  a2829
  SAY ~[ARAN] I do think you have a point. I just worry, is all. A brother's prerogative, I guess.~
  ++ ~[PC] I... I can't hold you here, you know. If you needed to go check on her...~ + a2831
  ++ ~[PC] Nothing is stopping you from visiting her.~ + a2831
  ++ ~[PC] You have the right to worry, the right to share that worry with friends, and even the right to go make sure everything is fine yourself.~ + a2831
  ++ ~[PC] Sometimes you have to just let a little sister grow up and handle her own business. You can't let worry harm your readiness.~ + a2828
  ++ ~[PC] I thought it was a brother's prerogative to try and intimidate any potential suitors, to call her childhood nicknames in public, and share embarrassing stories about her until she blushes and threatens violence.~ + a2832
END

IF ~~ a2830
  SAY ~[ARAN] I have confidence in you.~
  ++ ~[PC] That is not enough.~ + a2849
  ++ ~[PC] You are a good friend to say so.~ + a2849
  ++ ~[PC] I don't think confidence has anything to do with how you feel about being away from your sister. I think that might be a matter of trust.~ + a2829
  ++ ~[PC] This isn't about me, or about you. It is about whether you think Elena is any real danger. I don't think she is.~ + a2829
  ++ ~[PC] Are you asking to go up to Waterdeep and see for yourself how she is doing?~ + a2831
END

IF ~~ a2831
  SAY ~[ARAN] I'll not lightly leave your side.~
  ++ ~[PC] That is up to you. I'm not pushing you.~ + a2849
  ++ ~[PC] I appreciate that.~ + a2849
  ++ ~[PC] The world needs people who are ready to put aside personal fears, however small, and just do the right thing. I am glad you are part of the team.~ + a2849
  ++ ~[PC] I need to prevail. There is too much harm that could be done to too many people if I fail. I am glad you are at my side, helping me finish this.~ + a2849
  ++ ~[PC] No, I suppose not... you have been eating way too much of your own cooking for you to do anything 'lightly', my friend!~ + a2849
END

IF ~~ a2832
  SAY ~[ARAN] Aye, that too. Just like it be her perogative to try to fix you up wi' her friends, steal th' best part o' any meal you share, tell you your fashion sense be that o' a troll,  an' generally tease th' livin' hells out o' you at every opportunity.~
  IF ~~ THEN EXIT
END

IF ~~ a2833
  SAY ~[ARAN] That don't rightly track wi' what you did to protect Imoen, now, do it?~
  ++ ~[PC] Imoen was a side issue. Irenicus should not have tried to challenge me in that way.~ + a2838
  ++ ~[PC] I can have the luxury of having family ties, especially as they are divine. You can't.~ + a2838
  ++ ~[PC] That is different. I think you could find much more advantage and protection for your sister if you support me and stay with me. I am a force to be reckoned with.~ + a2849
  ++ ~[PC] No, I don't suppose it does. But you are not a Bhaalspawn. You can't even begin to understand the powers fighting within me, and what i need to do to keep them under my control.~ + a2849
  ++ ~[PC] Look, I know you mean well, but you just don't see the world the way I do. Where you see support and emotion, I see lines of power and control. You have been a strong force at my side, and I need you there until I say otherwise, regardless of what I may choose or not choose to do.~ + a2849
END

IF ~~ a2834
  SAY ~[ARAN] There be naught in th' way o' need for that, I think. I have no word as to any real problems, only my own imagination.~
  ++ ~[PC] You have a big imagination, it seems. I would think you would have cut ties with any family you had, given that you are supporting my cause now.~ + a2833
  + ~RandomNum(3,3)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up. Now shut up and get moving.~ + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,2)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up. Now shut up and get moving.~ + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,1)~ + ~[PC] Look, we need to move along. I understand - you miss your sister, and wish we were able to back her up. Now shut up and get moving.~ + a3206 /* c-aranshutup73 */
  ++ ~[PC] Then wouldn't it be in your best interests to curb that imagination, and get back to business?~ + a2833
  ++ ~[PC] Stop inventing problems that don't exist. We have enough to deal with. Unless you have some proof that something is wrong, let her fight out her own problems.~ + a2833
  ++ ~[PC] Given your imagination, you must think she is being pursued by a maddened curry, several kobold shaman, and a demon from the abyss. Of the three, the demon would make the most powerful choice of mate, I think.~ + a2837
END

IF ~~ a2835
  SAY ~[ARAN] No, you blighted well don't. I am what they call "expendable". But th' sentiment be nice to hear.~
  ++ ~[PC] Stop inventing problems that don't exist. We have enough to deal with. Unless you have some proof that something is wrong, let her fight out her own problems.~ + a2833
  + ~RandomNum(3,3)~ + ~[PC] Look, we need to move along. I understand - now shut up and get moving.~ + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,2)~ + ~[PC] Look, we need to move along. I understand - now shut up and get moving.~ + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,1)~ + ~[PC] Look, we need to move along. I understand - now shut up and get moving.~ + a3206 /* c-aranshutup73 */
  ++ ~[PC] Wouldn't it be in your best interests to curb that imagination, and get back to business? I didn't make you a part of my team so that you could indulge in overprotective sibling behavior.~ + a2833
  ++ ~[PC] I don't deal in sentiment, only raw power. I have invested heavily in you, knowing that you are a very useful tool. You do know that you are beholden to me, right?~ + a2849
  ++ ~[PC] Well, I have a soft spot for you. I can't seem to help myself. By the way, if you desert this party to go of on some family reunion weekend, I will hunt you down and kill you myself.~ + a2849
END

IF ~~ a2836
  SAY ~[ARAN] Now, no call to be so testy, eh? I have naught in th' way o' bad news. I just get a mite protective o' my sister, is all.~
  ++ ~[PC] Why does everyone always seem to need to go rescue some family member from danger, just when things seem to be getting worse than could ever be imagined?~ + a2833
  + ~RandomNum(3,3)~ + ~[PC] I understand - you miss your sister, and wish we were able to back her up. Now shut up and get moving.~ + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,2)~ + ~[PC] I understand - you miss your sister, and wish we were able to back her up. Now shut up and get moving.~ + a3205 /* c-aranshutup72 */
  + ~RandomNum(3,1)~ + ~[PC] I understand - you miss your sister, and wish we were able to back her up. Now shut up and get moving.~ + a3206 /* c-aranshutup73 */
  ++ ~[PC] Stop inventing problems that don't exist. We have enough to deal with. Unless you have some proof that something is wrong, let her fight out her own problems.~ + a2833
  ++ ~[PC] By the way, if you desert this party to go off on some family reunion weekend, I will hunt you down and kill you myself.~ + a2849
END

IF ~~ a2837
  SAY ~[ARAN] Oh, blighted hells.... I try to talk straight to you, an' all you can do is make fun o' me. Stick your left fist where th' sun don't shine. I'll just go blighted well check on th' gear.~
  ++ ~[PC] Don't sulk too long. We have places to go and things to kill.~ + a2849
  ++ ~[PC] You will not get away with swearing at me without repercussions, sellsword. I settle up with those who show me disrespect.~ + a2849
  ++ ~[PC] You are so touchy today. Get some sleep tonight, and get a better attitude, or your time with me will come to a very short end.~ + a2849
  ++ ~[PC] I am in no mood for talking about family problems. I have enough of my own right now.~ + a2849
  ++ ~[PC] I am sorry you feel like you have been wronged. Now check that gear and get back to work. This is no time for sentimentality and deep discussion.~ + a2849
  ++ ~[PC] You follow me, but you don't really embrace the power and control I exert. I would think you would be against me, trying to stop my rise to power, to protect her from coming under my control.~ + a2840
END

IF ~~ a2838
  SAY ~[ARAN] Well, I suspect I have naught in th' way o' grand villains capturin' her an' runnin' off th' god's only knows where. Th' worst might be a lad what be a little too amorous for his own good.~
  ++ ~[PC] Nothing is stopping you from visiting her.~ + a2839
  ++ ~[PC] Perhaps it might be advantageous to have some eyes and ears in Waterdeep, after all. I am going ahead with my plans, but you might take a quick trip north if you need to.~ + a2839
  ++ ~[PC] I need concentrated, strong forces to face what I am facing. Do you need to take some time and get your head on straight?~ + a2834
  ++ ~[PC] I am not going to travel all the way up to Waterdeep.~ + a2839
  ++ ~[PC] You follow me, but you don't really embrace the power and control I exert. I would think you would be against me, trying to stop my rise to power, to protect her from coming under my control.~ + a2840
END

IF ~~ a2839
  SAY ~[ARAN] I'll not lightly leave your side.~
  ++ ~[PC] That is up to you. I'm not pushing you~ + a2849
  ++ ~[PC] You are damned right you won't. I don't take kindly to betrayal or wavering of any kind.~ + a2849
  ++ ~[PC] Sure, you go right along and visit your sister. I will just sit here and wait for you, delaying all my plans... you do know that I could never let that happen, right?~ + a2849
  ++ ~[PC] Look, I don't understand your position at all. But you have been useful to me, so if you have to go play nursemaid, I won't stop you or exact retribution. If you go, you had better make it a quick trip. Things look like I may need you soon.~ + a2849
  ++ ~[PC] Lightly is not an adjective I would use to describe anything about you, Aran. Too much curry lately? Your sword belt seems excessively tight...~ + a2837
END

IF ~~ a2840
  SAY ~[ARAN] You may not think th' way I do, but I cast my lot in wi' you. I can be a damned strong ally, an' that might protect Elena. Hells, look at it this way... th' way things be goin' on th' Sword Coast, I'd rather be backin' you an' seekin' your protection than followin' any o' th' bastards what be our opponents. You, I can talk to.~
  ++ ~[PC] I don't need allies. I need servants.~ + a2849
  ++ ~[PC] Serve me well, and you have nothing to fear.~ + a2849
  ++ ~[PC] I appreciate and reward loyalty and trust, however misguided it is.~ + a2849
  ++ ~[PC] I don't know if it is a weakness or a strength, but at least I know I have one person I can trust to be predictable - you.~ + a2849
  ++ ~[PC] I will keep that in mind. I do have a reputation for doing whatever I want, though... something perhaps you should keep in mind.~ + a2849
END

IF ~~ a2841
  SAY ~[ARAN] Hey, I trust you, don't I? Well, to a point, anyways.~
  ++ ~[PC] You are a fool to trust me. I never did understand that about you. You don't see things my way, yet you follow me. Are you that weak?~ + a2840
  ++ ~[PC] And I trust you. At least, I trust you more than I usually trust someone. I guess that counts as friendship. I can't afford to have many friends.~ + a2849
  ++ ~[PC] Trust is a silly idea, unless it is backed up with coercion or force to ensure that it can't be broken. I bet that is why you are worried about your sister. You don't trust her because you have no control over her.~ + a2845
  ++ ~[PC] I don't give trust lightly, and usually it ends when someone is out of my sight. I... I just have been harmed so many times.~ + a2845
  ++ ~[PC] At the very least, I am predictable. So are you. Perhaps that is why we work well together, in spite of your silly soft ideas.~ + a2845
END

IF ~~ a2842
  SAY ~[ARAN] That don't rightly track wi' what you did to protect Imoen, now, do it?~
  ++ ~[PC] Perhaps I have a weak spot for her. More likely, I could find advantage in the circumstances surrounding her abduction.~ + a2845
  ++ ~[PC] That is my concern, not yours. I am not sure it is a good idea for anyone to share feelings that can be used against them later.~ + a2841
  ++ ~[PC] It is not always in your best interests to be there for family. Sometimes they need to learn self reliance.~ + a2842
  ++ ~[PC] If you really care for her, let her toughen up and learn how to work things to her advantage using just her own skills.~ + a2842
  ++ ~[PC] What does your sister have to do with me?~ + a2843
  ++ ~[PC] If we are comparing sisters, perhaps we should get some clothing measurements, go out and chat over tea... wait a moment, did you just admit to having a feminine side?~ + a2844
  + ~RandomNum(3,3)~ + ~[PC] It is in both our interests to keep family out of our discussions. Just be glad you don't have a god's blood running through your family veins, and shut the hells up about your sister already.~ + a3203 /* c-aranshutup70 */
  + ~RandomNum(3,2)~ + ~[PC] It is in both our interests to keep family out of our discussions. Just be glad you don't have a god's blood running through your family veins, and shut the hells up about your sister already.~ + a3204 /* c-aranshutup71 */
  + ~RandomNum(3,1)~ + ~[PC] It is in both our interests to keep family out of our discussions. Just be glad you don't have a god's blood running through your family veins, and shut the hells up about your sister already.~ + a3205 /* c-aranshutup72 */
END

IF ~~ a2843
  SAY ~[ARAN] Th' world don't rightly revolve around you, do it?~
  ++ ~[PC] Actually, it does.~ + a2845
  ++ ~[PC] It should, but it doesn't seem to. If you need to go make sure your sister is not in any danger, you could just go, I suppose.~ + a2846
  ++ ~[PC] There is no presing need to deal with family issues while the entire face of Faerun descends into war.~ + a2847
  ++ ~[PC] You know, you follow me, but you don't really embrace the power and control I exert. I would think you would be against me, trying to stop my rise to power, to protect her from coming under my control.~ + a2840
  ++ ~[PC] Alas, my one weakness... modesty.~ + a2848
END

IF ~~ a2844
  SAY ~[ARAN] I don't rightly admit naught in th' way o' such a thing. Besides, we be talkin' about our sisters, not discussin' teatime.~
  ++ ~[PC] Actually, the only really important part of our discussion is how it impacts my plans.~ + a2845
  ++ ~[PC] Sisters and tea have little to do with my plans. If you feel strongly about how your sister is faring, you might visit her.~ + a2846
  ++ ~[PC] There is no presing need to deal with family issues while the entire face of Faerun descends into war.~ + a2847
  ++ ~[PC] You know, you follow me, but you don't really embrace the power and control I exert. I would think you would be against me, trying to stop my rise to power, to protect her from coming under my control.~ + a2840
  ++ ~[PC] Imoen might be my one weakness. Well, either that, or putting up with you.~ + a2848
END

IF ~~ a2845
  SAY ~[ARAN] I don't think like you do, somehow. Not outside o' combat, I don't. I suspect that be part o' why I never could gather th' skills to hold a group together on my own leadership.~
  ++ ~[PC] Look, if it bothers you, nothing is stopping you from visiting her.~ + a2846
  ++ ~[PC] Worrying about family is the first thing you need to forget if you are ever going to be a leader, Aran. You need to learn to make the tough decisions, and not let emotion cloud your better judgement.~ + a2847
  ++ ~[PC] To be fair, there are people who think like you do who are very effective leaders. I don't understand how they do it without coercion, fear, manipulation, or showing power, but they do. You just must not have it in you to lead.~ + a2840
  ++ ~[PC] You don't need to think like me. In fact, that is why I keep you around. I want someone who supports me, not someone who constantly challenges me. Perhaps that is one of my weaknesses.~ + a2848
  ++ ~[PC] Do you need time to get this out of your system, so that we can get on with my business?~ + a2846
END

IF ~~ a2846
  SAY ~[ARAN] I'll not lightly leave your side.~
  ++ ~[PC] That is up to you. I'm not pushing you.~ + a2849
  ++ ~[PC] You are damned right you won't. I don't take kindly to betrayal or wavering of any kind, and you know that leaving me at this point would be the worst kind of betrayal. I don't let many people in on my plans.~ + a2849
  ++ ~[PC] Sure, you go right along and visit your sister. I will just sit here and wait for you, delaying all my plans... you do know that I could never let that happen, right?~ + a2849
  ++ ~[PC] Look, sometimes I don't understand you at all. But you have been useful to me, so if you have to go play nursemaid, I won't stop you or exact retribution. If you go, you had better make it a quick trip, though. Things look like I may need you soon.~ + a2849
  ++ ~[PC] Lightly is not an adjective I would use to describe anything about you, Aran. Too much curry lately? Your sword belt seems excessively tight...~ + a2837
END

IF ~~ a2847
  SAY ~[ARAN] Do this be one o' them "do as I be sayin' not as I be doin'" things? On account o'you seemed to deal wi' Imoen in a completely different way from what you be describin'.~
  ++ ~[PC] Do not discuss Imoen again, or I will show you exactly how much you have displeased me.~ + a2846
  ++ ~[PC] Yes, it is one of those things. If you don't like my advice, you can leave any time you think you need to... and suffer the consequences.~ + a2846
  ++ ~[PC] Let's just say that I needed to relearn that particular lesson myself. I am as close to perfect as a mortal can get, but even I can learn something from time to time.~ + a2849
  ++ ~[PC] I have a certain weakness for her. I am not proud of it, but I acknowledge it. And I take steps to ensure she can not be used against my interests again.~ + a2848
  ++ ~[PC] Do you need time to get this out of your system, so that we can get on with my business?~ + a2846
END

IF ~~ a2848
  SAY ~[ARAN] You don't have any blighted weaknesses. I don't like th' way you do things sometimes, but I can't say you haven't made defeats into victories an' kept us alive, mostly.~
  ++ ~[PC] Flattery will not get you what you want, Aran, if what you want is for me to give you permission to go all the way up to Waterdeep so you can have a family reunion.~ + a2846
  ++ ~[PC] I have a huge weakness. I let you distract me with all this talk about family. Don't you know it really drives me crazy?~ + a2849
  ++ ~[PC] I may not seem to at times, but I have a huge weakness. I let my friends into my plans, and help them as well as I help myself. Some would call that a waste of time. I consider it good business.~ + a2849
  ++ ~[PC] A good acknowledgement of one's weaknesses makes one stronger. Perhaps you need some time to reflect on that.~ +  a2846
END

IF ~~ a2849
  SAY ~[ARAN] I know.~
  IF ~~ THEN EXIT
END

END /* of append to C-ARN25J */

CHAIN ~C-ARN25J~ a2792
~[ARAN] I was goin' through some old letters o' Elena... you know, my sister what be in th' Waterdeep Mage Academy? I guess I get worried I won't be around for to protect her, th' way you did your sister.~
== BKORGA25 IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~[KORGAN] You dinna tell me you had a sister.~
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN ~[HAERDALIS] Writing, journaling, tender sibling communications drawing a web of gossamer conversation across the miles... missives flying back and forth, and yet you do not introduce me, or send my warmest regards.~
== C-ARN25J IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~[ARAN] Can you blighted well blame me, you lecherous shortaxe?~
== C-ARN25J IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN ~[ARAN] As for introducin' a smooth talkin' amorous bard, I have my own reasons for delayin' that eventuality.~
== BKORGA25 IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~[KORGAN] Aye. When a buxom wench finds me attractive, there is no stopping me.~
== BHAERD25 IF ~InParty("HaerDalis") InMyArea("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN ~[HAERDALIS] Alas, this poor sparrow finds truth in your words, my friend. But think of how much she could have learned, under my gentle protective wing...~
== BCERND25 IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~[CERND] There are times to be protective of your family, and times when you are unable to be there when you are needed most. Nature is not always kind.~
== BJAN25 IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN ~[JAN] None of my family writes to me. I think it has to do with the last set of letters I replied to being sent with my latest invention, a new form of self-erasing ink. It seems to have caught itself on fire. Perhaps when Uncle Harald's fingers are healed, he will write to me again.~
END
++ ~[PC] I was not around for Imoen, and it turned out alright. I had to chase an insane mage across the entire Sword Coast and beyond just to find her, but we could do the same for yours, if necessary.~ + a2810
+ ~Gender(Player1,MALE)~ + ~[PC] You seem to be protective of me, too. I wonder if you see me as a little sister. It would explain so much...~ + a2808
+ ~Gender(Player1,FEMALE)~ + ~[PC] You seem to be protective of me, too. I wonder if you see me as a little sister. It would explain so much...~ + a2809
++ ~[PC] Well, I worry about that, too, with the number of times you seem to need to be healed. You could try actually dodging a blow or two, you know.~ + a2810
++ ~[PC] Families are strange that way. We try to be there when we can, and worry when we can't.~ + a2810
++ ~[PC] I have a great idea... we swing north, pick her up, and start a small theater troupe. We can call it "Whitehand's Weird World". Or do you think that might interfere with the whole Prophecy thing? I suppose it would.~ + a2810


CHAIN ~C-ARN25J~ a2810
~[ARAN] True enough. Th' worry wi' Elena be more on account o' lads sniffin' 'round than overbearin' evil twisted villainous mages... wait a moment... that blighted Mage's Academy be probably chock full o' power-hungry lads wi' slippery morals...~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] You have a very large imagination, Aran. Then again, you are probably thinking that her peers are as earthy as you are.~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] Oh, I am sure everything is fine. There are many ways a woman mage has to protect herself.~
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN ~[VICONIA] Surfacers always say such amusing things. The least of our Houses would easily best a Surfacer academy. Your sister sounds weak.~
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~[VALYGAR] Another child warped by the unnatural influence of magic. Perhaps you should forbid her attendance, and get her away from that corruption.~
END
++ ~[PC] I don't think it is likely that they would become another Irenicus.~ + a2812
++ ~[PC] Just a little overprotective, aren't you? How cute. Has she seen twelve summers yet, or only nine?~ + a2812
++ ~[PC] I hadn't realized she was in need of such intense protectiveness. I should have realized that apples don't fall far from trees, and since you both fell from the same tree... come on, Aran. She is a grown woman.~ + a2812
++ ~[PC] I think the Academy is far safer a place for her than on the road with you, don't you? I understand your worry, but you would be far more distracted if you were trying to do your job and protect her at the same time.~ + a2812
++ ~[PC] If she is anything like you, I would be more worried about the virtues of the poor boys trying to court her.~ + a2812

CHAIN ~C-ARN25J~ a2812
~[ARAN] You do have a point there. I just let my imagination get th' better o' me, is all.~
== BANOME25 IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~[ANOMEN] Your lack of discipline and coarse breeding triumphs again.~
== BKELDO25 IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~[KELDORN] Imagination is a useful trait in a warrior, but it can lead you astray very quickly.~
== BMAZZY25 IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~[MAZZY] I think we should go and check on how she is doing.~
END
++ ~[PC] Nothing is stopping you from visiting her.~ + a2813
++ ~[PC] Having an imagination is a good thing. We could always set aside a little time, go north, and hang around the Academy for awhile, seeing the sights... but I probably should stay here.~ + a2813
++ ~[PC] No, no... you are probably right. You should get there, before she ends up... oh, the horrors... *kissing* some *boy*. Even worse, having fun! Go, flex that incredible Whitehand command of Common.~ + a2813
++ ~[PC] If you feel that she is in danger, you should go. Family is family.~ + a2813
++ ~[PC] You are a good person to have around, Aran. Then again, your sister is probably a lot smarter than you. Perhaps you could switch places with her. I think we can find a polymorph spell someplace...~ + a2813

CHAIN ~C-ARN25J~ a2813
~[ARAN] I'll not lightly leave your side.~
== BEDWIN25 IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN ~[EDWIN] Go, go, by all means, go.~
== BMINSC25 IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN ~[MINSC] No, Aran, we are you and and me and Boo, Boo and you and me... we should go together!~
END
++ ~[PC] That is up to you. I'm not pushing you.~ + a2849
++ ~[PC] I am very glad to have you on my side.~ + a2849
++ ~[PC] Awww... just what I always wanted. A pack mule with a sense of honor and camaraderie! For that, I will give you a carrot. But I do appreciate it, you know.~ + a2849
++ ~[PC] I am glad you are on my team, Aran. Even if it means more burning hot curry and that incessant whistling.~ + a2849
+ ~Gender(Player1,FEMALE) Global("c-aranrom","GLOBAL",2)~ + ~[PC] Just my side? I am pretty sure you wouldn't likely leave any part of me, judging by the amount of time your hands spend checking that all my body parts are still intact.~ + a2849
+ ~Gender(Player1,FEMALE) !Global("c-aranrom","GLOBAL",2)~ + ~[PC] Lightly, heavily, modestly, boldly... you could just say "I won't leave you alone because I like you", you know.~ + a2849
+ ~Gender(Player1,MALE)~ + ~[PC] Besides, we could all head up there together, and you could introduce me to your sister. Does she like pretty silk underthings? I am quite the ladies man, you know.~ + a2849

CHAIN ~C-ARN25J~ a2885 /* no touching; hint */
~[ARAN] Well, now, that be a good line o' thought to pursue. Th' touchin', that is, not you bein' my little sister, or anythin'...~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] Have I described to you the definition and usage of the word 'subtle' to you yet, Aran?~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] Why is Aran blushing?~
== C-ARN25J ~[ARAN] Th' worry wi' Elena be more on account o' lads sniffin' 'round than overbearin' evil twisted villainous mages... wait a moment... that blighted Mage's Academy be probably chock full o' power-hungry lads wi' slippery morals...~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] You have a very large imagination, Aran. Then again, you are probably thinking that her peers are as earthy as you are.~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] Oh, I am sure everything is fine. There are many ways a woman mage has to protect herself.~
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN ~[VICONIA] Surfacers always say such amusing things. The least of our Houses would easily best a Surfacer academy. Your sister sounds weak.~
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~[VALYGAR] Another child warped by the unnatural influence of magic. Perhaps you should forbid her attendance, and get her away from that corruption.~
END
++ ~[PC] I don't think it is likely that they would become another Irenicus.~ + a2812
++ ~[PC] Just a little overprotective, aren't you? How cute. Has she seen twelve summers yet, or only nine?~ + a2812
++ ~[PC] I hadn't realized she was in need of such intense protectiveness. I should have realized that apples don't fall far from trees, and since you both fell from the same tree... come on, Aran. She is a grown woman.~ + a2812
++ ~[PC] I think the Academy is far safer a place for her than on the road with you, don't you? I understand your worry, but you would be far more distracted if you were trying to do your job and protect her at the same time.~ + a2812
++ ~[PC] If she is anything like you, I would be more worried about the virtues of the poor boys trying to court her.~ + a2812

CHAIN ~C-ARN25J~ a2886 /* kissing */
~[ARAN] Well, now, that be a good line o' thought to pursue. Th' touchin', that is, not you bein' my little sister, or anythin'... I think that kissin' you feels nothin' like kissin' a sister.~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] Have I described to you the definition and usage of the word 'subtle' to you yet, Aran?~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] Why is Aran blushing?~
== C-ARN25J ~[ARAN] Th' worry wi' Elena be more on account o' lads sniffin' 'round than overbearin' evil twisted villainous mages... wait a moment... that blighted Mage's Academy be probably chock full o' power-hungry lads wi' slippery morals...~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] You have a very large imagination, Aran. Then again, you are probably thinking that her peers are as earthy as you are.~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] Oh, I am sure everything is fine. There are many ways a woman mage has to protect herself.~
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN ~[VICONIA] Surfacers always say such amusing things. The least of our Houses would easily best a Surfacer academy. Your sister sounds weak.~
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~[VALYGAR] Another child warped by the unnatural influence of magic. Perhaps you should forbid her attendance, and get her away from that corruption.~
END
++ ~[PC] I don't think it is likely that they would become another Irenicus.~ + a2812
++ ~[PC] Just a little overprotective, aren't you? How cute. Has she seen twelve summers yet, or only nine?~ + a2812
++ ~[PC] I hadn't realized she was in need of such intense protectiveness. I should have realized that apples don't fall far from trees, and since you both fell from the same tree... come on, Aran. She is a grown woman.~ + a2812
++ ~[PC] I think the Academy is far safer a place for her than on the road with you, don't you? I understand your worry, but you would be far more distracted if you were trying to do your job and protect her at the same time.~ + a2812
++ ~[PC] If she is anything like you, I would be more worried about the virtues of the poor boys trying to court her.~ + a2812

CHAIN ~C-ARN25J~ a2887 /* touching */
~[ARAN] Well, now, we done pursued some o' that thought together already, eh? Th' touchin', that is, not you bein' my little sister, or anythin'...~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] Have I described to you the definition and usage of the word 'subtle' to you yet, Aran? You are displaying early signs of mating rituals, and this is not the time or place for such behavior.~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] Why is Aran blushing?~
== C-ARN25J ~[ARAN] Th' worry wi' Elena be more on account o' lads sniffin' 'round than overbearin' evil twisted villainous mages... wait a moment... that blighted Mage's Academy be probably chock full o' power-hungry lads wi' slippery morals...~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] You have a very large imagination, Aran. Then again, you are probably thinking that her peers are as earthy as you are.~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] Oh, I am sure everything is fine. There are many ways a woman mage has to protect herself.~
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN ~[VICONIA] Surfacers always say such amusing things. The least of our Houses would easily best a Surfacer academy. Your sister sounds weak.~
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~[VALYGAR] Another child warped by the unnatural influence of magic. Perhaps you should forbid her attendance, and get her away from that corruption.~
END
++ ~[PC] I don't think it is likely that they would become another Irenicus.~ + a2812
++ ~[PC] Just a little overprotective, aren't you? How cute. Has she seen twelve summers yet, or only nine?~ + a2812
++ ~[PC] I hadn't realized she was in need of such intense protectiveness. I should have realized that apples don't fall far from trees, and since you both fell from the same tree... come on, Aran. She is a grown woman.~ + a2812
++ ~[PC] I think the Academy is far safer a place for her than on the road with you, don't you? I understand your worry, but you would be far more distracted if you were trying to do your job and protect her at the same time.~ + a2812
++ ~[PC] If she is anything like you, I would be more worried about the virtues of the poor boys trying to court her.~ + a2812


CHAIN ~C-ARN25J~ a2888 /* petting */
~[ARAN] Well, now, that be a good line o' thought to pursue. If I do recollect, we have done our share o' exlorin' that topic, too. Th' touchin', that is, not you bein' my little sister, or anythin'...~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] Have I described to you the definition and usage of the word 'subtle' to you yet, Aran? There is little chance of keeping your privacy when you are constantly so bold.~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] I... I am not sure we should be hearing all of this.~
== C-ARN25J ~[ARAN] No, no... this got all sidetracked already. Look, th' worry wi' Elena be more on account o' lads sniffin' 'round than overbearin' evil twisted villainous mages... wait a moment... that blighted Mage's Academy be probably chock full o' power-hungry lads wi' slippery morals...~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] You have a very large imagination, Aran. Then again, you are probably thinking that her peers are as earthy as you are.~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] Oh, I am sure everything is fine. There are many ways a woman mage has to protect herself.~
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN ~[VICONIA] Surfacers always say such amusing things. The least of our Houses would easily best a Surfacer academy. Your sister sounds weak.~
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~[VALYGAR] Another child warped by the unnatural influence of magic. Perhaps you should forbid her attendance, and get her away from that corruption.~
END
++ ~[PC] I don't think it is likely that they would become another Irenicus.~ + a2812
++ ~[PC] Just a little overprotective, aren't you? How cute. Has she seen twelve summers yet, or only nine?~ + a2812
++ ~[PC] I hadn't realized she was in need of such intense protectiveness. I should have realized that apples don't fall far from trees, and since you both fell from the same tree... come on, Aran. She is a grown woman.~ + a2812
++ ~[PC] I think the Academy is far safer a place for her than on the road with you, don't you? I understand your worry, but you would be far more distracted if you were trying to do your job and protect her at the same time.~ + a2812
++ ~[PC] If she is anything like you, I would be more worried about the virtues of the poor boys trying to court her.~ + a2812

CHAIN ~C-ARN25J~ a2889 /* sex */
~[ARAN] Well, now, that came out right fine in my hearin'. I do seem to have some troubles wi' not constantly touchin' you whenever I can find a way to.~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] Have I described to you the definition and usage of the word 'subtle' to you yet, Aran? There is little chance of keeping your privacy when you are constantly so bold.~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] I... I am not sure we should be hearing all of this.~
== C-ARN25J ~[ARAN] No, no... this got all sidetracked already. Look, th' worry wi' Elena be more on account o' lads sniffin' 'round than overbearin' evil twisted villainous mages... wait a moment... that blighted Mage's Academy be probably chock full o' power-hungry lads wi' slippery morals...~
== BJAHEI25 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~[JAHEIRA] You have a very large imagination, Aran. Then again, you are probably thinking that her peers are as earthy as you are.~
== BAERIE25 IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~[AERIE] Oh, I am sure everything is fine. There are many ways a woman mage has to protect herself.~
== BVICON25 IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN ~[VICONIA] Surfacers always say such amusing things. The least of our Houses would easily best a Surfacer academy. Your sister sounds weak.~
== BVALYG25 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~[VALYGAR] Another child warped by the unnatural influence of magic. Perhaps you should forbid her attendance, and get her away from that corruption.~
END
++ ~[PC] I don't think it is likely that they would become another Irenicus.~ + a2812
++ ~[PC] Just a little overprotective, aren't you? How cute. Has she seen twelve summers yet, or only nine?~ + a2812
++ ~[PC] I hadn't realized she was in need of such intense protectiveness. I should have realized that apples don't fall far from trees, and since you both fell from the same tree... come on, Aran. She is a grown woman.~ + a2812
++ ~[PC] I think the Academy is far safer a place for her than on the road with you, don't you? I understand your worry, but you would be far more distracted if you were trying to do your job and protect her at the same time.~ + a2812
++ ~[PC] If she is anything like you, I would be more worried about the virtues of the poor boys trying to court her.~ + a2812



/* ToB FriendTalk 2 : "  ", GOES_RIGHT_HERE */

APPEND C-ARN25J

/* ToB FriendTalk 3 : "Sisters Redux", 6 "pathway" talks, only 1 fires */
IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",1)~ THEN BEGIN a2850  /* neutral/shy */
  SAY ~[ARAN] I be havin' a right hard time keepin' my mind off o' th' sisters. Yours an' mine, I mean.~
  + ~Gender(Player1,MALE)~ + ~[PC] Is there something wrong with me?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2856
  + ~Gender(Player1,FEMALE)~ + ~[PC] Is there something wrong with me?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2857
  ++ ~[PC] What are you thinking about now?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2858
  ++ ~[PC] I think you have been thinking about the past too much.~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2859
  ++ ~[PC] Another letter? How do you get mail service around here?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2874
END

IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",2)~ THEN BEGIN a2851 /* fun group */
  SAY ~[ARAN] I be havin' a right hard time keepin' my mind off o' th' sisters. Yours an' mine, I mean.~
  ++ ~[PC] You seem particularly fascinated with the whole 'sister' topic. Is there something I should be aware of?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2859
  ++ ~[PC] ~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2860
  ++ ~[PC] ~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2861
  ++ ~[PC] Another letter? How do you get mail service around here?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2874
END

IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",3)~ THEN BEGIN a2852 /* rigid */
  SAY ~[ARAN] I be havin' a right hard time keepin' my mind off o' th' sisters. Yours an' mine, I mean.~
  ++ ~[PC] If this is a prelude to asking me about Imoen's relationship status so that you can flirt with her, don't bother.~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2862
  ++ ~[PC] ~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2863
  ++ ~[PC] ~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2864
  ++ ~[PC] Another letter? How do you get mail service around here?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2874
END

IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",4)~ THEN BEGIN a2853 /* strong selfish */
  SAY ~[ARAN] I be havin' a right hard time keepin' my mind off o' th' sisters. Yours an' mine, I mean.~
  ++ ~[PC] You know, I would rather you talk about something much more interesting, like perhaps... me.~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2865
  ++ ~[PC] ~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2866
  ++ ~[PC] ~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2867
  ++ ~[PC] Another letter? How do you get mail service around here?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2874
END

IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",5)~ THEN BEGIN a2854 /* smart selfish */
  SAY ~[ARAN] I be havin' a right hard time keepin' my mind off o' th' sisters. Yours an' mine, I mean.~
  ++ ~[PC] Now, why are you talking about sisters again? I am a much more fascinating topic of conversation.~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2868
  ++ ~[PC] ~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2869
  ++ ~[PC] ~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2870
  ++ ~[PC] Another letter? How do you get mail service around here?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2874
END

IF ~Global("c-aranfriendtob","GLOBAL",5) Global("c-ArSisterBranch","GLOBAL",6)~ THEN BEGIN a2855 /* talk skipped - "hey, you wanna talk now?" */
  SAY ~[ARAN] I be havin' a right hard time keepin' my mind off o' th' sisters. Yours an' mine, I mean.~
  ++ ~[PC] Why are you pressing this? Do you have feelings for Imoen or something?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2871
  ++ ~[PC] I thought I made it clear last time that I was not interested in discussing Imoen, or Elena.~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2872
  ++ ~[PC] What are you so worried about?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2873
  ++ ~[PC] Another letter? How do you get mail service around here?~ DO ~SetGlobal("c-aranfriendtob","GLOBAL",6) RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",ARAN_FTT)~ + a2874
END

IF ~~ a2856
  SAY ~[ARAN] No, there be naught wrong wi' you. What brought that on?~
  ++ ~[PC] I am a little confused. I know that I am not always the center of the conversation, but usually men don't talk with other men about their sisters.~ + c-tobplaceholder /* PLACEHOLDER */
  ++ ~[PC] PLACEHOLDER ~ + c-tobplaceholder /* PLACEHOLDER */
END

IF ~~ a2857
  SAY ~[ARAN] No, there be naught wrong wi' you. What brought that on?~
  + ~!Global("c-aranrom","GLOBAL",2)~ + ~[PC] I am a little confused. I know that I am not always the center of the conversation, but usually men don't talk with a lady about their sisters, unless they are asking about courting her.~ + c-tobplaceholder /* PLACEHOLDER */
  + ~Global("c-aranrom","GLOBAL",2)~ + ~[PC] I am a little confused. We... we are involved, aren't we? Usually men don't talk with a lady about their sisters, unless they are asking about courting her.~ + c-tobplaceholder /* PLACEHOLDER */
END

IF ~~ a2858
  SAY ~[ARAN] Oh, nothin' much. Just th' whole set o' Bhaalspawn tryin' to take power makes me wonder if they have any family feelin's at all. Wholesale slaughter o' innocents seems like it be born o' not havin' a sister around to keep you straight.~
  ++ ~[PC] You don't know how much of a blessing having a god's blood course through your veins can be. It frees me from the need to care about lesser things, like family or friendship, and concentrate on the important things like gaining power.~ + c-tobplaceholder /* PLACEHOLDER */
  ++ ~[PC] Are you talking about me?~ + c-tobplaceholder /* PLACEHOLDER */
  ++ ~[PC] You don't know how much of a curse having a god's blood course through your veins can be. It is a constant struggle, and one mistake can turn every friend you ever had into an enemy. No Bhaalspawn has an easy childhood.~ + c-tobplaceholder /* PLACEHOLDER */
  ++ ~[PC] I was lucky. Imoen kept me grounded, even if we were not really siblings. At least, back when we did not realize we were related in any way.~ + c-tobplaceholder /* PLACEHOLDER */
  ++ ~[PC] I never really had that close a relationship with Imoen.~ + c-tobplaceholder /* PLACEHOLDER */
END

IF ~~ a2859
  SAY ~[ARAN] Oh, I think th' amount o' death an' destruction around right now be makin' me a mite nostalgic for happier times. You must be thinkin' somethin' similar, eh?~
END

IF ~~ a2860
 SAY ~PLACEHOLDER~
 IF ~~ THEN EXIT
END

IF ~~ a2861
 SAY ~PLACEHOLDER~
 IF ~~ THEN EXIT
END

IF ~~ a2862
 SAY ~PLACEHOLDER~
 IF ~~ THEN EXIT
END

IF ~~ a2863
 SAY ~PLACEHOLDER~
 IF ~~ THEN EXIT
END

IF ~~ a2864
 SAY ~PLACEHOLDER~
 IF ~~ THEN EXIT
END

IF ~~ a2865
  SAY ~[ARAN] Oh, come on now. You must have some right nice things to remember about family.~
  ++ ~[PC] I remember Imoen torturing me and teasing me, bothering me, and generally taking up the attention that was rightfully mine.~  + c-tobplaceholder /* PLACEHOLDER */
  ++ ~[PC] If by 'family' you mean the man who fostered me and kept me from my true heritage, and the girl who weighed me down all the time, no.~ + c-tobplaceholder /* PLACEHOLDER */
  ++ ~[PC] I do have some happy memories of that time. Imoen was particularly easy to bend to my will. I once had her brainwashed into curtsying every time she began speaking. It was fun.~ + c-tobplaceholder /* PLACEHOLDER */
  ++ ~[PC] I have memories, but choose not to share them with you.~ + c-tobplaceholder /* PLACEHOLDER */
  ++ ~[PC] I try not to think about any of that.~ + c-tobplaceholder /* PLACEHOLDER */
END

IF ~~ a2866
 SAY ~PLACEHOLDER~
 IF ~~ THEN GOTO c-tobplaceholder
END

IF ~~ a2867
 SAY ~PLACEHOLDER~
 IF ~~ THEN GOTO c-tobplaceholder
END

IF ~~ a2868
  SAY ~[ARAN] Why, you do be right fascinatin'. I bet you have some good stories o' when you an' Imoen were back in Candlekeep.~
END

IF ~~ a2869
 SAY ~PLACEHOLDER~
 IF ~~ THEN GOTO c-tobplaceholder
END

IF ~~ a2870
 SAY ~PLACEHOLDER~
 IF ~~ THEN GOTO c-tobplaceholder
END

IF ~~ a2871
  SAY ~[ARAN] Hells, no. I don't have no special feelin's for Imoen, not th' way you seem to mean. Nor Elena, for that matter. I was just sharin' how things were goin', is all.~
  IF ~~ THEN GOTO a2873
END

IF ~~ a2872
  SAY ~[ARAN] I know you done said as much, but it be gnawin' at my mind. There be more about this feelin' than just th' sisters, I think. Mayhap I just don't relly know you as well as I think I do.~
  IF ~~ THEN GOTO a2873
END

IF ~~ a2873
  SAY ~[ARAN] I just don't rightly know how you dealt wi' th' feelin's about that Irenicus bastard takin' that sister o' yours. It be one thing to have things pushed on you, but on family, that be a heavy burden to carry.~
  ++ ~[PC] She... she isn't really my sister by blood. Or, she is, but not by mortal blood, you know.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",1)~ +  a2791
  ++ ~[PC] Sisters, sisters... can't live with them, can't live without them. Don't worry, We set him straight. Or rather, we chopped him into little pieces. Why the deep sibling introspection?.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",2)~ +  a2792
  ++ ~[PC] Sometimes the greater good requires some sacrifices, but where Imoen is concerned, I think less about the big picture and more about making sure she is safe.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",3)~ + a2793
  + ~RandomNum(3,3)~ + ~[PC] This is a bit too personal for me. Just move along, and cut the chatter, Aran.~ + a3204 /* already 6 */
  + ~RandomNum(3,2)~ + ~[PC] This is a bit too personal for me. Just move along, and cut the chatter, Aran.~ + a3205 /* already 6 */
  + ~RandomNum(3,1)~ + ~[PC] This is a bit too personal for me. Just move along, and cut the chatter, Aran.~ + a3206 /* already 6 */
  ++ ~[PC] Stop rehashing old history. Irenicus transgressed, I hit back with everything I had, and now I am here and he no longer has any power at all.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",4)~ + a2794
  ++ ~[PC] There is always more at play than it seems, Aran. I wanted Imoen back, but there was far more to be gained by hunting down Irenicus then simply rescuing my 'sister'.~ DO ~SetGlobal("c-ArSisterBranch","GLOBAL",5)~ + a2795
END

IF ~~ a2874
  SAY ~[ARAN] Elena an' me, we work on a strict "don't ask, don't tell" policy when it comes to gettin' letters to each other. I don't ask, and she don't rightly tell. This one just showed up in my backpack, though what spell she done used sure beat th' heck out o' me.~
  IF ~~ THEN EXIT
END

/* temporary state for missing content. */

IF ~~ c-tobplaceholder
  SAY ~[ARAN] Well, I'll be a monkey's uncle. I got naught to say. Must be a writer's strike.~
  IF ~~ THEN EXIT
END

END



