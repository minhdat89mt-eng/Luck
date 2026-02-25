-- [[ FINAL VERSION: RAINBOW BORDER + DYNAMIC COLOR TEXT ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")
local MainButton = Instance.new("TextButton")
local SubText = Instance.new("TextLabel")

-- GUI Configuration
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "FinalLuckMenu"

-- Main Horizontal Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Nền trắng tinh
MainFrame.Position = UDim2.new(0.5, -130, 0.4, 0)
MainFrame.Size = UDim2.new(0, 260, 0, 110)
MainFrame.Active = true
MainFrame.Draggable = true 

-- Rounded Corners (Góc bo tròn cực mượt)
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

-- Rainbow Border (Tạo viền bảy sắc cầu vồng)
UIStroke.Parent = MainFrame
UIStroke.Thickness = 4 -- Độ dày viền
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
}
UIGradient.Parent = UIStroke

-- Loop làm cho viền cầu vồng xoay vòng liên tục
task.spawn(function()
    local rotation = 0
    while task.wait(0.01) do
        rotation = rotation + 2
        UIGradient.Rotation = rotation % 360
    end
end)

-- Main Button (Chữ đổi màu theo trạng thái)
MainButton.Name = "MainButton"
MainButton.Parent = MainFrame
MainButton.BackgroundTransparency = 1
MainButton.Size = UDim2.new(1, 0, 0.6, 0)
MainButton.Font = Enum.Font.SourceSansBold
MainButton.Text = "Buff Luck x10: OFF"
MainButton.TextColor3 = Color3.fromRGB(255, 0, 0) -- Mặc định màu Đỏ
MainButton.TextSize = 25

-- Subtext (Chữ nhỏ hiện ra khi bật)
SubText.Name = "SubText"
SubText.Parent = MainFrame
SubText.BackgroundTransparency = 1
SubText.Position = UDim2.new(0, 0, 0.6, 0)
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Font = Enum.Font.SourceSansItalic
SubText.Text = "" -- Trống khi OFF
SubText.TextColor3 = Color3.fromRGB(0, 200, 0) -- Chữ nhỏ màu xanh lá cho đẹp
SubText.TextSize = 16

-- Logic bật/tắt (Toggle)
local isEnabled = false
MainButton.MouseButton1Click:Connect(function()
    isEnabled = not isEnabled
    if isEnabled then
        -- Khi bật: Chữ Xanh lá + Hiện dòng xác nhận
        MainButton.Text = "Buff Luck x10: ON"
        MainButton.TextColor3 = Color3.fromRGB(0, 200, 0) 
        SubText.Text = "Buff successful 100%"
        print("Luck Buff: Activated")
    else
        -- Khi tắt: Chữ Đỏ + Ẩn dòng xác nhận
        MainButton.Text = "Buff Luck x10: OFF"
        MainButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        SubText.Text = ""
        print("Luck Buff: Deactivated")
    end
end)
