if (isfile('Doggos Vibe Hugs Destroyer')) then
	delfile('Doggos Vibe Hugs Destroyer')
end
if (isfolder('doggosstuff') == false) then
	makefolder('doggosstuff')
	if (isfolder('doggosstuff/vibehugs') == false) then
		makefolder('doggosstuff/vibehugs')
	end
end
local httprequest = request or syn.request
local player = game.Players.LocalPlayer
local char = player.Character or player:WaitForChild('Character')
local Orion = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = Orion:MakeWindow({Name = 'Doggos Vibe Hugs Destroyer', HidePremium = false, SaveConfig = true, ConfigFolder = nil})
if (isfile('Doggos Vibe Hugs Destroyer')) then
	delfile('Doggos Vibe Hugs Destroyer')
end
function loadChar()
	char = player.Character or player:WaitForChild('Character')
	Orion:MakeNotification({
		Name = 'Information',
		Content = 'Could not find the Character; Please try again.',
		Image = 'rbxassetid://4483345998',
		Time = 6
	})
end
function getAllCurrentPlayers()
	local plrs = {}
	for _, possiblePlayer in pairs(game.Players:GetPlayers()) do
		if (possiblePlayer ~= player) then
			table.insert(plrs, possiblePlayer.DisplayName)
		end
	end
	return plrs
end
function Notify(title, msg)
	Orion:MakeNotification({
		Name = title,
		Content = msg,
		Image = 'rbxassetid://4483345998',
		Time = 6
	})
