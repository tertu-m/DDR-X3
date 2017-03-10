local t = ...;
t = Def.ActorFrame{
    LoadActor("P2Cursor")..{
	InitCommand=cmd(player,PLAYER_1;x,140;bounce;effectmagnitude,10,0,0;effectperiod,0.5);	
	};
	Def.Sprite {
	Texture="ScreenPlayerOptions LineHighlight P2 1x2";
	
	Frame0000=0;
	Delay0000=0.5;
	
	Frame0001=1;
	Delay0001=0.5;
	
	};	
};	
return t;
