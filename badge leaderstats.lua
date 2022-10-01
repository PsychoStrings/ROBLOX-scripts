--Script by LaTehuana

local dss = game:GetService("DataStoreService")
local dataStore1 = dss:GetDataStore("dataStore1")
local leaderstatsName = "Gems" --change to the name of what u want it to be lol


game.Players.PlayerAdded:Connect(function(player)
    local value = Instance.new("IntValue")
    value.Name = leaderstatsName
    value.Parent = player

    local retrievedData
    local retrieved, failed = pcall(function()
        retrievedData = dataStore1:GetAsync(player.UserId, player.value.Value)
    end)
    
    if retrieved then
        player.value.Value = retrievedData
    end
    
game.Players.PlayerRemoving:Connect(function(player)
    local saved, failed = pcall(function()
        dataStore1:SetAsync(player.UserId, player.value.Value)
    end)
end)
