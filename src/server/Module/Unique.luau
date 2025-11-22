local Module = {}
Module.__index = Module

--[[ Services ]]
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

function Module.New(prefix, number)
	local self = setmetatable({}, Module)

	return self
end

return Module