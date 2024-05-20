local HyperEscape = { -- fuck Off I Like It, Even Tho It Is Anoying.
	GUI = {
		GUIButton = true;
		GUIToggleKey = Enum.KeyCode.RightShift;
	};
	
	AimBot = { -- Same Targeting System Just Sticky Aim Now.
		Enabled = false; -- No Need To Change Anything Here As It Is On The GUI

		TeamCheck = false;
		WallCheck = false;

		-- NEW
		StickyAim = false; -- This Will Stick To The Same Target.
		Prediction = false; -- I Will Make Ajustable When People Complain About It.
		
		UseMouse = false;
		MouseBind = "MouseButton2";
		Keybind = Enum.UserInputType.MouseButton2; 

		ShowFov = false;
		Fov = 360;

		Smoothing = 0.1;

		AimPart = "Head";

		Thickness = 1;
		FovFillColor = Color3.fromRGB(100,0,100);
		FovColor = Color3.fromRGB(100,0,100);
		FovFillTransparency = 1;
		FovTransparenct = 0;

		IsAimKeyDown = false; -- Don't Touch Anything Here Niggas 
		Target = nil;
		CameraTween = nil;
	};

	esp = {
		CharacterSize = Vector2.new(5,6);
		Box = {
			TeamCheck = false;

			Box = false;
			Name = false;
			Distance = false;
			Health = false; -- This Is Text
			HealthBar = false;

			Color = Color3.fromRGB(255, 255, 255);

			Outline = false;
			OutlineColor = Color3.fromRGB(0,0,0);	
		};

		Tracer = {
			TeamCheck = false;
			TeamColor = false;

			Tracer = false;
			Color = Color3.fromRGB(255, 255, 255);

			Outline = false;
			OutlineColor = Color3.fromRGB(0, 0, 0);
		};

		Hilights = { -- TODO Arsenal 
			TeamCheck = false;

			Hilights = false;

			AllWaysVisible = false;			

			OutlineTransparency = 0.5;
			FillTransparency = 0.5;

			OutlineColor = Color3.fromRGB(255, 0, 0);
			FillColor = Color3.fromRGB(255, 255, 255);
		};
	};
}
local players = game.Players;
local localPlayer = players.LocalPlayer;
local CurrentCamera = game.Workspace.CurrentCamera;
local TweenService = game.TweenService;
local UIS = game.UserInputService;
local mouseLocation = UIS.GetMouseLocation;
local CoreGui = game:FindFirstChild("CoreGui");

