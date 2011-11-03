

/* exit state template for starting the movies */



OK. Let me think.

The initial idea was to allow levels of intimacy to play a role in jumpstarting things, with the idea being a flirt-driven RomanceActive status. Things have evolved, so right now it is set up so that PC can jump him right away if she wants. Player cloice, and all. 

That poses a problem. 
We can have c-aransex=4 with Global("c-aranpcflirtstart","GLOBAL",0).

Right now, a player can flirt 13 or 14 times, and move c-aranpcflirtstart to 1, basically moving the physical side of the relationship 1 level higher than the emotional side would ordinarily allow (demonstrative girlfriend, willing boyfriend, tacit acknoledgement that it is obvious something is going on, so Aran will feel more willing to risk thinsg because he thinks there is a good chance she might say "yes")

If she is less agressive, 
Then, when things are humming along nicely, she can up the level an additional notch to "heavy", regardless of intimacy level, if she (and he - his NPC-initiated flirts count too) make it to GlobalGT("c-aranflirt","GLOBAL",24). (24 interactions labeled "flirting"). 

If she is less aggressive, then the flirting actually remains static - the only thing that lets Aran know to move up in flirt intimacy level is the flirting level. After all, if your girlfriend doesn't flirt with you, she is either sending you the message that you are not long for this relationship, or she is signalling that she is uncomfortable with PDA's. The romantic kind, not the elctronic, though in this case there is a conflation of terminology.


So, can we strip away the c-aransex variable completely, and stilll have a resonable progression?

For the early flirts, the content is all Aran being interestd, smiling, but deflecting. Normal enough public behavior.

For the lightweight flirts, the content is still pretty tame... definitely public behavior.
For the heavyweight flirts, some of the lighweights are still available, but most of them are handsy. Stuff you might do in a public space with a girlfriend or significant other, but reasonably moderate - you wouldn't get arrested even in the USA. Some emotional content comes into play as well - things you would only say to someone you were definitely involved with.
For the mature flirts, you are definitely assumed to be lovers. Though you could probably read any of them as being lovers who have chosen not to go "all the way", just getting as close to that act as humanly/elvenly/half-orcly/dwarvenly/halflingly/gnomishly possible.

If you had a one-night stand fifteen minutes after meeting your current emplyer, I think it makes sense to be a little shy, so I think we can have him flinch and move away in public even after a wild night. PC can always press the issue via PID and talk. Then things take their course, and as they get more familiar with eachother, the non-physical side opens up... ok, that works as a rationale. 

So what we need is for the flirts to be set up without any reference to c-aransex until the flirt level goes into the division between "Heavy" and "Mature", since the actions in "Mature" . Do you think this works from a "fun" standpoint? 

[code]
  /*  PC Initiated Flirting;  (1) of the four should be active at any one time. None show for males. */
  /* PC wants to initiate a flirt before the 3 friendtalks and 3 lovetalks */
  + ~Gender(Player1,FEMALE) Global("c-aranpcflirtstart","GLOBAL",0) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) Global("c-aranfight","GLOBAL",0)~ + ~[PC] (You decide to flirt with Aran)~ + a3296
  /* PC Wants To Initiate A Flirt: Lightweight */
  + ~Gender(Player1,FEMALE) Global("c-aranpcflirtstart","GLOBAL",1) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) Global("c-aranfight","GLOBAL",0)~ + ~[PC] (You decide to flirt with Aran)~ + a1074 /* c-pcflirtsaran1 */
  /* PC Wants To Initiate A Flirt: Heavyweight */
  + ~Gender(Player1,FEMALE) Global("c-aranpcflirtstart","GLOBAL",2) GlobalLT("c-aransex","GLOBAL",3) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) Global("c-aranfight","GLOBAL",0)~ + ~[PC] (You decide to flirt with Aran)~ + a1075 /*  c-pcflirtsaran2 */
  /* PC Wants To Initiate A Flirt: Mature */
  + ~Gender(Player1,FEMALE) Global("c-aranpcflirtstart","GLOBAL",2) GlobalGT("c-aransex","GLOBAL",2) OR(2) Global("c-aranrom","GLOBAL",1) Global("c-aranrom","GLOBAL",2) Global("c-aranfight","GLOBAL",0)~ + ~[PC] (You decide to flirt with Aran)~ + a1076 /*  c-pcflirtsaran3 */
[/code]

Does anyone see any logic loopholes? 
	   