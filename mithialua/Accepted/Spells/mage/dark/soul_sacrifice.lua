local aethers = 25000

soul_sacrifice_1 = {
  cast = function(player)
    local spellName = "Soul Sacrifice"
    local spellIdent = "soul_sacrifice_1"

    local vitaCost = player.maxHealth * 0.1

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end
    
    player.health = player.health - vitaCost

    player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end
}

soul_sacrifice_2 = {
  cast = function(player)
    local spellName = "Soul Sacrifice"
    local spellIdent = "soul_sacrifice_2"

    local vitaCost = player.maxHealth * 0.12

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end
    
    player.health = player.health - vitaCost

    player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end
}

soul_sacrifice_3 = {
  cast = function(player)
    local spellName = "Soul Sacrifice"
    local spellIdent = "soul_sacrifice_3"

    local vitaCost = player.maxHealth * 0.14

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end
    
    player.health = player.health - vitaCost

    player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end
}

soul_sacrifice_4 = {
  cast = function(player)
    local spellName = "Soul Sacrifice"
    local spellIdent = "soul_sacrifice_4"

    local vitaCost = player.maxHealth * 0.16

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end
    
    player.health = player.health - vitaCost

    player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end
}

soul_sacrifice_5 = {
  cast = function(player)
    local spellName = "Soul Sacrifice"
    local spellIdent = "soul_sacrifice_5"

    local vitaCost = player.maxHealth * 0.2

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end
    
    player.health = player.health - vitaCost

    player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end
}