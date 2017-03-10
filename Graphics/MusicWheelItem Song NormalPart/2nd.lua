local t = Def.ActorFrame {};

local CDImage = {
	["Boys"]= "01",
	["Butterfly"]= "02",
	["I Believe In Miracles (The Lisa Marie Experience Radio Edit)"]= "03",
	["Little Bitch"]= "04",
	["MAKE IT BETTER"]= "05",
	["PARANOiA"]= "06",
	["PARANOiA MAX～DIRTY MIX～"]= "07",
	["PARANOiA MAX~DIRTY MIX~ (in roulette)"]= "07",
	["PUT YOUR FAITH IN ME"]= "08",
	["AM-3P"]= "09",
	["stomp to my beat"]= "10",
	["TRIP MACHINE"]= "11",
	["EL RITMO TROPICAL"]= "12",
	["BRILLIANT 2U"]= "13",
	["BAD GIRLS"]= "14",
	["Boom Boom Dollar (Red Monster Mix)"]= "15",
	["DUB-I-DUB"]= "16",
	["SP-TRIP MACHINE~JUNGLE MIX~"]= "17",
	["Have You Never Been Mellow"]= "18",
	["KUNG FU FIGHTING"]= "19",
	["My Fire (UKS Remix)"]= "20",
	["LET'S GET DOWN"]= "21",
	["That's The Way (I Like It)"]= "22",
	["PUT YOUR FAITH IN ME (Jazzy Groove)"]= "24",
	["BRILLIANT 2U(Orchestra Groove)"]= "25",
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(zoom,0.75);
	LoadActor("cd/cd_mask")..{
		InitCommand=cmd(blend,Blend.NoEffect;zwrite,1;clearzbuffer,true;);
	};
	Def.Banner{
		Name="SongCD";
		SetMessageCommand=function(self,params)
			self:ztest(1)
			local song = params.Song;
			if song then
				local songtit = params.Song:GetDisplayMainTitle();
				if songtit == CDImage then
					local diskImage = CDImage[songtit];
					self:Load(THEME:GetPathG("","MusicWheelItem Song NormalPart/cd/"..diskImage));
				else
				--Fallback to Jacket/BG or just load the fallback cd.
					--Verify Jacket
					if song:HasJacket() then
						self:Load(song:GetJacketPath());
						self:setsize(256,256);
						self:diffusealpha(1);
					elseif song:HasBackground() then
						--Verify BG
						self:Load(song:GetBackgroundPath());
				 		self:setsize(256,256);
						self:diffusealpha(1);
					else
						--Fallback CD
						self:Load(THEME:GetPathG("", "MusicWheelItem Song NormalPart/cd/fallback"));
					end;
				end;
			end;
		end;
	};

	--Overlay
	Def.ActorFrame{
		Name="CdOver";
		InitCommand=cmd();
		LoadActor(THEME:GetPathG("", "MusicWheelItem Song NormalPart/cd/overlay"))..{};
	};

};

return t;
