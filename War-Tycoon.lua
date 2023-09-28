local teams = {}

getgenv().autoSell = false

local function teleportToFlag(tycoon)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Tycoon.Tycoons[tycoon].Essentials.Flag.Metal.CFrame
end

local function getTycoonOwner(tycoon)
    return game:GetService("Workspace").Tycoon.Tycoons[tycoon].Owner.Value
end

local function getTycoon()
    for _,v in pairs(game:GetService("Workspace").Tycoon.Tycoons:GetChildren()) do
        if v.Owner.Value == game.Players.LocalPlayer then
            return v
        end
    end
end

local function getHeliParts(tycoon)
    for _,v in pairs(game:GetService("Workspace")["Game Systems"]["Crate Workspace"]:GetChildren()) do
        if v:GetAttribute("Owner") == getTycoonOwner(tycoon).Name then
            return v
        end
    end
end

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Lazzy/main/Arrayfield.lua"))()

for _,v in pairs(game:GetService("Workspace").Tycoon.Tycoons:GetChildren()) do
    if v.Owner.Value ~= game.Players.LocalPlayer then
        table.insert(teams, v.Name)
    end
end

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

local function stealCrate(tycoon)
    teleportToFlag(tycoon)
    wait(0.7)
    if getHeliParts(tycoon) == nil then
        notify("Lazzy", "No Parts Found!", 3)
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getHeliParts(tycoon).CFrame + Vector3.new(-2, 0, 0)
        wait(0.1)
        fireproximityprompt(getHeliParts(tycoon).StealPrompt)
        wait(getHeliParts(tycoon).StealPrompt.HoldDuration + 0.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getTycoon().Essentials.Flag.Metal.CFrame
        wait(0.7)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getTycoon().Essentials["Oil Collector"].CratePromptPart.CFrame + Vector3.new(0, 1, 0)
        wait(0.2)
        if getgenv().autoSell then
            fireproximityprompt(getTycoon().Essentials["Oil Collector"].CratePromptPart.SellPrompt)
        end
    end
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

getgenv().selectedTeam = ""

local Teamdropdown = Main:CreateDropdown({
   Name = "Teams",
   Options = teams,
   CurrentOption = teams[1],
   MultipleOptions = false,
   Flag = "Teams",
   Callback = function(team)
        getgenv().selectedTeam = team
        if type(getgenv().selectedTeam) == "table" then
            for i,v in pairs(team) do
                getgenv().selectedTeam = v
            end
        else
            getgenv().selectedTeam = team
        end
   end,
})

local AutoSell = Main:CreateToggle({
   Name = "Auto Sell",
   CurrentValue = false,
   Flag = "AutoSell",
   Callback = function(Value)
        getgenv().autoSell = Value
   end,
})

local StealCrate = Main:CreateButton({
   Name = "Steal Crate",
   Callback = function()
        if getgenv().selectedTeam == nil or getgenv().selectedTeam == "" then
            notify("Lazzy", "No team selected!", 3)
        else
            stealCrate(getgenv().selectedTeam)
        end
   end,
})

local TeleportToTeamBase = Main:CreateButton({
   Name = "Teleport To Team",
   Callback = function()
        if getgenv().selectedTeam == nil or getgenv().selectedTeam == "" then
            notify("Lazzy", "No team selected!", 3)
        else
            teleportToFlag(getgenv().selectedTeam)
        end
   end,
})

game:GetService("Workspace").Tycoon.Tycoons.ChildAdded:Connect(function(team)
    table.insert(teams, team.Name)
    Teamdropdown:Add(team.Name)
end)

game:GetService("Workspace").Tycoon.Tycoons.ChildRemoved:Connect(function(team)
    table.remove(teams, table.find(teams, team.Name))
    Teamdropdown:Remove(team.Name)
end)
