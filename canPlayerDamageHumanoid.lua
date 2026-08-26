local Players = game:GetService("Players")

local function canPlayerDamageHumanoid(player: Player, taggedHumanoid: Humanoid): boolean
	-- If the humanoid is already dead, no need to apply more damage
	if taggedHumanoid.Health <= 0 then
		return false
	end

	local taggedCharacter = taggedHumanoid.Parent
	local taggedPlayer = Players:GetPlayerFromCharacter(taggedCharacter)
	
	if taggedCharacter.Name == "LocalCharacter" or game.Players.LocalPlayer.Character == taggedCharacter then
		return
	end
	
	-- If the player tagged a non-player humanoid then allow damage
	if not taggedPlayer then
		return true
	end
	

	return true
end

return canPlayerDamageHumanoid
