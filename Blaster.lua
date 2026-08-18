local ReplicatedStorage = script.Parent.Parent:WaitForChild("ReplicatedStorage")
local BlasterController = require(ReplicatedStorage.Blaster.Scripts.BlasterController)
local bindToInstanceDestroyed = require(ReplicatedStorage.Utility.bindToInstanceDestroyed)
local blaster = script.Parent.Parent
local controller = BlasterController.new(blaster)
bindToInstanceDestroyed(blaster, function()
	controller:destroy()
end)
