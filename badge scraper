-- Script by Latehuana

local http = game:GetService("HttpService")

local baseUrl = "https://badges.roproxy.com/v1/users/%s/badges?limit=100&sortOrder=Asc&cursor=%s"

local function scrapeBadgesRecursive(userId, cursor, badgeCount)
    task.wait()
    cursor = cursor or ""
    badgeCount = badgeCount or 0
    local url = baseUrl:format(userId, cursor)
    local success, result = pcall(function()
        return http:GetAsync(url)
    end)
    
    if success then
        if result then
            local success2, result2 = pcall(function()
                return http:JSONDecode(result)
            end)
            
            if success2 then
                if result2 then
                    if result2.nextPageCursor then
                        badgeCount += 100
                        cursor = result2.nextPageCursor
                        return scrapeBadgesRecursive(userId, cursor, badgeCount)
                    else
                        badgeCount += #result2.data
                        return badgeCount
                    end
                end
            end
        end
    end
end

local userId = 7300 --Change this.
local startTime = tick()
local totalBadges = scrapeBadgesRecursive(userId)
local finishTime = tick()
local totalTime = math.round((finishTime - startTime) * 100)/100
print("\nBadges scraped in "..totalTime.." seconds!\n".."User has "..totalBadges.." badges!")
