-- core/tabs.lua

Tabs = {}

RegisterTab = function(name, frame)
    Tabs[name] = frame
end

SwitchTab = function(name)
    for _,v in pairs(Tabs) do
        v.Visible = false
    end
    if Tabs[name] then
        Tabs[name].Visible = true
        Notify(name.." Tab")
    end
end

print("[CORE] Tabs Loaded")
