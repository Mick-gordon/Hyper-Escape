game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Chams V2 ESP", Text = "By Mick Gordon"})
game:GetService("StarterGui"):SetCore("SendNotification", {Title = "https://discord.gg/FsApQ7YNTq", Text = "The Discord"}) -- Please join if you want more of my sctipts or want to see what I am making.
local ChamsgV2 = Instance.new("ScreenGui")ChamsgV2.Name = "ChamsV2" ChamsgV2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") ChamsgV2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling ChamsgV2.ResetOnSpawn = false
local ChamsV2_2 = Instance.new("Frame") ChamsV2_2.Name = "ChamsV2" ChamsV2_2.Parent = ChamsgV2 ChamsV2_2.BackgroundColor3 = Color3.fromRGB(52, 52, 52) ChamsV2_2.BorderColor3 = Color3.fromRGB(255, 255, 255) ChamsV2_2.Position = UDim2.new(0.340681225, 0, 0.409215063, 0) ChamsV2_2.Size = UDim2.new(0, 241, 0, 291) ChamsV2_2.Active = true ChamsV2_2.Draggable = true
local TextBox = Instance.new("TextBox")TextBox.Parent = ChamsV2_2 TextBox.Active = false TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextBox.BackgroundTransparency = 1.000 TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0) TextBox.BorderSizePixel = 0 TextBox.Position = UDim2.new(0.0829875544, 0, 0.929825902, 0) TextBox.Size = UDim2.new(0, 200, 0, 23) TextBox.ClearTextOnFocus = false TextBox.Font = Enum.Font.Roboto TextBox.PlaceholderText = "https://discord.gg/FsApQ7YNTq" TextBox.Text = "https://discord.gg/FsApQ7YNTq -ClickMe" TextBox.TextColor3 = Color3.fromRGB(255, 255, 255) TextBox.TextSize = 14.000 
local Name = Instance.new("TextLabel")Name.Name = "Name" Name.Parent = ChamsV2_2 Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Name.BackgroundTransparency = 1.000 Name.BorderColor3 = Color3.fromRGB(0, 0, 0) Name.BorderSizePixel = 0 Name.Position = UDim2.new(0.0829875544, 0, -0.0406635068, 0) Name.Size = UDim2.new(0, 200, 0, 50) Name.Font = Enum.Font.Roboto Name.Text = "Hyper Escape | Chams V2" Name.TextColor3 = Color3.fromRGB(17, 223, 255) Name.TextSize = 19.000
local Frame = Instance.new("Frame")Frame.Parent = ChamsV2_2 Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Frame.BackgroundTransparency = 1.000 Frame.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame.BorderSizePixel = 0 Frame.Position = UDim2.new(0.287999839, 0, 0.105447777, 0) Frame.Size = UDim2.new(0, 100, 0, 115) 
local UIListLayout = Instance.new("UIListLayout")UIListLayout.Parent = Frame UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout.Padding = UDim.new(0, 5)
local Enable_cham = Instance.new("TextButton")Enable_cham.Name = "Enable_cham" Enable_cham.Parent = Frame Enable_cham.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Enable_cham.BorderColor3 = Color3.fromRGB(255, 255, 255) Enable_cham.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Enable_cham.Size = UDim2.new(0, 122, 0, 24) Enable_cham.Font = Enum.Font.Roboto Enable_cham.Text = "Enable" Enable_cham.TextColor3 = Color3.fromRGB(255, 255, 255) Enable_cham.TextSize = 17.000
local TransparencyTe = Instance.new("TextBox")TransparencyTe.Name = "Transparency" TransparencyTe.Parent = Frame TransparencyTe.BackgroundColor3 = Color3.fromRGB(52, 52, 52) TransparencyTe.BorderColor3 = Color3.fromRGB(255, 255, 255) TransparencyTe.Position = UDim2.new(-0.109999999, 0, 0.782608688, 0) TransparencyTe.Size = UDim2.new(0, 122, 0, 24) TransparencyTe.ClearTextOnFocus = false TransparencyTe.Font = Enum.Font.Roboto TransparencyTe.PlaceholderText = "Hitbox Size" TransparencyTe.Text = "0.5" TransparencyTe.TextColor3 = Color3.fromRGB(255, 255, 255) TransparencyTe.TextSize = 14.000 
local TextLabel = Instance.new("TextLabel")TextLabel.Parent = Frame TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel.BackgroundTransparency = 1.000 TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel.BorderSizePixel = 0 TextLabel.Position = UDim2.new(0.0747231692, 0, -0.0288301352, 0) TextLabel.Size = UDim2.new(0, 100, 0, 17) TextLabel.Font = Enum.Font.Roboto TextLabel.Text = "Transparency" TextLabel.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel.TextSize = 17.000
local Teamcheck = Instance.new("TextButton")Teamcheck.Name = "Teamcheck" Teamcheck.Parent = Frame Teamcheck.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Teamcheck.BorderColor3 = Color3.fromRGB(255, 255, 255) Teamcheck.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Teamcheck.Size = UDim2.new(0, 122, 0, 24) Teamcheck.Font = Enum.Font.Roboto Teamcheck.Text = "Teamcheck" Teamcheck.TextColor3 = Color3.fromRGB(255, 255, 255) Teamcheck.TextSize = 17.000
local Frame_2 = Instance.new("Frame")Frame_2.Parent = ChamsV2_2 Frame_2.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_2.BorderSizePixel = 0 Frame_2.Position = UDim2.new(0.242356673, 0, 0.50810802, 0) Frame_2.Size = UDim2.new(0, 122, 0, 37)
local TextLabel_2 = Instance.new("TextLabel")TextLabel_2.Parent = Frame_2 TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel_2.BackgroundTransparency = 1.000 TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel_2.BorderSizePixel = 0 TextLabel_2.Position = UDim2.new(0.0829876363, 0, -0.0288301352, 0) TextLabel_2.Size = UDim2.new(0, 100, 0, 17) TextLabel_2.Font = Enum.Font.Roboto TextLabel_2.Text = "Visible Color" TextLabel_2.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel_2.TextSize = 17.000
local Frame_3 = Instance.new("Frame")Frame_3.Parent = Frame_2 Frame_3.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_3.BorderSizePixel = 0 Frame_3.Position = UDim2.new(0.0909090936, 0, 0.600000739, 0) Frame_3.Size = UDim2.new(0, 100, 0, 40)
local UIListLayout_2 = Instance.new("UIListLayout")UIListLayout_2.Parent = Frame_3 UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_2.Padding = UDim.new(0, 5)
local Color_RV = Instance.new("TextBox")Color_RV.Name = "Color_RV" Color_RV.Parent = Frame_3 Color_RV.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_RV.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_RV.Size = UDim2.new(0, 75, 0, 24) Color_RV.ClearTextOnFocus = false Color_RV.Font = Enum.Font.Roboto Color_RV.PlaceholderText = "255 - 0" Color_RV.Text = "100" Color_RV.TextColor3 = Color3.fromRGB(255, 255, 255) Color_RV.TextSize = 14.000
local Color_GV = Instance.new("TextBox")Color_GV.Name = "Color_GV" Color_GV.Parent = Frame_3 Color_GV.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_GV.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_GV.Size = UDim2.new(0, 75, 0, 24) Color_GV.ClearTextOnFocus = false Color_GV.Font = Enum.Font.Roboto Color_GV.PlaceholderText = "255 - 0" Color_GV.Text = "0" Color_GV.TextColor3 = Color3.fromRGB(255, 255, 255) Color_GV.TextSize = 14.000
local Color_BV = Instance.new("TextBox")Color_BV.Name = "Color_BV" Color_BV.Parent = Frame_3 Color_BV.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_BV.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_BV.Size = UDim2.new(0, 75, 0, 24) Color_BV.ClearTextOnFocus = false Color_BV.Font = Enum.Font.Roboto Color_BV.PlaceholderText = "255 - 0" Color_BV.Text = "100" Color_BV.TextColor3 = Color3.fromRGB(255, 255, 255) Color_BV.TextSize = 14.000
local Frame_4 = Instance.new("Frame")Frame_4.Parent = Frame_2 Frame_4.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_4.BorderSizePixel = 0 Frame_4.Position = UDim2.new(0.0909090936, 0, 2.15882421, 0) Frame_4.Size = UDim2.new(0, 100, 0, 40)
local UIListLayout_3 = Instance.new("UIListLayout")UIListLayout_3.Parent = Frame_4 UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_3.Padding = UDim.new(0, 5)
local Color_R = Instance.new("TextBox")Color_R.Name = "Color_R" Color_R.Parent = Frame_4 Color_R.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_R.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_R.Size = UDim2.new(0, 75, 0, 24) Color_R.ClearTextOnFocus = false Color_R.Font = Enum.Font.Roboto Color_R.PlaceholderText = "255 - 0" Color_R.Text = "0" Color_R.TextColor3 = Color3.fromRGB(255, 255, 255) Color_R.TextSize = 14.000
local Color_G = Instance.new("TextBox")Color_G.Name = "Color_G" Color_G.Parent = Frame_4 Color_G.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_G.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_G.Size = UDim2.new(0, 75, 0, 24) Color_G.ClearTextOnFocus = false Color_G.Font = Enum.Font.Roboto Color_G.PlaceholderText = "255 - 0" Color_G.Text = "100" Color_G.TextColor3 = Color3.fromRGB(255, 255, 255) Color_G.TextSize = 14.000
local Color_B = Instance.new("TextBox")Color_B.Name = "Color_B" Color_B.Parent = Frame_4 Color_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_B.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_B.Size = UDim2.new(0, 75, 0, 24) Color_B.ClearTextOnFocus = false Color_B.Font = Enum.Font.Roboto Color_B.PlaceholderText = "255 - 0" Color_B.Text = "101" Color_B.TextColor3 = Color3.fromRGB(255, 255, 255) Color_B.TextSize = 14.000 
local TextLabel_3 = Instance.new("TextLabel")TextLabel_3.Parent = Frame_2 TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel_3.BackgroundTransparency = 1.000 TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel_3.BorderSizePixel = 0 TextLabel_3.Position = UDim2.new(0.0829876363, 0, 1.52999341, 0) TextLabel_3.Size = UDim2.new(0, 100, 0, 17) TextLabel_3.Font = Enum.Font.Roboto TextLabel_3.Text = "Hidden Color" TextLabel_3.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel_3.TextSize = 17.000
local Players = game:FindService("Players")
local plr = game.Players.LocalPlayer
local l_character = plr.Character or plr.CharacterAdded:wait()
local camera = workspace.CurrentCamera
local returnv = false -- Local lick my nuts
_G.coolor = Color3.fromRGB((Color_RV.Text),(Color_GV.Text),(Color_BV.Text))
local ChamsV2 = {
	Enabled = false;
	TeamCheck = false;
	
	Transparency = TransparencyTe.Text;
	Visible = Color3.fromRGB((Color_RV.Text),(Color_GV.Text),(Color_BV.Text));
	HiddenColor = Color3.fromRGB((Color_R.Text),(Color_G.Text),(Color_B.Text));
}
Enable_cham.MouseButton1Click:Connect(function()
	if ChamsV2.Enabled == true then
		ChamsV2.Enabled = false
		Enable_cham.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
	else
		ChamsV2.Enabled = true
		Enable_cham.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
	end
end)
Teamcheck.MouseButton1Click:Connect(function()
	if ChamsV2.TeamCheck == true then
		ChamsV2.TeamCheck = false
		Teamcheck.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
	else
		ChamsV2.TeamCheck = true
		Teamcheck.BackgroundColor3 = Color3.fromRGB(2, 54, 8)
	end
end)
local function check_for_espBoxHand(c_model)
	if not c_model then
		return
	else
		returnv = false
		for i,v in next, c_model:GetDescendants() do
			if v:IsA("BoxHandleAdornment") then
				returnv = true
				break
			end
		end
		return returnv
	end
