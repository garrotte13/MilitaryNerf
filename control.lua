
script.on_event(defines.events.on_biter_base_built, function(event)
    local entity = event.entity
    if entity.valid and entity.type == "unit-spawner" then
      local chunk_position = {x = math.ceil(entity.position.x/32), y = math.ceil(entity.position.y/32)}
      if true  then -- distance(global.benn, built_base.position) > 1 
        for _, player in pairs(game.connected_players) do
          --local player_settings = settings.get_player_settings(player)
          --if player_settings["benn-biter-map-alert"].value then
          if player.force.is_chunk_visible(entity.surface, chunk_position) then
            player.add_custom_alert(
              entity,
              {
                type = "virtual",
                name = "biter-built-warning"
              },
              {"alert-description.biter-built-warning", entity.surface.name},
              true
            )
          end
        end
        --global.benn = base_position   
      end
    end
  end)