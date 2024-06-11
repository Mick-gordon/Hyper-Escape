if game.GameId == 113491250 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Mick-gordon/Hyper-Escape/main/HyperEscapePhantomForces.lua", true))()
else
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
			PredictionAmmount = 1;

			UseMouse = true;
			MouseBind = "MouseButton2";
			Keybind = Enum.KeyCode.E;  

			ShowFov = false;
			Fov = 360;

			Smoothing = 0.3;

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
			Enabled = false;
			TeamCheck = false;
			
			MaxDistance = 4000;
			
			CharacterSize = Vector2.new(5,6);
			
			Box = {
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
				TeamColor = false;

				Tracer = false;
				Color = Color3.fromRGB(255, 255, 255);

				Outline = false;
				OutlineColor = Color3.fromRGB(0, 0, 0);
			};

			Hilights = { -- TODO: Arsenal 

				Hilights = false;

				AllWaysVisible = false;			

				OutlineTransparency = 0.5;
				FillTransparency = 0.5;

				OutlineColor = Color3.fromRGB(255, 0, 0);
				FillColor = Color3.fromRGB(255, 255, 255);
			};
		};
	};

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
		local httpservice = game:GetService("HttpService");

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

		function library:CreateWindow(Keybind, Name)
			local window = { };
			window.keybind = Keybind or Enum.KeyCode.RightShift;
			window.name = Name or "DeleteMob";

			window.ScreenGui = Instance.new("ScreenGui");
			window.ScreenGui.Parent = (CoreGui or StarterGUI);
			window.ScreenGui.ResetOnSpawn = false;
			window.ScreenGui.DisplayOrder = 10;

			local dragging, dragInput, dragStart, startPos
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					local delta = input.Position - dragStart
					window.Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				end
			end)

			local dragstart = function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = window.Main.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end

			local dragend = function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end

			window.Main = Instance.new("TextButton", window.ScreenGui);
			window.Main.Size = UDim2.fromOffset(800, 450);
			window.Main.BackgroundColor3 = library.theme.BackGround;
			window.Main.BorderSizePixel = 1;
			window.Main.BorderColor3 = library.theme.Border;
			window.Main.Active = true;
			window.Main.AutoButtonColor = false;
			window.Main.Text = "";
			window.Main.InputBegan:Connect(dragstart)
			window.Main.InputChanged:Connect(dragend)

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
			window.Title.Text = window.name;
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
			window.OpenedColorPickers = { };
			
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

				tab.Window = Instance.new("ScrollingFrame", window.Main);
				tab.Window.Name = Name .. "Tab";
				tab.Window.BackgroundTransparency = 1;
				tab.Window.Visible = false;
				tab.Window.Size = UDim2.fromOffset(650, 450);
				tab.Window.Position = UDim2.fromOffset(150, 0);
				tab.Window.ScrollBarThickness = 0;

				tab.Left = Instance.new("Frame", tab.Window);
				tab.Left.Size = UDim2.fromOffset(100, 428);
				tab.Left.Position = UDim2.fromOffset(120, 18);
				tab.Left.BackgroundTransparency = 1;

				tab.UiListLayout = Instance.new("UIListLayout", tab.Left);
				tab.UiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
				tab.UiListLayout.Padding = UDim.new(0, 7);
				tab.UiListLayout.SortOrder = Enum.SortOrder.LayoutOrder;

				tab.Right = Instance.new("Frame", tab.Window);
				tab.Right.Size = UDim2.fromOffset(100, 428);
				tab.Right.Position = UDim2.fromOffset(430, 18);
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
						tab.Window.CanvasSize = (sizeleft > sizeright and UDim2.fromOffset(650, sizeleft + 100) or UDim2.fromOffset(650, sizeright + 100))
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

						DropDown.Arrow = Instance.new("TextLabel", DropDown.Main);
						DropDown.Arrow.Position = UDim2.fromScale(0.826,0);
						DropDown.Arrow.Size = UDim2.fromOffset(18, 18);
						DropDown.Arrow.BackgroundTransparency = 1;
						DropDown.Arrow.TextSize = library.theme.TextSize;
						DropDown.Arrow.TextColor3 = library.theme.TextColor;
						DropDown.Arrow.Font = library.theme.Font;
						DropDown.Arrow.Text = "<";
						DropDown.Arrow.Rotation = -90;

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
									DropDown.Arrow.Rotation = 90;
									DropDown.Itemsframe.ScrollingEnabled = true;
									DropDown.Itemsframe.Visible = true;
									DropDown.Itemsframe.Active = true;
									DropDown.IgnoreBackButtons.Visible = true;
									DropDown.IgnoreBackButtons.Active = true;
								end
							else
								DropDown.Arrow.Rotation = -90;
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

						ColorPicker.callback = CallBack or function() end;
						ColorPicker.default = Defult or Color3.fromRGB(255, 255, 255);
						ColorPicker.value = ColorPicker.default;
						ColorPicker.flag = Flag or (Text or "");

						ColorPicker.MainBack = Instance.new("TextButton", Sector.Items);
						ColorPicker.MainBack.BackgroundColor3 = library.theme.BackGround;
						ColorPicker.MainBack.AutoButtonColor = false;
						ColorPicker.MainBack.Size = UDim2.fromOffset(240, 35);
						ColorPicker.MainBack.Text = "";

						ColorPicker.UiCorner = Instance.new("UICorner", ColorPicker.MainBack);
						ColorPicker.UiCorner.CornerRadius = UDim.new(0, 8);
						
						ColorPicker.Indicator = Instance.new("Frame", ColorPicker.MainBack);
						ColorPicker.Indicator.Position = UDim2.fromScale(0.875, 0.229);
						ColorPicker.Indicator.Size = UDim2.fromOffset(18, 18);
						ColorPicker.Indicator.BackgroundColor3 = ColorPicker.default;
						ColorPicker.Indicator.BorderSizePixel = 0;

						ColorPicker.TextLabel = Instance.new("TextLabel", ColorPicker.MainBack);
						ColorPicker.TextLabel.Text = Text;
						ColorPicker.TextLabel.BackgroundTransparency = 1;
						ColorPicker.TextLabel.TextColor3 = library.theme.TextColor;
						ColorPicker.TextLabel.TextSize = library.theme.TextSize;
						ColorPicker.TextLabel.Font = library.theme.Font;
						ColorPicker.TextLabel.Size = UDim2.fromOffset(125, 35);
						ColorPicker.TextLabel.Position = UDim2.fromScale(0.046, 0);
						ColorPicker.TextLabel.TextXAlignment = Enum.TextXAlignment.Left;

						ColorPicker.MainPicker = Instance.new("TextButton", ColorPicker.MainBack);
						ColorPicker.MainPicker.Name = "picker";
						ColorPicker.MainPicker.ZIndex = 100;
						ColorPicker.MainPicker.Visible = false;
						ColorPicker.MainPicker.AutoButtonColor = false;
						ColorPicker.MainPicker.Text = "";
						ColorPicker.MainPicker.Size = UDim2.fromOffset(180, 196);
						ColorPicker.MainPicker.BorderSizePixel = 0;
						ColorPicker.MainPicker.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
						ColorPicker.MainPicker.Rotation = 0.000000000000001;
						ColorPicker.MainPicker.Position = UDim2.fromOffset(-ColorPicker.MainPicker.AbsoluteSize.X + ColorPicker.MainBack.AbsoluteSize.X, 17);
						window.OpenedColorPickers[ColorPicker.MainPicker] = false;
						
						ColorPicker.hue = Instance.new("ImageLabel", ColorPicker.MainPicker);
						ColorPicker.hue.ZIndex = 101;
						ColorPicker.hue.Position = UDim2.new(0,3,0,3);
						ColorPicker.hue.Size = UDim2.new(0,172,0,172);
						ColorPicker.hue.Image = "rbxassetid://4155801252";
						ColorPicker.hue.ScaleType = Enum.ScaleType.Stretch;
						ColorPicker.hue.BackgroundColor3 = Color3.new(1,0,0);
						ColorPicker.hue.BorderColor3 = library.theme.Border;
						
						ColorPicker.hueselectorpointer = Instance.new("ImageLabel", ColorPicker.MainPicker);
						ColorPicker.hueselectorpointer.ZIndex = 101;
						ColorPicker.hueselectorpointer.BackgroundTransparency = 1;
						ColorPicker.hueselectorpointer.BorderSizePixel = 0;
						ColorPicker.hueselectorpointer.Position = UDim2.new(0, 0, 0, 0);
						ColorPicker.hueselectorpointer.Size = UDim2.new(0, 7, 0, 7);
						ColorPicker.hueselectorpointer.Image = "rbxassetid://6885856475";
						
						ColorPicker.selector = Instance.new("TextLabel", ColorPicker.MainPicker);
						ColorPicker.selector.ZIndex = 100;
						ColorPicker.selector.Position = UDim2.new(0,3,0,181);
						ColorPicker.selector.Size = UDim2.new(0,173,0,10);
						ColorPicker.selector.BackgroundColor3 = Color3.fromRGB(255,255,255);
						ColorPicker.selector.BorderColor3 = library.theme.Border;
						ColorPicker.selector.Text = "";
						
						ColorPicker.gradient = Instance.new("UIGradient", ColorPicker.selector);
						ColorPicker.gradient.Color = ColorSequence.new({ 
							ColorSequenceKeypoint.new(0, Color3.new(1,0,0)), 
							ColorSequenceKeypoint.new(0.17, Color3.new(1,0,1)), 
							ColorSequenceKeypoint.new(0.33,Color3.new(0,0,1)), 
							ColorSequenceKeypoint.new(0.5,Color3.new(0,1,1)), 
							ColorSequenceKeypoint.new(0.67, Color3.new(0,1,0)), 
							ColorSequenceKeypoint.new(0.83, Color3.new(1,1,0)), 
							ColorSequenceKeypoint.new(1, Color3.new(1,0,0))
						})

						ColorPicker.pointer = Instance.new("Frame", ColorPicker.selector);
						ColorPicker.pointer.ZIndex = 101;
						ColorPicker.pointer.BackgroundColor3 = library.theme.Border;
						ColorPicker.pointer.Position = UDim2.new(0,0,0,0);
						ColorPicker.pointer.Size = UDim2.new(0,2,0,10);
						ColorPicker.pointer.BorderColor3 = library.theme.BackGround;

						if ColorPicker.flag and ColorPicker.flag ~= "" then
							library.flags[ColorPicker.flag] = ColorPicker.default;
						end

						function ColorPicker:RefreshHue()
							local x = (game.Players.LocalPlayer:GetMouse().X - ColorPicker.hue.AbsolutePosition.X) / ColorPicker.hue.AbsoluteSize.X;
							local y = (game.Players.LocalPlayer:GetMouse().Y - ColorPicker.hue.AbsolutePosition.Y) / ColorPicker.hue.AbsoluteSize.Y;
							ColorPicker.hueselectorpointer:TweenPosition(UDim2.new(math.clamp(x * ColorPicker.hue.AbsoluteSize.X, 0.5, 0.952 * ColorPicker.hue.AbsoluteSize.X) / ColorPicker.hue.AbsoluteSize.X, 0, math.clamp(y * ColorPicker.hue.AbsoluteSize.Y, 0.5, 0.885 * ColorPicker.hue.AbsoluteSize.Y) / ColorPicker.hue.AbsoluteSize.Y, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05);
							ColorPicker:Set(Color3.fromHSV(ColorPicker.color, math.clamp(x * ColorPicker.hue.AbsoluteSize.X, 0.5, 1 * ColorPicker.hue.AbsoluteSize.X) / ColorPicker.hue.AbsoluteSize.X, 1 - (math.clamp(y * ColorPicker.hue.AbsoluteSize.Y, 0.5, 1 * ColorPicker.hue.AbsoluteSize.Y) / ColorPicker.hue.AbsoluteSize.Y)));
						end

						function ColorPicker:RefreshSelector()
							local pos = math.clamp((game.Players.LocalPlayer:GetMouse().X - ColorPicker.hue.AbsolutePosition.X) / ColorPicker.hue.AbsoluteSize.X, 0, 1);
							ColorPicker.color = 1 - pos;
							ColorPicker.pointer:TweenPosition(UDim2.new(pos, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05);
							ColorPicker.hue.BackgroundColor3 = Color3.fromHSV(1 - pos, 1, 1);

							local x = (ColorPicker.hueselectorpointer.AbsolutePosition.X - ColorPicker.hue.AbsolutePosition.X) / ColorPicker.hue.AbsoluteSize.X;
							local y = (ColorPicker.hueselectorpointer.AbsolutePosition.Y - ColorPicker.hue.AbsolutePosition.Y) / ColorPicker.hue.AbsoluteSize.Y;
							ColorPicker:Set(Color3.fromHSV(ColorPicker.color, math.clamp(x * ColorPicker.hue.AbsoluteSize.X, 0.5, 1 * ColorPicker.hue.AbsoluteSize.X) / ColorPicker.hue.AbsoluteSize.X, 1 - (math.clamp(y * ColorPicker.hue.AbsoluteSize.Y, 0.5, 1 * ColorPicker.hue.AbsoluteSize.Y) / ColorPicker.hue.AbsoluteSize.Y)));
						end

						function ColorPicker:Set(value)
							local color = Color3.new(math.clamp(value.r, 0, 1), math.clamp(value.g, 0, 1), math.clamp(value.b, 0, 1));
							ColorPicker.value = color;
							if ColorPicker.flag and ColorPicker.flag ~= "" then
								library.flags[ColorPicker.flag] = color;
							end
							local clr = Color3.new(math.clamp(color.R / 1.7, 0, 1), math.clamp(color.G / 1.7, 0, 1), math.clamp(color.B / 1.7, 0, 1));
							ColorPicker.Indicator.BackgroundColor3 = color;
							pcall(ColorPicker.callback, color);
						end

						function ColorPicker:Get(value)
							return ColorPicker.value;
						end
						ColorPicker:Set(ColorPicker.default);

						local dragging_selector = false;
						local dragging_hue = false;

						ColorPicker.selector.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging_selector = true;
								ColorPicker:RefreshSelector();
							end
						end)

						ColorPicker.selector.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging_selector = false;
								ColorPicker:RefreshSelector();
							end
						end)

						ColorPicker.hue.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging_hue = true;
								ColorPicker:RefreshHue();
							end
						end)

						ColorPicker.hue.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging_hue = false;
								ColorPicker:RefreshHue();
							end
						end)

						game:GetService("UserInputService").InputChanged:Connect(function(input)
							if dragging_selector and input.UserInputType == Enum.UserInputType.MouseMovement then
								ColorPicker:RefreshSelector();
							end
							if dragging_hue and input.UserInputType == Enum.UserInputType.MouseMovement then
								ColorPicker:RefreshHue();
							end
						end)

						local inputBegan = function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								for i,v in pairs(window.OpenedColorPickers) do
									if v and i ~= ColorPicker.MainPicker then
										i.Visible = false;
										window.OpenedColorPickers[i] = false;
									end
								end

								ColorPicker.MainPicker.Visible = not ColorPicker.MainPicker.Visible;
								window.OpenedColorPickers[ColorPicker.MainPicker] = ColorPicker.MainPicker.Visible;
							end
						end

						ColorPicker.MainBack.InputBegan:Connect(inputBegan);
						ColorPicker.MainPicker.InputBegan:Connect(inputBegan);
						ColorPicker.MainPicker.InputBegan:Connect(inputBegan);
						
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
						table.insert(library.items, CoppyText);
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
						Lable.TextLabel.Text = Lable.text;
						Lable.TextLabel.BackgroundTransparency = 1;
						Lable.TextLabel.TextColor3 = library.theme.TextColor;
						Lable.TextLabel.TextSize = library.theme.TextSize;
						Lable.TextLabel.Font = library.theme.Font;
						Lable.TextLabel.Size = UDim2.fromOffset(125, 35);
						Lable.TextLabel.Position = UDim2.fromScale(0.046, 0);
						Lable.TextLabel.TextXAlignment = Enum.TextXAlignment.Left;

						Sector:FixSize();
						table.insert(library.items, Lable);
						return Lable;
					end

					function Sector:CreateTextBox(Text, Default, Callback, Flag)
						local TextBox = { };
						TextBox.text = Text or "";
						TextBox.callback = Callback or function() end;
						TextBox.default = Default;
						TextBox.value = "";
						TextBox.flag = Flag or Text or "";

						TextBox.MainBack = Instance.new("TextButton", Sector.Items);
						TextBox.MainBack.BackgroundColor3 = library.theme.BackGround;
						TextBox.MainBack.AutoButtonColor = false;
						TextBox.MainBack.Size = UDim2.fromOffset(240, 35);
						TextBox.MainBack.Text = "";

						TextBox.UICorner = Instance.new("UICorner", TextBox.MainBack);
						TextBox.UICorner.CornerRadius = UDim.new(0,8);

						TextBox.TextLabel = Instance.new("TextLabel", TextBox.MainBack);
						TextBox.TextLabel.Text = TextBox.text;
						TextBox.TextLabel.BackgroundTransparency = 1;
						TextBox.TextLabel.TextColor3 = library.theme.TextColor;
						TextBox.TextLabel.TextSize = library.theme.TextSize;
						TextBox.TextLabel.Font = library.theme.Font;
						TextBox.TextLabel.Size = UDim2.fromOffset(125, 35);
						TextBox.TextLabel.Position = UDim2.fromScale(0.046, 0);
						TextBox.TextLabel.TextXAlignment = Enum.TextXAlignment.Left;

						TextBox.Main = Instance.new("TextBox", TextBox.MainBack);
						TextBox.Main.Position = UDim2.fromScale(0.496, 0.229);
						TextBox.Main.Size = UDim2.fromOffset(109, 18);
						TextBox.Main.BackgroundColor3 = library.theme.Toggle;
						TextBox.Main.BorderSizePixel = 0;
						TextBox.Main.Text = "";
						TextBox.Main.TextColor3 = library.theme.TextColor;
						TextBox.Main.Font = library.theme.Font;
						TextBox.Main.TextSize = library.theme.TextSize;
						TextBox.Main.ClearTextOnFocus = false;

						if TextBox.flag and TextBox.flag ~= "" then
							library.flags[TextBox.flag] = TextBox.default or ""
						end

						function TextBox:Set(text)
							TextBox.value = text
							TextBox.Main.Text = text
							if TextBox.flag and TextBox.flag ~= "" then
								library.flags[TextBox.flag] = text
							end
							pcall(TextBox.callback, text)
						end

						function TextBox:Get()
							return TextBox.value
						end

						if TextBox.default then 
							TextBox:Set(TextBox.default)
						end

						TextBox.Main.FocusLost:Connect(function()
							TextBox:Set(TextBox.Main.Text)
						end)

						Sector:FixSize();
						table.insert(library.items, TextBox);
						return TextBox;
					end

					function Sector:CreateButton(Text, Callback)
						local Button = { };
						Button.text = Text or ""
						Button.callback = Callback or function() end

						Button.MainBack = Instance.new("TextButton", Sector.Items);
						Button.MainBack.BackgroundColor3 = library.theme.BackGround;
						Button.MainBack.AutoButtonColor = false;
						Button.MainBack.Size = UDim2.fromOffset(240, 35);
						Button.MainBack.Text = "";
						Button.MainBack.Text = Button.text;
						Button.MainBack.Font = library.theme.Font;
						Button.MainBack.TextColor3 = library.theme.TextColor;
						Button.MainBack.TextSize = library.theme.TextSize;
						Button.MainBack.MouseButton1Click:Connect(Button.callback);

						Button.UICorner = Instance.new("UICorner", Button.MainBack);
						Button.UICorner.CornerRadius = UDim.new(0,8);

						Sector:FixSize();
						return Button;
					end

					return Sector;
				end


				function tab:CreateConfig(side) 
					local ConfigSystem = { };

					ConfigSystem.configFolder = window.name;
					
					pcall(function()
						if isfolder and makefolder and listfiles and writefile and readfile and delfile then

							if (not isfolder(ConfigSystem.configFolder)) then
								makefolder(ConfigSystem.configFolder)
							end

							ConfigSystem.sector = tab:CreateSector("Configs", side or "left");

							local ConfigName = ConfigSystem.sector:CreateTextBox("Config Name", "", ConfigName, function() end, "");
							local default = tostring(listfiles(ConfigSystem.configFolder)[1] or ""):gsub(ConfigSystem.configFolder .. "\\", ""):gsub(".txt", "");
							local Config = ConfigSystem.sector:CreateDropDown("Configs", {}, default, false, function() end, "");
							for i,v in pairs(listfiles(ConfigSystem.configFolder)) do
								if v:find(".txt") then
									Config:Add(tostring(v):gsub(ConfigSystem.configFolder .. "\\", ""):gsub(".txt", ""));
								end
							end

							ConfigSystem.Create = ConfigSystem.sector:CreateButton("Create", function()
								for i,v in pairs(listfiles(ConfigSystem.configFolder)) do
									Config:Remove(tostring(v):gsub(ConfigSystem.configFolder .. "\\", ""):gsub(".txt", ""));
								end

								if ConfigName:Get() and ConfigName:Get() ~= "" then
									local config = {};

									for i,v in pairs(library.flags) do
										if (v ~= nil and v ~= "") then
											if (typeof(v) == "Color3") then
												config[i] = { v.R, v.G, v.B };
											elseif (tostring(v):find("Enum.KeyCode")) then
												config[i] = v.Name
											elseif (typeof(v) == "table") then
												config[i] = { v };
											else
												config[i] = v;
											end
										end
									end

									writefile(ConfigSystem.configFolder .. "/" .. ConfigName:Get() .. ".txt", httpservice:JSONEncode(config));

									for i,v in pairs(listfiles(ConfigSystem.configFolder)) do
										if v:find(".txt") then
											Config:Add(tostring(v):gsub(ConfigSystem.configFolder .. "\\", ""):gsub(".txt", ""));
										end
									end
								end
							end)

							ConfigSystem.Save = ConfigSystem.sector:CreateButton("Save", function()
								local config = {}
								if Config:Get() and Config:Get() ~= "" then
									for i,v in pairs(library.flags) do
										if (v ~= nil and v ~= "") then
											if (typeof(v) == "Color3") then
												config[i] = { v.R, v.G, v.B };
											elseif (tostring(v):find("Enum.KeyCode")) then
												config[i] = "Enum.KeyCode." .. v.Name;
											elseif (typeof(v) == "table") then
												config[i] = { v };
											else
												config[i] = v;
											end
										end
									end

									writefile(ConfigSystem.configFolder .. "/" .. ConfigName:Get() .. ".txt", httpservice:JSONEncode(config))
								end
							end)

							ConfigSystem.Load = ConfigSystem.sector:CreateButton("Load", function()
								local Success = pcall(readfile, ConfigSystem.configFolder .. "/" .. Config:Get() .. ".txt");
								if (Success) then
									pcall(function() 
										local ReadConfig = httpservice:JSONDecode(readfile(ConfigSystem.configFolder .. "/" .. Config:Get() .. ".txt"));
										local NewConfig = {};

										for i,v in pairs(ReadConfig) do
											if (typeof(v) == "table") then
												if (typeof(v[1]) == "number") then
													NewConfig[i] = Color3.new(v[1], v[2], v[3]);
												elseif (typeof(v[1]) == "table") then
													NewConfig[i] = v[1];
												end
											elseif (tostring(v):find("Enum.KeyCode.")) then
												NewConfig[i] = Enum.KeyCode[tostring(v):gsub("Enum.KeyCode.", "")];
											else
												NewConfig[i] = v;
											end
										end

										library.flags = NewConfig;

										for i,v in pairs(library.flags) do
											for i2,v2 in pairs(library.items) do
												if (i ~= nil and i ~= "" and i ~= "Configs_Name" and i ~= "Configs" and v2.flag ~= nil) then
													if (v2.flag == i) then
														pcall(function() 
															v2:Set(v);
														end)
													end
												end
											end
										end
									end)
								end
							end)

							ConfigSystem.Delete = ConfigSystem.sector:CreateButton("Delete", function()
								for i,v in pairs(listfiles(ConfigSystem.configFolder)) do
									Config:Remove(tostring(v):gsub(ConfigSystem.configFolder .. "\\", ""):gsub(".txt", ""));
								end

								if (not Config:Get() or Config:Get() == "") then return end
								if (not isfile(ConfigSystem.configFolder .. "/" .. Config:Get() .. ".txt")) then return; end;
								delfile(ConfigSystem.configFolder .. "/" .. Config:Get() .. ".txt");

								for i,v in pairs(listfiles(ConfigSystem.configFolder)) do
									if v:find(".txt") then
										Config:Add(tostring(v):gsub(ConfigSystem.configFolder .. "\\", ""):gsub(".txt", ""));
									end;
								end;
							end);
						else
							ConfigSystem.sector = tab:CreateSector("Configs", side or "left");
							ConfigSystem.sector:CreateLable("Your Executor Is Not Supported");
						end
					end)

					return ConfigSystem;
				end

				table.insert(window.Tabs, tab)
				return tab;
			end

			return window;
		end

		return library;
	end
	
	local IsArsenal = false;
	if game.PlaceId == 286090429 then
		IsArsenal = true;
	end

	local DeleteMobLib = library();

	local Window = DeleteMobLib:CreateWindow(HyperEscape.GUI.GUIToggleKey, "DeleteMob");
	local UIToggle = Window:CreateToggleButton()

	local AimBotTab = Window:CreateTab("Aim Bot");
	local MainSector = AimBotTab:CreateSector("Main", "Left");
	MainSector:CreateToggle("Enable", HyperEscape.AimBot.Enabled, function(AE) HyperEscape.AimBot.Enabled = AE; end);
	MainSector:CreateToggle("Team Check", HyperEscape.AimBot.TeamCheck, function(ATC) HyperEscape.AimBot.TeamCheck = ATC; end);
	MainSector:CreateToggle("Wall Check", HyperEscape.AimBot.WallCheck, function(AWC) HyperEscape.AimBot.WallCheck = AWC ;end);
	MainSector:CreateDropDown("Hit Scan", {"Head", "HumanoidRootPart"}, HyperEscape.AimBot.AimPart, false, function(AHS) HyperEscape.AimBot.AimPart = AHS; end);

	local FovSecor = AimBotTab:CreateSector("FOV Circle", "Left");
	FovSecor:CreateToggle("Show Fov", HyperEscape.AimBot.ShowFov, function(AFE) HyperEscape.AimBot.ShowFov = AFE; end);
	FovSecor:CreateSlider("Circle Radius", 0, HyperEscape.AimBot.Fov, 1500, 1, function(FCR) HyperEscape.AimBot.Fov = FCR; end);

	local OtherSector = AimBotTab:CreateSector("Other", "Right");
	OtherSector:CreateToggle("Prediction", HyperEscape.AimBot.Prediction, function(APE) HyperEscape.AimBot.Prediction = APE; end);
	OtherSector:CreateSlider("Prediction Ammount", 100, HyperEscape.AimBot.PredictionAmmount * 100, 1000, 1, function(APA) HyperEscape.AimBot.PredictionAmmount = APA / 100; end);
	OtherSector:CreateToggle("Sticky Aim", HyperEscape.AimBot.StickyAim, function(ASAE) HyperEscape.AimBot.StickyAim = ASAE; end);
	OtherSector:CreateSlider("Smoothing", 3, HyperEscape.AimBot.Smoothing * 100, 50, 1, function(AS) HyperEscape.AimBot.Smoothing = AS / 100; end);
	OtherSector:CreateKeyBind("Key Bind", HyperEscape.AimBot.Keybind, function(AK) HyperEscape.AimBot.Keybind = AK; end);
	OtherSector:CreateToggle("Use Mouse", HyperEscape.AimBot.UseMouse, function(AUM) HyperEscape.AimBot.UseMouse = AUM; end);
	OtherSector:CreateDropDown("Mouse Bind", {"MouseButton1", "MouseButton2"}, HyperEscape.AimBot.MouseBind, false, function(AMB) HyperEscape.AimBot.MouseBind = AMB; end);

	local ESPTab = Window:CreateTab("ESP");
	local EnableSector = ESPTab:CreateSector("ESP", "Left");
	EnableSector:CreateToggle("Enable", HyperEscape.esp.Enabled, function(EE) HyperEscape.esp.Enabled = EE; end);
	EnableSector:CreateToggle("Team Check", HyperEscape.esp.Box.TeamCheck, function(ETC) HyperEscape.esp.TeamCheck = ETC; end);
	EnableSector:CreateToggle("Box", HyperEscape.esp.Box.Box, function(EB) HyperEscape.esp.Box.Box = EB; end);
	EnableSector:CreateToggle("Tracer", HyperEscape.esp.Tracer.Tracer, function(ET) HyperEscape.esp.Tracer.Tracer = ET; end);
	EnableSector:CreateToggle("Health", HyperEscape.esp.Box.Health, function(EH) HyperEscape.esp.Box.Health = EH; end);
	EnableSector:CreateToggle("Name", HyperEscape.esp.Box.Name, function(EN) HyperEscape.esp.Box.Name = EN; end);
	EnableSector:CreateToggle("Distance", HyperEscape.esp.Box.Distance, function(ED) HyperEscape.esp.Box.Distance = ED; end);
	EnableSector:CreateToggle("Health Bar", HyperEscape.esp.Box.HealthBar, function(EHB) HyperEscape.esp.Box.HealthBar = EHB; end);
	if not IsArsenal then
		EnableSector:CreateToggle("Hilights", HyperEscape.esp.Hilights.Hilights, function(EHi) HyperEscape.esp.Hilights.Hilights = EHi; end);
		EnableSector:CreateToggle("Show Hilight Through Walls", HyperEscape.esp.Hilights.AllWaysVisible, function(ESHTW) HyperEscape.esp.Hilights.AllWaysVisible = ESHTW; end);
	end

	local ESPSettingsSecor = ESPTab:CreateSector("Settings", "Right");
	ESPSettingsSecor:CreateSlider("Max Distance", 0, HyperEscape.esp.MaxDistance, 4000, 1, function(EMD) HyperEscape.esp.MaxDistance = EMD; end);
	ESPSettingsSecor:CreateToggle("Outlines", HyperEscape.esp.Box.Outline, function(ESO) HyperEscape.esp.Box.Outline = ESO; HyperEscape.esp.Tracer.Outline = ESO; end);
	ESPSettingsSecor:CreateColorPicker("Outline Color", HyperEscape.esp.Box.OutlineColor, function(EOC) HyperEscape.esp.Box.OutlineColor = EOC; HyperEscape.esp.Tracer.OutlineColor = EOC; end);
	ESPSettingsSecor:CreateColorPicker("ESP Color", HyperEscape.esp.Box.Color, function(EEC) HyperEscape.esp.Box.Color = EEC; HyperEscape.esp.Tracer.Color = EEC; end);
	if not IsArsenal then
		ESPSettingsSecor:CreateColorPicker("Hilight Outline", HyperEscape.esp.Hilights.OutlineColor, function(EOCC) HyperEscape.esp.Hilights.OutlineColor = EOCC; end);
		ESPSettingsSecor:CreateColorPicker("Hilight Fill", HyperEscape.esp.Hilights.FillColor, function(EFCC) HyperEscape.esp.Hilights.FillColor = EFCC; end);
		ESPSettingsSecor:CreateSlider("Hilight Outline", 0, HyperEscape.esp.Hilights.OutlineTransparency * 100, 100, 1, function(EHOT) HyperEscape.esp.Hilights.OutlineTransparency = EHOT / 100; end);
		ESPSettingsSecor:CreateSlider("Hilight Fill", 0, HyperEscape.esp.Hilights.FillTransparency * 100, 100, 1, function(EHFT) HyperEscape.esp.Hilights.FillTransparency = EHFT / 100; end);
	end

	local SettingsTab = Window:CreateTab("Settings");
	local SettingsInfoSector = SettingsTab:CreateSector("Info", "Left");
	SettingsInfoSector:CreateCoppyText("Made By m1ckgordon");
	SettingsInfoSector:CreateCoppyText("https://discord.gg/jNRKdtH3 - Click Me");

	SettingsTab:CreateConfig("Right");

	local SettingsSettings = SettingsTab:CreateSector("GUI Settigns", "Left");
	SettingsSettings:CreateToggle("UI Toggle Button", HyperEscape.GUI.GUIButton, function(GUITB) HyperEscape.GUI.GUIButton = GUITB; UIToggle:Update(GUITB); end);
	SettingsSettings:CreateKeyBind("UI Key Bind", HyperEscape.GUI.GUIToggleKey, function(SUITK) HyperEscape.GUI.GUIToggleKey = SUITK; Window:UpdateKeyBind(SUITK); end);


	local ESPHolder = Instance.new("Folder", (CoreGui or localPlayer.PlayerGui)); 
	local Fov = Instance.new("ScreenGui",(CoreGui or localPlayer.PlayerGui))Fov.Name = "Fov" Fov.ZIndexBehavior = Enum.ZIndexBehavior.Sibling Fov.ResetOnSpawn = false; -- Yapee
	local FOVFFrame = Instance.new("Frame")FOVFFrame.Parent = Fov FOVFFrame.Name = "FOVFFrame" FOVFFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) FOVFFrame.BorderColor3 = Color3.fromRGB(0, 0, 0) FOVFFrame.BorderSizePixel = 0 FOVFFrame.BackgroundTransparency = 1 FOVFFrame.AnchorPoint = Vector2.new(0.5, 0.5) FOVFFrame.Position = UDim2.new(0.5, 0,0.5, 0) FOVFFrame.Size = UDim2.new(0, HyperEscape.AimBot.Fov, 0, HyperEscape.AimBot.Fov) FOVFFrame.BackgroundTransparency = 1;
	local UICorner = Instance.new("UICorner")UICorner.CornerRadius = UDim.new(1, 0) UICorner.Parent = FOVFFrame;
	local UIStroke = Instance.new("UIStroke")UIStroke.Color = Color3.fromRGB(100,0,100) UIStroke.Parent = FOVFFrame UIStroke.Thickness = 1 UIStroke.ApplyStrokeMode = "Border"; game:GetService("StarterGui"):SetCore("SendNotification", {Title = "https://discord.gg/FsApQ7YNTq", Text = "The Discord For More!"});

	local function IsAlive(Player)
		if Player and Player.Character and Player.Character:FindFirstChild("Humanoid") ~= nil and (IsArsenal and players[Player.Character.Name].NRPBS["Health"].Value > 0 or not IsArsenal and Player.Character.Humanoid.Health > 0) then
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
			game:GetService("RunService").RenderStepped:Connect(function()
				if IsAlive(Player) and (HyperEscape.esp.Box.Box or HyperEscape.esp.Box.HealthBar or HyperEscape.esp.Box.Name or HyperEscape.esp.Box.Health or HyperEscape.esp.Tracer.Tracer or HyperEscape.esp.Hilights.Hilights) then
					local screen, onScreen = CurrentCamera:WorldToScreenPoint(Player.Character.HumanoidRootPart.Position); 
					local frustumHeight = math.tan(math.rad(CurrentCamera.FieldOfView * 0.5)) * 2 * screen.Z ; -- Thank you mickeydev, Join .gg/lunarity for the best paid script hub for fps games made by known and trusted developers. 
					local size = CurrentCamera.ViewportSize.Y / frustumHeight * HyperEscape.esp.CharacterSize;
					local position = Vector2.new(screen.X, screen.Y) - (size / 2 - Vector2.new(0, size.Y) / 20);

					if onScreen and (HyperEscape.esp.TeamCheck ~= true  or GetTeam(Player) ~= GetTeam(localPlayer)) and HyperEscape.esp.Enabled then	
						local DistanceNumb = math.floor(0.5+(CurrentCamera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude);
						if HyperEscape.esp.MaxDistance > DistanceNumb then
							-- Box

							if HyperEscape.esp.Box.Box then

								LeftOutline.Visible = HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;
								RightOutline.Visible =  HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;
								TopOutline.Visible =  HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;
								BottomOutline.Visible =  HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;

								Left.Position = UDim2.fromOffset(position.X, position.Y);
								Right.Position = UDim2.fromOffset(position.X, position.Y + size.Y - 1);
								Top.Position = UDim2.fromOffset(position.X, position.Y);
								Bottom.Position = UDim2.fromOffset(position.X + size.X - 1, position.Y);

								LeftOutline.Position = Left.Position;
								RightOutline.Position =  Right.Position;
								TopOutline.Position =  Top.Position;
								BottomOutline.Position =  Bottom.Position;

								Left.Visible = HyperEscape.esp.Box.Box;
								Right.Visible =  HyperEscape.esp.Box.Box;
								Top.Visible =  HyperEscape.esp.Box.Box;
								Bottom.Visible =  HyperEscape.esp.Box.Box;

								Left.Size = UDim2.fromOffset(size.X, 1);
								Right.Size = UDim2.fromOffset(size.X, 1);
								Top.Size = UDim2.fromOffset(1, size.Y);
								Bottom.Size = UDim2.fromOffset(1, size.Y);

								LeftOutline.Size = Left.Size;
								RightOutline.Size = Right.Size;
								TopOutline.Size = Top.Size;
								BottomOutline.Size = Bottom.Size;

								LeftOutline.BorderColor3 = HyperEscape.esp.Box.OutlineColor;
								RightOutline.BorderColor3 =  HyperEscape.esp.Box.OutlineColor;
								TopOutline.BorderColor3 =  HyperEscape.esp.Box.OutlineColor;
								BottomOutline.BorderColor3 =  HyperEscape.esp.Box.OutlineColor;

								Left.BackgroundColor3 = HyperEscape.esp.Box.Color;
								Right.BackgroundColor3 = HyperEscape.esp.Box.Color;
								Top.BackgroundColor3 = HyperEscape.esp.Box.Color;
								Bottom.BackgroundColor3 = HyperEscape.esp.Box.Color;
								LeftOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
								RightOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
								TopOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
								BottomOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
							else
								LeftOutline.Visible = false;
								RightOutline.Visible =  false;
								TopOutline.Visible =  false;
								BottomOutline.Visible =  false;
								Left.Visible = false;
								Right.Visible =  false;
								Top.Visible =  false;
								Bottom.Visible =  false;
							end

							if HyperEscape.esp.Box.HealthBar then

								local health = (IsArsenal and players[Player.Character.Name].NRPBS["Health"].Value or Player.Character.Humanoid.Health);
								local healthScale = (IsArsenal and health / players[Player.Character.Name].NRPBS["MaxHealth"].Value or health / Player.Character.Humanoid.MaxHealth);
								local healthSizeY = size.Y * healthScale;

								HealthBackground.Visible = HyperEscape.esp.Box.HealthBar;
								HealthBar.Visible = HyperEscape.esp.Box.HealthBar;

								HealthBackground.Size = UDim2.fromOffset(4, size.Y);
								HealthBar.Size = UDim2.fromOffset(2, -healthSizeY);

								HealthBackground.Position = UDim2.fromOffset(position.X - 8, position.Y); 
								HealthBar.Position = UDim2.fromOffset(position.x - 7, position.y + size.Y);

								HealthBackground.BackgroundColor3 = HyperEscape.esp.Box.OutlineColor;
								HealthBackground.BorderColor3 = HyperEscape.esp.Box.OutlineColor;
							else
								HealthBackground.Visible = false;
								HealthBar.Visible = false;
							end

							if HyperEscape.esp.Box.Health then

								local health = (IsArsenal and players[Player.Character.Name].NRPBS["Health"].Value or Player.Character.Humanoid.Health);
								local healthScale = (IsArsenal and health / players[Player.Character.Name].NRPBS["MaxHealth"].Value or health / Player.Character.Humanoid.MaxHealth);
								local healthSizeY = size.Y * healthScale;

								Health.Visible = HyperEscape.esp.Box.Health;

								Health.Position = (HyperEscape.esp.Box.HealthBar and UDim2.fromOffset(position.X - 25, position.y + size.Y + -healthSizeY) or UDim2.fromOffset(position.X - 25, position.Y + size.Y));

								Health.Text = (IsArsenal and math.floor(players[Player.Character.Name].NRPBS["Health"].Value) or math.floor(Player.Character.Humanoid.Health));
							else
								Health.Visible = false;
							end

							-- Distance

							if HyperEscape.esp.Box.Distance or HyperEscape.esp.Box.Name then

								Name.Visible = HyperEscape.esp.Box.Name;
								Distance.Visible = HyperEscape.esp.Box.Distance and not HyperEscape.esp.Box.Name;

								Name.Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + Name.TextBounds.Y + 14) / 2);
								Distance.Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + Name.TextBounds.Y + 14) / 2);

								Distance.Text = math.floor(0.5+(CurrentCamera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude);
								Name.Text = (HyperEscape.esp.Box.Name and HyperEscape.esp.Box.Distance and Player.Name .. " [" .. math.floor(0.5+(CurrentCamera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude / 3.5714285714) .. "]" or Player.Name);

							else
								Name.Visible = false;
								Distance.Visible = false;
							end

							-- Tracer

							if HyperEscape.esp.Tracer.Tracer then

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

							if HyperEscape.esp.Hilights.Hilights then

								Hilight.Enabled = HyperEscape.esp.Hilights.Hilights;

								if not IsArsenal then
									Hilight.Adornee = Player.Character;
								end

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
					Hilight.Enabled = false;
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

		if HyperEscape.AimBot.Enabled then
			if HyperEscape.AimBot.IsAimKeyDown then
				if HyperEscape.AimBot.StickyAim then
					if HyperEscape.AimBot.Target ~= nil then

						if not IsAlive(HyperEscape.AimBot.Target) then -- Yes I Know This Aim Bot Sucks
							local target = CameraGetClosestToMouse()
							HyperEscape.AimBot.Target = target;
							HyperEscape.AimBot.CameraTween = TweenService:Create(CurrentCamera, TweenInfo.new(HyperEscape.AimBot.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(CurrentCamera.CFrame.Position, target.Character[HyperEscape.AimBot.AimPart].Position + (HyperEscape.AimBot.Prediction and HyperEscape.AimBot.target.Character[HyperEscape.AimBot.AimPart].Velocity * (localPlayer:GetNetworkPing() * HyperEscape.AimBot.PredictionAmmount) or Vector3.new()))});
							HyperEscape.AimBot.CameraTween:Play();
						end
						HyperEscape.AimBot.CameraTween = TweenService:Create(CurrentCamera, TweenInfo.new(HyperEscape.AimBot.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(CurrentCamera.CFrame.Position, HyperEscape.AimBot.Target.Character[HyperEscape.AimBot.AimPart].Position + (HyperEscape.AimBot.Prediction and HyperEscape.AimBot.Target.Character[HyperEscape.AimBot.AimPart].Velocity * (localPlayer:GetNetworkPing() * HyperEscape.AimBot.PredictionAmmount) or Vector3.new()))});
						HyperEscape.AimBot.CameraTween:Play();
					end
				else
					local target = CameraGetClosestToMouse();
					if target ~= nil then
						HyperEscape.AimBot.CameraTween = TweenService:Create(CurrentCamera, TweenInfo.new(HyperEscape.AimBot.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(CurrentCamera.CFrame.Position,  target.Character[HyperEscape.AimBot.AimPart].Position + (HyperEscape.AimBot.Prediction and target.Character[HyperEscape.AimBot.AimPart].Velocity * (localPlayer:GetNetworkPing() * HyperEscape.AimBot.PredictionAmmount) or Vector3.new()))});
						HyperEscape.AimBot.CameraTween:Play();

					elseif HyperEscape.AimBot.CameraTween ~= nil then
						HyperEscape.AimBot.CameraTween:Cancel(); 
					end
				end
			end
		end
	end)
end
