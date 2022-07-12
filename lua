local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local data = game:GetService("HttpService"):JSONDecode(readfile("data.lua"))
local bind = data.bind
local webhook = data.webhook
block_random_player = function() --yeye kanner made that
    local block_player 
    local players_list = services.Players:GetPlayers()

    for index = 1, #players_list do
        local target_player = players_list[index]

        if target_player.Name ~= player.Name then
            block_player = target_player
            break
        end
    end

    services.StarterGui:SetCore("PromptBlockPlayer", block_player)

    local container_frame = services.CoreGui.RobloxGui:WaitForChild("PromptDialog"):WaitForChild("ContainerFrame")

    local confirm_button = container_frame:WaitForChild("ConfirmButton")
    local confirm_button_text = confirm_button:WaitForChild("ConfirmButtonText")
    
    if confirm_button_text.Text == "Block" then  
        wait()
        
        local confirm_position = confirm_button.AbsolutePosition
        
        services.VirtualInputManager:SendMouseButtonEvent(confirm_position.X + 10, confirm_position.Y + 45, 0, true, game, 0)
        task_wait()
        services.VirtualInputManager:SendMouseButtonEvent(confirm_position.X + 10, confirm_position.Y + 45, 0, false, game, 0)
    end
end
local JSONTable = {
    ['embeds'] = {
         {
             ['fields'] = {},
             ['description'] = "successfully serverhoped,finding new server rn",
             ['title'] = "Servehopped",
             ['footer'] = {
                 ['text'] = "hi"
             },
             ['color'] = 5384145
    }
 }
}
mouse.KeyDown:connect(function(key)
    if key == bind then
        block_random_player()
        task.wait()
        player:Kick("hopping")
        while wait(.5) do
            game.TeleportService:Teleport(3016661674)
        end
        syn.request({
            Url = data,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode(JSONTable)
        })
    end
end)
