--Script by LaTehuana

function onTouched(hit)
    local player = game.Players:GetPlayerFromCharacter(hit.Parent)
    if player then
        game:GetService("TeleportService"):Teleport(UNIVERSE ID,player)
    end
end
 
script.Parent.Touched:connect(onTouched)
