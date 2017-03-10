local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("DANCE.ogg")..{
    OnCommand=cmd(sleep,0.5;queuecommand,'Play');
    PlayCommand=cmd(play);
  };
};

MIXMode = 1;

return t;
