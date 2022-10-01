--Script by LaTehuana

local players = game:GetService("Players")
local getHumanoidDescriptionFromUserId = players.GetHumanoidDescriptionFromUserId
local insert = game:GetService("InsertService")
local loadAsset = insert.LoadAsset
local starterPlayer = game:GetService("StarterPlayer")

local function getR6Avatar()
    local success, result = pcall(loadAsset, insert, 1785197)
    
    if success then
        if result then
            local starterCharacter = result:FindFirstChildOfClass("Model")
            if starterCharacter then
                starterCharacter.Name = "StarterCharacter"
                starterCharacter.Parent = game.StarterPlayer
                result:Destroy()
            end
        end
    else
        warn(result)
    end
end

local function onPlayerAdded(player)
    local function onCharacterAdded(character)
        task.wait(0.5)
        local humanoid = character:WaitForChild("Humanoid")
        local success, result = pcall(getHumanoidDescriptionFromUserId, players, player.UserId)
        if success then
            if result then
                humanoid:ApplyDescription(result)
            end
        else
            warn(result)
        end
    end
    
    player.CharacterAdded:Connect(onCharacterAdded)
end

players.PlayerAdded:Connect(onPlayerAdded)
getR6Avatar()
