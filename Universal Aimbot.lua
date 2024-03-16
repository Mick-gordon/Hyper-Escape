local HyperEscapeAimbot = {
	Enabled = false;
	TeamCheck = false;
	WallCheck = false;

	Smoothing = 0;

	AimPart = "Head";
	Keybind = "MouseButton2";

	Fov = 200;

	ShowFov = false;
	------------------------------------------------------------------------------------------------------------------------------------
	Thickness = 1;

	FovFillColor = Color3.fromRGB(100,0,100);
	FovColor = Color3.fromRGB(100,0,100);

	FovFillTransparency = 1;
	FovTransparenct = 0;

	IsAiming =false;
}

game:GetService("StarterGui"):SetCore("SendNotification", {Title = "https://discord.gg/FsApQ7YNTq", Text = "The Discord For More!"})
--[[
Common (may affect up to 1 in 10 people)

  uneven heartbeat (palpitations)

  mood changes or mood swings or changes in personality
  

Uncommon (may affect up to 1 in 100 people) thinking about or feeling like killing yourself

  seeing, feeling, or hearing things that are not real, these are signs of psychosis

  uncontrolled speech and body movements (Tourette's)

  signs of allergy such as rash, itching or hives on the skin, swelling of the face, lips, tongue or other parts of the body, shortness of breath, wheezing or trouble breathing
  

Rare (may affect up to 1 in 1,000 people)

  feeling unusually excited, over-active and un-inhibited (mania)



Very rare (may affect up to 1 in 10,000 people)

  heart attack

  sudden death

  suicidal attempt

  fits (seizures, convulsions epilepsy)

  skin peeling or purplish red patches

  inflammation or blocked arteries in the brain

  temporary paralysis or problems with movement and vision, difficulties in speech (these can be signs of problems with the blood vessels in your brain)

  muscle spasms which you cannot control affecting your eyes, head, neck, body and nervous system

  decrease in number of blood cells (red cells, white cells and platelets) which can make you more likely to get infections, and make you bleed and bruise more easily

  a sudden increase in body temperature, very high blood pressure and severe convulsions ('Neuroleptic Malignant Syndrome'). It is not certain that this side effect is caused by methylphenidate or other drugs that may be taken in combination with methylphenidate.

Not known (frequency cannot be estimated from the available data)

  unwanted thoughts that keep coming back unexplained fainting, chest pain, shortness of breath (these can be signs of heart problems) // Sysguard being patched 

  prolonged erections, sometimes painful or an increased number of erections.


If you have any of the side effects above, see a doctor straight away.
]]
-- Nice and clean
local AimbotV2 = Instance.new("ScreenGui")AimbotV2.Name = "AimbotV2" AimbotV2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") AimbotV2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling AimbotV2.ResetOnSpawn = false
local HEAimbotV2 = Instance.new("Frame")HEAimbotV2.Name = "HEAimbotV2" HEAimbotV2.Parent = AimbotV2 HEAimbotV2.BackgroundColor3 = Color3.fromRGB(52, 52, 52) HEAimbotV2.BorderColor3 = Color3.fromRGB(255, 255, 255) HEAimbotV2.Position = UDim2.new(0.284624249, 0, 0.366314173, 0) HEAimbotV2.Size = UDim2.new(0, 241, 0, 291) HEAimbotV2.Active = true HEAimbotV2.Draggable =true 
local Name = Instance.new("TextLabel")Name.Name = "Name" Name.Parent = HEAimbotV2 Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Name.BackgroundTransparency = 1.000 Name.BorderColor3 = Color3.fromRGB(0, 0, 0) Name.BorderSizePixel = 0 Name.Position = UDim2.new(0.0829875544, 0, -0.0406635068, 0) Name.Size = UDim2.new(0, 200, 0, 50) Name.Font = Enum.Font.Roboto Name.Text = "Hyper Escape | AimbotV3" Name.TextColor3 = Color3.fromRGB(17, 223, 255) Name.TextSize = 19.000
local Frame = Instance.new("Frame")Frame.Parent = HEAimbotV2 Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) Frame.BackgroundTransparency = 1.000 Frame.BorderColor3 = Color3.fromRGB(0, 0, 0) Frame.BorderSizePixel = 0 Frame.Position = UDim2.new(0.287999839, 0, 0.105447777, 0) Frame.Size = UDim2.new(0, 100, 0, 115) 
local Enable_Aim = Instance.new("TextButton")Enable_Aim.Name = "Enable_Aim" Enable_Aim.Parent = Frame Enable_Aim.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Enable_Aim.BorderColor3 = Color3.fromRGB(255, 255, 255) Enable_Aim.Position = UDim2.new(-1.59000003, 0, 1.0086956, 0) Enable_Aim.Size = UDim2.new(0, 122, 0, 24) Enable_Aim.Font = Enum.Font.Roboto Enable_Aim.Text = "Enable" Enable_Aim.TextColor3 = Color3.fromRGB(255, 255, 255) Enable_Aim.TextSize = 17.000
local UIListLayout = Instance.new("UIListLayout")UIListLayout.Parent = Frame UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder UIListLayout.Padding = UDim.new(0, 5)
local WallCheck = Instance.new("TextButton")WallCheck.Name = "WallCheck" WallCheck.Parent = Frame WallCheck.BackgroundColor3 = Color3.fromRGB(52, 52, 52) WallCheck.BorderColor3 = Color3.fromRGB(255, 255, 255) WallCheck.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) WallCheck.Size = UDim2.new(0, 122, 0, 24) WallCheck.Font = Enum.Font.Roboto WallCheck.Text = "Wall Check" WallCheck.TextColor3 = Color3.fromRGB(255, 255, 255) WallCheck.TextSize = 17.000
local Teamcheck = Instance.new("TextButton")Teamcheck.Name = "Teamcheck" Teamcheck.Parent = Frame Teamcheck.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Teamcheck.BorderColor3 = Color3.fromRGB(255, 255, 255) Teamcheck.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) Teamcheck.Size = UDim2.new(0, 122, 0, 24) Teamcheck.Font = Enum.Font.Roboto Teamcheck.Text = "Team check" Teamcheck.TextColor3 = Color3.fromRGB(255, 255, 255) Teamcheck.TextSize = 17.000
local ShowFov = Instance.new("TextButton")ShowFov.Name = "ShowFov" ShowFov.Parent = Frame ShowFov.BackgroundColor3 = Color3.fromRGB(52, 52, 52) ShowFov.BorderColor3 = Color3.fromRGB(255, 255, 255) ShowFov.Position = UDim2.new(0.234439835, 0, 0.139479905, 0) ShowFov.Size = UDim2.new(0, 122, 0, 24) ShowFov.Font = Enum.Font.Roboto ShowFov.Text = "Show Fov" ShowFov.TextColor3 = Color3.fromRGB(255, 255, 255) ShowFov.TextSize = 17.000
local Hitpart = Instance.new("TextButton")Hitpart.Name = "Hitpart" Hitpart.Parent = Frame Hitpart.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Hitpart.BorderColor3 = Color3.fromRGB(255, 255, 255) Hitpart.Position = UDim2.new(-1.59000003, 0, 1.0086956, 0) Hitpart.Size = UDim2.new(0, 122, 0, 24) Hitpart.Font = Enum.Font.Roboto Hitpart.Text = "HEAD, torso" Hitpart.TextColor3 = Color3.fromRGB(255, 255, 255) Hitpart.TextSize = 17.000
local TextLabel = Instance.new("TextLabel")TextLabel.Parent = Frame TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel.BackgroundTransparency = 1.000 TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel.BorderSizePixel = 0 TextLabel.Position = UDim2.new(0.0747231692, 0, -0.0288301352, 0) TextLabel.Size = UDim2.new(0, 100, 0, 17) TextLabel.Font = Enum.Font.Roboto TextLabel.Text = "Smoothing " TextLabel.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel.TextSize = 17.000
local Smoothing_Num = Instance.new("TextBox")Smoothing_Num.Name = "Smoothing_Num" Smoothing_Num.Parent = Frame Smoothing_Num.BackgroundColor3 = Color3.fromRGB(52, 52, 52) Smoothing_Num.BorderColor3 = Color3.fromRGB(255, 255, 255) Smoothing_Num.Position = UDim2.new(-0.109999999, 0, 0.782608688, 0) Smoothing_Num.Size = UDim2.new(0, 122, 0, 24) Smoothing_Num.ClearTextOnFocus = false Smoothing_Num.Font = Enum.Font.Roboto Smoothing_Num.PlaceholderText = "3 - 0" Smoothing_Num.Text = "0" Smoothing_Num.TextColor3 = Color3.fromRGB(255, 255, 255) Smoothing_Num.TextSize = 14.000
local TextLabel_2 = Instance.new("TextLabel")TextLabel_2.Parent = Frame TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextLabel_2.BackgroundTransparency = 1.000 TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0) TextLabel_2.BorderSizePixel = 0 TextLabel_2.Position = UDim2.new(0.0747231692, 0, -0.0288301352, 0) TextLabel_2.Size = UDim2.new(0, 100, 0, 17) TextLabel_2.Font = Enum.Font.Roboto TextLabel_2.Text = "Fov" TextLabel_2.TextColor3 = Color3.fromRGB(17, 223, 255) TextLabel_2.TextSize = 17.000
local FovNumb = Instance.new("TextBox")FovNumb.Name = "FovNumb" FovNumb.Parent = Frame FovNumb.BackgroundColor3 = Color3.fromRGB(52, 52, 52) FovNumb.BorderColor3 = Color3.fromRGB(255, 255, 255) FovNumb.Position = UDim2.new(-0.109999999, 0, 0.782608688, 0) FovNumb.Size = UDim2.new(0, 122, 0, 24) FovNumb.ClearTextOnFocus = false FovNumb.Font = Enum.Font.Roboto FovNumb.PlaceholderText = "350" FovNumb.Text = "200" game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Hope you enjoy!", Text = "By Mick gordon"}) FovNumb.TextColor3 = Color3.fromRGB(255, 255, 255) FovNumb.TextSize = 14.000
local TextBox = Instance.new("TextBox")TextBox.Parent = HEAimbotV2 TextBox.Active = false TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) TextBox.BackgroundTransparency = 1.000 TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0) TextBox.BorderSizePixel = 0 TextBox.Position = UDim2.new(0.0829875544, 0, 0.929825902, 0) TextBox.Size = UDim2.new(0, 200, 0, 23) TextBox.ClearTextOnFocus = false TextBox.Font = Enum.Font.Roboto TextBox.PlaceholderText = "https://discord.gg/FsApQ7YNTq" TextBox.Text = "https://discord.gg/FsApQ7YNTq -ClickMe" TextBox.TextColor3 = Color3.fromRGB(255, 255, 255) TextBox.TextSize = 14.000
Enable_Aim.MouseButton1Click:Connect(function() if HyperEscapeAimbot.Enabled == true then HyperEscapeAimbot.Enabled = false Enable_Aim.BackgroundColor3 = Color3.fromRGB(52,52,52) else HyperEscapeAimbot.Enabled= true Enable_Aim.BackgroundColor3 = Color3.fromRGB(2, 54, 8) end end) WallCheck.MouseButton1Click:Connect(function() if HyperEscapeAimbot.WallCheck == true then HyperEscapeAimbot.WallCheck = false WallCheck.BackgroundColor3 = Color3.fromRGB(52,52,52) else HyperEscapeAimbot.WallCheck = true WallCheck.BackgroundColor3 = Color3.fromRGB(2, 54, 8) end end) Teamcheck.MouseButton1Click:Connect(function() if HyperEscapeAimbot.TeamCheck == true then HyperEscapeAimbot.TeamCheck = false Teamcheck.BackgroundColor3 = Color3.fromRGB(52,52,52) else HyperEscapeAimbot.TeamCheck = true Teamcheck.BackgroundColor3 = Color3.fromRGB(2, 54, 8) end end) ShowFov.MouseButton1Click:Connect(function() if HyperEscapeAimbot.ShowFov ==true then HyperEscapeAimbot.ShowFov = false ShowFov.BackgroundColor3 = Color3.fromRGB(52,52,52) else HyperEscapeAimbot.ShowFov = true ShowFov.BackgroundColor3 = Color3.fromRGB(2, 54, 8) end end) Hitpart.MouseButton1Click:Connect(function() if HyperEscapeAimbot.AimPart == "Head" then Hitpart.Text = "head, Torso" HyperEscapeAimbot.AimPart = "HumanoidRootPart" else Hitpart.Text = "HEAD, torso" HyperEscapeAimbot.AimPart = "Head" end end)
local Fov = Instance.new("ScreenGui")Fov.Name = "Fov" Fov.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") Fov.ZIndexBehavior = Enum.ZIndexBehavior.Sibling Fov.ResetOnSpawn = false-- i miss you synapse fov
local FOVFFrame = Instance.new("Frame")FOVFFrame.Parent = Fov FOVFFrame.Name = "FOVFFrame" FOVFFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) FOVFFrame.BorderColor3 = Color3.fromRGB(0, 0, 0) FOVFFrame.BorderSizePixel = 0 FOVFFrame.BackgroundTransparency = 1 FOVFFrame.AnchorPoint = Vector2.new(0.5, 0.5) FOVFFrame.Position = UDim2.new(0.5, 0,0.5, 0) FOVFFrame.Size = UDim2.new(0, HyperEscapeAimbot.Fov, 0, HyperEscapeAimbot.Fov) FOVFFrame.BackgroundTransparency = 1 
local UICorner = Instance.new("UICorner")UICorner.CornerRadius = UDim.new(1, 0) UICorner.Parent = FOVFFrame 
local UIStroke = Instance.new("UIStroke")UIStroke.Color = Color3.fromRGB(100,0,100) UIStroke.Parent = FOVFFrame UIStroke.Thickness = 1 UIStroke.ApplyStrokeMode = "Border"

