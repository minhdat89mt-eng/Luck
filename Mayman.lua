-- [[ MINI RAINBOW MENU ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")
local MainButton = Instance.new("TextButton")
local SubText = Instance.new("TextLabel")

-- Cài đặt hiển thị
ScreenGui.Parent = game.CoreGui
MainFrame.Name = "MiniLuck"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Position = UDim2.new(0.5, -75, 0.2, 0)
MainFrame.Size = UDim2.new(0, 150, 0, 60) -- Kích thước tí hon
MainFrame.Active = true
MainFrame.Draggable = true 

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Viền cầu vồng (Bắt buộc màu trắng để hiện màu)
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2.5
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
}
UIGradient.Parent = UIStroke

-- Hiệu ứng xoay viền
task.spawn(function()
    while task.wait(0.01) do 
        UIGradient.Rotation = UIGradient.Rotation + 3 
    end
end)

-- Chữ nút bấm (Mặc định OFF màu Đỏ)
MainButton.Parent = MainFrame
MainButton.BackgroundTransparency = 1
MainButton.Size = UDim2.new(1, 0, 0.7, 0)
MainButton.Font = Enum.Font.SourceSansBold
MainButton.Text = "Luck: OFF"
MainButton.TextColor3 = Color3.fromRGB(255, 0, 0)
MainButton.TextSize = 15

-- Chữ xác nhận nhỏ
SubText.Parent = MainFrame
SubText.BackgroundTransparency = 1
SubText.Position = UDim2.new(0, 0, 0.6, 0)
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Text = "" 
SubText.TextColor3 = Color3.fromRGB(0, 150, 0)
SubText.TextSize = 10

-- Logic bật tắt
local active = false
MainButton.MouseButton1Click:Connect(function()
    active = not active
    if active then
        MainButton.Text = "Luck: ON"
        MainButton.TextColor3 = Color3.fromRGB(0, 200, 0)
        SubText.Text = "Buff successful 100%"
    else
        MainButton.Text = "Luck: OFF"
        MainButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        SubText.Text = ""
    end
end)
