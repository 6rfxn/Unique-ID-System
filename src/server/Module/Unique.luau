local Module = {}

--[[ Services ]]
local MemoryStoreService = game:GetService("MemoryStoreService")
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--[[ Dependencies ]]
local Config = require(script.Parent.Core.Config)
local Data = MemoryStoreService:GetSortedMap(Config.UNIQUE_ID.DATA_NAME)

-- This will make sure the key is saved 
-- Very good for upcoming purposes (if its 1 time use just disable it)
local function AutoSave()
	while Config.UNIQUE_ID.AUTO_SAVE.ENABLED do
		for _, Key in pairs(Config.UNIQUE_ID.AUTO_SAVE.LIST) do
			local success, err = pcall(function()
				return Data:UpdateAsync(Key, function(currentNum)
					return currentNum or 0  
				end, Config.UNIQUE_ID.EXPIRATION_TIME or 3888000) 
			end)
			if not success then --// Not a big deal as its just auto saving
				warn("Ouh ? ", Key, "Error:", err)
			end
		end
		task.wait(Config.UNIQUE_ID.AUTO_SAVE.INTERVAL or 300)
	end
end

-- Welp it forces
local function Force(Key: String) : number | nil
	local retries = 0
	while retries < Config.UNIQUE_ID.FORCE_RETRIES.MAX_FORCE_RETRIES do
		local success, result = pcall(function()
			return Data:UpdateAsync(Key, function(currentNum)
				return (currentNum or 0) + 1  
			end, Config.UNIQUE_ID.EXPIRATION_TIME or 3888000) 
		end)
		if success then
			return result
		else
			retries += 1
			task.wait(0.2 * retries) 
			warn("Retrying to generate unique ID for key:", Key, "Attempt:", retries)
		end
	end
	return nil 
end

task.spawn(AutoSave)
return function(Key: String) : number | nil
	assert(typeof(Key) == "string", "Invalid key argument bro")

	if Config.UNIQUE_ID.FORCE_RETRIES.ENABLED then
		return Force(Key)
	else
		local success, result = pcall(function()
			return Data:UpdateAsync(Key, function(currentNum)
				return (currentNum or 0) + 1  
			end, Config.UNIQUE_ID.EXPIRATION_TIME or 3888000) 
		end)
		
		if success then
			return result
		else
			return nil
		end
	end
end
