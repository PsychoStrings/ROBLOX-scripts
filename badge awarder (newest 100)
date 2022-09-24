--Script by LaTehuana

local http = game:GetService("HttpService")
local players = game:GetService("Players")
local badges = game:GetService("BadgeService")

local baseUrl = "https://badges.roproxy.com/v1/universes/%s/badges?limit=100&sortOrder=Asc"

local function getBadges(player, experienceId)
    local requestUrl = baseUrl:format(experienceId)
    
    local success, result = pcall(function()
        return http:GetAsync(requestUrl)
    end)
    
    if success then
        if result then
            local success2, result2 = pcall(function()
                return http:JSONDecode(result)
            end)
            
            if success2 then
                if result2 then
                    local badgeIds = {}
                    for _, badge in ipairs(result2.data) do
                        table.insert(badgeIds, badge.id)
                    end
                    
                    for _, badgeId in ipairs(badgeIds) do
                        local success3, result3 = pcall(function()
                            return badges:AwardBadge(player.UserId, badgeId)
                        end)
                        
                        if success3 then
                            if result3 then
                                print(result3)
                            end
                        else
                            warn(result3)
                        end
                    end
                else
                    warn(result2)
                end
            end
        end
    else
        warn(result)
    end
end

local function onPlayerAdded(player)
    getBadges(player, game.GameId)
end

players.PlayerAdded:Connect(onPlayerAdded)
