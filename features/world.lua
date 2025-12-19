-- features/world.lua
if game.PlaceId ~= 13822889 then return end

local WorldFrame = Instance.new("Frame")
WorldFrame.Size = UDim2.new(1, 0, 1, 0)
WorldFrame.BackgroundTransparency = 1

RegisterTab("World", WorldFrame)

local layout = Instance.new("UIListLayout", WorldFrame)
layout.Padding = UDim.new(0, 8)

local function MakeToggle(text, callback)
    local state = false
    local btn = Instance.new("TextButton", WorldFrame)
    btn.Size = UDim2.new(0, 200, 0, 36)
    btn.Text = text.." : OFF"
    btn.Font = Theme.Font
    btn.TextSize = 13
    btn.TextColor3 = Theme.Text
    btn.BackgroundColor3 = Theme.Background
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text.." : "..(state and "ON" or "OFF")
        pcall(callback, state)
        Notify(text.." "..(state and "ON" or "OFF"))
    end)
end

-- DAY / NIGHT
MakeToggle("☀️ Always Day", function(state)
    AlwaysDay = state
    AlwaysNight = false
end)

MakeToggle("🌙 Always Night", function(state)
    AlwaysNight = state
    AlwaysDay = false
end)

-- REMOVE SPOOK
MakeToggle("🎃 Remove Spook", function(state)
    if state then
        RemoveSpookMode()
    end
end)

-- WATER
MakeToggle("🌊 Clear Water", function(state)
    ChangeWater("Transparency", state and 0.2 or 0)
end)

-- BRIDGE
MakeToggle("🌉 Bridge Down", function(state)
    BridgeDown(state)
end)

Notify("World Tab Loaded")
