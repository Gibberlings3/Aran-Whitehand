original code

 Setting up timered interactions with player choice before compiling .d and .baf 
OUTER_FOR( aran_timer_choice = 0 ; ~%aran_timer_choice%~ STRING_COMPARE_REGEXP ~^[12]$~ ; )BEGIN
	PRINT @30042
	ACTION_READLN aran_timer_choice
END // of O_F
ACTION_IF ("aran_timer_choice" = 1) THEN BEGIN
	/*  patching files with player choice: set talk timers */
		OUTER_SET ARAN_FTT = 3600
		OUTER_SET ARAN_LTT = 3600
		OUTER_SET ARAN_FLIRT = 3600
		PRINT @30043
		OUTER_SET choseninitialrom = 2400
		PRINT @30044
		OUTER_SET choseninitialflirt = 1200
		PRINT @30045 /* ~Default timers [1] chosen.~ */
			OUTER_SPRINT aranw_timerd @30045
			APPEND ~c-arandebugger01.log~ ~%aranw_timerd%~
		PRINT @30046
			OUTER_SPRINT aranw_timerchoice @30046
			APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
END
ACTION_IF ("aran_timer_choice" = 2) THEN BEGIN
	PRINT @30047
	PRINT @30048		
	APPEND ~c-arandebugger01.log~ ~Custom timers [2] chosen.~
	OUTER_SPRINT ~friendshiptimer~ ~placeholder_value~
	OUTER_WHILE (!(IS_AN_INT ~friendshiptimer~) OR (~friendshiptimer~ > 0x6) OR (~friendshiptimer~ < 0x1)) BEGIN
		PRINT @30049
		ACTION_READLN ~friendshiptimer~
	END
	ACTION_IF ("friendshiptimer" = 1) THEN BEGIN
		OUTER_SET ARAN_FTT = 3600
		OUTER_SET ARAN_LTT = 3600
		OUTER_SET ARAN_FLIRT = 3600
		PRINT @30043
		OUTER_SET choseninitialrom = 2400
		PRINT @30044
		OUTER_SET choseninitialflirt = 1200
		PRINT @30045
		PRINT @30050
		APPEND ~c-arandebugger01.log~ ~Standard FTT, LTT, FLIRT timers [1] chosen.~
		OUTER_SPRINT aranw_timerchoice @30050
		APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
	END
	ACTION_IF ("friendshiptimer" = 2) THEN BEGIN
		OUTER_SET ARAN_FTT = 900
		OUTER_SET ARAN_LTT = 900
		OUTER_SET ARAN_FLIRT = 900
		PRINT @30051
		OUTER_SET choseninitialrom = 600
		PRINT @30052
		OUTER_SET choseninitialflirt = 300
		PRINT @30053
		PRINT @30054
		APPEND ~c-arandebugger01.log~ ~15 minute FTT, LTT, FLIRT timers [2] chosen.~
		OUTER_SPRINT aranw_timerchoice @30054
		APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
	END
	ACTION_IF ("friendshiptimer" = 3) THEN BEGIN
		OUTER_SET ARAN_FTT = 1800
		OUTER_SET ARAN_LTT = 1800
		OUTER_SET ARAN_FLIRT = 1800
		PRINT @30055
		OUTER_SET choseninitialrom = 1205
		PRINT @30056
		OUTER_SET choseninitialflirt = 600
		PRINT @30057
		PRINT @30058
		APPEND ~c-arandebugger01.log~ ~30 minute FTT, LTT, FLIRT timers [3] chosen.~
		OUTER_SPRINT aranw_timerchoice @30058
		APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
	END
	ACTION_IF ("friendshiptimer" = 4) THEN BEGIN
		OUTER_SET ARAN_FTT = 2700
		OUTER_SET ARAN_LTT = 2700
		OUTER_SET ARAN_FLIRT = 2700
		PRINT @30059
		OUTER_SET choseninitialrom = 1800
		PRINT @30060
		OUTER_SET choseninitialflirt = 900
		PRINT @30061
		PRINT @30062
		APPEND ~c-arandebugger01.log~ ~45 minute FTT, LTT, FLIRT timers [4] chosen.~
		OUTER_SPRINT aranw_timerchoice @30062
		APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
	END
	ACTION_IF ("friendshiptimer" = 5) THEN BEGIN
		OUTER_SET ARAN_FTT = 5400
		OUTER_SET ARAN_LTT = 5400
		OUTER_SET ARAN_FLIRT = 5400
		PRINT @30063
		OUTER_SET choseninitialrom = 3600
		PRINT @30064
		OUTER_SET choseninitialflirt = 1800
		PRINT @30065
		PRINT @30066
		APPEND ~c-arandebugger01.log~ ~1 hour 30 minutes FTT, LTT, FLIRT timers [5] chosen.~
		OUTER_SPRINT aranw_timerchoice @30066
		APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
	END
	ACTION_IF ("friendshiptimer" = 6) THEN BEGIN
		OUTER_SET ARAN_FTT = 7200
		OUTER_SET ARAN_LTT = 7200
		OUTER_SET ARAN_FLIRT = 7200
		PRINT @30067
		OUTER_SET choseninitialrom = 4800
		PRINT @30068
		OUTER_SET choseninitialflirt = 2400
		PRINT @30069
		PRINT @30070
		APPEND ~c-arandebugger01.log~ ~2 hour FTT, LTT, FLIRT timers [6] chosen.~
		OUTER_SPRINT aranw_timerchoice @30070
		APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
	END
