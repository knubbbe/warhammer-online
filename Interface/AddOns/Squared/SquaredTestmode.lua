SquaredTestmode = {}

local parent = nil

function SquaredTestmode.Initialize()
    -- register us as a handler with Squared
    parent = Squared.RegisterModeHandler("testmode", SquaredTestmode)
end

function SquaredTestmode.OnLoad()   
    SquaredTestmode.UpdateGroup()
end

function SquaredTestmode.OnUnload()
    return
end

function SquaredTestmode.UpdateGroup()
    parent.ClearGroups()
    
    for groupIndex = 4,1,-1 do
        for memberIndex = 1,6 do
            local unitFrame = parent.AddUnit(groupIndex, memberIndex, true)
                unitFrame:SetName(L"Unit"..towstring(groupIndex)..towstring(memberIndex))
                unitFrame:SetCareer(math.floor((math.random() * 10)+11))
                unitFrame:SetLevel(math.ceil(math.random() * 40))
                unitFrame:SetMaxVal(100)
                unitFrame:SetVal(math.floor(math.random() * 11) * 10)
                unitFrame:SetAP(math.floor(math.random() * 101))
                if groupIndex==2 then unitFrame:SetMyGroupFlag(true) end
                unitFrame:Update()
        end
    end
    
    parent.ReanchorGroups()
end

function SquaredTestmode:UnitLClick(group, member, flags)
    return
end

function SquaredTestmode:UnitRClick(group, member)
    return
end