tiger_claw = {
    cast = function(player)
        local spellName = "Tiger Claw"
        local spellIdent = "tiger_claw"
		local aethers = 2000

        if not player:canCast(1, 1, 0) then
			return
		end

        local multiplier = (0.25 + (player.level + 1) / 1000)
        local rage = player.rage / 2
        local damage = math.floor(player.maxHealth * multiplier ) * rage
        local currentMagic = player.magic
        local magicCost = player.maxMagic * 0.1
        local spellFX = 2001
		local side = player.side
		local x = {0, 0, 0}
		local y = {0, 0, 0}

        if (side == 0) then
			y = {-1, -2, -3}
		elseif (side == 1) then
			x = {1, 2, 3}
		elseif (side == 2) then
            y = {1, 2, 3}
		elseif (side == 3) then
			x = {-1, -2, -3}
		else
			return
		end

        if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

        for i = 1, 3 do
			local targets = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
        
            if (#targets > 0) then
                global_attack.cast(
                    player,
                    targets[1],
                    damage,
                    0,
                    spellFX
                )
            end

            targets = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
            
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
                end
            end
        end
        
        player.magic = player.magic - magicCost
		player:sendStatus()
        player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
    end,

    requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Slash 3 monster in front of you"
		return level, items, itemAmounts, description
	end
}