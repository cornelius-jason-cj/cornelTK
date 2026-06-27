local aethers = 2000

flame_wave_1 = {
	cast = function(player)
		local spellName = "Flame Wave"
		local spellIdent = "flame_wave_1"

    local formula = 300 + player.will * 1
    local damage = math.floor(formula)

    local manaCost = 50

		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

    local spellFX = 3002
    local x = {-1,  1,  0,  0}
    local y = { 0,  0,  1, -1}

    player.magic = player.magic - magicCost

		for i = 1, #x do
			local target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #target > 0 then
				global_zap.cast(player, target[1], damage, 0, spellFX)
			end

			target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
			if #target > 0 then
				if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        end
			end
		end

		player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,
}

flame_wave_2 = {
	cast = function(player)
		local spellName = "Flame Wave"
		local spellIdent = "flame_wave_2"

    local formula = 600 + player.will * 2
    local damage = math.floor(formula)

    local manaCost = 125

		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

    local spellFX = 3002
    local x = {-1,  1,  0,  0}
    local y = { 0,  0,  1, -1}

    player.magic = player.magic - magicCost

		for i = 1, #x do
			local target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #target > 0 then
				global_zap.cast(player, target[1], damage, 0, spellFX)
			end

			target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
			if #target > 0 then
				if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        end
			end
		end

		player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,
}

flame_wave_3 = {
	cast = function(player)
		local spellName = "Flame Wave"
		local spellIdent = "flame_wave_3"

    local formula = 900 + player.will * 3
    local damage = math.floor(formula)

    local manaCost = 250

		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

    local spellFX = 3002
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}

    player.magic = player.magic - magicCost

		for i = 1, #x do
			local target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #target > 0 then
				global_zap.cast(player, target[1], damage, 0, spellFX)
			end

			target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
			if #target > 0 then
				if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        end
			end
		end

		player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,
}

flame_wave_4 = {
	cast = function(player)
		local spellName = "Flame Wave"
		local spellIdent = "flame_wave_4"

    local formula = 1200 + player.will * 4
    local damage = math.floor(formula)

    local manaCost = 425

		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

    local spellFX = 3002
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}

    player.magic = player.magic - magicCost

		for i = 1, #x do
			local target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #target > 0 then
				global_zap.cast(player, target[1], damage, 0, spellFX)
			end

			target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
			if #target > 0 then
				if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        end
			end
		end

		player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,
}

flame_wave_5 = {
	cast = function(player)
		local spellName = "Flame Wave"
		local spellIdent = "flame_wave_5"

    local formula = 1500 + player.will * 5
    local damage = math.floor(formula)

    local manaCost = 650

		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

    local spellFX = 3002
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}

    player.magic = player.magic - magicCost

		for i = 1, #x do
			local target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #target > 0 then
				global_zap.cast(player, target[1], damage, 0, spellFX)
			end

			target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
			if #target > 0 then
				if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        end
			end
		end

		player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,
}
