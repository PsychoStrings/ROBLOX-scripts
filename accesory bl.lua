--Script by LaTehuana

local players = game:GetService("Players")
local marketplace = game:GetService("MarketplaceService")

players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if not player:HasAppearanceLoaded() then
            player.CharacterAppearanceLoaded:Wait()
        end
        
        local humanoid = character:WaitForChild("Humanoid")
        local description = humanoid:WaitForChild("HumanoidDescription")
        local accessories = description:GetAccessories(true)
        for _, accessory in ipairs(accessories) do
            local assetId = accessory.AssetId
            local success, result = pcall(function()
                return marketplace:GetProductInfo(assetId)
            end)
            
            if success then
                if result then
                    if result.Creator.Name ~= "Roblox" then
                        local characterAccessory = character:FindFirstChild(result.Name)
                        if characterAccessory then
                            characterAccessory:Destroy()
                        end
                    end
                end
            else
                warn(result)
            end
        end
    end)
end)

-----------------------------------------------------------

If you want to blacklist all UGC accessories.

alternatively you can switch this line 
if result.Creator.Name ~= "Roblox" then

to
if result.Creator.Name == "Roblox" then

in order to blacklist accessories created by roblox
