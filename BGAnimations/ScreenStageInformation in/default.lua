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

t[#t+1] = Def.ActorFrame {
	---- DOOR OPEN > CLOSE  CLOSE > OPEN
	LoadActor(THEME:GetPathB("","doors close"));
	LoadActor(("DONK"))..{
		OnCommand=cmd(queuecommand,("Play"));
		PlayCommand=cmd(play;);
	};
	--- Flash SONG BANNER  sound------
	LoadActor("SoundStage") .. {
	};
};

--Jacket
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-20);
	Def.Quad{
		OnCommand=function(self)
			self:setsize(464,464);
			self:diffuse(color("0,0,0,1"));
			self:diffusealpha(0):zoom(4):sleep(1.455):linear(0.15)
			:diffusealpha(1):zoom(0.75):linear(0.1):zoom(1):linear(0.55):zoom(1)
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
			(cmd(diffusealpha,0;zoom,4;sleep,1.455;linear,0.15;diffusealpha,1;zoom,0.75;linear,0.1;zoom,1;linear,0.55;zoom,1;))(self)
		end;
		end;
	};
	Def.Quad{
		OnCommand=function(self)
			self:setsize(464,464)
			self:diffuse(color("0,0,0,1"))
			self:diffusealpha(0):zoom(4):sleep(1.455):linear(0.15):diffusealpha(0.5):zoom(0.75):linear(0.1):zoom(1):linear(0.3):diffusealpha(0):zoom(1.2):sleep(6)
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
						self:setsize(320,320);
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
				(cmd(diffusealpha,0;scaletoclipped,460,460;zoom,4;sleep,1.455;linear,0.15;diffusealpha,0.5;zoom,0.75;linear,0.1;zoom,1;linear,0.3;diffusealpha,0;zoom,1.2;sleep,6))(self)
			end;
			end;
	};
};

t[#t+1] = LoadActor("StageDisplay");

return t
