local BoxDefult = {Enabled = false; Color = Color3.fromRGB(255,255,255); Outline = true; OutlineColor = Color3.fromRGB(0,0,0)};
local TracerDefult = {Enabled = false; Color = Color3.fromRGB(255,255,255); Outline = true; OutlineColor = Color3.fromRGB(0,0,0)};
local HilightDefult = {Enabled = false; FillColor = Color3.fromRGB(255,255,255); OutlineColor = Color3.fromRGB(0,0,0); OutlineTransparency = 0.5; FillTransparency= 0.5; AllWaysShow = false;};

local esp = {
	settings = {
		Enable = false;
		TeamCheck = false;
		Box = table.clone(BoxDefult);
		Tracer = table.clone(TracerDefult);
		Hilight = table.clone(HilightDefult);
	};
};

esp.cache = {
	__index = esp;
};

local HyperEscape = { -- Yes It Is Here AND IT DOSE NOT WORK. Please Wait Untill I Can Find A Bypass
	GUI = {
		GUIButton = true;
		GUIToggleKey = Enum.KeyCode.RightShift;
	};

	AimBot = {
		Enabled = false; 

		TeamCheck = false;
		WallCheck = false;

		-- NEW
		StickyAim = false;
		Prediction = false; 

		UseMouse = false;
		MouseBind = "MouseButton2";
		Keybind = Enum.KeyCode.E;  

		ShowFov = false;
		Fov = 360;

		Smoothing = 4;

		AimPart = "Head";

		Thickness = 1;
		FovFillColor = Color3.fromRGB(100,0,100);
		FovColor = Color3.fromRGB(100,0,100);
		FovFillTransparency = 1;
		FovTransparenct = 0;

		IsAimKeyDown = false; 
		Target = nil;
		CameraTween = nil;
	};

	SilentAim = {
		Enabled = false;
		WallCheck = false;
		AoutoShoot = false;

		HitChance = 50;

		AimPart = "Head";

		Fov = 360;
		ShowFov = false;

		Target = nil;

		iswindowactive = true;
	};
	
	Visuals = { -- TODO: Fps boost
		gameLighting = "ShadowMap";
		
		CustomTimeOfDay = false;
		TimeOfDay = 24;
		
		ArmChams = {
			Enable = false;
			
			Color = Color3.fromRGB(100, 0, 255);
			Material = "ForceField"; 
			trans = 0.5;
			reflection = 1;
		};
		GunChams = {
			Enable = false;

			Color = Color3.fromRGB(100, 0, 255);
			Material = "ForceField"; 
			trans = 0.5;
			reflection = 1;
		};
		
		Ambience = {
			Enabled = false;
			AmbienceInside = Color3.fromRGB(255, 255, 255);
			AmbienceOutside = Color3.fromRGB(255, 255, 255);
		};
	};
};

local DeleteMobLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Mick-gordon/Hyper-Escape/main/DeleteMob%20GUI.lua"))();
local Window = DeleteMobLib:CreateWindow(Enum.KeyCode.RightShift, "DeleteMob");
local UIToggle = Window:CreateToggleButton()

local SilentAimTab = Window:CreateTab("Silent Aim");
local SilentAimSection = SilentAimTab:CreateSector("Silent Aim", "Left");
SilentAimSection:CreateToggle("Enable", false, function(ESA) HyperEscape.SilentAim.Enabled = ESA; end);
SilentAimSection:CreateToggle("Wall Check", false, function(EWC) HyperEscape.SilentAim.WallCheck = EWC; end);
SilentAimSection:CreateSlider("Hit Chance", 0, 50, 100, 1, function(EHC) HyperEscape.SilentAim.HitChance = EHC; end);
SilentAimSection:CreateDropDown("Hit Scan", {"Head", "Torso"}, {"Head"}, true, function(SHD) HyperEscape.SilentAim.AimPart = SHD; end);
if mouse1press and mouse1release then
	SilentAimSection:CreateToggle("Auto Shoot", false, function(SAOS) HyperEscape.SilentAim.AoutoShoot = SAOS; end);
end

local FOVSection = SilentAimTab:CreateSector("Fov", "Right");
FOVSection:CreateToggle("Show Fov", false, function(SFS) HyperEscape.SilentAim.ShowFov = SFS; end);
FOVSection:CreateSlider("Fov", 0, 360, 1000, 1, function(SF) HyperEscape.SilentAim.Fov = SF; end);

