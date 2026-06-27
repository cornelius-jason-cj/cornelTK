local aethers = 2000
local durations = 5000

blizzard_1 = {
	cast = function(player)
		local spellName = "Blizzard"
		local spellIdent = "blizzard_1"
    local spellArmorIdent = "blizzard_armor_1"

    local formula = 40 + player.will * 1 + player.might * 1
    local damage = math.floor(formula)

    local chanceArmor = math.random(1,10)
    local manaCost = 100

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

    if (chanceArmor <= 1) then
      player:setDuration(spellIdent, durations)
		  player:sendMinitext("You got ice armor")
    end

		player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  recast = function(player)
		player.bonusArmor = player.bonusArmor - 5
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

blizzard_2 = {
	cast = function(player)
		local spellName = "Blizzard"
		local spellIdent = "blizzard_2"
    local spellArmorIdent = "blizzard_armor_2"

    local formula = 100 + player.will * 2 + player.might * 2
    local damage = math.floor(formula)

    local chanceArmor = math.random(1,10)
    local manaCost = 100

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

    if (chanceArmor <= 2) then
      player:setDuration(spellIdent, durations)
		  player:sendMinitext("You got ice armor")
    end

		player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  recast = function(player)
		player.bonusArmor = player.bonusArmor - 5
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

blizzard_3 = {
	cast = function(player)
		local spellName = "Blizzard"
		local spellIdent = "blizzard_3"
    local spellArmorIdent = "blizzard_armor_3"

    local formula = 190 + player.will * 3 + player.might * 3
    local damage = math.floor(formula)

    local chanceArmor = math.random(1,10)
    local manaCost = 190

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

    if (chanceArmor <= 2) then
      player:setDuration(spellIdent, durations)
		  player:sendMinitext("You got ice armor")
    end

		player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  recast = function(player)
		player.bonusArmor = player.bonusArmor - 10
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

blizzard_4 = {
	cast = function(player)
		local spellName = "Blizzard"
		local spellIdent = "blizzard_4"
    local spellArmorIdent = "blizzard_armor_4"

    local formula = 340 + player.will * 4 + player.might * 4
    local damage = math.floor(formula)

    local chanceArmor = math.random(1,10)
    local manaCost = 340

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

    if (chanceArmor <= 3) then
      player:setDuration(spellIdent, durations)
		  player:sendMinitext("You got ice armor")
    end

		player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  recast = function(player)
		player.bonusArmor = player.bonusArmor - 10
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

blizzard_5 = {
	cast = function(player)
		local spellName = "Blizzard"
		local spellIdent = "blizzard_5"
    local spellArmorIdent = "blizzard_armor_5"

    local formula = 550 + player.will * 5 + player.might * 5
    local damage = math.floor(formula)

    local chanceArmor = math.random(1,10)
    local manaCost = 550

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

    if (chanceArmor <= 5) then
      player:setDuration(spellIdent, durations)
		  player:sendMinitext("You got ice armor")
    end

		player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  recast = function(player)
		player.bonusArmor = player.bonusArmor - 20
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}