local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center;zoom,1.02);
  LoadActor("Common doors/door 3.png")..{
    OnCommand=cmd(sleep,0.25;linear,0.1;linear,0.1;diffusealpha,0);
  };
  LoadActor("Common doors/door 4.png")..{
	   OnCommand=cmd(sleep,0.25;linear,0.05;linear,0.1;diffusealpha,0);
	};
  LoadActor("Common doors/door 5.png")..{
	   OnCommand=cmd(sleep,0.25;linear,0.1;diffusealpha,0);
	};
  LoadActor("Common doors/door 2.png")..{
	 OnCommand=cmd(rotationz,0;zoom,1;sleep,0.2;accelerate,0.4;zoom,2;rotationz,180;linear,0.0;zoom,4;rotationz,-180);
	};
  LoadActor("Common doors/door 1.png")..{
	 OnCommand=cmd(zoom,1;sleep,0.5;linear,0.6;zoom,4);
	};
};

return t
