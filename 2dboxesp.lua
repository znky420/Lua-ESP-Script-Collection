local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local objects = {}

RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player == Players.LocalPlayer then continue end
        if not objects[player] then
            objects[player] = Drawing.new("Square")
            objects[player].Thickness = 1
            objects[player].Color = Color3.fromRGB(255, 0, 0)
        end
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local dist = (Camera.CFrame.Position - hrp.Position).Magnitude
                local sizeX = 3000 / dist
                local sizeY = 4500 / dist
                objects[player].Size = Vector2.new(sizeX, sizeY)
                objects[player].Position = Vector2.new(pos.X - sizeX/2, pos.Y - sizeY/2)
                objects[player].Visible = true
            else objects[player].Visible = false end
        else objects[player].Visible = false end
    end
end)
