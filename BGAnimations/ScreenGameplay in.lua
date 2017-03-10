local playMode = GAMESTATE:GetPlayMode()
if playMode ~= 'PlayMode_Regular' and playMode ~= 'PlayMode_Rave' and playMode ~= 'PlayMode_Battle' then
	curStage = playMode;
end;
local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;
local t = Def.ActorFrame {};
t[#t+1] =Def.ActorFrame{
	LoadActor(THEME:GetPathB("","doors open"));
};

--song jacket--
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-20);
	Def.Quad{
		OnCommand=function(self)
			self:setsize(464,464);
			self:diffuse(color("0,0,0,1"));
			self:zoom(1);
			self:sleep(0.2)
			self:linear(0.05);
			self:zoomx(1.5);
			self:zoomy(0);
		end;
	};
	Def.Sprite {
		OnCommand=function (self)
			local course = GAMESTATE:GetCurrentCourse();
			if GAMESTATE:IsCourseMode() then
				if course:GetBackgroundPath() then
					self:Load(course:GetBackgroundPath())
					self:setsize(460,460);
				else
					self:Load(THEME:GetPathG("", "Common fallback jacket"));
					self:setsize(460,460);
				end;
			else
			local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:diffusealpha(1);
						self:LoadBackground(song:GetJacketPath());
						self:setsize(460,460);
					elseif song:HasBackground() then
						self:diffusealpha(1);
						self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
						self:setsize(460,460);
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:setsize(460,460);
					end;
				else
					self:diffusealpha(0);
			end;
			self:zoom(1);
			self:sleep(0.2)
			self:linear(0.05);
			self:zoomx(1.5);
			self:zoomy(0);
		end;
		end;
	};
};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(zoom,1;Center);
	Def.Sprite{
	OnCommand=function(self)
		if GAMESTATE:GetPlayMode() == 'PlayMode_Regular' or GAMESTATE:GetPlayMode() == 'PlayMode_Battle' or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			self:Load(THEME:GetPathG("_stages/ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ));
		elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
			self:Load(THEME:GetPathG("_stages/ScreenStageInformation", "Stage oni"));
		elseif GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
			self:Load(THEME:GetPathG("_stages/ScreenStageInformation", "Stage Nonstop"));
		elseif (GAMESTATE:Env()).EndlessState then
			self:Load(THEME:GetPathG("_stages/ScreenStageInformation", "Stage endless"));
		end;
		self:zoom(0.97);
		self:sleep(0.2)
		self:linear(0.05);
		self:zoomx(1.5);
		self:zoomy(0);
	end;
	};
};

return t;
