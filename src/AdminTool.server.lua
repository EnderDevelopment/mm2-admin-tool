-- AdminTool.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AdminTool = {}

-- Admin commands
AdminTool.Commands = {
    Godmode = function(player, enabled)
        if enabled then
            player.Character.Humanoid.MaxHealth = math.huge
            player.Character.Humanoid.Health = math.huge
        else
            player.Character.Humanoid.MaxHealth = 100
            player.Character.Humanoid.Health = 100
        end
    end,
    
    Invisibility = function(player, enabled)
        if enabled then
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = 1
                end
            end
        else
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = 0
                end
            end
        end
    end,
    
    ESP = function(player, enabled)
        if enabled then
            for _, otherPlayer in ipairs(Players:GetPlayers()) do
                if otherPlayer ~= player then
                    for _, part in ipairs(otherPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Material = Enum.Material.Neon
                            part.Color = Color3.new(1, 0, 0)
                        end
                    end
                end
            end
        else
            for _, otherPlayer in ipairs(Players:GetPlayers()) do
                if otherPlayer ~= player then
                    for _, part in ipairs(otherPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Material = Enum.Material.Plastic
                            part.Color = Color3.new(1, 1, 1)
                        end
                    end
                end
            end
        end
    end
}

-- Remote event for handling commands
local AdminEvent = Instance.new("RemoteEvent")
AdminEvent.Name = "AdminEvent"
AdminEvent.Parent = ReplicatedStorage

AdminEvent.OnServerEvent:Connect(function(player, command, ...)
    if AdminTool.Commands[command] then
        AdminTool.Commands[command](player, ...)
    end
end)

return AdminTool