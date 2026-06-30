local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local objects = {}

RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player == Players.LocalPlayer then continue end
        if not objects[player] then
            objects[player] = Drawing.new("Text")
            objects[player].Center = true
            objects[player].Outline = true
            objects[player].Color = Color3.fromRGB(255, 255, 0)
        end
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local dist = (Camera.CFrame.Position - hrp.Position).Magnitude
                objects[player].Size = math.clamp(800/dist, 8, 14)
                objects[player].Text = math.floor(dist) .. " studs"
                objects[player].Position = Vector2.new(pos.X, pos.Y + (4000/dist)/2 + 5)
                objects[player].Visible = true
            else objects[player].Visible = false end
        else objects[player].Visible = false end
    end
end)