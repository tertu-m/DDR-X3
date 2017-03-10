local function LoadMetric(name, isBoolean)
	local metricValue = THEME:GetMetric("X2DifficultyList", name)
	assert(metricValue, "X2DifficultyList: can't load metric "..name)
	--only numbers and booleans are supported right now
	if isBoolean then
		return (metricValue == "true") or (metricValue=="1")
	else
		local n =tonumber(metricValue)
		assert(n, "SNDifficultyList: metric "..name.." must be a number")
		return n
	end
end

local hardColor = color "#FF0000"

local function DiffToColor(diff, dark)
	local color = CustomDifficultyToColor(ToEnumShortString(diff))
	if dark then
		return ColorDarkTone(color)
	else
		return color
	end
end

local function DiffBG( pn )
	if pn == PLAYER_1 then return color("#000058") end
	if pn == PLAYER_2 then return color("#580000") end
	return color("1,1,1,1")
end

--we need this function because we need to get the current Steps for non-human players.
--however, non-human players don't actually have a current Steps.
local function GetCurrentSteps(pn)
	if not GAMESTATE:IsHumanPlayer(pn) then
		return GAMESTATE:GetCurrentSteps(GAMESTATE:GetMasterPlayerNumber())
	end
	return GAMESTATE:GetCurrentSteps(pn)
end

local function AnyPlayerThisDiff(diff)
    for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
        if GetCurrentSteps(pn):GetDifficulty()==diff then return true end
    end
    return false
end

local function BothPlayersThisDiff(diff,self)
	if GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()==diff and GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty()==diff then return true end
	return false
end

local difficultiesToDraw = {
    'Difficulty_Beginner',
    'Difficulty_Easy',
    'Difficulty_Medium',
    'Difficulty_Hard',
    'Difficulty_Challenge'
}

local invDifficultiesToDraw = {}
for k, v in pairs(difficultiesToDraw) do
    invDifficultiesToDraw[v] = k
end

local function PlayerLabelName(pn)
	local name = GAMESTATE:IsHumanPlayer(pn) and string.lower(ToEnumShortString(pn)) or "cpu"
	return '../../Graphics/Badges/DIFF '..name
end


local startPos = LoadMetric "StartPositionY"
local itemSpacingY = LoadMetric "ItemSpacingY"
local scorePos = LoadMetric "ScorePositionX"
local tickPos = LoadMetric "TickPositionX"
local labelPos = LoadMetric "LabelPositionX"
local totWidth = LoadMetric "TotalWidth"
local plabelX = LoadMetric "PlayerLabelXOffset"

local lastSong = nil
local lastSteps = {PlayerNumber_P1=nil, PlayerNumber_P2=nil}

local function DiffToYPos(diff)
	if invDifficultiesToDraw[diff] == nil then return nil end
	return startPos + ( itemSpacingY*( invDifficultiesToDraw[diff]-1) )
end

local function SetXFromPlayerNumber(that, pn)
	if pn == 'PlayerNumber_P1' then
		that:x(-plabelX)
	elseif pn =='PlayerNumber_P2' then
		that:x(plabelX)
	end
end

local function SetXFromPlayerNumberScore(that, pn)
	if pn == 'PlayerNumber_P1' then
		that:x(-scorePos)
	elseif pn =='PlayerNumber_P2' then
		that:x(scorePos)
	end
end

local function Update(self, _)
	if GAMESTATE then
		local song = GAMESTATE:GetCurrentSong()
		local steps = {}
		local anyStepsChanged = false
		for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
			steps[pn] = GetCurrentSteps(pn)
			if steps[pn] ~= lastSteps[pn] then anyStepsChanged = true break end
		end
		local songChanged = song~=lastSong
		if songChanged or anyStepsChanged then
			MESSAGEMAN:Broadcast("SNDLUpdate", {SongChanged=songChanged, StepsChanged=anyStepsChanged})
		end
		lastSong = song
		lastSteps = steps
	end