end
-- function newTab(name)
--  	local Tab = Window:MakeTab({
--		Name = name,
--		Icon = 'rbxassetid://4483345998',
--		PremiumOnly = false
--	})
--	return Tab
-- end
-- function newSection(tab, name)
--	local Section = tab:AddSection({
--		Name = name
--	})
--	return Section
-- end
local UniversalTab = Window:MakeTab({
	Name = 'Universal',
	Icon = 'rbxassetid://4483345998',
	PremiumOnly = false
})
local ESPSelectedPlayer = ''
local ESPOnePlayerOnly = false
local ESPColour = Color3.fromRGB(200, 126, 84)
local ESPSize = 12
local ESP = false
local doNoclip = false
spawn(function()
	while task.wait() do
		if (doNoclip == true) then
			if (char ~= nil) then
				for _, part in pairs(char:GetChildren()) do
					local success, msg = pcall(function()
						part.CanCollide = false
					end)
				end
			else
				loadChar()
			end
		else
			if (char ~= nil) then
				for _, part in pairs(char:GetChildren()) do
					local success, msg = pcall(function()
						part.CanCollide = true
					end)
				end
			else
				loadChar()
			end
		end
		if (ESP == true) then
			for _, plr in pairs(game.Players:GetPlayers()) do
				local success, msg = pcall(function()
					if (plr ~= player) and (ESPOnePlayerOnly == false) then
						if (plr.Character.Head:FindFirstChild('DoggosESP') ~= nil) then
							plr.Character.Head.DoggosESP:Destroy()
						end
						local Magnitude = (plr.Character.Head.Position - char.Head.Position).Magnitude
						local DoggosESP = Instance.new('BillboardGui')
						local Title = Instance.new('TextLabel')
						
						DoggosESP.Name = 'DoggosESP'
						DoggosESP.Parent = plr.Character.Head
						DoggosESP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
						DoggosESP.Active = true
						DoggosESP.AlwaysOnTop = true
						DoggosESP.LightInfluence = 1.000
						DoggosESP.Size = UDim2.new(0, 200, 0, 50)
						
						Title.Name = 'Title'
						Title.Parent = DoggosESP
						Title.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
						Title.BackgroundTransparency = 1.000
						Title.BorderColor3 = Color3.fromRGB(9, 9, 9)
						Title.BorderSizePixel = 0
						Title.Size = UDim2.new(0, 200, 0, 50)
						Title.Font = Enum.Font.Code
						Title.Text = plr.Name .. ' | ' .. plr.DisplayName .. ' | ' .. math.floor(Magnitude) .. ' Studs'
						Title.TextColor3 = ESPColour
						Title.TextSize = ESPSize
					elseif (plr ~= player) and (ESPOnePlayerOnly == true) and (plr.DisplayName == ESPSelectedPlayer) then
						if (plr.Character.Head:FindFirstChild('DoggosESP') ~= nil) then
							plr.Character.Head.DoggosESP:Destroy()
						end
						local Magnitude = (plr.Character.Head.Position - char.Head.Position).Magnitude
						local DoggosESP = Instance.new('BillboardGui')
						local Title = Instance.new('TextLabel')
						
						DoggosESP.Name = 'DoggosESP'
						DoggosESP.Parent = plr.Character.Head
						DoggosESP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
						DoggosESP.Active = true
						DoggosESP.AlwaysOnTop = true
						DoggosESP.LightInfluence = 1.000
						DoggosESP.Size = UDim2.new(0, 200, 0, 50)
						
						Title.Name = 'Title'
						Title.Parent = DoggosESP
						Title.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
						Title.BackgroundTransparency = 1.000
						Title.BorderColor3 = Color3.fromRGB(9, 9, 9)
						Title.BorderSizePixel = 0
						Title.Size = UDim2.new(0, 200, 0, 50)
						Title.Font = Enum.Font.Code
						Title.Text = plr.Name .. ' | ' .. plr.DisplayName .. ' | ' .. math.floor(Magnitude) .. ' Studs'
						Title.TextColor3 = ESPColour
						Title.TextSize = ESPSize
					elseif (plr.Character.Head:FindFirstChild('DoggosESP') ~= nil) and (plr ~= player) and (ESPOnePlayerOnly == true) and (plr.DisplayName ~= ESPSelectedPlayer) then
						plr.Character.Head.DoggosESP:Destroy()
					end
				end)
			end
		else
			for _, plr in pairs(game.Players:GetPlayers()) do
				local success, msg = pcall(function()
					if (plr.Character.Head:FindFirstChild('DoggosESP') ~= nil) then
						plr.Character.Head.DoggosESP:Destroy()
					end
				end)
			end
		end
	end
end)
local reduceLagsEnabled = true
local currentLags = {}
function reduceLag()
	if (reduceLagsEnabled == true) then
		table.insert(currentLags, 'Lag' .. #currentLags)
		local num = #currentLags
		spawn(function()
			local newGui = Instance.new('ScreenGui', game.Players.LocalPlayer.PlayerGui)
			local newFrame = Instance.new('Frame', newGui)
			newFrame.Size = UDim2.new(9e9, 0, 9e9, 0)
			newFrame.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
			newFrame.BorderColor3 = Color3.fromRGB(9, 9, 9)
			repeat
				task.wait()
			until currentLags[num] ~= 'Lag' .. tostring(num -1)
			newGui:Destroy()
		end)
		return num
	end
end
local BodySection = UniversalTab:AddSection({
	Name = 'Body'
})
local noclipToggle = UniversalTab:AddToggle({
	Name = 'Noclip',
	Default = false,
	Callback = function(onoff)
		doNoclip = onoff
	end   
})
UniversalTab:AddBind({
	Name = 'Noclip KeyBind',
	Default = Enum.KeyCode.R,
	Hold = false,
	Callback = function()
		doNoclip = not doNoclip
		noclipToggle:Set(doNoclip)
	end    
})
function serverHop()
	local gameId = game.PlaceId
	local servers = {}
	local req = httprequest({
		Url = 'https://games.roblox.com/v1/games/' .. gameId .. '/servers/Public?sortOrder=Desc&limit=100'
	})
	local body = game:GetService('HttpService'):JSONDecode(req.Body)
	if body and body.data then
		for i, v in next, body.data do
			if type(v) == 'table' and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.playing > 19 then
				table.insert(servers, 1, v.id)
			end
		end
	end
	if #servers > 0 then
		game:GetService('TeleportService'):TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], player)
	end
	game:GetService('TeleportService').TeleportInitFailed:Connect(function()
		game:GetService('TeleportService'):TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], player)
	end)
end
UniversalTab:AddButton({
	Name = 'Switch Servers',
	Callback = function()
      	serverHop()
  	end    
})
UniversalTab:AddButton({
	Name = 'Rejoin Server',
	Callback = function()
      	game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId)
  	end    
})
function IS(num)
	local max = 200 + num
	if (char.Humanoid.WalkSpeed + num ~= max) then
		char.Humanoid.WalkSpeed = char.Humanoid.WalkSpeed +num
	end
end
function DS(num)
	local min = 16 - num
	if (char.Humanoid.WalkSpeed - num ~= min) then
		char.Humanoid.WalkSpeed = char.Humanoid.WalkSpeed -num
	end
end
function IJ(num)
	local max = 606
	if (char.Humanoid.JumpPower + num ~= max) then
		char.Humanoid.JumpPower = char.Humanoid.JumpPower +num
	end
