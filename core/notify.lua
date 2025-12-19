-- core/notify.lua

Notify = function(text)
    local gui = Instance.new("ScreenGui")
    gui.Name = "RLX_Notify"
    gui.Parent = PlayerGui

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0,260,0,40)
    frame.Position = UDim2.new(1,-280,1,-60)
    frame.BackgroundColor3 = Color3.fromRGB(50,35,20)
    frame.BackgroundTransparency = 0.1
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,8)

    local txt = Instance.new("TextLabel", frame)
    txt.Size = UDim2.new(1,-10,1,0)
    txt.Position = UDim2.new(0,5,0,0)
    txt.Text = text
    txt.Font = Enum.Font.GothamBold
    txt.TextSize = 12
    txt.TextColor3 = Color3.fromRGB(240,220,190)
    txt.BackgroundTransparency = 1
    txt.TextXAlignment = Left

    TweenService:Create(
        frame,
        TweenInfo.new(0.3),
        {Position = UDim2.new(1,-280,1,-110)}
    ):Play()

    task.delay(2, function()
        TweenService:Create(
            frame,
            TweenInfo.new(0.3),
            {Position = UDim2.new(1,-280,1,-60)}
        ):Play()
        task.wait(0.3)
        gui:Destroy()
    end)
end

print("[CORE] Notify Loaded")
