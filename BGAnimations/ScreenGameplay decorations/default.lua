local t = Def.ActorFrame{};

t[#t+1] = StandardDecorationFromFileOptional("StageFrame","StageFrame");
t[#t+1] = StandardDecorationFromFile("LifeFrame","LifeFrame")
t[#t+1] = StandardDecorationFromFile("ScoreFrame","ScoreFrame")

-- stage display (normal)
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")

local ScoringPlayers = {}

t[#t+1] = Def.Actor{
    Name="ScoringController",
    JudgmentMessageCommand = function(_,params)
        if not (( ScoringInfo[params.Player]) and
            (ScoringInfo.seed == GAMESTATE:GetStageSeed())) then
            SN2Scoring.PrepareScoringInfo(IsStarterMode())
            ScoringInfo.seed = GAMESTATE:GetStageSeed()
        end
        if not ScoringPlayers[params.Player] then
            ScoringPlayers[params.Player] = true
        end
        local es = (GAMESTATE:Env()).EndlessState
        if es then
            local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player)
            es.scoring.handleNoteScore(params.HoldNoteScore or params.TapNoteScore,
                GAMESTATE:GetCurrentStageIndex()+1,
                pss:GetCurrentCombo())
            --SCREENMAN:SystemMessage(es.scoring.getScoreString())
        end
    end,
}

local function ScoreUpdate()
    for pn, _ in pairs(ScoringPlayers) do
        local info = ScoringInfo[pn]
        local stage = GAMESTATE:IsCourseMode() and GAMESTATE:GetCourseSongIndex() + 1 or nil
        local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)
        local score = info.GetCurrentScore(pss, stage)
        pss:SetScore(score)
        local scoreDisplay = SCREENMAN:GetTopScreen():GetChild("Score"..ToEnumShortString(pn))
        if scoreDisplay then
            scoreDisplay:GetChild("Text"):targetnumber(score)
        end
        pss:SetCurMaxScore(info.GetCurrentMaxScore(pss, stage))
    end
end

t[#t+1] = Def.ActorFrame{
    Name = "ScoringController2",
    InitCommand = function(s) s:SetUpdateFunction(ScoreUpdate) end
}
--options--
t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P1") ) .. {
		InitCommand=cmd(player,PLAYER_1;zoomx,2;zoomy,1.5;x,WideScale(SCREEN_CENTER_X-221,SCREEN_CENTER_X-296);draworder,1);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
				self:y(SCREEN_CENTER_Y-276);
			else
				self:y(SCREEN_CENTER_Y+252);
			end;
		end;
	};
t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P2") ) .. {
	InitCommand=cmd(player,PLAYER_2;zoomx,2;zoomy,1.5;x,WideScale(SCREEN_CENTER_X+221,SCREEN_CENTER_X+296);draworder,1);
	OnCommand=function(self)
		if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
			self:y(SCREEN_CENTER_Y-276);
		else
			self:y(SCREEN_CENTER_Y+252);
		end;
	end;
};
t[#t+1] = LoadActor("Frame")..{
  InitCommand=cmd(player,PLAYER_1;halign,0;x,SCREEN_LEFT;draworder,100);
  OnCommand=function(self)
    if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
      self:y(SCREEN_CENTER_Y-301.5);
      self:rotationx(180);
    else
      self:y(SCREEN_CENTER_Y+275);
    end;
  end;
};

t[#t+1] = LoadActor("Frame")..{
  InitCommand=cmd(player,PLAYER_2;halign,0;x,SCREEN_RIGHT;zoomx,-1);
  OnCommand=function(self)
    if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
      self:y(SCREEN_CENTER_Y-301.5);
      self:rotationx(180);
    else
      self:y(SCREEN_CENTER_Y+275);
    end;
  end;
};


return t