END




	
/* set default values for timers :  */
OUTER_SET ARAN_FTT = 3605
OUTER_SET ARAN_LTT = 3605
OUTER_SET ARAN_FLIRT = 3605
PRINT @30043 /* ~Content Speed: minimum 1 hour real time between dialogues (Default, recommended)~ */
	OUTER_SPRINT aranw_curspd @30043
	APPEND ~c-arandebugger01.log~ ~%aranw_curspd%~		
OUTER_SET choseninitialrom = 2405
PRINT @30044 /* ~Initial Lovetalk offset by 40 minutes~ */
	OUTER_SPRINT aranw_curspdir @30044
	APPEND ~c-arandebugger01.log~ ~%aranw_curspdir%~	
OUTER_SET choseninitialflirt = 1205
PRINT @30045 ~Initial NPC-Initiated Flirt offset by 20 minutes~		
	OUTER_SPRINT aranw_initfl @30045 
	APPEND ~c-arandebugger01.log~ ~%aranw_initfl%~	
PRINT @30050 /* ~So if you are in a romance with him etc. etc. ~ */
	OUTER_SPRINT aranw_timerchoice @30050
	APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~

	
	
	Global("c-aranfriendsetud","GLOBAL",0) - says 2 hours aran.bcs

IF
  Global("c-aranmatch","GLOBAL",1)
  Global("c-aransetupromtimers","GLOBAL",0)
  GlobalGT("c-aranfriendbg2","GLOBAL",5)
  Global("c-aranpcflirtstart","GLOBAL",1)
  Gender(Player1,FEMALE)
  InParty(Myself)
  !StateCheck(Myself,CD_STATE_NOTVALID)
  !StateCheck(Player1,CD_STATE_NOTVALID)
  !HasItemEquiped("belt05",Player1)
THEN
  RESPONSE #100
    SetGlobal("c-aransetupromtimers","GLOBAL",1)
    RealSetGlobalTimer("c-aranromtimer","GLOBAL",2407)
    RealSetGlobalTimer("c-aranflirttimer","GLOBAL",1207)
END

	
	ACTION_IF ("friendshiptimer" = 2) THEN BEGIN
		OUTER_SET ARAN_FTT = 900
		OUTER_SET ARAN_LTT = 900
		OUTER_SET ARAN_FLIRT = 900
		PRINT @30051
		OUTER_SET choseninitialrom = 600
		PRINT @30052
		OUTER_SET choseninitialflirt = 300
		PRINT @30053
		PRINT @30054
		APPEND ~c-arandebugger01.log~ ~15 minute FTT, LTT, FLIRT timers [2] chosen.~
		OUTER_SPRINT aranw_timerchoice @30054
		APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
	END
	ACTION_IF ("friendshiptimer" = 3) THEN BEGIN
		OUTER_SET ARAN_FTT = 1800
		OUTER_SET ARAN_LTT = 1800
		OUTER_SET ARAN_FLIRT = 1800
		PRINT @30055
		OUTER_SET choseninitialrom = 1200
		PRINT @30056
		OUTER_SET choseninitialflirt = 600
		PRINT @30057
		PRINT @30058
		APPEND ~c-arandebugger01.log~ ~30 minute FTT, LTT, FLIRT timers [3] chosen.~
		OUTER_SPRINT aranw_timerchoice @30058
		APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
	END
	ACTION_IF ("friendshiptimer" = 4) THEN BEGIN
		OUTER_SET ARAN_FTT = 2700
		OUTER_SET ARAN_LTT = 2700
		OUTER_SET ARAN_FLIRT = 2700
		PRINT @30059
		OUTER_SET choseninitialrom = 1800
		PRINT @30060
		OUTER_SET choseninitialflirt = 900
		PRINT @30061
		PRINT @30062
		APPEND ~c-arandebugger01.log~ ~45 minute FTT, LTT, FLIRT timers [4] chosen.~
		OUTER_SPRINT aranw_timerchoice @30062
		APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
	END
	ACTION_IF ("friendshiptimer" = 5) THEN BEGIN
		OUTER_SET ARAN_FTT = 5405
		OUTER_SET ARAN_LTT = 5400
		OUTER_SET ARAN_FLIRT = 5400
		PRINT @30063
		OUTER_SET choseninitialrom = 3600
		PRINT @30064
		OUTER_SET choseninitialflirt = 1800
		PRINT @30065
		PRINT @30066
		APPEND ~c-arandebugger01.log~ ~1 hour 30 minutes FTT, LTT, FLIRT timers [5] chosen.~
		OUTER_SPRINT aranw_timerchoice @30066
		APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
	END
	ACTION_IF ("friendshiptimer" = 6) THEN BEGIN
		OUTER_SET ARAN_FTT = 7205
		OUTER_SET ARAN_LTT = 7200
		OUTER_SET ARAN_FLIRT = 7200
		PRINT @30067
		OUTER_SET choseninitialrom = 4800
		PRINT @30068
		OUTER_SET choseninitialflirt = 2400
		PRINT @30069
		PRINT @30070
		APPEND ~c-arandebugger01.log~ ~2 hour FTT, LTT, FLIRT timers [6] chosen.~
		OUTER_SPRINT aranw_timerchoice @30070
		APPEND ~c-arandebugger01.log~ ~%aranw_timerchoice%~
	END
END