local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("2nd doors")..{
    InitCommand=cmd(setsize,1280,720;CenterY;cropright,0.5;CenterX);
    OnCommand=cmd(sleep,0.2;linear,0.2;addx,-SCREEN_WIDTH);
  };
  LoadActor("2nd doors")..{
    InitCommand=cmd(setsize,1280,720;CenterY;cropleft,0.5;CenterX);
    OnCommand=cmd(sleep,0.2;linear,0.2;addx,SCREEN_WIDTH);
  };
};

return t
