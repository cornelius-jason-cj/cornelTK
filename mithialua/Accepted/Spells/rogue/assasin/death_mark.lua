local aethers = 2000

death_mark_1 = {
  cast = function(player)
    local spellName = "Death Mark"
    local spellIdent = "death_mark_1"
    
    local side = player.side

    local manaCost = 80

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    local spellFX = 1001
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
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(39, 0)
      targets[1].cursed = 1
    end

    targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_PC
    )

    if (#targets > 0) then
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(39, 0)
      targets[1].cursed = 1
    end
    
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 5
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 5
		target.cursed = 0
		target:sendStatus()
	end,
}

death_mark_2 = {
  cast = function(player)
    local spellName = "Death Mark"
    local spellIdent = "death_mark_2"
    
    local side = player.side
    
    local manaCost = 100

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    local spellFX = 1001
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
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(39, 0)
      targets[1].cursed = 1
    end

    targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_PC
    )

    if (#targets > 0) then
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(39, 0)
      targets[1].cursed = 1
    end
    
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 10
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 10
		target.cursed = 0
		target:sendStatus()
	end,
}

death_mark_3 = {
  cast = function(player)
    local spellName = "Death Mark"
    local spellIdent = "death_mark_3"
    
    local side = player.side

    local manaCost = 120

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end
    
    local spellFX = 1001
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
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(39, 0)
      targets[1].cursed = 1
    end

    targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_PC
    )

    if (#targets > 0) then
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(39, 0)
      targets[1].cursed = 1
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 15
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 15
		target.cursed = 0
		target:sendStatus()
	end,
}

death_mark_4 = {
  cast = function(player)
    local spellName = "Death Mark"
    local spellIdent = "death_mark_4"
    
    local side = player.side

    local manaCost = 150

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end
    
    local spellFX = 1001
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
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(39, 0)
      targets[1].cursed = 1
    end

    targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_PC
    )

    if (#targets > 0) then
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(39, 0)
      targets[1].cursed = 1
    end
    
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 20
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 20
		target.cursed = 0
		target:sendStatus()
	end,
}

death_mark_5 = {
  cast = function(player)
    local spellName = "Death Mark"
    local spellIdent = "death_mark_5"
    
    local side = player.side

    local manaCost = 200

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end
    
    local spellFX = 1001
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
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(39, 0)
      targets[1].cursed = 1
    end

    targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_PC
    )

    if (#targets > 0) then
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(39, 0)
      targets[1].cursed = 1
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 30
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 30
		target.cursed = 0
		target:sendStatus()
	end,
}