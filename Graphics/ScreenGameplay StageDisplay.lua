local curScreen = Var "LoadingScreen";
local curStageIndex = GAMESTATE:GetCurrentStageIndex() + 1;
local playMode = GAMESTATE:GetPlayMode();

local t = Def.ActorFrame {
	LoadFont("_helveticaneuelt pro 65 md Bold 24px") .. {
		InitCommand=cmd(playcommand,"Set");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTraiP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTraiP2ChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local curStage = GAMESTATE:GetCurrentStage();
			if GAMESTATE:IsCourseMode() then
				local stats = STATSMAN:GetCurStageStats()
				if not stats then
					return
				end
				local mpStats = stats:GetPlayerStageStats( GAMESTATE:GetMasterPlayerNumber() )
				local songsPlayed = mpStats:GetSongsPassed() + 1
				self:settextf("%i / %i", songsPlayed, GAMESTATE:GetCurrentCourse():GetEstimatedNumStages());
			else
				if GAMESTATE:IsEventMode() then
					self:settextf("%s", curStageIndex);
				else
					self:settextf("%s", ToEnumShortString(curStage));
				end
			end;
			self:zoom(0.7);
		end;
	};
};
return t
