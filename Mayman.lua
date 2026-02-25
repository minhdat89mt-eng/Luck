-- [[ SUPER SMALL & COMPACT RAINBOW MENU ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")
local MainButton = Instance.new("TextButton")
local SubText = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "MiniLuckMenu"

-- Khung siêu nhỏ (180x65)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Position = UDim2.new(0.5, -90, 0.3, 0) -- Đẩy lên trên một chút
MainFrame.Size = UDim2.new(0, 180, 0, 65) -- Kích thước cực nhỏ
MainFrame.Active = true
MainFrame.Draggable = true 

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Viền cầu vồng siêu mỏng
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2.5
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
}
UIGradient.Parent = UIStroke

task.spawn(function()
    local r = 0
    while task.wait(0.01) do
        r = r + 2.5
        UIGradient.Rotation = r % 360
    end
end)

-- Nút bấm (Text nhỏ gọn)
MainButton.Parent = MainFrame
MainButton.BackgroundTransparency = 1
MainButton.Size = UDim2.new(1, 0, 0.7, 0)
MainButton.Font = Enum.Font.SourceSansBold
MainButton.Text = "Luck x10: OFF"
MainButton.TextColor3 = Color3.fromRGB(255, 0, 0)
MainButton.TextSize = 16 -- Giảm cỡ chữ

-- Chữ phụ nhỏ xíu
SubText.Parent = MainFrame
SubText.BackgroundTransparency = 1
SubText.Position = UDim2.new(0, 0, 0.65, 0)
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Font = Enum.Font.SourceSansItalic
SubText.Text = "" 
SubText.TextColor3 = Color3.fromRGB(0, 150, 0)
SubText.TextSize = 11

-- Logic
local isEnabled = false
MainButton.MouseButton1Click:Connect(function()
    isEnabled = not isEnabled
    if isEnabled then
        MainButton.Text = "Luck x
            
