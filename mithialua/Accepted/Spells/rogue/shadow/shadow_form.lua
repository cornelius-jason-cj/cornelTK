local aethers = 6000

shadow_form_1 = {
  cast = function(player)
    local spellName = "Shadow Form"
    local spellIdent = "shadow_form_1"
    
    local formula = 100 + player.might * 2
    local damage = math.floor(formula)
    local side = player.side

    local vitaCost = 80
    local manaCost = 40

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
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,
}

shadow_form_2 = {
  cast = function(player)
    local spellName = "Shadow Form"
    local spellIdent = "shadow_form_2"
    
    local formula = 200 + player.might * 3
    local damage = math.floor(formula)
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
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,
}

shadow_form_3 = {
  cast = function(player)
    local spellName = "Shadow Form"
    local spellIdent = "shadow_form_3"
    
    local formula = 400 + player.might * 4
    local damage = math.floor(formula)
    local side = player.side

    local vitaCost = 140
    local manaCost = 70

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
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,
}

shadow_form_4 = {
  cast = function(player)
    local spellName = "Shadow Form"
    local spellIdent = "shadow_form_4"
    
    local formula = 700 + player.might * 5
    local damage = math.floor(formula)
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
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,
}

shadow_form_5 = {
  cast = function(player)
    local spellName = "Shadow Form"
    local spellIdent = "shadow_form_5"
    
    local formula = 1100 + player.might * 6
    local damage = math.floor(formula)
    local side = player.side

    local vitaCost = 280
    local manaCost = 140

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
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,
}

