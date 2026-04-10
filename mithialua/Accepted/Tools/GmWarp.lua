local _warps = {
	-- -------------
	-- HOME
	-- -------------
	["welcome"] = {
		map = 4711,
		x = 7,
		y = 5
	},
}

GmWarp = function(player, mapName)
	if (player.gmLevel < 99) then
		return
	end

	local warp = _warps[mapName]

	player:warp(warp.map, warp.x, warp.y)
end
