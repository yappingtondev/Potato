   local Workspace = game:GetService("Workspace")
   local Players = game:GetService("Players")

local function IsEnemy(character)
	local targetPlayer = Players:GetPlayerFromCharacter(character)

	if not targetPlayer then
		return false
	end

	-- Ignore teammates
	if targetPlayer.Team == Players.LocalPlayer.Team then
		return false
	end
	if not IsEnemy(character) then
		return false
	end

return checkLineOfSight(cameraPart, character.Head)
	return true
end

local function checkLineOfSight(cameraPart, character.Head)
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = {originPart.Parent}

	local originPos = originPart.Position
	local size = targetPart.Size / 2

	-- Points we'll check
	local points = {
		targetPart.Position, -- center

		targetPart.Position + Vector3.new(size.X,0,0),
		targetPart.Position - Vector3.new(size.X,0,0),

		targetPart.Position + Vector3.new(0,size.Y,0),
		targetPart.Position - Vector3.new(0,size.Y,0),

		targetPart.Position + Vector3.new(0,0,size.Z),
		targetPart.Position - Vector3.new(0,0,size.Z),

		-- corners
		targetPart.Position + Vector3.new(size.X,size.Y,size.Z),
		targetPart.Position + Vector3.new(-size.X,size.Y,size.Z),
		targetPart.Position + Vector3.new(size.X,-size.Y,size.Z),
		targetPart.Position + Vector3.new(-size.X,-size.Y,size.Z),

		targetPart.Position + Vector3.new(size.X,size.Y,-size.Z),
		targetPart.Position + Vector3.new(-size.X,size.Y,-size.Z),
		targetPart.Position + Vector3.new(size.X,-size.Y,-size.Z),
		targetPart.Position + Vector3.new(-size.X,-size.Y,-size.Z),
	}

	for _, targetPos in ipairs(points) do
		local direction = targetPos - originPos

		local result = Workspace:Raycast(originPos, direction, params)

		-- Nothing hit = visible
		if not result then
			return true
		end

		-- Hit the character = visible
		if result.Instance:IsDescendantOf(targetPart.Parent) then
			return true
    end
  end
    
