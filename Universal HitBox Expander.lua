local HitboxV2 = Instance.new("ScreenGui")HitboxV2.Name = "HitboxV2" HitboxV2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") HitboxV2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling HitboxV2.ResetOnSpawn = false
local HEHITBOXV2 = Instance.new("Frame")HEHITBOXV2.Name = "HEHITBOXV2" HEHITBOXV2.Parent = HitboxV2 HEHITBOXV2.BackgroundColor3 = Color3.fromRGB(52, 52, 52) HEHITBOXV2.BorderColor3 = Color3.fromRGB(255, 255, 255) HEHITBOXV2.Position = UDim2.new(0.340681225, 0, 0.409215063, 0) HEHITBOXV2.Size = UDim2.new(0, 241, 0, 340) HEHITBOXV2.Active = true HEHITBOXV2.Draggable = true
local TextBox = Instance.new("TextBox")TextBox.Parent = HEHITBOXV2 TextBox.Active = false TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextBox.BackgroundTransparency = 1.000 TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0) TextBox.BorderSizePixel = 0 TextBox.Position = UDim2.new(0.0829875544, 0, 0.929825902, 0) TextBox.Size = UDim2.new(0, 200, 0, 23) TextBox.ClearTextOnFocus = false TextBox.Font = Enum.Font.Roboto TextBox.PlaceholderText = "https://discord.gg/FsApQ7YNTq" TextBox.Text = "https://discord.gg/FsApQ7YNTq -ClickMe" TextBox.TextColor3 = Color3.fromRGB(255, 255, 255) TextBox.TextSize = 14.000 
local Frame = Instance.new("Frame")Frame.Parent = HEHITBOXV2 Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Frame.BackgroundTransparency = 1.000 Frame.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame.BorderSizePixel = 0 Frame.Position = UDim2.new(0.246999905, 0, 0.306470633, 0) Frame.Size = UDim2.new(0, 121, 0, 100)
local UIListLayout = Instance.new("UIListLayout")UIListLayout.Parent = Frame UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout.Padding = UDim.new(0, 5)
local TextLabel = Instance.new("TextLabel")TextLabel.Parent = Frame TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel.BackgroundTransparency = 1.000 TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel.BorderSizePixel = 0 TextLabel.Position = UDim2.new(0.0829875544, 0, 0.37352246, 0) TextLabel.Size = UDim2.new(0, 100, 0, 17) TextLabel.Font = Enum.Font.Roboto TextLabel.Text = "Hitbox Type" TextLabel.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel.TextSize = 17.000
local Head = Instance.new("TextButton")Head.Name = "Head" Head.Parent = Frame Head.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Head.BorderColor3 = Color3.fromRGB(255, 255, 255) Head.Position = UDim2.new(0.234439835, 0, 0.0661938563, 0) Head.Size = UDim2.new(0, 100, 0, 24) Head.Font = Enum.Font.Roboto Head.Text = "Head" Head.TextColor3 = Color3.fromRGB(255, 255, 255) Head.TextSize = 15.000 
local Torso = Instance.new("TextButton")Torso.Name = "Torso" Torso.Parent = Frame Torso.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Torso.BorderColor3 = Color3.fromRGB(255, 255, 255) Torso.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Torso.Size = UDim2.new(0, 100, 0, 24) Torso.Font = Enum.Font.Roboto Torso.Text = "Torso" Torso.TextColor3 = Color3.fromRGB(255, 255, 255) Torso.TextSize = 15.000
local Name = Instance.new("TextLabel")Name.Name = "Name" Name.Parent = HEHITBOXV2 Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Name.BackgroundTransparency = 1.000 Name.BorderColor3 = Color3.fromRGB(0, 0, 0) Name.BorderSizePixel = 0 Name.Position = UDim2.new(0.0829875544, 0, -0.0318399332, 0) Name.Size = UDim2.new(0, 200, 0, 50) Name.Font = Enum.Font.Roboto Name.Text = "Hyper Escape | Hitbox Extender" Name.TextColor3 = Color3.fromRGB(17, 223, 255) Name.TextSize = 19.000
local Frame_2 = Instance.new("Frame")Frame_2.Parent = HEHITBOXV2 Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Frame_2.BackgroundTransparency = 1.000 Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_2.BorderSizePixel = 0 Frame_2.Position = UDim2.new(0.287999839, 0, 0.0676470622, 0) Frame_2.Size = UDim2.new(0, 100, 0, 82)
local UIListLayout_2 = Instance.new("UIListLayout")UIListLayout_2.Parent = Frame_2 UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_2.Padding = UDim.new(0, 5)
local Enable_Hitbo = Instance.new("TextButton") Enable_Hitbo.Name = "Enable_Hitbo" Enable_Hitbo.Parent = Frame_2 Enable_Hitbo.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Enable_Hitbo.BorderColor3 = Color3.fromRGB(255, 255, 255) Enable_Hitbo.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Enable_Hitbo.Size = UDim2.new(0, 122, 0, 24) Enable_Hitbo.Font = Enum.Font.Roboto Enable_Hitbo.Text = "Enable" Enable_Hitbo.TextColor3 = Color3.fromRGB(255, 255, 255) Enable_Hitbo.TextSize = 17.000
local Teamcheck = Instance.new("TextButton")Teamcheck.Name = "Teamcheck" Teamcheck.Parent = Frame_2 Teamcheck.BackgroundColor3 = Color3.fromRGB(2, 54, 8) Teamcheck.BorderColor3 = Color3.fromRGB(255, 255, 255) Teamcheck.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Teamcheck.Size = UDim2.new(0, 122, 0, 24) Teamcheck.Font = Enum.Font.Roboto Teamcheck.Text = "Teamcheck" Teamcheck.TextColor3 = Color3.fromRGB(255, 255, 255) Teamcheck.TextSize = 17.000
local HitboxSize = Instance.new("TextBox")HitboxSize.Name = "Hitbox Size" HitboxSize.Parent = Frame_2 HitboxSize.BackgroundColor3 = Color3.fromRGB(52, 52, 52) HitboxSize.BorderColor3 = Color3.fromRGB(255, 255, 255) HitboxSize.Size = UDim2.new(0, 122, 0, 24) HitboxSize.ClearTextOnFocus = false HitboxSize.Font = Enum.Font.Roboto HitboxSize.PlaceholderText = "Hitbox Size" HitboxSize.Text = "7" HitboxSize.TextColor3 = Color3.fromRGB(255, 255, 255) HitboxSize.TextSize = 14.000
local Frame_3 = Instance.new("Frame") Frame_3.Parent = HEHITBOXV2 Frame_3.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_3.BorderSizePixel = 0 Frame_3.Position = UDim2.new(0.246999905, 0, 0.538823545, 0) Frame_3.Size = UDim2.new(0, 121, 0, 34)
local TextLabel_2 = Instance.new("TextLabel")TextLabel_2.Parent = Frame_3 TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel_2.BackgroundTransparency = 1.000 TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel_2.BorderSizePixel = 0 TextLabel_2.Position = UDim2.new(0.0747231692, 0, -0.0288301352, 0) TextLabel_2.Size = UDim2.new(0, 100, 0, 17) TextLabel_2.Font = Enum.Font.Roboto TextLabel_2.Text = "Hitbox Color" TextLabel_2.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel_2.TextSize = 17.000
local Frame_4 = Instance.new("Frame")Frame_4.Parent = Frame_3 Frame_4.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_4.BorderSizePixel = 0 Frame_4.Position = UDim2.new(0.0826446265, 0, 0.600000024, 0) Frame_4.Size = UDim2.new(0, 100, 0, 40)
local UIListLayout_3 = Instance.new("UIListLayout")UIListLayout_3.Parent = Frame_4 UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_3.Padding = UDim.new(0, 5)
local Color_R = Instance.new("TextBox")Color_R.Name = "Color_R" Color_R.Parent = Frame_4 Color_R.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_R.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_R.Size = UDim2.new(0, 75, 0, 24) Color_R.ClearTextOnFocus = false Color_R.Font = Enum.Font.Roboto Color_R.PlaceholderText = "255 - 0" Color_R.Text = "102" Color_R.TextColor3 = Color3.fromRGB(255, 255, 255) Color_R.TextSize = 14.000
local Color_G = Instance.new("TextBox")Color_G.Name = "Color_G" Color_G.Parent = Frame_4 Color_G.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_G.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_G.Size = UDim2.new(0, 75, 0, 24) Color_G.ClearTextOnFocus = false Color_G.Font = Enum.Font.Roboto Color_G.PlaceholderText = "255 - 0" Color_G.Text = "0" Color_G.TextColor3 = Color3.fromRGB(255, 255, 255) Color_G.TextSize = 14.000
local Color_B = Instance.new("TextBox")Color_B.Name = "Color_B" Color_B.Parent = Frame_4 Color_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_B.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_B.Size = UDim2.new(0, 75, 0, 24) Color_B.ClearTextOnFocus = false Color_B.Font = Enum.Font.Roboto Color_B.PlaceholderText = "255 - 0" Color_B.Text = "101" Color_B.TextColor3 = Color3.fromRGB(255, 255, 255) Color_B.TextSize = 14.000
local Frame_5 = Instance.new("Frame")Frame_5.Parent = Frame_3 Frame_5.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_5.BorderSizePixel = 0 Frame_5.Position = UDim2.new(0.0826446265, 0, 1.95294189, 0) Frame_5.Size = UDim2.new(0, 100, 0, 40)
local UIListLayout_4 = Instance.new("UIListLayout")UIListLayout_4.Parent = Frame_5 UIListLayout_4.FillDirection = Enum.FillDirection.Horizontal UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_4.Padding = UDim.new(0, 5)
local Transparency = Instance.new("TextBox")Transparency.Name = "Transparency" Transparency.Parent = Frame_5 Transparency.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Transparency.BorderColor3 = Color3.fromRGB(255, 255, 255) Transparency.Size = UDim2.new(0, 75, 0, 24) Transparency.ClearTextOnFocus = false Transparency.Font = Enum.Font.Roboto Transparency.PlaceholderText = "1 - 0" Transparency.Text = "0" Transparency.TextColor3 = Color3.fromRGB(255, 255, 255) Transparency.TextSize = 14.000
local TextLabel_3 = Instance.new("TextLabel")TextLabel_3.Parent = Frame_3 TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel_3.BackgroundTransparency = 1.000 TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel_3.BorderSizePixel = 0 TextLabel_3.Position = UDim2.new(0.0747231692, 0, 1.47116983, 0) TextLabel_3.Size = UDim2.new(0, 100, 0, 17) TextLabel_3.Font = Enum.Font.Roboto TextLabel_3.Text = "Transparency" TextLabel_3.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel_3.TextSize = 17.000
local Frame_6 = Instance.new("Frame")Frame_6.Parent = Frame_3 Frame_6.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Frame_6.BackgroundTransparency = 1.000 Frame_6.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_6.BorderSizePixel = 0 Frame_6.Position = UDim2.new(0.0826446265, 0, 3.12941241, 0) Frame_6.Size = UDim2.new(0, 100, 0, 40)
local UIListLayout_5 = Instance.new("UIListLayout")UIListLayout_5.Parent = Frame_6 UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_5.Padding = UDim.new(0, 5)
local ForceField_B = Instance.new("TextButton")ForceField_B.Name = "ForceField_B" ForceField_B.Parent = Frame_6 ForceField_B.BackgroundColor3 = Color3.fromRGB(2, 54, 8) ForceField_B.BorderColor3 = Color3.fromRGB(255, 255, 255) ForceField_B.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) ForceField_B.Size = UDim2.new(0, 75, 0, 24) ForceField_B.Font = Enum.Font.Roboto ForceField_B.Text = "Force Field" ForceField_B.TextColor3 = Color3.fromRGB(255, 255, 255) ForceField_B.TextSize = 15.000
local Neon_B = Instance.new("TextButton")Neon_B.Name = "Neon_B" Neon_B.Parent = Frame_6 Neon_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Neon_B.BorderColor3 = Color3.fromRGB(255, 255, 255) Neon_B.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Neon_B.Size = UDim2.new(0, 75, 0, 24) Neon_B.Font = Enum.Font.Roboto Neon_B.Text = "Neon" Neon_B.TextColor3 = Color3.fromRGB(255, 255, 255) Neon_B.TextSize = 15.000
local SmoothPlastic = Instance.new("TextButton")SmoothPlastic.Name = "SmoothPlastic" SmoothPlastic.Parent = Frame_6 SmoothPlastic.BackgroundColor3 = Color3.fromRGB(52, 52, 52) SmoothPlastic.BorderColor3 = Color3.fromRGB(255, 255, 255) SmoothPlastic.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) SmoothPlastic.Size = UDim2.new(0, 75, 0, 24) SmoothPlastic.Font = Enum.Font.Roboto SmoothPlastic.Text = "SmoothPlastic" SmoothPlastic.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothPlastic.TextScaled = true SmoothPlastic.TextSize = 3.000 SmoothPlastic.TextWrapped = true
local player = game.Players.LocalPlayer
local HitboxExtender ={
	Enabled  = false;
	Teamcheck = true;
	TeamColor = false;
	HitboxPart = "Head"; 

	Material = "ForceField";
}
Head.MouseButton1Click:Connect(function()
	HitboxExtender.HitboxPart = "Head"
	Torso.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
	Head.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
end)
Torso.MouseButton1Click:Connect(function()
	HitboxExtender.HitboxPart = "HumanoidRootPart"
	Torso.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
	Head.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
end)
Enable_Hitbo.MouseButton1Click:Connect(function()
	if HitboxExtender.Enabled == true then
		Enable_Hitbo.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		HitboxExtender.Enabled = false
	else
		Enable_Hitbo.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		HitboxExtender.Enabled = true
	end
end)
Teamcheck.MouseButton1Click:Connect(function()
	if HitboxExtender.Teamcheck == true then
		HitboxExtender.Teamcheck = false
		Teamcheck.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
	else
		Teamcheck.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
		HitboxExtender.Teamcheck = true
	end
end)
ForceField_B.MouseButton1Click:Connect(function()
	HitboxExtender.Material = "ForceField"
	ForceField_B.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
	Neon_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
	SmoothPlastic.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
end)
Neon_B.MouseButton1Click:Connect(function()
	HitboxExtender.Material = "Neon"
	Neon_B.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
	ForceField_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
	SmoothPlastic.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
end)
SmoothPlastic.MouseButton1Click:Connect(function()
	HitboxExtender.Material = "SmoothPlastic"
	SmoothPlastic.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
	Neon_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
	ForceField_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
end)

