-- features/player.lua
if game.PlaceId ~= 13822889 then return end

local PlayerFrame = Instance.new("Frame")
PlayerFrame.Size = UDim2.new(1, 0, 1, 0)
PlayerFrame.BackgroundTransparency = 1

RegisterTab("Player", PlayerFrame)

local layout = Instance.new("UIListLayout", PlayerFrame)
layout.Padding = UDim.new(0, 8)

-- BUTTON MAKER
local function MakeButton(text, toggle, callback)
    local btn = Instance.new("TextButton", PlayerFrame)
    btn.Size = UDim2.new(0, 200, 0, 36)
    btn.Text = text.." : OFF"
    btn.Font = Theme.Font
    btn.TextSize = 13
    btn.TextColor3 = Theme.Text
    btn.BackgroundColor3 = Theme.Background
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    btn.MouseButton1Click:Connect(function()
        toggle.Value = not toggle.Value
        btn.Text = text.." : "..(toggle.Value and "ON" or "OFF")
        pcall(callback, toggle.Value)
        Notify(text.." "..(toggle.Value and "ON" or "OFF"))
    end)
end

-- ======================
-- FLY
-- ======================
local FlyToggle = Instance.new("BoolValue")
FlyToggle.Value = false

MakeButton("✈️ Fly", FlyToggle, function(state)
    PlayerFly(state)
end)

-- ======================
-- NOCLIP
-- ======================
local NoclipToggle = Instance.new("BoolValue")
NoclipToggle.Value = false
local noclipConn

MakeButton("🚪 Noclip", NoclipToggle, function(state)
    if state then
        NoClip()
    else
        if NoClipConnection then
            NoClipConnection:Disconnect()
        end
    end
end)

Notify("Player Tab Loaded")
