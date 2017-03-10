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
----------------------------------------------------------------------------
return Def.ActorFrame {
	InitCommand=cmd(Center);
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
		(cmd(diffusealpha,0;sleep,0.000;sleep,3.743;diffuse,color("0.2,0.2,0.2,1")
		;zoom,1;addx,-600;linear,0.2;zoomx,1;addx,600;linear,0.1;sleep,0
		;diffuse,color("0.2,0.2,0.2,1");linear,0.3;zoom,0.97;))(self)
	end;
	};
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
		(cmd(diffusealpha,0;sleep,0.000;sleep,3.743;diffusealpha,1;zoom,1;addx,600;linear,0.2;zoomx,1;addx,-600;linear,0.1;sleep,0;diffuse,1,1,1,1;linear,0.3;zoom,0.97;))(self)
	end;
	};
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
		(cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.000;sleep,3.743;diffusealpha,0;zoom,1;addx,600;linear,0.2;zoomx,1;addx,-600;linear,0.1;diffusealpha,1;linear,0.5;zoom,0.97;diffusealpha,0;))(self)
	end;
	};
};
