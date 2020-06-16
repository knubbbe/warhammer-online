SquaredPlayer = {}

local parent = nil

function SquaredPlayer.Initialize()
    -- register us as a handler with Squared
    parent = Squared.RegisterModeHandler("default", SquaredPlayer)
end

function SquaredPlayer.OnLoad()
    RegisterEventHandler( SystemData.Events.PLAYER_CUR_HIT_POINTS_UPDATED, "SquaredPlayer.UpdateCurHP")
    RegisterEventHandler( SystemData.Events.PLAYER_MAX_HIT_POINTS_UPDATED, "SquaredPlayer.UpdateMaxHP")
    RegisterEventHandler( SystemData.Events.PLAYER_CUR_ACTION_POINTS_UPDATED, "SquaredPlayer.UpdateAP")
    RegisterEventHandler( SystemData.Events.PLAYER_CAREER_RANK_UPDATED, "SquaredPlayer.UpdateLevel")
    RegisterEventHandler( SystemData.Events.PLAYER_CAREER_LINE_UPDATED, "SquaredPlayer.UpdateCareer")
   
    -- Create a single group called 'player', with 1 frame in it, and show it
    parent.ClearGroups()
    SquaredPlayer.frame = parent.AddUnit(1, 1, true)
    parent.ReanchorGroups()
   
    SquaredPlayer.frame:SetCareer(GameData.Player.career.line)
    SquaredPlayer.frame:SetName(GameData.Player.name)
    SquaredPlayer.frame:SetMaxVal(GameData.Player.hitPoints.maximum)
    SquaredPlayer.frame:SetVal(GameData.Player.hitPoints.current)
    SquaredPlayer.frame:SetAP((GameData.Player.actionPoints.current/GameData.Player.actionPoints.maximum)*100)
    SquaredPlayer.frame:SetLevel(GameData.Player.level)
    
    SquaredPlayer.frame:Update()
end

function SquaredPlayer.OnUnload()
    UnregisterEventHandler( SystemData.Events.PLAYER_CUR_HIT_POINTS_UPDATED, "SquaredPlayer.UpdateCurHP")
    UnregisterEventHandler( SystemData.Events.PLAYER_MAX_HIT_POINTS_UPDATED, "SquaredPlayer.UpdateMaxHP")
    UnregisterEventHandler( SystemData.Events.PLAYER_CUR_ACTION_POINTS_UPDATED, "SquaredPlayer.UpdateAP")
    UnregisterEventHandler( SystemData.Events.PLAYER_CAREER_RANK_UPDATED, "SquaredPlayer.UpdateLevel")
    UnregisterEventHandler( SystemData.Events.PLAYER_CAREER_LINE_UPDATED, "SquaredPlayer.UpdateCareer")
end

function SquaredPlayer.UpdateCareer()
    SquaredPlayer.frame:SetCareer(GameData.Player.career.line)
	SquaredPlayer.frame:Update()
end

function SquaredPlayer.UpdateLevel()
    SquaredPlayer.frame:SetLevel(GameData.Player.level)
    SquaredPlayer.frame:UpdateText()
end

function SquaredPlayer.UpdateCurHP()
    SquaredPlayer.frame:SetVal(GameData.Player.hitPoints.current)
    SquaredPlayer.frame:UpdateText()
end

function SquaredPlayer.UpdateMaxHP()
    SquaredPlayer.frame:SetMaxVal(GameData.Player.hitPoints.maximum)
    SquaredPlayer.frame:UpdateText()
end

function SquaredPlayer.UpdateAP()
    SquaredPlayer.frame:SetAP((GameData.Player.actionPoints.current/GameData.Player.actionPoints.maximum)*100)
    SquaredPlayer.frame:UpdateText()
end

function SquaredPlayer:UnitLClick(group, member, flags)
    return
end

function SquaredPlayer:UnitRRelease(group, member, flags)
    SystemData.UserInput.selectedGroupMember = GameData.Player.name
    
    PlayerMenuWindow.ShowMenu(GameData.Player.name, 0)
end