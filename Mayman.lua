-- [[ LONG VERSION: RAINBOW BORDER + DYNAMIC COLOR TEXT ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")
local MainButton = Instance.new("TextButton")
local SubText = Instance.new("TextLabel")

-- GUI Configuration
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "FinalLuckMenuLong"

-- Main Horizontal Frame (Điều chỉnh Size dài hơn: 300x120)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Nền trắng tinh
MainFrame.Position = UDim2.new(0.5, -150, 0.4, 0) -- Căn giữa dựa trên chiều dài mới
MainFrame.Size = UDim2.new(0, 300, 0, 120) -- Tăng chiều ngang cho giống ảnh mẫu
MainFrame.Active = true
MainFrame.Draggable = true 

-- Rounded Corners (Bo góc mềm mại)
UICorner.CornerRadius = UDim.new(0, 25)
UICorner.Parent = MainFrame

-- Rainbow Border (Viền bảy sắc cầu vồng rực rỡ)
UIStroke.Parent = MainFrame
UIStroke.Thickness = 5 -- Viền dày hơn tí cho rõ màu
UIStroke.Color = Color3.fromRGB(255, 255, 255) -- Bắt buộc là trắng để hiện Gradient
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

-- Animation xoay viền cầu vồng
task.spawn(function()
    local rot = 0
    while task.wait(0.01) do
        rot = rot + 2.5 -- Tốc độ xoay nhanh hơn chút cho sinh động
        UIGradient.Rotation = rot % 360
    end
end)

-- Main Button (Chữ đen đổi màu Xanh/Đỏ)
MainButton.Name = "MainButton"
MainButton.Parent = MainFrame
MainButton.BackgroundTransparency = 1
MainButton.Position = UDim2.new(0, 0, 0.1, 0) -- Căn chỉnh lại vị trí chữ
MainButton.Size = UDim2.new(1, 0, 0.5, 0)
MainButton.Font = Enum.Font.SourceSansBold
MainButton.Text = "Buff Luck x10: OFF"
MainButton.TextColor3 = Color3.fromRGB(255, 0, 0) -- Màu Đỏ khi OFF
MainButton.TextSize = 28 -- Chữ to rõ ràng

-- Subtext (Dòng chữ nhỏ bên dưới)
SubText.Name = "SubText"
SubText.Parent = MainFrame
SubText.BackgroundTransparency = 1
SubText.Position = UDim2.new(0, 0, 0.6, 0)
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Font = Enum.Font.SourceSansItalic
SubText.Text = "" -- Trống khi OFF
SubText.TextColor3 = Color3.fromRGB(0, 180, 0) -- Màu xanh lá đậm khi hiện
SubText.TextSize = 18

-- Logic Bật/Tắt
local enabled = false
MainButton.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        MainButton.Text = "Buff Luck x10: ON"
        MainButton.TextColor3 = Color3.fromRGB(0, 220, 0) -- Xanh lá cực sáng khi ON
        SubText.Text = "Buff successful 100%"
    else
        MainButton.Text = "Buff Luck x10: OFF"
        MainButton.TextColor3 = Color3.fromRGB(255, 0, 0) -- Đỏ khi OFF
        SubText.Text = ""
    end
end)
