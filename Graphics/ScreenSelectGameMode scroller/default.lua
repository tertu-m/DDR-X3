local t = Def.ActorFrame {};
local gc = Var("GameCommand");
local max_stages = PREFSMAN:GetPreference( "SongsPerPlay" );
local index = gc:GetIndex();
local c = 0;
if index == 0 then
	c = 1;
elseif index == 1 then
	c = 1;
elseif index == 2 then
	c = 0;
elseif index == 3 then
	c = 0;
elseif index == 4 then
	c = 0;
end
--------------------------------------
t[#t+1] = Def.ActorFrame {
	GainFocusCommand=function(s) s:linear(0.2):zoom(1):diffuse(color("1,1,1,1")); end;
	LoseFocusCommand=function(s) s:finishtweening():linear(0.2):zoom(0.75):diffuse(color("0.6,0.6,0.6,1")); end;
  LoadActor("preview " .. gc:GetName() ) .. {
		OnCommand=cmd();
		OffCommand=cmd();
	};
};

return t;
