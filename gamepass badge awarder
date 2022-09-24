--Script by LaTehuana

local players = game:GetService("Players")
local marketplace = game:GetService("MarketplaceService")
local userOwnsGamePass = marketplace.UserOwnsGamePassAsync
local badges = game:GetService("BadgeService")
local userHasBadge = badges.UserHasBadgeAsync
local awardBadge = badges.AwardBadge

local gamePassId = 0
local badgeId = 0

local function onPlayerAdded(player)
    local success, result = pcall(userOwnsGamePass, marketplace, player.UserId, gamePassId)
    if success then
        if result then
            local success2, result2 = pcall(userHasBadge, badges, player.UserId, badgeId)
            if success2 then
                if not result2 then
                    local success3, result3 = pcall(awardBadge, badges, player.UserId, badgeId)
                    if success3 then
                        if result3 then
                            print("Success!")
                        end
                    else
                        warn(result3)
                    end
                end
            else
                warn(result2)
            end
        end
    else
        warn(result)
    end
end

local function onGamePassPurchasePromptFinished(player, _gamePassId, wasPurchased)
    if wasPurchased then
        if _gamePassId == gamePassId then
            local success, result = pcall(userHasBadge, badges, player.UserId, badgeId)
            if success then
                if not result then
                    local success2, result2 = pcall(awardBadge, badges, player.UserId, badgeId)
                    if success2 then
                        if result2 then
                            print("Success!")
                        end
                    else
                        warn(result)
                    end
                end
            else
                warn(result)
            end
        end
    end
end

players.PlayerAdded:Connect(onPlayerAdded)
marketplace.PromptGamePassPurchaseFinished:Connect(onGamePassPurchasePromptFinished)
