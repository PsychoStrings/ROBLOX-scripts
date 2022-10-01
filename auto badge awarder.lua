--Script by LaTehuana

local players = game:GetService("Players")
local badgeService = game:GetService("BadgeService")

local badgeIds = {}

players.PlayerAdded:Connect(function(player)
    for _, v in pairs(badgeIds) do
        badgeService:AwardBadge(player.UserId, v)
    end
end)
