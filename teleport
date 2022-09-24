--Script by LaTehuana

local players = game:GetService("Players")
local teleports = game:GetService("TeleportService")
local replicated = game:GetService("ReplicatedStorage")
local remote = replicated.TeleportRemote

remote.OnServerEvent:Connect(function(player)
    local privateServerCode = teleports:ReserveServer(game.PlaceId)
    teleports:TeleportToPrivateServer(game.PlaceId, privateServerCode, {player})
end)
[1:03 PM]
local replicated = game:GetService("ReplicatedStorage")
local remote = replicated:WaitForChild("TeleportRemote")

local players = game:GetService("Players")
local player = players.LocalPlayer

local button = script.Parent

button.MouseButton1Click:Connect(function()
    remote:FireServer()
end)
