local players = {}

for _,v in pairs(game.Players:GetPlayers()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
        table.insert(players, v.Name)
    end
end

local function upSpeed()
    for i,v in pairs(game:GetService("Workspace").Building.Baseplate["Carts + Jeeps"]:GetChildren()) do
        for i2, v2 in pairs(v:GetChildren()) do
            if v2:FindFirstChild("Up") and v2:FindFirstChild("Up").ClickDetector then
                fireclickdetector(v2:FindFirstChild("Up").ClickDetector)
            end
        end
    end
    for i,v in pairs(game:GetService("Workspace").Building.HalfWay.Carts:GetChildren()) do
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
    for i,v in pairs(game:GetService("Workspace").Building.HalfWay.Carts:GetChildren()) do
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
    for i,v in pairs(game:GetService("Workspace").Building.HalfWay.Carts:GetChildren()) do
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
    for i,v in pairs(game:GetService("Workspace").Building.HalfWay.Carts:GetChildren()) do
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

local function getClosestCart()
    for i,v in pairs(workspace:GetDescendants()) do
        for i2,v2 in pairs(v:GetChildren()) do
            if v2:FindFirstChild("Engine") then
                local magnitudeBetweenPos = (v2:FindFirstChild("Engine").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local distance = 3
                if magnitudeBetweenPos <= distance then
                    return v2
                end
            end
        end
    end
end

local function giveAllTools()
    for i,v in pairs(game:GetService("Workspace").Building.Winners.Givers_Winners:GetChildren()) do
        for i2,v2 in pairs(v:GetChildren()) do
            if v2.Parent:FindFirstChild("Giver") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Giver, 0)
            end
        end
    end
end

local function fling(target)
    local Thrust = Instance.new('BodyThrust', game.Players.LocalPlayer.Character.HumanoidRootPart)
	Thrust.Force = Vector3.new(9999,9999,9999)
	Thrust.Name = "YeetForce"
    repeat
	    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
	    Thrust.Location = target.Character.HumanoidRootPart.Position
	    game:FindService("RunService").Heartbeat:wait()
    until not target.Character:FindFirstChild("Head") or not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyThrust")
end

local function unfling()
    for _,v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
        if v:FindFirstChildOfClass("BodyThrust") then
            v:FindFirstChildOfClass("BodyThrust"):Destroy()
        end 
    end
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
local Players = Window:CreateTab("Players", 13014546637)

getgenv().upSpeed = false
getgenv().downSpeed = false
getgenv().onCarts = false
getgenv().offCarts = false
getgenv().clearCars = false
getgenv().selectedPlayer = ""

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

local Playerdropdown = Players:CreateDropdown({
   Name = "Players",
   Options = players,
   CurrentOption = players[1],
   MultipleOptions = false,
   Flag = "Playerdropdown",
   Callback = function(plr)
        getgenv().selectedPlayer = plr
        if type(getgenv().selectedPlayer) == "table" then
            for i,v in pairs(plr) do
                getgenv().selectedPlayer = v
            end
        else
            getgenv().selectedPlayer = plr
        end
   end,
})

local SpectateToggle = Players:CreateToggle({
   Name = "Spectate",
   CurrentValue = false,
   Flag = "Spectate",
   Callback = function(Value)
        if Value then
            if getgenv().selectedPlayer == "" or getgenv().selectedPlayer == nil then return end
            workspace.CurrentCamera.CameraSubject = game.Players[getgenv().selectedPlayer].Character
        else
            workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
        end
   end,
})

local FlingToggle = Players:CreateToggle({
   Name = "Fling",
   CurrentValue = false,
   Flag = "Fling",
   Callback = function(Value)
        if Value then
            oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            fling(game.Players[getgenv().selectedPlayer])
        else
            unfling()
            game.Players.LocalPlayer.Character:BreakJoints()
        end
   end,
})

local TeleportToPlayer = Players:CreateButton({
   Name = "Teleport To Player",
   Callback = function()
        if getgenv().selectedPlayer == nil or getgenv().selectedPlayer == "" then
            notify("Lazzy", "No player selected!", 3)
        else
            notify("Lazzy", "Going to selected player!", 3)
            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3.5), {CFrame = game.Players[getgenv().selectedPlayer].Character.HumanoidRootPart.CFrame}):Play()
        end
   end,
})

local CompleteCartRideButton = Main:CreateButton({
   Name = "Complete Cart Ride",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Building.Winners["Red Spawn"].CFrame + Vector3.new(0, 2, 0)
   end,
})

local GiveAllToolsButton = Main:CreateButton({
   Name = "Give All Tools",
   Callback = function()
        giveAllTools()
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

game.Players.PlayerAdded:Connect(function(plr)
    table.insert(players, plr.Name)
    Playerdropdown:Add(plr.Name)
end)

game.Players.PlayerRemoving:Connect(function(plr)
    table.remove(players, table.find(players, plr.Name))
    Playerdropdown:Remove(plr.Name)
end)