end

local ret = Def.ActorFrame{InitCommand=function(self) self:xy(SCREEN_CENTER_X+154,SCREEN_CENTER_Y+170):queuecommand("On"):SetUpdateFunction(Update) end,
    OffCommand=function(self) self:sleep(0.5):visible(false) end}

local function IndicatorUpdate(self, pn)
    if not GAMESTATE:IsPlayerEnabled(pn) then return end
    self:finishtweening()
    local currentlyVisible = self:GetVisible()
    local steps = GetCurrentSteps(pn)
    if steps and GAMESTATE:GetCurrentSong() then
        if currentlyVisible then
            self:linear(0.1)
        end
        local yPos = DiffToYPos(steps:GetDifficulty())
        if yPos then
            self:visible(true)
            self:y(yPos)
            return
        end
    end
    self:visible(false)
end

local function ColorUpdate(self, pn)
    if not GAMESTATE:IsPlayerEnabled(pn) then return end
    self:finishtweening()
    local currentlyVisible = self:GetVisible()
    local steps = GetCurrentSteps(pn)
    if steps and GAMESTATE:GetCurrentSong() then
        if currentlyVisible then
            self:linear(0.2)
        end
        local yPos = DiffToYPos(steps:GetDifficulty())
        if yPos then
            self:visible(true)
            self:y(yPos)
            return
        end
    end
    self:visible(false)
end

local function AddContentsToOutput(tbl)
    for _, e in pairs(tbl) do
        table.insert(ret, e)
    end
end

do
    local indicatorBackgrounds = {}
    local indicatorLabels = {}
    for _, pn in pairs(PlayerNumber) do
        table.insert(indicatorBackgrounds, LoadActor("diffbg")..{
            Name='Background'..ToEnumShortString(pn),
						InitCommand=function(self)
							self:visible(false):diffuse(DiffBG(pn))
						end;
						OnCommand=cmd(diffusealpha,0;sleep,0.8;diffusealpha,1);
            SNDLUpdateMessageCommand=function(self)
							return IndicatorUpdate(self, pn)
						end
        })
        table.insert(indicatorLabels, Def.Sprite{
            Name='PlayerLabel',
            Texture=PlayerLabelName(pn),
            InitCommand=function(self) SetXFromPlayerNumber(self:visible(false), pn) self:zoom(0) end,
						OnCommand=function(self) self:zoom(0):sleep(0.4):linear(0.2):zoom(1):bounce():effectmagnitude(pn=='PlayerNumber_P2' and -4 or 4,0,0):effectclock('beatnooffset') end,
            SNDLUpdateMessageCommand=function(self) return IndicatorUpdate(self, pn) end,
            PlayerJoinedMessageCommand=function(self,p)
                if p.Player==pn then self:Load(ResolveRelativePath(PlayerLabelName(pn),1)) end
            end
        })
    end
    AddContentsToOutput(indicatorBackgrounds)
    AddContentsToOutput(indicatorLabels)