end
function DJ(num)
	local min = 44
	if (char.Humanoid.JumpPower - num ~= min) then
		char.Humanoid.JumpPower = char.Humanoid.JumpPower -num
	end
end
--// IS: 12.5
--// IJ: 12
UniversalTab:AddSlider({
	Name = 'WalkSpeed',
	Min = 16,
	Max = 200,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = 'Change WalkSpeed',
	Callback = function(speed)
		char.Humanoid.WalkSpeed = speed
	end    
})
UniversalTab:AddSlider({
	Name = 'WalkSpeed',
	Min = 50,
	Max = 600,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = 'Change JumpPower',
	Callback = function(power)
		char.Humanoid.JumpPower = power
	end    
})
UniversalTab:AddBind({
	Name = 'Increase WalkSpeed Keybind',
	Default = Enum.KeyCode.Home,
	Hold = false,
	Callback = function()
		IS(12.5)
	end    
})
UniversalTab:AddBind({
	Name = 'Decrease WalkSpeed Keybind',
	Default = Enum.KeyCode.PageUp,
	Hold = false,
	Callback = function()
		DS(12.5)
	end    
})
UniversalTab:AddBind({
	Name = 'Increase JumpPower Keybind',
	Default = Enum.KeyCode.PageDown,
	Hold = false,
	Callback = function()
		IJ(12)
	end    
})
UniversalTab:AddBind({
	Name = 'Decrease JumpPower Keybind',
	Default = Enum.KeyCode.Clear,
	Hold = false,
	Callback = function()
		DJ(12)
	end    
})
local doFloat = false
UniversalTab:AddToggle({
	Name = 'Float',
	Default = false,
	Callback = function(onoff)
		if (char ~= nil) then
			if (onoff == true) then
				doFloat = true
				local newPart = Instance.new('Part', workspace)
				newPart.Name = 'Doggos_Float'
				newPart.Size = Vector3.new(9e9, 6, 9e9)
				newPart.Anchored = true
				newPart.Transparency = 1
				if (char ~= nil) then
					newPart.Position = char.LeftFoot.Position - Vector3.new(0, 2, 0)
				else
					doFloat = false
					newPart:Destroy()
					loadChar()
				end
			else
				if (workspace:FindFirstChild('Doggos_Float') ~= nil) then
					workspace.Doggos_Float:Destroy()
				else
					Notify('Information', 'Float Part could not be found.')
				end
			end
		else
			loadChar()
		end
	end    
})
UniversalTab:AddBind({
	Name = 'Float Up',
	Default = Enum.KeyCode.E,
	Hold = false,
	Callback = function()
		if (char ~= nil) then
			if (workspace:FindFirstChild('Doggos_Float') ~= nil) then
				local floatPart = workspace.Doggos_Float
				floatPart.Position = floatPart.Position + Vector3.new(0, 6, 0)
				char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 6, 0)
			else
				Notify('Information', 'Float Part could not be found.')
			end
		else
			loadChar()
		end
	end    
})
UniversalTab:AddBind({
	Name = 'Float Down',
	Default = Enum.KeyCode.Q,
	Hold = false,
	Callback = function()
		if (char ~= nil) then
			if (workspace:FindFirstChild('Doggos_Float') ~= nil) then
				local floatPart = workspace.Doggos_Float
				floatPart.Position = floatPart.Position - Vector3.new(0, 6, 0)
			else
				Notify('Information', 'Float Part could not be found.')
			end
		else
			loadChar()
		end
	end    
})
local speedLabel = UniversalTab:AddLabel('Current WalkSpeed: Loading...')
local powerLabel = UniversalTab:AddLabel('Current JumpPower: Loading...')
spawn(function()
	while task.wait(0.6) do
		if (char ~= nil) then
			speedLabel:Set('Current WalkSpeed: ' .. tostring(char.Humanoid.WalkSpeed))
			powerLabel:Set('Current JumpPower: ' .. tostring(char.Humanoid.JumpPower))
		else
			loadChar()
		end
	end
end)
local kickBypass = false
spawn(function()
	local mt = getrawmetatable(game)
	setreadonly(mt, false)
	local oldmt = mt.__namecall
	mt.__namecall = newcclosure(function(Self, ...)
		local method = getnamecallmethod()
		if (tostring(method) == 'Kick') and (kickBypass == true) then
		    print('haha bypassed')
		    return nil
		end
		return oldmt(Self, ...)
	end)
end)
local DetectionTab = Window:MakeTab({
	Name = 'Detection',
	Icon = 'rbxassetid://4483345998',
	PremiumOnly = false
})
DetectionTab:AddToggle({
	Name = 'Kick Bypass',
	Default = false,
	Callback = function(onoff)
		kickBypass = onoff
		if (onoff == true) then
			Notify('Information', 'Kick does not really work for this Game.')
		end
	end    
})
DetectionTab:AddToggle({
	Name = 'Server Switch When Mod',
	Default = false,
	Callback = function(onoff)
		if (onoff == true) then
			spawn(function()
				repeat
					task.wait()
					for _, plr in pairs(game.Players:GetPlayers()) do
						local function kickPlr(foundMod)
							kickBypass = false
							task.wait(2)
							writefile('doggostuff/vibehugs/lastPlaceId.lua', game.JobId .. '//' .. game.PlaceId)
							player:Kick('Moderator Found: ' .. plr.Name .. '; Switching Servers, last PlaceId saved to config.')
							serverHop()
						end
						if (plr:GetRoleInGroup(game.CreatorId) ~= 'Guest') then
							if (plr:GetRoleInGroup(game.CreatorId) ~= 'SUPPORTER') then
								kickPlr(plr.Name)
							end
						end
					end
				until onoff == false
				Notify('Information', 'Stopped searching for Moderators.')
			end)
		end
	end
})
local CoffeeRoomTab = Window:MakeTab({
	Name = 'Coffee Room',
	Icon = 'rbxassetid://4483345998',
	PremiumOnly = false
})
CoffeeRoomTab:AddButton({
	Name = 'Unlock Room',
	Callback = function()
		if (workspace:FindFirstChild('CRGDoor') ~= nil) and (workspace:FindFirstChild('CRGDoor2') ~= nil) then
			workspace.CRGDoor.Parent = game.ReplicatedStorage
      		workspace.CRGDoor2.Parent = game.ReplicatedStorage
      	else
      		Notify('Information', 'Room already unlocked.')
		end
  	end    
})
CoffeeRoomTab:AddButton({
	Name = 'Lock Room',
	Callback = function()
      	if (game.ReplicatedStorage:FindFirstChild('CRGDoor') ~= nil) and (game.ReplicatedStorage:FindFirstChild('CRGDoor2') ~= nil) then
      		game.ReplicatedStorage.CRGDoor.Parent = workspace
      		game.ReplicatedStorage.CRGDoor2.Parent = workspace
      	else
      		Notify('Information', 'Room already locked.')
      	end
  	end    
})
CoffeeRoomTab:AddButton({
	Name = 'Get Coffee',
	Callback = function()
		if (player.Backpack:FindFirstChild('FreshCoffee') == nil) then
      		game.ReplicatedStorage.FreshCoffee:Clone().Parent = player.Backpack
      	else
      		Notify('Information', 'You already have a Coffee.')
      	end
  	end    
})
local VibeHugsTab = Window:MakeTab({
	Name = 'Vibe Hugs',
	Icon = 'rbxassetid://4483345998',
	PremiumOnly = false
})
local AFKSection = VibeHugsTab:AddSection({
	Name = 'AFK Cheat'
})
local a = false
local n = false
function AA()
	repeat
		local args = {
		    [1] = player.UserId
		}
		game:GetService('ReplicatedStorage').afkY:FireServer(unpack(args))
		task.wait()
	until a == false
	local args = {
		[1] = player.UserId
	}
	game:GetService('ReplicatedStorage').afkN:FireServer(unpack(args))
	task.wait()
