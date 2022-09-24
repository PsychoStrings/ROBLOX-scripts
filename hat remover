--Script by LaTehuana

local Game = game
local Players = Game:GetService("Players")

local function OnPlayerAdded(Player)
    local function OnCharacterAdded(Character)
        local function OnChildAdded(Child)
            if not (Child:IsA("Accoutrement")) then return end
            Child:Destroy()
        end
        Character.ChildAdded:Connect(OnChildAdded)
    end
    
    Player.CharacterAdded:Connect(OnCharacterAdded)
end

Players.PlayerAdded:Connect(OnPlayerAdded)
