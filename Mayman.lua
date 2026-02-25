-- [[ ĐÂY LÀ BẢN CHUẨN 100% - VIỀN CẦU VỒNG + CHỮ ĐỔI MÀU ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")
local MainButton = Instance.new("TextButton")
local SubText = Instance.new("TextLabel")

-- Cấu hình hiển thị
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "RealRainbowMenu"

-- Menu chính (Hình chữ nhật nằm ngang)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Nền trắng tinh
MainFrame.Position = UDim2.new(0.5, -150, 0.4, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 130) -- Dài và cân đối hơn
MainFrame.Active = true
MainFrame.Draggable = true -- Có thể di chuyển được

-- Bo góc (Góc tròn, không nhọn)
UICorner.CornerRadius = UDim.new(0, 25)
UICorner.Parent = MainFrame

-- VIỀN CẦU VỒNG (Phần quan trọng nhất)
UIStroke.Parent = MainFrame
UIStroke.Thickness = 5 -- Viền dày cho đẹp
UIStroke.Color = Color3.fromRGB(255, 255, 255) -- BẮT BUỘC TRẮNG để hiện cầu vồng
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),    -- Đỏ
    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 255, 0)),-- Vàng
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 255, 0)),  -- Xanh lá
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)),-- Xanh dương
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(150, 0, 255)),-- Tím
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))     -- Quay lại Đỏ
}
UIGradient.Parent = UIStroke

-- Hiệu ứng cầu vồng xoay vòng liên tục
task.spawn(function()
    local rot = 0
    while task.wait(0.01) do
        rot = rot + 2
        UIGradient.Rotation = rot % 360
    end
end)

-- Nút bấm (Mặc định OFF - Màu Đỏ)
MainButton.Name = "MainButton"
MainButton.Parent = MainFrame
MainButton.BackgroundTransparency = 1
MainButton.Position = UDim2.new(0, 0, 0.1, 0)
MainButton.Size = UDim2.new(1, 0, 0.5, 0)
MainButton.Font = Enum.Font.SourceSansBold
MainButton.Text = "Buff Luck x10: OFF"
MainButton.TextColor3 = Color3.fromRGB(255, 0, 0) -- Màu Đỏ mặc định
MainButton.TextSize = 28

-- Chữ nhỏ xác nhận (Hiện khi ON)
SubText.Name = "SubText"
SubText.Parent = MainFrame
SubText.BackgroundTransparency = 1
SubText.Position = UDim2.new(0, 0, 0.6, 0)
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Font = Enum.Font.SourceSansItalic
SubText.Text = "" 
SubText.TextColor3 = Color3.fromRGB(0, 200, 0) -- Màu xanh lá
SubText.TextSize = 18

-- Logic Bật/Tắt chuẩn
local isEnabled = false
MainButton.MouseButton1Click:Connect(function()
    isEnabled = not isEnabled
    if isEnabled then
        -- Trạng thái ON
        MainButton.Text = "Buff Luck x10: ON"
        MainButton.TextColor3 = Color3.fromRGB(0, 220, 0) -- Chuyển sang Xanh
        SubText.Text = "Buff successful 100%"
    else
        -- Trạng thái OFF
        MainButton.Text = "Buff Luck x10: OFF"
        MainButton.TextColor3 = Color3.fromRGB(255, 0, 0) -- Chuyển sang Đỏ
        SubText.Text = ""
    end
end)
