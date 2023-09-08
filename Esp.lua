local PlayerHighlightModule = {}
local HighlightedPlayers = {}

-- Function to highlight a player
function PlayerHighlightModule.HighlightPlayer(player, HighlightColor)
    if player and player.Character then
        local character = player.Character
        local torso = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
        
        if torso then
            local highlightBox = Instance.new("BoxHandleAdornment")
            highlightBox.Size = torso.Size * 1.1 -- Adjust the size multiplier as needed
            highlightBox.Color3 = Color3.fromRGB(HighlightColor)
            highlightBox.Transparency = 0.5
            highlightBox.AlwaysOnTop = true
            highlightBox.Parent = torso
            
            -- Store the player in the HighlightedPlayers table
            HighlightedPlayers[player] = highlightBox
        end
    end
end

-- Function to unhighlight a player
function PlayerHighlightModule.UnhighlightPlayer(player)
    local highlightBox = HighlightedPlayers[player]
    if highlightBox then
        highlightBox:Destroy()
        HighlightedPlayers[player] = nil
    end
end

return PlayerHighlightModule
