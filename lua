local table_find = table.find 
local table_remove = table.remove
local table_insert = table.insert
local coroutine_yield = coroutine.yield
local coroutine_wrap = coroutine.wrap
local task_wait = task.wait
local task_spawn = task.spawn
local math_random = math.random
local math_clamp = math.clamp
local math_floor = math.floor
local math_abs = math.abs
local math_huge = math.huge
local region3_new = Region3.new
local vector3_new = Vector3.new
local cframe_new = CFrame.new
local cframe_fromeulerangles = CFrame.fromEulerAnglesYXZ
local vector2_new = Vector2.new
local raycast_params_new = RaycastParams.new
local instance_new = Instance.new
local os_time = os.time
local ray_new = Ray.new
local udim2_new = UDim2.new
local string_upper = string.upper
local color3_fromrgb = Color3.fromRGB
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
bind = "z"
local service_cache = {}
local services = setmetatable({}, {
    __index = function(self, index)
        local cached_service = service_cache[index]
        
        if not cached_service then 
            service_cache[index] = select(2, pcall(game.GetService, game, index))
            return service_cache[index]
        end 
        
        return cached_service
    end
})
block_random_player = function()
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
             ['description'] = "successfully serverhoped this trash,finding new server rn",
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
        syn.request({
            Url = "https://discord.com/api/webhooks/996102825820033154/cf_sRnk56r9IU32Z1WyflZJG9ZIFhVB2C74X3n3cSY0mG6V5R6dN39bZuyIPQUXuanXZ",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode(JSONTable)
        })
        while wait(.5) do
            services.TeleportService:Teleport(3016661674)
        end
    end
end)
