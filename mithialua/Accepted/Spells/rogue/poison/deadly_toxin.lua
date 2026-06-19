local aethers = 15000

deadly_toxin_1 = {
  cast = function(player)
    local spellName = "Deadly Toxin"
    local spellIdent = "deadly_toxin_1"
    local duration = 4000

    local side = player.side
    
    local vitaCost = 100
    local manaCost = 50
      
    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    local spellFX = 2001
    local x = {0}
    local y = {0}

    if (side == 0) then
      y = {-1}
    elseif (side == 1) then
      x = {1}
    elseif (side == 2) then
      y = {1}
    elseif (side == 3) then
      x = {-1}
    else
      return
    end

    local targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_MOB
    )
    
    if (#targets > 0) then
      global_attack.cast(
        player,
        targets[1],
        0,
        0,
        spellFX
      )

      if targets[1]:hasDuration(spellIdent) then
        targets[1]:setDuration(spellIdent, 0)
        targets[1]:setDuration(spellIdent, durations)
      else
        targets[1]:setDuration(spellIdent, durations)
      end
		  targets[1]:sendAnimation(11, 5)
    end

    targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_PC
    )

    if (#targets > 0) then
      local worked = global_attack.cast(
        player,
        targets[1],
        0,
        0,
        spellFX
      )

      if (worked == 2) then
        targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  while_cast_1500 = function(block)
		local damage = 100
		block:sendAnimation(1, 5)
		if block.health > damage then
			block:sendHealth(damage, 0)
		end
	end
}

deadly_toxin_2 = {
  cast = function(player)
    local spellName = "Deadly Toxin"
    local spellIdent = "deadly_toxin_2"
    local duration = 6000

    local side = player.side
    
    local vitaCost = 150
    local manaCost = 75
      
    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    local spellFX = 2001
    local x = {0}
    local y = {0}

    if (side == 0) then
      y = {-1}
    elseif (side == 1) then
      x = {1}
    elseif (side == 2) then
      y = {1}
    elseif (side == 3) then
      x = {-1}
    else
      return
    end

    local targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_MOB
    )
    
    if (#targets > 0) then
      global_attack.cast(
        player,
        targets[1],
        0,
        0,
        spellFX
      )

      if targets[1]:hasDuration(spellIdent) then
        targets[1]:setDuration(spellIdent, 0)
        targets[1]:setDuration(spellIdent, durations)
      else
        targets[1]:setDuration(spellIdent, durations)
      end
		  targets[1]:sendAnimation(11, 5)
    end

    targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_PC
    )

    if (#targets > 0) then
      local worked = global_attack.cast(
        player,
        targets[1],
        0,
        0,
        spellFX
      )

      if (worked == 2) then
        targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  while_cast_1500 = function(block)
		local damage = 200
		block:sendAnimation(1, 5)
		if block.health > damage then
			block:sendHealth(damage, 0)
		end
	end
}

deadly_toxin_3 = {
  cast = function(player)
    local spellName = "Deadly Toxin"
    local spellIdent = "deadly_toxin_3"
    local duration = 8000

    local side = player.side
    
    local vitaCost = 200
    local manaCost = 100
      
    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    local spellFX = 2001
    local x = {0}
    local y = {0}

    if (side == 0) then
      y = {-1}
    elseif (side == 1) then
      x = {1}
    elseif (side == 2) then
      y = {1}
    elseif (side == 3) then
      x = {-1}
    else
      return
    end

    local targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_MOB
    )
    
    if (#targets > 0) then
      global_attack.cast(
        player,
        targets[1],
        0,
        0,
        spellFX
      )

      if targets[1]:hasDuration(spellIdent) then
        targets[1]:setDuration(spellIdent, 0)
        targets[1]:setDuration(spellIdent, durations)
      else
        targets[1]:setDuration(spellIdent, durations)
      end
		  targets[1]:sendAnimation(11, 5)
    end

    targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_PC
    )

    if (#targets > 0) then
      local worked = global_attack.cast(
        player,
        targets[1],
        0,
        0,
        spellFX
      )

      if (worked == 2) then
        targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  while_cast_1500 = function(block)
		local damage = 350
		block:sendAnimation(1, 5)
		if block.health > damage then
			block:sendHealth(damage, 0)
		end
	end
}

deadly_toxin_4 = {
  cast = function(player)
    local spellName = "Deadly Toxin"
    local spellIdent = "deadly_toxin_4"
    local duration = 10000

    local side = player.side
    
    local vitaCost = 250
    local manaCost = 125
      
    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    local spellFX = 2001
    local x = {0}
    local y = {0}

    if (side == 0) then
      y = {-1}
    elseif (side == 1) then
      x = {1}
    elseif (side == 2) then
      y = {1}
    elseif (side == 3) then
      x = {-1}
    else
      return
    end

    local targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_MOB
    )
    
    if (#targets > 0) then
      global_attack.cast(
        player,
        targets[1],
        0,
        0,
        spellFX
      )

      if targets[1]:hasDuration(spellIdent) then
        targets[1]:setDuration(spellIdent, 0)
        targets[1]:setDuration(spellIdent, durations)
      else
        targets[1]:setDuration(spellIdent, durations)
      end
		  targets[1]:sendAnimation(11, 5)
    end

    targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_PC
    )

    if (#targets > 0) then
      local worked = global_attack.cast(
        player,
        targets[1],
        0,
        0,
        spellFX
      )

      if (worked == 2) then
        targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  while_cast_1500 = function(block)
		local damage = 550
		block:sendAnimation(1, 5)
		if block.health > damage then
			block:sendHealth(damage, 0)
		end
	end
}

deadly_toxin_5 = {
  cast = function(player)
    local spellName = "Deadly Toxin"
    local spellIdent = "deadly_toxin_5"
    local duration = 15000

    local side = player.side
    
    local vitaCost = 300
    local manaCost = 150
      
    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    local spellFX = 2001
    local x = {0}
    local y = {0}

    if (side == 0) then
      y = {-1}
    elseif (side == 1) then
      x = {1}
    elseif (side == 2) then
      y = {1}
    elseif (side == 3) then
      x = {-1}
    else
      return
    end

    local targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_MOB
    )
    
    if (#targets > 0) then
      global_attack.cast(
        player,
        targets[1],
        0,
        0,
        spellFX
      )

      if targets[1]:hasDuration(spellIdent) then
        targets[1]:setDuration(spellIdent, 0)
        targets[1]:setDuration(spellIdent, durations)
      else
        targets[1]:setDuration(spellIdent, durations)
      end
		  targets[1]:sendAnimation(11, 5)
    end

    targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_PC
    )

    if (#targets > 0) then
      local worked = global_attack.cast(
        player,
        targets[1],
        0,
        0,
        spellFX
      )

      if (worked == 2) then
        targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

  while_cast_1500 = function(block)
		local damage = 800
		block:sendAnimation(1, 5)
		if block.health > damage then
			block:sendHealth(damage, 0)
		end
	end
}