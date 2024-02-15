local OutlinesHE = {
	Enabled = false;
	TeamCheck = false;
	TeamColor = false;
	AllwaysShow = false;
	
	OutlineColor = Color3.fromRGB(255,255,255);
	Ourlinetransparency = 0;
	
	FillColor = Color3.fromRGB(0,100,100);
	FillTransparency = 0.5;
}


-- Clean
game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Chams ESP", Text = "By Mick Gordon"})
game:GetService("StarterGui"):SetCore("SendNotification", {Title = "https://discord.gg/FsApQ7YNTq", Text = "The Discord For More!"})
local OutlinesV3 = Instance.new("ScreenGui")OutlinesV3.Name = "OutlinesV3" OutlinesV3.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") OutlinesV3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local OutlinesV3F = Instance.new("Frame")OutlinesV3F.Name = "OutlinesV3F" OutlinesV3F.Parent = OutlinesV3 OutlinesV3F.BackgroundColor3 = Color3.fromRGB(52, 52, 52) OutlinesV3F.BorderColor3 = Color3.fromRGB(255, 255, 255) OutlinesV3F.Position = UDim2.new(0.497290432, 0, 0.469664097, 0) OutlinesV3F.Size = UDim2.new(0, 241, 0, 398) OutlinesV3F.Active = true OutlinesV3F.Draggable = true
local TextBox = Instance.new("TextBox")TextBox.Parent = OutlinesV3F TextBox.Active = false TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextBox.BackgroundTransparency = 1.000 TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0) TextBox.BorderSizePixel = 0 TextBox.Position = UDim2.new(0.0829875544, 0, 0.929825902, 0) TextBox.Size = UDim2.new(0, 200, 0, 23) TextBox.ClearTextOnFocus = false TextBox.Font = Enum.Font.Roboto TextBox.PlaceholderText = "https://discord.gg/FsApQ7YNTq" TextBox.Text = "https://discord.gg/FsApQ7YNTq -ClickMe" TextBox.TextColor3 = Color3.fromRGB(255, 255, 255) TextBox.TextSize = 14.000
local Name = Instance.new("TextLabel")Name.Name = "Name" Name.Parent = OutlinesV3F Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Name.BackgroundTransparency = 1.000 Name.BorderColor3 = Color3.fromRGB(0, 0, 0) Name.BorderSizePixel = 0 Name.Position = UDim2.new(0.0829875544, 0, -0.0406635068, 0) Name.Size = UDim2.new(0, 200, 0, 50) Name.Font = Enum.Font.Roboto Name.Text = "Hyper Escape | Outlines V3" Name.TextColor3 = Color3.fromRGB(17, 223, 255) Name.TextSize = 19.000 
local Frame = Instance.new("Frame")Frame.Parent = OutlinesV3F Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Frame.BackgroundTransparency = 1.000 Frame.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame.BorderSizePixel = 0 Frame.Position = UDim2.new(0.287999839, 0, 0.0828346759, 0) Frame.Size = UDim2.new(0, 100, 0, 115)
local UIListLayout = Instance.new("UIListLayout")UIListLayout.Parent = Frame UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout.Padding = UDim.new(0, 5)
local Enable_cham = Instance.new("TextButton")Enable_cham.Name = "Enable_cham" Enable_cham.Parent = Frame Enable_cham.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Enable_cham.BorderColor3 = Color3.fromRGB(255, 255, 255) Enable_cham.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Enable_cham.Size = UDim2.new(0, 122, 0, 24) Enable_cham.Font = Enum.Font.Roboto Enable_cham.Text = "Allways Show" Enable_cham.TextColor3 = Color3.fromRGB(255, 255, 255) Enable_cham.TextSize = 17.000
local Allways_Show = Instance.new("TextButton")Allways_Show.Name = "Allways_Show" Allways_Show.Parent = Frame Allways_Show.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Allways_Show.BorderColor3 = Color3.fromRGB(255, 255, 255) Allways_Show.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Allways_Show.Size = UDim2.new(0, 122, 0, 24) Allways_Show.Font = Enum.Font.Roboto Allways_Show.Text = "Enable" Allways_Show.TextColor3 = Color3.fromRGB(255, 255, 255) Allways_Show.TextSize = 17.000
local Teamcheck = Instance.new("TextButton")Teamcheck.Name = "Teamcheck" Teamcheck.Parent = Frame Teamcheck.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Teamcheck.BorderColor3 = Color3.fromRGB(255, 255, 255) Teamcheck.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Teamcheck.Size = UDim2.new(0, 122, 0, 24) Teamcheck.Font = Enum.Font.Roboto Teamcheck.Text = "Teamcheck" Teamcheck.TextColor3 = Color3.fromRGB(255, 255, 255) Teamcheck.TextSize = 17.000
local Teamcheck_2 = Instance.new("TextButton")Teamcheck_2.Name = "Teamcheck" Teamcheck_2.Parent = Frame Teamcheck_2.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Teamcheck_2.BorderColor3 = Color3.fromRGB(255, 255, 255) Teamcheck_2.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Teamcheck_2.Size = UDim2.new(0, 122, 0, 24) Teamcheck_2.Font = Enum.Font.Roboto Teamcheck_2.Text = "Use Team Color" Teamcheck_2.TextColor3 = Color3.fromRGB(255, 255, 255) Teamcheck_2.TextSize = 17.000
local TextLabel = Instance.new("TextLabel")TextLabel.Parent = Frame TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel.BackgroundTransparency = 1.000 TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel.BorderSizePixel = 0 TextLabel.Position = UDim2.new(0.0747231692, 0, -0.0288301352, 0) TextLabel.Size = UDim2.new(0, 100, 0, 17) TextLabel.Font = Enum.Font.Roboto TextLabel.Text = "Fill Transparency" TextLabel.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel.TextSize = 17.000 
local Transparency = Instance.new("TextBox")Transparency.Name = "Transparency" Transparency.Parent = Frame Transparency.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Transparency.BorderColor3 = Color3.fromRGB(255, 255, 255) Transparency.Position = UDim2.new(-0.109999999, 0, 0.782608688, 0) Transparency.Size = UDim2.new(0, 122, 0, 24) Transparency.ClearTextOnFocus = false Transparency.Font = Enum.Font.Roboto Transparency.PlaceholderText = "Transparency" Transparency.Text = "0.5" Transparency.TextColor3 = Color3.fromRGB(255, 255, 255) Transparency.TextSize = 14.000 
local Frame_2 = Instance.new("Frame")Frame_2.Parent = OutlinesV3F Frame_2.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_2.BorderSizePixel = 0 Frame_2.Position = UDim2.new(0.242356673, 0, 0.638761282, 0) Frame_2.Size = UDim2.new(0, 122, 0, 37)
local TextLabel_2 = Instance.new("TextLabel")TextLabel_2.Parent = Frame_2 TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel_2.BackgroundTransparency = 1.000 TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel_2.BorderSizePixel = 0 TextLabel_2.Position = UDim2.new(0.0829876363, 0, -0.0288301352, 0) TextLabel_2.Size = UDim2.new(0, 100, 0, 17) TextLabel_2.Font = Enum.Font.Roboto TextLabel_2.Text = "Outline Color" TextLabel_2.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel_2.TextSize = 17.000
local Frame_3 = Instance.new("Frame")Frame_3.Parent = Frame_2 Frame_3.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_3.BorderSizePixel = 0 Frame_3.Position = UDim2.new(0.0909090936, 0, 0.600000739, 0) Frame_3.Size = UDim2.new(0, 100, 0, 40)
local UIListLayout_2 = Instance.new("UIListLayout")UIListLayout_2.Parent = Frame_3 UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_2.Padding = UDim.new(0, 5)
local Color_RV = Instance.new("TextBox")Color_RV.Name = "Color_RV" Color_RV.Parent = Frame_3 Color_RV.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_RV.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_RV.Size = UDim2.new(0, 75, 0, 24) Color_RV.ClearTextOnFocus = false Color_RV.Font = Enum.Font.Roboto Color_RV.PlaceholderText = "255 - 0" Color_RV.Text = "255" Color_RV.TextColor3 = Color3.fromRGB(255, 255, 255) Color_RV.TextSize = 14.000
local Color_GV = Instance.new("TextBox")Color_GV.Name = "Color_GV" Color_GV.Parent = Frame_3 Color_GV.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_GV.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_GV.Size = UDim2.new(0, 75, 0, 24) Color_GV.ClearTextOnFocus = false Color_GV.Font = Enum.Font.Roboto Color_GV.PlaceholderText = "255 - 0" Color_GV.Text = "255" Color_GV.TextColor3 = Color3.fromRGB(255, 255, 255) Color_GV.TextSize = 14.000
local Color_BV = Instance.new("TextBox")Color_BV.Name = "Color_BV" Color_BV.Parent = Frame_3 Color_BV.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_BV.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_BV.Size = UDim2.new(0, 75, 0, 24) Color_BV.ClearTextOnFocus = false Color_BV.Font = Enum.Font.Roboto Color_BV.PlaceholderText = "255 - 0" Color_BV.Text = "255" Color_BV.TextColor3 = Color3.fromRGB(255, 255, 255) Color_BV.TextSize = 14.000
local Frame_4 = Instance.new("Frame")Frame_4.Parent = Frame_2 Frame_4.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_4.BorderSizePixel = 0 Frame_4.Position = UDim2.new(0.0909090936, 0, 2.15882421, 0) Frame_4.Size = UDim2.new(0, 100, 0, 40) game:GetService("StarterGui"):SetCore("SendNotification", {Title = "https://discord.gg/FsApQ7YNTq", Text = "The Discord For More!"})
local UIListLayout_3 = Instance.new("UIListLayout")UIListLayout_3.Parent = Frame_4 UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout_3.Padding = UDim.new(0, 5) 
local Color_R = Instance.new("TextBox")Color_R.Name = "Color_R" Color_R.Parent = Frame_4 Color_R.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_R.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_R.Size = UDim2.new(0, 75, 0, 24) Color_R.ClearTextOnFocus = false Color_R.Font = Enum.Font.Roboto Color_R.PlaceholderText = "255 - 0" Color_R.Text = "0" Color_R.TextColor3 = Color3.fromRGB(255, 255, 255) Color_R.TextSize = 14.000 
local Color_G = Instance.new("TextBox")Color_G.Name = "Color_G" Color_G.Parent = Frame_4 Color_G.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_G.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_G.Size = UDim2.new(0, 75, 0, 24) Color_G.ClearTextOnFocus = false Color_G.Font = Enum.Font.Roboto Color_G.PlaceholderText = "255 - 0" Color_G.Text = "100" Color_G.TextColor3 = Color3.fromRGB(255, 255, 255) Color_G.TextSize = 14.000
local Color_B = Instance.new("TextBox")Color_B.Name = "Color_B" Color_B.Parent = Frame_4 Color_B.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Color_B.BorderColor3 = Color3.fromRGB(255, 255, 255) Color_B.Size = UDim2.new(0, 75, 0, 24) Color_B.ClearTextOnFocus = false Color_B.Font = Enum.Font.Roboto Color_B.PlaceholderText = "255 - 0" Color_B.Text = "101" Color_B.TextColor3 = Color3.fromRGB(255, 255, 255) Color_B.TextSize = 14.000
local TextLabel_3 = Instance.new("TextLabel")TextLabel_3.Parent = Frame_2 TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel_3.BackgroundTransparency = 1.000 TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel_3.BorderSizePixel = 0 TextLabel_3.Position = UDim2.new(0.0829876363, 0, 1.52999341, 0) TextLabel_3.Size = UDim2.new(0, 100, 0, 17) TextLabel_3.Font = Enum.Font.Roboto TextLabel_3.Text = "Fill Color" TextLabel_3.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel_3.TextSize = 17.000 
local Frame_5 = Instance.new("Frame")Frame_5.Parent = OutlinesV3F Frame_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Frame_5.BackgroundTransparency = 1.000 Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame_5.BorderSizePixel = 0 Frame_5.Position = UDim2.new(0.292149216, 0, 0.504945219, 0) Frame_5.Size = UDim2.new(0, 100, 0, 63) 
local UIListLayout_4 = Instance.new("UIListLayout")UIListLayout_4.Parent = Frame_5 UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout_4.Padding = UDim.new(0, 5) 
local Transparency_2 = Instance.new("TextBox")Transparency_2.Name = "Transparency" Transparency_2.Parent = Frame_5 Transparency_2.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Transparency_2.BorderColor3 = Color3.fromRGB(255, 255, 255) Transparency_2.Position = UDim2.new(-0.109999999, 0, 0.782608688, 0) Transparency_2.Size = UDim2.new(0, 122, 0, 24) Transparency_2.ClearTextOnFocus = false Transparency_2.Font = Enum.Font.Roboto Transparency_2.PlaceholderText = "Transparency" Transparency_2.Text = "0" Transparency_2.TextColor3 = Color3.fromRGB(255, 255, 255) Transparency_2.TextSize = 14.000 
local TextLabel_4 = Instance.new("TextLabel") TextLabel_4.Parent = Frame_5 TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel_4.BackgroundTransparency = 1.000 TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel_4.BorderSizePixel = 0 TextLabel_4.Position = UDim2.new(0, 0, 0.800000012, 0) TextLabel_4.Size = UDim2.new(0, 100, 0, 17) TextLabel_4.Font = Enum.Font.Roboto TextLabel_4.Text = "Outline Transparency" TextLabel_4.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel_4.TextSize = 17.000
Allways_Show.MouseButton1Click:Connect(function() if OutlinesHE.Enabled == true then OutlinesHE.Enabled = false Allways_Show.BackgroundColor3 =Color3.fromRGB(52, 52, 52) else OutlinesHE.Enabled = true Allways_Show.BackgroundColor3 = Color3.fromRGB(2, 54, 8) end end) Teamcheck.MouseButton1Click:Connect(function() if OutlinesHE.TeamCheck == true then OutlinesHE.TeamCheck = false Teamcheck.BackgroundColor3 = Color3.fromRGB(52, 52, 52) else OutlinesHE.TeamCheck = true Teamcheck.BackgroundColor3 =Color3.fromRGB(2, 52, 8) end end) Teamcheck_2.MouseButton1Click:Connect(function() if OutlinesHE.TeamColor == true then OutlinesHE.TeamColor = false Teamcheck_2.BackgroundColor3 =Color3.fromRGB(52, 52, 52) else OutlinesHE.TeamColor = true Teamcheck_2.BackgroundColor3 =Color3.fromRGB(2, 52, 8) end end) 
local Storage = Instance.new("Folder", game:GetService("StarterGui")) Storage.Name ="Hyper Escape Storage / Outlines"
local Players = game:FindService("Players")
local lp = Players.LocalPlayer
local connections = {}

