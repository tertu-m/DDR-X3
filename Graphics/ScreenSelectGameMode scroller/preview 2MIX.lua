local t = Def.ActorFrame{
	InitCommand=cmd(x,-20);
	OnCommand=cmd(addx,SCREEN_WIDTH*2.5;sleep,0.5;linear,0.1;addx,-SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;diffusealpha,0);
	-- Information panel
	LoadActor("2ndMIX icon");
	LoadActor("2ndMIX icon")..{
		InitCommand=cmd(y,440;rotationx,180;croptop,0.5;diffusealpha,0.25;diffusetopedge,1,1,1,0);
	};
};

return t;
