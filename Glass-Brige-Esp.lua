function addUi(part)
    local partGui = Instance.new("BillboardGui", part)
    partGui.Size = UDim2.new(1,0,1,0)
    partGui.AlwaysOnTop = true
    partGui.Name = "Item-ESP"
    local frame = Instance.new("Frame", partGui)
    frame.BackgroundColor3 = Color3.fromRGB(255,80,60)
    frame.BackgroundTransparency = 0.75
    frame.Size = UDim2.new(1,0,1,0)
    frame.BorderSizePixel = 0
    local nameGui = Instance.new("BillboardGui", part)
    nameGui.Size = UDim2.new(3,0,1.5,0)
    nameGui.SizeOffset = Vector2.new(0,1)
    nameGui.AlwaysOnTop = true
    nameGui.Name = "Breakable"
    local text = Instance.new("TextLabel", nameGui)
    text.Text = "Breakable"
    text.TextColor3 = Color3.fromRGB(255,80,60)
    text.TextTransparency = 0.25
    text.BackgroundTransparency = 1
    text.TextScaled = true
    text.Size = UDim2.new(1,0,1,0)
    text.Font = Enum.Font.GothamSemibold
    text.Name = "text"
end

local function removeUi(part)
    for _,v in pairs(part:GetChildren()) do
        if v:IsA("BillboardGui") then
            v:Destroy()
        end
    end
end

for _,v in pairs(game:GetService("Workspace").segmentSystem.Segments:GetChildren()) do
    v.Folder.ChildAdded:Connect(function(v2)
        addUi(v2)
    end)
end

for _,v in pairs(game:GetService("Workspace").segmentSystem.Segments:GetChildren()) do
    v.Folder.ChildRemoved:Connect(function(v2)
        removeUi(v2)
    end)
end

for _,v in pairs(game:GetService("Workspace").segmentSystem.Segments:GetChildren()) do
    for i2,v2 in pairs(v.Folder:GetChildren()) do
        if v2:FindFirstChild("breakable") then
            addUi(v2)
        end
    end
end
