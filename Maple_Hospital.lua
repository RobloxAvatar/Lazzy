local h_request = request or http_request or syn.request

local function random_joke()
    local response = h_request({
        Url = "https://api.api-ninjas.com/v1/dadjokes?limit=1",
        Method = "GET",
        Headers = {
            ["X-Api-Key"] = "0yUOXZCHip1vqfAZ0M5FbQ==OwXAq32Zbw8QfGOH"
        }
    })
    local decoded_data = game:GetService("HttpService"):JSONDecode(response.Body)
    for i,v in pairs(decoded_data) do
        for i2,v2 in pairs(v) do
            return v2
        end
    end
end

local function getDaycareBoard()
    for i,v in pairs(workspace:GetChildren()) do
        if v.Name == "Whiteboard" then
            if v.Main.BrickColor == BrickColor.new("Bright green") then
                return v
            end
        end
    end
end

local function updateWhiteboard(text)
    local args = {
        [1] = text,
        [2] = getDaycareBoard()
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Whiteboard"):FireServer(unpack(args))
end

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Lazzy/main/Arrayfield.lua"))()

local function notify(title, content, duration)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = duration,
        Image = 4483362458,
        Actions = {
            Ignore = {
            Name = "Okay!",
            Callback = function()
                print("Notfied!")
            end
            },
        },
    })
end

local Window = Rayfield:CreateWindow({
   Name = "Lazzy",
   LoadingTitle = "Lazzy",
   LoadingSubtitle = "by Lazzy",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "Lazzy",
      FileName = "Configuration"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "IDK",
      Subtitle = "Key System",
      Note = "nuh",
      FileName = "??",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = "Hello"
   }
})

local Main = Window:CreateTab("Main", 13014546637)

getgenv().waitTime = 2.5
getgenv().randomJokeLoop = false

local JokesWithPerson = Main:CreateButton({
   Name = "Introducing yourself about telling jokes",
   Callback = function()
        updateWhiteboard("hello im, " .. game.Players.LocalPlayer.Name .. " and im gonna tell some jokes!")
   end,
})

local RandomJoke = Main:CreateButton({
   Name = "Random Joke On Board",
   Callback = function()
        updateWhiteboard(random_joke())
   end,
})

local RandomText = Main:CreateToggle({
   Name = "Loop Random Text",
   CurrentValue = false,
   Flag = "LooprandomText",
   Callback = function(Value)
        getgenv().randomJokeLoop = Value
   end,
})

local WaitTime = Main:CreateSlider({
   Name = "Wait Time",
   Range = {2.5, 50},
   Increment = 0.25,
   Suffix = "WaitTime",
   CurrentValue = getgenv().waitTime,
   Flag = "WaitTime",
   Callback = function(time)
        getgenv().waitTime = time
   end,
})

spawn(function()
    while task.wait(getgenv().waitTime) do
        if getgenv().randomJokeLoop then
            pcall(function()
                updateWhiteboard(random_joke())
            end)
        end
    end
end)