local ESPTab = Window:CreateTab("Visuals");
local ESPOptionsSection = ESPTab:CreateSector("ESP", "Left");
ESPOptionsSection:CreateToggle("Enable", false, function(ETCE) esp.settings.Enable = ETCE; end);
ESPOptionsSection:CreateToggle("Box", false, function(EBE) esp.settings.Box.Enabled = EBE; end);
ESPOptionsSection:CreateToggle("Tracer", false, function(ETE) esp.settings.Tracer.Enabled = ETE; end);
ESPOptionsSection:CreateToggle("Hilight", false, function(EHE) esp.settings.Hilight.Enabled = EHE; end);
ESPOptionsSection:CreateToggle("Allways Show Hilight", false, function(EASH) esp.settings.Hilight.AllWaysShow = EASH; end);

local ESPSettingssSection = ESPTab:CreateSector("ESP Settings", "Right");
ESPSettingssSection:CreateToggle("Border", false, function(EOT) esp.settings.Box.Outline = EOT; end);
ESPSettingssSection:CreateColorPicker("Border Color", Color3.fromRGB(0, 0, 0), function(ebc) esp.settings.Box.OutlineColor = ebc; end);
ESPSettingssSection:CreateColorPicker("ESP Color", Color3.fromRGB(255, 255, 255), function(eec) esp.settings.Box.Color = eec; end);
ESPSettingssSection:CreateColorPicker("Hilight Outline", Color3.fromRGB(255, 255, 255), function(ehf) esp.settings.Hilight.OutlineColor = ehf; end);
ESPSettingssSection:CreateColorPicker("Hilight Fill", Color3.fromRGB(100, 0, 255), function(ehff) esp.settings.Hilight.FillColor = ehff; end);
ESPSettingssSection:CreateSlider("Hilight Outline", 0, 50, 100, 1, function(HFF) esp.settings.Hilight.OutlineTransparency = HFF / 100; end);
ESPSettingssSection:CreateSlider("Hilight Fill", 0, 0, 100, 1, function(HOF) esp.settings.Hilight.FillTransparency = HOF / 100; end);

local WorldVisualsSection = ESPTab:CreateSector("World Visuals", "Right");
WorldVisualsSection:CreateToggle("Ambience", false, function(VCT) HyperEscape.Visuals.Ambience.Enabled = VCT; end);
WorldVisualsSection:CreateColorPicker("Ambience Outside", Color3.fromRGB(255, 255, 255), function(egec) HyperEscape.Visuals.Ambience.AmbienceOutside = egec; end);
WorldVisualsSection:CreateColorPicker("Ambience Inside", Color3.fromRGB(255, 255, 255), function(ehec) HyperEscape.Visuals.Ambience.AmbienceInside = ehec; end);
WorldVisualsSection:CreateButton("FPS Boost", function() if game.Workspace.Map then for i,v in game.Workspace.Map:GetDescendants() do if v.ClassName == "Part" or v.ClassName == "MeshPart" then v.Material = "SmoothPlastic"; end end end end)


local ArmChamsSection = ESPTab:CreateSector("Gun Chams", "Left");
ArmChamsSection:CreateToggle("Enable", false, function(ETCeE) HyperEscape.Visuals.ArmChams.Enable = ETCeE; end);
ArmChamsSection:CreateColorPicker("Color", Color3.fromRGB(0, 0, 0), function(hebc) HyperEscape.Visuals.ArmChams.Color = hebc; end);
ArmChamsSection:CreateDropDown("Material", {"ForceField", "SmoothPlastic", "Glass", "Neon", "Plastic"}, "ForceField", false, function(GLbfSM) HyperEscape.Visuals.ArmChams.Material = GLbfSM; end);
ArmChamsSection:CreateSlider("Transparency", 0, 0, 99, 1, function(HdgOF) HyperEscape.Visuals.ArmChams.trans = HdgOF / 100; end);
ArmChamsSection:CreateSlider("Reflection", 1, 1, 50, 1, function(HjgOF) HyperEscape.Visuals.ArmChams.reflection = HjgOF / 100; end);

local GunChamsSection = ESPTab:CreateSector("Arm Chams", "Left");
GunChamsSection:CreateToggle("Enable", false, function(ETCgeE) HyperEscape.Visuals.GunChams.Enable = ETCgeE; end);
GunChamsSection:CreateColorPicker("Color", Color3.fromRGB(0, 0, 0), function(hefbc) HyperEscape.Visuals.GunChams.Color = hefbc; end);
GunChamsSection:CreateDropDown("Material", {"ForceField", "SmoothPlastic", "Glass", "Neon", "Plastic"}, "ForceField", false, function(GLbffSM) HyperEscape.Visuals.GunChams.Material = GLbffSM; end);
GunChamsSection:CreateSlider("Transparency", 0, 0, 99, 1, function(HfdgOF) HyperEscape.Visuals.GunChams.trans = HfdgOF / 100; end);
GunChamsSection:CreateSlider("Reflection", 1, 1, 50, 1, function(HjggOF) HyperEscape.Visuals.GunChams.reflection = HjggOF / 100; end);

