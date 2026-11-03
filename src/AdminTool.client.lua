-- AdminTool.client.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local AdminEvent = ReplicatedStorage:WaitForChild("AdminEvent")

-- GUI setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AdminToolGUI"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local GodmodeButton = Instance.new("TextButton")
GodmodeButton.Size = UDim2.new(0, 180, 0, 30)
GodmodeButton.Position = UDim2.new(0, 10, 0, 10)
GodmodeButton.Text = "Toggle Godmode"
GodmodeButton.Parent = Frame

local InvisibilityButton = Instance.new("TextButton")
InvisibilityButton.Size = UDim2.new(0, 180, 0, 30)
InvisibilityButton.Position = UDim2.new(0, 10, 0, 50)
InvisibilityButton.Text = "Toggle Invisibility"
InvisibilityButton.Parent = Frame

local ESPButton = Instance.new("TextButton")
ESPButton.Size = UDim2.new(0, 180, 0, 30)
ESPButton.Position = UDim2.new(0, 10, 0, 90)
ESPButton.Text = "Toggle ESP"
ESPButton.Parent = Frame

-- Button event handlers
GodmodeButton.MouseButton1Click:Connect(function()
    AdminEvent:FireServer("Godmode", not Player.Character.Humanoid.MaxHealth == math.huge)
end)

InvisibilityButton.MouseButton1Click:Connect(function()
    local transparency = Player.Character.Head.Transparency
    AdminEvent:FireServer("Invisibility", transparency == 0)
end)

ESPButton.MouseButton1Click:Connect(function()
    AdminEvent:FireServer("ESP", not Player.Character.Head.Material == Enum.Material.Neon)
end)