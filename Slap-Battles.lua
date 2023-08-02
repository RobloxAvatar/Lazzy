local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldNamecall = gmt.__namecall

gmt.__namecall = newcclosure(function(self, ...)
    local Args = {...}
    local method = getnamecallmethod()
    if method == "Kick" then
        return
    end
    return oldNamecall(self, ...)
end)
setreadonly(gmt, true)

function getGoldenSound()
    for i,v in pairs(workspace[game:GetService("Players").LocalPlayer.Name].HumanoidRootPart:GetChildren()) do
        if v.Name == "Sound" and v.SoundId == "rbxassetid://6193836931" then
            return v
        end
    end
end

local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Hydra/main/Engine.lua"))()
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/RobloxAvatar/uiLibary/main/Uilib.lua')))()

local w = library:CreateWindow("Slap Battles")
local MainTab = w:CreateFolder("Main")
local AbilityTab = w:CreateFolder("Ability")
kills = 0

MainTab:Button("Unlock Bob", function()
    game:GetService("ReplicatedStorage").bob:FireServer()
end)

MainTab:Toggle("Anti Ragdoll", function(bool)
    AntiRagdoll = bool
end)

MainTab:Toggle("Auto Collect Gapple", function(bool)
    autogapple = bool
end)

MainTab:Bind("Kill Aura", Enum.KeyCode.G, function()
    if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Default" then
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
            local ohInstance1 = workspace[v.Name].HumanoidRootPart
            game:GetService("ReplicatedStorage").b:FireServer(ohInstance1)
        end
    else
        if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Bull" then
            for i,v in pairs(game:GetService("Players"):GetChildren()) do
                local ohInstance1 = workspace[v.Name].HumanoidRootPart
                game:GetService("ReplicatedStorage").BullHit:FireServer(ohInstance1)
            end
        else
            if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Dice" then
                for i,v in pairs(game:GetService("Players"):GetChildren()) do
                    local ohInstance1 = workspace[v.Name].HumanoidRootPart
                    game:GetService("ReplicatedStorage").DiceHit:FireServer(ohInstance1)
                end
            else
                if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "spin" then
                    for i,v in pairs(game:GetService("Players"):GetChildren()) do
                        local ohInstance1 = workspace[v.Name].HumanoidRootPart
                        game:GetService("ReplicatedStorage").spinhit:FireServer(ohInstance1)
                    end
                else
                    if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Dream" then
                        for i,v in pairs(game:GetService("Players"):GetChildren()) do
                            local ohInstance1 = workspace[v.Name].HumanoidRootPart
                            game:GetService("ReplicatedStorage").Dreamhit:FireServer(ohInstance1)
                        end
                    else
                        if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Golden" then
                            for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                local ohInstance1 = workspace[v.Name].HumanoidRootPart
                                local ohBoolean2 = true
                                
                                game:GetService("ReplicatedStorage").GoldenHit:FireServer(ohInstance1, ohBoolean2)
                            end
                        else
                            if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Reaper" then
                                for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                    local ohInstance1 = workspace[v.Name].HumanoidRootPart
                                    game:GetService("ReplicatedStorage").ReaperHit:FireServer(ohInstance1)
                                end
                            else
                                if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "bob" then
                                    for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                        local ohInstance1 = workspace[v.Name].HumanoidRootPart
                                        game:GetService("ReplicatedStorage").bobhit:FireServer(ohInstance1)
                                    end
                                else
                                    if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Killstreak" then
                                        for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                            local ohInstance1 = workspace[v.Name].HumanoidRootPart
                                            local ohNumber2 = 0
                                            game:GetService("ReplicatedStorage").KSHit:FireServer(ohInstance1, ohNumber2)
                                        end
                                    else
                                        if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "God's Hand" then
                                            for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                game:GetService("ReplicatedStorage").Godshand:FireServer(ohInstance1)
                                            end
                                        else
                                            if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Ghost" then
                                                for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                    local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                    game:GetService("ReplicatedStorage").GhostHit:FireServer(ohInstance1)
                                                end
                                            else
                                                if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Shukuchi" then
                                                    for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                        local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                        game:GetService("ReplicatedStorage").ShukuchiHit:FireServer(ohInstance1)
                                                    end
                                                else
                                                    if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Ice" then
                                                        for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                            local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                            game:GetService("ReplicatedStorage").IceHit:FireServer(ohInstance1)
                                                        end
                                                    else
                                                        if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Diamond" then
                                                            for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                                local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                                game:GetService("ReplicatedStorage").DiamondHit:FireServer(ohInstance1)
                                                            end
                                                        else
                                                            if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Boomerang" then
                                                                for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                                    local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                                    game:GetService("ReplicatedStorage").BoomerangH:FireServer(ohInstance1)
                                                                end
                                                            else
                                                                if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Elude" then
                                                                    for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                                        local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                                        game:GetService("ReplicatedStorage").GeneralHit:FireServer(ohInstance1)
                                                                    end
                                                                else
                                                                    if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Disarm" then
                                                                        for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                                            local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                                            game:GetService("ReplicatedStorage").DisarmH:FireServer(ohInstance1)
                                                                        end
                                                                    else
                                                                        if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Error" then
                                                                            for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                                                local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                                                game:GetService("ReplicatedStorage").Errorhit:FireServer(ohInstance1)
                                                                            end
                                                                        else
                                                                            if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Psycho" then
                                                                                for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                                                    local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                                                    game:GetService("ReplicatedStorage").GeneralHit:FireServer(ohInstance1)
                                                                                end
                                                                            else
                                                                                if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Nightmare" then
                                                                                    for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                                                        local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                                                        game:GetService("ReplicatedStorage").nightmarehit:FireServer(ohInstance1)
                                                                                    end
                                                                                else
                                                                                    if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Glitch" then
                                                                                        for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                                                            local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                                                            game:GetService("ReplicatedStorage").GeneralHit:FireServer(ohInstance1)
                                                                                        end
                                                                                    else
                                                                                        if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Extended" then
                                                                                            for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                                                                local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                                                                game:GetService("ReplicatedStorage").b:FireServer(ohInstance1)
                                                                                            end
                                                                                        else
                                                                                            if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value == "Thor" then
                                                                                                for i,v in pairs(game:GetService("Players"):GetChildren()) do
                                                                                                    local ohInstance1 = game:GetService("Players")[v.Name].Character.HumanoidRootPart
                                                                                                    game:GetService("ReplicatedStorage").ThorHit:FireServer(ohInstance1)
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

AbilityTab:Toggle("GodMode[Golden]", function(bool)
    godMode = bool
    if godMode == false then
        local ohBoolean1 = false
        local ohBrickColor2 = BrickColor.new("Really black")
        game:GetService("ReplicatedStorage").Goldify:FireServer(ohBoolean1, ohBrickColor2)
    end
end)

AbilityTab:Toggle("Invisibility[Ghost]", function(bool)
    if bool then
        game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer()
    else
        game:GetService("ReplicatedStorage").Ghostinvisibilitydeactivated:FireServer()
    end
end)

local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldNamecall = gmt.__namecall

gmt.__namecall = newcclosure(function(Self, ...)
    local Args = {...}
    local method = getnamecallmethod()
    if tostring(Self) == "GoldenHit" and tostring(method) == "FireServer" and godMode == true then
        Args[1] = Args[1]
        Args[2] = true
        return Self.FireServer(Self, unpack(Args))
    else
        if tostring(Self) == "GoldenHit" and tostring(method) == "FireServer" and godMode == false then
            Args[1] = Args[1]
            Args[2] = Args[2]
            return Self.FireServer(Self, unpack(Args))
        end
    end
    return oldNamecall(Self, ...)
end)
setreadonly(gmt, true)

spawn(function()
    while task.wait() do
        if autogapple then
            pcall(function()
                for _,v in pairs(workspace.Arena:GetDescendants()) do
                    if string.find(v.Name, "Slapple") and v:FindFirstChild("Glove") and v.Glove:FindFirstChildOfClass("TouchTransmitter") then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 1)
                        
                        wait(0.05)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if godMode then
            pcall(function()
                workspace[game:GetService("Players").LocalPlayer.Name].HumanoidRootPart.ChildAdded:Connect(function(child)
                    if child.Name == "Sound" then
                        workspace[game:GetService("Players").LocalPlayer.Name].HumanoidRootPart.Sound.Volume = 0
                        workspace[game:GetService("Players").LocalPlayer.Name].HumanoidRootPart.Sound:Destroy()
                    end
                end)
                local ohBoolean1 = true
                game:GetService("ReplicatedStorage").Goldify:FireServer(ohBoolean1)
                wait(5)
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if AntiRagdoll then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:WaitForChild("Ragdolled").Value == true then
                    oldCFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head").Anchored = true
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = true
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso").Anchored = true
                    repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head").Anchored = false
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = false
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso").Anchored = false
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame
                end
            end)
        end
    end
end)
