local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local objects = {}

RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player == Players.LocalPlayer then continue end
        if not objects[player] then
            objects[player] = {bg = Drawing.new("Square"), bar = Drawing.new("Square")}
            objects[player].bg.Filled = true
            objects[player].bg.Color = Color3.new(0,0,0)
            objects[player].bar.Filled = true
            objects[player].bar.Color = Color3.fromRGB(0, 255, 0)
        end
        local char = player.Character
        local hum = char and char:FindFirstChild("Humanoid")
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp and hum then
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local dist = (Camera.CFrame.Position - hrp.Position).Magnitude
                local h = 4500 / dist
                local healthHeight = h * (hum.Health / hum.MaxHealth)
                objects[player].bg.Size = Vector2.new(4, h)
                objects[player].bg.Position = Vector2.new(pos.X - (3000/dist)/2 - 6, pos.Y - h/2)
                objects[player].bar.Size = Vector2.new(2, healthHeight)
                objects[player].bar.Position = Vector2.new(pos.X - (3000/dist)/2 - 5, pos.Y + h/2 - healthHeight)
                objects[player].bg.Visible = true
                objects[player].bar.Visible = true
            else objects[player].bg.Visible = false objects[player].bar.Visible = false end
        else objects[player].bg.Visible = false objects[player].bar.Visible = false end
    end
end)