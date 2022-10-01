--Script by LaTehuana

nextgame = game id here
badge = {}
local id = game.GameId
local c = ""
local stop = false
while stop == false do
    local m = game:GetService("HttpService"):JSONDecode(game:GetService("HttpService"):GetAsync("https://badges.roproxy.xyz/v1/universes/" .. id .. "/badges?limit=100&cursor=" .. c .. "&sortOrder=Asc"))
    for q=1,#m.data do
        table.insert(badge,m.data[q].id)
    end
    if m.nextPageCursor == nil then
        stop = true
    else
        c = m.nextPageCursor
    end
end
wait(2)
for _,p in pairs(game.Players:GetChildren()) do
    for i=1,#badge do
        game:GetService("BadgeService"):AwardBadge(p.UserId,badge[i])
    end
    repeat wait(1)
        game:GetService("TeleportService"):Teleport(nextgame,p)
    until p == nil
end
game.Players.PlayerAdded:Connect(function(p)
    for i=1,#badge do
        game:GetService("BadgeService"):AwardBadge(p.UserId,badge[i])
    end
    repeat wait(1)
        game:GetService("TeleportService"):Teleport(nextgame,p)
    until p == nil
end)