function library()
	local library = { 
		flags = { };
		items = { };
	}

	local StarterGUI = game.Players.LocalPlayer.PlayerGui;
	local CoreGui = game:FindFirstChild("CoreGui");
	local textservice = game:GetService("TextService");

	library.theme = {
		BackGround = Color3.fromRGB(30, 30, 30);
		BackGround2 = Color3.fromRGB(38, 38, 38);

		Border = Color3.fromRGB(0, 0, 0);

		Toggle = Color3.fromRGB(62, 62, 62);
		Selected = Color3.fromRGB(85, 0, 255);

		Font = Enum.Font.Ubuntu;
		TextSize = 14;
		TextColor = Color3.fromRGB(255, 255, 255);
	};

	function library:CreateWindow(Keybind)
		local window = { };
		window.keybind = Keybind or Enum.KeyCode.RightShift;

		window.ScreenGui = Instance.new("ScreenGui");
		window.ScreenGui.Parent = (CoreGui or StarterGUI);
		window.ScreenGui.ResetOnSpawn = false;
		window.ScreenGui.DisplayOrder = 10;

		window.Main = Instance.new("Frame", window.ScreenGui);
		window.Main.Size = UDim2.fromOffset(800, 450);
		window.Main.BackgroundColor3 = library.theme.BackGround;
		window.Main.BorderSizePixel = 1;
		window.Main.BorderColor3 = library.theme.Border;
		window.Main.Active = true;
		window.Main.Draggable = true; -- Fuck You I Am Not Making It Myself When Roblox Has This Shit.

		window.RightSide = Instance.new("Frame", window.Main);
		window.RightSide.BackgroundColor3 = library.theme.BackGround2;
		window.RightSide.Size = UDim2.fromOffset(150, 450);
		window.RightSide.BorderSizePixel = 0;

		window.TabsHolder = Instance.new("Frame", window.Main);
		window.TabsHolder.Position = UDim2.fromScale(0.031, 0.107);
		window.TabsHolder.Size =  UDim2.fromOffset(100, 389);
		window.TabsHolder.BackgroundTransparency = 1;
		
		window.UIListLayout = Instance.new("UIListLayout", window.TabsHolder);
		window.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		window.UIListLayout.Padding = UDim.new(0, 10);
		window.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
		
		window.line = Instance.new("Frame", window.Main);
		window.line.Position = UDim2.fromScale(0.188, 0);
		window.line.Size = UDim2.fromOffset(1, 450);
		window.line.BorderSizePixel = 0;
		window.line.BackgroundColor3 = library.theme.Border;
		
		window.Title = Instance.new("TextLabel", window.Main);
		window.Title.Position = UDim2.fromScale(0.016, 0.016);
		window.Title.Size = UDim2.fromOffset(123, 34);
		window.Title.Text = "DeleteMob V2.1";
		window.Title.Font = library.theme.Font;
		window.Title.TextSize = 19;
		window.Title.BackgroundTransparency = 1;
		window.Title.TextColor3 = library.theme.TextColor;
		local fontFace = window.Title.FontFace -- Idk What The Fuck I Did Here.
		fontFace.Weight = Enum.FontWeight.Bold
		window.Title.FontFace = fontFace;
		
		game:GetService("UserInputService").InputBegan:Connect(function(key)
			if key.KeyCode == window.keybind then
				window.Main.Visible = not window.Main.Visible
			end
		end)
		
		window.Tabs = { };
		
		function window:UpdateKeyBind(Key)
			window.keybind = Key;
		end
		
		function window:CreateToggleButton()
			local ToggleButton = { };
			
			ToggleButton.Frame = Instance.new("Frame", window.ScreenGui);
			ToggleButton.Frame.Size = UDim2.fromOffset(141, 38);
			ToggleButton.Frame.Position = UDim2.fromScale(0.466, 0.15);
			ToggleButton.Frame.Draggable = true;
			ToggleButton.Frame.Active = true;
			ToggleButton.Frame.BackgroundColor3 = library.theme.BackGround;
			ToggleButton.Frame.BorderSizePixel = 1;
			ToggleButton.Frame.BorderColor3 = library.theme.Border;
			
			ToggleButton.Button = Instance.new("TextButton", ToggleButton.Frame);
			ToggleButton.Button.Size = UDim2.fromOffset(141, 26);
			ToggleButton.Button.Position = UDim2.fromScale(0, 0.316);
			ToggleButton.Button.Text = "Close";
			ToggleButton.Button.TextColor3 = library.theme.TextColor;
			ToggleButton.Button.Font = library.theme.Font;
			ToggleButton.Button.TextSize = library.theme.TextSize;
			ToggleButton.Button.BackgroundColor3 = library.theme.BackGround2;
			ToggleButton.Button.BorderSizePixel = 0;
			ToggleButton.Button.BorderColor3 = library.theme.Border;
			ToggleButton.Button.MouseButton1Click:Connect(function()
				window.Main.Visible = not window.Main.Visible;
				ToggleButton.Button.Text = window.Main.Visible and "Close" or not window.Main.Visible and "Open"
			end)
			
			game:GetService("UserInputService").InputBegan:Connect(function(key)
				if key.KeyCode == window.keybind then
					ToggleButton.Button.Text = window.Main.Visible and "Close" or "Open"
				end
			end)
			
			function ToggleButton:Update(Bool)
				ToggleButton.Frame.Visible = Bool;
			end
			
			return ToggleButton;
		end
		
		function window:CreateTab(Name) -- Fuck You No ScrollingFrame
			local tab = { };
			
			tab.Button = Instance.new("TextButton", window.TabsHolder);
			tab.Button.Size = UDim2.fromOffset(137, 33);
			tab.Button.BackgroundColor3 = library.theme.BackGround;
			tab.Button.Text = Name;
			tab.Button.TextColor3 = library.theme.TextColor;
			tab.Button.Font = library.theme.Font;
			tab.Button.TextSize = library.theme.TextSize;
			tab.Button.BorderSizePixel = 0;
			
			tab.Window = Instance.new("Frame", window.Main);
			tab.Window.Name = Name .. "Tab";
			tab.Window.BackgroundTransparency = 1;
			tab.Window.Visible = false;
			tab.Window.Size = UDim2.fromOffset(650, 450);
			tab.Window.Position = UDim2.fromScale(0.188, 0);
			
			tab.Left = Instance.new("Frame", tab.Window);
			tab.Left.Size = UDim2.fromOffset(100, 428);
			tab.Left.Position = UDim2.fromScale(0.185, 0.047);
			tab.Left.BackgroundTransparency = 1;
			
			tab.UiListLayout = Instance.new("UIListLayout", tab.Left);
			tab.UiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			tab.UiListLayout.Padding = UDim.new(0, 7);
			tab.UiListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
			
			tab.Right = Instance.new("Frame", tab.Window);
			tab.Right.Size = UDim2.fromOffset(100, 428);
			tab.Right.Position = UDim2.fromScale(0.662, 0.047);
			tab.Right.BackgroundTransparency = 1;
			
			tab.UiListLayout1 = Instance.new("UIListLayout", tab.Right);
			tab.UiListLayout1.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			tab.UiListLayout1.Padding = UDim.new(0, 7);
			tab.UiListLayout1.SortOrder = Enum.SortOrder.LayoutOrder;
			
			local block = false;
			function tab:SelectTab()
				repeat 
					wait();
				until block == false

				block = true;
				for i,v in pairs(window.Tabs) do
					if v ~= tab or v.ClassName ~= "TextLabel" then
						v.Button.BackgroundColor3 = library.theme.BackGround;
						v.Button.Name = "Tab";
						v.Window.Visible = false;
					end
				end

				tab.Button.BackgroundColor3 = library.theme.Selected;
				tab.Button.Name = "SelectedTab";
				tab.Window.Visible = true;
				block = false;
			end

			if #window.Tabs == 0 then
				tab:SelectTab();
			end

			tab.Button.MouseButton1Down:Connect(function()
				tab:SelectTab();
			end)

			tab.SectorsLeft = { };
			tab.SectorsRight = { };
			
			function tab:CreateSector(Name, Side)
				local Sector = { };
				Sector.side = Side:lower() or "left"
				Sector.name = Name or ""
				
				Sector.Main = Instance.new("Frame", Sector.side == "left" and tab.Left or tab.Right);
				Sector.Main.BackgroundColor3 = library.theme.BackGround2;
				Sector.Main.BorderSizePixel = 0;
				Sector.Main.Name = Sector.name:gsub(" ", "") .. "Sector";
				Sector.Main.Size = UDim2.fromOffset(265, 50);
				
				Sector.UICorner = Instance.new("UICorner", Sector.Main);
				Sector.UICorner.CornerRadius = UDim.new(0, 9);
				
				Sector.Items = Instance.new("Frame", Sector.Main);
				Sector.Items.Position = UDim2.fromScale(0.434, 0);
				Sector.Items.Size = UDim2.fromOffset(34 , 50);
				Sector.Items.AutomaticSize = Enum.AutomaticSize.Y;
				Sector.Items.BackgroundTransparency = 1;
				
				Sector.UIListLayout = Instance.new("UIListLayout", Sector.Items);
				Sector.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
				Sector.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
				Sector.UIListLayout.Padding = UDim.new(0,7);
				
				Sector.Name = Instance.new("TextLabel", Sector.Items);
				Sector.Name.BackgroundTransparency = 1;
				Sector.Name.Size = UDim2.fromOffset(20, 20);
				Sector.Name.Text = Name;
				Sector.Name.TextColor3 = library.theme.TextColor;
				Sector.Name.Font = library.theme.Font;
				Sector.Name.TextSize = library.theme.TextSize;
				Sector.Name.TextYAlignment = Enum.TextYAlignment.Bottom;
				
				Sector.Divider = Instance.new("Frame", Sector.Items);
				Sector.Divider.Size = UDim2.fromOffset(230, 2);
				Sector.Divider.BorderSizePixel = 0;
				Sector.Divider.BackgroundColor3 = library.theme.BackGround;
				
				table.insert(Sector.side:lower() == "left" and tab.SectorsLeft or tab.SectorsRight, Sector);

				function Sector:FixSize()
					Sector.Main.Size = UDim2.fromOffset(250, Sector.UIListLayout.AbsoluteContentSize.Y + 12);
					local sizeleft, sizeright = 0, 0;
					for i,v in pairs(tab.SectorsLeft) do
						sizeleft = sizeleft + v.Main.AbsoluteSize.Y;
					end
					for i,v in pairs(tab.SectorsRight) do
						sizeright = sizeright + v.Main.AbsoluteSize.Y;
					end
				end
				
				function Sector:CreateToggle(Text, Defult, Callback, Flag)
					local Toggle = { };
					Toggle.text = Text or "";
					Toggle.default = Defult or false;
					Toggle.callback = Callback or function(value) end;
					Toggle.flag = Flag or Text or "";

					Toggle.value = Toggle.default;
					
					Toggle.Main = Instance.new("TextButton", Sector.Items);
					Toggle.Main.Size = UDim2.fromOffset(240, 35);
					Toggle.Main.BackgroundColor3 = library.theme.BackGround;
					Toggle.Main.AutoButtonColor = false;
					Toggle.Main.Text = "";
					
					Toggle.UICorner = Instance.new("UICorner", Toggle.Main);
					Toggle.UICorner.CornerRadius = UDim.new(0, 8);
					
					Toggle.Text = Instance.new("TextLabel", Toggle.Main);
					Toggle.Text.Position = UDim2.fromScale(0.046, 0);
					Toggle.Text.Size = UDim2.fromOffset(125, 35);
					Toggle.Text.Text = Text;
					Toggle.Text.TextColor3 = library.theme.TextColor;
					Toggle.Text.Font = library.theme.Font;
					Toggle.Text.TextSize = library.theme.TextSize;
					Toggle.Text.BackgroundTransparency = 1;
					Toggle.Text.TextXAlignment = Enum.TextXAlignment.Left;
					
										
					Toggle.Indicator = Instance.new("Frame", Toggle.Main);
					Toggle.Indicator.Position = UDim2.fromScale(0.875, 0.229);
					Toggle.Indicator.Size = UDim2.fromOffset(18, 18);
					Toggle.Indicator.BackgroundColor3 = library.theme.Toggle;
					Toggle.Indicator.BorderSizePixel = 0;
					
					if Toggle.flag and Toggle.flag ~= "" then
						library.flags[Toggle.flag] = Toggle.default or false;
					end
					
					function Toggle:Set(value) 
						if value then
							Toggle.Indicator.BackgroundColor3 = library.theme.Selected;
						else
							Toggle.Indicator.BackgroundColor3 = library.theme.Toggle;
						end

						Toggle.value = value
						Toggle.Indicator.BackgroundColor3 = (value and library.theme.Selected or library.theme.Toggle);
						if Toggle.flag and Toggle.flag ~= "" then
							library.flags[Toggle.flag] = Toggle.value;
						end
						pcall(Toggle.callback, value);
					end
					
					Toggle.Main.MouseButton1Down:Connect(function()
						Toggle:Set(not (Toggle.Indicator.BackgroundColor3 == library.theme.Selected and true or Toggle.Indicator.BackgroundColor3 == library.theme.Toggle and false));
					end)
					
					Toggle:Set(Toggle.default)
					Sector:FixSize();
					table.insert(library.items, Toggle);
					return Toggle;
				end
				
				function Sector:CreateSlider(Text, Min, Defult, Max, Decimals, Callback, Flag)
					local Slider = { };
					Slider.text = Text or "";
					Slider.callback = Callback or function(value) end;
					Slider.min = Min or 0;
					Slider.max = Max or 100;
					Slider.decimals = Decimals or 1;
					Slider.default = Defult or Slider.min;
					Slider.flag = Flag or Text or "";
					
					Slider.value = Slider.default;
					local dragging = false;
					
					Slider.Mainback = Instance.new("Frame", Sector.Items);
					Slider.Mainback.Size = UDim2.fromOffset(240, 35);
					Slider.Mainback.BackgroundColor3 = library.theme.BackGround;
					Slider.Mainback.BorderSizePixel = 0;
					
					Slider.UICorner = Instance.new("UICorner", Slider.Mainback);
					Slider.UICorner.CornerRadius = UDim.new(0, 8);
					
					Slider.Text = Instance.new("TextLabel", Slider.Mainback);
					Slider.Text.Position = UDim2.fromScale(0.046, 0);
					Slider.Text.Size = UDim2.fromOffset(125, 35);
					Slider.Text.Text = Text;
					Slider.Text.TextColor3 = library.theme.TextColor;
					Slider.Text.Font = library.theme.Font;
					Slider.Text.TextSize = library.theme.TextSize;
					Slider.Text.BackgroundTransparency = 1;
					Slider.Text.TextXAlignment = Enum.TextXAlignment.Left;
					
					Slider.Main = Instance.new("TextButton", Slider.Mainback);
					Slider.Main.BackgroundColor3 = library.theme.Toggle;
					Slider.Main.Text = "";
					Slider.Main.Position = UDim2.fromScale(0.533, 0.229);
					Slider.Main.Size = UDim2.fromOffset(100, 18);
					Slider.Main.BorderSizePixel = 0;
					Slider.Main.AutoButtonColor = false;
					
					Slider.Slider = Instance.new("Frame", Slider.Main);
					Slider.Slider.BackgroundColor3 = library.theme.Selected;
					Slider.Slider.BorderSizePixel = 0;
					Slider.Slider.Position = UDim2.fromScale(0, 0);
					Slider.Slider.Size = UDim2.fromOffset(50, 18);
					
					Slider.OutPutText = Instance.new("TextLabel", Slider.Main);
					Slider.OutPutText.Position = UDim2.fromScale(0, 0);
					Slider.OutPutText.Size = UDim2.fromOffset(100, 18);
					Slider.OutPutText.BackgroundTransparency = 1;
					Slider.OutPutText.Font = library.theme.Font;
					Slider.OutPutText.TextColor3 = library.theme.TextColor;
					Slider.OutPutText.TextSize = library.theme.TextSize;
					Slider.OutPutText.Text = Slider.value;
					
					if Slider.flag and Slider.flag ~= "" then
						library.flags[Slider.flag] = Slider.default or Slider.min or 0;
					end

					function Slider:Get()
						return Slider.value;
					end

					function Slider:Set(value)
						Slider.value = math.clamp(math.round(value * Slider.decimals) / Slider.decimals, Slider.min, Slider.max);
						local percent = 1 - ((Slider.max - Slider.value) / (Slider.max - Slider.min));
						if Slider.flag and Slider.flag ~= "" then
							library.flags[Slider.flag] = Slider.value;
						end
						Slider.Slider:TweenSize(UDim2.fromOffset(percent * Slider.Main.AbsoluteSize.X, Slider.Main.AbsoluteSize.Y), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.07);
						Slider.OutPutText.Text = Slider.value;
						pcall(Slider.callback, Slider.value);
					end
					
					Slider:Set(Slider.default);

					function Slider:Refresh()
						local mousePos = game.Workspace.CurrentCamera:WorldToViewportPoint(game.Players.LocalPlayer:GetMouse().Hit.p);
						local percent = math.clamp(mousePos.X - Slider.Slider.AbsolutePosition.X, 0, Slider.Main.AbsoluteSize.X) / Slider.Main.AbsoluteSize.X;
						local value = math.floor((Slider.min + (Slider.max - Slider.min) * percent) * Slider.decimals) / Slider.decimals;
						value = math.clamp(value, Slider.min, Slider.max);
						Slider:Set(value);
					end

					Slider.Slider.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true;
							Slider:Refresh();
						end
					end)

					Slider.Slider.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false;
						end
					end)

					Slider.Main.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true;
							Slider:Refresh();
						end
					end)

					Slider.Main.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false;
						end
					end)

					game:GetService("UserInputService").InputChanged:Connect(function(input)
						if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
							Slider:Refresh();
						end
					end)

					Sector:FixSize();
					table.insert(library.items, Slider);
					
					return Slider;
				end
				
				function Sector:CreateDropDown(Text, Items, Default, Multichoice, Callback, Flag)
					local DropDown = { };	
					DropDown.text = Text or "";
					DropDown.defaultitems = Items or { };
					DropDown.default = Default;
					DropDown.callback = Callback or function() end;
					DropDown.multichoice = Multichoice or false;
					DropDown.values = { };
					DropDown.flag = Flag or Text or "";
					
					DropDown.MainBack = Instance.new("TextButton", Sector.Items);
					DropDown.MainBack.BackgroundColor3 = library.theme.BackGround;
					DropDown.MainBack.AutoButtonColor = false;
					DropDown.MainBack.Size = UDim2.fromOffset(240, 35);
					DropDown.MainBack.Text = "";
					
					DropDown.UICorner = Instance.new("UICorner", DropDown.MainBack);
					DropDown.UICorner.CornerRadius = UDim.new(0,8);
					
					DropDown.TextLabel = Instance.new("TextLabel", DropDown.MainBack);
					DropDown.TextLabel.Text = DropDown.text;
					DropDown.TextLabel.BackgroundTransparency = 1;
					DropDown.TextLabel.TextColor3 = library.theme.TextColor;
					DropDown.TextLabel.TextSize = library.theme.TextSize;
					DropDown.TextLabel.Font = library.theme.Font;
					DropDown.TextLabel.Size = UDim2.fromOffset(125, 35);
					DropDown.TextLabel.Position = UDim2.fromScale(0.046, 0);
					DropDown.TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					
					DropDown.Main = Instance.new("TextButton", DropDown.MainBack);
					DropDown.Main.BackgroundColor3 = library.theme.Toggle;
					DropDown.Main.BorderSizePixel = 0;
					DropDown.Main.Position = UDim2.fromScale(0.496, 0.229);
					DropDown.Main.Size = UDim2.fromOffset(109, 18);
					DropDown.Main.TextSize = library.theme.TextSize;
					DropDown.Main.TextColor3 = library.theme.TextColor;
					DropDown.Main.Font = library.theme.Font;
					DropDown.Main.AutoButtonColor = false;
					DropDown.Main.Text = "";
					
					DropDown.SelectedLable = Instance.new("TextLabel", DropDown.Main);
					DropDown.SelectedLable.Position = UDim2.fromOffset(0,0);
					DropDown.SelectedLable.Size = UDim2.fromOffset(108, 18);
					DropDown.SelectedLable.BackgroundTransparency = 1;
					DropDown.SelectedLable.TextSize = library.theme.TextSize;
					DropDown.SelectedLable.TextColor3 = library.theme.TextColor;
					DropDown.SelectedLable.Font = library.theme.Font;
					DropDown.SelectedLable.Text = DropDown.text;
					
					DropDown.Itemsframe = Instance.new("ScrollingFrame", DropDown.Main);
					DropDown.Itemsframe.BorderSizePixel = 0;
					DropDown.Itemsframe.BackgroundColor3 = library.theme.BackGround;
					DropDown.Itemsframe.Position = UDim2.fromOffset(0, DropDown.Main.Size.Y.Offset + 8);
					DropDown.Itemsframe.ScrollBarThickness = 2;
					DropDown.Itemsframe.ZIndex = 8;
					DropDown.Itemsframe.ScrollingDirection = "Y";
					DropDown.Itemsframe.Visible = false;
					DropDown.Itemsframe.CanvasSize = UDim2.fromOffset(DropDown.Main.AbsoluteSize.X, 0);
					
					DropDown.UIList = Instance.new("UIListLayout", DropDown.Itemsframe);
					DropDown.UIList.FillDirection = Enum.FillDirection.Vertical;
					DropDown.UIList.SortOrder = Enum.SortOrder.LayoutOrder;
					
					DropDown.IgnoreBackButtons = Instance.new("TextButton", DropDown.Main);
					DropDown.IgnoreBackButtons.BackgroundTransparency = 1;
					DropDown.IgnoreBackButtons.BorderSizePixel = 0;
					DropDown.IgnoreBackButtons.Position = UDim2.fromOffset(0, DropDown.Main.Size.Y.Offset + 8);
					DropDown.IgnoreBackButtons.Size = UDim2.new(0, 0, 0, 0);
					DropDown.IgnoreBackButtons.ZIndex = 7;
					DropDown.IgnoreBackButtons.Text = "";
					DropDown.IgnoreBackButtons.Visible = false;
					DropDown.IgnoreBackButtons.AutoButtonColor = false;
					
					if DropDown.flag and DropDown.flag ~= "" then
						library.flags[DropDown.flag] = DropDown.multichoice and { DropDown.default or DropDown.defaultitems[1] or "" } or (DropDown.default or DropDown.defaultitems[1] or "");
					end

					function DropDown:isSelected(item)
						for i, v in pairs(DropDown.values) do
							if v == item then
								return true;
							end
						end
						return false;
					end

					function DropDown:GetOptions()
						return DropDown.values;
					end

					function DropDown:updateText(text)
						if #text >= 27 then
							text = text:sub(1, 25) .. "..";
						end
						DropDown.SelectedLable.Text = text;
					end

					DropDown.Changed = Instance.new("BindableEvent");
					function DropDown:Set(value)
						if type(value) == "table" then
							DropDown.values = value;
							DropDown:updateText(table.concat(value, ", "));
							pcall(DropDown.callback, value);
						else
							DropDown:updateText(value);
							DropDown.values = { value };
							pcall(DropDown.callback, value);
						end

						DropDown.Changed:Fire(value)
						if DropDown.flag and DropDown.flag ~= "" then
							library.flags[DropDown.flag] = DropDown.multichoice and DropDown.values or DropDown.values[1];
						end
					end

					function DropDown:Get()
						return DropDown.multichoice and DropDown.values or DropDown.values[1];
					end

					DropDown.items = { }
					function DropDown:Add(v)
						local Item = Instance.new("TextButton", DropDown.Itemsframe);
						Item.BackgroundColor3 = library.theme.Toggle;
						Item.TextColor3 = library.theme.TextColor;
						Item.BorderSizePixel = 0;
						Item.Position = UDim2.fromOffset(0, 0);
						Item.Size = UDim2.fromOffset(180, 20);
						Item.BackgroundTransparency = 0;
						Item.ZIndex = 9;
						Item.Text = v;
						Item.Name = v;
						Item.AutoButtonColor = false;
						Item.Font = library.theme.Font;
						Item.TextSize = library.theme.TextSize;
						Item.TextXAlignment = Enum.TextXAlignment.Left;

						Item.MouseButton1Down:Connect(function()
							if DropDown.multichoice then
								if DropDown:isSelected(v) then
									for i2, v2 in pairs(DropDown.values) do
										if v2 == v then
											table.remove(DropDown.values, i2);
										end
									end
									DropDown:Set(DropDown.values);
								else
									table.insert(DropDown.values, v);
									DropDown:Set(DropDown.values);
								end

								return
							else
								DropDown.Itemsframe.Visible = false;
								DropDown.Itemsframe.Active = false;
								DropDown.IgnoreBackButtons.Visible = false;
								DropDown.IgnoreBackButtons.Active = false;
							end

							DropDown:Set(v)
							return
						end)

						game:GetService("RunService").RenderStepped:Connect(function()
							if DropDown.multichoice and DropDown:isSelected(v) or DropDown.values[1] == v then
								Item.BackgroundColor3 = library.theme.Selected;
								Item.Text = v;
							else
								Item.BackgroundColor3 = library.theme.BackGround2;
								Item.Text = v;
							end
						end)

						table.insert(DropDown.items, v);
						DropDown.Itemsframe.Size = UDim2.fromOffset(DropDown.Main.Size.X.Offset, math.clamp(#DropDown.items * Item.AbsoluteSize.Y, 20, 156) + 4);
						DropDown.Itemsframe.CanvasSize = UDim2.fromOffset(DropDown.Itemsframe.AbsoluteSize.X, (#DropDown.items * Item.AbsoluteSize.Y) + 4);

						DropDown.IgnoreBackButtons.Size = DropDown.Itemsframe.Size;
					end

					function DropDown:Remove(value)
						local item = DropDown.Itemsframe:FindFirstChild(value);
						if item then
							for i,v in pairs(DropDown.items) do
								if v == value then
									table.remove(DropDown.items, i);
								end
							end

							DropDown.Itemsframe.Size = UDim2.fromOffset(DropDown.Main.Size.X.Offset, math.clamp(#DropDown.items * item.AbsoluteSize.Y, 20, 156) + 4);
							DropDown.Itemsframe.CanvasSize = UDim2.fromOffset(DropDown.Itemsframe.AbsoluteSize.X, (#DropDown.items * item.AbsoluteSize.Y) + 4);

							DropDown.IgnoreBackButtons.Size = DropDown.Itemsframe.Size;

							item:Remove();
						end
					end 

					for i,v in pairs(DropDown.defaultitems) do
						DropDown:Add(v);
					end

					if DropDown.default then
						DropDown:Set(DropDown.default);
					end

					local MouseButton1Down = function()
						if not DropDown.Itemsframe.Visible then
							if DropDown.items and #DropDown.items ~= 0 then
								DropDown.Itemsframe.ScrollingEnabled = true;
								DropDown.Itemsframe.Visible = true;
								DropDown.Itemsframe.Active = true;
								DropDown.IgnoreBackButtons.Visible = true;
								DropDown.IgnoreBackButtons.Active = true;
							end
						else
							DropDown.Itemsframe.ScrollingEnabled = false;
							DropDown.Itemsframe.Visible = false;
							DropDown.Itemsframe.Active = false;
							DropDown.IgnoreBackButtons.Visible = false;
							DropDown.IgnoreBackButtons.Active = false;
						end
					end
					
					DropDown.MainBack.MouseButton1Down:Connect(MouseButton1Down)
					DropDown.Main.MouseButton1Down:Connect(MouseButton1Down)

					Sector:FixSize();
					table.insert(library.items, DropDown);
					return DropDown;
				end
				
				function Sector:CreateColorPicker(Text, Defult, CallBack, Flag) -- I Know This Is Shit But I Will Make A Better One Later.
					local ColorPicker = { };
					ColorPicker.text = Text or "";
					ColorPicker.default = Defult or Color3.fromRGB(255, 255, 255);
					ColorPicker.callback = CallBack or function() end;
					ColorPicker.flag = Flag or Text or "";
					ColorPicker.color = Defult or Color3.fromRGB(255, 255, 255);
					
					ColorPicker.MainBack = Instance.new("TextButton", Sector.Items);
					ColorPicker.MainBack.BackgroundColor3 = library.theme.BackGround;
					ColorPicker.MainBack.AutoButtonColor = false;
					ColorPicker.MainBack.Size = UDim2.fromOffset(240, 35);
					ColorPicker.MainBack.Text = "";
					
					ColorPicker.UiCorner = Instance.new("UICorner", ColorPicker.MainBack);
					ColorPicker.UiCorner.CornerRadius = UDim.new(0, 8);
					
					ColorPicker.TextLabel = Instance.new("TextLabel", ColorPicker.MainBack);
					ColorPicker.TextLabel.Text = ColorPicker.text;
					ColorPicker.TextLabel.BackgroundTransparency = 1;
					ColorPicker.TextLabel.TextColor3 = library.theme.TextColor;
					ColorPicker.TextLabel.TextSize = library.theme.TextSize;
					ColorPicker.TextLabel.Font = library.theme.Font;
					ColorPicker.TextLabel.Size = UDim2.fromOffset(125, 35);
					ColorPicker.TextLabel.Position = UDim2.fromScale(0.046, 0);
					ColorPicker.TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					
					ColorPicker.TextR = Instance.new("TextBox", ColorPicker.MainBack);
					ColorPicker.TextR.Position = UDim2.fromScale(0.525, 0.229);
					ColorPicker.TextR.Size = UDim2.fromOffset(36, 18);
					ColorPicker.TextR.BackgroundColor3 = library.theme.Toggle;
					ColorPicker.TextR.BorderColor3 = library.theme.Border;
					ColorPicker.TextR.Text = math.floor(ColorPicker.default.R) * 255;
					ColorPicker.TextR.Font = library.theme.Font;
					ColorPicker.TextR.TextSize = library.theme.TextSize;
					ColorPicker.TextR.TextColor3 = library.theme.TextColor;
					
					ColorPicker.TextG = Instance.new("TextBox", ColorPicker.MainBack);
					ColorPicker.TextG.Position = UDim2.fromScale(0.675, 0.229);
					ColorPicker.TextG.Size = UDim2.fromOffset(36, 18);
					ColorPicker.TextG.BackgroundColor3 = library.theme.Toggle;
					ColorPicker.TextG.BorderColor3 = library.theme.Border;
					ColorPicker.TextG.Text = math.floor(ColorPicker.default.G) * 255;
					ColorPicker.TextG.Font = library.theme.Font;
					ColorPicker.TextG.TextSize = library.theme.TextSize;
					ColorPicker.TextG.TextColor3 = library.theme.TextColor;
					
					ColorPicker.TextB = Instance.new("TextBox", ColorPicker.MainBack);
					ColorPicker.TextB.Position = UDim2.fromScale(0.821, 0.229);
					ColorPicker.TextB.Size = UDim2.fromOffset(36, 18);
					ColorPicker.TextB.BackgroundColor3 = library.theme.Toggle;
					ColorPicker.TextB.BorderColor3 = library.theme.Border;
					ColorPicker.TextB.Text = math.floor(ColorPicker.default.B) * 255;
					ColorPicker.TextB.Font = library.theme.Font;
					ColorPicker.TextB.TextSize = library.theme.TextSize;
					ColorPicker.TextB.TextColor3 = library.theme.TextColor;
					

					if ColorPicker.flag and ColorPicker.flag ~= "" then
						library.flags[ColorPicker.flag] = ColorPicker.default or "";
					end

					function ColorPicker:Set(R, G, B)
						ColorPicker.color = Color3.fromRGB(tonumber(R), tonumber(G), tonumber(B));
						ColorPicker.TextR.Text = tonumber(R);
						ColorPicker.TextG.Text = tonumber(G);
						ColorPicker.TextB.Text = tonumber(B);
						
						if ColorPicker.flag and ColorPicker.flag ~= "" then
							library.flags[ColorPicker.flag] = ColorPicker.color;
						end
						pcall(ColorPicker.callback, Color3.fromRGB(math.floor(tonumber(R)), math.floor(tonumber(G)), math.floor(tonumber(B))));
					end

					function ColorPicker:Get()
						return ColorPicker.color;
					end

					ColorPicker.TextR.FocusLost:Connect(function()
						if ColorPicker.TextR.Text == "" then
							ColorPicker.TextR.Text = 0
						end
						if tonumber(ColorPicker.TextR.Text) and tonumber(ColorPicker.TextR.Text) > 256  then
							ColorPicker.TextR.Text = 255;
						end
						ColorPicker:Set(tonumber(ColorPicker.TextR.Text), tonumber(ColorPicker.TextG.Text), tonumber(ColorPicker.TextB.Text));
					end)
					
					ColorPicker.TextG.FocusLost:Connect(function()
						if ColorPicker.TextG.Text == "" then
							ColorPicker.TextG.Text = 0
						end
						if tonumber(ColorPicker.TextG.Text) and tonumber(ColorPicker.TextG.Text) > 256  then
							ColorPicker.TextG.Text = 255;
						end
						ColorPicker:Set(tonumber(ColorPicker.TextR.Text), tonumber(ColorPicker.TextG.Text), tonumber(ColorPicker.TextB.Text));
					end)
					
					ColorPicker.TextB.FocusLost:Connect(function()
						if ColorPicker.TextB.Text == "" then
							ColorPicker.TextB.Text = 0
						end
						if tonumber(ColorPicker.TextB.Text) and tonumber(ColorPicker.TextB.Text) > 256  then
							ColorPicker.TextB.Text = 255;
						end
						ColorPicker:Set(tonumber(ColorPicker.TextR.Text), tonumber(ColorPicker.TextG.Text), tonumber(ColorPicker.TextB.Text));
					end)
					
					
					Sector:FixSize();
					table.insert(library.items, ColorPicker);
					return ColorPicker;
				end
				
				function Sector:CreateKeyBind(Text, Default, CallBack,  Flag)
					local keybind = { };
					keybind.text = Text or "";
					keybind.default = Default or "None";
					keybind.value = keybind.default;
					keybind.callback = CallBack or function() end;
					keybind.flag = Flag or Text or "";
					
					local shorter_keycodes = {
						["LeftShift"] = "LSHIFT",
						["RightShift"] = "RSHIFT",
						["LeftControl"] = "LCTRL",
						["RightControl"] = "RCTRL",
						["LeftAlt"] = "LALT",
						["RightAlt"] = "RALT"
					}
					
					local text = keybind.default == "None" and "None" or (shorter_keycodes[keybind.default.Name] or keybind.default.Name)
					
					keybind.MainBack = Instance.new("TextButton", Sector.Items);
					keybind.MainBack.BackgroundColor3 = library.theme.BackGround;
					keybind.MainBack.AutoButtonColor = false;
					keybind.MainBack.Size = UDim2.fromOffset(240, 35);
					keybind.MainBack.Text = "";
					
					keybind.UICorner = Instance.new("UICorner", keybind.MainBack);
					keybind.UICorner.CornerRadius = UDim.new(0,8);
					
					keybind.TextLabel = Instance.new("TextLabel", keybind.MainBack);
					keybind.TextLabel.Text = keybind.text;
					keybind.TextLabel.BackgroundTransparency = 1;
					keybind.TextLabel.TextColor3 = library.theme.TextColor;
					keybind.TextLabel.TextSize = library.theme.TextSize;
					keybind.TextLabel.Font = library.theme.Font;
					keybind.TextLabel.Size = UDim2.fromOffset(125, 35);
					keybind.TextLabel.Position = UDim2.fromScale(0.046, 0);
					keybind.TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
					
					keybind.Main = Instance.new("TextButton", keybind.MainBack);
					keybind.Main.BorderSizePixel = 0;
					keybind.Main.BackgroundColor3 = library.theme.Toggle;
					keybind.Main.Size = UDim2.fromOffset(109, 18);
					keybind.Main.Position = UDim2.fromScale(0.496, 0.229);
					keybind.Main.Text = text;
					keybind.Main.Font = library.theme.Font;
					keybind.Main.TextColor3 = library.theme.TextColor;
					keybind.Main.TextSize = library.theme.TextSize;
					keybind.Main.TextXAlignment = Enum.TextXAlignment.Center;
					keybind.Main.MouseButton1Down:Connect(function()
						keybind.Main.Text = "...";
					end)

					if keybind.flag and keybind.flag ~= "" then
						library.flags[keybind.flag] = keybind.default;
					end
					
					function keybind:Set(key)
						if key == "None" then
							keybind.Main.Text = key ;
							keybind.value = key;
							if keybind.flag and keybind.flag ~= "" then
								library.flags[keybind.flag] = key;
							end
						end
						keybind.Main.Text = (shorter_keycodes[key.Name] or key.Name);
						keybind.value = key;
						if keybind.flag and keybind.flag ~= "" then
							library.flags[keybind.flag] = keybind.value;
						end
					end

					function keybind:Get()
						return keybind.value;
					end

					game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
						if not gameProcessed then
							if keybind.Main.Text == "..." then
								if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode ~= Enum.KeyCode.Backspace then
									keybind:Set(input.KeyCode);
									pcall(keybind.callback, keybind.value);
								else
									keybind:Set("None");
								end
							end
						end
					end)
					
					Sector:FixSize();
					table.insert(library.items, keybind);
					return keybind;
				end
				
				function Sector:CreateCoppyText(Text)
					local CoppyText = { };
					
					CoppyText.MainBack = Instance.new("TextButton", Sector.Items);
					CoppyText.MainBack.BackgroundColor3 = library.theme.BackGround;
					CoppyText.MainBack.AutoButtonColor = false;
					CoppyText.MainBack.Size = UDim2.fromOffset(240, 35);
					CoppyText.MainBack.Text = "";

					CoppyText.UICorner = Instance.new("UICorner", CoppyText.MainBack);
					CoppyText.UICorner.CornerRadius = UDim.new(0,8);

					CoppyText.TextLabel = Instance.new("TextBox", CoppyText.MainBack);
					CoppyText.TextLabel.Text = Text;
					CoppyText.TextLabel.ClearTextOnFocus = false;
					CoppyText.TextLabel.Interactable = true;
					CoppyText.TextLabel.TextEditable = false;
					CoppyText.TextLabel.Active = false;
					CoppyText.TextLabel.BackgroundTransparency = 1;
					CoppyText.TextLabel.TextColor3 = library.theme.TextColor;
					CoppyText.TextLabel.TextSize = library.theme.TextSize;
					CoppyText.TextLabel.Font = library.theme.Font;
					CoppyText.TextLabel.Size = UDim2.fromOffset(240, 35);
					CoppyText.TextLabel.Position = UDim2.fromScale(0, 0);
					CoppyText.TextLabel.TextXAlignment = Enum.TextXAlignment.Center;
					
					Sector:FixSize();
					return CoppyText;
				end
				
				function Sector:CreateLable(Text)
					local Lable = { };
					
					Lable.MainBack = Instance.new("TextButton", Sector.Items);
					Lable.MainBack.BackgroundColor3 = library.theme.BackGround;
					Lable.MainBack.AutoButtonColor = false;
					Lable.MainBack.Size = UDim2.fromOffset(240, 35);
					Lable.MainBack.Text = "";

					Lable.UICorner = Instance.new("UICorner", Lable.MainBack);
					Lable.UICorner.CornerRadius = UDim.new(0,8);

					Lable.TextLabel = Instance.new("TextLabel", Lable.MainBack);
					Lable.TextLabel.Text = Text;
					Lable.TextLabel.BackgroundTransparency = 1;
					Lable.TextLabel.TextColor3 = library.theme.TextColor;
					Lable.TextLabel.TextSize = library.theme.TextSize;
					Lable.TextLabel.Font = library.theme.Font;
					Lable.TextLabel.Size = UDim2.fromOffset(240, 35);
					Lable.TextLabel.Position = UDim2.fromScale(0, 0);
					Lable.TextLabel.TextXAlignment = Enum.TextXAlignment.Center;
					
					Sector:FixSize();
					return Lable;
				end
				
				return Sector;
			end
			
			function tab:CreateConfig(Side) -- Maybe in V2.1 or V2.2
				local ConfigSection = { };
				
				
				return ConfigSection;
			end
			
			table.insert(window.Tabs, tab)
			return tab;
		end

		return window;
	end

	return library;
end

local DeleteMobLib = library();

local Window = DeleteMobLib:CreateWindow(HyperEscape.GUI.GUIToggleKey);
local UIToggle = Window:CreateToggleButton()

local AimBotTab = Window:CreateTab("Aim Bot");
local MainSector = AimBotTab:CreateSector("Main", "Left");
MainSector:CreateToggle("Enable", false, function(AE) HyperEscape.AimBot.Enabled = AE; end);
MainSector:CreateToggle("Team Check", false, function(ATC) HyperEscape.AimBot.TeamCheck = ATC; end);
MainSector:CreateToggle("Wall Check", false, function(AWC) HyperEscape.AimBot.WallCheck = AWC ;end);
MainSector:CreateDropDown("Hit Scan", {"Head", "HumanoidRootPart"}, "Head", false, function(AHS) HyperEscape.AimBot.AimPart = AHS; end);

local FovSecor = AimBotTab:CreateSector("FOV Cirlce", "Left");
FovSecor:CreateToggle("Show Fov", false, function(AFE) HyperEscape.AimBot.ShowFov = AFE; end);
FovSecor:CreateSlider("Cirlce Radius", 0, 360, 1500, 1, function(FCR) HyperEscape.AimBot.Fov = FCR; end);

local OtherSector = AimBotTab:CreateSector("Other", "Right");
OtherSector:CreateToggle("Prediction", false, function(APE) HyperEscape.AimBot.Prediction = APE; end);
OtherSector:CreateToggle("Sticky Aim", false, function(ASAE) HyperEscape.AimBot.StickyAim = ASAE; end);
OtherSector:CreateSlider("Smoothing", 2, 10, 50, 1, function(AS) HyperEscape.AimBot.Smoothing = AS / 100; end);
OtherSector:CreateKeyBind("Key Bind", Enum.KeyCode.E, function(AK) HyperEscape.AimBot.Keybind = AK; end);
OtherSector:CreateToggle("Use Mouse", true, function(AUM) HyperEscape.AimBot.UseMouse = AUM; end);
OtherSector:CreateDropDown("Mouse Bind", {"MouseButton1", "MouseButton2"}, "MouseButton2", false, function(AMB) HyperEscape.AimBot.MouseBind = AMB; end);

local ESPTab = Window:CreateTab("ESP");
local EnableSector = ESPTab:CreateSector("ESP", "Left");
EnableSector:CreateToggle("Team Check", false, function(ETC) HyperEscape.esp.Box.TeamCheck = ETC; HyperEscape.esp.Tracer.TeamCheck = ETC; HyperEscape.esp.Hilights.TeamCheck = ETC end);
EnableSector:CreateToggle("Box", false, function(EB) HyperEscape.esp.Box.Box = EB; end);
EnableSector:CreateToggle("Tracer", false, function(ET) HyperEscape.esp.Tracer.Tracer = ET; end);
EnableSector:CreateToggle("Health", false, function(EH) HyperEscape.esp.Box.Health = EH; end);
EnableSector:CreateToggle("Name", false, function(EN) HyperEscape.esp.Box.Name = EN; end);
EnableSector:CreateToggle("Distance", false, function(ED) HyperEscape.esp.Box.Distance = ED; end);
EnableSector:CreateToggle("Health Bar", false, function(EHB) HyperEscape.esp.Box.HealthBar = EHB; end);
EnableSector:CreateToggle("Hilights", false, function(EHi) HyperEscape.esp.Hilights.Hilights = EHi; end);
EnableSector:CreateToggle("Show Hilight Through Walls", false, function(ESHTW) HyperEscape.esp.Hilights.AllWaysVisible = ESHTW; end);

local ESPSettingsSecor = ESPTab:CreateSector("Settings", "Right");
ESPSettingsSecor:CreateToggle("Outlines", true, function(ESO) HyperEscape.esp.Box.Outline = ESO; HyperEscape.esp.Tracer.Outline = ESO; end);
ESPSettingsSecor:CreateColorPicker("Outline Color", Color3.fromRGB(0, 0, 0), function(EOC) HyperEscape.esp.Box.OutlineColor = EOC; HyperEscape.esp.Tracer.OutlineColor = EOC; end);
ESPSettingsSecor:CreateColorPicker("ESP Color", Color3.fromRGB(255, 255, 255), function(EEC) HyperEscape.esp.Box.Color = EEC; HyperEscape.esp.Tracer.Color = EEC; end);
ESPSettingsSecor:CreateColorPicker("Hilight Outline", Color3.fromRGB(255, 0, 0), function(EOCC) HyperEscape.esp.Hilights.OutlineColor = EOCC; end);
ESPSettingsSecor:CreateColorPicker("Hilight Fill", Color3.fromRGB(100, 0, 255), function(EFCC) HyperEscape.esp.Hilights.FillColor = EFCC; end);
ESPSettingsSecor:CreateSlider("Hilight Outline", 0, 50, 100, 1, function(EHOT) HyperEscape.esp.Hilights.OutlineTransparency = EHOT / 100; end);
ESPSettingsSecor:CreateSlider("Hilight Fill", 0, 0, 100, 1, function(EHFT) HyperEscape.esp.Hilights.FillTransparency = EHFT / 100; end);

local SettingsTab = Window:CreateTab("Settings");
local SettingsInfoSector = SettingsTab:CreateSector("Info", "Left");
SettingsInfoSector:CreateCoppyText("Made By m1ckgordon");
SettingsInfoSector:CreateCoppyText("https://discord.gg/jNRKdtH3 - Click Me");

local SettingsSettings = SettingsTab:CreateSector("GUI Settigns", "Right");
SettingsSettings:CreateToggle("UI Toggle Button", true, function(GUITB) HyperEscape.GUI.GUIButton = GUITB; UIToggle:Update(GUITB); end);
SettingsSettings:CreateKeyBind("UI Key Bind", Enum.KeyCode.RightShift, function(SUITK) HyperEscape.GUI.GUIToggleKey = SUITK; Window:UpdateKeyBind(SUITK); end);


local ESPHolder = Instance.new("Folder", (CoreGui or localPlayer.PlayerGui)); 
local Fov = Instance.new("ScreenGui",(CoreGui or localPlayer.PlayerGui))Fov.Name = "Fov" Fov.ZIndexBehavior = Enum.ZIndexBehavior.Sibling Fov.ResetOnSpawn = false; -- Yapee
local FOVFFrame = Instance.new("Frame")FOVFFrame.Parent = Fov FOVFFrame.Name = "FOVFFrame" FOVFFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) FOVFFrame.BorderColor3 = Color3.fromRGB(0, 0, 0) FOVFFrame.BorderSizePixel = 0 FOVFFrame.BackgroundTransparency = 1 FOVFFrame.AnchorPoint = Vector2.new(0.5, 0.5) FOVFFrame.Position = UDim2.new(0.5, 0,0.5, 0) FOVFFrame.Size = UDim2.new(0, HyperEscape.AimBot.Fov, 0, HyperEscape.AimBot.Fov) FOVFFrame.BackgroundTransparency = 1;
local UICorner = Instance.new("UICorner")UICorner.CornerRadius = UDim.new(1, 0) UICorner.Parent = FOVFFrame;
local UIStroke = Instance.new("UIStroke")UIStroke.Color = Color3.fromRGB(100,0,100) UIStroke.Parent = FOVFFrame UIStroke.Thickness = 1 UIStroke.ApplyStrokeMode = "Border"; game:GetService("StarterGui"):SetCore("SendNotification", {Title = "https://discord.gg/FsApQ7YNTq", Text = "The Discord For More!"});
local IsArsenal = false;

if game.PlaceId == 286090429 then
	IsArsenal = true;
end

local function IsAlive(Player)
	if Player and Player.Character and Player.Character:FindFirstChild("Humanoid") ~= nil and (IsArsenal and players[Player.Character.Name].NRPBS["Health"].Value > 0 or Player.Character.Humanoid.Health > 0) then
		return true
	end
	return false
end

local function GetTeam(Player)
	if not game.Players.LocalPlayer.Neutral then
		return game.Teams[Player.Team.Name];
	end
	return true;
end

function isVisible(p, ...)

	if not (HyperEscape.AimBot.WallCheck == true) then
		return true;
	end

	return #CurrentCamera:GetPartsObscuringTarget({ p }, { CurrentCamera, localPlayer.Character, ... }) == 0;
end

function CameraGetClosestToMouse()
	local AimFov = HyperEscape.AimBot.Fov;
	local targetPos = nil;

	for i,v in pairs (game:GetService("Players"):GetPlayers()) do
		if v ~= localPlayer then
			if HyperEscape.AimBot.TeamCheck ~= true or GetTeam(v) ~= GetTeam(localPlayer) then 
				if IsAlive(v) then
					local screen_pos, on_screen = CurrentCamera:WorldToViewportPoint(v.Character[HyperEscape.AimBot.AimPart].Position)
					local screen_pos_2D = Vector2.new(screen_pos.X, screen_pos.Y)
					local new_magnitude = (screen_pos_2D - mouseLocation(UIS)).Magnitude
					if on_screen and new_magnitude < AimFov and isVisible(v.Character[HyperEscape.AimBot.AimPart].Position, v.Character.Head.Parent) then
						AimFov = new_magnitude;
						targetPos = v;
					end
				end
			end
		end
	end
	return targetPos;
end

local function LoadESP(Player) -- I Thought It Would Be Harder To Make, Idk Why
	local PlayerESP = Instance.new("Folder", ESPHolder);
	PlayerESP.Name = Player.Name .. "ESP";
	-- Box
	local BoxHolder = Instance.new("ScreenGui", PlayerESP);
	BoxHolder.Name = "Box";
	BoxHolder.DisplayOrder = 2;

	local TracerHolder = Instance.new("ScreenGui", PlayerESP);
	TracerHolder.Name = "Tracer";

	local HilightHolder = Instance.new("Folder", PlayerESP);
	HilightHolder.Name = "Hilight"

	local LeftOutline = Instance.new("Frame", BoxHolder);
	LeftOutline.BackgroundColor3 = HyperEscape.esp.Box.OutlineColor;
	LeftOutline.Visible = false;
	LeftOutline.BorderSizePixel = 1;

	local RightOutline = Instance.new("Frame", BoxHolder);
	RightOutline.BackgroundColor3 = HyperEscape.esp.Box.OutlineColor;
	RightOutline.Visible = false;
	RightOutline.BorderSizePixel = 1;

	local TopOutline = Instance.new("Frame", BoxHolder);
	TopOutline.BackgroundColor3 = HyperEscape.esp.Box.OutlineColor;
	TopOutline.Visible = false;
	TopOutline.BorderSizePixel = 1;

	local BottomOutline = Instance.new("Frame", BoxHolder);
	BottomOutline.BackgroundColor3 = HyperEscape.esp.Box.OutlineColor;
	BottomOutline.Visible = false;
	BottomOutline.BorderSizePixel = 1;

	local Left = Instance.new("Frame", BoxHolder);
	Left.BackgroundColor3 = HyperEscape.esp.Box.Color;
	Left.Visible = false;
	Left.BorderSizePixel = 0;

	local Right = Instance.new("Frame", BoxHolder);
	Right.BackgroundColor3 = HyperEscape.esp.Box.Color;
	Right.Visible = false;
	Right.BorderSizePixel = 0;

	local Top = Instance.new("Frame", BoxHolder);
	Top.BackgroundColor3 = HyperEscape.esp.Box.Color;
	Top.Visible = false;
	Top.BorderSizePixel = 0;

	local Bottom = Instance.new("Frame", BoxHolder);
	Bottom.BackgroundColor3 = HyperEscape.esp.Box.Color;
	Bottom.Visible = false;
	Bottom.BorderSizePixel = 0;

	local Name = Instance.new("TextLabel", BoxHolder);
	Name.BackgroundTransparency = 1;
	Name.Text = Player.Name;
	Name.Visible = false;
	Name.AnchorPoint = Vector2.new(0.5, 0.5);
	Name.TextSize = 12;
	Name.Font = 2;
	Name.TextColor3 = Color3.fromRGB(255, 255, 255);
	Name.TextStrokeTransparency = 0;

	local Distance = Instance.new("TextLabel", BoxHolder);
	Distance.BackgroundTransparency = 1;
	if IsAlive(Player) then
		Distance.Text = math.floor(0.5+(CurrentCamera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude);
	end
	Distance.Visible = false;
	Distance.AnchorPoint = Vector2.new(0.5, 0.5);
	Distance.TextSize = 12;
	Distance.Font = 2;
	Distance.TextColor3 = Color3.fromRGB(255, 255, 255);
	Distance.TextStrokeTransparency = 0;

	local HealthBackground = Instance.new("Frame", BoxHolder);
	HealthBackground.Visible = false;
	HealthBackground.BorderSizePixel = 1;
	HealthBackground.BorderColor3 = HyperEscape.esp.Box.OutlineColor;

	local HealthBar = Instance.new("Frame", BoxHolder);
	HealthBar.Visible = false;
	HealthBar.BorderSizePixel = 0;
	HealthBar.BackgroundColor3 = Color3.fromRGB(0, 255 ,0); 

	local Health = Instance.new("TextLabel", BoxHolder);
	Health.BackgroundTransparency = 1;
	if IsAlive(Player) then
		Health.Text = (IsArsenal and players[Player.Character.Name].NRPBS["Health"].Value or Player.Character.Humanoid.Health);
	end
	Health.Visible = false;
	Health.AnchorPoint = Vector2.new(0.5, 0.5);
	Health.TextSize = 12;
	Health.Font = 2;
	Health.TextColor3 = Color3.fromRGB(255, 255, 255);
	Health.TextStrokeTransparency = 0;

	-- Tracer 

	local TracerOutline = Instance.new("Frame", TracerHolder);
	TracerOutline.BackgroundColor3 = HyperEscape.esp.Tracer.OutlineColor;
	TracerOutline.Visible = false;
	TracerOutline.BorderSizePixel = 1;
	TracerOutline.AnchorPoint = Vector2.new(0.5, 0.5);

	local Tracer = Instance.new("Frame", TracerHolder);
	Tracer.BackgroundColor3 = HyperEscape.esp.Tracer.Color;
	Tracer.Visible = false;
	Tracer.BorderSizePixel = 0;
	Tracer.AnchorPoint = Vector2.new(0.5, 0.5);

	-- Hilight

	local Hilight = Instance.new("Highlight", HilightHolder); -- Don't Work On Arsenal. Needs Fix Nigga.
	Hilight.Enabled = false;

	local co = coroutine.create(function()
		game:GetService("RunService").Heartbeat:Connect(function()
			if IsAlive(Player) then
				local screen, onScreen = CurrentCamera:WorldToScreenPoint(Player.Character.HumanoidRootPart.Position); 
				local frustumHeight = math.tan(math.rad(CurrentCamera.FieldOfView * 0.5)) * 2 * screen.Z ; -- Thank you mickeydev, Join .gg/lunarity for the best paid script hub for fps games made by known and trusted developers. 
				local size = CurrentCamera.ViewportSize.Y / frustumHeight * HyperEscape.esp.CharacterSize;
				local position = Vector2.new(screen.X, screen.Y) - (size / 2 - Vector2.new(0, size.Y) / 20);

				if onScreen then	
					-- Box

					if HyperEscape.esp.Box.TeamCheck ~= true or GetTeam(Player) ~= GetTeam(localPlayer) then

						local health = (IsArsenal and players[Player.Character.Name].NRPBS["Health"].Value or Player.Character.Humanoid.Health);
						local healthScale = (IsArsenal and health / players[Player.Character.Name].NRPBS["MaxHealth"].Value or health / Player.Character.Humanoid.MaxHealth);
						local healthSizeY = size.Y * healthScale;

						LeftOutline.Visible = HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;
						RightOutline.Visible =  HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;
						TopOutline.Visible =  HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;
						BottomOutline.Visible =  HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;
						HealthBackground.Visible = HyperEscape.esp.Box.HealthBar;

						Left.Visible = HyperEscape.esp.Box.Box;
						Right.Visible =  HyperEscape.esp.Box.Box;
						Top.Visible =  HyperEscape.esp.Box.Box;
						Bottom.Visible =  HyperEscape.esp.Box.Box;
						HealthBar.Visible = HyperEscape.esp.Box.HealthBar;
						Name.Visible = HyperEscape.esp.Box.Name;
						Distance.Visible = HyperEscape.esp.Box.Distance and not HyperEscape.esp.Box.Name;
						Health.Visible = HyperEscape.esp.Box.Health;

						Left.Size = UDim2.fromOffset(size.X, 1);
						Right.Size = UDim2.fromOffset(size.X, 1);
						Top.Size = UDim2.fromOffset(1, size.Y);
						Bottom.Size = UDim2.fromOffset(1, size.Y);

						LeftOutline.Size = Left.Size;
						RightOutline.Size = Right.Size;
						TopOutline.Size = Top.Size;
						BottomOutline.Size = Bottom.Size;
						HealthBackground.Size = UDim2.fromOffset(4, size.Y);
						HealthBar.Size = UDim2.fromOffset(2, -healthSizeY)

						Left.Position = UDim2.fromOffset(position.X, position.Y);
						Right.Position = UDim2.fromOffset(position.X, position.Y + size.Y - 1);
						Top.Position = UDim2.fromOffset(position.X, position.Y);
						Bottom.Position = UDim2.fromOffset(position.X + size.X - 1, position.Y);
						Name.Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + Name.TextBounds.Y + 14) / 2);
						Distance.Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + Name.TextBounds.Y + 19) / 2);
						HealthBackground.Position = UDim2.fromOffset(position.X - 8, position.Y); 
						HealthBar.Position = UDim2.fromOffset(position.x - 7, position.y + size.Y)
						Health.Position = (HyperEscape.esp.Box.HealthBar and UDim2.fromOffset(position.X - 25, position.y + size.Y + -healthSizeY) or UDim2.fromOffset(position.X - 25, position.Y + size.Y));

						LeftOutline.Position = Left.Position;
						RightOutline.Position =  Right.Position;
						TopOutline.Position =  Top.Position;
						BottomOutline.Position =  Bottom.Position;

						LeftOutline.BorderColor3 = HyperEscape.esp.Box.OutlineColor;
						RightOutline.BorderColor3 =  HyperEscape.esp.Box.OutlineColor;
						TopOutline.BorderColor3 =  HyperEscape.esp.Box.OutlineColor;
						BottomOutline.BorderColor3 =  HyperEscape.esp.Box.OutlineColor;
						HealthBackground.BackgroundColor3 = HyperEscape.esp.Box.OutlineColor;
						HealthBackground.BorderColor3 = HyperEscape.esp.Box.OutlineColor;

						Left.BackgroundColor3 = HyperEscape.esp.Box.Color;
						Right.BackgroundColor3 = HyperEscape.esp.Box.Color;
						Top.BackgroundColor3 = HyperEscape.esp.Box.Color;
						Bottom.BackgroundColor3 = HyperEscape.esp.Box.Color;
						LeftOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
						RightOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
						TopOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
						BottomOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
						
						Distance.Text = math.floor(0.5+(CurrentCamera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude);
						Name.Text = (HyperEscape.esp.Box.Name and HyperEscape.esp.Box.Distance and Player.Name .. " (" .. math.floor(0.5+(CurrentCamera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude) .. ")" or Player.Name);
						Health.Text = (IsArsenal and math.floor(players[Player.Character.Name].NRPBS["Health"].Value) or math.floor(Player.Character.Humanoid.Health));
					else
						LeftOutline.Visible = false;
						RightOutline.Visible =  false;
						TopOutline.Visible =  false;
						BottomOutline.Visible =  false;
						Left.Visible = false;
						Right.Visible =  false;
						Top.Visible =  false;
						Bottom.Visible =  false;
						Name.Visible = false;
						Distance.Visible = false;
						HealthBackground.Visible = false;
						HealthBar.Visible = false;
						Health.Visible = false;
					end

					-- Tracer

					if HyperEscape.esp.Tracer.TeamCheck ~= true or GetTeam(Player) ~= GetTeam(localPlayer) then

						local ScreenVec2 = Vector2.new(screen.X, screen.Y + size.Y / 2 + size.Y / 20);
						local Origin = Vector2.new(CurrentCamera.ViewportSize.X/2, CurrentCamera.ViewportSize.Y - 1);
						local TracerPosition = (Origin + ScreenVec2) / 2;

						TracerOutline.Visible = HyperEscape.esp.Tracer.Outline and HyperEscape.esp.Tracer.Tracer;
						Tracer.Visible = HyperEscape.esp.Tracer.Tracer;

						Tracer.Rotation = math.deg(math.atan2(ScreenVec2.Y - Origin.Y, ScreenVec2.X - Origin.X));
						Tracer.Position = UDim2.new(0, TracerPosition.X, 0, TracerPosition.Y);
						Tracer.Size = UDim2.fromOffset((Origin - ScreenVec2).Magnitude, 1);

						TracerOutline.Rotation = Tracer.Rotation;
						TracerOutline.Position = Tracer.Position;
						TracerOutline.Size = Tracer.Size;

						TracerOutline.BorderColor3 = HyperEscape.esp.Tracer.OutlineColor;
						Tracer.BackgroundColor3 = HyperEscape.esp.Tracer.Color;
					else
						TracerOutline.Visible = false;
						Tracer.Visible = false;
					end

					-- Hilight 

					if HyperEscape.esp.Hilights.TeamCheck ~= true or GetTeam(Player) ~= GetTeam(localPlayer) then

						Hilight.Enabled = HyperEscape.esp.Hilights.Hilights;
						Hilight.Adornee = Player.Character;

						Hilight.OutlineColor = HyperEscape.esp.Hilights.OutlineColor;
						Hilight.FillColor = HyperEscape.esp.Hilights.FillColor;

						Hilight.FillTransparency = HyperEscape.esp.Hilights.FillTransparency;
						Hilight.OutlineTransparency = HyperEscape.esp.Hilights.OutlineTransparency;

						Hilight.DepthMode = (HyperEscape.esp.Hilights.AllWaysVisible and "AlwaysOnTop" or not HyperEscape.esp.Hilights.AllWaysVisible and "Occluded");
					else
						Hilight.Enabled = false;
						Hilight.Adornee = nil;
					end

				else
					LeftOutline.Visible = false;
					RightOutline.Visible =  false;
					TopOutline.Visible =  false;
					BottomOutline.Visible =  false;
					Left.Visible = false;
					Right.Visible =  false;
					Top.Visible =  false;
					Bottom.Visible =  false;
					TracerOutline.Visible = false;
					Tracer.Visible = false;
					Name.Visible = false;
					Distance.Visible = false;
					HealthBackground.Visible = false;
					HealthBar.Visible = false;
					Health.Visible = false;	
				end

			else
				LeftOutline.Visible = false;
				RightOutline.Visible =  false;
				TopOutline.Visible =  false;
				BottomOutline.Visible =  false;
				Left.Visible = false;
				Right.Visible =  false;
				Top.Visible =  false;
				Bottom.Visible =  false;
				TracerOutline.Visible = false;
				Tracer.Visible = false;
				Name.Visible = false;
				Distance.Visible = false;
				HealthBackground.Visible = false;
				HealthBar.Visible = false;
				Health.Visible = false;
				Hilight.Adornee = nil;
			end
		end)
		if not players:FindFirstChild(Player.Name) then
			PlayerESP:Destroy()
			coroutine.yield()
		end
	end)
	coroutine.resume(co)
end


for i,plr in pairs(players:GetChildren()) do
	if plr ~= localPlayer then
		LoadESP(plr);
	end
end

players.PlayerAdded:Connect(function(plr)
	if plr ~= localPlayer then
		LoadESP(plr);
	end
end)


	

UIS.InputBegan:Connect(function(Key)
	if Key.KeyCode == HyperEscape.AimBot.Keybind and not HyperEscape.AimBot.UseMouse then
		HyperEscape.AimBot.Target = CameraGetClosestToMouse();
		HyperEscape.AimBot.IsAimKeyDown = true;
	end
end)
UIS.InputEnded:Connect(function(Key)
	if Key.KeyCode == HyperEscape.AimBot.Keybind and not HyperEscape.AimBot.UseMouse then
		HyperEscape.AimBot.Target = CameraGetClosestToMouse();
		HyperEscape.AimBot.IsAimKeyDown = false;
		if HyperEscape.AimBot.CameraTween ~= nil then
			HyperEscape.AimBot.CameraTween:Cancel();
		end
	end
end)

localPlayer:GetMouse().Button1Down:Connect(function(Key)
	if HyperEscape.AimBot.MouseBind == "MouseButton1" and HyperEscape.AimBot.UseMouse then
		if HyperEscape.AimBot.IsAimKeyDown then
			HyperEscape.AimBot.Target = CameraGetClosestToMouse();
			HyperEscape.AimBot.IsAimKeyDown = false;
			if HyperEscape.AimBot.CameraTween ~= nil then
				HyperEscape.AimBot.CameraTween:Cancel();
			end
		else
			HyperEscape.AimBot.Target = CameraGetClosestToMouse();
			HyperEscape.AimBot.IsAimKeyDown = true;
		end
	end
end)
localPlayer:GetMouse().Button1Up:Connect(function(Key)
	if HyperEscape.AimBot.MouseBind == "MouseButton1" and HyperEscape.AimBot.UseMouse then
		HyperEscape.AimBot.Target = CameraGetClosestToMouse();
		HyperEscape.AimBot.IsAimKeyDown = false;
		if HyperEscape.AimBot.CameraTween ~= nil then
			HyperEscape.AimBot.CameraTween:Cancel();
		end
	end
end)

localPlayer:GetMouse().Button2Down:Connect(function(Key)
	if HyperEscape.AimBot.MouseBind == "MouseButton2" and HyperEscape.AimBot.UseMouse then
		HyperEscape.AimBot.Target = CameraGetClosestToMouse();
		HyperEscape.AimBot.IsAimKeyDown = true;
	end
end)
localPlayer:GetMouse().Button2Up:Connect(function(Key)
	if HyperEscape.AimBot.MouseBind == "MouseButton2" and HyperEscape.AimBot.UseMouse then
		HyperEscape.AimBot.Target = CameraGetClosestToMouse();
		HyperEscape.AimBot.IsAimKeyDown = false;
		if HyperEscape.AimBot.CameraTween ~= nil then
			HyperEscape.AimBot.CameraTween:Cancel();
		end
	end
end)

game:GetService("RunService").RenderStepped:Connect(function() 

	if HyperEscape.AimBot.Enabled and HyperEscape.AimBot.ShowFov then
		UIStroke.Enabled = true;
		UIStroke.Color = HyperEscape.AimBot.FovColor;

		local posd = UIS:GetMouseLocation();
		FOVFFrame.Position = UDim2.new(0, posd.X, 0, posd.Y - 36);
		FOVFFrame.Size = UDim2.fromOffset(HyperEscape.AimBot.Fov, HyperEscape.AimBot.Fov);
	else
		UIStroke.Enabled = false;
	end

	if HyperEscape.AimBot.Enabled then -- I Am Pretty Happy With This Legit Bot. Best One I Have Made So Far.
		if HyperEscape.AimBot.IsAimKeyDown then
			if HyperEscape.AimBot.StickyAim then
				if HyperEscape.AimBot.Target ~= nil then
					HyperEscape.AimBot.CameraTween = TweenService:Create(CurrentCamera, TweenInfo.new(HyperEscape.AimBot.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(CurrentCamera.CFrame.Position, HyperEscape.AimBot.Target.Character[HyperEscape.AimBot.AimPart].Position + (HyperEscape.AimBot.Prediction and HyperEscape.AimBot.Target.Character[HyperEscape.AimBot.AimPart].Velocity * (localPlayer:GetNetworkPing() * 1.15) or Vector3.new()))})
					HyperEscape.AimBot.CameraTween:Play()
				end
			else
				local target = CameraGetClosestToMouse()
				if target ~= nil then
					HyperEscape.AimBot.CameraTween = TweenService:Create(CurrentCamera, TweenInfo.new(HyperEscape.AimBot.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(CurrentCamera.CFrame.Position,  target.Character[HyperEscape.AimBot.AimPart].Position + (HyperEscape.AimBot.Prediction and target.Character[HyperEscape.AimBot.AimPart].Velocity * (localPlayer:GetNetworkPing() * 1.15) or Vector3.new()))})
					HyperEscape.AimBot.CameraTween:Play();

				elseif HyperEscape.AimBot.CameraTween ~= nil then
					HyperEscape.AimBot.CameraTween:Cancel(); -- There Was A Bug Where The Camera Would Do Wired Ass Shit And Be Delayed. If There Sill Is Wierd Bugs With The Camera Tell Me Please.
				end
			end
		end
	end
end)


