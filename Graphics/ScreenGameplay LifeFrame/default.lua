local t = Def.ActorFrame{};
local screenName = Var "LoadingScreen"

if MIXMode ~= 1 then
  t[#t+1] = Def.ActorFrame{
    LoadActor("X3");
  };
else
  t[#t+1] = Def.ActorFrame{
    LoadActor("2nd");
  };
end;

return t
