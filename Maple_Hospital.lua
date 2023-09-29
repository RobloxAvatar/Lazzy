local h_request = request or http_request or syn.request

local function generate_joke()
    local response = h_request({
        Url = "http://api.apekool.nl/services/jokes/getjoke.php?type=nl",
        Method = "GET"
    })
    return response.Body
end

local function gen_joke()
    local joke = generate_joke()
    local decoded_joke = game:GetService("HttpService"):JSONDecode(joke)
    local joke_len = string.len(decoded_joke["joke"])

    repeat 
        wait(0.1)
        joke = generate_joke()
        decoded_joke = game:GetService("HttpService"):JSONDecode(joke)
    until string.find(joke, "?") and joke_len < 80

    return decoded_joke
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

getgenv().waitTime = 8.5

local TellJoke = Main:CreateButton({
   Name = "Tell Joke",
   Callback = function()
        notify("Lazzy", "telling joke on whiteboard!", 3)

        local ac_joke = gen_joke()

        local spl = string.split(ac_joke["joke"], "?")

        updateWhiteboard(spl[1])

        wait(getgenv().waitTime)

        updateWhiteboard(spl[2])
   end,
})

local WaitTime = Main:CreateSlider({
   Name = "Wait Time",
   Range = {1, 50},
   Increment = 1,
   Suffix = "WaitTime",
   CurrentValue = getgenv().waitTime,
   Flag = "WaitTime",
   Callback = function(time)
        getgenv().waitTime = time
   end,
})
