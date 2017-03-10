local t = Def.ActorFrame {
	LoadActor( "DDR X3.avi" )..{
		InitCommand=cmd(Center;setsize,1280,720);
	};
};

--[[t[#t+1] = Def.ActorFrame{
	LoadActor( "back" )..{
		InitCommand=cmd(Center;setsize,854,480);
	};
	LoadActor("Circle1")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X-84,SCREEN_CENTER_Y-110);
		OnCommand=cmd(queuecommand,"Anim");
		AnimCommand=cmd(linear,2;addy,-34;linear,4;addy,68;linear,2;addy,-34;queuecommand,"Anim");
	};
	LoadActor("Circle1")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X+124,SCREEN_CENTER_Y-160;zoom,0.8);
		OnCommand=cmd(queuecommand,"Anim");
		AnimCommand=cmd(linear,2;addy,-20;linear,2;addy,20;linear,2;addy,-20;linear,2;addy,24;linear,0.4;addy,-4;queuecommand,"Anim");
	};
	LoadActor( "top left" )..{
		InitCommand=cmd(Center;setsize,854,480);
	};
	LoadActor( "reflection base" )..{
		InitCommand=cmd(Center;setsize,854,480);
	};
};]]--

return t;
