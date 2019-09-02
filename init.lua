--Skybox Extended Made By: Emperor Genshin

--Source Code Licence: WTFPL

pos = {x=0, y=0, z=0}

local  ocean_depths = -0.1
local depths =-30
local hexirion = 7009
local space = 1000 --value for space, change the value to however you like.
local abyss = -3072
local underworld = -5074 --value for space, change the value to however you like.
local void = -8030 --value for the void, change the value to however you like.

--time stuff (for weather_pack skybox change)

--The skybox for space, feel free to change it to however you like.
local spaceskybox = { 
	"sky_pos_y.png",
	"sky_neg_y.png",
	"sky_pos_z.png",
	"sky_neg_z.png",	
	"sky_neg_x.png",
	"sky_pos_x.png",
}


local time = 0

minetest.register_globalstep(function(dtime)
time = time + dtime
if time > 1 then for _, player in ipairs(minetest.get_connected_players()) do
time = 0

local name = player:get_player_name()
local pos = player:getpos()

--If the player has reached Space

--If the player has reached Hexirion

if minetest.get_player_by_name(name) and pos.y >= hexirion  then

player:set_physics_override(1, 1, 1) -- speed, jump, gravity [default]
player:set_sky({r=40,g=20,b=10}, "plain", {clouds = true})
	player:set_clouds({
                density= 0.5, 
                color = "#8f590280", 
		ambient = "#000000",
                height=8100,    
		thickness = 16,
		speed = {x = 6, y = -6},
})


else if minetest.get_player_by_name(name) and pos.y < hexirion and pos.y >= space then

player:set_physics_override(1, 0.6, 0.2) -- speed, jump, gravity
player:set_sky({}, "skybox", spaceskybox) -- Sets skybox


--If the player is on Earth
else if minetest.get_player_by_name(name) and pos.y < space  and  pos.y > ocean_depths then

player:set_physics_override(1, 1, 1) -- speed, jump, gravity [default]
player:set_sky({}, "regular", {})
	player:set_clouds({
		density = 0.4,
		color = "#fff0f0e5",
		ambient = "#000000",
		height = 120,
		thickness = 16,
		speed = {x = 0, y = -2},
})

else if minetest.get_player_by_name(name) and pos.y <= ocean_depths  and  pos.y > depths then
player:set_sky({r=0,g=50,b=70}, "plain", {})


--If the player is on Earth
else if minetest.get_player_by_name(name) and pos.y <= depths  and  pos.y > abyss then
player:set_sky({r=0,g=0,b=0}, "plain", {})

--If the player is at the Abyss
else if minetest.get_player_by_name(name) and pos.y <= abyss and pos.y > underworld then

player:set_physics_override(1, 1, 1) -- speed, jump, gravity [default]
player:set_sky({r=30,g=0,b=80}, "plain", {})

--If the player is at the Underworld
else if minetest.get_player_by_name(name) and pos.y <= underworld  and pos.y > void then

player:set_physics_override(1, 1, 1) -- speed, jump, gravity [default]
player:set_sky({r=80,g=0,b=0}, "plain", {})

--If the player is at the Underworld
else if minetest.get_player_by_name(name) and pos.y < void then

player:set_physics_override(1, 1, 1) -- speed, jump, gravity [default]
player:set_sky({r=200,g=200,b=200}, "plain", {})

end

        end
	
                end

	                end
					
	                	end

	                		end
	       
	                		               end
	       
	                		                                end
	        		                                
	        		                                                end
	        		                                
	                		                                                end
	                		                                                        end)
								

minetest.register_on_leaveplayer(function(player)
local name = player:get_player_name()
if name then
player:set_sky({}, "regular", {})
end

	end)


-- NOTE: The source code may seem too freaking simple, but hopefully you'll find this usefull for future use, have fun with this mod.imeofday >= 0.20
