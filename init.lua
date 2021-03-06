--Version 0.3

--value for space, change the value in minetest.conf
local space = tonumber(minetest.settings:get("se_space")) or 20000
--setting for enabling physics or not
local physics = minetest.settings:get_bool("se_physics", false)

--The skybox for space, feel free to change it to however you like.
local spaceskybox = {
    "sky_pos_y.png",
    "sky_neg_y.png",
    "sky_pos_z.png",
    "sky_neg_z.png",
    "sky_neg_x.png",
    "sky_pos_x.png",
}

--default sky for minetest
local default_sky = {
    type = "regular",
    sky_color = {
        day_sky = "#8cbafa",
        day_horizon = "#9bc1f0",
        dawn_sky = "#b4bafa",
        dawn_horizon = "#bac1f0",
        night_sky = "#006aff",
        night_horizon = "#4090ff",
        indoors = "#646464",
        fog_tint_type = "default"
    },
    clouds = true
}

local time = 0

minetest.register_globalstep(function(dtime)
    time = time + dtime

    if time > 1 then
        for _, player in ipairs(minetest.get_connected_players()) do
            time = 0

            local name = player:get_player_name()
            local pos = player:getpos()

            --if in space, set space skybox and physics
            if minetest.get_player_by_name(name) and pos.y >= space then
                player:set_sky({
                    base_color = "#000000",
                    type = "skybox",
                    textures = spaceskybox,
                    clouds = false,
                })
                player:set_sun({visible = false, sunrise_visible = false})
                player:set_moon({visible = false})

                if physics then player:set_physics_override(1, 0.6, 0.2) end
            --If the player is on Earth reset to default skybox and physics
            elseif minetest.get_player_by_name(name) and pos.y < space then
                player:set_sky(default_sky)
                player:set_moon({visible = true})
                player:set_sun({visible = true})

                if physics then player:set_physics_override(1, 1, 1) end
            end
        end
    end
end)