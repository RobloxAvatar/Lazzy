local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local isPathfindingInProgress = false
local path
local waypoints = {}
local nextWaypointIndex = 1
local blockedConnection

local agentRadius = 2
local agentHeight = 5
local agentCanJump = true
local agentJumpHeight = 10
local agentMaxSlope = 45
local verticalOffset = 5

humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)

local function followPath(destination)
    if isPathfindingInProgress then
        return
    end

    isPathfindingInProgress = true

    if path then
        path:Cancel()
    end

    local startPosition = character.HumanoidRootPart.Position + Vector3.new(0, 2, 0)

    path = PathfindingService:CreatePath({
        AgentRadius = agentRadius,
        AgentHeight = agentHeight,
        AgentCanJump = agentCanJump,
        AgentJumpHeight = agentJumpHeight,
        AgentMaxSlope = agentMaxSlope,
        AgentMaxStepHeight = agentHeight,
    })

    local success, errorMessage = pcall(function()
        path:ComputeAsync(startPosition, destination)
    end)

    if not success then
        warn("Error while computing path:", errorMessage)
        isPathfindingInProgress = false
        return
    end

    blockedConnection = path.Blocked:Connect(function(blockedWaypointIndex)
        if blockedWaypointIndex >= nextWaypointIndex then
            blockedConnection:Disconnect()
            followPath(destination)
        end
    end)

    waypoints = path:GetWaypoints()
    nextWaypointIndex = 1

    local function moveToNextWaypoint()
        if nextWaypointIndex <= #waypoints then
            local waypoint = waypoints[nextWaypointIndex]
            local tweenInfo = TweenInfo.new(0.1)
            local tweenGoal = {}
            tweenGoal.CFrame = CFrame.new(waypoint.Position + Vector3.new(0, 2, 0))
            
            local tween = TweenService:Create(character.HumanoidRootPart, tweenInfo, tweenGoal)
            tween.Completed:Connect(function()
                nextWaypointIndex = nextWaypointIndex + 1
                moveToNextWaypoint()
            end)
            tween:Play()
        else
            blockedConnection:Disconnect()
            isPathfindingInProgress = false
        end
    end

    moveToNextWaypoint()

    local function maintainVerticalOffset()
        while isPathfindingInProgress do
            local currentPosition = character.HumanoidRootPart.Position
            local rayStart = currentPosition + Vector3.new(0, verticalOffset, 0)
            local rayEnd = currentPosition - Vector3.new(0, verticalOffset, 0)
            
            local hit, position = Workspace:FindPartOnRayWithWhitelist(
                Ray.new(rayStart, rayEnd - rayStart),
                {character}
            )
            
            if hit then
                local newHeight = position.Y + verticalOffset
                local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.1), {CFrame = character.HumanoidRootPart.CFrame + Vector3.new(0, newHeight - currentPosition.Y, 0)})
                tween.Completed:Wait(E)
            end

            wait(0.1)
        end
    end

    spawn(maintainVerticalOffset)
end
