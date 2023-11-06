#include <imgui_internal.h>
gui.show_message("Acid Lab V0.1", "by wanz")
acidlabs_gui = gui.get_tab("GUI_TAB_NETWORK"):add_tab("Acid Lab")
acidlabs_gui:add_text("Values")
acidlabs_gui:add_separator()
local checkboxvalue          = acidlabs_gui:add_checkbox("Acid value settings enable")
acidlabs_gui:add_text("Dont exceed < 2M")
acidlabs_gui:add_imgui(function()
    productvalue, used = ImGui.DragInt("Product value", productvalue, 250.0, 0, 99999)
    return globals.get_int(262145 + 17605)
    end)
--acidlabs_gui:add_imgui(function()
    --supplycost, used = ImGui.DragInt("Change supplies cost", supplycost, 1.0, 0, 10)
    --return globals.get_int(262145+21869)
   -- end)

acidlabs_gui:add_separator()
acidlabs_gui:add_text("Product settings")
acidlabs_gui:add_separator()
local checkboxproduct        = acidlabs_gui:add_checkbox("Product settings enable")
acidlabs_gui:add_imgui(function()
    capacity, used = ImGui.DragInt("Product Capacity", capacity, 20.0, 50, 1000)
    return globals.get_int(262145 + 19129)
    end)
acidlabs_gui:add_imgui(function()
    delivery, used = ImGui.DragInt("Supplies delivery amount", delivery,  15.0, 50, 1000)
    return globals.get_int(262145 + 32918)
    end)
acidlabs_gui:add_separator()
acidlabs_gui:add_text("Production time")
acidlabs_gui:add_separator()
local checkboxboost = acidlabs_gui:add_checkbox("Boost production")
acidlabs_gui:add_imgui(function()
    prdcttime, used = ImGui.DragInt("Acid Labs Production time", prdcttime, 1.0, 1, 135)
    return globals.get_int(262145 + 17396)
    end)

productvalue = 2095
productvaluedefault = 2095
capacity = 50
delivery = 50
supplycost = 1
prdcttime = 135


script.register_looped("acidlabloop", function (script)

        script:yield()
        if checkboxvalue:is_enabled() == false then
            globals.set_int(262145 + 17605, productvaluedefault)
        end   
        if checkboxvalue:is_enabled() == true then
        globals.set_int(262145 + 17605, productvalue)
     --   globals.set_int(262145 + 21869, supplycost)
        end
        if checkboxproduct:is_enabled() == true then
            globals.set_int(262145+19129, capacity)
            globals.set_int(262145+32918, delivery)
        end
        if checkboxproduct:is_enabled() == false then
            globals.set_int(262145+19129, 50)
            globals.set_int(262145+32918, 50)
        end
        if checkboxboost:is_enabled() == true then
            globals.set_int(262145 + 17576, 1)
            globals.set_int(262145 + 17396, prdcttime)          
        end
        if checkboxboost:is_enabled() == false then
            globals.set_int(262145 + 17576, 0)
            globals.set_int(262145 + 17396, 135)    

        end
end)
