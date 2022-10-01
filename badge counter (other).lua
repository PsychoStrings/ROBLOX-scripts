--Script by LaTehuana

local http = game:GetService("HttpService")

local baseUrl = "https://badges.roproxy.com/v1/universes/%s/badges?limit=100&sortOrder=Asc&cursor=%s"

local function getBadgeCountRecursive(universeId, count, cursor)
    universeId = universeId or game.GameId
    count = count or 0
    cursor = cursor or ""
    
    local requestUrl = baseUrl:format(universeId, cursor)
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
                    if result2.nextPageCursor then
                        cursor = result2.nextPageCursor
                        count += 100
                        return getBadgeCountRecursive(universeId, count, cursor)
                    else
                        count += #result2.data
                        return count
                    end
                end
            else
                warn(result2)
                return getBadgeCountRecursive(universeId, count, cursor)
            end
        end
    else
        warn(result)
        return getBadgeCountRecursive(universeId, count, cursor)
    end
end

local badgeCount = getBadgeCountRecursive()
print(badgeCount)
