local aethers = 10000

frost_nova_1 = {
	cast = function(player)
		local spellName = "Frost Nova"
		local spellIdent = "frost_nova_1"

		local durations = 2000

    local manaCost = 50

		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

    player.magic = player.magic - magicCost

		player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  while_cast = function(player)
    local spellName = "Frost Nova"
    local spellIdent = "frost_nova_1"

    local formula = 25 + player.will + player.might
    local damage = math.floor(formula)

    local spellFX = 4001
    local x = {-1,  1,  0,  0}
    local y = { 0,  0,  1, -1}
      
    for i = 1, #x do
      local targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_MOB
      )
      
      if (#targets > 0) then
        global_zap.cast(
          player,
          targets[1],
          damage,
          0,
          spellFX
        )
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(52, 0)
          target[1].paralyzed = true
        end
      end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )
      if (#targets > 0) then
        local worked = global_zap.cast(
          player,
          targets[1],
          damage,
          0,
          spellFX
        )
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(52, 0)
          target[1].paralyzed = true
        end
      end
    end
  end,
}

frost_nova_2 = {
	cast = function(player)
		local spellName = "Frost Nova"
		local spellIdent = "frost_nova_2"

		local durations = 2000

    local manaCost = 125

		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

    player.magic = player.magic - magicCost

		player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  while_cast = function(player)
    local spellName = "Frost Nova"
    local spellIdent = "frost_nova_2"

    local formula = 75 + player.will + player.might
    local damage = math.floor(formula)

    local spellFX = 4001
    local x = {-1,  1,  0,  0}
    local y = { 0,  0,  1, -1}
      
    for i = 1, #x do
      local targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_MOB
      )
      
      if (#targets > 0) then
        global_zap.cast(
          player,
          targets[1],
          damage,
          0,
          spellFX
        )
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(52, 0)
          target[1].paralyzed = true
        end
      end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )
      if (#targets > 0) then
        local worked = global_zap.cast(
          player,
          targets[1],
          damage,
          0,
          spellFX
        )
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(52, 0)
          target[1].paralyzed = true
        end
      end
    end
  end,
}

frost_nova_3 = {
	cast = function(player)
		local spellName = "Frost Nova"
		local spellIdent = "frost_nova_3"

		local durations = 4000

    local manaCost = 275

		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

    player.magic = player.magic - magicCost

		player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  while_cast = function(player)
    local spellName = "Frost Nova"
    local spellIdent = "frost_nova_3"

    local formula = 125 + player.will + player.might
    local damage = math.floor(formula)

    local spellFX = 4001
    local x = {-1,  1,  0,  0}
    local y = { 0,  0,  1, -1}
      
    for i = 1, #x do
      local targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_MOB
      )
      
      if (#targets > 0) then
        global_zap.cast(
          player,
          targets[1],
          damage,
          0,
          spellFX
        )
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(52, 0)
          target[1].paralyzed = true
        end
      end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )
      if (#targets > 0) then
        local worked = global_zap.cast(
          player,
          targets[1],
          damage,
          0,
          spellFX
        )
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(52, 0)
          target[1].paralyzed = true
        end
      end
    end
  end,
}

frost_nova_4 = {
	cast = function(player)
		local spellName = "Frost Nova"
		local spellIdent = "frost_nova_4"

		local durations = 4000

    local manaCost = 500

		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

    player.magic = player.magic - magicCost

		player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  while_cast = function(player)
    local spellName = "Frost Nova"
    local spellIdent = "frost_nova_4"

    local formula = 175 + player.will + player.might
    local damage = math.floor(formula)

    local spellFX = 4001
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}
      
    for i = 1, #x do
      local targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_MOB
      )
      
      if (#targets > 0) then
        global_zap.cast(
          player,
          targets[1],
          damage,
          0,
          spellFX
        )
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(52, 0)
          target[1].paralyzed = true
        end
      end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )
      if (#targets > 0) then
        local worked = global_zap.cast(
          player,
          targets[1],
          damage,
          0,
          spellFX
        )
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(52, 0)
          target[1].paralyzed = true
        end
      end
    end
  end,
}

frost_nova_5 = {
	cast = function(player)
		local spellName = "Frost Nova"
		local spellIdent = "frost_nova_5"

		local durations = 8000

    local manaCost = 800

		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

    player.magic = player.magic - magicCost

		player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  while_cast = function(player)
    local spellName = "Frost Nova"
    local spellIdent = "frost_nova_5"

    local formula = 225 + player.will + player.might
    local damage = math.floor(formula)

    local spellFX = 4001
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}
      
    for i = 1, #x do
      local targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_MOB
      )
      
      if (#targets > 0) then
        global_zap.cast(
          player,
          targets[1],
          damage,
          0,
          spellFX
        )
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(52, 0)
          target[1].paralyzed = true
        end
      end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )
      if (#targets > 0) then
        local worked = global_zap.cast(
          player,
          targets[1],
          damage,
          0,
          spellFX
        )
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(52, 0)
          target[1].paralyzed = true
        end
      end
    end
  end,
}