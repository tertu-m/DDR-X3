local group;

local t = Def.ActorFrame{
	OnCommand=cmd(zoomy,0;sleep,0.2;accelerate,0.1;zoomy,1.1;decelerate,0.2;zoomy,1);
	OffCommand=cmd(sleep,0.2;accelerate,0.1;zoom,1.4;decelerate,0.1;zoom,0);
Def.Banner {
		Name="SongBanner";
		InitCommand=cmd(scaletoclipped,220,220);
		SetMessageCommand=function(self,params)
					group = params.Text;
		local so = GAMESTATE:GetSortOrder();
			if group then
				if so =="SortOrder_Genre" then
					if group == "Pop" or group == "POP"  or group == "Pop" then
						self:Load(THEME:GetPathG("_group jackets/group jacket","Pop"));
					elseif group == "Anime/Game"  or group == "AnimeGame"  or group == "Anime"  or group == "Game" then
						self:Load(THEME:GetPathG("_group jackets/group jacket","AnimeGame"));
					elseif group == "Variety" then
						self:Load(THEME:GetPathG("_group jackets/group jacket","Variety"));
					elseif group == "GUMI 5th anniversary"  or group == "GUMI" then
						self:Load(THEME:GetPathG("_group jackets/group jacket","GUMI"));
					elseif group == "U.M.U. x BEMANI" or group == "UMU" then
						self:Load(THEME:GetPathG("_group jackets/group jacket","UMU"));
					elseif group == "KONAMI originals" or group == "KONAMI" then
						self:Load(THEME:GetPathG("_group jackets/group jacket","KONAMI"));

					elseif group == "beatmania IIDX" or group == "beatmaniaIIDX" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","IIDX"));
					elseif group == "pop'n music" or group == "popn music" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","popn"));
					elseif group == "GITADORA" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","GITADORA"));
					elseif group == "jubeat" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","jubeat"));
					elseif group == "REFLEC BEAT" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","RB"));
					elseif group == "Dance Evolution" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","DanceEvolution"));
					elseif group == "SOUND VOLTEX" or group == "SDVX" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","SDVX"));
					elseif group == "FutureTomTom" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","FutureTomTom"));
					elseif group == "DDR" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","DDR"));
					elseif group == "BEMANI Academy" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","BEMANI Academy"));
					elseif group == "BEMANI STADIUM" or group == "BEMANI Stadium" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","BEMANI STADIUM"));
					elseif group == "HinaBitter" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","HinaBitter"));
					elseif group == "BEMANI x TOHO project" or group == "BEMANI x TOHO" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","BEMANI x TOHO project"));
					elseif group == "Dancemania" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","Dancemania"));
					elseif group == "Electronic" or group == "Electronics" then
						self:Load(THEME:GetPathG("_group jackets/group jacket series","Electronic"));
					elseif group=='N/A' or group=='- EMPTY -'then
						self:Load(THEME:GetPathG("_group jackets/group global","NA"));
					else
						self:Load( THEME:GetPathG("_group jackets/group jacket","NA") );
					end
				elseif string.find(so,"Meter") then
					if group=='01' then
						self:Load(THEME:GetPathG("_group jackets/group diff","01"));
					elseif group=='02' then
						self:Load(THEME:GetPathG("_group jackets/group diff","02"));
					elseif group=='03' then
						self:Load(THEME:GetPathG("_group jackets/group diff","03"));
					elseif group=='04' then
						self:Load(THEME:GetPathG("_group jackets/group diff","04"));
					elseif group=='05' then
						self:Load(THEME:GetPathG("_group jackets/group diff","05"));
					elseif group=='06' then
						self:Load(THEME:GetPathG("_group jackets/group diff","06"));
					elseif group=='07' then
						self:Load(THEME:GetPathG("_group jackets/group diff","07"));
					elseif group=='08' then
						self:Load(THEME:GetPathG("_group jackets/group diff","08"));
					elseif group=='09' then
						self:Load(THEME:GetPathG("_group jackets/group diff","09"));
					elseif group=='10' then
						self:Load(THEME:GetPathG("_group jackets/group diff","10"));
					elseif group=='11' then
						self:Load(THEME:GetPathG("_group jackets/group diff","11"));
					elseif group=='12' then
						self:Load(THEME:GetPathG("_group jackets/group diff","12"));
					elseif group=='13' then
						self:Load(THEME:GetPathG("_group jackets/group diff","13"));
					elseif group=='14' then
						self:Load(THEME:GetPathG("_group jackets/group diff","14"));
					elseif group=='15' then
						self:Load(THEME:GetPathG("_group jackets/group diff","15"));
					elseif group=='16' then
						self:Load(THEME:GetPathG("_group jackets/group diff","16"));
					elseif group=='17' then
						self:Load(THEME:GetPathG("_group jackets/group diff","17"));
					elseif group=='18' then
						self:Load(THEME:GetPathG("_group jackets/group diff","18"));
					elseif group=='19' then
						self:Load(THEME:GetPathG("_group jackets/group diff","19"));
					elseif group=='20' then
						self:Load(THEME:GetPathG("_group jackets/group diff","20"));
					else
						self:Load( THEME:GetPathG("_group jackets/group diff","NA") );
					end
				else
					if group=='A' then
						self:Load(THEME:GetPathG("_group jackets/group title","A"));
					elseif group=='B' then
						self:Load(THEME:GetPathG("_group jackets/group title","B"));
					elseif group=='C' then
						self:Load(THEME:GetPathG("_group jackets/group title","C"));
					elseif group=='D' then
						self:Load(THEME:GetPathG("_group jackets/group title","D"));
					elseif group=='E' then
						self:Load(THEME:GetPathG("_group jackets/group title","E"));
					elseif group=='F' then
						self:Load(THEME:GetPathG("_group jackets/group title","F"));
					elseif group=='G' then
						self:Load(THEME:GetPathG("_group jackets/group title","G"));
					elseif group=='H' then
						self:Load(THEME:GetPathG("_group jackets/group title","H"));
					elseif group=='I' then
						self:Load(THEME:GetPathG("_group jackets/group title","I"));
					elseif group=='J' then
						self:Load(THEME:GetPathG("_group jackets/group title","J"));
					elseif group=='K' then
						self:Load(THEME:GetPathG("_group jackets/group title","K"));
					elseif group=='L' then
						self:Load(THEME:GetPathG("_group jackets/group title","L"));
					elseif group=='M' then
						self:Load(THEME:GetPathG("_group jackets/group title","M"));
					elseif group=='N' then
						self:Load(THEME:GetPathG("_group jackets/group title","N"));
					elseif group=='O' then
						self:Load(THEME:GetPathG("_group jackets/group title","O"));
					elseif group=='P' then
						self:Load(THEME:GetPathG("_group jackets/group title","P"));
					elseif group=='Q' then
						self:Load(THEME:GetPathG("_group jackets/group title","Q"));
					elseif group=='R' then
						self:Load(THEME:GetPathG("_group jackets/group title","R"));
					elseif group=='S' then
						self:Load(THEME:GetPathG("_group jackets/group title","S"));
					elseif group=='T' then
						self:Load(THEME:GetPathG("_group jackets/group title","T"));
					elseif group=='U' then
						self:Load(THEME:GetPathG("_group jackets/group title","U"));
					elseif group=='V' then
						self:Load(THEME:GetPathG("_group jackets/group title","V"));
					elseif group=='W' then
						self:Load(THEME:GetPathG("_group jackets/group title","W"));
					elseif group=='X' then
						self:Load(THEME:GetPathG("_group jackets/group title","X"));
					elseif group=='Y' then
						self:Load(THEME:GetPathG("_group jackets/group title","Y"));
					elseif group=='Z' then
						self:Load(THEME:GetPathG("_group jackets/group title","Z"));
					elseif group=='0-9' then
						self:Load(THEME:GetPathG("_group jackets/group title","0-9"));


					elseif group=='000-019' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","000"));
					elseif group=='020-039' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","020"));
					elseif group=='040-059' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","040"));
					elseif group=='060-079' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","060"));
					elseif group=='080-099' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","080"));

					elseif group=='100-119' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","100"));
					elseif group=='120-139' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","120"));
					elseif group=='140-159' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","140"));
					elseif group=='160-179' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","160"));
					elseif group=='180-199' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","180"));

					elseif group=='200-219' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","200"));
					elseif group=='220-239' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","220"));
					elseif group=='240-259' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","240"));
					elseif group=='260-279' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","260"));
					elseif group=='280-299' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","280"));

					elseif group=='300-319' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","300"));
					elseif group=='320-339' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","320"));
					elseif group=='340-359' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","340"));
					elseif group=='360-379' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","360"));
					elseif group=='380-399' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","380"));

					elseif group=='400-419' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","400"));
					elseif group=='420-439' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","420"));
					elseif group=='440-459' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","440"));
					elseif group=='460-479' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","460"));
					elseif group=='480-499' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","480"));

					elseif group=='500-519' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","500"));
					elseif group=='520-539' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","520"));
					elseif group=='540-559' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","540"));
					elseif group=='560-579' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","560"));
					elseif group=='580-599' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","580"));

					elseif group=='600-619' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","600"));
					elseif group=='620-639' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","620"));
					elseif group=='640-659' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","640"));
					elseif group=='660-679' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","660"));
					elseif group=='680-699' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","680"));

					elseif group=='700-719' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","700"));
					elseif group=='720-739' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","720"));
					elseif group=='740-759' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","740"));
					elseif group=='760-779' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","760"));
					elseif group=='780-799' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","780"));

					elseif group=='800-819' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","800"));
					elseif group=='820-839' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","820"));
					elseif group=='840-859' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","840"));
					elseif group=='860-879' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","860"));
					elseif group=='880-899' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","880"));

					elseif group=='900-919' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","900"));
					elseif group=='920-939' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","220"));
					elseif group=='940-959' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","940"));
					elseif group=='960-979' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","960"));
					elseif group=='980-999' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","980"));

					elseif group=='1000-1019' then
						self:Load(THEME:GetPathG("_group jackets/group bpm","a1000"));

					elseif group=="AAAA x 9" or group=="AAAA x 8" or group=="AAAA x 7" or group=="AAAA x 6" or group=="AAAA x 5" or group=="AAAA x 4" or group=="AAAA x 3" or group=="AAAA x 2" or group=="AAAA x 1" then
						self:Load(THEME:GetPathG("_group jackets/group grade","3A"));
					elseif group==" AAA x 9" or group==" AAA x 8" or group==" AAA x 7" or group==" AAA x 6" or group==" AAA x 5" or group==" AAA x 4" or group==" AAA x 3" or group==" AAA x 2" or group==" AAA x 1" then
						self:Load(THEME:GetPathG("_group jackets/group grade","2A"));
					elseif group=="  AA x 9" or group=="  AA x 8" or group=="  AA x 7" or group=="  AA x 6" or group=="  AA x 5" or group=="  AA x 4" or group=="  AA x 3" or group=="  AA x 2" or group=="  AA x 1" then
						self:Load(THEME:GetPathG("_group jackets/group grade","A"));
					elseif group=="   A x 9" or group=="   A x 8" or group=="   A x 7" or group=="   A x 6" or group=="   A x 5" or group=="   A x 4" or group=="   A x 3" or group=="   A x 2" or group=="   A x 1" then
						self:Load(THEME:GetPathG("_group jackets/group grade","B"));
					elseif group=="   B x 9" or group=="   B x 8" or group=="   B x 7" or group=="   B x 6" or group=="   B x 5" or group=="   B x 4" or group=="   B x 3" or group=="   B x 2" or group=="   B x 1" then
						self:Load(THEME:GetPathG("_group jackets/group grade","C"));
					elseif group=="   C x 9" or group=="   C x 8" or group=="   C x 7" or group=="   C x 6" or group=="   C x 5" or group=="   C x 4" or group=="   C x 3" or group=="   C x 2" or group=="   C x 1" then
						self:Load(THEME:GetPathG("_group jackets/group grade","D"));
					elseif group=="   D x 9" or group=="   D x 8" or group=="   D x 7" or group=="   D x 6" or group=="   D x 5" or group=="   D x 4" or group=="   D x 3" or group=="   D x 2" or group=="   D x 1" then
						self:Load(THEME:GetPathG("_group jackets/group grade","D"));


					elseif group=="???" then
						if so == "SortOrder_TopGrades" then
						self:Load(THEME:GetPathG("_group jackets/group cleared rank","unplayed"));
						end;
					elseif group=='N/A' or group=='- EMPTY -'then
						self:Load(THEME:GetPathG("_group jackets/group global","NA"));

					elseif group=='Nonstop'then
						self:Load(THEME:GetPathG("_group jackets/group COURSE","NORMAL"));
					elseif group=='Oni'then
						self:Load(THEME:GetPathG("_group jackets/group COURSE","CHALLENGE"));


					elseif group=='DanceDanceRevolution 1stMIX' or group=='01 - DDR 1st' then
					self:Load(THEME:GetPathG("_group jackets/group","001 DDR"));
					elseif group=='DanceDanceRevolution 2ndMIX' or group=='02 - DDR 2ndMIX' then
					self:Load(THEME:GetPathG("_group jackets/group","002 DDR 2ndMIX"));
					elseif group=='DanceDanceRevolution 3rdMIX' or group=='03 - DDR 3rdMIX' then
					self:Load(THEME:GetPathG("_group jackets/group","003 DDR 3rdMIX"));
					elseif group=='DanceDanceRevolution 4thMIX' or group=='04 - DDR 4thMIX'  then
					self:Load(THEME:GetPathG("_group jackets/group","004 DDR 4thMIX"));
					elseif group=='DanceDanceRevolution 5thMIX' or group=='05 - DDR 5thMIX'  then

					self:Load(THEME:GetPathG("_group jackets/group","005 DDR 5thMIX"));
					elseif group=='DanceDanceRevolution 6thMIX MAX' or group=='06 - DDR MAX'  then

					self:Load(THEME:GetPathG("_group jackets/group","006 DDRMAX"));
					elseif group=='DanceDanceRevolution 7thMIX MAX2' or group=='07 - DDR MAX2'  then

					self:Load(THEME:GetPathG("_group jackets/group","007 DDRMAX2"));
					elseif group=='DanceDanceRevolution 8thMIX EXTREME' or group=='08 - DDR EXTREME'  then

					self:Load(THEME:GetPathG("_group jackets/group","008 DDR EXTREME"));
					elseif group=='DanceDanceRevolution SuperNOVA' or group=='09 - DDR SuperNOVA'  then

					self:Load(THEME:GetPathG("_group jackets/group","009 DDR SuperNOVA"));
					elseif group=='DanceDanceRevolution SuperNOVA2' or group=='10 - DDR SuperNOVA2'  then

					self:Load(THEME:GetPathG("_group jackets/group","010 DDR SuperNOVA2"));

					elseif group=='DanceDanceRevolution X' or group=='11 - DDR X'  then

					self:Load(THEME:GetPathG("_group jackets/group","011 DDR X"));
					elseif group=='DanceDanceRevolution X2' or group=='12 - DDR X2'  then

					self:Load(THEME:GetPathG("_group jackets/group","012 DDR X2"));
					elseif group=='DanceDanceRevolution X3' or group=='13 - DDR X3 vs 2ndMIX'  then

					self:Load(THEME:GetPathG("_group jackets/group","013 DDR X3 vs 2ndMIX"));
					elseif group=='DDR 2013' or group=='14 - DDR 2013'  then

					self:Load(THEME:GetPathG("_group jackets/group","014 DDR 2013"));
					elseif group=='DDR 2014' or group=='15 - DDR 2014'  then
					self:Load(THEME:GetPathG("_group jackets/group","015 DDR 2014"));
					elseif group=='DanceDanceRevolution A' or group=='16 - DDR A' or group=='DDR A'  then
					self:Load(THEME:GetPathG("_group jackets/group","016 DDR A"));
					elseif group=='DanceDanceRevolution SuperNOVA3' or group=='18 - DDR SuperNOVA3'  then

					self:Load(THEME:GetPathG("_group jackets/group","018 DDR SuperNOVA3"));
					else
					self:LoadFromSongGroup(group);

					end

				end
			else

				-- call fallback
				self:Load( THEME:GetPathG("","Common fallback jacket") );
			end;

		end;
	};



Def.Banner {
		Name="SongReflection";
		InitCommand=cmd(scaletoclipped,220,220;y,220;rotationx,180;croptop,0.5;diffusealpha,0.6;diffusetopedge,1,1,1,0;);
		SetMessageCommand=function(self,params)
					group = params.Text;
		local so = GAMESTATE:GetSortOrder();
		if group then
			if so =="SortOrder_Genre" then
				if group == "Pop" or group == "POP"  or group == "Pop" then
					self:Load(THEME:GetPathG("_group jackets/group jacket","Pop"));
				elseif group == "Anime/Game"  or group == "AnimeGame"  or group == "Anime"  or group == "Game" then
					self:Load(THEME:GetPathG("_group jackets/group jacket","AnimeGame"));
				elseif group == "Variety" then
					self:Load(THEME:GetPathG("_group jackets/group jacket","Variety"));
				elseif group == "GUMI 5th anniversary"  or group == "GUMI" then
					self:Load(THEME:GetPathG("_group jackets/group jacket","GUMI"));
				elseif group == "U.M.U. x BEMANI" or group == "UMU" then
					self:Load(THEME:GetPathG("_group jackets/group jacket","UMU"));
				elseif group == "KONAMI originals" or group == "KONAMI" then
					self:Load(THEME:GetPathG("_group jackets/group jacket","KONAMI"));

				elseif group == "beatmania IIDX" or group == "beatmaniaIIDX" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","IIDX"));
				elseif group == "pop'n music" or group == "popn music" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","popn"));
				elseif group == "GITADORA" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","GITADORA"));
				elseif group == "jubeat" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","jubeat"));
				elseif group == "REFLEC BEAT" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","RB"));
				elseif group == "Dance Evolution" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","DanceEvolution"));
				elseif group == "SOUND VOLTEX" or group == "SDVX" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","SDVX"));
				elseif group == "FutureTomTom" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","FutureTomTom"));
				elseif group == "DDR" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","DDR"));
				elseif group == "BEMANI Academy" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","BEMANI Academy"));
				elseif group == "BEMANI STADIUM" or group == "BEMANI Stadium" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","BEMANI STADIUM"));
				elseif group == "HinaBitter" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","HinaBitter"));
				elseif group == "BEMANI x TOHO project" or group == "BEMANI x TOHO" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","BEMANI x TOHO project"));
				elseif group == "Dancemania" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","Dancemania"));
				elseif group == "Electronic" or group == "Electronics" then
					self:Load(THEME:GetPathG("_group jackets/group jacket series","Electronic"));
				elseif group=='N/A' or group=='- EMPTY -'then
					self:Load(THEME:GetPathG("_group jackets/group global","NA"));
				else
					self:Load( THEME:GetPathG("_group jackets/group jacket","NA") );
				end
			elseif string.find(so,"Meter") then
				if group=='01' then
					self:Load(THEME:GetPathG("_group jackets/group diff","01"));
				elseif group=='02' then
					self:Load(THEME:GetPathG("_group jackets/group diff","02"));
				elseif group=='03' then
					self:Load(THEME:GetPathG("_group jackets/group diff","03"));
				elseif group=='04' then
					self:Load(THEME:GetPathG("_group jackets/group diff","04"));
				elseif group=='05' then
					self:Load(THEME:GetPathG("_group jackets/group diff","05"));
				elseif group=='06' then
					self:Load(THEME:GetPathG("_group jackets/group diff","06"));
				elseif group=='07' then
					self:Load(THEME:GetPathG("_group jackets/group diff","07"));
				elseif group=='08' then
					self:Load(THEME:GetPathG("_group jackets/group diff","08"));
				elseif group=='09' then
					self:Load(THEME:GetPathG("_group jackets/group diff","09"));
				elseif group=='10' then
					self:Load(THEME:GetPathG("_group jackets/group diff","10"));
				elseif group=='11' then
					self:Load(THEME:GetPathG("_group jackets/group diff","11"));
				elseif group=='12' then
					self:Load(THEME:GetPathG("_group jackets/group diff","12"));
				elseif group=='13' then
					self:Load(THEME:GetPathG("_group jackets/group diff","13"));
				elseif group=='14' then
					self:Load(THEME:GetPathG("_group jackets/group diff","14"));
				elseif group=='15' then
					self:Load(THEME:GetPathG("_group jackets/group diff","15"));
				elseif group=='16' then
					self:Load(THEME:GetPathG("_group jackets/group diff","16"));
				elseif group=='17' then
					self:Load(THEME:GetPathG("_group jackets/group diff","17"));
				elseif group=='18' then
					self:Load(THEME:GetPathG("_group jackets/group diff","18"));
				elseif group=='19' then
					self:Load(THEME:GetPathG("_group jackets/group diff","19"));
				elseif group=='20' then
					self:Load(THEME:GetPathG("_group jackets/group diff","20"));
				else
					self:Load( THEME:GetPathG("_group jackets/group diff","NA") );
				end
			else
				if group=='A' then
					self:Load(THEME:GetPathG("_group jackets/group title","A"));
				elseif group=='B' then
					self:Load(THEME:GetPathG("_group jackets/group title","B"));
				elseif group=='C' then
					self:Load(THEME:GetPathG("_group jackets/group title","C"));
				elseif group=='D' then
					self:Load(THEME:GetPathG("_group jackets/group title","D"));
				elseif group=='E' then
					self:Load(THEME:GetPathG("_group jackets/group title","E"));
				elseif group=='F' then
					self:Load(THEME:GetPathG("_group jackets/group title","F"));
				elseif group=='G' then
					self:Load(THEME:GetPathG("_group jackets/group title","G"));
				elseif group=='H' then
					self:Load(THEME:GetPathG("_group jackets/group title","H"));
				elseif group=='I' then
					self:Load(THEME:GetPathG("_group jackets/group title","I"));
				elseif group=='J' then
					self:Load(THEME:GetPathG("_group jackets/group title","J"));
				elseif group=='K' then
					self:Load(THEME:GetPathG("_group jackets/group title","K"));
				elseif group=='L' then
					self:Load(THEME:GetPathG("_group jackets/group title","L"));
				elseif group=='M' then
					self:Load(THEME:GetPathG("_group jackets/group title","M"));
				elseif group=='N' then
					self:Load(THEME:GetPathG("_group jackets/group title","N"));
				elseif group=='O' then
					self:Load(THEME:GetPathG("_group jackets/group title","O"));
				elseif group=='P' then
					self:Load(THEME:GetPathG("_group jackets/group title","P"));
				elseif group=='Q' then
					self:Load(THEME:GetPathG("_group jackets/group title","Q"));
				elseif group=='R' then
					self:Load(THEME:GetPathG("_group jackets/group title","R"));
				elseif group=='S' then
					self:Load(THEME:GetPathG("_group jackets/group title","S"));
				elseif group=='T' then
					self:Load(THEME:GetPathG("_group jackets/group title","T"));
				elseif group=='U' then
					self:Load(THEME:GetPathG("_group jackets/group title","U"));
				elseif group=='V' then
					self:Load(THEME:GetPathG("_group jackets/group title","V"));
				elseif group=='W' then
					self:Load(THEME:GetPathG("_group jackets/group title","W"));
				elseif group=='X' then
					self:Load(THEME:GetPathG("_group jackets/group title","X"));
				elseif group=='Y' then
					self:Load(THEME:GetPathG("_group jackets/group title","Y"));
				elseif group=='Z' then
					self:Load(THEME:GetPathG("_group jackets/group title","Z"));
				elseif group=='0-9' then
					self:Load(THEME:GetPathG("_group jackets/group title","0-9"));


				elseif group=='000-019' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","000"));
				elseif group=='020-039' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","020"));
				elseif group=='040-059' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","040"));
				elseif group=='060-079' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","060"));
				elseif group=='080-099' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","080"));

				elseif group=='100-119' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","100"));
				elseif group=='120-139' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","120"));
				elseif group=='140-159' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","140"));
				elseif group=='160-179' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","160"));
				elseif group=='180-199' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","180"));

				elseif group=='200-219' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","200"));
				elseif group=='220-239' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","220"));
				elseif group=='240-259' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","240"));
				elseif group=='260-279' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","260"));
				elseif group=='280-299' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","280"));

				elseif group=='300-319' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","300"));
				elseif group=='320-339' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","320"));
				elseif group=='340-359' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","340"));
				elseif group=='360-379' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","360"));
				elseif group=='380-399' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","380"));

				elseif group=='400-419' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","400"));
				elseif group=='420-439' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","420"));
				elseif group=='440-459' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","440"));
				elseif group=='460-479' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","460"));
				elseif group=='480-499' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","480"));

				elseif group=='500-519' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","500"));
				elseif group=='520-539' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","520"));
				elseif group=='540-559' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","540"));
				elseif group=='560-579' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","560"));
				elseif group=='580-599' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","580"));

				elseif group=='600-619' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","600"));
				elseif group=='620-639' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","620"));
				elseif group=='640-659' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","640"));
				elseif group=='660-679' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","660"));
				elseif group=='680-699' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","680"));

				elseif group=='700-719' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","700"));
				elseif group=='720-739' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","720"));
				elseif group=='740-759' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","740"));
				elseif group=='760-779' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","760"));
				elseif group=='780-799' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","780"));

				elseif group=='800-819' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","800"));
				elseif group=='820-839' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","820"));
				elseif group=='840-859' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","840"));
				elseif group=='860-879' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","860"));
				elseif group=='880-899' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","880"));

				elseif group=='900-919' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","900"));
				elseif group=='920-939' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","220"));
				elseif group=='940-959' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","940"));
				elseif group=='960-979' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","960"));
				elseif group=='980-999' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","980"));

				elseif group=='1000-1019' then
					self:Load(THEME:GetPathG("_group jackets/group bpm","a1000"));

				elseif group=="AAAA x 9" or group=="AAAA x 8" or group=="AAAA x 7" or group=="AAAA x 6" or group=="AAAA x 5" or group=="AAAA x 4" or group=="AAAA x 3" or group=="AAAA x 2" or group=="AAAA x 1" then
					self:Load(THEME:GetPathG("_group jackets/group grade","3A"));
				elseif group==" AAA x 9" or group==" AAA x 8" or group==" AAA x 7" or group==" AAA x 6" or group==" AAA x 5" or group==" AAA x 4" or group==" AAA x 3" or group==" AAA x 2" or group==" AAA x 1" then
					self:Load(THEME:GetPathG("_group jackets/group grade","2A"));
				elseif group=="  AA x 9" or group=="  AA x 8" or group=="  AA x 7" or group=="  AA x 6" or group=="  AA x 5" or group=="  AA x 4" or group=="  AA x 3" or group=="  AA x 2" or group=="  AA x 1" then
					self:Load(THEME:GetPathG("_group jackets/group grade","A"));
				elseif group=="   A x 9" or group=="   A x 8" or group=="   A x 7" or group=="   A x 6" or group=="   A x 5" or group=="   A x 4" or group=="   A x 3" or group=="   A x 2" or group=="   A x 1" then
					self:Load(THEME:GetPathG("_group jackets/group grade","B"));
				elseif group=="   B x 9" or group=="   B x 8" or group=="   B x 7" or group=="   B x 6" or group=="   B x 5" or group=="   B x 4" or group=="   B x 3" or group=="   B x 2" or group=="   B x 1" then
					self:Load(THEME:GetPathG("_group jackets/group grade","C"));
				elseif group=="   C x 9" or group=="   C x 8" or group=="   C x 7" or group=="   C x 6" or group=="   C x 5" or group=="   C x 4" or group=="   C x 3" or group=="   C x 2" or group=="   C x 1" then
					self:Load(THEME:GetPathG("_group jackets/group grade","D"));
				elseif group=="   D x 9" or group=="   D x 8" or group=="   D x 7" or group=="   D x 6" or group=="   D x 5" or group=="   D x 4" or group=="   D x 3" or group=="   D x 2" or group=="   D x 1" then
					self:Load(THEME:GetPathG("_group jackets/group grade","D"));


				elseif group=="???" then
					if so == "SortOrder_TopGrades" then
					self:Load(THEME:GetPathG("_group jackets/group cleared rank","unplayed"));
					end;
				elseif group=='N/A' or group=='- EMPTY -'then
					self:Load(THEME:GetPathG("_group jackets/group global","NA"));

				elseif group=='Nonstop'then
					self:Load(THEME:GetPathG("_group jackets/group COURSE","NORMAL"));
				elseif group=='Oni'then
					self:Load(THEME:GetPathG("_group jackets/group COURSE","CHALLENGE"));


				elseif group=='DanceDanceRevolution 1stMIX' or group=='01 - DDR 1st' then
				self:Load(THEME:GetPathG("_group jackets/group","001 DDR"));
				elseif group=='DanceDanceRevolution 2ndMIX' or group=='02 - DDR 2ndMIX' then
				self:Load(THEME:GetPathG("_group jackets/group","002 DDR 2ndMIX"));
				elseif group=='DanceDanceRevolution 3rdMIX' or group=='03 - DDR 3rdMIX' then
				self:Load(THEME:GetPathG("_group jackets/group","003 DDR 3rdMIX"));
				elseif group=='DanceDanceRevolution 4thMIX' or group=='04 - DDR 4thMIX'  then
				self:Load(THEME:GetPathG("_group jackets/group","004 DDR 4thMIX"));
				elseif group=='DanceDanceRevolution 5thMIX' or group=='05 - DDR 5thMIX'  then

				self:Load(THEME:GetPathG("_group jackets/group","005 DDR 5thMIX"));
				elseif group=='DanceDanceRevolution 6thMIX MAX' or group=='06 - DDR MAX'  then

				self:Load(THEME:GetPathG("_group jackets/group","006 DDRMAX"));
				elseif group=='DanceDanceRevolution 7thMIX MAX2' or group=='07 - DDR MAX2'  then

				self:Load(THEME:GetPathG("_group jackets/group","007 DDRMAX2"));
				elseif group=='DanceDanceRevolution 8thMIX EXTREME' or group=='08 - DDR EXTREME'  then

				self:Load(THEME:GetPathG("_group jackets/group","008 DDR EXTREME"));
				elseif group=='DanceDanceRevolution SuperNOVA' or group=='09 - DDR SuperNOVA'  then

				self:Load(THEME:GetPathG("_group jackets/group","009 DDR SuperNOVA"));
				elseif group=='DanceDanceRevolution SuperNOVA2' or group=='10 - DDR SuperNOVA2'  then

				self:Load(THEME:GetPathG("_group jackets/group","010 DDR SuperNOVA2"));

				elseif group=='DanceDanceRevolution X' or group=='11 - DDR X'  then

				self:Load(THEME:GetPathG("_group jackets/group","011 DDR X"));
				elseif group=='DanceDanceRevolution X2' or group=='12 - DDR X2'  then

				self:Load(THEME:GetPathG("_group jackets/group","012 DDR X2"));
				elseif group=='DanceDanceRevolution X3' or group=='13 - DDR X3 vs 2ndMIX'  then

				self:Load(THEME:GetPathG("_group jackets/group","013 DDR X3 vs 2ndMIX"));
				elseif group=='DDR 2013' or group=='14 - DDR 2013'  then

				self:Load(THEME:GetPathG("_group jackets/group","014 DDR 2013"));
				elseif group=='DDR 2014' or group=='15 - DDR 2014'  then
				self:Load(THEME:GetPathG("_group jackets/group","015 DDR 2014"));
				elseif group=='DanceDanceRevolution A' or group=='16 - DDR A' or group=='DDR A'  then
				self:Load(THEME:GetPathG("_group jackets/group","016 DDR A"));
				elseif group=='DanceDanceRevolution SuperNOVA3' or group=='18 - DDR SuperNOVA3'  then

				self:Load(THEME:GetPathG("_group jackets/group","018 DDR SuperNOVA3"));
				else
				self:LoadFromSongGroup(group);

					end

				end
			else

				-- call fallback
				self:Load( THEME:GetPathG("","Common fallback jacket") );
			end;

		end;
	};




	LoadFont("_futura std medium 20px")..{
		InitCommand=cmd(y,96;maxwidth,160);
		SetMessageCommand=function(self, params)
			local song = params.Song;
			group = params.Text;
		local so = GAMESTATE:GetSortOrder();
		if group=='DanceDanceRevolution 1stMIX' or
		group=='DanceDanceRevolution 2ndMIX' or
		group=='DanceDanceRevolution 3rdMIX' or
		group=='DanceDanceRevolution 4thMIX' or
		group=='DanceDanceRevolution 5thMIX' or
		group=='DanceDanceRevolution 6thMIX MAX' or
		group=='DanceDanceRevolution 7thMIX MAX2' or
		group=='DanceDanceRevolution 8thMIX EXTREME' or
		group=='DanceDanceRevolution SuperNOVA' or
		group=='DanceDanceRevolution SuperNOVA2' or
		group=='DanceDanceRevolution X' or
		group=='DanceDanceRevolution X2' or
		group=='DanceDanceRevolution X3' or
		group=='DDR 2013' or
		group=='DDR 2014'  or
		group=='DanceDanceRevolution A' or
		group=='DanceDanceRevolution SuperNOVA3' or

		group=='00 - ORIGINAL SONG FILE' or
		group=='00A - DDR console Exclusive' or
		group=='01 - DDR 1st' or
		group=='02 - DDR 2ndMIX' or
		group=='03 - DDR 3rdMIX' or
		group=='04 - DDR 4thMIX' or
		group=='05 - DDR 5thMIX' or
		group=='06 - DDR MAX' or
		group=='07 - DDR MAX2' or
		group=='08 - DDR EXTREME' or
		group=='09 - DDR SuperNOVA' or
		group=='10 - DDR SuperNOVA2' or
		group=='11 - DDR X' or
		group=='12 - DDR X2' or
		group=='13 - DDR X3 vs 2ndMIX' or
		group=='14 - DDR 2013' or
		group=='15 - DDR 2014' or
		group=='16 - DDR A' or
		group=='18 - DDR SuperNOVA3' then

			self:settext("");
		else
			if so == "SortOrder_Group" then
			self:settext(group);
			self:shadowlengthy(2);
			self:diffuse(color("#FFFFFF"));
			self:strokecolor(color("#000000"));
			else
			self:settext("");
			end;
		end;
		end;
	};

	-- LoadFont("_itc avant garde std bk 20px")..{
		-- InitCommand=cmd(y,65;zoomx,1;zoomy,0.6;maxwidth,150;diffuse,Color("White");strokecolor,color("0.30,0.15,0.0,0.9"));
		-- SetCommand=function(self,params)
			-- local so = GAMESTATE:GetSortOrder();
			-- if so =="SortOrder_Genre" then
			-- self:settext(so);
			-- else
				-- self:settext("123123");
			-- end
		-- end

	-- };


	LoadFont("_futura std medium 20px")..{
		InitCommand=cmd(y,65;zoomx,1;zoomy,0.6;maxwidth,150;diffuse,Color("White");strokecolor,color("0.30,0.15,0.0,0.9"));
		SetCommand=function(self,params)
			self:stoptweening();

			if GAMESTATE:GetExpandedSectionName()==params.Text then
				self:diffuse(Color("Black"));
				self:strokecolor(color("0.0,0.15,0.30,0.8"));
			else
				self:diffuse(Color("Black"));
				self:strokecolor(color("0.30,0.15,0.0,0.9"));
			end;

			if
				params.Text =='AAAA x 5' or
				params.Text ==' AAA x 5' or
				params.Text =='  AA x 5' or
				params.Text =='   A x 5' or
				params.Text =='   B x 5' or
				params.Text =='   C x 5' or
				params.Text =='   D x 5' or
				params.Text =='   E x 5'
			then
				self:settextf("x5");
			elseif
				params.Text =='AAAA x 4' or
				params.Text ==' AAA x 4' or
				params.Text =='  AA x 4' or
				params.Text =='   A x 4' or
				params.Text =='   B x 4' or
				params.Text =='   C x 4' or
				params.Text =='   D x 4' or
				params.Text =='   E x 4'
			then
				self:settextf("x4");
			elseif
				params.Text =='AAAA x 3' or
				params.Text ==' AAA x 3' or
				params.Text =='  AA x 3' or
				params.Text =='   A x 3' or
				params.Text =='   B x 3' or
				params.Text =='   C x 3' or
				params.Text =='   D x 3' or
				params.Text =='   E x 3'
			then
				self:settextf("x3");
			elseif
				params.Text =='AAAA x 2' or
				params.Text ==' AAA x 2' or
				params.Text =='  AA x 2' or
				params.Text =='   A x 2' or
				params.Text =='   B x 2' or
				params.Text =='   C x 2' or
				params.Text =='   D x 2' or
				params.Text =='   E x 2'
			then
				self:settextf("x2");
			elseif
				params.Text =='AAAA x 1' or
				params.Text ==' AAA x 1' or
				params.Text =='  AA x 1' or
				params.Text =='   A x 1' or
				params.Text =='   B x 1' or
				params.Text =='   C x 1' or
				params.Text =='   D x 1' or
				params.Text =='   E x 1'
			then
				self:settextf("x1");
			elseif
				params.Text =='???'
			then
				self:settextf(" ");
			else
				self:settextf(" ");

			end;

		end;
	};

	-- Def.Banner {
		-- Name="SongBanner";
		-- InitCommand=cmd(scaletoclipped,220,220;);
		-- SetMessageCommand=function(self,params)
			-- self:Load( THEME:GetPathG("group jacket","series blackcorder") );
		-- end;
	-- };
	-- Def.Banner {
		-- Name="SongBanner";
		-- InitCommand=cmd(scaletoclipped,220,220;y,220;rotationx,180;croptop,0.5;diffusealpha,0.5;diffusetopedge,1,1,1,0);
		-- SetMessageCommand=function(self,params)
			-- self:Load( THEME:GetPathG("group jacket","series blackcorder") );
		-- end;
	-- };


	Def.Banner {
		Name="SongBanner";
		InitCommand=cmd(scaletoclipped,225,252);
		SetMessageCommand=function(self,params)
				self:Load( THEME:GetPathG("Common fallback","outer frame banner") );
		end;
	};

	Def.Banner {
		Name="SongBanner";
		InitCommand=cmd(scaletoclipped,225,252;y,220;rotationx,180;croptop,0.5;diffusealpha,0.5;diffusetopedge,1,1,1,0);
		SetMessageCommand=function(self,params)
			self:Load( THEME:GetPathG("Common fallback","outer frame banner") );
		end;
	};

};
return t;
