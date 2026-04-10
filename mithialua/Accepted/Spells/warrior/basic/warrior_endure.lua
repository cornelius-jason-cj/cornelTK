warrior_endure = {
    cast = function(player)
        local durations = math.max(1, player.level - 9) * 10000

		if player:checkIfCast(sanctuaries) then
			return
		end

		player:sendMinitext("Endure empowers you!")
		player.deduction = player.deduction -.5

		player:setDuration("warrior_endure", durations)
		player:sendAnimation(110)

		if player.blType == BL_PC then
			player:sendMinitext(player.name .. " casts Sanctuary on you.")
		end
	end,

	recast = function(player)
		player.deduction = player.deduction -.5
	end,

	uncast = function(player)
		player.deduction = player.deduction +.5
		player:calcStat()
	end,
    
	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Reducing all incoming damage by 50%!"
		return level, items, itemAmounts, description
	end
}