-- [[ BẢN CHUẨN: KÍCH THƯỚC BÌNH THƯỜNG - VIỀN CẦU VỒNG ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")
local MainButton = Instance.new("TextButton")
local SubText = Instance.new("TextLabel")

-- Setup
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "NormalSizeMenu"

-- Khung kích thước bình thường (300x120)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
MainFrame.Position = UDim2.new(0.5, -150, 0.4, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 120) 
MainFrame.Active = true
MainFrame.Draggable = true 

-- Bo góc
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

-- Viền cầu vồng
UIStroke.Parent = MainFrame
UIStroke.Thickness = 4
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

-- Nút bấm chính (To rõ)
MainButton.Parent = MainFrame
MainButton.BackgroundTransparency = 1
MainButton.Position = UDim2.new(0, 0, 0.1, 0)
MainButton.Size = UDim2.new(1, 0, 0.5, 0)
MainButton.Font = Enum.Font.SourceSansBold
MainButton.Text = "Buff Luck x10: OFF"
MainButton.TextColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ
MainButton.TextSize = 28

-- Chữ nhỏ xác nhận
SubText.Parent = MainFrame
SubText.BackgroundTransparency = 1
SubText.Position = UDim2.new(0, 0, 0.6, 0)
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Font = Enum.Font.SourceSansItalic
SubText.Text = "" 
SubText.TextColor3 = Color3.fromRGB(0, 200, 0)
SubText.TextSize = 18

-- Logic
local enabled = false
MainButton.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        MainButton.Text = "Buff Luck x10: ON"
        MainButton.TextColor3 = Color3.fromRGB(0, 220, 0)
        SubText.Text = "Buff successful 100%"
    else
        MainButton.Text = "Buff Luck x10: OFF"
        MainButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        SubText.Text = ""
    end
end)
