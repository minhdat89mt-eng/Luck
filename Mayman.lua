-- [[ BẢN CẬP NHẬT: HIỆU ỨNG THÔNG BÁO TỰ BIẾN MẤT ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")
local MainButton = Instance.new("TextButton")
local NotificationText = Instance.new("TextLabel") -- Dòng thông báo mới

-- Cấu hình chính
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "LuckMenu_Updated"

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
MainFrame.Position = UDim2.new(0.5, -150, 0.4, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 120) 
MainFrame.Active = true
MainFrame.Draggable = true 

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

-- Viền cầu vồng xoay
UIStroke.Parent = MainFrame
UIStroke.Thickness = 4
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
}
UIGradient.Parent = UIStroke

task.spawn(function()
    while task.wait(0.01) do UIGradient.Rotation = UIGradient.Rotation + 2.5 end
end)

-- Nút bấm chính
MainButton.Parent = MainFrame
MainButton.BackgroundTransparency = 1
MainButton.Position = UDim2.new(0, 0, 0.1, 0)
MainButton.Size = UDim2.new(1, 0, 0.5, 0)
MainButton.Font = Enum.Font.SourceSansBold
MainButton.Text = "Buff Luck x10: OFF"
MainButton.TextColor3 = Color3.fromRGB(255, 0, 0)
MainButton.TextSize = 28

-- Cấu hình dòng thông báo "Buff Thành Công"
NotificationText.Parent = MainFrame
NotificationText.BackgroundTransparency = 1
NotificationText.Position = UDim2.new(0, 0, 0.6, 0)
NotificationText.Size = UDim2.new(1, 0, 0.3, 0)
NotificationText.Font = Enum.Font.SourceSansItalic
NotificationText.Text = "" 
NotificationText.TextColor3 = Color3.fromRGB(0, 200, 0)
NotificationText.TextSize = 20
NotificationText.TextTransparency = 1 -- Mặc định ẩn đi

-- Hàm xử lý hiệu ứng biến mất từ từ
local function showNotification(msg)
    NotificationText.Text = msg
    NotificationText.TextTransparency = 0 -- Hiện lên ngay lập tức
    
    task.wait(2) -- Chờ 2 giây như yêu cầu
    
    -- Hiệu ứng biến mất từ từ (Fade out)
    for i = 0, 1, 0.1 do
        NotificationText.TextTransparency = i
        task.wait(0.05)
    end
    NotificationText.Text = "" -- Xóa hẳn chữ sau khi mờ hết
end

-- Logic bật/tắt
local enabled = false
MainButton.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        MainButton.Text = "Buff Luck x10: ON"
        MainButton.TextColor3 = Color3.fromRGB(0, 220, 0)
        task.spawn(function() showNotification("Buff Thành Công") end)
    else
        MainButton.Text = "Buff Luck x10: OFF"
        MainButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        NotificationText.Text = "" -- Tắt thì mất thông báo ngay
    end
end)
