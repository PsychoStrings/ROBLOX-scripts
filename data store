--Script by LaTehuana

local ds = game:GetService("DataStoreService"):GetDataStore("StatsStore2")

game.Players.PlayerAdded:Connect(function(player)
    local playerFolder = Instance.new("Folder")
        playerFolder.Name = "leaderstats"
        playerFolder.Parent = player

    local ack2 = Instance.new("IntValue")
        ack2.Name = "Time"
        ack2.Value = 0
    ack2.Parent = playerFolder
    
    local ack3 = Instance.new("IntValue")
        ack3.Name = "Joins"
        ack3.Value = 0
    ack3.Parent = playerFolder
    
--loaddata    
    local savestuff = ds:GetAsync(player.UserId)    
    --print("data takes up ".. game:GetService("HttpService"):JSONEncode(savestuff):len().. "/260000")
local StatsFile = player.leaderstats
    if savestuff then
        for i,v in pairs(savestuff) do
            if i % 2 == 0 then
                StatsFile:FindFirstChild(savestuff[i - 1]).Value = v
                
            end
        end
        
    end
end)

local function saveValues(player)
    local saveData = {}
    local StatsFile = player.leaderstats

    for i,v in pairs(StatsFile:GetChildren()) do
            saveData[#saveData + 1] = v.Name
            saveData[#saveData + 1] = v.Value
    end
    ds:SetAsync(player.UserId, saveData)
end

game:BindToClose(function()
    for i, player in pairs(game.Players:GetPlayers()) do
        saveValues(player)
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    saveValues(player)
end)





function oa(object)
    local player = game.Players:playerFromCharacter(object)
    if player ~= nil then
        local ls = player.leaderstats
        local sl = game.Workspace.player:FindFirstChild(ls.Joins.Value)
        wait()
        object.HumanoidRootPart.CFrame = object.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
        object.HumanoidRootPart.CFrame = sl.CFrame + Vector3.new(0,3,0)
    end 
end

game.Players.PlayerRemoving:Connect(function(plr)
    ds:SetAsync(("id_"..plr.UserId, {plr.leaderstats.Joins.Value})
end)
