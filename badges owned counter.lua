--Script by LaTehuana

local http = game:GetService("HttpService")
local players = game:GetService("Players")
local datastores = game:GetService("DataStoreService")
local datastore = datastores:GetDataStore("DataStore")

local baseUrl = "https://badges.roproxy.com/v1/users/%s/badges?limit=100&sortOrder=Asc&cursor=%s"
local hex = "%X"

local function scrapeBadgesRecursive(userId, badgeData)
    badgeData = badgeData or {}
    badgeData.Cursor = badgeData.Cursor or ""
    badgeData.Count = badgeData.Count or 0
    badgeData.Badges = badgeData.Badges or {}
    
    local url = baseUrl:format(userId, badgeData.Cursor)
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
                    for _, badge in ipairs(result2.data) do
                        local badgeId = badge.id
                        local badgeHex = hex:format(badgeId)
                        if not table.find(badgeData.Badges, badgeHex) then
                            table.insert(badgeData.Badges, badgeHex)
                            badgeData.Count += 1
                        end
                    end
                    
                    if result2.nextPageCursor then
                        badgeData.Cursor = result2.nextPageCursor
                        return scrapeBadgesRecursive(userId, badgeData)
                    else
                        return badgeData
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

local function onPlayerAdded(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local badges = Instance.new("IntValue")
    badges.Name = "Badges"
    badges.Parent = leaderstats
    
    local success, result = pcall(function()
        return datastore:GetAsync("Badges_"..player.UserId)
    end)
    
    if success then
        if result then
            badges.Value = result.Count
        end
        
        local badgeData = scrapeBadgesRecursive(player.UserId, result)
        
        local success2, result2 = pcall(function()
            return datastore:UpdateAsync("Badges_"..player.UserId, function(data)
                return badgeData
            end)
        end)
        
        if success2 then
            if result2 then
                badges.Value = result2.Count
            end
        else
            warn(result2)
        end
    else
        warn(result)
    end
end

players.PlayerAdded:Connect(onPlayerAdded)
