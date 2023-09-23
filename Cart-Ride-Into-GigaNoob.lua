local function upSpeed()
    for i,v in pairs(game:GetService("Workspace").Building.Baseplate["Carts + Jeeps"]:GetChildren()) do
        for i2, v2 in pairs(v:GetChildren()) do
            if v2:FindFirstChild("Up") and v2:FindFirstChild("Up").ClickDetector then
                fireclickdetector(v2:FindFirstChild("Up").ClickDetector)
            end
        end
    end
end

local function downSpeed()
    for i,v in pairs(game:GetService("Workspace").Building.Baseplate["Carts + Jeeps"]:GetChildren()) do
        for i2, v2 in pairs(v:GetChildren()) do
            if v2:FindFirstChild("Down") and v2:FindFirstChild("Down").ClickDetector then
                fireclickdetector(v2:FindFirstChild("Down").ClickDetector)
            end
        end
    end
end

local function onCarts()
    for i,v in pairs(game:GetService("Workspace").Building.Baseplate["Carts + Jeeps"]:GetChildren()) do
        for i2, v2 in pairs(v:GetChildren()) do
            if v2:FindFirstChild("On") and v2:FindFirstChild("On").ClickDetector and v2:FindFirstChild("On").BrickColor == BrickColor.new("Bright red") then
                fireclickdetector(v2:FindFirstChild("On").ClickDetector)
            end
        end
    end
end

local function offCarts()
    for i,v in pairs(game:GetService("Workspace").Building.Baseplate["Carts + Jeeps"]:GetChildren()) do
        for i2, v2 in pairs(v:GetChildren()) do
            if v2:FindFirstChild("On") and v2:FindFirstChild("On").ClickDetector and v2:FindFirstChild("On").BrickColor == BrickColor.new("Dark green") then
                fireclickdetector(v2:FindFirstChild("On").ClickDetector)
            end
        end
    end
end

local function moveToVoid()
    oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i,v in pairs(game:GetService("Workspace").Building.Baseplate["Carts + Jeeps"]:GetChildren()) do
        for i2, v2 in pairs(v:GetChildren()) do
            if v2.Name == "Jeep" and v2:FindFirstChild("DriveSeat") and v2:FindFirstChild("DriveSeat").Occupant == nil then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.DriveSeat.CFrame
                wait(0.5)
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            end
        end
    end
end

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Lazzy/main/rayfield.lua"))()

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

getgenv().upSpeed = false
getgenv().downSpeed = false
getgenv().onCarts = false
getgenv().offCarts = false
getgenv().clearCars = false

local upSpeedToggle = Main:CreateToggle({
   Name = "Up Speed",
   CurrentValue = false,
   Flag = "UpSpeed",
   Callback = function(Value)
        getgenv().upSpeed = Value
   end,
})

local downSpeedToggle = Main:CreateToggle({
   Name = "Down Speed",
   CurrentValue = false,
   Flag = "DownSpeed",
   Callback = function(Value)
        getgenv().downSpeed = Value
   end,
})

local onCartsToggle = Main:CreateToggle({
   Name = "On Carts",
   CurrentValue = false,
   Flag = "OnCarts",
   Callback = function(Value)
        getgenv().onCarts = Value
   end,
})

local offCartsToggle = Main:CreateToggle({
   Name = "Off Carts",
   CurrentValue = false,
   Flag = "OffCarts",
   Callback = function(Value)
        getgenv().offCarts = Value
   end,
})

local CarClear = Main:CreateToggle({
   Name = "Clear Cars",
   CurrentValue = false,
   Flag = "ClearCars",
   Callback = function(Value)
        getgenv().clearCars = Value
   end,
})

spawn(function()
    while task.wait() do
        if getgenv().clearCars then
            pcall(function()
                moveToVoid()
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().upSpeed then
            pcall(function()
                upSpeed()
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().downSpeed then
            pcall(function()
                downSpeed()
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().onCarts then
            pcall(function()
                onCarts()
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().offCarts then
            pcall(function()
                offCarts()
            end)
        end
    end
end)
