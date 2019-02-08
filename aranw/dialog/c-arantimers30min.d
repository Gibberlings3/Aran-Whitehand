
/* Change the installed timers in .dlg to values that are a minimum of 30 minutes real time before the next talk can trigger */
/* all timers (after initial .bcs) in the project are set through dialog, and they all are the same length - the initial .bcs block staggers the start out to try to make it less likely that multiple events align */

REPLACE_ACTION_TEXT C-ARANJ ~RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",\([^)]+\))~ ~RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",1805)~
REPLACE_ACTION_TEXT C-ARANJ ~RealSetGlobalTimer("c-aranromtimer","GLOBAL",\([^)]+\))~ ~RealSetGlobalTimer("c-aranromtimer","GLOBAL",1805)~
REPLACE_ACTION_TEXT C-ARANJ ~RealSetGlobalTimer("c-aranflirttimer","GLOBAL",\([^)]+\))~ ~RealSetGlobalTimer("c-aranflirttimer","GLOBAL",1805)~
REPLACE_ACTION_TEXT C-ARN25J ~RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",\([^)]+\))~ ~RealSetGlobalTimer("c-aranfriendtimer","GLOBAL",1805)~
REPLACE_ACTION_TEXT C-ARN25J ~RealSetGlobalTimer("c-aranromtimer","GLOBAL",\([^)]+\))~ ~RealSetGlobalTimer("c-aranromtimer","GLOBAL",1805)~
REPLACE_ACTION_TEXT C-ARN25J ~RealSetGlobalTimer("c-aranflirttimer","GLOBAL",\([^)]+\))~ ~RealSetGlobalTimer("c-aranflirttimer","GLOBAL",1805)~
