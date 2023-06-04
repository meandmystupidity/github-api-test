local module = {}
if (game.Players.LocalPlayer.PlayerGui:FindFirstChild('DoggosHub') ~= nil) then
	game.Players.LocalPlayer.PlayerGui.DoggosHub:Destroy()
end
local Lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/meandmystupidity/robloxgamefunctions/main/lib.lua')))()
local canDrag, inFrame = false, false
local dragging = false
local dragInput, mousePos, framePos
Lib.Drag.MouseEnter:Connect(function()
	canDrag = false
end)
Lib.Drag.MouseLeave:Connect(function()
	canDrag = true
end)
Lib.Background.MouseEnter:Connect(function()
	inFrame = true
end)
Lib.Background.MouseLeave:Connect(function()
	inFrame = false
end)
game:GetService('UserInputService').InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
    dragging = true
    mousePos = input.Position
    framePos = Lib.Background.Position

    input.Changed:Connect(function()
	if input.UserInputState == Enum.UserInputState.End then
	    dragging = false
	end
    end)
end
end)

game:GetService('UserInputService').InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

game:GetService('UserInputService').InputChanged:Connect(function(input)
	if input == dragInput and dragging and canDrag and inFrame then
	    local delta = input.Position - mousePos
		if Lib:FindFirstChild('Background') ~= nil then
			Lib.Background.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
		end
	end
end)
local Background = Lib.Background
Background.Visible = true
Background.Active = true
local Templates = Background.Templates
local Dropdown = Templates.Dropdown.Title
local Button = Templates.Button.ButtonTemplate
local Tab = Templates.Tab.Tabtemplate
local Toggle = Templates.Toggle.ToggleTemplate
local Section = Templates.Section.SectionHolder
local Keybind = Templates.Keybind.Title
local Slider = Templates.Slider.SliderTemplate
local Clock
local TabsHolder = Background.Headers.Tabs.Frames.TabsHolder
local TabsButtonHolder = Background.Headers.Tabs.Buttons.ButtonsHolder
local OpenedTab = Instance.new('StringValue')
OpenedTab.Parent = TabsHolder
OpenedTab.Name = 'OpenedTab'
for num, v in pairs(TabsHolder:GetChildren()) do
	if (v.ClassName == 'Folder') and (OpenedTab.Value:len() < 4) then
		OpenedTab.Value = v.Name
	end
end
for _, child in pairs(Background.Headers:GetChildren()) do
	if (child.ClassName == 'TextLabel') then
		if (child.Text == '00:00 00.00.0000') then
			Clock = child
		end
	end
end
function addTo(instance, where)
	instance.Parent = where
end
function addTabAnimation(instance)
	local clicked = false
	instance.MouseButton1Down:Connect(function()
		if (clicked == false) then
			clicked = true
			for x = 40, 60 do
				instance.BackgroundColor3 = Color3.fromRGB(x, x, x)
				instance.BorderColor3 = Color3.fromRGB(x, x, x)
				task.wait(0.002)
			end
		end
	end)
	instance.MouseButton1Up:Connect(function()
		if (clicked == true) then
			clicked = false
			for x = 60, 40, -1 do
				instance.BackgroundColor3 = Color3.fromRGB(x, x, x)
				instance.BorderColor3 = Color3.fromRGB(x, x, x)
				task.wait(0.002)
			end
		end
	end)
end
function addTabFolder(tab, where)
	local newFolder = Instance.new('Folder')
	newFolder.Name = tab.Name .. '-Folder'
	newFolder.Parent = where
	return newFolder
end
function openTab(tabname)
	for _, child in pairs(TabsHolder:GetChildren()) do
		local success, msg = pcall(function()
			if (child.Name == tabname)then
				child.Visible = true
			else
				child.Visible = false
			end
		end)
	end
	OpenedTab.Value = tabname .. '-Folder'
