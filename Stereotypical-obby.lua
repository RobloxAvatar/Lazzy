local pathfindingService = game:GetService("PathfindingService")

local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local human = char:WaitForChild("Humanoid")
local rootpart = char:WaitForChild("HumanoidRootPart")
local camera = game:GetService("Workspace").CurrentCamera

local path = pathfindingService:CreatePath()

local function checkLadderInDistance()
    for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "Truss" and v.ClassName == "TrussPart" then
            local dist = (rootpart.Position - v.Position).magnitude
            if dist < 24.5 then
                local direction = v.Position - rootpart.Position
                local raycastResult = workspace:Raycast(char.Head.Position, direction)
                if raycastResult and raycastResult.Instance then
                    if raycastResult.Instance.Name == "Truss" then
                        local pos, visible = camera:WorldToScreenPoint(v.Position)
                        if visible then
                            return v
                        end
                    end
                end
            end
        end
    end
end

local function checkKillpartInDistance()
    for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "KillPart" and v.ClassName == "Part" and v.BrickColor == BrickColor.new("Really red") then
            local dist = (rootpart.Position - v.Position).magnitude
            if dist < 5.5 then
                return v
            end
        end
    end
end

local function followPath(goal)
    path:ComputeAsync(rootpart.Position, goal)
    local waypoints = path:GetWaypoints()
    for i, waypoint in pairs(waypoints) do
        if waypoint.Action == Enum.PathWaypointAction.Jump then
            human.Jump = true
        end
        human:MoveTo(waypoint.Position)
        human.MoveToFinished:Wait(2)
    end
end

local function getCheckPointMain(checkpoint)
    return game:GetService("Workspace").Obby_Geometry.Obby_Checkpoints["Checkpoint_" .. checkpoint]:FindFirstChild("CheckpointMain")
end

local connection

game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
    connection:Disconnect()
end)

local function gotoNext()
    connection = game:GetService("RunService").RenderStepped:Connect(function()
        if checkKillpartInDistance() ~= nil then
            human.Jump = true
            task.wait()
        end
    end)
    local togo = game.Players.LocalPlayer.leaderstats.Stage.Value + 1
    if checkLadderInDistance() ~= nil then
        repeat
            human:MoveTo(checkLadderInDistance().Position)
            human.MoveToFinished:Wait(2)
            task.wait()
        until checkLadderInDistance() == nil
        followPath(getCheckPointMain(togo).Position)
    else
        followPath(getCheckPointMain(togo).Position)
    end
    repeat wait() until game.Players.LocalPlayer.leaderstats.Stage.Value == togo
    connection:Disconnect()
end

local function calculateStages()
    local stage = game.Players.LocalPlayer.leaderstats.Stage.Value
    local stages = #game:GetService("Workspace").Obby_Geometry.Obby_Checkpoints:GetChildren()
    return stages - stage
end

for i = game.Players.LocalPlayer.leaderstats.Stage.Value, calculateStages() do
    gotoNext()
end
