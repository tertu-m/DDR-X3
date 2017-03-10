local t = Def.ActorFrame {
	OnCommand=cmd(zoomy,0;sleep,0.2;accelerate,0.1;zoomy,1.1;decelerate,0.2;zoomy,1);
	OffCommand=cmd(sleep,0.2;accelerate,0.1;zoom,1.4;decelerate,0.1;zoom,0);
	--Main
	Def.Sprite{
		Name="Banner";
		InitCommand=cmd(scaletoclipped,256,256);
		SetCommand=function(self,param)
			local Song = param.Song;
			if Song then
				if Song:HasJacket() then
					self:Load(Song:GetJacketPath() );
				elseif Song:HasBackground() then
					self:Load(Song:GetBackgroundPath());
				elseif Song:HasBanner() then
					self:Load(Song:GetBannerPath());
				else
					self:Load(THEME:GetPathG("","Common fallback Jacket"));
				end;
			end;
		end;
	};
	Def.Sprite{
		Name="BannerReflection";
		InitCommand=cmd(scaletoclipped,256,256;y,256;rotationx,180;croptop,0.5;diffusealpha,0.6;diffusetopedge,1,1,1,0);
		SetCommand=function(self,param)
			local Song = param.Song;
			if Song then
				if Song:HasJacket() then
					self:Load(Song:GetJacketPath() );
				elseif Song:HasBackground() then
					self:Load(Song:GetBackgroundPath());
				elseif Song:HasBanner() then
					self:Load(Song:GetBannerPath());
				else
					self:Load(THEME:GetPathG("","Common fallback Jacket"));
				end;
			end;
		end;
	};
};
--[[for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
t[#t+1] = Def.ActorFrame{
	LoadActor("FullCombo")..{
		InitCommand=cmd(animate,false;diffusealpha,0;x,(pn=='PlayerNumber_P2' and 80 or -80);y,-138);
		CurrentSongChangedMessageCommand=cmd(queuecommand,"SetMessage");
		CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"SetMessage");
		CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"SetMessage");
		SetMessageCommand=function(self,params)
		local song = params.Song;
		local steps = GAMESTATE:GetCurrentSteps(pn);
		local diff = steps:GetDifficulty();
		local st=GAMESTATE:GetCurrentStyle():GetStepsType();
			if song and song:HasStepsTypeAndDifficulty(st,diff) then
				local steps = song:GetOneSteps(st,diff)
				if PROFILEMAN:IsPersistentProfile(pn) then
					profile = PROFILEMAN:GetProfile(pn);
				else
					profile = PROFILEMAN:GetMachineProfile(pn);
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
							if topscore:GetScore() > 0 then
								if (misses+boos) == 0 then
									if (goods+greats+perfects) == 0 then
										self:setstate(0)
										self:diffusealpha(1)
									elseif (goods+greats) == 0 then
										self:setstate(1)
										self:diffusealpha(1)
									elseif goods == 0 then
										self:setstate(2);
										self:diffusealpha(1)
									else
										self:setstate(3);
										self:diffusealpha(1)
									end;
								else
									self:setstate(4);
									self:diffusealpha(1)
								end;
							else
								self:setstate(5)
							end;
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
};
end;]]--

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	table.insert(t, WheelBadge(pn, true))
end

return t;
