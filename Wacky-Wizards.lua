local function getCauldron()
    local cauldron
    for _,v in pairs(game:GetService("Workspace").PlayerCauldrons:GetChildren()) do
        if v.Cylinder:FindFirstChild("BillboardGui") then
            cauldron = v
        end
    end
    return cauldron
end

local function drainCauldron()
    if getCauldron() ~= nil then
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer("AttemptDrainCauldron", getCauldron().CauldronSet.Cauldron)
    end
end

local function spawnPotionCauldron()
    if getCauldron() ~= nil then
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer("AttemptBottlePotion", getCauldron().CauldronSet.Cauldron)
    end
end

local function collectSpider()
    local spider
    for _,v in pairs(game:GetService("Workspace").Interactions:GetChildren()) do
        if v.Name == "Spider" then
            spider = v
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = spider.Main.CFrame + Vector3.new(0, 2, 0)
    wait(0.1)
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("PickUpItem", spider)
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("FireAllClients", "WeldItemToHand", spider.Main.GripAttachment, workspace[game.Players.LocalPlayer.Name].RightHand.RightGripAttachment)
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("AttemptCauldronTeleport")
end