end
function NA()
	repeat
		local args = {
		    [1] = player.UserId
		}
		game:GetService('ReplicatedStorage').afkN:FireServer(unpack(args))
		task.wait()
	until n == false
end
VibeHugsTab:AddToggle({
	Name = 'Always AFK',
	Default = false,
	Callback = function(onoff)
		if (onoff == true) then
			a = true
			AA()
		else
			a = false
		end
	end    
})
VibeHugsTab:AddToggle({
	Name = 'Never AFK',
	Default = false,
	Callback = function(onoff)
		if (onoff == true) then
			n = true
			NA()
		else
			n = false
		end
	end    
})
local allChips = {
	['ROChips Classic'] = '1;A',
	['ROChips Barbecue'] = '1;B',
	['ROChips Cheddar'] = '1;C',
	['ROChips Nacho Cheese'] = '2;A',
	['ROChips Cool Ranch'] = '2;B',
	['ROChips Flaming Hot'] = '2;C',
	['ROBar Chocolate'] = '3;A',
	['ROBar Caramel'] = '3;B',
	['ROBar Peanut Butter'] = '3;C'
}
local allChipsNames = {
	'ROChips Classic',
	'ROChips Barbecue',
	'ROChips Cheddar',
	'ROChips Nacho Cheese',
	'ROChips Cool Ranch',
	'ROChips Flaming Hot',
	'ROBar Chocolate',
	'ROBar Caramel',
	'ROBar Peanut Butter'
}
local allKeys = workspace['Vending Machine'].Keypad.Buttons.Keys
local VendingSection = VibeHugsTab:AddSection({
	Name = 'Vending Machine'
})
function searchChips(spawn)
	if (char ~= nil) then
		for _, chip in pairs(workspace:GetChildren()) do
			if (chip.Name:find('ROChips')) then
				chip.Handle.Position = char.HumanoidRootPart.Position
		    end
		    if (chip.Name:find('ROBar')) then
		    	chip.Handle.Position = char.HumanoidRootPart.Position
		    end
		end
		if (spawn == true) then
			local stillSearch = true
			for _, stuff in pairs(allChips) do
	      		if (stillSearch == true) then
	      			stillSearch = false
	      			local split = stuff:split(';')
		      		for _, key in pairs(split) do
		      			fireclickdetector(allKeys[key].ClickDetector, 9e9)
		      			task.wait(0.77)
		      		end
		      		task.wait(0.07)
		      		fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
		      		task.wait(0.2)
		      		if (char ~= nil) then
		      			for _, chip in pairs(workspace:GetChildren()) do
		      				if (chip.Name:find('ROChips')) then
		      					chip.Handle.Position = char.HumanoidRootPart.Position
		      					chip.Name = 'COBBTC'
		      				end
		      				if (chip.Name:find('ROBar')) then
		      					chip.Handle.Position = char.HumanoidRootPart.Position
		      					chip.Name = 'COBBTC'
		      				end
		      			end
		      		else
		      			loadChar()
		      		end
		      		task.wait(0.6)
		      		if (char ~= nil) then
		      			for _, chip in pairs(workspace:GetChildren()) do
		      				if (chip.Name:find('ROChips')) then
		      					chip.Handle.Position = char.HumanoidRootPart.Position
		      					chip.Name = 'COBBTC'
		      				end
		      				if (chip.Name:find('ROBar')) then
		      					chip.Handle.Position = char.HumanoidRootPart.Position
		      					chip.Name = 'COBBTC'
		      				end
		      			end
		      		else
		      			loadChar()
		      		end
	      		end
	      	end
		end
	else
		loadChar()
	end
