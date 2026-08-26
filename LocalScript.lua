local tool = script.Parent
if game.Players.LocalPlayer.Backpack:FindFirstChild(tool.Name) and game.Players.LocalPlayer.Backpack:FindFirstChild(tool.Name) ~= tool then
	game.Players.LocalPlayer.Backpack:FindFirstChild(tool.Name):Destroy()
end
local function ForceFirstPerson(v)
	game.Players.LocalPlayer.CameraMode = v and Enum.CameraMode.LockFirstPerson or Enum.CameraMode.Classic
end
_G.initTool = function()
	tool.Parent = game.Players.LocalPlayer.Backpack
end
tool.Equipped:Connect(function()
	task.wait()
	ForceFirstPerson(true)
end)
tool.Unequipped:Connect(function()
	ForceFirstPerson(false)
end)
tool:WaitForChild("ReplicatedStorage").Blaster.Remotes.Shoot.Event:Connect(function(time,_,origin,tagged)
	local tagged = tagged["1"]
	if tagged == nil then
		return
	end
	if tagged.taggedCharacter == _G.LocalCharacter or tagged.instance == _G.LocalCharacter then
		return
	end
	if tagged.taggedCharacter == _G.ReplicatedCharacter or tagged.instance == _G.ReplicatedCharacter then
		return
	end
	local hum = tagged.taggedHumanoid
	local char = tagged.taggedCharacter or tagged.instance
	if char == nil then
		return
	end
	if char.PrimaryPart == nil then
		return
	end
	if _G.Table == nil then
		return
	end
	if _G.Table[char.PrimaryPart] then
		return
	end
	Instance.new("Highlight",char)
	_G.Table[char.PrimaryPart] = char
end)
