local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")..{
	InitCommand = cmd(draworder,110);
};
t[#t+1] = StandardDecorationFromFileOptional("SortDisplay","SortDisplay")
t[#t+1] = StandardDecorationFromFileOptional("SortOrderFrame","SortOrderFrame")

t[#t+1] = StandardDecorationFromFileOptional("SortOrder","SortOrderText") .. {
	BeginCommand=cmd(playcommand,"Set");
	SortOrderChangedMessageCommand=cmd(playcommand,"Set";);
	SetCommand=function(self)
		local s = SortOrderToLocalizedString( GAMESTATE:GetSortOrder() );
		self:settext( s );
		self:playcommand("Sort");
	end;
};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+170;zoom,1);
	OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.1;diffusealpha,1);
	OffCommand=cmd(sleep,0.233;linear,0.05;diffusealpha,0);
	LoadActor("pane base")..{
		InitCommand=cmd(diffusealpha,1;);
	};
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(y,SCREEN_CENTER_Y+170;x,SCREEN_CENTER_X+154;diffuse,color("0,0,0,1"));
	LoadActor("diffbg")..{
		InitCommand=cmd(y,-80);
		OnCommand=cmd(diffusealpha,0;cropright,0.7;sleep,0.576;decelerate,1.55;cropright,0;diffusealpha,0.3);
		OffCommand=cmd(stoptweening;sleep,0.533;linear,0.15;cropright,0.5;cropleft,0.5;diffusealpha,0);
	};
	LoadActor("diffbg")..{
		InitCommand=cmd(y,-40);
		OnCommand=cmd(diffusealpha,0;cropright,0.7;sleep,0.486;decelerate,1.55;cropright,0;diffusealpha,0.3);
		OffCommand=cmd(stoptweening;sleep,0.433;linear,0.15;cropright,0.5;cropleft,0.5;diffusealpha,0);
	};
	LoadActor("diffbg")..{
		OnCommand=cmd(diffusealpha,0;cropright,0.7;sleep,0.446;decelerate,1.52;cropright,0;diffusealpha,0.3);
		OffCommand=cmd(stoptweening;sleep,0.333;linear,0.15;cropright,0.5;cropleft,0.5;diffusealpha,0);
	};
	LoadActor("diffbg")..{
		InitCommand=cmd(y,40);
		OnCommand=cmd(diffusealpha,0;cropright,0.7;sleep,0.466;decelerate,1.5;cropright,0;diffusealpha,0.3);
		OffCommand=cmd(stoptweening;sleep,0.233;linear,0.15;cropright,0.5;cropleft,0.5;diffusealpha,0);
	};
	LoadActor("diffbg")..{
		InitCommand=cmd(y,80);
		OnCommand=cmd(diffusealpha,0;cropright,0.7;sleep,0.576;decelerate,1.55;cropright,0;diffusealpha,0.3);
		OffCommand=cmd(stoptweening;sleep,0.133;linear,0.15;cropright,0.5;cropleft,0.5;diffusealpha,0);
	};

};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,SCREEN_CENTER_X-314;y,SCREEN_CENTER_Y+184);
	OnCommand=cmd(zoom,0;sleep,0.25;accelerate,0.2;zoom,1);
	OffCommand=cmd(stoptweening;sleep,0.233;linear,0.05;diffusealpha,0);
	LoadActor("radar base");
	LoadActor( "radar_scan" )..{
		InitCommand=cmd(diffusealpha,0.25);
		OnCommand=cmd(spin;effectmagnitude,0,0,120);
		OffCommand=cmd(linear,0.2;zoom,0);
	};
	LoadActor("over");
};

