local paracelsin_menu_simulations = {}

--special variables:
-- sim_planet = current sim surface
-- on_tick = override to do stuff on given tick when timeline_tools are included
local make_simulation = function(duration, planet, filename, script)
  return
  {
    checkboard = false,
    save = "__Paracelsin-Graphics__/menu-simulations/" .. filename,
    length = duration,
    init =
    [[
      local sim_planet = game.surfaces["]] .. planet .. [["]
      local logo = sim_planet.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
      logo.destructible = false
      local center = {logo.position.x, logo.position.y+9.75}
      game.simulation.camera_surface_index = sim_planet.index
      game.simulation.camera_position = center
      game.simulation.camera_zoom = 1
      game.tick_paused = false
      game.players[1].game_view_settings.show_controller_gui = false
      game.players[1].game_view_settings.show_quickbar = false
      game.players[1].game_view_settings.show_shortcut_bar = false
    ]]
    ..
    script
  }
end

local timeline_tools =
  [[
    local tick = 0
    local on_tick = function() end
    script.on_nth_tick(1,
      function()
        tick = tick + 1
        on_tick()
      end)
  ]]

paracelsin_menu_simulations.paracelsin_cryovolcanoes = make_simulation(60 * 12, "paracelsin", "menu-simulation-paracelsin-cryovolcanoes.zip", [[]])
paracelsin_menu_simulations.paracelsin_desolation = make_simulation(60 * 12, "paracelsin", "menu-simulation-paracelsin-desolation.zip", [[]])
paracelsin_menu_simulations.paracelsin_zinc = make_simulation(60 * 12, "paracelsin", "menu-simulation-paracelsin-zinc.zip", [[]])
paracelsin_menu_simulations.paracelsin_nitric = make_simulation(60 * 12, "paracelsin", "menu-simulation-paracelsin-nitric.zip", [[]])

return paracelsin_menu_simulations