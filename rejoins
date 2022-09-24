--Script by LaTehuana

local players = game:GetService("Players")
local teleports = game:GetService("TeleportService")

players.PlayerAdded:Connect(function(player)
    task.wait(5)
    local privateServerCode = teleports:ReserveServer(game.PlaceId)
    teleports:TeleportToPrivateServer(game.PlaceId, privateServerCode, {player})
end)
