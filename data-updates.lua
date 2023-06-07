--[[
local water_barrel = data.raw.item["mineral-water-barrel"]
water_barrel.burnt_result = "empty-barrel"
water_barrel.fuel_value = "0.5GJ"
water_barrel.fuel_category = "fusion"
]]

local energy
local energyNum

for _, shield in pairs(data.raw["energy-shield-equipment"]) do
    if shield.energy_per_shield then
        energy = string.match(shield.energy_per_shield, "(%d+)kJ")
        energyNum = tonumber(energy) * 2
        shield.energy_per_shield = energyNum .. "kJ"
    end
end

for _, legs in pairs(data.raw["movement-bonus-equipment"]) do
    legs.movement_bonus = legs.movement_bonus / 2
    if legs.energy_consumption then
        energy = string.match(legs.energy_consumption, "(%d+)kW")
        energyNum = tonumber(energy) * 2.0
        legs.energy_consumption = energyNum .. "kW"
    end
end

local laser_def = data.raw["active-defense-equipment"]["personal-laser-defense-equipment"]
laser_def.attack_parameters.ammo_type.energy_consumption = "120kJ"

data.raw.capsule["raw-fish"].capsule_action.attack_parameters.cooldown = 60

local t_recipe = data.raw.recipe["rocket"].ingredients
for i, component in pairs(t_recipe) do
  for _, value in pairs(component) do
    if value == "electronic-circuit" then
      t_recipe[i] = {type="item", name="advanced-circuit", amount=1}
      break
    end
  end
end

if mods["RampantArsenal"] then
    data.raw.capsule["healing-capsule-rampant-arsenal"].capsule_action.attack_parameters.cooldown = 60

end

data:extend({
    {
        type = "energy-shield-equipment",
        name = "mn-energy-shield-mk1-equipment",
        sprite = {
          filename = "__MilitaryNerf__/graphics/shields/energy-shield-mk1-equipment.png",
          width = 64,
          height = 64,
          priority = "medium",
          hr_version = {
            filename = "__MilitaryNerf__/graphics/shields/hr-energy-shield-mk1-equipment.png",
            width = 128,
            height = 128,
            priority = "medium",
            scale = 0.5,
          },
        },
        shape = {
          width = 3,
          height = 3,
          type = "full",
        },
        max_shield_value = 80, -- +35% capacity
        energy_per_shield = "20kJ", -- (-50% after nerfing others)
        energy_source = {
          type = "electric",
          buffer_capacity = "180kJ", -- +50% bonus
          input_flow_limit = "240kW",
          usage_priority = "primary-input",
        },
        categories = { "zd-turret-pod-equipment-basic-category" },
      },
      {
        type = "energy-shield-equipment",
        name = "mn-energy-shield-mk2-equipment",
        sprite = {
          filename = "__MilitaryNerf__/graphics/shields/energy-shield-mk2-equipment.png",
          width = 64,
          height = 64,
          priority = "medium",
          hr_version = {
            filename = "__MilitaryNerf__/graphics/shields/hr-energy-shield-mk2-equipment.png",
            width = 128,
            height = 128,
            priority = "medium",
            scale = 0.5,
          },
        },
        shape = {
          width = 3,
          height = 3,
          type = "full",
        },
        max_shield_value = 240, -- +35% capacity
        energy_per_shield = "30kJ", -- (-50% after nerfing others)
        energy_source = {
          type = "electric",
          buffer_capacity = "270kJ", -- +50% bonus
          input_flow_limit = "360kW",
          usage_priority = "primary-input",
        },
        categories = { "zd-turret-pod-equipment-basic-category" },
      },

      {
        type = "item",
        name = "mn-energy-shield-mk1-equipment",
        icons = {
          {
            icon = "__MilitaryNerf__/graphics/shields/icons/energy-shield-mk1-equipment.png",
            icon_size = 64,
            mipmap_count = 4,
          },
          { icon = "__TurretPod__/graphics/icons/tiers/1.png", icon_size = 64 },
        },
        placed_as_equipment_result = "mn-energy-shield-mk1-equipment",
        subgroup = "equipment",
        order = "b[shield]-c[energy-shield-equipment-mk1]",
        stack_size = 50,
      },
      {
        type = "item",
        name = "mn-energy-shield-mk2-equipment",
        icons = {
          {
            icon = "__MilitaryNerf__/graphics/shields/icons/energy-shield-mk2-equipment.png",
            icon_size = 64,
            mipmap_count = 4,
          },
          { icon = "__TurretPod__/graphics/icons/tiers/2.png", icon_size = 64 },
        },
        placed_as_equipment_result = "mn-energy-shield-mk2-equipment",
        subgroup = "equipment",
        order = "b[shield]-c[energy-shield-equipment-mk2]",
        stack_size = 50,
      },


      {
        type = "recipe",
        name = "mn-energy-shield-mk1-equipment",
        enabled = false,
        energy_required = 20,
        ingredients =
        {
          {"energy-shield-equipment", 2},
          {"effectivity-module", 3},
          mods["bztitanium"] and {"titanium-plate", 20} or {"low-density-structure", 5},
        },
        result = "mn-energy-shield-mk1-equipment"
      },
      {
        type = "recipe",
        name = "mn-energy-shield-mk2-equipment",
        enabled = false,
        energy_required = 25,
        ingredients =
        {
          {"mn-energy-shield-mk1-equipment", 10},
          {"battery", 15},
          {"effectivity-module-2", 3},
          {"low-density-structure", 10},
        },
        result = "mn-energy-shield-mk2-equipment"
      },


})

