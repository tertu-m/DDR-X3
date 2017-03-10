local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
	-- failed song --
    LoadActor("../_failed.mp3") .. {
		StartTransitioningCommand=cmd(play);
	};
	LoadActor("../doors close");
};

t[#t+1] = Def.ActorFrame {
	-- Failed
	LoadActor("failed") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	};
};

return t;