while wait(1.1) do 
	if HitboxExtender.Enabled == true then
		for i,v in next, game:GetService('Players'):GetPlayers() do
			if v.Name ~= game:GetService('Players').LocalPlayer.Name then
				pcall(function()
					if HitboxExtender.Teamcheck == true then 
						if v.Team ~= player.Team then 
							v.Character[HitboxExtender.HitboxPart].Size = Vector3.new(HitboxSize.Text,HitboxSize.Text,HitboxSize.Text)
							v.Character[HitboxExtender.HitboxPart].Transparency = Transparency.Text
							v.Character[HitboxExtender.HitboxPart].Material = HitboxExtender.Material
							v.Character[HitboxExtender.HitboxPart].CanCollide = false
							if HitboxExtender.TeamColor == true then
								v.Character[HitboxExtender.HitboxPart].Color = v.TeamColor.Color
							else
								v.Character[HitboxExtender.HitboxPart].Color = Color3.new(Color_R.Text,Color_G.Text,Color_B.Text)
							end
						elseif v.Team == player.Team then
							v.Character[HitboxExtender.HitboxPart].Size = Vector3.new(2, 2, 1)
							v.Character[HitboxExtender.HitboxPart].Transparency = 1
							v.Character[HitboxExtender.HitboxPart].Color = Color3.fromRGB(255, 255, 255)
						end
					else
						v.Character[HitboxExtender.HitboxPart].Size = Vector3.new(HitboxSize.Text,HitboxSize.Text,HitboxSize.Text)
						v.Character[HitboxExtender.HitboxPart].Transparency = Transparency.Text
						if HitboxExtender.TeamColor == true then
							v.Character[HitboxExtender.HitboxPart].Color = v.TeamColor.Color
						else
							v.Character[HitboxExtender.HitboxPart].Color = Color3.new(Color_R.Text,Color_G.Text,Color_B.Text)
						end
						v.Character[HitboxExtender.HitboxPart].Material = HitboxExtender.Material
						v.Character[HitboxExtender.HitboxPart].CanCollide = false
					end
				end)
			end
		end
	else
		for i,v in next, game:GetService('Players'):GetPlayers() do
			if v.Name ~= game:GetService('Players').LocalPlayer.Name then
				pcall(function()
					v.Character[HitboxExtender.HitboxPart].Size = Vector3.new(2, 2, 1)
					v.Character[HitboxExtender.HitboxPart].Transparency = 1
					v.Character[HitboxExtender.HitboxPart].Color = Color3.fromRGB(255, 255, 255)
				end)
			end
		end
	end
end
