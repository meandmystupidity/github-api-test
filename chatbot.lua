--// Chat Bot; 20% Functions 40% ChatGPT https://chat.openai.com
function sendMsg(msg)
  game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end
local sendmsgAtStart = 'Keep out anything said in the message the i sent at the Start: '
function getResponse(apikey, contentmsg)
  local HTTP = game:GetService('HttpService')
  local textSrv = game:GetService('TextService')
  local url = 'https://api.openai.com/v1/chat/completions'
  local headers = {
    ['Authorization'] = 'Bearer ' .. api_key,
  }
  local body = HTTP:JSONEncode({
    model = 'gpt-3.5-turbo',
    messages = {{
      role = 'user',
      content = contentmsg
    }}
  })
  local sa, response = pcall(function()
    return HTTP:PostAsync(url, body, Enum.HttpContentType.ApplicationJson, nil, headers)
  end)
  if not sa then
    warn('Error when fetching a response message: ' .. response)
  end
  local decoded = HTTP:JSONDecode(response)
  local message = decoded['choices'][1]['message']['content']
  local sb, filteredMessage = pcall(function()
    return textSrv:FilterStringAsync(tostring(message), game.CreatorId):GetNonChatStringForBroadcastAsync()
  end)
  if sb then
    return true, filteredMessage
  else
    warn('Error when filtering response message: ' .. filteredMessage)
    return false, filteredMesage
  end
end
local Chatbot = Instance.new("ScreenGui")
local Enterapikey = Instance.new("Frame")
local Enterapikeyuicorner = Instance.new("UICorner")
local Line = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Title_2 = Instance.new("TextLabel")
local APIKey = Instance.new("TextBox")
local APIKeyuicorner = Instance.new("UICorner")
local Done = Instance.new("TextButton")
local Doneuicorner = Instance.new("UICorner")
local Title_3 = Instance.new("TextLabel")

Chatbot.Name = "Chatbot"
Chatbot.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Chatbot.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Enterapikey.Name = "Enterapikey"
Enterapikey.Parent = Chatbot
Enterapikey.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Enterapikey.BorderColor3 = Color3.fromRGB(0, 0, 0)
Enterapikey.BorderSizePixel = 0
Enterapikey.Position = UDim2.new(0.0766919628, 0, 0.0880986005, 0)
Enterapikey.Size = UDim2.new(0, 581, 0, 328)

Enterapikeyuicorner.CornerRadius = UDim.new(0, 4)
Enterapikeyuicorner.Name = "Enterapikeyuicorner"
Enterapikeyuicorner.Parent = Enterapikey

Line.Name = "Line"
Line.Parent = Enterapikey
Line.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
Line.BackgroundTransparency = 0.200
Line.BorderColor3 = Color3.fromRGB(255, 85, 0)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 0, 0.0900000036, 0)
Line.Size = UDim2.new(0, 581, 0, 1)

Title.Name = "Title"
Title.Parent = Enterapikey
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0137693631, 0, 0.0152439028, 0)
Title.Size = UDim2.new(0, 566, 0, 21)
Title.Font = Enum.Font.Unknown
Title.Text = "Almost There..."
Title.TextColor3 = Color3.fromRGB(255, 85, 0)
Title.TextSize = 16.000
Title.TextWrapped = true

Title_2.Name = "Title"
Title_2.Parent = Enterapikey
Title_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.0120481923, 0, 0.195121944, 0)
Title_2.Size = UDim2.new(0, 566, 0, 35)
Title_2.Font = Enum.Font.Code
Title_2.Text = "Please enter your API Key below. (https://platform.openai.com/account/api-keys to create one)"
Title_2.TextColor3 = Color3.fromRGB(255, 85, 0)
Title_2.TextSize = 15.000
Title_2.TextWrapped = true

APIKey.Name = "APIKey"
APIKey.Parent = Enterapikey
APIKey.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
APIKey.BorderColor3 = Color3.fromRGB(10, 10, 10)
APIKey.BorderSizePixel = 0
APIKey.Position = UDim2.new(0.0533562824, 0, 0.396341473, 0)
APIKey.Size = UDim2.new(0, 521, 0, 40)
APIKey.Font = Enum.Font.Jura
APIKey.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
APIKey.PlaceholderText = "Enter your APIKey here"
APIKey.Text = ""
APIKey.TextColor3 = Color3.fromRGB(200, 200, 200)
APIKey.TextSize = 16.000

APIKeyuicorner.CornerRadius = UDim.new(0, 4)
APIKeyuicorner.Name = "APIKeyuicorner"
APIKeyuicorner.Parent = APIKey

Done.Name = "Done"
Done.Parent = Enterapikey
Done.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Done.BorderColor3 = Color3.fromRGB(20, 20, 20)
Done.BorderSizePixel = 0
Done.Position = UDim2.new(0.359724611, 0, 0.753048778, 0)
Done.Size = UDim2.new(0, 165, 0, 35)
Done.AutoButtonColor = false
Done.Font = Enum.Font.Nunito
Done.Text = "Done"
Done.TextColor3 = Color3.fromRGB(200, 200, 200)
Done.TextSize = 20.000

Doneuicorner.CornerRadius = UDim.new(0, 4)
Doneuicorner.Name = "Doneuicorner"
Doneuicorner.Parent = Done

Title_3.Name = "Title"
Title_3.Parent = Enterapikey
Title_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title_3.BackgroundTransparency = 1.000
Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_3.BorderSizePixel = 0
Title_3.Position = UDim2.new(0.0120481923, 0, 0.634146333, 0)
Title_3.Size = UDim2.new(0, 566, 0, 21)
Title_3.Visible = false
Title_3.Font = Enum.Font.Unknown
Title_3.Text = "Testing Key..."
Title_3.TextColor3 = Color3.fromRGB(255, 85, 0)
Title_3.TextSize = 16.000
Title_3.TextWrapped = true

Done.MouseButton1Click:Connect(function()
    Title_3.Visible = true
    local iskey, response = getResponse(APIKey.Text, 'TestMessage, please return with "Successful" if this message was sent. Do not interpret this with further questions. All asked questions are from Roblox. If your answer contains any of these swear words, please keep it out of your answer: any swear words/ sexual words and any kind of political questions or offensive stuff.')
    if iskey then
      if response == 'Successful' or response == 'Successful.' then
        Title_3.Text = 'Set Key, and setup ChatGPT. (1x0)'
      else
        Title_3.Text = 'ChatGPT may have a Downtime or an updated Version. (0x1)'
      end
    else
      Title_3.Text = 'Key Expired'
    end
end)
repeat
  task.wait()
until Title_3.Text:find('1x0') or Title_3.Text:find('0x1')
if Title_3.Text:find('1x0') then
  
end