table.insert(data.raw.technology["energy-shield-equipment"].effects, { type = "unlock-recipe", recipe = "mn-energy-shield-mk1-equipment"})
table.insert(data.raw.technology["energy-shield-mk2-equipment"].effects, { type = "unlock-recipe", recipe = "mn-energy-shield-mk2-equipment"})

if mods["RampantArsenal"] then
data:extend({
{
    type = "energy-shield-equipment",
    name = "mn-energy-shield-mk3-equipment",
    sprite = {
      filename = "__MilitaryNerf__/graphics/shields/energy-shield-mk3-equipment.png",
      width = 64,
      height = 64,
      priority = "medium",
      hr_version = {
        filename = "__MilitaryNerf__/graphics/shields/hr-energy-shield-mk3-equipment.png",
        width = 128,
        height = 128,
        priority = "medium",
        scale = 0.5,
      },
    },
    shape = {
      width = 4,
      height = 4,
      type = "full",
    },
    max_shield_value = 800, -- +35% capacity
    energy_per_shield = "50kJ", -- (-50% after nerfing others)
    energy_source = {
      type = "electric",
      buffer_capacity = "1050kJ", -- +50% bonus
      input_flow_limit = "1020kW",
      usage_priority = "primary-input",
    },
    categories = { "zd-turret-pod-equipment-basic-category" },
  },
  {
    type = "item",
    name = "mn-energy-shield-mk3-equipment",
    icons = {
      {
        icon = "__MilitaryNerf__/graphics/shields/icons/energy-shield-mk3-equipment.png",
        icon_size = 64,
        mipmap_count = 4,
      },
      { icon = "__TurretPod__/graphics/icons/tiers/3.png", icon_size = 64 },
    },
    placed_as_equipment_result = "mn-energy-shield-mk3-equipment",
    subgroup = "equipment",
    order = "b[shield]-c[energy-shield-equipment-mk3]",
    stack_size = 50,
  },
  {
    type = "recipe",
    name = "mn-energy-shield-mk3-equipment",
    enabled = false,
    energy_required = 40,
    ingredients =
    {
      {"mk3-shield-rampant-arsenal", 1},
      {"mn-energy-shield-mk2-equipment", 2},
      {"effectivity-module-3", 10},
      {"battery", 40},
      {"low-density-structure", 25},
    },
    result = "mn-energy-shield-mk3-equipment"
  },
  {
    type = "technology",
    name = "mn-energy-shield-mk3-equipment",
    icon = "__MilitaryNerf__/graphics/technology/energy-shield-mk3-equipment.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "rampant-arsenal-technology-shield-equipment-2", "rampant-arsenal-technology-nuclear-tanks" },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "mn-energy-shield-mk3-equipment"
      }
    },
    unit = {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    },
    order = "a-b-c"
  },
})
end
