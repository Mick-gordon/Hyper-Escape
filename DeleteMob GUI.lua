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

function library:CreateWindow(Keybind, Name)
	local window = { };
	window.keybind = Keybind or Enum.KeyCode.RightShift;
	window.name = Name or "DeleteMob";

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

		function tab:CreateConfig(side) -- Maybe in V2.1 or V2.2

		end

		table.insert(window.Tabs, tab)
		return tab;
	end

	return window;
end

return library;
