local Lazzy = {}

function Lazzy:CreateNotification(webhook, content, username, avatarurl)
    local webhookUrl

    if (string.find(webhook, "https://discord.com/api/webhooks/")) then
        webhookUrl = webhook
    else
        webhookUrl = "https://discord.com/api/webhooks/" .. webhook
    end

    if (webhook == "" or webhook == nil) then
        print("Please Enter A Webhook!")
        return
    end

    if (content == "" or content == nil) then
        print("Please Enter Content Message!")
        return
    end

    if (username == "" or username == nil) then
        print("Please Enter A Username For The Bot!")
        return
    end

    if (avatarurl == "" or avatarurl == nil) then
        print("Please Enter A Avtar Url For The Bot!")
        return
    end

    local message = {
        content = content,
        username = username,
        avatar_url = avatarurl,
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
end

return Lazzy