end
VibeHugsTab:AddToggle({
	Name = 'Reduce Lag',
	Default = false,
	Callback = function(onoff)
		reduceLagsEnabled = onoff
	end    
})
VibeHugsTab:AddButton({
	Name = 'Get All Chips/ Bars',
	Callback = function()
      	for _, stuff in pairs(allChips) do
      		local split = stuff:split(';')
      		for _, key in pairs(split) do
      			fireclickdetector(allKeys[key].ClickDetector, 9e9)
      			task.wait(0.7)
      		end
      		task.wait(0.07)
      		fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
      		task.wait(0.2)
      		searchChips(false)
      	end
      	searchChips(true)
  	end    
})
VibeHugsTab:AddButton({
	Name = 'Spawn All Chips/ Bars',
	Callback = function()
      	for _, stuff in pairs(allChips) do
      		local split = stuff:split(';')
      		for _, key in pairs(split) do
      			fireclickdetector(allKeys[key].ClickDetector, 9e9)
      			task.wait(0.7)
      		end
      		task.wait(0.07)
      		fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
      		task.wait(0.2)
      	end
  	end    
})
local Option = ''
VibeHugsTab:AddDropdown({
	Name = 'Select Chip/ Bar',
	Default = '1',
	Options = allChipsNames,
	Callback = function(selected)
		Option = selected
		for num, chip in pairs(allChipsNames) do
      		if (chip == Option) then
      			local split = allChips[chip]:split(';')
      			for _, key in pairs(split) do
      				fireclickdetector(allKeys[key].ClickDetector, 9e9)
      				task.wait(0.7)
      			end
      			task.wait(0.07)
      			fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
      			task.wait(0.7)
		      	for _, possibleChip in pairs(workspace:GetChildren()) do
		      		if (possibleChip.Name == chip) then
		      			possibleChip.Handle.Position = char.HumanoidRootPart.Position
		      			chip.Name = 'COBBTC'
		      		end
		      	end
      		end
      	end
	end    
})
local allPlayers = {}
for _, newPlr in pairs(game.Players:GetPlayers()) do
	table.insert(allPlayers, newPlr.Name)
