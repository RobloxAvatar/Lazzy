local pathfindingService = game:GetService("PathfindingService")

local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local human = char:WaitForChild("Humanoid")
local rootpart = char:WaitForChild("HumanoidRootPart")

local path = pathfindingService:CreatePath()

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

local function checkJump(part)
    human:MoveTo(part)
    repeat wait() until (rootpart.Position - part).magnitude < 19.5
    human.Jump = true
    human.MoveToFinished:Wait(2)
end

local function complete()
    local toGo = game:GetService("Players").LocalPlayer.Checkpoint.Value + 1
    for _,v in pairs(game:GetService("Workspace").segmentSystem.Segments["Segment" .. toGo]:GetChildren()) do
        for i2,v2 in pairs(v:GetChildren()) do
            if v2:FindFirstChild("breakable") == nil then
                local dist = (rootpart.Position - v2.Position).magnitude
                if dist > 30 then
                    checkJump(v2.Position)
                else
                    followPath(v2.Position)
                end
            end
        end
    end
end

local function fix()
    game:GetService("Players").LocalPlayer.Checkpoint.Value = 0
end
fix()

for i = 1, 55 do
    complete()
    repeat wait() until game:GetService("Players").LocalPlayer.Checkpoint.Value == i
end