local PLAYER = game.Players.LocalPlayer
local CurrentCam  = game.Workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local l_character = PLAYER.Character or PLAYER.CharacterAdded:wait()
local WorldToViewportPoint = CurrentCam.WorldToViewportPoint
local mouseLocation = UIS.GetMouseLocation


function isVisible(p, ...)
	if not (HyperEscapeAimbot.WallCheck == true) then
		return true
	end 
	return #CurrentCam:GetPartsObscuringTarget({ p }, { CurrentCam, PLAYER.Character, ... }) == 0 
end

function CameraGetClosestToMouse(Fov)
	local AimFov = Fov
	local targetPos = nil

	for i,v in pairs (game:GetService("Players"):GetPlayers()) do
		if v ~= PLAYER then
			if HyperEscapeAimbot.TeamCheck == true then
				if v.Character and v.Character:FindFirstChild(HyperEscapeAimbot.AimPart) and v.Character.Humanoid and v.Character.Humanoid.Health > 0 and not (v.Team == PLAYER.Team) then
					local screen_pos, on_screen = WorldToViewportPoint(CurrentCam, v.Character[HyperEscapeAimbot.AimPart].Position)
					local screen_pos_2D = Vector2.new(screen_pos.X, screen_pos.Y)
					local new_magnitude = (screen_pos_2D - mouseLocation(UIS)).Magnitude
					if on_screen and new_magnitude < AimFov and isVisible(v.Character[HyperEscapeAimbot.AimPart].Position, v.Character.Head.Parent) then
						AimFov = new_magnitude
						targetPos = v
					end
				end
			else
				if v.Character and v.Character:FindFirstChild(HyperEscapeAimbot.AimPart) and v.Character.Humanoid and v.Character.Humanoid.Health > 0 then
					local screen_pos, on_screen = WorldToViewportPoint(CurrentCam, v.Character[HyperEscapeAimbot.AimPart].Position)
					local screen_pos_2D = Vector2.new(screen_pos.X, screen_pos.Y)
					local new_magnitude = (screen_pos_2D - mouseLocation(UIS)).Magnitude
					if on_screen and new_magnitude < AimFov and isVisible(v.Character[HyperEscapeAimbot.AimPart].Position, v.Character.Head.Parent) then
						AimFov = new_magnitude
						targetPos = v
					end
				end
			end
		end
	end
	return targetPos