end
local bringToPlayer = ''
VibeHugsTab:AddDropdown({
	Name = 'Select Player',
	Default = '1',
	Options = allPlayers,
	Callback = function(selected)
		bringToPlayer = selected
	end    
})
VibeHugsTab:AddButton({
	Name = 'Get Chip/ Bar',
	Callback = function()
      	for num, chip in pairs(allChipsNames) do
      		if (chip == Option) then
      			local split = allChips[chip]:split(';')
      			for _, key in pairs(split) do
      				fireclickdetector(allKeys[key].ClickDetector, 9e9)
      				task.wait(0.7)
      			end
      			task.wait(0.07)
      			fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
      			task.wait(0.9)
      		end
      	end
      	searchChips(true)
  	end    
})
VibeHugsTab:AddButton({
	Name = 'Spawn Chip/ Bar',
	Callback = function()
      	for num, chip in pairs(allChipsNames) do
      		if (chip == Option) then
      			local split = allChips[chip]:split(';')
      			for _, key in pairs(split) do
      				fireclickdetector(allKeys[key].ClickDetector, 9e9)
      				task.wait(0.7)
      			end
      			task.wait(0.07)
      			fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
      			task.wait(0.9)
      		end
      	end
  	end    
})
local loopAllChips = false
local loopOneChip = false
local loopBringAllChips = false
local loopBringOneChip = false
local loopBringAllChipsToPlayer = false
local loopBringOneChipToPlayer = false
local getAllSpawnedChips = false
spawn(function()
	while task.wait() do
		if (getAllSpawnedChips == true) then
			if (char ~= nil) then
				for _, chip in pairs(workspace:GetChildren()) do
					if (chip.Name:find('ROChips')) then
						chip.Handle.Position = char.HumanoidRootPart.Position
						chip.Name = 'COBBTC'
					end
					if (chip.Name:find('ROBar')) then
						chip.Handle.Position = char.HumanoidRootPart.Position
						chip.Name = 'COBBTC'
					end
				end
			else
				loadChar()
			end
		end
		if (loopAllChips == true) then
			for _, stuff in pairs(allChips) do
	      		local split = stuff:split(';')
	      		for _, key in pairs(split) do
	      			fireclickdetector(allKeys[key].ClickDetector, 9e9)
	      			task.wait(0.7)
	      		end
	      		task.wait(0.07)
	      		fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
	      		task.wait(0.4)
	      	end
		end
		if (loopOneChip == true) then
			for num, chip in pairs(allChipsNames) do
	      		if (chip == Option) then
	      			local split = allChips[Option]:split(';')
	      			for _, key in pairs(split) do
	      				fireclickdetector(allKeys[key].ClickDetector, 9e9)
	      				task.wait(0.7)
	      			end
	      			task.wait(0.07)
	      			fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
	      			task.wait(0.4)
	      		end
	      	end
		end
		if (loopBringAllChips == true) then
			for _, stuff in pairs(allChips) do
	      		local split = stuff:split(';')
	      		for _, key in pairs(split) do
	      			fireclickdetector(allKeys[key].ClickDetector, 9e9)
	      			task.wait(0.7)
	      		end
	      		task.wait(0.07)
	      		fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
	      		task.wait(0.4)
	      		searchChips(false)
	      	end
		end
		if (loopBringOneChip == true) then
			local split = allChips[Option]:split(';')
	      	for _, key in pairs(split) do
	      		fireclickdetector(allKeys[key].ClickDetector, 9e9)
	      		task.wait(0.7)
	      	end
	      	task.wait(0.07)
	      	fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
	      	task.wait(0.4)
	      	searchChips(false)
		end
		if (loopBringAllChipsToPlayer == true) then
			for _, stuff in pairs(allChips) do
	      		local split = stuff:split(';')
	      		for _, key in pairs(split) do
	      			fireclickdetector(allKeys[key].ClickDetector, 9e9)
	      			task.wait(0.7)
	      		end
	      		task.wait(0.07)
	      		fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
	      		task.wait(0.4)
	      		if (game.Players[bringToPlayer].Character ~= nil) then
			      	for _, chip in pairs(workspace:GetChildren()) do
			     		if (chip.Name:find('ROChips')) then
			     			chip.Handle.Position = game.Players[bringToPlayer].Character.HumanoidRootPart.Position
			     			chip.Name = 'COBBTC'
			     		end
			     		if (chip.Name:find('ROBar')) then
			     			chip.Handle.Position = game.Players[bringToPlayer].Character.HumanoidRootPart.Position
			     			chip.Name = 'COBBTC'
			     		end
			     	end
		     	end
	      	end
		end
		if (loopBringOneChipToPlayer == true) then
			local split = allChips[Option]:split(';')
	      	for _, key in pairs(split) do
	      		fireclickdetector(allKeys[key].ClickDetector, 9e9)
	      		task.wait(0.7)
	      	end
	      	task.wait(0.07)
	      	fireclickdetector(allKeys.Parent.Enter.ClickDetector, 9e9)
	      	task.wait(0.4)
	      	if (game.Players[bringToPlayer].Character ~= nil) then
			   for _, chip in pairs(workspace:GetChildren()) do
			  		if (chip.Name:find('ROChips')) then
			  			chip.Handle.Position = game.Players[bringToPlayer].Character.HumanoidRootPart.Position
			  			chip.Name = 'COBBTC'
			   		end
			   		if (chip.Name:find('ROBar')) then
			   			chip.Handle.Position = game.Players[bringToPlayer].Character.HumanoidRootPart.Position
			   			chip.Name = 'COBBTC'
			   		end
			   	end
		    end
		end
	end
end)
local getSpawnedChips = VibeHugsTab:AddToggle({
	Name = 'Get All Spawned Chips',
	Default = false,
	Callback = function(onoff)
		getAllSpawnedChips = onoff
	end    
})
local _1 = false
local _2 = false
local _3 = false
local _4 = false
local _5 = false
local _6 = false
VibeHugsTab:AddToggle({
	Name = 'Loop Spawn All Chips',
	Default = false,
	Callback = function(onoff)
		loopAllChips = onoff
		_1 = onoff
		if (_1 == true) then
			spawn(function()
				local num = reduceLag()
				repeat
					task.wait()
				until _1 == false
				table.remove(currentLags, num)
			end)
		end
	end    
})
VibeHugsTab:AddToggle({
	Name = 'Loop Spawn Selected Chip',
	Default = false,
	Callback = function(onoff)
		loopOneChip = onoff
		_2 = onoff
		if (_2 == true) then
			spawn(function()
				local num = reduceLag()
				repeat
					task.wait()
				until _2 == false
				table.remove(currentLags, num)
			end)
		end
	end    
})
VibeHugsTab:AddToggle({
	Name = 'Loop Bring All Chips',
	Default = false,
	Callback = function(onoff)
		loopBringAllChips = onoff
		if (onoff == true) then
			_3 = onoff
			if (_3 == true) then
				spawn(function()
					local num = reduceLag()
					repeat
						task.wait()
					until _3 == false
					table.remove(currentLags, num)
				end)
			end
			getSpawnedChips:Set(true)
			getAllSpawnedChips = true
		else
			getAllSpawnedChips = false
		end
	end    
})
VibeHugsTab:AddToggle({
	Name = 'Loop Bring Selected Chip',
	Default = false,
	Callback = function(onoff)
		loopBringOneChip = onoff
		_4 = onoff
		if (_4 == true) then
			spawn(function()
				local num = reduceLag()
				repeat
					task.wait()
				until _4 == false
				table.remove(currentLags, num)
			end)
		end
	end    
})
VibeHugsTab:AddToggle({
	Name = 'Loop Bring All Chips To Player',
	Default = false,
	Callback = function(onoff)
		loopBringAllChipsToPlayer = onoff
		_5 = onoff
		if (_5 == true) then
			spawn(function()
				local num = reduceLag()
				repeat
					task.wait()
				until _5 == false
				table.remove(currentLags, num)
			end)
		end
	end    
})
VibeHugsTab:AddToggle({
	Name = 'Loop Bring Selected Chip To Player',
	Default = false,
	Callback = function(onoff)
		loopBringOneChipToPlayer = onoff
		_6 = onoff
		if (_6 == true) then
			spawn(function()
				local num = reduceLag()
				repeat
					task.wait()
				until _6 == false
				table.remove(currentLags, num)
			end)
		end
	end    
})
function getPlayersFromName(PlrName)
	PlrName = PlrName:lower()
	local playersFound = {}
	for _, plrFound in pairs(game.Players:GetPlayers()) do
		if (plrFound.DisplayName:lower():sub(1, PlrName:len()) == PlrName) then
			table.insert(playersFound, plrFound)
		end
	end
	return playersFound
