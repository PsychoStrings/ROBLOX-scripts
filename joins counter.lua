--Script by LaTehuana

local ds2 = game:GetService("DataStoreService"):GetDataStore("JoinCount")
game.Players.PlayerAdded:Connect(function(plr)
    wait()
    local plrkey = "id_"..plr.userId
    local save2 = plr.leaderstats.Joins

    local GetSaved = ds2:GetAsync(plrkey)
    if GetSaved then
        save2.Value = GetSaved[1] + 1
    else
        local NumberForSaving = {save2.Value}
        ds2:GetAsync(plrkey, NumberForSaving)
    end
end)

game.Players.PlayerRemoving:Connect(function(plr)
    ds2:SetAsync("id_"..plr.userId, {plr.leaderstats.Joins.Value})
end)
