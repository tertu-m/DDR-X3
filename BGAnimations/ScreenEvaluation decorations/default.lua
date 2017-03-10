local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay");
t[#t+1] = StandardDecorationFromFileOptional("SongInformation","SongInformation") .. {
	BeginCommand=function(self)
		local SongOrCourse;
		if GAMESTATE:GetCurrentSong() then
			SongOrCourse = GAMESTATE:GetCurrentSong();
		elseif GAMESTATE:GetCurrentCourse() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();
		else
			return
		end

	end;
	SetCommand=function(self)
		local c = self:GetChildren();
		local SongOrCourse;
		if GAMESTATE:GetCurrentSong() then
			SongOrCourse = GAMESTATE:GetCurrentSong();

			c.TextTitle:settext( SongOrCourse:GetDisplayMainTitle() or nil );
			c.TextSubtitle:settext( SongOrCourse:GetDisplaySubTitle() or nil );
			c.TextArtist:settext( SongOrCourse:GetDisplayArtist() or nil );

			if SongOrCourse:GetDisplaySubTitle() == "" then
				c.TextTitle:visible(true);
				c.TextTitle:y(-16.5/2);
				c.TextTitle:strokecolor(color("1,1,1,1"));
				c.TextTitle:diffuse(color("0,0,0,1"));
				c.TextSubtitle:visible(false);
				c.TextSubtitle:y(0);
				c.TextArtist:visible(true);
				c.TextArtist:y(18/2);
				c.TextArtist:strokecolor(color("1,1,1,1"));
				c.TextArtist:diffuse(color("0,0,0,1"));
			else
				c.TextTitle:visible(true);
				c.TextTitle:y(-16.5);
				c.TextTitle:strokecolor(color("1,1,1,1"));
				c.TextTitle:diffuse(color("0,0,0,1"));
				c.TextSubtitle:visible(true);
				c.TextSubtitle:y(0);
				c.TextArtist:visible(true);
				c.TextArtist:y(18);
				c.TextArtist:strokecolor(color("1,1,1,1"));
				c.TextArtist:diffuse(color("0,0,0,1"));
			end
-- 			self:playcommand("Tick");
		elseif GAMESTATE:GetCurrentCourse() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();

			c.TextTitle:settext( SongOrCourse:GetDisplayMainTitle() or nil );
			c.TextSubtitle:settext( SongOrCourse:GetDisplaySubTitle() or nil );
			c.TextArtist:settext( SongOrCourse:GetDisplayArtist() or nil );

-- 			self:playcommand("Tick");
		else
			SongOrCourse = nil;

			c.TextTitle:settext("");
			c.TextSubtitle:settext("");
			c.TextArtist:settext("");

			self:playcommand("Hide")
		end
	end;
-- 	OnCommand=cmd(playcommand,"Set");
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	DisplayLanguageChangedMessageCommand=cmd(playcommand,"Set");
};

t[#t+1] = LoadActor("jacket frame")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-180;zoomy,0;diffusealpha,0.8;sleep,0.000;);
	OnCommand=cmd(sleep,0.333;decelerate,0.133;zoomy,1.07;diffusealpha,0.8;accelerate,0.033;zoomx,1.12;decelerate,0.033;zoomx,1.07);
	OffCommand=cmd(sleep,0.0000;sleep,0.333;decelerate,0.066;zoom,1.05;diffusealpha,0);
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(Center);
	OnCommand=cmd(zoomy,0;sleep,0.333;linear,0.4;zoomy,1);
	LoadActor("judgement frame");
};

t[#t+1] = Def.ActorFrame{
	LoadActor("score")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+228);
	};
};

t[#t+1] = LoadActor("../grade")..{
	OnCommand=cmd(play);
};

