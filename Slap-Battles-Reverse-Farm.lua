if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value ~= "Reverse" then return end
repeat task.wait() until game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
repeat wait() until not game.Players.LocalPlayer.Character:FindFirstChild("entered")
wait(1.25)
if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
end

repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("entered")
repeat wait() until game.Players[_G.Target].Character:FindFirstChild("entered")

wait(1)

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-57.911137, 362.33728, -0.93506506, -0.0174594577, 6.0804024e-09, 0.999847591, 7.86445256e-08, 1, -7.45462891e-09, -0.999847591, -7.876268888e-08, -0.0174594577)

wait(2)

game.ReplicatedStorage.ReverseAbility:FireServer()

wait(0.5)

local ohInstance1 = workspace[_G.Target].HumanoidRootPart

game:GetService("ReplicatedStorage").ReverseHit:FireServer(ohInstance1)
