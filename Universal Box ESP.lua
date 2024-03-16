game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Box ESP", Text = "By Mick Gordon"})
game:GetService("StarterGui"):SetCore("SendNotification", {Title = "https://discord.gg/FsApQ7YNTq", Text = "The Discord"})
local HEBOXESP = Instance.new("ScreenGui") HEBOXESP.Name = "HEBOXESP" HEBOXESP.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") HEBOXESP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling HEBOXESP.ResetOnSpawn = false
local HEBoxes = Instance.new("Frame")HEBoxes.Name = "HEBoxes" HEBoxes.Parent = HEBOXESP HEBoxes.BackgroundColor3 = Color3.fromRGB(52, 52, 52) HEBoxes.BorderColor3 = Color3.fromRGB(255, 255, 255) HEBoxes.Position = UDim2.new(0.117352635, 0, 0.340447158, 0) HEBoxes.Size = UDim2.new(0, 241, 0, 231) HEBoxes.Active = true HEBoxes.Draggable = true
local TextBox = Instance.new("TextBox")TextBox.Parent = HEBoxes TextBox.Active = false TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextBox.BackgroundTransparency = 1.000 TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0) TextBox.BorderSizePixel = 0 TextBox.Position = UDim2.new(0.0829875544, 0, 0.823943675, 0) TextBox.Size = UDim2.new(0, 200, 0, 50) TextBox.ClearTextOnFocus = false TextBox.Font = Enum.Font.Roboto TextBox.PlaceholderText = "https://discord.gg/FsApQ7YNTq" TextBox.Text = "https://discord.gg/FsApQ7YNTq -ClickMe" TextBox.TextColor3 = Color3.fromRGB(255, 255, 255) TextBox.TextSize = 14.000
local Frame = Instance.new("Frame")Frame.Parent = HEBoxes Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Frame.BackgroundTransparency = 1.000 Frame.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame.BorderSizePixel = 0 Frame.Position = UDim2.new(0.495850623, 0, 0.26418829, 0) Frame.Size = UDim2.new(0, 121, 0, 100)
local UIListLayout = Instance.new("UIListLayout")UIListLayout.Parent = Frame UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout.Padding = UDim.new(0, 5)
local TextLabel = Instance.new("TextLabel")TextLabel.Parent = Frame TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel.BackgroundTransparency = 1.000 TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel.BorderSizePixel = 0 TextLabel.Position = UDim2.new(0.0829875544, 0, 0.37352246, 0) TextLabel.Size = UDim2.new(0, 100, 0, 17) TextLabel.Font = Enum.Font.Roboto TextLabel.Text = "Info" TextLabel.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel.TextSize = 17.000
local Showname = Instance.new("TextButton")Showname.Name = "Showname" Showname.Parent = Frame Showname.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Showname.BorderColor3 = Color3.fromRGB(255, 255, 255) Showname.Position = UDim2.new(0.234439835, 0, 0.0661938563, 0) Showname.Size = UDim2.new(0, 100, 0, 24) Showname.Font = Enum.Font.Roboto Showname.Text = "Show name" Showname.TextColor3 = Color3.fromRGB(255, 255, 255) Showname.TextSize = 17.000
local Showdistance = Instance.new("TextButton")Showdistance.Name = "Showdistance" Showdistance.Parent = Frame Showdistance.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Showdistance.BorderColor3 = Color3.fromRGB(255, 255, 255) Showdistance.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Showdistance.Size = UDim2.new(0, 100, 0, 24) Showdistance.Font = Enum.Font.Roboto Showdistance.Text = "Show distance" Showdistance.TextColor3 = Color3.fromRGB(255, 255, 255) Showdistance.TextSize = 14.000
local HealthType = Instance.new("TextButton")HealthType.Name = "HealthType" HealthType.Parent = Frame HealthType.BackgroundColor3 = Color3.fromRGB(52, 52, 52) HealthType.BorderColor3 = Color3.fromRGB(255, 255, 255) HealthType.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) HealthType.Size = UDim2.new(0, 100, 0, 24) HealthType.Font = Enum.Font.Roboto HealthType.Text = "TEXT, bar, both" HealthType.TextColor3 = Color3.fromRGB(255, 255, 255) HealthType.TextSize = 17.000
local Frame_2 = Instance.new("Frame")Frame_2.Parent = HEBoxes Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Frame_2.BackgroundTransparency = 1.000 Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_2.BorderSizePixel = 0 Frame_2.Position = UDim2.new(-0.00207468891, 0, 0.26418829, 0) Frame_2.Size = UDim2.new(0, 121, 0, 150)
local UIListLayout_2 = Instance.new("UIListLayout")UIListLayout_2.Parent = Frame_2 UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_2.Padding = UDim.new(0, 5)
local TextLabel_2 = Instance.new("TextLabel")TextLabel_2.Parent = Frame_2 TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel_2.BackgroundTransparency = 1.000 TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel_2.BorderSizePixel = 0 TextLabel_2.Position = UDim2.new(0.0829875544, 0, 0.37352246, 0) TextLabel_2.Size = UDim2.new(0, 100, 0, 17) TextLabel_2.Font = Enum.Font.Roboto TextLabel_2.Text = "Show Box" TextLabel_2.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel_2.TextSize = 17.000
local Boundingbox = Instance.new("TextButton")Boundingbox.Name = "Boundingbox" Boundingbox.Parent = Frame_2 Boundingbox.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Boundingbox.BorderColor3 = Color3.fromRGB(255, 255, 255) Boundingbox.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Boundingbox.Size = UDim2.new(0, 100, 0, 24) Boundingbox.Font = Enum.Font.Roboto Boundingbox.Text = "Bounding box" Boundingbox.TextColor3 = Color3.fromRGB(255, 255, 255) Boundingbox.TextSize = 17.000
local UseTeamColor = Instance.new("TextButton")UseTeamColor.Name = "UseTeamColor" UseTeamColor.Parent = Frame_2 UseTeamColor.BackgroundColor3 = Color3.fromRGB(52, 52, 52) UseTeamColor.BorderColor3 = Color3.fromRGB(255, 255, 255) UseTeamColor.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) UseTeamColor.Size = UDim2.new(0, 100, 0, 24) UseTeamColor.Font = Enum.Font.Roboto UseTeamColor.Text = "Use TeamColor" UseTeamColor.TextColor3 = Color3.fromRGB(255, 255, 255) UseTeamColor.TextSize = 14.000
local Showhealth = Instance.new("TextButton")Showhealth.Name = "Showhealth" Showhealth.Parent = Frame_2 Showhealth.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Showhealth.BorderColor3 = Color3.fromRGB(255, 255, 255) Showhealth.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Showhealth.Size = UDim2.new(0, 100, 0, 24) Showhealth.Font = Enum.Font.Roboto Showhealth.Text = "Show health" Showhealth.TextColor3 = Color3.fromRGB(255, 255, 255) Showhealth.TextSize = 17.000
local A = Instance.new("TextLabel")A.Name = "A" A.Parent = HEBoxes A.BackgroundColor3 = Color3.fromRGB(255, 255, 255) A.BackgroundTransparency = 1.000 A.BorderColor3 = Color3.fromRGB(0, 0, 0) A.BorderSizePixel = 0 A.Position = UDim2.new(0.0829875544, 0, -0.0318399332, 0) A.Size = UDim2.new(0, 200, 0, 50) A.Font = Enum.Font.Roboto A.Text = "Hyper Escape | Box ESP" A.TextColor3 = Color3.fromRGB(17, 223, 255) A.TextSize = 19.000
local Frame_3 = Instance.new("Frame")Frame_3.Parent = HEBoxes Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Frame_3.BackgroundTransparency = 1.000 Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_3.BorderSizePixel = 0 Frame_3.Position = UDim2.new(0.287999988, 0, 0.150000006, 0) Frame_3.Size = UDim2.new(0, 100, 0, 82)
local UIListLayout_3 = Instance.new("UIListLayout")UIListLayout_3.Parent = Frame_3 UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_3.Padding = UDim.new(0, 7)
local EnablTeamCheck = Instance.new("TextButton")EnablTeamCheck.Name = "EnablTeamCheck" EnablTeamCheck.Parent = Frame_3 EnablTeamCheck.BackgroundColor3 = Color3.fromRGB(52, 52, 52) EnablTeamCheck.BorderColor3 = Color3.fromRGB(255, 255, 255) EnablTeamCheck.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) EnablTeamCheck.Size = UDim2.new(0, 122, 0, 24) EnablTeamCheck.Font = Enum.Font.Roboto EnablTeamCheck.Text = "Show Team" EnablTeamCheck.TextColor3 = Color3.fromRGB(255, 255, 255) EnablTeamCheck.TextSize = 17.000
local A_2 = Instance.new("TextLabel")A_2.Name = "A" A_2.Parent = HEBoxes A_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255) A_2.BackgroundTransparency = 1.000 A_2.BorderColor3 = Color3.fromRGB(0, 0, 0) A_2.BorderSizePixel = 0 A_2.Position = UDim2.new(0.46887967, 0, 0.630497932, 0) A_2.Size = UDim2.new(0, 12, 0, 14) A_2.Font = Enum.Font.Roboto A_2.Text = "=" A_2.TextColor3 = Color3.fromRGB(255, 255, 255) A_2.TextSize = 19.000
local localplayer = game:GetService"Players".LocalPlayer

