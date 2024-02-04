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

getgenv().autoParry = false
getgenv().adjustment = 3

local Debug = false
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local Balls = workspace:WaitForChild("Balls", 9e9)

local upSpeedToggle = Main:CreateToggle({
   Name = "Auto Parry",
   CurrentValue = false,
   Flag = "AutoParry",
   Callback = function(state)
        getgenv().autoParry = state
   end,
})

local Adjustment = Main:CreateSlider({
    Name = "Auto Parry Adjustment",
    Range = {3, 4},
    Increment = 0.1,
    Suffix = "Adjustment",
    CurrentValue = 3,
    Flag = "Adjustment",
    Callback = function(adjustment)
       getgenv().adjustment = adjustment
    end,
 })

local function print(...)
    if Debug then
        warn(...)
    end
end

local function VerifyBall(Ball)
    if typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall") == true then
        return true
    end
end

function FindBall()
    local RealBall

    for i, v in pairs(Balls:GetChildren()) do
        if v:GetAttribute("realBall") == true then
            RealBall = v
        end
    end
    return RealBall
end

local function IsTarget()
    return (Player.Character and Player.Character:FindFirstChild("Highlight"))
end

local function Parry()
    Remotes:WaitForChild("ParryButtonPress"):Fire()
end

getgenv().Clash = false

game:GetService("UserInputService").InputBegan:Connect(function(i, istyping)
    if istyping == true then return end
    if i.KeyCode == Enum.KeyCode.Z then
        getgenv().Clash = not getgenv().Clash
    end
end)

Balls.ChildAdded:Connect(function(Ball)
    if not VerifyBall(Ball) then
        return
    end
    
    Ball:GetPropertyChangedSignal("Position"):Connect(function()
        if IsTarget() and getgenv().autoParry then
            local Ball = FindBall()
            local BallVelocity = Ball.Velocity.Magnitude
            local BallPosition = Ball.Position

            local PlayerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

            local Distance = (BallPosition - PlayerPosition).Magnitude
            local PingAccountability = BallVelocity * (game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000)

            Distance -= PingAccountability
            Distance -= getgenv().adjustment

            local Hit = Distance / BallVelocity
        
            if Hit <= 0.5 then
                Parry()
            end
        end
    end)
end)

spawn(function()
    while task.wait() do
        if getgenv().Clash then
            pcall(function()
                Parry()
            end)
        end
    end
end)
