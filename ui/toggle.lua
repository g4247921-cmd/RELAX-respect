-- ui/toggle.lua

local visible = true

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        visible = not visible
        PlayerGui.RELAX_UI.Enabled = visible
        Notify(visible and "GUI Opened" or "GUI Closed")
    end
end)

print("[UI] Toggle Ready (RightShift)")
