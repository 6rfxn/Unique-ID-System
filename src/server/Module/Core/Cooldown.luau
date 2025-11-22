local module = {}
module.ActivePlayers = {}

--[[ Modules ]]
local Config = require(script.Parent.Config)

function module:Cooldown(player: Player, duration: Number)
    duration = duration or Config.COOLDOWN.COOLDOWN_DURATION
    if module.ActivePlayers[player.UserId] then
        if module.ActivePlayers[player.UserId] + duration > tick() then
            return false --// No 
        else
            module.ActivePlayers[player.UserId] = tick()
            return true --// Player is not on cooldown so proceed
        end
    else
        module.ActivePlayers[player.UserId] = tick()
        return true --// Player is new?
    end
end

function module:Remove(player: Player)
    if module.ActivePlayers[player.UserId] then
        module.ActivePlayers[player.UserId] = nil
    end
end

return module