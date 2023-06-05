
--require("prototypes/technologies")

data:extend(
{
  {
    type = "virtual-signal",
    name = "biter-built-warning",
    icon = "__MilitaryNerf__/graphics/biter-warning.png",
    icon_size = 64
  }
}
)


data.raw["spider-vehicle"]["spidertron"].energy_source = {
    type = "burner",
    emissions_per_minute = 16,
    effectivity = 0.75,
    render_no_power_icon = true,
    render_no_network_icon = false,
    fuel_inventory_size = 2,
    burnt_inventory_size = 2,
    fuel_category = "nuclear",
  }
  data.raw["spider-vehicle"]["spidertron"].movement_energy_consumption = "39MW"
  data.raw["spider-vehicle"]["spidertron"].weight = 12000
  data.raw["spider-vehicle"]["spidertron"].braking_force = 0.05
  data.raw["spider-vehicle"]["spidertron"].friction_force = 0.05

--[[
   local fusion_fuel_category = {
    name = "fusion",
    type = "fuel-category"
  }
  
  local reactor = table.deepcopy(data.raw["generator-equipment"]["fusion-reactor-equipment"])
  reactor.burner = {
    type = "burner",
    fuel_inventory_size = 1,
    burnt_inventory_size = 1,
    fuel_category = "fusion",
    effectivity = 0.75
  }
    
  data:extend{fusion_fuel_category,reactor}
]]