t[#t+1] = Def.ActorFrame{
	OffCommand=cmd(sleep,0.233;linear,0.05;diffusealpha,0);
	LoadActor("line")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+170;zoom,1);
		OnCommand=cmd(croptop,1;cropbottom,1;sleep,0.2;linear,0.6;croptop,0;cropbottom,0);
	};
	LoadActor("bpm")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-208;y,SCREEN_CENTER_Y+84);
		OnCommand=cmd(diffusealpha,0;sleep,0.2;linear,0.1;diffusealpha,1);
	};
	LoadActor("label_stream")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-314;y,SCREEN_CENTER_Y+92);
		OnCommand=cmd(zoom,0;sleep,0.2;linear,0.2;zoom,1);
	};
	LoadActor("label_voltage")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-434;y,SCREEN_CENTER_Y+156);
		OnCommand=cmd(zoom,0;sleep,0.2;linear,0.2;zoom,1);
	};
	LoadActor("label_chaos")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-204;y,SCREEN_CENTER_Y+156);
		OnCommand=cmd(zoom,0;sleep,0.2;linear,0.2;zoom,1);
	};
	LoadActor("label_air")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-388;y,SCREEN_CENTER_Y+256);
		OnCommand=cmd(zoom,0;sleep,0.2;linear,0.2;zoom,1);
	};
	LoadActor("label_freeze")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-234;y,SCREEN_CENTER_Y+256);
		OnCommand=cmd(zoom,0;sleep,0.2;linear,0.2;zoom,1);
	};
};

t[#t+1] = LoadActor("X2DifficultyList.lua");
-------------------------------------------------------------------------------------------------------------------
-- Groove Radars
-------------------------------------------------------------------------------------------------------------------
t[#t+1] = Def.ActorFrame{
	Name = "Player 1";
	OffCommand=cmd(sleep,0.233;linear,0.05;diffusealpha,0);
	CurrentSongChangedMessageCommand=function(self)
		local Song=GAMESTATE:GetCurrentSong()
			if not Song then
				self:diffusealpha(0)
			else
				self:diffusealpha(0.75)
			end;
		end;
	create_ddr_groove_radar("P1_radar", SCREEN_CENTER_X-314, SCREEN_CENTER_Y+184,
		PLAYER_1, 74, color("1,1,1,0.25"),
		{ColorGR.PLAYER_1, ColorGR.PLAYER_1, ColorGR.PLAYER_1, ColorGR.PLAYER_1, ColorGR.PLAYER_1},
		"accelerate", .1)
};
t[#t+1] = Def.ActorFrame{
	Name = "Player 2";
	OffCommand=cmd(sleep,0.233;linear,0.05;diffusealpha,0);
	CurrentSongChangedMessageCommand=function(self)
		local Song=GAMESTATE:GetCurrentSong()
			if not Song then
				self:diffusealpha(0)
			else
				self:diffusealpha(0.75)
			end;
		end;
	create_ddr_groove_radar("P2_radar", SCREEN_CENTER_X-314, SCREEN_CENTER_Y+184,
		PLAYER_2, 74, color("1,1,1,0.25"),
		{ColorGR.PLAYER_2, ColorGR.PLAYER_2, ColorGR.PLAYER_2, ColorGR.PLAYER_2, ColorGR.PLAYER_2},
		"accelerate", .1)
};

-- song options text (e.g. 1.5xmusic)
t[#t+1] = StandardDecorationFromFileOptional("SongOptions","SongOptions")

-- other items (balloons, etc.)
t[#t+1] = StandardDecorationFromFile( "Balloon", "Balloon" );
t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathS("","Music_In"))..{
		OnCommand=cmd(play);
	};
};

if GAMESTATE:IsCourseMode() == false then
t[#t+1] = Def.ActorFrame{
	LoadActor("_selectarrowRightG") .. {
		InitCommand=cmd(draworder,99;x,SCREEN_CENTER_X+154;y,SCREEN_CENTER_Y-20;zoom,1);
		OffCommand=cmd(sleep,0.15;linear,0.15;diffusealpha,0);
		NextSongMessageCommand=cmd(stoptweening;linear,0;x,SCREEN_CENTER_X+154+20;decelerate,0.5;x,SCREEN_CENTER_X+154);
	};
	LoadActor("_selectarrowRightG") .. {
		InitCommand=cmd(draworder,99;x,SCREEN_CENTER_X-154;y,SCREEN_CENTER_Y-20;rotationy,180;zoom,1);
		OffCommand=cmd(sleep,0.15;linear,0.15;diffusealpha,0);
		PreviousSongMessageCommand=cmd(stoptweening;linear,0;x,SCREEN_CENTER_X-154-20;decelerate,0.5;x,SCREEN_CENTER_X-154);

	};
    LoadActor("_selectarrowRightR") .. {
		InitCommand=cmd(diffusealpha,0;draworder,100;x,SCREEN_CENTER_X+154;y,SCREEN_CENTER_Y-20;zoom,1);
		NextSongMessageCommand=cmd(stoptweening;linear,0;diffusealpha,1;x,SCREEN_CENTER_X+154+20;decelerate,0.5;diffusealpha,0;x,SCREEN_CENTER_X+154);
	};
	LoadActor("_selectarrowRightR") .. {
		InitCommand=cmd(diffusealpha,0;draworder,100;x,SCREEN_CENTER_X-154;y,SCREEN_CENTER_Y-20;rotationy,180;zoom,1);
		PreviousSongMessageCommand=cmd(stoptweening;linear,0;diffusealpha,1;x,SCREEN_CENTER_X-154-20;decelerate,0.5;diffusealpha,0;x,SCREEN_CENTER_X-154);
	};
};
end

t[#t+1] = LoadActor( "ST.png" )..{
		OnCommand=function(self)
			if(GAMESTATE:IsCourseMode()) then
				(cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y+30;diffusealpha,0;sleep,0.2;decelerate,0.15;diffusealpha,0.75;))(self);
			else
				(cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+30;diffusealpha,0;sleep,0.2;decelerate,0.15;diffusealpha,0.75;))(self);
			end

		end;
		OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
	};


