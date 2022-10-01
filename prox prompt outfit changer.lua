--Script by LaTehuana

local ProximityPromptService = game:GetService('ProximityPromptService')
 
local shirt = nil    -- change to shirt instance
local pants = nil    -- change to pants instance

local function onPromptTriggered(promptObject, player)
    if player.Character then
        for _, item in pairs(player.Character:GetChildren()) do
            if item:IsA('Shirt') or item:IsA('Pants') then
                item:Destroy()
            end
        end
        shirt:Clone().Parent = player.Character
        pants:Clone().Parent = player.Character
    end
end
