return Def.ActorFrame{
  LoadActor("bg")..{
    InitCommand=cmd(FullScreen);
  };
  LoadActor("upper")..{
    InitCommand=cmd(CenterX;valign,0;y,SCREEN_TOP);
  };
  LoadActor("bottom")..{
    InitCommand=cmd(CenterX;valign,1;y,SCREEN_BOTTOM);
  };
};
