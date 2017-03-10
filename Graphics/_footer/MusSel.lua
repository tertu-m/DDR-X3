local t = Def.ActorFrame{
  InitCommand=cmd(y,-15);
  LoadActor("confirm")..{
    InitCommand=cmd(x,SCREEN_CENTER_X+80;);
    OnCommand=cmd(diffusealpha,1;sleep,3;diffusealpha,0;sleep,6;queuecommand,"On");
    OffCommand=cmd(stoptweening);
  };
  LoadActor("select")..{
    InitCommand=cmd(x,SCREEN_CENTER_X-80);
    OnCommand=cmd(diffusealpha,1;sleep,3;diffusealpha,0;sleep,6;queuecommand,"On");
    OffCommand=cmd(stoptweening);
  };
  LoadActor("difficulty")..{
    InitCommand=cmd(x,SCREEN_CENTER_X);
    OnCommand=cmd(diffusealpha,0;sleep,3;diffusealpha,1;sleep,3;diffusealpha,0;sleep,3;queuecommand,"On");
    OffCommand=cmd(stoptweening);
  };
  LoadActor("sort")..{
    InitCommand=cmd(x,SCREEN_CENTER_X);
    OnCommand=cmd(diffusealpha,0;sleep,6;diffusealpha,1;sleep,3;diffusealpha,0;queuecommand,"On");
    OffCommand=cmd(stoptweening);
  };
};

return t;
