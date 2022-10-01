--Script by LaTehuana

local badgeservice = game:GetService("BadgeService")
local id =                --add badge id here

script.Parent.Touched:Connect (function(hit)

    if hit.Parent:FindFirstChild ("Humanoid")then

        local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
        badgeservice:AwardBadge(plr.UserId,id)

    end
end)