end
openTab(OpenedTab.Value)
function module:AddTab(name)
	local Universal = Tab:Clone()
	Universal.Visible = true
	Universal.Name = name
	Universal.Text = name
	addTo(Universal, TabsButtonHolder)
	local assignedFolder = addTabFolder(Universal, TabsHolder)
	addTabAnimation(Universal)
	local clickedOnButton = false
	Universal.MouseButton1Down:Connect(function()
		clickedOnButton = true
	end)
	Universal.MouseButton1Up:Connect(function()
		if (clickedOnButton == true) then
			clickedOnButton = false
			openTab(name)
		end
	end)
	local Elements = {}
	function Elements:AddButton(config)
		local actions = {}
		config.Text = config.Text or 'Could not create Text: config.Text missing.'
		callback = config.Callback or function() end
		local newButton = Button:Clone()
		newButton.Parent = TabsHolder
		newButton.Name = name
		newButton.Text = '  ' .. config.Text
		local clicked = false
		newButton.MouseButton1Down:Connect(function()
			if (clicked == false) then
				clicked = true
				for x = 60, 76 do
					newButton.BackgroundColor3 = Color3.fromRGB(x, x, x)
					newButton.BorderColor3 = Color3.fromRGB(x, x, x)
					task.wait()
				end
			end
		end)
		newButton.MouseButton1Up:Connect(function()
			if (clicked == true) then
				clicked = false
				pcall(callback)
				for x = 76, 60, -1 do
					newButton.BackgroundColor3 = Color3.fromRGB(x, x, x)
					newButton.BorderColor3 = Color3.fromRGB(x, x, x)
					task.wait()
				end
			end
		end)
		function actions:NewText(newText)
			newText = newText or tostring(math.random(1000, 9000)) .. 'error'
			newButton.Text = newText
		end
	end
	function Elements:AddSection(config)
		local actions = {}
		config.Name = config.Name or tostring(math.random(1000, 9000)) .. 'error'
		local newSection = Section:Clone()
		newSection.Name = name
		newSection.Title.Text = '  ' .. config.Name
		newSection.Parent = TabsHolder
		function actions:NewText(newText)
			newText = newText or tostring(math.random(1000, 9000)) .. 'error'
			newSection.Title.Text = newText
		end
	end
	function Elements:AddToggle(config)
		local actions = {}
		config.Text = config.Text or tostring(math.random(1000, 9000)) .. 'error'
		config.Callback = config.Callback or function() end
		local newToggle = Toggle:Clone()
		newToggle.Name = name
		newToggle.Text = '  ' .. config.Text
		newToggle.Parent = TabsHolder
		local TS = game:GetService('TweenService')
		local Info = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
		local enabled = false
		newToggle.MouseButton1Click:Connect(function()
			if (newToggle.ToggleBackground.Toggle.BackgroundColor3 == Color3.fromRGB(170, 0, 0)) then
				TS:Create(newToggle.ToggleBackground.Toggle, Info, {BackgroundColor3 = Color3.fromRGB(0, 85, 0), Position = UDim2.new(0.49, 0, 0.020, 0)}):Play() --// Position = UDim2.new(0.49, 0, 0.017, 0), 
				enabled = true
			else
				TS:Create(newToggle.ToggleBackground.Toggle, Info, {BackgroundColor3 = Color3.fromRGB(170, 0, 0), Position = UDim2.new(-0.01, 0, 0.020, 0)}):Play() --// Position = UDim2.new(-0.01, 0, 0.017, 0), 
				enabled = false
			end
			pcall(config.Callback, enabled)
		end)
		newToggle.ToggleBackground.Toggle.MouseButton1Click:Connect(function()
			if (newToggle.ToggleBackground.Toggle.BackgroundColor3 == Color3.fromRGB(170, 0, 0)) then
				TS:Create(newToggle.ToggleBackground.Toggle, Info, {BackgroundColor3 = Color3.fromRGB(0, 85, 0), Position = UDim2.new(0.49, 0, 0.020, 0)}):Play() --// Position = UDim2.new(0.49, 0, 0.017, 0), 
				enabled = true
			else
				TS:Create(newToggle.ToggleBackground.Toggle, Info, {BackgroundColor3 = Color3.fromRGB(170, 0, 0), Position = UDim2.new(-0.01, 0, 0.020, 0)}):Play() --// Position = UDim2.new(-0.01, 0, 0.017, 0), 
				enabled = false
			end
			pcall(config.Callback, enabled)
		end)
		function actions:Set(state)
			if (state == true) then
				TS:Create(newToggle.ToggleBackground.Toggle, Info, {BackgroundColor3 = Color3.fromRGB(0, 85, 0), Position = UDim2.new(0.49, 0, 0.020, 0)}):Play()
				enabled = true
				pcall(config.Callback, enabled)
			else
				TS:Create(newToggle.ToggleBackground.Toggle, Info, {BackgroundColor3 = Color3.fromRGB(170, 0, 0), Position = UDim2.new(-0.01, 0, 0.020, 0)}):Play()
				enabled = false
				pcall(config.Callback, enabled)
			end
		end
		function actions:NewText(newText)
			newText = newText or tostring(math.random(1000, 9000)) .. 'error'
			newToggle.Text = newText
		end
		return actions
	end
	function Elements:AddDropdown(config)
		local actions = {}
		config.Options = config.Options or {}
		config.Text = config.Text or 'Error'
		config.Callback = config.Callback or function() end
		local newDropdown = Dropdown:Clone()
		newDropdown.Name = name
		newDropdown.Text = '  ' .. config.Text
		newDropdown.Parent = TabsHolder
		newDropdown.OptionsHolder.Visible = false
		local UIS = game:GetService('UserInputService')
		UIS.InputBegan:Connect(function(input, gpe)
			if (input.UserInputType == Enum.UserInputType.MouseButton1) then
				if (newDropdown:FindFirstChild('OptionsHolder') ~= nil) then
					if (newDropdown.OptionsHolder.Visible == true) then
						task.wait(0.2)
						newDropdown.OptionsHolder.Visible = false
					end
				end
			end
		end)
		newDropdown.DropdownButton.MouseButton1Click:Connect(function()
			newDropdown.OptionsHolder.Visible = not newDropdown.OptionsHolder.Visible
		end)
		newDropdown.SelectedOption.MouseButton1Click:Connect(function()
			newDropdown.OptionsHolder.Visible = not newDropdown.OptionsHolder.Visible
		end)
		newDropdown.SelectedOption.Text = config.Options[1]
		for _, option in pairs(config.Options) do
			local optionButton = newDropdown.Option:Clone()
			optionButton.Name = option
			optionButton.Text = option
			optionButton.Parent = newDropdown.OptionsHolder
			optionButton.Visible = true
			optionButton.MouseButton1Click:Connect(function()
				newDropdown.SelectedOption.Text = option
				pcall(config.Callback, option)
			end)
		end
		function actions:Set(option)
			for _, foundOption in pairs(config.Options) do
				if (foundOption == option) then
					newDropdown.SelectedOption.Text = option
					pcall(config.Callback, option)
				end
			end
		end
		function actions:Refresh(options)
			options = options or {}
			for _, child in pairs(newDropdown.OptionsHolder:GetChildren()) do
				if (child.ClassName == 'TextButton') then
					child:Destroy()
				end
			end
			config.Options = options
			newDropdown.SelectedOption.Text = config.Options[1]
			for _, option in pairs(config.Options) do
				local optionButton = newDropdown.Option:Clone()
				optionButton.Name = option
				optionButton.Text = option
				optionButton.Parent = newDropdown.OptionsHolder
				optionButton.Visible = true
				optionButton.MouseButton1Click:Connect(function()
					newDropdown.SelectedOption.Text = option
					pcall(config.Callback, option)
				end)
			end
		end
		function actions:NewText(newText)
			newText = newText or tostring(math.random(1000, 9000)) .. 'error'
			newDropdown.Text = newText
		end
		return actions
	end
	function Elements:AddBind(config)
		local actions = {}
		config.Callback = config.Callback or function() end
		config.Text = config.Text or tostring(math.random(1000, 9000)) .. 'error'
		config.Keybind = config.KeyBind or Enum.KeyCode.E
		local newKeybind = Keybind:Clone()
		newKeybind.Name = name
		newKeybind.Text = '  ' .. config.Text
		newKeybind.Parent = TabsHolder
		newKeybind.Visible = false
		function getKey(enumKey)
			local split = tostring(enumKey):split('.')
			for num, key in pairs(split) do
				if (num == 3) then
					return key
				end
			end
		end
		local selectingKey = false
		if (newKeybind:FindFirstChild('SelectedKey')) then
			newKeybind.SelectedKey.Text = getKey(config.Keybind)
		end
		local UIS = game:GetService('UserInputService')
		UIS.InputBegan:Connect(function(input, gpe)
			if (input.UserInputType == Enum.UserInputType.Keyboard) then
				if (input.KeyCode == config.Keybind) then
					pcall(config.Callback)
				end
				if (selectingKey == true) then
					selectingKey = false
					config.Keybind = input.KeyCode
					if (newKeybind:FindFirstChild('SelectedKey')) then
						newKeybind.SelectedKey.Text = getKey(config.Keybind)
					end
				end
			end
		end)
		newKeybind.SelectedKey.MouseButton1Click:Connect(function()
			if (newKeybind:FindFirstChild('SelectedKey')) then
				newKeybind.SelectedKey.Text = '...'
				selectingKey = true
			end
		end)
		function actions:Set(bind)
			bind = bind or config.Keybind
			config.Keybind = bind
			if (newKeybind:FindFirstChild('SelectedKey')) then
				newKeybind.SelectedKey.Text = getKey(config.Keybind)
			end
		end
		function actions:NewText(newText)
			newText = newText or tostring(math.random(1000, 9000)) .. 'error'
			newKeybind.Text = newText
		end
		return actions
	end
	function Elements:AddSlider(config)
		config.Callback = config.Callback or function() end
		config.Text = config.Text or tostring(math.random(1000, 9000)) .. 'error'
		config.ValueName = config.ValueName or tostring(math.random(1000, 9000)) .. 'error'
		config.Default = config.Default or 1
		config.Min = config.Min or 1
		config.Max = config.Max or 1
		config.Increment = config.Increment or 1
		local SliderConfig = config
		local newSlider = Slider:Clone()
		newSlider.Parent = TabsHolder
		newSlider.Name = name
		newSlider.Title.Text = config.Text
		local SliderBar = newSlider.SliderBackground
		local UserInputService = game:GetService('UserInputService')
		local SliderConfig = {
			Min = 1,
			Max = 10,
			Increment = 1,
			ValueName = 'WalkSpeed'
		}
		function Round(Number, Factor)
			local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
			if Result < 0 then Result = Result + Factor end
			return Result
		end
		local SliderDrag = newSlider.SliderBackground.Slider
		local TweenService = game:GetService('TweenService')
		local Slider = {}
		SliderBar.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
				Dragging = true 
			end 
		end)
		SliderBar.InputEnded:Connect(function(Input) 
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
				Dragging = false 
			end 
		end)
		
		UserInputService.InputChanged:Connect(function(Input)
			if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
				local SizeScale = math.clamp((Input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
				Slider:Set(SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale))
			end
		end)
		local lastValue = 0
		function Slider:Set(Value)		
			self.Value = math.clamp(Round(Value, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
			TweenService:Create(SliderDrag,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.fromScale((self.Value - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min), 1)}):Play()
			newSlider.SliderBackground.Title.Text = tostring(self.Value) .. ' ' .. SliderConfig.ValueName
			if (self.Value ~= lastValue) then
				lastValue = self.Value
				pcall(config.Callback, self.Value)
			end
		end
		function Slider:NewText(newText)
			newText = newText or tostring(math.random(1000, 9000)) .. 'error'
			newSlider.Title.Text = newText
		end
		return Slider
	end
	function Elements:AddClock(config)
		local actions = {}
		config.Callback = config.Callback or function() end
		local doClock = true
		spawn(function()
			while task.wait(1) do
				if (doClock == true) then
					Clock.Text = os.date('%X') .. ' ' .. os.date('%d') .. '.' .. os.date('%m') .. '.' .. os.date('%Y')
				end
			end
		end)
		function actions:Set(state)
			state = state or false
			doClock = state
		end
		return actions
	end
	return Elements
end
return module