end


local function aimAt(pos, smooth)
	local AimPart = pos.Character:FindFirstChild(HyperEscapeAimbot.AimPart)
	if AimPart then
		local LookAt = nil
		local Distance = math.floor(0.5+(PLAYER.Character:FindFirstChild"HumanoidRootPart".Position - pos.Character:FindFirstChild"HumanoidRootPart".Position).magnitude)
		if Distance > 100  then
			local distChangeBig = Distance / 10
			LookAt = CurrentCam.CFrame:PointToWorldSpace(Vector3.new(0,0,-smooth * distChangeBig)):Lerp(AimPart.Position,.01) -- No one esle do camera smoothing ? tf
		else
			local distChangeSmall = Distance / 10
			LookAt = CurrentCam.CFrame:PointToWorldSpace(Vector3.new(0,0,-smooth * distChangeSmall)):Lerp(AimPart.Position,.01) -- No one esle do camera smoothing ? tf
		end
		CurrentCam.CFrame = CFrame.lookAt(CurrentCam.CFrame.Position, LookAt)
	end
end

game:GetService('RunService').RenderStepped:connect(function()
	if HyperEscapeAimbot.Enabled == true then 
		if UIS:IsMouseButtonPressed(Enum.UserInputType[HyperEscapeAimbot.Keybind]) then
			local _pos = CameraGetClosestToMouse(HyperEscapeAimbot.Fov)
			if _pos then
				aimAt(_pos, HyperEscapeAimbot.Smoothing)
			end
		end
	end 

	if not (FovNumb.Text == "") then
		HyperEscapeAimbot.Fov = tonumber(FovNumb.Text)
	end
	if not (Smoothing_Num.Text == "") then
		HyperEscapeAimbot.Smoothing = tonumber(Smoothing_Num.Text)
	end

	local acc = HyperEscapeAimbot.Smoothing / 2	
	local posd = UIS:GetMouseLocation() 
	FOVFFrame.Position = UDim2.new(0, posd.X, 0, posd.Y - 36)
	FOVFFrame.Size = UDim2.new(0, HyperEscapeAimbot.Fov + acc, 0, HyperEscapeAimbot.Fov + acc)
	FOVFFrame.Visible = HyperEscapeAimbot.ShowFov
	FOVFFrame.BackgroundColor3 = HyperEscapeAimbot.FovFillColor
	FOVFFrame.Transparency = HyperEscapeAimbot.FovFillTransparency

	UIStroke.Color = HyperEscapeAimbot.FovFillColor
	UIStroke.Transparency = HyperEscapeAimbot.FovTransparenct
	UIStroke.Thickness = HyperEscapeAimbot.Thickness
end)