Enable_cham.MouseButton1Click:Connect(function() 
	if OutlinesHE.AllwaysShow == true then 
		OutlinesHE.AllwaysShow = false 
		Enable_cham.BackgroundColor3 =Color3.fromRGB(2, 54, 8) 
	else --By Mick Gordon
		OutlinesHE.AllwaysShow = true 
		Enable_cham.BackgroundColor3 = Color3.fromRGB(52, 52, 52) 
	end 
end) 




local function Highlight(plr)
	local Highlight = Instance.new("Highlight")
	Highlight.Parent = Storage
	Highlight.Name = plr.Name
	Highlight.OutlineTransparency= 0
	Highlight.OutlineColor = Color3.fromRGB((Color_RV.Text),(Color_GV.Text),(Color_BV.Text))
	Highlight.Enabled = OutlinesHE.Enabled
	local plrchar = plr.Character
	if plrchar then
		Highlight.Adornee = plrchar
	end
	connections[plr] = plr.CharacterAdded:Connect(function(char)
		Highlight.Adornee = char
	end)
	local co = coroutine.create(function()
		while wait(0.1) do
			if (plr.Character and plr.Character:FindFirstChild"HumanoidRootPart") and plr.Character.Humanoid.Health > 0 then
				if OutlinesHE.Enabled == true then 
					if OutlinesHE.TeamCheck == true then
						if plr.Team == lp.Team then
							Highlight.Enabled = false
						else
							Highlight.Enabled = true
						end
					else
						Highlight.Enabled = true
					end
				else
					Highlight.Enabled = false
				end

				if OutlinesHE.TeamColor == true then
					Highlight.OutlineColor = plr.TeamColor.Color 
				else
					Highlight.OutlineColor = Color3.fromRGB((Color_RV.Text),(Color_GV.Text),(Color_BV.Text))
				end

				if OutlinesHE.AllwaysShow == true then
					Highlight.DepthMode = "Occluded" 
				else
					Highlight.DepthMode = "AlwaysOnTop"
				end
-- By Mick Gordon
				Highlight.FillColor = Color3.fromRGB((Color_R.Text),(Color_G.Text),(Color_B.Text))
				Highlight.FillTransparency = Transparency.Text
				Highlight.OutlineTransparency = Transparency_2.Text

				if not (game:GetService"Players":FindFirstChild(plr.Name)) then
					Storage:FindFirstChild(plr.Name):Destroy()
					coroutine.yield()
				end
			else
				Highlight.Enabled = false
			end
		end
	end)
	coroutine.resume(co)
end


do
	wait(2)

	--initial player addition
	for _,v in pairs(game:GetService("Players"):GetChildren()) do
		if not (v.Name == lp.Name) then
			if not (Storage:FindFirstChild(v.Name)) then
				Highlight(v)
			end
		end
	end

	--auto-update
	while wait(10) do
		for _,v in pairs(game:GetService("Players"):GetChildren()) do
			if not (v.Name == lp.Name) then
				if not (Storage:FindFirstChild(v.Name)) then
					Highlight(v)
				end
			end
		end
	end
end

print("Done")
