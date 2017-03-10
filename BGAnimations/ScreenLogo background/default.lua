local counter = 0;
local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
	Def.ActorFrame{
		LoadActor("../ScreenWithMenuElements background/DDR X3.avi")..{
			InitCommand=cmd(Center;setsize,1280,720);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-80;zoom,1.8);
		LoadActor("logo");
		LoadActor("logo")..{
			OnCommand=cmd(diffusealpha,0;playcommand,"Animate");
			AnimateCommand=cmd(sleep,0.5;linear,1;blend,'BlendMode_Add';diffusealpha,0.8;linear,1;diffusealpha,0;queuecommand,"Animate");
		};
	};
};

return t;
