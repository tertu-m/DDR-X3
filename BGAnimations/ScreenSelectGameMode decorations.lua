local t = LoadFallbackB()

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(draworder,200;xy,SCREEN_CENTER_X,SCREEN_CENTER_Y+200);
  LoadActor("_selectarrow") .. {
    InitCommand=cmd(x,-334;diffusealpha,0);
    OnCommand=cmd(sleep,0.5;smooth,0.3;diffusealpha,1;);
    OffCommand=cmd(smooth,0.2;addx,-50;diffusealpha,0;);
    MenuLeftP1MessageCommand=cmd(smooth,0.1;addx,-20;smooth,0.1;addx,20;);
    MenuLeftP2MessageCommand=cmd(smooth,0.1;addx,-20;smooth,0.1;addx,20;);
  };
LoadActor("_selectarrow") .. {
    InitCommand=cmd(x,350;zoomx,-1;zoomy,1;diffusealpha,0);
    OnCommand=cmd(sleep,0.5;smooth,0.3;diffusealpha,1;);
    OffCommand=cmd(smooth,0.2;addx,50;diffusealpha,0;);
    MenuRightP1MessageCommand=cmd(smooth,0.1;addx,20;smooth,0.1;addx,-20;);
    MenuRightP2MessageCommand=cmd(smooth,0.1;addx,20;smooth,0.1;addx,-20;);
  };
};

return t
