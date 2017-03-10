--main backing
local t = Def.ActorFrame {
	OnCommand=cmd(zoomy,0;sleep,0.2;accelerate,0.1;zoomy,1.1;decelerate,0.2;zoomy,1);
	OffCommand=cmd(sleep,0.2;accelerate,0.1;zoom,1.4;decelerate,0.1;zoom,0);
	LoadActor("Item")..{
		InitCommand=cmd(scaletoclipped,220,220);
	};
};
return t;
