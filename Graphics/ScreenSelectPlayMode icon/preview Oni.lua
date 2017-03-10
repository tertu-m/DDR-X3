return Def.ActorFrame {
-- Load of Music play frame -- 
    LoadActor( "OniCoursePlay" )..{
	    InitCommand=cmd(;x,50;y,215;zoom,1.5);
		OnCommand=cmd(zoomy,0;sleep,0.5;linear,0.2;zoomy,1.5);
		OffCommand=cmd(linear,0.2;zoomy,0;diffusealpha,1);
	};
	LoadActor( "OniCoursePlay" )..{
	    InitCommand=cmd(;x,50;y,375;zoomx,1.5;zoomy,-1.5;diffusealpha,0.5;diffusetopedge,color("1,1,1,0"));
		OnCommand=cmd(zoomy,0;sleep,0.5;linear,0.2;zoomy,-1.5);
		OffCommand=cmd(linear,0.2;zoomy,0;diffusealpha,0);
	};
	LoadActor( "OniBgFrame" )..{
		OnCommand=cmd(x,50;y,-28;zoom,1.5);
		OffCommand=cmd(sleep,0.2;linear,0.07;addx,-2000;diffusealpha,0);
	};
	LoadActor( "OniBgFrame" )..{
	    InitCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;x,50;y,-30;zoom,1.5);
		OnCommand=cmd(diffusealpha,1;sleep,1.2);
		AnimateCommand=cmd(diffuseshift;effectperiod,2);
		GainFocusCommand=cmd(stoptweening;diffusealpha,1;playcommand,"Animate");
		LoseFocusCommand=cmd(stoptweening;diffusealpha,0);
		OffCommand=cmd(sleep,0.2;linear,0.07;addx,-2000;diffusealpha,0);
	};
	LoadActor( "OniCharactFrame" )..{
		OnCommand=cmd(x,58;y,-45;zoom,1.5);
		OffCommand=cmd(sleep,0.2;linear,0.07;addx,-2000;diffusealpha,0);
	};
    LoadActor( "_selectarrow" )..{
	    InitCommand=cmd(;x,-300;y,250;zoomx,1);
		OnCommand=cmd(zoomy,0;sleep,0.5;linear,0.2;zoomy,0.9;playcommand,"Animate");
		AnimateCommand=cmd(bob;effectmagnitude,10,0,0;effectperiod,0.7);
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoomx,0.9;zoomy,0.9;playcommand,"Animate");
		LoseFocusCommand=cmd(stoptweening;linear,0.1;zoom,0);
		OffCommand=cmd(diffusealpha,0);
	};
}