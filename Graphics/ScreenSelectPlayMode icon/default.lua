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
    LoadActor("preview " .. gc:GetName() ) .. {
	InitCommand=cmd(x,0;y,30);
	OnCommand=cmd();
	GainFocusCommand=cmd(stoptweening;decelerate,0.125;zoom,0.9;diffuse,1,1,1,1;y,SCREEN_CENTER_Y-350);
	LoseFocusCommand=cmd(stoptweening;decelerate,0.125;zoom,0.7;diffuse,0.5,0.5,0.5,1;y,SCREEN_CENTER_Y-400);
	};
};

return t;