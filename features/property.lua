-- features/property.lua
if game.PlaceId ~= 13822889 then return end

-- FRAME
local PropertyFrame = Instance.new("Frame")
PropertyFrame.Size = UDim2.new(1, 0, 1, 0)
PropertyFrame.BackgroundTransparency = 1

RegisterTab("Property", PropertyFrame)

-- LAYOUT
local layout = Instance.new("UIListLayout", PropertyFrame)
layout.Padding = UDim.new(0, 8)

-- BUTTON MAKER
local function MakeButton(text, callback)
    local btn = Instance.new("TextButton", PropertyFrame)
    btn.Size = UDim2.new(0, 200, 0, 36)
    btn.Text = text
    btn.Font = Theme.Font
    btn.TextSize = 13
    btn.TextColor3 = Theme.Text
    btn.BackgroundColor3 = Theme.Background
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    btn.MouseButton1Click:Connect(function()
        local ok, err = pcall(callback)
        if not ok then
            Notify("Error: "..text)
        else
            Notify(text)
        end
    end)
end

-- ======================
-- PROPERTY FUNCTIONS
-- ======================

MakeButton("🪵 Free Land", FreeLand)
MakeButton("🪵 Max Land", MaxLand)

MakeButton("💾 Save Slot", function()
    ForceSave()
end)

-- LOAD SLOT 1–6
for slot = 1, 6 do
    MakeButton("📂 Load Slot "..slot, function()
        local success = LoadSlot(slot)
        if not success then
            Notify("Slot "..slot.." failed")
        end
    end)
end

Notify("Property Loaded (6 Slots)")
