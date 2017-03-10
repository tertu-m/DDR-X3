local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	LoadActor( "Common doors/door 3" )..{
		 OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,0.1;linear,0.1;diffusealpha,-1);
	};
};
t[#t+1] =Def.ActorFrame{
	LoadActor( "Common doors/door 4" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,0.05;linear,0.5;diffusealpha,-1);
	};
};
t[#t+1] =Def.ActorFrame{
	LoadActor( "Common doors/door 5" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,0.05;linear,0.5;diffusealpha,-1);
	};
};
t[#t+1] =Def.ActorFrame{
	LoadActor( "Common doors/door 2" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,0;zoom,1;sleep,0.2;accelerate,0.4;zoom,2;rotationz,180;linear,0.0;zoom,4;rotationz,-180);
	};
};
t[#t+1] =Def.ActorFrame{
	LoadActor( "Common doors/door 1" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,1;sleep,0.5;linear,0.6;zoom,4);
	};

}

return t;
