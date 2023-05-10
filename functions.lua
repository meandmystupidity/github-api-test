--// synapse x change the function rprint to something else and it should work for everyone who does not have synapse x
--// might not work for v3
local lag = false
function rprint(colour, message)
  rconsoleprint('@@' .. colour:upper() .. '@@')
  rconsoleprint(message)
end
if not rconsoleprint then
  game.GetService('Players').LocalPlayer:Kick('https://x.synapse.to')
end
rconsolename('Roblox Game Functions')
local normal_game_stuff = {}
local scripts = {}
local quarantine = {}
rprint('yellow', 'Scanning Game...')
function protectfromlag(reinforced)
  if reinforced then
    local savedpos = nil
    local newpart = Instance.new('Part', workspace)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
    newpart.Size = Vector3.new(1000, 1000, 1000)
    newpart.Position = game.Players.LocalPlayer.Character.Head.CFrame + Vector3.new(1000, 1000, 1000)
    savedpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.Position = newpart.Position + Vector3.new(0, 20, 0)
    while task.wait() do
      if not lag then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedpos
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        newpart:Destroy()
      end
    end
  else
    local Holder = Instance.new('ScreenGui', game.CoreGui)
    local lagprotection = Instance.new('Frame', Holder)
    lagprotection.Size = UDim2.new(1000, 1000, 1000, 1000)
    lagprotection.BackGroundColor3 = Color3.fromRGB(0, 0, 0)
    lag = true
    while task.wait() do
      if not lag then
        Holder:Destroy()
      end
    end
  end
end
protectfromlag(false)
for _, object in pairs(game:GetDescendants()) do
  if object.Name:lower():find('anti') or object.Name:lower():find('cheat') then
    object.Enabled = false
    table.insert(quarantine, object)
    for _, v in pairs(object:GetDescendants()) do
      v.Enabled = false
      table.insert(quarantine, v)
    end
  elseif object:IsA('Script') or object.ClassName == 'Script' then
    table.insert(scripts, object)
  elseif object:IsA('LocalScript') or object.ClassName == 'LocalScript' then
    table.insert(scripts, object)
  else
    table.insert(normal_game_stuff, object)
  end
end
lag = false
rprint('green', 'Successfully checked game. Here is what the System found: Normal Game Stuff: ' .. table.unpack(normal_game_stuff) .. '\n\n - Scripts: ' .. table.unpack(scripts) .. '\n\n - Here is what the System put in quarantine: ') .. table.unpack(quarantine)
if messagebox('Do you want to also check Scripts for disguised AntiCheat Scripts?', 'Finer Scan', 1) == 1 then
  protectfromlag(false)
  for pos, object in pairs(scripts) do
    local content = decompile(object)
    if content:lower():find('player:kick') then
      object:Destroy()
      table.remove(scripts, pos)
    elseif content:lower():find('walkspeed >') or content:lower():find('jumppower >') then
      object:Destroy()
      table.remove(scripts, pos)
    elseif content:lower():find('walkspeed <') or content:lower():find('jumppower <') then
      object:Destroy()
      table.remove(scripts, pos)
    end
  end
end
rprint('green', 'Please Note that this scan may not be completely useful but it sure is better. This will soon be integrated into the normal startup section.')
task.wait(4)
rconsoleclear()
rprint('green', 'You are ready! The System will run in the background for optimized gameplay. More functions will be coming soon.')
local RS = game:GetService("RunService")
local frames = 0
RS.RenderStepped:Connect(function()
	frames = frames + 1
end)
--// textures are syncronized to parts
local parts = {}
local textures = {}
local materials = {}
function removetextures()
  protectfromlag(true)
  local success, msg = pcall(function()
      for _, object in pairs(game:GetDescendants()) do
        if object:IsA('Part') and object.ClassName == 'Part' then
          table.insert(materials, object.Material)
          object.Material = Enum.Material.SmoothPlastic
          for num, texture in pairs(object:GetDescendants()) do
            if texture:IsA('Texture') and texture.ClassName == 'Texture' then
              table.insert(parts, texture.Parent)
              table.insert(textures, texture:Clone())
              texture.Parent = game.ReplicatedStorage
            end
          end
        end
      end
  end)
  if success then
    return true
  else
    return false
  end
end
function restoretextures()
  for num, part in pairs(parts) do
    local success, msg = pcall(function()
        part.Material = materials[num]
    end)
    local success2, msg2 = pcall(function()
        textures[num].Parent = part
    end)
  end
  if success and success2 then
    return true
  else
    return false
  end
end
for _, player in pairs(game.Players:GetPlayers()) do
  if player ~= game.Players.LocalPlayer then
    local playerchar = player.Character
    for _, part in pairs(playerchar) do
      if part:IsA('MeshPart') and part.ClassName == 'MeshPart' then
        local newpart = Instance.new('Part', playerchar)
        newpart.Name = part.Name
        newpart.Material = Enum.Material.SmoothPlastic
        newpart.Size = part.Size
        while task.wait() do
          newpart.Position = part.Position
        end
        part.Transparency = 1
      end
    end
  end
end
game.Players.PlayerAdded:Connect(function(player)
  if player ~= game.Players.LocalPlayer then
    local playerchar = player.Character
    for _, part in pairs(playerchar) do
      if part:IsA('MeshPart') and part.ClassName == 'MeshPart' then
        local newpart = Instance.new('Part', playerchar)
        newpart.Name = part.Name
        newpart.Material = Enum.Material.SmoothPlastic
        newpart.Size = part.Size
        while task.wait() do
          newpart.Position = part.Position
        end
        part.Transparency = 1
      end
    end
  end
end)
local removedtextures = false
while wait(1) do
  if frames < 10 then
    if not removedtextures then
      if removetextures() then
        rprint('green', 'Successfully removed textures')
      end
      removedtextures = true
    end
  end
  if frames > 10 then
    if removedtextures then
      removedtextures = false
      if restoretextures() then
        rprint('green', 'Successfully restored textures')
      end
    end
  end
	frames = 0
end












