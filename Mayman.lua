-- UI Library for a Rounded Rainbow Menu
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local ToggleButton = Instance.new("TextButton")
local SubText = Instance.new("TextLabel")

-- Properties
ScreenGui.Parent = game.CoreGui

MainFrame.Name = "LuckyMenu"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 120)
MainFrame.Active = true
MainFrame.Draggable = true -- Make it movable

-- Rounded Corners (Góc không được nhọn)
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Rainbow Border Effect (Viền bảy sắc cầu vồng)
local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 3
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Stroke.Parent = MainFrame

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
}
UIGradient.Parent = Stroke

-- Rainbow Animation
spawn(function()
    while true do
        for i = 0, 1, 0.01 do
            UIGradient.Rotation = i * 360
            task.wait(0.02)
        end
    end
end)

-- Main Button
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = MainFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.BackgroundTransparency = 1
ToggleButton.Size = UDim2.new(1, 0, 0.6, 0)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Text = "Buff Luck x10: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 20

-- Subtext (Chữ nhỏ bên dưới)
SubText.Parent = MainFrame
SubText.BackgroundTransparency = 1
SubText.Position = UDim2.new(0, 0, 0.6, 0)
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Font = Enum.Font.SourceSansItalic
SubText.Text = ""
SubText.TextColor3 = Color3.fromRGB(200, 200, 200)
SubText.TextSize = 14

-- Toggle Logic
local isEnabled = false
ToggleButton.MouseButton1Click:Connect(function()
    isEnabled = not isEnabled
    if isEnabled then
        ToggleButton.Text = "Buff Luck x10: ENABLED"
        ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 0)
        SubText.Text = "Buff successful 100%"
        print("Luck Buff Activated!")
    else
        ToggleButton.Text = "Buff Luck x10: OFF"
        ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        SubText.Text = ""
        print("Luck Buff Deactivated!")
    end
end)
