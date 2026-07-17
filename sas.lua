local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local function IsEnemy(character)
	local targetPlayer = Players:GetPlayerFromCharacter(character)

	if not targetPlayer then
		return false
	end

	if targetPlayer.Team == Players.LocalPlayer.Team then
		return false
	end

	return true
end


local function checkLineOfSight(cameraPart, targetPart)

	if not IsEnemy(targetPart.Parent) then
		return false
	end

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = {
		cameraPart.Parent
	}

	local originPos = cameraPart.Position
	local size = targetPart.Size / 2

	local points = {
		targetPart.Position,

		targetPart.Position + Vector3.new(size.X,0,0),
		targetPart.Position - Vector3.new(size.X,0,0),

		targetPart.Position + Vector3.new(0,size.Y,0),
		targetPart.Position - Vector3.new(0,size.Y,0),

		targetPart.Position + Vector3.new(0,0,size.Z),
		targetPart.Position - Vector3.new(0,0,size.Z),

		targetPart.Position + Vector3.new(size.X,size.Y,size.Z),
		targetPart.Position + Vector3.new(-size.X,size.Y,size.Z),
		targetPart.Position + Vector3.new(size.X,-size.Y,size.Z),
		targetPart.Position + Vector3.new(-size.X,-size.Y,size.Z),
	}

	for _, targetPos in ipairs(points) do

		local direction = targetPos - originPos

		local result = Workspace:Raycast(
			originPos,
			direction,
			params
		)

		if not result then
			return true
		end

		if result.Instance:IsDescendantOf(targetPart.Parent) then
			return true
		end
	end

	return false
end
