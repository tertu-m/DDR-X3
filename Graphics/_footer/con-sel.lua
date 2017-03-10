local t = Def.ActorFrame{
  InitCommand=cmd(y,-15);
  LoadActor("confirm")..{
    InitCommand=cmd(x,SCREEN_CENTER_X+80;);
  };
  LoadActor("select")..{
    InitCommand=cmd(x,SCREEN_CENTER_X-80);
  };
};

return t;
