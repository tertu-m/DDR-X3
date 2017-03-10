local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center;zoom,1.02);
  OnCommand=cmd(vibrate;effectmagnitude,2,4,0;sleep,0.3;queuecommand,"StopThat");
  StopThatCommand=cmd(stopeffect);
  LoadActor("Common doors/door 3.png")..{
    OnCommand=cmd(zoom,0;rotationz,080;linear,0.083;zoom,0.0;rotationz,90;sleep,0.100;zoom,1;rotationz,0);
  };
  LoadActor("Common doors/door 4.png")..{
	   OnCommand=cmd(zoom,0;rotationz,080;linear,0.068;zoom,0.0;rotationz,90;sleep,0.100;zoom,1;rotationz,0);
	};
  LoadActor("Common doors/door 5.png")..{
	   OnCommand=cmd(rotationz,0;zoom,0;linear,0.089;zoom,0.0;rotationz,0;sleep,0.100;zoom,1;rotationz,0);
	};
  LoadActor("Common doors/door 2.png")..{
	 OnCommand=cmd(rotationz,-110;zoom,2;linear,0.180;zoom,1;rotationz,-050;linear,0.039;zoom,1;rotationz,0);
	};
  LoadActor("Common doors/door 1.png")..{
	 OnCommand=cmd(zoom,5;linear,0.01;zoom,1.8;linear,0.070;zoom,1;rotationz,0);
	};
};

return t
