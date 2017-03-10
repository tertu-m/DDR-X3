local t = Def.ActorFrame {};

local Combo = 	STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):MaxCombo();

local Marvelous = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W1");
local Perfect = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W2");
local Great = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W3");
local Good = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_W4");
local Ok = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetHoldNoteScores("HoldNoteScore_Held");
local Miss = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetTapNoteScores("TapNoteScore_Miss");

local Score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetScore();

--Max Combo--

t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("_helveticaneuelt pro 65 md", "20px");
			InitCommand=cmd(player,PLAYER_2;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,0.8;draworder,5;y,SCREEN_CENTER_Y+70;horizalign,center);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Combo);
			end;
			OffCommand=cmd(sleep,0.067;zoom,0);
		};
--Marvelous--
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("_helveticaneuelt pro 65 md", "20px");
			InitCommand=cmd(player,PLAYER_2;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,0.8;draworder,6;y,SCREEN_CENTER_Y-88;horizalign,center);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Marvelous);
			end;
		};
--Perfect--
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("_helveticaneuelt pro 65 md", "20px");
			InitCommand=cmd(player,PLAYER_2;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,0.8;draworder,6;y,SCREEN_CENTER_Y-62;horizalign,center);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Perfect);
			end;
		};
--Great--
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("_helveticaneuelt pro 65 md", "20px");
			InitCommand=cmd(player,PLAYER_2;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,0.8;draworder,6;y,SCREEN_CENTER_Y-35;horizalign,center);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Great);
			end;
		};
--Good--
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("_helveticaneuelt pro 65 md", "20px");
			InitCommand=cmd(player,PLAYER_2;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,0.8;draworder,6;y,SCREEN_CENTER_Y-8;horizalign,center);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Good);
			end;
		};
--Ok--
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("_helveticaneuelt pro 65 md", "20px");
			InitCommand=cmd(player,PLAYER_2;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,0.8;draworder,6;y,SCREEN_CENTER_Y+18;horizalign,center);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Ok);
			end;
		};
--Miss--(Miss)
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("_helveticaneuelt pro 65 md", "20px");
			InitCommand=cmd(player,PLAYER_2;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,0.8;draworder,6;y,SCREEN_CENTER_Y+44;horizalign,center);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Miss);
			end;
		};

return t;
