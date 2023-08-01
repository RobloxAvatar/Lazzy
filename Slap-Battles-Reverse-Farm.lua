game:GetService("UserInputService").InputBegan(i,istyping)
    if istyping == true then return end
    if i.KeyCode == Enum.KeyCode.LeftAlt then
        if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value ~= "Reverse" then return end
        repeat task.wait() until game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        repeat wait() until not game.Players.LocalPlayer.Character:FindFirstChild("entered")
        if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
        end

        repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("entered")
        repeat wait() until game.Players[_G.Target].Character:FindFirstChild("entered")

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(234.469391, -15.7160769, 15.0752077, -0.106970124, 4.20225881e-08, 0.994262218, -2.34862387e-08, 1, -4.47919213e-08, -0.994262218, -2.81428765e-08, -0.106970124)

        wait(0.5)

        game.ReplicatedStorage.ReverseAbility:FireServer()

        wait(0.5)

        local ohInstance1 = workspace[_G.Target].HumanoidRootPart

        game:GetService("ReplicatedStorage").ReverseHit:FireServer(ohInstance1)
    end
end)