local SettingsTab = Window:CreateTab("Settings");
local SettingsInfoSector = SettingsTab:CreateSector("Info", "Left");
SettingsInfoSector:CreateCoppyText("Made By m1ckgordon");
SettingsInfoSector:CreateCoppyText("https://discord.gg/jNRKdtH3 - Click Me");

SettingsTab:CreateConfig("Right");

local SettingsSettings = SettingsTab:CreateSector("GUI Settigns", "Left");
SettingsSettings:CreateToggle("UI Toggle Button", true, function(GUITB) HyperEscape.GUI.GUIButton = GUITB; UIToggle:Update(GUITB); end);
SettingsSettings:CreateKeyBind("UI Key Bind", Enum.KeyCode.RightShift, function(SUITK) HyperEscape.GUI.GUIToggleKey = SUITK; Window:UpdateKeyBind(SUITK); end);


local localPlayer = game.Players.LocalPlayer;
local currentCamera = game.Workspace.CurrentCamera;
local RunService = game:GetService("RunService");
local TweenService = game.TweenService;
local UIS = game.UserInputService;
local mouseLocation = UIS.GetMouseLocation;
local CoreGui = game:FindFirstChild("CoreGui");
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ESPHolder = Instance.new("Folder", (CoreGui or localPlayer.PlayerGui)); 
local Fov = Instance.new("ScreenGui",(CoreGui or localPlayer.PlayerGui))Fov.Name = "Fov" Fov.ZIndexBehavior = Enum.ZIndexBehavior.Sibling Fov.ResetOnSpawn = false; -- Yapee
local FOVFFrame = Instance.new("Frame")FOVFFrame.Parent = Fov FOVFFrame.Name = "FOVFFrame" FOVFFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) FOVFFrame.BorderColor3 = Color3.fromRGB(0, 0, 0) FOVFFrame.BorderSizePixel = 0 FOVFFrame.BackgroundTransparency = 1 FOVFFrame.AnchorPoint = Vector2.new(0.5, 0.5) FOVFFrame.Position = UDim2.new(0.5, 0,0.5, 0) FOVFFrame.Size = UDim2.new(0, HyperEscape.AimBot.Fov, 0, HyperEscape.AimBot.Fov) FOVFFrame.BackgroundTransparency = 1;
local UICorner = Instance.new("UICorner")UICorner.CornerRadius = UDim.new(1, 0) UICorner.Parent = FOVFFrame;
local UIStroke = Instance.new("UIStroke")UIStroke.Color = Color3.fromRGB(100,0,100) UIStroke.Parent = FOVFFrame UIStroke.Thickness = 1 UIStroke.ApplyStrokeMode = "Border";

local Holder = Instance.new("ScreenGui", game.CoreGui);

local Materials = {
	["ForceField"] = Enum.Material.ForceField,
	["SmoothPlastic"] = Enum.Material.SmoothPlastic,
	["Glass"] = Enum.Material.Glass,
	["Neon"] = Enum.Material.Neon,
	["Plastic"] = Enum.Material.Plastic,
};
local Textures = {
	["Groove"] = "rbxassetid://10785404176",
	["Cloud"] = "rbxassetid://5176277457",
	["Sky"] = "rbxassetid://1494603972",
	["Smudge"] = "rbxassetid://6096634060",
	["Scrapes"] = "rbxassetid://6248583558",
	["Galaxy"] = "rbxassetid://1120738433",
	["Stars"] = "rbxassetid://598201818",
	["Rainbow"] = "rbxassetid://10037165803",
	["Skibidy Toilet"] = "rbxassetid://14488881439"
};

local function GetTeamColor(Part) -- It Works Ok
	for i,Vest in pairs(Part.Parent:GetDescendants()) do
		if Vest.ClassName == "MeshPart" and Vest.MeshId == "rbxassetid://11232478007" and Vest.BrickColor == BrickColor.new("Earth blue") then
			return BrickColor.new("Bright blue");
		end
	end
	return BrickColor.new("Bright orange");
end

