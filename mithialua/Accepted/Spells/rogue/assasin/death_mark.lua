local aethers = 3000
local durations = 6000

death_mark_1 = {
  cast = function(player)
    local spellName = "Death Mark"
    local spellIdent = "death_mark_1"
    
    local side = player.side

    local manaCost = 20

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
		  targets[1].armor = targets[1].armor + 2
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
		  targets[1].armor = targets[1].armor + 2
      targets[1].cursed = 1
    end
    
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,
  
  while_cast = function(block)
		if (block.blType == BL_MOB and block.charState ~= 2) then
			block:sendAnimation(39, 0)
		elseif (block.blType == BL_PC and block.state ~= 2) then
			block:sendAnimation(39, 0)
		end
	end,

  recast = function(target, player)
		target.armor = target.armor + 2
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 2
		target.cursed = 0
		target:sendStatus()
	end,
}

death_mark_2 = {
  cast = function(player)
    local spellName = "Death Mark"
    local spellIdent = "death_mark_2"
    
    local side = player.side
    
    local manaCost = 30

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
		  targets[1].armor = targets[1].armor + 4
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
		  targets[1].armor = targets[1].armor + 4
      targets[1].cursed = 1
    end
    
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  while_cast = function(block)
		if (block.blType == BL_MOB and block.charState ~= 2) then
			block:sendAnimation(39, 0)
		elseif (block.blType == BL_PC and block.state ~= 2) then
			block:sendAnimation(39, 0)
		end
	end,

  recast = function(target)
		target.armor = target.armor + 25
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 25
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
		  targets[1].armor = targets[1].armor + 8
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
		  targets[1].armor = targets[1].armor + 8
      targets[1].cursed = 1
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  while_cast = function(block)
		if (block.blType == BL_MOB and block.charState ~= 2) then
			block:sendAnimation(39, 0)
		elseif (block.blType == BL_PC and block.state ~= 2) then
			block:sendAnimation(39, 0)
		end
	end,

  recast = function(target)
		target.armor = target.armor + 8
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 8
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
		  targets[1].armor = targets[1].armor + 15
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
		  targets[1].armor = targets[1].armor + 15
      targets[1].cursed = 1
    end
    
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  while_cast = function(block)
		if (block.blType == BL_MOB and block.charState ~= 2) then
			block:sendAnimation(39, 0)
		elseif (block.blType == BL_PC and block.state ~= 2) then
			block:sendAnimation(39, 0)
		end
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
		  targets[1].armor = targets[1].armor + 25
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
		  targets[1].armor = targets[1].armor + 25
      targets[1].cursed = 1
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  while_cast = function(block)
		if (block.blType == BL_MOB and block.charState ~= 2) then
			block:sendAnimation(39, 0)
		elseif (block.blType == BL_PC and block.state ~= 2) then
			block:sendAnimation(39, 0)
		end
	end,

  recast = function(target)
		target.armor = target.armor + 25
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 25
		target.cursed = 0
		target:sendStatus()
	end,
}