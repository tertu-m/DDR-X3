local t = Def.ActorFrame{
	GainFocusCommand=function(s) MESSAGEMAN:Broadcast("HARD") s:draworder(3):linear(0.2):zoom(1):diffuse(color("1,1,1,1")); end;
	LoseFocusCommand=function(s) s:stoptweening():draworder(1):linear(0.2):zoom(0.75):diffuse(color("0.6,0.6,0.6,1")); end;
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;diffusealpha,0);
	-- Information panel
	--[[LoadActor("base");
	LoadActor("cone")..{
		InitCommand=cmd(visible,false);
		GainFocusCommand=cmd(visible,true;heartbeat;effectperiod,0.2);
		LoseFocusCommand=cmd(stopeffect;visible,false);
	};
	LoadActor("label")..{
		InitCommand=cmd(y,-5;zoom,0.8;);
	};
	LoadActor("label")..{
		InitCommand=cmd(y,-5;zoom,0.8;diffusealpha,0.25);
		GainFocusCommand=cmd(rainbow);
		LoseFocusCommand=cmd(stopeffect);
	};]]--
	LoadActor("HD");
};

return t;