local ut = Def.ActorFrame{
	LoadFont("_helvetica Bold 24px")..{
		Name="songTitle";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+20;zoomy,0.8;zoomx,0.9;diffuse,color("0,0,0,1");strokecolor,color("#ffffff"));
		OnCommand=cmd(diffusealpha,0;sleep,0.4;diffusealpha,1);
		OffCommand=cmd(decelerate,0.05;addy,900);
		SetCommand=function(self)
			local song;
			local tit="";
			if GAMESTATE:IsCourseMode() then
				song=GAMESTATE:GetCurrentCourse();
				tit=song:GetDisplayFullTitle();

			else
				song=GAMESTATE:GetCurrentSong();
				tit=song:GetDisplayMainTitle();
			end;
			self:maxwidth(800);
			self:settextf("%s",tit);
		end;
	};
	LoadFont("_helvetica Bold 24px")..{
		Name="songArtist";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+30;zoom,0.75;diffuse,color("#000000");strokecolor,color("#ffffff");draworder,2);
		OnCommand=cmd(diffusealpha,0;sleep,0.4;diffusealpha,1);
		OffCommand=cmd(decelerate,0.05;addy,900);
		SetCommand=function(self)
			local song;
			local sub="";
			local art="";
			if GAMESTATE:IsCourseMode() then
			else
				song=GAMESTATE:GetCurrentSong();
				sub=song:GetDisplaySubTitle();
				art=song:GetDisplayArtist();
				self:settextf("%s\n%s",sub,art);
			end;
		end;
	};
};

local function updateTitle(self)
	local upTit = self:GetChild("songTitle");
	local upArt = self:GetChild("songArtist");
	local curSelection = GAMESTATE:GetCurrentSong();
	local curSelCourse = GAMESTATE:GetCurrentCourse();
	upTit:maxwidth(330);
	upArt:maxwidth(330);
	if curSelection or curSelCourse then
		local song;
		local tit="";
		local sub="";
		local art="";
		if GAMESTATE:IsCourseMode() then
			song=GAMESTATE:GetCurrentCourse();
			tit=song:GetDisplayFullTitle();
			upTit:settextf("%s",tit);
		else
			song=GAMESTATE:GetCurrentSong();
			tit=song:GetDisplayMainTitle();
			sub=song:GetDisplaySubTitle();
			art=song:GetDisplayArtist();
			upTit:settextf("%s",tit..sub);
		end;
		upTit:diffuse(color("0,0,0,1"));
		upTit:strokecolor(Color("White"));

		upArt:settextf("\n%s",art);
		upArt:diffuse(color("0,0,0,1"));
		upArt:strokecolor(Color("White"));
	else
		upTit:settext("");
		upArt:settext("");
	end;
end;

ut.InitCommand=cmd(SetUpdateFunction,updateTitle);


t[#t+1] = ut;

return t
