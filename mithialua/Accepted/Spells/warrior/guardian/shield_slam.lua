local aethers = 10000

shield_slam_1 = {
  cast = function(player)
    local spellName = "Shield Slam"
    local spellIdent = "shield_slam_1"
    
    local formula = 200 + player.might * 2
    local damage = math.floor(formula)
    local side = player.side

    local vitaCost = 60
    local manaCost = 30
    local durations = 1000

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
      global_attack.cast(
        player,
        targets[1],
        damage,
        0,
        spellFX
      )
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(52, 0)
      targets[1].paralyzed = true
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
        damage,
        0,
        spellFX
      )
      if( targets[1].state == 1 or targets[1].blType == BL_PC) then
        player:sendMinitext("You can not cast on player")
      else
        targets[1]:setDuration(spellIdent, durations)
        targets[1]:sendAnimation(52, 0)
        targets[1].paralyzed = true
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  while_cast = function(target)
		target.paralyzed = true
    target:sendAnimation(52)
	end,

	uncast = function(target)
		target.paralyzed = false
    target:sendStatus()
	end,
}

shield_slam_2 = {
  cast = function(player)
    local spellName = "Shield Slam"
    local spellIdent = "shield_slam_2"
    
    local formula = 350 + player.might * 2.5
    local damage = math.floor(formula)
    local side = player.side

    local vitaCost = 90
    local manaCost = 45
    local durations = 1000

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
      global_attack.cast(
        player,
        targets[1],
        damage,
        0,
        spellFX
      )
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(52, 0)
      targets[1].paralyzed = true
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
        damage,
        0,
        spellFX
      )
      if( targets[1].state == 1 or targets[1].blType == BL_PC) then
        player:sendMinitext("You can not cast on player")
      else
        targets[1]:setDuration(spellIdent, durations)
        targets[1]:sendAnimation(52, 0)
        targets[1].paralyzed = true
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  while_cast = function(target)
		target.paralyzed = true
    target:sendAnimation(52)
	end,

	uncast = function(target)
		target.paralyzed = false
    target:sendStatus()
	end,
}

shield_slam_3 = {
  cast = function(player)
    local spellName = "Shield Slam"
    local spellIdent = "shield_slam_3"
    
    local formula = 500 + player.might * 3
    local damage = math.floor(formula)
    local side = player.side

    local vitaCost = 120
    local manaCost = 60
    local durations = 2000

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
      global_attack.cast(
        player,
        targets[1],
        damage,
        0,
        spellFX
      )
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(52, 0)
      targets[1].paralyzed = true
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
        damage,
        0,
        spellFX
      )
      if( targets[1].state == 1 or targets[1].blType == BL_PC) then
        player:sendMinitext("You can not cast on player")
      else
        targets[1]:setDuration(spellIdent, durations)
        targets[1]:sendAnimation(52, 0)
        targets[1].paralyzed = true
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  while_cast = function(target)
		target.paralyzed = true
    target:sendAnimation(52)
	end,

	uncast = function(target)
		target.paralyzed = false
    target:sendStatus()
	end,
}

shield_slam_4 = {
  cast = function(player)
    local spellName = "Shield Slam"
    local spellIdent = "shield_slam_4"
    
    local formula = 750 + player.might * 3.5
    local damage = math.floor(formula)
    local side = player.side

    local vitaCost = 150
    local manaCost = 75
    local durations = 2000

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
      global_attack.cast(
        player,
        targets[1],
        damage,
        0,
        spellFX
      )
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(52, 0)
      targets[1].paralyzed = true
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
        damage,
        0,
        spellFX
      )
      if( targets[1].state == 1 or targets[1].blType == BL_PC) then
        player:sendMinitext("You can not cast on player")
      else
        targets[1]:setDuration(spellIdent, durations)
        targets[1]:sendAnimation(52, 0)
        targets[1].paralyzed = true
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  while_cast = function(target)
		target.paralyzed = true
    target:sendAnimation(52)
	end,

	uncast = function(target)
		target.paralyzed = false
    target:sendStatus()
	end,
}

shield_slam_5 = {
  cast = function(player)
    local spellName = "Shield Slam"
    local spellIdent = "shield_slam_5"
    
    local formula = 1000 + player.might * 4
    local damage = math.floor(formula)
    local side = player.side

    local vitaCost = 180
    local manaCost = 90
    local durations = 3000

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
      global_attack.cast(
        player,
        targets[1],
        damage,
        0,
        spellFX
      )
      targets[1]:setDuration(spellIdent, durations)
      targets[1]:sendAnimation(52, 0)
      targets[1].paralyzed = true
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
        damage,
        0,
        spellFX
      )
      if( targets[1].state == 1 or targets[1].blType == BL_PC) then
        player:sendMinitext("You can not cast on player")
      else
        targets[1]:setDuration(spellIdent, durations)
        targets[1]:sendAnimation(52, 0)
        targets[1].paralyzed = true
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  while_cast = function(target)
		target.paralyzed = true
    target:sendAnimation(52)
	end,

	uncast = function(target)
		target.paralyzed = false
    target:sendStatus()
	end,
}