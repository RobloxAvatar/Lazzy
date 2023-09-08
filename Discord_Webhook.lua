_G.Webhook = _G.Webhook or ""
_G.Content = _G.Content or ""
_G.Username = _G.Username or ""
_G.AvatarUrl = _G.AvatarUrl or ""

local webhookUrl = "https://discord.com/api/webhooks/" .. _G.Webhook

local message = {
    content = _G.Content,
    username = _G.Username,
    avatar_url = _G.AvatarUrl,
}

local messageJson = game:GetService("HttpService"):JSONEncode(message)

local requestBody = {
    Url = webhookUrl,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json",
        ["Content-Length"] = tostring(#messageJson),
    },
    Body = messageJson,
}

local response = http.request(requestBody)

if response.Success and response.StatusCode == 204 then
    print("Request was successful")
else
    if (response.StatusMessage == "Not Found") then
        print("Error: Invalid Webhook Link!")
    else
        print("Error Unknown!")
    end
end
