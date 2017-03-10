local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("bnrframe")..{
    InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-138;diffusealpha,0.75);
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(draworder,99;CenterX;y,SCREEN_CENTER_Y+130);
  OffCommand=cmd(sleep,0.15;linear,0.15;diffusealpha,0);
	LoadActor("arrow") .. {
		InitCommand=cmd(x,224;rotationy,180);
		NextSongMessageCommand=cmd(stopeffect;finishtweening;linear,0;addx,20;decelerate,0.5;addx,-20);
	};
	LoadActor("arrow") .. {
		InitCommand=cmd(x,-224);
		PreviousSongMessageCommand=cmd(stopeffect;finishtweening;linear,0;addx,-20;decelerate,0.5;addx,20);

	};
};

t[#t+1] = Def.ActorFrame{
  LoadActor("bottom")..{
    InitCommand=cmd(CenterX;valign,1;y,SCREEN_BOTTOM-44);
  };
};

t[#t+1] = Def.ActorFrame{
	LoadActor("../Screen2ndMIXSelectGameMode decorations/1P")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X-415,SCREEN_CENTER_Y+176;visible,false);
		OnCommand=function(s) if GAMESTATE:IsPlayerEnabled(PLAYER_1) then s:visible(true) else s:visible(false) end; end;
	};
};

return t
