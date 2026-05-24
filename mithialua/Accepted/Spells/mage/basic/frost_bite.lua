frost_bite = {
    cast = function(player)
		local spellName = "Frost Bite"
		local spellIdent = "frost_bite"
		local aethers = 4000
		local duration = 10000
    player:sendMinitext("1")
		if not player:canCast(1, 1, 0) then
			return
		end
    player:sendMinitext("2")

    local magicCost = player.level * 10

    local spellFX = 3002
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}

    player:sendMinitext("3")
		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end


    player:sendMinitext("4")
		for i = 1, #x do
			local target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
    player:sendMinitext("41")
			if #target > 0 then
      player:sendMinitext("42")
				if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("43")
					player:sendMinitext("You can not cast on player")
				else
          player:sendMinitext("44")
					target[1]:setDuration(spellIdent, duration)
					target[1]:sendAnimation(52, 0)
					target[1].paralyzed = true
				end
			end

			target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
      player:sendMinitext("45")
			if #target > 0 then
      player:sendMinitext("46")
				-- local worked = global_zap.cast(player, target[1], damage, 0, spellFX)
				-- if worked == 2 then
				-- 	target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
				-- end
                
				if( target[1].state == 1 or target[1].blType == BL_PC) then
      player:sendMinitext("47")
        player:sendMinitext("You can not cast on player")
				else
        player:sendMinitext("48")
					target[1]:setDuration(spellIdent, duration)
					target[1]:sendAnimation(52, 0)
					target[1].paralyzed = true
				end
        player:sendMinitext("48")
			end
       player:sendMinitext("49")
		end

    player:sendMinitext("5")
    player.magic = player.magic - magicCost
		player:sendAction(6, 35)
    player:sendMinitext("6")
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendStatus()
	end,

	requirements = function(player)
		local level = 10
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Freeze enemy around you."
		return level, items, itemAmounts, description
	end
}