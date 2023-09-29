local h_request = request or http_request or syn.request

local function random_word()
    local response = h_request({
        Url = "https://random-word-api.herokuapp.com/word",
        Method = "GET"
    })
    split1 = string.split(response.Body, "[")
    split2 = string.split(split1[2], "]")
    split3 = string.split(split2[1], '"')
    return split3[2]
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

getgenv().waitTime = 0.25
getgenv().randomTextLoop = false

local TextonBoard = Main:CreateButton({
   Name = "Random Text On Board",
   Callback = function()
        updateWhiteboard(random_word())
   end,
})

local RandomText = Main:CreateToggle({
   Name = "Loop Random Text",
   CurrentValue = false,
   Flag = "LooprandomText",
   Callback = function(Value)
        getgenv().randomTextLoop = Value
   end,
})

local WaitTime = Main:CreateSlider({
   Name = "Wait Time",
   Range = {0.25, 50},
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
        if getgenv().randomTextLoop then
            pcall(function()
                updateWhiteboard(random_word())
            end)
        end
    end
end)
