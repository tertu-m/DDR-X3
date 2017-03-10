local t= Def.ActorFrame{};

t[#t+1] = Def.Actor{
	OnCommand=function(self)
		if GAMESTATE:GetNumPlayersEnabled() == 1 then
			GAMESTATE:SetCurrentStyle("single");
		elseif GAMESTATE:GetNumPlayersEnabled() == 2 then
			GAMESTATE:SetCurrentStyle("versus");
		end;
	end;
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+30);
	LoadActor("base");
	Def.Sprite{
		EASYMessageCommand=function(s) s:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/easytext")) end,
		NORMMessageCommand=function(s) s:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/normtext")) end,
		HARDMessageCommand=function(s) s:Load(THEME:GetPathB("","Screen2ndMIXSelectGameMode decorations/hardtext")) end,
	};
};

t[#t+1] = Def.ActorFrame{
	LoadActor("1P")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X-420,SCREEN_CENTER_Y+114;visible,false);
		OnCommand=function(s) if GAMESTATE:IsPlayerEnabled(PLAYER_1) then s:visible(true) else s:visible(false) end; end;
	};
};

t[#t+1] = Def.ActorFrame{
	LoadActor("basic")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+220);
	};
};

return t
