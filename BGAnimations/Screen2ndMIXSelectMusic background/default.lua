return Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(FullScreen,diffuse,color("0,0,0,1"))
  };
  LoadActor("bg")..{
    InitCommand=cmd(CenterX;valign,0;y,SCREEN_TOP);
  };
  LoadActor("base")..{
    InitCommand=cmd(Center);
  };
};