if ShowStandardDecoration("StepsDisplay") then
	for pn in ivalues(PlayerNumber) do
		local t2 = Def.StepsDisplay {
			InitCommand=cmd(Load,"StepsDisplayEvaluation",pn;SetFromGameState,pn;);
			UpdateNetEvalStatsMessageCommand=function(self,param)
				if GAMESTATE:IsPlayerEnabled(pn) then
					self:SetFromSteps(param.Steps)
				end;
			end;
		};
		t[#t+1] = StandardDecorationFromTable( "StepsDisplay" .. ToEnumShortString(pn), t2 );
	end
end


t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(xy,SCREEN_CENTER_X-180,SCREEN_CENTER_Y-180);
	Def.Sprite {
		OnCommand=function(self)
			if not GAMESTATE:IsCourseMode() then
				local song = GAMESTATE:GetCurrentSong();
				if song:HasJacket() then
					self:LoadBackground(song:GetJacketPath());
				elseif song:HasBackground() then
					self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
				else
					self:Load(THEME:GetPathG("","Common fallback jacket"));
				end;
				self:scaletoclipped( 102,102 );
				(cmd(zoomy,0;diffusealpha,0.8;sleep,0.333;decelerate,0.133;zoomy,1;diffusealpha,1;accelerate,0.033;zoomx,1.06;decelerate,0.033;zoomx,1))(self);
			else
				local course = GAMESTATE:GetCurrentCourse();
				if course:HasBanner() then
					self:LoadBackground(course:GetBannerPath());
				end;
				self:scaletoclipped( 102,102 );
				(cmd(zoomy,0;diffusealpha,0.8;sleep,0.333;decelerate,0.133;zoomy,1;diffusealpha,1;accelerate,0.033;zoomx,1.06;decelerate,0.033;zoomx,1))(self);
			end
		end;
		OffCommand=cmd(sleep,0.333;decelerate,0.066;zoom,1.05;diffusealpha,0);
	};
};

t[#t+1] = Def.ActorFrame {
	Condition=GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2();
	InitCommand=cmd(draworder,105);
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra1" ) ) .. {
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		OnCommand=cmd(play);
	};
};
t[#t+1] = LoadActor("grade")..{
	InitCommand=cmd(diffusealpha,1;addy,-80;draworder,0;);
	OffCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
};

--StatsP1--
t[#t+1] = LoadActor("statsP1")..{
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);addy,0;zoom,1.2575;x,SCREEN_CENTER_X-140;diffusealpha,0);
	OffCommand=cmd(sleep,0.0;linear,0.2;diffusealpha,0);
	OnCommand=function(self)
			self:diffusealpha(1);
	end;
	};
--StatsP2--
t[#t+1] = LoadActor("statsP2")..{
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);addy,0;zoom,1.2575;x,SCREEN_CENTER_X+140;diffusealpha,0);
	OffCommand=cmd(sleep,0.0;linear,0.2;diffusealpha,0);
	OnCommand=function(self)
			self:diffusealpha(1);
	end;
	};

	--Score
	t[#t+1] = Def.RollingNumbers {
				File = THEME:GetPathF("_sveningsson Bold", "60px");
				InitCommand=cmd(diffuse,Color("Yellow");strokecolor,color("#463e00");x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y+228;zoom,0.5;player,PLAYER_1;playcommand,"Set");
				SetCommand = function(self)
					local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore();
					self:Load("RollingNumbersEvaluation");
					self:targetnumber(score);
				end;
				OffCommand=cmd(sleep,0.067;zoom,0);
			};
	t[#t+1] = Def.RollingNumbers {
				File = THEME:GetPathF("_sveningsson Bold", "60px");
				InitCommand=cmd(diffuse,Color("Yellow");strokecolor,color("#463e00");x,SCREEN_CENTER_X+320;y,SCREEN_CENTER_Y+228;zoom,0.5;player,PLAYER_2;playcommand,"Set");
				SetCommand = function(self)
					local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetScore();
					self:Load("RollingNumbersEvaluation");
					self:targetnumber(score);
				end;
				OffCommand=cmd(sleep,0.067;zoom,0);
			};


return t
