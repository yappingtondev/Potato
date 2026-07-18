local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local function addTeamHighlight(character, player)
	if character:FindFirstChild("TeamHighlight") then
		character.TeamHighlight:Destroy()
	end

	local highlight = Instance.new("Highlight")
	highlight.Name = "TeamHighlight"
	highlight.Adornee = character

	-- Team check
	if player.Team == LocalPlayer.Team then
		-- Teammate = Green
		highlight.FillColor = Color3.fromRGB(0, 255, 0)
		highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
	else
		-- Enemy = Red
		highlight.FillColor = Color3.fromRGB(255, 0, 0)
		highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
	end

	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0

	highlight.Parent = character
end


local function setupPlayer(player)
	player.CharacterAdded:Connect(function(character)
		task.wait(1)
		addTeamHighlight(character, player)
	end)

	if player.Character then
		addTeamHighlight(player.Character, player)
	end
end


for _, player in ipairs(Players:GetPlayers()) do
	setupPlayer(player)
end

Players.PlayerAdded:Connect(setupPlayer)
