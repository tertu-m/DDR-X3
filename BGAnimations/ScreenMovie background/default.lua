local t = Def.ActorFrame {};
local RNG = math.random(4);

if RNG == 1 or RNG == 3 then
t[#t+1] = Def.ActorFrame{
	LoadActor( "x3" )..{
		InitCommand=cmd(FullScreen);
	};
	LoadActor( "music" )..{
		OnCommand=cmd(play);
		OffCommand=cmd(stop);
	};
	Def.Quad{
		InitCommand=cmd(FullScreen);
		OnCommand=cmd(diffusealpha,0;sleep,18;diffusealpha,1);
	};
};
elseif RNG == 2 or RNG == 4 then
	t[#t+1] = Def.ActorFrame{
		LoadActor( "2nd" )..{
			InitCommand=cmd(FullScreen);
		};
		LoadActor( "MIXmusic" )..{
			OnCommand=cmd(play);
			OffCommand=cmd(stop);
		};
		Def.Quad{
			InitCommand=cmd(FullScreen);
			OnCommand=cmd(diffusealpha,0;sleep,16;diffusealpha,1);
		};
	};
end

return t;