end

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
for idx, diff in pairs(difficultiesToDraw) do
	local element = Def.ActorFrame{
		OnCommand=cmd(diffusealpha,0;sleep,0.3;diffusealpha,1);
		Name = "Row"..diff,
		SNDLUpdateMessageCommand = function(self) for _, item in pairs(self:GetChildren()) do item:playcommand("Update") end end,
		InitCommand=function(self) self:y(DiffToYPos(diff) ) end,
		LoadFont("_helveticaneuelt pro 65 md Bold 24px")..{
			Name = "Label",
			Text=THEME:GetString("CustomDifficulty",ToEnumShortString(diff));
			InitCommand = function(self) self:setstate(idx-1):x(labelPos):wrapwidthpixels(5):strokecolor(color("0,0,0,1")):diffuse{0.5,0.5,0.5,1}:zoom(0.85) end,
			SNDLUpdateMessageCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					if AnyPlayerThisDiff(diff) then
						self:diffuse(DiffToColor(diff))
						self:zoom(0.9)
					elseif song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
						self:diffuse{0.5,0.5,0.5,1}
						self:zoom(0.86)
					else
						self:diffuse{0.5,0.5,0.5,0.5}
						self:zoom(0.86)
					end
				else
					self:diffuse{0.5,0.5,0.5,0.5}
					self:zoom(0.86)
				end
			end
		},
		LoadActor("StepsDisplay ticks")..{
			Name = "Foot";
			InitCommand = function(self) self:x(tickPos-25):diffuse{0.5,0.5,0.5,1} end,
			SNDLUpdateMessageCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					if AnyPlayerThisDiff(diff) then
						self:diffuse(DiffToColor(diff))
						self:zoom(1.1)
					elseif song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
						self:diffuse{0.5,0.5,0.5,1}
						self:zoom(1)
					else
						self:diffuse{0.5,0.5,0.5,0.5}
						self:zoom(1)
					end
				else
					self:diffuse{0.5,0.5,0.5,0.5}
					self:zoom(1)
				end
			end
		},
		Def.RollingNumbers {
			Font="_helveticaneuelt pro 65 md 20px";
			InitCommand=function(self) self:x(tickPos):Load("RollingNumbersMeter"):strokecolor(color("0,0,0,1")):diffuse{0.5,0.5,0.5,1}:zoom(1.1) end,
			SNDLUpdateMessageCommand=function(self, params)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					local steps = song:GetOneSteps(GAMESTATE:GetCurrentStyle():GetStepsType(), diff)
					if steps then
						local meter = steps:GetMeter()
						if AnyPlayerThisDiff(diff) then
							self:diffuse(DiffToColor(diff))
							self:targetnumber(meter)
							self:Load("RollingNumbersMeter")
						elseif song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
							self:diffuse{0.5,0.5,0.5,1}
							self:targetnumber(meter)
							self:Load("RollingNumbersMeter")
						end
					else
						self:diffuse{0.5,0.5,0.5,0.5}
						self:targetnumber(0)
						self:Load("RollingNumbersMeterNoDiff")
					end
				else
					self:diffuse{0.5,0.5,0.5,0.5}
					self:targetnumber(0)
				end
			end
		},
		Def.RollingNumbers {
		Font = "_helveticaneuelt pro 65 md 20px";
			InitCommand=function(self)
				SetXFromPlayerNumberScore(self:visible(false), pn) self:Load("RollingNumbersSongData"):visible(false):strokecolor(color("0,0,0,1"))
			end;
			OffCommand=cmd(decelerate,0.05;zoom,0;);
			SNDLUpdateMessageCommand=function(self, params)
				local song = GAMESTATE:GetCurrentSong()
				local st=GAMESTATE:GetCurrentStyle():GetStepsType()
				if song and song:HasStepsTypeAndDifficulty(st,diff) then
					local steps = song:GetOneSteps(st,diff)
					if PROFILEMAN:IsPersistentProfile(pn) then
						profile = PROFILEMAN:GetProfile(pn);
					else
						profie = PROFILEMAN:GetMachineProfile();
					end;

					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist)
					local scores = scorelist:GetHighScores();
					if scores[1] then
						topscore = scores[1]:GetScore()
					else
						topscore = 0;
					end;
					assert(topscore)
					if topscore ~= 0 then
						if AnyPlayerThisDiff(diff) then
							self:visible(true)
							self:targetnumber(topscore)
						elseif song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
							self:visible(true)
							self:targetnumber(topscore)
						else
							self:visible(false)
							self:targetnumber(0)
						end;
					else
						self:visible(false)
					end;
				else
					self:visible(false)
				end
			end;
		};
		Def.Quad{
			InitCommand=function(self) SetXFromPlayerNumberScore(self:visible(false), pn) self:visible(false):addx(pn=='PlayerNumber_P2' and -72 or 72):zoom(0.3) end,
			SNDLUpdateMessageCommand=function(self, params)
				local song = GAMESTATE:GetCurrentSong()
				local st=GAMESTATE:GetCurrentStyle():GetStepsType()
				if song and song:HasStepsTypeAndDifficulty(st,diff) then
					local steps = song:GetOneSteps(st,diff)
					if PROFILEMAN:IsPersistentProfile(pn) then
						profile = PROFILEMAN:GetProfile(pn);
					else
						profile = PROFILEMAN:GetMachineProfile();
					end;
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[1] then
						topscore = scores[1]:GetScore();
					end
					assert(topscore);
					local topgrade;
					if scores[1] then
						topgrade = scores[1]:GetGrade();
						assert(topgrade);
						if scores[1]:GetScore()>1 then
							if scores[1]:GetScore()==1000000 and topgrade=="Grade_Tier07" then
								self:Load(THEME:GetPathG("myMusicWheel/myMusicWheel","Tier01"));
								self:visible(true)
							else
								self:Load(THEME:GetPathG("myMusicWheel/myMusicWheel",ToEnumShortString(topgrade)));
								self:visible(true)
							end;
						else
							self:visible(false)
						end;
					else
						self:visible(false)
					end;
				else
					self:visible(false)
				end
			end;
		},
		--FC Badge
		LoadActor(THEME:GetPathG("myMusicWheel/Player","Badge FullCombo"))..{
			InitCommand=function(self) SetXFromPlayerNumberScore(self:diffusealpha(0), pn) self:diffusealpha(0):addx(pn=='PlayerNumber_P2' and -80 or 80):addy(-8):zoom(0.25) end,
			SNDLUpdateMessageCommand=function(self, params)
				local song = GAMESTATE:GetCurrentSong()
				local st=GAMESTATE:GetCurrentStyle():GetStepsType()
				if song and song:HasStepsTypeAndDifficulty(st,diff) then
					local steps = song:GetOneSteps(st,diff)
					if PROFILEMAN:IsPersistentProfile(pn) then
						profile = PROFILEMAN:GetProfile(pn);
					else
						profile = PROFILEMAN:GetMachineProfile();
					end;
					scorelist = profile:GetHighScoreList(song,steps);
					assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore;

					local temp=#scores;
					if scores[1] then
						for i=1, temp do

							if scores[i] then
								topscore = scores[i];
								assert(topscore);
								local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
												+topscore:GetTapNoteScore("TapNoteScore_HitMine")+topscore:GetHoldNoteScore("HoldNoteScore_LetGo")
								local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
								local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
								local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
								local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
								local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
								if (misses+boos+goods) == 0 and scores[i]:GetScore() > 0 and (marvelous+perfects)>0 then
									if (greats+perfects) == 0 then
										self:diffuse(GameColor.Judgment["JudgmentLine_W1"]);
										self:glowblink();
										self:effectperiod(0.20);
										--self:zoom(0.25);
										break;
									elseif greats == 0 then
										self:diffuse(GameColor.Judgment["JudgmentLine_W2"]);
										self:stopeffect();
										--self:zoom(0.25);
										break;
									else
										self:diffuse(BoostColor(GameColor.Judgment["JudgmentLine_W3"],0.75));
										self:stopeffect();
										--self:zoom(0.25);
										if i==1 then
											self:diffuse(BoostColor(GameColor.Judgment["JudgmentLine_W3"],1));
										end;
										break;
									end;
									self:diffusealpha(0.8);
								else
									self:diffusealpha(0);

								end;
							else
								self:diffusealpha(0);
								break;
							end;
						end;
					else
						self:diffusealpha(0);
					end;
				else
					self:diffusealpha(0);
				end;
			end;
		};
	}
	table.insert(ret, element)
end
end

return ret
