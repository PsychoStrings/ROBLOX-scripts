--Script by LaTehuana

local Game = game
local BadgeService = Game:GetService("BadgeService")
local Players = Game:GetService("Players")

local GroupId = 0
local BadgeIds = {0, 1, 2, 3}

local function OnPlayerAdded(Player)
    local Success, Result = pcall(function() return Player:IsInGroup(GroupId) end)
    if not Success then warn(Result) return end
    if not Result then return end
    
    for _, BadgeId in ipairs(BadgeIds) do
        task.wait(0.5)
        Success, Result = pcall(function() return BadgeService:UserHasBadgeAsync(Player.UserId, BadgeId) end)
        if not Success then warn(Result) continue end
        if (Success and Result) then continue end
        Success, Result = pcall(function() return BadgeService:AwardBadge(Player.UserId, BadgeId) end)
        if not Success then warn(Result) continue end
    end
end

Players.PlayerAdded:Connect(OnPlayerAdded)