end
local ESPTab = Window:MakeTab({
	Name = 'ESP',
	Icon = 'rbxassetid://4483345998',
	PremiumOnly = false
})
local ESPToggle = ESPTab:AddToggle({
	Name = 'ESP',
	Default = false,
	Callback = function(onoff)
		ESP = onoff
	end   
})
local ESPSizeSlider = ESPTab:AddSlider({
	Name = 'ESP Size',
	Min = 12,
	Max = 60,
	Default = 9,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = 'Text Size (Default: 12)',
	Callback = function(size)
		ESPSize = size
		if (ESP == true) then
			ESP = false
			ESP = true
		end
	end    
})
local ESPColourPicker = ESPTab:AddColorpicker({
	Name = 'ESP Colour/ Color',
	Default = Color3.fromRGB(200, 126, 84),
	Callback = function(colour)
		ESPColour = colour
		if (ESP == true) then
			ESP = false
      		ESP = true
		end
	end	  
})
ESPTab:AddButton({
	Name = 'Reset Colour',
	Callback = function()
      	ESPColour = Color3.fromRGB(200, 126, 84)
      	ESPColourPicker:Set(Color3.fromRGB(200, 126, 84))
      	if (ESP == true) then
      		ESP = false
      		ESP = true
      	end
  	end    
})
ESPTab:AddButton({
	Name = 'Reset Size',
	Callback = function()
      	ESPSize = 12
      	ESPSizeSlider:Set(12)
      	if (ESP == true) then
      		ESP = false
      		ESP = true
      	end
  	end    
})
ESPTab:AddToggle({
	Name = 'One Player ESP',
	Default = false,
	Callback = function(onoff)
		ESPOnePlayerOnly = onoff
	end   
})
local ShowSelectedPlayer = ESPTab:AddLabel('Selected Player: Loading...')
local ESPPlayerDropdown = ESPTab:AddDropdown({
	Name = 'Select Player',
	Default = '1',
	Options = getAllCurrentPlayers(),
	Callback = function(selected)
		ESPSelectedPlayer = selected
	end
})
ESPTab:AddTextbox({
	Name = 'Enter Player Name Manually',
	Default = 'Enter Display Name',
	TextDisappear = true,
	Callback = function(plrname)
		local err = {isErr = false, errMsg = ''}
		local gotActual = getPlayersFromName(plrname)
		if (err.isErr == false) then
			if (#gotActual == 1) then
				ShowSelectedPlayer:Set('Selected Player: ' .. gotActual[1].Name .. ' | ' .. gotActual[1].DisplayName .. ' | ' .. gotActual[1].UserId)
				ESPSelectedPlayer = gotActual[1].DisplayName
				ESPPlayerDropdown:Set(gotActual.DisplayName)
			else
				ShowSelectedPlayer:Set('Error: Found 2 or more players/ Found no player.')
			end
		else
			ShowSelectedPlayer:Set('Error: ' .. err.errMsg)
		end
	end	  
})
local TeleportationTab = Window:MakeTab({
	Name = 'Teleportation',
	Icon = 'rbxassetid://4483345998',
	PremiumOnly = false
})
local ShowSelectedPlayerTeleportation = TeleportationTab:AddLabel('Selected Player: Loading...')
local TeleportationPlayerDropdown = TeleportationTab:AddDropdown({
	Name = 'Select Player',
	Default = '1',
	Options = getAllCurrentPlayers(),
	Callback = function(selected)
		if (char ~= nil) then
			for _, newPlr in pairs(game.Players:GetPlayers()) do
				if (newPlr.DisplayName == selected) then
					char.HumanoidRootPart.Position = newPlr.Character.HumanoidRootPart.Position
				end
			end
		else
			loadChar()
		end
	end
})
TeleportationTab:AddTextbox({
	Name = 'Enter Player Name Manually',
	Default = 'Enter Display Name',
	TextDisappear = true,
	Callback = function(plrname)
		local err = {isErr = false, errMsg = ''}
		local gotActual = getPlayersFromName(plrname)
		if (err.isErr == false) then
			if (#gotActual == 1) then
				if (char ~= nil) then
					char.HumanoidRootPart.Position = gotActual[1].Character.HumanoidRootPart.Position
				else
					loadChar()
				end
			else
				ShowSelectedPlayerTeleportation:Set('Error: Found 2 or more players/ Found no player.')
			end
		else
			ShowSelectedPlayerTeleportation:Set('Error: ' .. err.errMsg)
		end
	end	  
})
game.Players.ChildRemoved:Connect(function(child)
	if (child.ClassName == 'Player') then
		ESPPlayerDropdown:Refresh(getAllCurrentPlayers(), true)
	end
end)
Orion:Init()
