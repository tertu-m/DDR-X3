local t = Def.ActorFrame{
		-- Def.Quad{
		-- InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		-- OnCommand=cmd(linear,5;diffusealpha,1);
	-- };

	-- Cleared song --
    LoadActor("../ClearedSong.mp3") .. {
		StartTransitioningCommand=cmd(play);
	};
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center);
  OnCommand=cmd(vibrate;effectmagnitude,2,4,0;sleep,0.3;queuecommand,"StopThat");
  StopThatCommand=cmd(stopeffect);
  LoadActor(THEME:GetPathB("","Common doors/door 3.png"))..{
    OnCommand=cmd(zoom,0;rotationz,180;sleep,2.178;zoom,0.0;rotationz,90;sleep,0.098;zoom,1;rotationz,0);
  };
  LoadActor(THEME:GetPathB("","Common doors/door 4.png"))..{
	   OnCommand=cmd(zoom,0;rotationz,180;sleep,2.180;zoom,0.0;rotationz,90;sleep,0.1;zoom,1;rotationz,0);
	};
  LoadActor(THEME:GetPathB("","Common doors/door 5.png"))..{
	   OnCommand=cmd(zoom,0;rotationz,-180;sleep,2.185;zoom,0.0;rotationz,-90;sleep,0.1;zoom,1;rotationz,0);
	};
  LoadActor(THEME:GetPathB("","Common doors/door 2.png"))..{
	 OnCommand=cmd(rotationz,-180;zoom,0;sleep,2.180;zoom,1.2;rotationz,-90;linear,0.1;zoom,1;rotationz,0);
	};
  LoadActor(THEME:GetPathB("","Common doors/door 1.png"))..{
	 OnCommand=cmd(rotationz,0;zoom,2;sleep,1;linear,1;zoom,1.2;rotationz,0;linear,0.085;zoom,1;rotationz,0);
	};
};
	--------CLEARED-----------
t[#t+1] = Def.ActorFrame{
--Cleared--
	LoadActor("Cleared") .. {
	InitCommand=function(self)
		local Song;
		if GAMESTATE:IsCourseMode() then
			song = GAMESTATE:GetCurrentCourse();
		else
			song = GAMESTATE:GetCurrentSong();
		end;
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_CENTER_Y);
			if song:GetDisplayFullTitle() == "Tohoku EVOLVED" then
				self:visible(false);
			else
				self:visible(true);
		end;
	end;
	};
--tohoku--
	LoadActor("Tohoku") .. {
	InitCommand=function(self)
	if not GAMESTATE:IsCourseMode() then
		local song = GAMESTATE:GetCurrentSong();
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_CENTER_Y);
			if song:GetDisplayFullTitle() == "Tohoku EVOLVED" then
				self:visible(true);
			else
				self:visible(false);
		end;
	else
		self:diffusealpha(0);
	end;
	end;
	};

};

return t;