local function localTeamColor()
	if not game.Players.LocalPlayer.Neutral then
		return game.Players.LocalPlayer.TeamColor;
	end
end

local function GetGun()
	for i,Gun in currentCamera:GetChildren() do
		if Gun.ClassName == "Model" and Gun.Name ~= "Left Arm" and Gun.Name ~= "Right Arm"then
			return Gun;
		end
	end
	return nil;
end

local function GetDirChange()
	local a={}
	if game.Workspace.CurrentCamera:FindFirstChild(GetGun().Name) then 
		for _,v in pairs(GetGun():GetChildren()) do
			if string.find(string.lower(tostring(v)), "flame") or string.find(string.lower(tostring(v)), "sightmark") or string.find(string.lower(tostring(v))," flamesup") then
				a[#a+1] = v;
			end
		end
	end
	return a;
end

local function IsAlive()
	if game.Workspace.Ignore:FindFirstChild("RefPlayer") then 
		return true;
	end
	return false;
end

local function IsVisible(pos, ignoreList)
	return #currentCamera:GetPartsObscuringTarget({game.Workspace.Ignore:FindFirstChild("RefPlayer").Head, pos}, ignoreList) == 0 and true or false;
end

local function ApplyChams(part, material, color, transparency, decal, reflectance)
	if part:IsA("BasePart") and part.Transparency < 1 then
		local Material = Materials[material]
		local Texture = material == "ForceField" and Textures[decal] or ""

		if part:FindFirstChildOfClass("SpecialMesh") then
			local Mesh = part:FindFirstChildOfClass("SpecialMesh")
			Mesh.TextureId = Texture
			Mesh.VertexColor = Vector3.new(color.R, color.G, color.B)
		end

		if part:FindFirstChildOfClass("MeshPart") then
			local Mesh = part:FindFirstChildOfClass("MeshPart")
			Mesh.TextureId = Texture
			Mesh.VertexColor = Vector3.new(color.R, color.G, color.B)
		end

		if part.ClassName == "UnionOperation" then
			part.UsePartColor = true
		end

		if part:FindFirstChild("SurfaceAppearance") then
			part.SurfaceAppearance:Destroy()
		end

		if part:IsA("MeshPart") then
			part.TextureID = Texture
		end

		part.Color = color
		part.Material = material
		part.Transparency = transparency
		part.Reflectance = reflectance 
	end
end
local function focusGained()
	HyperEscape.SilentAim.iswindowactive= true;
end

local function focusReleased()
	HyperEscape.SilentAim.iswindowactive= false;
end

UserInputService.WindowFocused:Connect(focusGained)
UserInputService.WindowFocusReleased:Connect(focusReleased)

function esp:Update()
	if self and self.Character then
		local tosro = nil

		for i,Parts in self.Character:GetDescendants() do -- Erm, What The Sigma
			if Parts.ClassName == "SpecialMesh" then
				if Parts.MeshId == "rbxassetid://4049240078" then
					tosro = Parts.Parent;
				end
			end
		end

		if tosro ~= nil then
			local screen, onScreen = currentCamera:WorldToScreenPoint(tosro.Position); 

			if screen and onScreen and IsAlive() and esp.settings.Enable and GetTeamColor(tosro) ~= localTeamColor() then 

				local frustumHeight = math.tan(math.rad(currentCamera.FieldOfView * 0.5)) * 2 * screen.Z ; -- Thank you mickeydev, Join .gg/lunarity for the best paid script hub for fps games made by known and trusted developers. 
				local size = currentCamera.ViewportSize.Y / frustumHeight * Vector2.new(5,6);
				local position = Vector2.new(screen.X, screen.Y) - (size / 2 - Vector2.new(0, size.Y) / 20);

				if esp.settings.Box.Enabled then
					self.Drawings.BoxLeft.Size = UDim2.fromOffset(size.X, 1);
					self.Drawings.BoxRight.Size = UDim2.fromOffset(size.X, 1);
					self.Drawings.BoxUpper.Size = UDim2.fromOffset(1, size.Y);
					self.Drawings.BoxLower.Size = UDim2.fromOffset(1, size.Y);

					self.Drawings.OutlineBoxLeft.Size = self.Drawings.BoxLeft.Size;
					self.Drawings.OutlineBoxRight.Size = self.Drawings.BoxRight.Size;
					self.Drawings.OutlineBoxUpper.Size = self.Drawings.BoxUpper.Size;
					self.Drawings.OutlineBoxLower.Size = self.Drawings.BoxLower.Size;

					self.Drawings.BoxLeft.Position = UDim2.fromOffset(position.X, position.Y);
					self.Drawings.BoxRight.Position = UDim2.fromOffset(position.X, position.Y + size.Y - 1);
					self.Drawings.BoxUpper.Position = UDim2.fromOffset(position.X, position.Y);
					self.Drawings.BoxLower.Position = UDim2.fromOffset(position.X + size.X - 1, position.Y);

					self.Drawings.OutlineBoxLeft.Position = self.Drawings.BoxLeft.Position;
					self.Drawings.OutlineBoxRight.Position = self.Drawings.BoxRight.Position;
					self.Drawings.OutlineBoxUpper.Position = self.Drawings.BoxUpper.Position;
					self.Drawings.OutlineBoxLower.Position = self.Drawings.BoxLower.Position;

					self.Drawings.BoxLeft.BackgroundColor3 = esp.settings.Box.Color;
					self.Drawings.BoxRight.BackgroundColor3 = esp.settings.Box.Color;
					self.Drawings.BoxUpper.BackgroundColor3 = esp.settings.Box.Color;
					self.Drawings.BoxLower.BackgroundColor3 = esp.settings.Box.Color;

					self.Drawings.OutlineBoxLeft.BorderSizePixel = 1;
					self.Drawings.OutlineBoxRight.BorderSizePixel = 1;
					self.Drawings.OutlineBoxUpper.BorderSizePixel = 1;
					self.Drawings.OutlineBoxLower.BorderSizePixel = 1;

					self.Drawings.BoxLeft.BorderSizePixel = 0;
					self.Drawings.BoxRight.BorderSizePixel = 0;
					self.Drawings.BoxUpper.BorderSizePixel = 0;
					self.Drawings.BoxLower.BorderSizePixel = 0;

					self.Drawings.OutlineBoxLeft.BorderColor3 = esp.settings.Box.OutlineColor;
					self.Drawings.OutlineBoxRight.BorderColor3 = esp.settings.Box.OutlineColor;
					self.Drawings.OutlineBoxUpper.BorderColor3 = esp.settings.Box.OutlineColor;
					self.Drawings.OutlineBoxLower.BorderColor3 = esp.settings.Box.OutlineColor;

					self.Drawings.OutlineBoxLeft.BackgroundColor3 = esp.settings.Box.Color;
					self.Drawings.OutlineBoxRight.BackgroundColor3 = esp.settings.Box.Color;
					self.Drawings.OutlineBoxUpper.BackgroundColor3 = esp.settings.Box.Color;
					self.Drawings.OutlineBoxLower.BackgroundColor3 = esp.settings.Box.Color;

					self.Drawings.BoxLeft.Visible = esp.settings.Box.Enabled;
					self.Drawings.BoxRight.Visible = esp.settings.Box.Enabled;
					self.Drawings.BoxUpper.Visible = esp.settings.Box.Enabled;
					self.Drawings.BoxLower.Visible = esp.settings.Box.Enabled;

					self.Drawings.OutlineBoxLeft.Visible = esp.settings.Box.Enabled and esp.settings.Box.Outline;
					self.Drawings.OutlineBoxRight.Visible = esp.settings.Box.Enabled and esp.settings.Box.Outline;
					self.Drawings.OutlineBoxUpper.Visible = esp.settings.Box.Enabled and esp.settings.Box.Outline;
					self.Drawings.OutlineBoxLower.Visible = esp.settings.Box.Enabled and esp.settings.Box.Outline;
				else
					self.Drawings.BoxLeft.Visible = false;
					self.Drawings.BoxRight.Visible = false;
					self.Drawings.BoxUpper.Visible = false;
					self.Drawings.BoxLower.Visible = false;
					self.Drawings.OutlineBoxLeft.Visible = false;
					self.Drawings.OutlineBoxRight.Visible = false;
					self.Drawings.OutlineBoxUpper.Visible = false;
					self.Drawings.OutlineBoxLower.Visible = false;
				end

				if esp.settings.Tracer.Enabled then
					-- Tracer
					local ScreenVec2 = Vector2.new(screen.X, screen.Y + size.Y / 2 + size.Y / 20);
					local Origin = Vector2.new(currentCamera.ViewportSize.X/2, currentCamera.ViewportSize.Y - 1);
					local TracerPosition = (Origin + ScreenVec2) / 2;

					self.Drawings.Tracer.AnchorPoint = Vector2.new(0.5, 0.5);
					self.Drawings.Tracer.Rotation = math.deg(math.atan2(ScreenVec2.Y - Origin.Y, ScreenVec2.X - Origin.X));
					self.Drawings.Tracer.Position = UDim2.new(0, TracerPosition.X, 0, TracerPosition.Y);
					self.Drawings.Tracer.Size = UDim2.fromOffset((Origin - ScreenVec2).Magnitude, 1);

					self.Drawings.Tracer.BackgroundColor3 = esp.settings.Tracer.Color;
					self.Drawings.Tracer.Visible = esp.settings.Tracer.Enabled;
					self.Drawings.Tracer.BorderSizePixel = 0;

					self.Drawings.OutlineTracer.AnchorPoint = self.Drawings.Tracer.AnchorPoint;
					self.Drawings.OutlineTracer.Rotation = self.Drawings.Tracer.Rotation;
					self.Drawings.OutlineTracer.Position = self.Drawings.Tracer.Position;
					self.Drawings.OutlineTracer.Size = self.Drawings.Tracer.Size;

					self.Drawings.OutlineTracer.BackgroundColor3 = esp.settings.Box.Color;
					self.Drawings.OutlineTracer.Visible = esp.settings.Tracer.Enabled and esp.settings.Box.Outline;
					self.Drawings.OutlineTracer.BorderColor3 = esp.settings.Box.OutlineColor;
					self.Drawings.OutlineTracer.BorderSizePixel = 1;
				else
					self.Drawings.Tracer.Visible = false;
					self.Drawings.OutlineTracer.Visible = false;
				end

				if esp.settings.Hilight.Enabled then
					-- Hilight
					self.Drawings.Hilight.Adornee = tosro.Parent;
					self.Drawings.Hilight.Enabled = esp.settings.Hilight.Enabled;
					self.Drawings.Hilight.Parent = tosro.Parent;

					self.Drawings.Hilight.OutlineColor = esp.settings.Hilight.OutlineColor;
					self.Drawings.Hilight.FillColor = esp.settings.Hilight.FillColor;

					self.Drawings.Hilight.FillTransparency = esp.settings.Hilight.FillTransparency;
					self.Drawings.Hilight.OutlineTransparency = esp.settings.Hilight.OutlineTransparency;

					self.Drawings.Hilight.DepthMode = (esp.settings.Hilight.AllWaysShow and "AlwaysOnTop" or not esp.settings.Hilight.AllWaysShow and "Occluded");
				else
					self.Drawings.Hilight.Adornee = nil;
					self.Drawings.Hilight.Enabled = false;
				end

			else
				self.Drawings.BoxLeft.Visible = false;
				self.Drawings.BoxRight.Visible = false;
				self.Drawings.BoxUpper.Visible = false;
				self.Drawings.BoxLower.Visible = false;
				self.Drawings.Hilight.Adornee = nil;
				self.Drawings.Hilight.Enabled = false;
				self.Drawings.Tracer.Visible = false;
				self.Drawings.OutlineBoxLeft.Visible = false;
				self.Drawings.OutlineBoxRight.Visible = false;
				self.Drawings.OutlineBoxUpper.Visible = false;
				self.Drawings.OutlineBoxLower.Visible = false;
				self.Drawings.OutlineTracer.Visible = false;
			end
		else
			self.Drawings.BoxLeft.Visible = false;
			self.Drawings.BoxRight.Visible = false;
			self.Drawings.BoxUpper.Visible = false;
			self.Drawings.BoxLower.Visible = false;
			self.Drawings.Hilight.Adornee = nil;
			self.Drawings.Hilight.Enabled = false;
			self.Drawings.Tracer.Visible = false;
			self.Drawings.OutlineBoxLeft.Visible = false;
			self.Drawings.OutlineBoxRight.Visible = false;
			self.Drawings.OutlineBoxUpper.Visible = false;
			self.Drawings.OutlineBoxLower.Visible = false;
			self.Drawings.OutlineTracer.Visible = false;
		end
	end
end

function esp.Create(Character)
	local self = setmetatable({}, esp.cache);
	self.Character = Character;
	self.Drawings = {
		OutlineBoxUpper = Instance.new("Frame", Holder);
		OutlineBoxLower = Instance.new("Frame", Holder);
		OutlineBoxLeft = Instance.new("Frame", Holder);
		OutlineBoxRight = Instance.new("Frame", Holder);

		BoxUpper = Instance.new("Frame", Holder);
		BoxLower = Instance.new("Frame", Holder);
		BoxLeft = Instance.new("Frame", Holder);
		BoxRight = Instance.new("Frame", Holder);

		OutlineTracer = Instance.new("Frame", Holder);
		Tracer = Instance.new("Frame", Holder);

		Hilight = Instance.new("Highlight");
	};

	self.Connection = RunService.RenderStepped:Connect(function()
		self:Update();
	end)

	esp.cache[Character] = self;
	return self;
end

function esp:Remove()
	self.Connection:Disconnect();
	for _,Drawings in next, self.Drawings do
		if typeof(Drawings) ~= "table" then
			Drawings:Remove();
		end
	end
	esp.cache[self.Character] = nil;
	table.clear(self);
end

local loop = RunService.RenderStepped:Connect(function()
	for i,Character in game.Workspace.Players:GetDescendants() do 
		if Character.ClassName == "Model" then
			local self = esp.cache[Character];

			if not self then
				esp.Create(Character);
			end

			Character.Destroying:Connect(function()
				local self = esp.cache[Character];
			
				if self then
					self:Remove();
				end
			end)
		end
	end
end)


game:GetService("RunService").Heartbeat:Connect(function() 

	if HyperEscape.AimBot.Enabled and HyperEscape.AimBot.ShowFov then
		UIStroke.Enabled = true;
		UIStroke.Color = HyperEscape.AimBot.FovColor;

		local posd = UIS:GetMouseLocation();
		FOVFFrame.Position = UDim2.new(0, posd.X, 0, posd.Y - 36);
		FOVFFrame.Size = UDim2.fromOffset(HyperEscape.AimBot.Fov * 1.5, HyperEscape.AimBot.Fov * 1.5);
	else
		UIStroke.Enabled = false;
	end

	if HyperEscape.SilentAim.Enabled and HyperEscape.SilentAim.ShowFov then
		UIStroke.Enabled = true;
		UIStroke.Color = HyperEscape.AimBot.FovColor;

		local posd = UIS:GetMouseLocation();
		FOVFFrame.Position = UDim2.new(0, posd.X, 0, posd.Y - 36);
		FOVFFrame.Size = UDim2.fromOffset(HyperEscape.SilentAim.Fov * 1.5, HyperEscape.SilentAim.Fov * 1.5);
	else
		UIStroke.Enabled = false;
	end
	
	if HyperEscape.Visuals.ArmChams.Enable and IsAlive() then
		for _,part in next, currentCamera:GetChildren() do
			if not part.Name:lower():find("main") and #part:GetChildren() > 0 then

				for _,childPart in next, part:GetChildren() do
					if childPart.Name == "Sleeves" then
						childPart:Destroy();
					else
						ApplyChams(
							childPart, 
							HyperEscape.Visuals.ArmChams.Material, 
							HyperEscape.Visuals.ArmChams.Color, 
							HyperEscape.Visuals.ArmChams.trans,
							"",
							HyperEscape.Visuals.ArmChams.reflection
						)
					end
				end
			end
		end
	end
	
	if HyperEscape.Visuals.GunChams.Enable and IsAlive() then
		for _,part in next, currentCamera:GetChildren() do
			if part.Name:lower():find("main") and #part:GetChildren() > 0 then

				for _,childPart in next, part:GetChildren() do
					if childPart.Name == "Sleeves" then
						childPart:Destroy();
					else
						ApplyChams(
							childPart, 
							HyperEscape.Visuals.GunChams.Material, 
							HyperEscape.Visuals.GunChams.Color, 
							HyperEscape.Visuals.GunChams.trans,
							"",
							HyperEscape.Visuals.GunChams.reflection
						)
					end
				end
			end
		end
	end
	
	if HyperEscape.Visuals.Ambience.Enabled then
		if game.Lighting.Ambient ~= HyperEscape.Visuals.Ambience.AmbienceInside then
			game.Lighting.Ambient = HyperEscape.Visuals.Ambience.AmbienceInside;
		end

		if game.Lighting.OutdoorAmbient ~= HyperEscape.Visuals.Ambience.AmbienceOutside then
			game.Lighting.OutdoorAmbient = HyperEscape.Visuals.Ambience.AmbienceOutside;
		end
	end

	if HyperEscape.AimBot.Enabled then 
		if HyperEscape.AimBot.IsAimKeyDown then
			if HyperEscape.AimBot.StickyAim then

			else
				local target = nil;
				if target ~= nil then -- This Is Here For Now As Idk Any Executors That Have Working mousemoverel
					
				end
			end
		end
	end	

	if HyperEscape.SilentAim.Enabled and IsAlive() then
		
		local SmallestMagnitude, Target = math.huge, nil;
		for i,Character in game.Workspace.Players:GetDescendants() do
			if Character.ClassName == "Model" then
				local Torso = nil;
				local Head = nil;
				local AimPart = nil;

				for i,torsoParts in Character:GetDescendants() do -- Erm, What The Sigma
					if torsoParts.ClassName == "SpecialMesh" then
						if torsoParts.MeshId == "rbxassetid://4049240078" then
							Torso = torsoParts.Parent;
						end
					end
				end

				for i,headParts in Character:GetDescendants() do -- Erm, What The Sigma
					if headParts.ClassName == "SpecialMesh" then
						if headParts.MeshId == "rbxassetid://6179256256" then
							Head = headParts.Parent;
						end
					end
				end

				if Head and Torso then
					if GetTeamColor(Torso) ~= localTeamColor() then 
						for i,HitParts in next, HyperEscape.SilentAim.AimPart do
							if  HitParts == "Torso" then
								local TorsoScreenPos, TorsoOnScreen = currentCamera:WorldToViewportPoint(Torso.Position);		
								local TorsoPos = Vector2.new(TorsoScreenPos.X, TorsoScreenPos.Y);
								local TorsoMagnitude = (TorsoPos - mouseLocation(UIS)).Magnitude;
								if TorsoScreenPos and TorsoMagnitude < SmallestMagnitude and TorsoMagnitude < HyperEscape.SilentAim.Fov then
									if HyperEscape.SilentAim.WallCheck ~= true or IsVisible(Torso.Position, {Head.Parent, localPlayer.Character, game.Workspace.Ignore, currentCamera}) == true then
										SmallestMagnitude = TorsoMagnitude;
										Target = Torso;
									end
								end
							elseif HitParts == "Head" then
								local HeadScreenPos, HeadOnScreen = currentCamera:WorldToViewportPoint(Head.Position);
								local HeadPos = Vector2.new(HeadScreenPos.X, HeadScreenPos.Y);
								local HeadMagnitude = (HeadPos - mouseLocation(UIS)).Magnitude;
								if HeadScreenPos and HeadMagnitude < SmallestMagnitude and HeadMagnitude < HyperEscape.SilentAim.Fov then
									if HyperEscape.SilentAim.WallCheck ~= true or IsVisible(Head.Position, {Head.Parent, localPlayer.Character, game.Workspace.Ignore, currentCamera}) == true then
										SmallestMagnitude = HeadMagnitude;
										Target = Head;
									end
								end
							end
						end
					end
				end
			end
		end
		
		local CamGun = GetGun();

		pcall(function()
			if not CamGun:FindFirstChild("Tip") then
				if Target and CamGun and math.random(0, 100) <= HyperEscape.SilentAim.HitChance then
					for _,v in pairs(GetDirChange()) do

						v.Position = v.CFrame.Position;
						v.Velocity = Vector3.new();

						local weld = v:FindFirstChildWhichIsA("Weld") or v:FindFirstChildWhichIsA("WeldConstraint");
						if weld then
							weld:Destroy();
						end

						local x,y,z = CFrame.new(v.Position, Target.Position ):ToEulerAnglesYXZ();
						v.Orientation = Vector3.new(math.deg(x), math.deg(y), math.deg(z));

						HyperEscape.SilentAim.Target = true;
					end
				else
					
					local straight = game.Workspace.CurrentCamera.CFrame.LookVector*100000;
					for _,v in pairs(GetDirChange()) do

						v.Position = v.CFrame.Position;
						v.Velocity = Vector3.new();

						local weld = v:FindFirstChildWhichIsA("Weld") or v:FindFirstChildWhichIsA("WeldConstraint");
						if weld then
							weld:Destroy();
						end

						local x,y,z = CFrame.new(v.Position,straight):ToEulerAnglesYXZ();
						v.Orientation = Vector3.new(math.deg(x), math.deg(y), math.deg(z));

						HyperEscape.SilentAim.Target = false;
					end
				end
			else
				HyperEscape.SilentAim.Target = false;
			end
		end)
	end
end)

coroutine.wrap(function()
	while game:GetService("RunService").RenderStepped:Wait() do
		pcall(function()
			if HyperEscape.SilentAim.iswindowactive and mouse1press and mouse1release and IsAlive() then
				if HyperEscape.SilentAim.AoutoShoot and HyperEscape.SilentAim.Target then
					mouse1press()wait()mouse1rlease()
				end
			end
		end)
	end
end)()

