local screenName = Var "LoadingScreen"
local headerTextImage

--this should probably be a metric
if screenName == "ScreenSelectMusic" then
    headerTextImage = "Music.png"
elseif string.find(screenName, "Options") then
    headerTextImage = "Options.png"
elseif screenName == "ScreenMapControllers" then
	headerTextImage = "Options.png"
elseif screenName == "ScreenSelectStyle" then
    headerTextImage = "Style.png"
elseif screenName == "ScreenSelectPlayMode"
	or screenName == "ScreenSelectPlayCourseMode" then
    headerTextImage = "PlayMode.png"
	elseif screenName == "ScreenSelectGameMode" then
	    headerTextImage = "GameMode.png"
elseif screenName == "ScreenSelectCourse" then
    headerTextImage = "Course.png"
elseif screenName == "ScreenSelectProfile" then
	headerTextImage = "profile.png"
elseif screenName == "ScreenDataSaveSummary" then
	headerTextImage = "profile.png"
elseif screenName == "ScreenEvaluationNormal" then
	headerTextImage = "Results.png"
elseif screenName == "ScreenEvaluationSummary" then
	headerTextImage = "Results.png"
elseif screenName == "ScreenEvaluationOni" then
	headerTextImage = "Results.png"
elseif screenName == "ScreenEvaluationNonstop" then
	headerTextImage = "Results.png"
end

--Base Anchoring
local out = Def.ActorFrame{
	LoadActor("base")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):diffusealpha(0.9)
		end;
	};
}

--Text Anchoring
if headerTextImage then
	table.insert(out,LoadActor(headerTextImage)..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X)
		end;
	})
end

table.insert(out,LoadActor("pro.png")..{
	InitCommand=function(self)
		if screenName == "ScreenSelectMusic" then
			self:visible(true)
		else
			self:visible(false)
		end;
		self:CenterX()
	end;
})

return out
