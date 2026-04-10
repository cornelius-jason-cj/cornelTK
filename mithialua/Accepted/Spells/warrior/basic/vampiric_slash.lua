vampiric_slash = {
    cast = function(player)
        local spellName = "Vampiric Slash"
        local spellIdent = "vampiric_slash"
		local aethers = 15000
        local multiplier =  0.5
        local damage = math.floor(player.maxHealth * multiplier )
        local magicCost = player.maxMagic * 0.15
        local spellFX = 1002

        if not player:canCast(1, 1, 0) then
			return
		end

        if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		local x = 0
		local y = 0
		local map = player.m
		local side = player.side
		
		if (side == 0) then
			y = -1
		elseif (side == 1) then
			x = 1
		elseif (side == 2) then
			y = 1
		elseif (side == 3) then
			x = -1
		else
			return
		end

        local landed = 0
		local targetX = player.x + x
		local targetY = player.y + y
		local targets = player:getAliveObjectsInCell(map, targetX, targetY, BL_MOB)

        if (#targets > 0) then
			global_attack.cast(
				player,
				targets[1],
				damage,
				0,
				spellFX
			)

			landed = 1
		end
        
        targets = player:getAliveObjectsInCell(map, targetX, targetY, BL_PC)


		if (#targets > 0) then
			local worked = global_attack.cast(
				player,
				targets[1],
				damage,
				0,
				spellFX
			)

			if (worked == 2) then
				targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
				landed = 1
			end
		end

		if (landed == 1) then
            player:addHealth2(damage)
            player:setAether(spellIdent, aethers)
		end

        player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
    end,

    requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Deal damage to your enemy and restore some of your health."
		return level, items, itemAmounts, description
	end
}