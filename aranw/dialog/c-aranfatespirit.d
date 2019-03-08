/* Fate Spirit Summoning in ToB, but not for EET */
/* Fate Spirit Summons: Three options, by user choice - friend,  ex-lover (broken up) , or still in the relationship */
/* Moved to separate file for EET Transition compatability */

EXTEND_TOP FATESP 6 #5
IF ~!Dead("c-aran") !InMyArea("c-aran") Global("c-aransummoned","GLOBAL",0)~ THEN REPLY @11315 DO ~CreateVisualEffect("SPPORTAL",[1999.1218]) Wait(2) CreateCreature("c-aran13",[1999.1218],0) SetGlobal("c-aransummoned","GLOBAL",1)~ GOTO 8
IF ~Gender(Player1,FEMALE) !Dead("c-aran") !InMyArea("c-aran") Global("c-aransummoned","GLOBAL",0)~ THEN REPLY @11316 DO ~CreateVisualEffect("SPPORTAL",[1999.1218]) Wait(2) CreateCreature("c-aran13",[1999.1218],0) SetGlobal("c-aransummoned","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",3)~ GOTO 8
IF ~Gender(Player1,FEMALE) !Dead("c-aran") !InMyArea("c-aran") Global("c-aransummoned","GLOBAL",0)~ THEN REPLY @11317 DO ~CreateVisualEffect("SPPORTAL",[1999.1218]) Wait(2) CreateCreature("c-aran13",[1999.1218],0) SetGlobal("c-aransummoned","GLOBAL",1) SetGlobal("c-aranrom","GLOBAL",2)~ GOTO 8
END