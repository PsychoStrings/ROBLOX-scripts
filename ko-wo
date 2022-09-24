--Script by LaTehuana

stands = {}
CTF_mode = false


function onHumanoidDied(humanoid, player)
    local stats = player:findFirstChild("leaderstats")
    if stats ~= nil then
        local deaths = stats:findFirstChild("Wipeouts")
        deaths.Value = deaths.Value + 1


        local killer = getKillerOfHumanoidIfStillInGame(humanoid)

        handleKillCount(humanoid, player)
    end
end

function onPlayerRespawn(property, player)
    

    if property == "Character" and player.Character ~= nil then
        local humanoid = player.Character.Humanoid
        local p = player
        local h = humanoid
        humanoid.Died:connect(function() onHumanoidDied(h, p) end )
    end
end

function getKillerOfHumanoidIfStillInGame(humanoid)
    
    local tag = humanoid:findFirstChild("creator")

    
    if tag ~= nil then

        local killer = tag.Value
        if killer.Parent ~= nil then 
            return killer
        end
    end

    return nil
end

function handleKillCount(humanoid, player)
    local killer = getKillerOfHumanoidIfStillInGame(humanoid)
    if killer ~= nil then
        local stats = killer:findFirstChild("leaderstats")
        if stats ~= nil then
            local kills = stats:findFirstChild("KOs")
            if killer ~= player then
                kills.Value = kills.Value + 1

            else
                kills.Value = kills.Value - 1

            end
        end
    end
end


-----------------------------------------------



function findAllFlagStands(root)
    local c = root:children()
    for i=1,#c do
        if (c[i].className == "Model" or c[i].className == "Part") then
            findAllFlagStands(c[i])
        end
        if (c[i].className == "FlagStand") then
            table.insert(stands, c[i])
        end
    end
end

function hookUpListeners()
    for i=1,#stands do
        stands[i].FlagCaptured:connect(onCaptureScored)
    end
end

function onPlayerEntered(newPlayer)

    if CTF_mode == true then

        local stats = Instance.new("IntValue")
        stats.Name = "leaderstats"

        local captures = Instance.new("IntValue")
        captures.Name = "Captures"
        captures.Value = 0


        captures.Parent = stats

        
        while true do
            if newPlayer.Character ~= nil then break end
            wait(5)
        end

        stats.Parent = newPlayer

    else

        local stats = Instance.new("IntValue")
        stats.Name = "leaderstats"

        local kills = Instance.new("IntValue")
        kills.Name = "KOs"
        kills.Value = 0

        local deaths = Instance.new("IntValue")
        deaths.Name = "Wipeouts"
        deaths.Value = 0

        kills.Parent = stats
        deaths.Parent = stats

        
        while true do
            if newPlayer.Character ~= nil then break end
            wait(5)
        end

        local humanoid = newPlayer.Character.Humanoid

        humanoid.Died:connect(function() onHumanoidDied(humanoid, newPlayer) end )

        
        newPlayer.Changed:connect(function(property) onPlayerRespawn(property, newPlayer) end )


        stats.Parent = newPlayer

    end

end


function onCaptureScored(player)

    local ls = player:findFirstChild("leaderstats")
    if ls == nil then return end
    local caps = ls:findFirstChild("Captures")
    if caps == nil then return end
    caps.Value = caps.Value + 1

end


findAllFlagStands(game.Workspace)
hookUpListeners()
if (#stands > 0) then CTF_mode = true end
game.Players.ChildAdded:connect(onPlayerEntered)
