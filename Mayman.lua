-- [[ RAINBOW BORDER - WHITE BACKGROUND - BLACK TEXT ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")
local MainButton = Instance.new("TextButton")
local SubText = Instance.new("TextLabel")

-- GUI Configuration
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "WhiteRainbowMenu"

-- Main Horizontal Frame (Movable)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Pure White Background
MainFrame.Position = UDim2.new(0.5, -125, 0.4, 0)
MainFrame.Size = UDim2.new(0, 260, 0, 100)
MainFrame.Active = true
MainFrame.Draggable = true 

-- Rounded Corners (Góc không nhọn)
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

-- Rainbow Border Effect
UIStroke.Parent = MainFrame
UIStroke.Thickness = 4
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
}
UIGradient.Parent = UIStroke

-- Animation for Rainbow Border
task.spawn(function()
    local rotation = 0
    while task.wait(0.02) do
        rotation = rotation + 2
        UIGradient.Rotation = rotation % 360
    end
end)

-- Main Interaction Button (Black Text)
MainButton.Name = "MainButton"
MainButton.Parent = MainFrame
MainButton.BackgroundTransparency = 1
MainButton.Size = UDim2.new(1, 0, 0.6, 0)
MainButton.Font = Enum.Font.SourceSansBold
MainButton.Text = "Buff Luck x10: OFF"
MainButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black Text
MainButton.TextSize = 22

-- Small Subtext (Black Text)
SubText.Name = "SubText"
SubText.Parent = MainFrame
SubText.BackgroundTransparency = 1
SubText.Position = UDim2.new(0, 0, 0.6, 0)
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Font = Enum.Font.SourceSansItalic
SubText.Text = "" 
SubText.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black Text
SubText.TextSize = 14

-- Toggle Functionality
local toggled = false
MainButton.MouseButton1Click:Connect(function()
    toggled = not toggled
    if toggled then
        MainButton.Text = "Buff Luck x10: ON"
        SubText.Text = "Buff successful 100%"
        print("Status: Luck Boosted x10")
    else
        MainButton.Text = "Buff Luck x10: OFF"
        SubText.Text = ""
        print("Status: Luck Disabled")
    end
end)