local cheats = {
	Boundingbox = false; 
	Showdistance = false;
	Showname = false; 
	Showhealth = false;
	b_ht = "Bar"; 
	EnablTeamCheck = false; 
	UseTeamColor = false; 
	HealthType = false; 
}

local cheatsf = Instance.new("Folder", game.Workspace) cheatsf.Name = "cheats"
local espf = Instance.new("Folder", cheatsf) espf.Name = "esp"

function AddBox(player)
	local bbg = Instance.new("BillboardGui", espf)
	bbg.Name = player.Name
	bbg.AlwaysOnTop = true
	bbg.Size = UDim2.new(4,0,5.4,0)
	bbg.ClipsDescendants = false

	local outlines = Instance.new("Frame", bbg)
	outlines.Size = UDim2.new(1,0,1,0)
	outlines.BorderSizePixel = 0
	outlines.BackgroundTransparency = 1
	local left = Instance.new("Frame", outlines)
	left.BorderSizePixel = 0
	left.Size = UDim2.new(0,1,1,0)
	local right = left:Clone()
	right.Parent = outlines
	right.Size = UDim2.new(0,-1,1,0)
	right.Position = UDim2.new(1,0,0,0)
	local up = left:Clone()
	up.Parent = outlines
	up.Size = UDim2.new(1,0,0,1)
	local down = left:Clone()
	down.Parent = outlines
	down.Size = UDim2.new(1,0,0,-1)
	down.Position = UDim2.new(0,0,1,0)

	local info = Instance.new("BillboardGui", bbg)
	info.Name = "info"
	info.Size = UDim2.new(3,0,0,54)
	info.StudsOffset = Vector3.new(3.6,-3,0)
	info.AlwaysOnTop = true
	info.ClipsDescendants = false
	local namelabel = Instance.new("TextLabel", info)
	namelabel.Name = "namelabel"
	namelabel.BackgroundTransparency = 1
	namelabel.TextStrokeTransparency = 0
	namelabel.TextXAlignment = Enum.TextXAlignment.Left
	namelabel.Size = UDim2.new(0,100,0,18)
	namelabel.Position = UDim2.new(0,0,0,0)
	namelabel.Text = player.Name
	local distancel = Instance.new("TextLabel", info)
	distancel.Name = "distancelabel"
	distancel.BackgroundTransparency = 1
	distancel.TextStrokeTransparency = 0
	distancel.TextXAlignment = Enum.TextXAlignment.Left
	distancel.Size = UDim2.new(0,100,0,18)
	distancel.Position = UDim2.new(0,0,0,18)
	local healthl = Instance.new("TextLabel", info)
	healthl.Name = "healthlabel"
	healthl.BackgroundTransparency = 1
	healthl.TextStrokeTransparency = 0
	healthl.TextXAlignment = Enum.TextXAlignment.Left
	healthl.Size = UDim2.new(0,100,0,18)
	healthl.Position = UDim2.new(0,0,0,36)

	local uill = Instance.new("UIListLayout", info)

	local forhealth = Instance.new("BillboardGui", bbg)
	forhealth.Name = "forhealth"
	forhealth.Size = UDim2.new(5,0,6,0)
	forhealth.AlwaysOnTop = true
	forhealth.ClipsDescendants = false

	local healthbar = Instance.new("Frame", forhealth)
	healthbar.Name = "healthbar"
	healthbar.BackgroundColor3 = Color3.fromRGB(40,40,40)
	healthbar.BorderColor3 = Color3.fromRGB(0,0,0)
	healthbar.Size = UDim2.new(0.04,0,0.9,0)
	healthbar.Position = UDim2.new(0,0,0.05,0)
	local bar = Instance.new("Frame", healthbar)
	bar.Name = "bar"
	bar.BorderSizePixel = 0
	bar.BackgroundColor3 = Color3.fromRGB(94,255,69)
	bar.AnchorPoint = Vector2.new(0,1)
	bar.Position = UDim2.new(0,0,1,0)
	bar.Size = UDim2.new(1,0,1,0)

	local co = coroutine.create(function()
		while wait(0.1) do
			if (player.Character and player.Character:FindFirstChild"HumanoidRootPart" and player.Character.Humanoid.Health > 0) then
				bbg.Adornee = player.Character.HumanoidRootPart
				info.Adornee = player.Character.HumanoidRootPart
				forhealth.Adornee = player.Character.HumanoidRootPart
				if (player.Team ~= localplayer.Team) then
					bbg.Enabled = true
					info.Enabled = true
					forhealth.Enabled = true
				end
				if cheats.Boundingbox == true then
					outlines.Visible = true
				else
					outlines.Visible = false
				end
				if cheats.Showhealth == true then
					if (player.Character:FindFirstChild"Humanoid") then
						healthl.Text = "Health: "..math.floor(player.Character:FindFirstChild"Humanoid".Health)
						healthbar.bar.Size = UDim2.new(1,0,player.Character:FindFirstChild"Humanoid".Health/player.Character:FindFirstChild"Humanoid".MaxHealth,0)
					end
					if cheats.b_ht == "Text" then
						healthbar.Visible = false
						healthl.Visible = true
					end
					if cheats.b_ht == "Bar" then
						healthl.Visible = false
						healthbar.Visible = true
					end
					if cheats.b_ht == "Both" then
						healthl.Visible = true
						healthbar.Visible = true
					end
				else
					healthl.Visible = false
					healthbar.Visible = false
				end
				if cheats.Showname then
					namelabel.Visible = true
				else
					namelabel.Visible = false
				end
				if cheats.Showdistance == true then
					distancel.Visible = true
					if (localplayer.Character and localplayer.Character:FindFirstChild"HumanoidRootPart") then
						distancel.Text = "Distance: "..math.floor(0.5+(localplayer.Character:FindFirstChild"HumanoidRootPart".Position - player.Character:FindFirstChild"HumanoidRootPart".Position).magnitude)
					end
				else
					distancel.Visible = false
				end
				if cheats.EnablTeamCheck == true then
					if (player.Team == localplayer.Team) then
						bbg.Enabled = true
						info.Enabled = true
						forhealth.Enabled = true
					end
				else
					if (player.Team == localplayer.Team) then
						bbg.Enabled = false
						info.Enabled = false
						forhealth.Enabled = false
					end
				end
				if cheats.UseTeamColor == true then
					left.BackgroundColor3 = player.TeamColor.Color
					right.BackgroundColor3 = player.TeamColor.Color
					up.BackgroundColor3 = player.TeamColor.Color
					down.BackgroundColor3 = player.TeamColor.Color
					healthl.TextColor3 = player.TeamColor.Color
					distancel.TextColor3 = player.TeamColor.Color
					namelabel.TextColor3 = player.TeamColor.Color
				else
					left.BackgroundColor3 = Color3.fromRGB(255,255,255)
					right.BackgroundColor3 = Color3.fromRGB(255,255,255)
					up.BackgroundColor3 = Color3.fromRGB(255,255,255)
					down.BackgroundColor3 = Color3.fromRGB(255,255,255)
					healthl.TextColor3 = Color3.fromRGB(255,255,255)
					distancel.TextColor3 = Color3.fromRGB(255,255,255)
					namelabel.TextColor3 = Color3.fromRGB(255,255,255)
				end
			else
				bbg.Enabled = false
				info.Enabled = false
				forhealth.Enabled = false
				
				bbg.Adornee = nil
				info.Adornee = nil
				forhealth.Adornee = nil
			end
			if not (game:GetService"Players":FindFirstChild(player.Name)) then
				espf:FindFirstChild(player.Name):Destroy()
				coroutine.yield()
			end
		end
	end)
	coroutine.resume(co)
end

do
	wait(2)

	for _,button in pairs(HEBOXESP:GetDescendants()) do
		if button:IsA"TextButton" then
			button.MouseButton1Click:connect(function()
				if button.Name == "HealthType" then
					if cheats.b_ht == "Text" then
						cheats.b_ht = "Bar"
						HealthType.Text = "text, BAR, both"
					elseif cheats.b_ht == "Bar" then
						cheats.b_ht = "Both"
						HealthType.Text = "text, bar, BOTH"
					else
						cheats.b_ht = "Text"
						HealthType.Text = "TEXT, bar, both"
					end
				else
					if cheats[button.Name] == true then
						cheats[button.Name] = false
						button.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
					else
						cheats[button.Name] = true
						button.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
					end
				end	
			end)
		end
	end
end

for i,plr in pairs(game.Players:GetChildren()) do
	if plr ~= localplayer then
		AddBox(plr)
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	if plr ~= localplayer then
		AddBox(plr)
	end
end)

