local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local objects = {}

RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player == Players.LocalPlayer then continue end
        if not objects[player] then
            objects[player] = Drawing.new("Line")
            objects[player].Thickness = 1
            objects[player].Color = Color3.new(1, 1, 1)
        end
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                objects[player].From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                objects[player].To = Vector2.new(pos.X, pos.Y)
                objects[player].Visible = true
            else objects[player].Visible = false end
        else objects[player].Visible = false end
    end
end)