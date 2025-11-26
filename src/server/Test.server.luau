local Unique = require(script.Parent.Module.Unique)
local CooldownModule = require(script.Parent.Module.Core.Cooldown)

--// Dont use this , its just for testing purposes
local function Testing(player: Player)
    if player.Name == "6rfxn" then
        local Test_Key = "Test1"
        while true do
            if CooldownModule:Cooldown(player) then 
                print(Unique(Test_Key))
            end
            task.wait(1)
        end 
    end
end
game.Players.PlayerAdded:Connect(Testing)