end
local function cast_rayBoxHand(body_part)
	local rp = RaycastParams.new()
	rp.FilterDescendantsInstances = l_character:GetDescendants()
	rp.FilterType = Enum.RaycastFilterType.Exclude

	local rcr = workspace:Raycast(camera.CFrame.Position, (body_part.Position - camera.CFrame.Position).Unit * 15000,rp)
	if rcr and rcr.Instance:IsDescendantOf(body_part.Parent) then
		return true
	else
		return false
	end
end
game:GetService("RunService").RenderStepped:Connect(function()
	local function create_espBoxHand(c_model)
		if not c_model.Character then
			return
		else
			if check_for_espBoxHand(c_model.Character) then
				for i,v in next, c_model.Character:GetChildren() do
					if v:IsA("BasePart") and v:FindFirstChild("BoxHandleAdornment") then
						local walt = v:FindFirstChild("BoxHandleAdornment")
						if ChamsV2.Enabled == true then
							if ChamsV2.TeamCheck == true then
								if c_model.Team == plr.Team then
									walt.Visible = false
								elseif not (c_model.Team == plr.Team) then
									walt.Visible = true
								end
							else
								walt.Visible = true
							end
							walt.Transparency=ChamsV2.Transparency
						else
							walt.Transparency=ChamsV2.Transparency
							walt.Visible = false
						end
						if cast_rayBoxHand(v) then
							walt.Color3=ChamsV2.Visible
						else
							walt.Color3=ChamsV2.HiddenColor
						end
					end
				end
			else
				for i,v in next, c_model.Character:GetChildren() do
					if ChamsV2.TeamCheck == true then
						if not (c_model.Team == plr.Team) then 
							if v:IsA("BasePart") then
								local b = Instance.new("BoxHandleAdornment")
								b.Parent = v
								b.Adornee = v
								b.AlwaysOnTop = true
								b.Size = v.Size
								b.ZIndex = 2
								b.Transparency = ChamsV2.Transparency
								b.Visible = ChamsV2.Enabled
							end
						end
					else
						if v:IsA("BasePart") then
							local b = Instance.new("BoxHandleAdornment")
							b.Parent = v
							b.Adornee = v
							b.AlwaysOnTop = true
							b.Size = v.Size
							b.ZIndex = 2
							b.Transparency = ChamsV2.Transparency
							b.Visible = ChamsV2.Enabled
						end
					end
				end
			end
		end
	end
	for _,v in pairs(game:GetService("Players"):GetChildren()) do
		if not (v.Name == plr.Name) then
			create_espBoxHand(v)
		end
	end
end)
while wait(0.1) do -- for the shitty buttons / INEED A FUCKING EXECUTOR THAT CAN USE LINKS OR DOSENT HAVE A FUCKING TEXT LIMIT!!!!
	ChamsV2.Visible = Color3.fromRGB((Color_RV.Text),(Color_GV.Text),(Color_BV.Text))
	ChamsV2.HiddenColor = Color3.fromRGB((Color_R.Text),(Color_G.Text),(Color_B.Text))
	ChamsV2.Transparency = TransparencyTe.Text
end
