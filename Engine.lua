local Lazzy = {}

function Lazzy.MakeNotification(txt, time)
    local p = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Lazzy/main/Notify.lua"))()
	p:MakeNotification({Name = "Lazzy", Content = txt, Time = time})
end

return Lazzy
