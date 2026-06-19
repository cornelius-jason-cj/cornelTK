local aethers = 30000

thorns_1 = {
  cast = function(player)
    local spellName = "Thorns"
    local spellIdent = "thorns_1"
    local desc = "Release Thorn around you"
    local durations = 2 * 1000

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

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)
  end,

  while_cast = function(player)
    local damage = math.floor(50 + player.might * 0.5)

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
        global_zap.cast(player, targets[1], damage, 0, spellFX)
      end

      -- targets = player:getObjectsInCell(
      --   player.m,
      --   player.x + x[i],
      --   player.y + y[i],
      --   BL_PC
      -- )

      -- if (#targets > 0) then
        -- local worked = global_zap.cast(player, targets[1], damage, 0, spellFX)
        -- if (worked == 2) then
          -- targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
        -- end
      -- end
    end
  end,
}

thorns_2 = {
  cast = function(player)
    local spellName = "Thorns"
    local spellIdent = "thorns_2"
    local desc = "Release Thorn around you"
    local durations = 4 * 1000

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

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)
  end,

  while_cast = function(player)
    local damage = math.floor(100 + player.might * 1)

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
        global_zap.cast(player, target[1], damage, 0, spellFX)
      end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )

      if (#targets > 0) then
        local worked = global_zap.cast(player, target[1], damage, 0, spellFX)

        if (worked == 2) then
          -- targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
        end
      end
    end
    player:sendStatus()
  end,
}

thorns_3 = {
  cast = function(player)
    local spellName = "Thorns"
    local spellIdent = "thorns_3"
    local desc = "Release Thorn around you"
    local durations = 6 * 1000

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

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)
  end,

  while_cast = function(player)
    local damage = math.floor(150 + player.might * 1.5)

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
        global_zap.cast(player, target[1], damage, 0, spellFX)
      end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )

      if (#targets > 0) then
        local worked = global_zap.cast(player, target[1], damage, 0, spellFX)

        if (worked == 2) then
          -- targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
        end
      end
    end
    player:sendStatus()
  end,
}

thorns_4 = {
  cast = function(player)
    local spellName = "Thorns"
    local spellIdent = "thorns_4"
    local desc = "Release Thorn around you"
    local durations = 8 * 1000

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

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)
  end,

  while_cast = function(player)
    local damage = math.floor(200 + player.might * 2)

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
        global_zap.cast(player, target[1], damage, 0, spellFX)
      end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )

      if (#targets > 0) then
        local worked = global_zap.cast(player, target[1], damage, 0, spellFX)

        if (worked == 2) then
          -- targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
        end
      end
    end
    player:sendStatus()
  end,
}

thorns_5 = {
  cast = function(player)
    local spellName = "Thorns"
    local spellIdent = "thorns_5"
    local desc = "Release Thorn around you"
    local durations = 10 * 1000

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

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)
  end,

  while_cast = function(player)
    local damage = math.floor(300 + player.might * 3)

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
        global_zap.cast(player, target[1], damage, 0, spellFX)
      end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )

      if (#targets > 0) then
        local worked = global_zap.cast(player, target[1], damage, 0, spellFX)

        if (worked == 2) then
          -- targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
        end
      end
    end
    player:sendStatus()
  end,
}