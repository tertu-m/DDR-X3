return Def.ActorFrame {
	--p1
	LoadActor( "page" )..{
		InitCommand=cmd(Center);
		OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.5;accelerate,0.5;addx,SCREEN_WIDTH);
		OffCommand=cmd(sleep,0.2;accelerate,0.5;addx,SCREEN_WIDTH);
	};
	LoadActor("1pExpl") .. {
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X;y,380);
		OnCommand=cmd();
		OffCommand=cmd(linear,0.25;addx,600);
	};
	LoadActor("2pExpl") .. {
		InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X;y,380);
		OnCommand=cmd();
		OffCommand=cmd(linear,0.25;addx,600);
	};
}
