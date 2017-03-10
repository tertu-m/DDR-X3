local xPosPlayer = {
    P1 = (WideScale(-175,-240)),
    P2 = (WideScale(175,240))
}

local xPosPlayerRave = {
	P1 = -(640/6.7),
    P2 = (640/6.7)
};

local t = Def.ActorFrame{}
t[#t+1] = LoadActor("flicker")
for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("MIX")..{
		Name = pn,
		InitCommand=function(self)
			local short = ToEnumShortString(pn)
			self:x(xPosPlayer[short])
			self:halign(0.5)
		end,
		OnCommand=function(s) s:zoomx(pn=='PlayerNumber_P2' and -1 or 1) end,
	};
end;

--Player 1 Risky Splitter
if GAMESTATE:IsPlayerEnabled('PlayerNumber_P1') then
t[#t+1] = LoadActor("splitter")..{
	InitCommand=function(self)
		self:x(-(SCREEN_WIDTH/5.7)):skewx(WideScale(-1.5,-0.9)):zoomto((SCREEN_WIDTH/2.54),14):halign(0.75);
	end;
	BeginCommand=function(self,param)
		if GAMESTATE:PlayerIsUsingModifier('PlayerNumber_P1','battery') or GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
			self:visible(true);
		else
			self:visible(false);
		end;
	end;
};
end;

--Player 2 Risky Splitter
if GAMESTATE:IsPlayerEnabled('PlayerNumber_P2') then
t[#t+1] = LoadActor("splitter")..{
	InitCommand=function(self)
		self:x((SCREEN_WIDTH/5.7)):skewx(WideScale(1.5,0.9)):zoomto((SCREEN_WIDTH/2.54),14):halign(0.25);
	end;
	BeginCommand=function(self,param)
		if GAMESTATE:PlayerIsUsingModifier('PlayerNumber_P2','battery') or GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
			self:visible(true);
		else
			self:visible(false);
		end;
	end;
};
end;

--Player 1 Danger
t[#t+1] = LoadActor("danger 2x1")..{
		InitCommand=cmd(x,WideScale(-160,-213.5);visible,false);
		HealthStateChangedMessageCommand=function(self, param)
			if GAMESTATE:IsPlayerEnabled('PlayerNumber_P1') then
				if param.HealthState == "HealthState_Danger" then
					self:visible(true);
				else
					self:visible(false);
				end;
			end;
		end;
};
--Player 2 Danger
t[#t+1] = LoadActor("danger 2x1")..{
		InitCommand=cmd(x,WideScale(160,213.5);visible,false);
		HealthStateChangedMessageCommand=function(self, param)
			if GAMESTATE:IsPlayerEnabled('PlayerNumber_P2') then
				if param.HealthState == "HealthState_Danger" then
					self:visible(true);
				else
					self:visible(false);
				end;
			end;
		end;
};


return t
