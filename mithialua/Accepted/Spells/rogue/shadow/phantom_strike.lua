local aethers = 4000

phantom_strike_1 = {
  cast = function(player)

    local spellName = "Phantom Strike"
    local spellIdent = "phantom_strike_1"

    local formula = 150 + player.will * 1 + player.grace * 1
    local damage = math.floor(formula)

    local vitaCost = 120
    local manaCost = 60
    
    local maxDistance = 3
    local spellFX = 2001

    local side = player.side
    
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

    local dir = {
      [0] = {0,-1},
      [1] = {1,0},
      [2] = {0,1},
      [3] = {-1,0}
    }

    local dx = dir[player.side][1]
    local dy = dir[player.side][2]

    local distFinish = 0

     for i = 1, maxDistance do

      local tx = player.x + dx * i
      local ty = player.y + dy * i

      if checkSpecificTile(player, tx, ty) then
        distFinish = i
      else
        break
      end

    end

    if distFinish == 0 then
      player:sendMinitext("Cannot move.")
      return
    end

    for i = 1, distFinish do

      local tx = player.x + dx * i
      local ty = player.y + dy * i

      local mobs = player:getObjectsInCell(
        player.m,
        tx,
        ty,
        BL_MOB
      )

      if #mobs > 0 then

        local finalDamage = damage

        if mobs[1].paralyzed then
          finalDamage = finalDamage * 2
        end

        global_attack.cast(
          player,
          mobs[1],
          finalDamage,
          0,
          spellFX
        )
      end

    end

    player:warp(
      player.m,
      player.x + dx * distFinish,
      player.y + dy * distFinish
    )

    player:sendAnimation(spellFX)

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost
    
    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)

  end
}

phantom_strike_2 = {
  cast = function(player)

    local spellName = "Phantom Strike"
    local spellIdent = "phantom_strike_2"

    local formula = 500 + player.grace * 3
    local damage = math.floor(formula)

    local vitaCost = 160
    local manaCost = 80

    local side = player.side
    local distFinish = 0
    local counter = 0
    
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

    repeat
      counter = counter + 1

      local x = player.x
      local y = player.y

      if side == 0 then
        y = y - counter
      elseif side == 1 then
        x = x + counter
      elseif side == 2 then
        y = y + counter
      elseif side == 3 then
        x = x - counter
      end

      if checkSpecificTile(player, x, y) then
        distFinish = counter
      else
        break
      end

    until counter >= 3

    if distFinish > 0 then
      if side == 0 then
        player:warp(player.m, player.x, player.y - distFinish)
      elseif side == 1 then
        player:warp(player.m, player.x + distFinish, player.y)
      elseif side == 2 then
        player:warp(player.m, player.x, player.y + distFinish)
      elseif side == 3 then
        player:warp(player.m, player.x - distFinish, player.y)
      end
    end

    player:sendAnimation(2001)

    local tx = player.x
    local ty = player.y

    if side == 0 then
      ty = ty - 1
    elseif side == 1 then
      tx = tx + 1
    elseif side == 2 then
      ty = ty + 1
    elseif side == 3 then
      tx = tx - 1
    end

    local targets = player:getObjectsInCell(
      player.m,
      tx,
      ty,
      BL_MOB
    )

    if #targets > 0 then
      local finalDamage = damage

      if (targets[1].paralyzed) then
        finalDamage = finalDamage * 2
      end
      
      global_attack.cast(
        player,
        targets[1],
        finalDamage,
        0,
        2001
      )
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)

  end
}

phantom_strike_3 = {
  cast = function(player)

    local spellName = "Phantom Strike"
    local spellIdent = "phantom_strike_3"

    local formula = 800 + player.grace * 4
    local damage = math.floor(formula)

    local vitaCost = 240
    local manaCost = 120

    local side = player.side
    local distFinish = 0
    local counter = 0
    
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

    repeat
      counter = counter + 1

      local x = player.x
      local y = player.y

      if side == 0 then
        y = y - counter
      elseif side == 1 then
        x = x + counter
      elseif side == 2 then
        y = y + counter
      elseif side == 3 then
        x = x - counter
      end

      if checkSpecificTile(player, x, y) then
        distFinish = counter
      else
        break
      end

    until counter >= 3

    if distFinish > 0 then
      if side == 0 then
        player:warp(player.m, player.x, player.y - distFinish)
      elseif side == 1 then
        player:warp(player.m, player.x + distFinish, player.y)
      elseif side == 2 then
        player:warp(player.m, player.x, player.y + distFinish)
      elseif side == 3 then
        player:warp(player.m, player.x - distFinish, player.y)
      end
    end

    player:sendAnimation(2001)

    local tx = player.x
    local ty = player.y

    if side == 0 then
      ty = ty - 1
    elseif side == 1 then
      tx = tx + 1
    elseif side == 2 then
      ty = ty + 1
    elseif side == 3 then
      tx = tx - 1
    end

    local targets = player:getObjectsInCell(
      player.m,
      tx,
      ty,
      BL_MOB
    )

    if #targets > 0 then
      local finalDamage = damage

      if (targets[1].paralyzed) then
        finalDamage = finalDamage * 2
      end
      
      global_attack.cast(
        player,
        targets[1],
        finalDamage,
        0,
        2001
      )
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)

  end
}

phantom_strike_4 = {
  cast = function(player)

    local spellName = "Phantom Strike"
    local spellIdent = "phantom_strike_4"

    local formula = 1200 + player.grace * 5
    local damage = math.floor(formula)

    local vitaCost = 320
    local manaCost = 160

    local side = player.side
    local distFinish = 0
    local counter = 0
    
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

    repeat
      counter = counter + 1

      local x = player.x
      local y = player.y

      if side == 0 then
        y = y - counter
      elseif side == 1 then
        x = x + counter
      elseif side == 2 then
        y = y + counter
      elseif side == 3 then
        x = x - counter
      end

      if checkSpecificTile(player, x, y) then
        distFinish = counter
      else
        break
      end

    until counter >= 3

    if distFinish > 0 then
      if side == 0 then
        player:warp(player.m, player.x, player.y - distFinish)
      elseif side == 1 then
        player:warp(player.m, player.x + distFinish, player.y)
      elseif side == 2 then
        player:warp(player.m, player.x, player.y + distFinish)
      elseif side == 3 then
        player:warp(player.m, player.x - distFinish, player.y)
      end
    end

    player:sendAnimation(2001)

    local tx = player.x
    local ty = player.y

    if side == 0 then
      ty = ty - 1
    elseif side == 1 then
      tx = tx + 1
    elseif side == 2 then
      ty = ty + 1
    elseif side == 3 then
      tx = tx - 1
    end

    local targets = player:getObjectsInCell(
      player.m,
      tx,
      ty,
      BL_MOB
    )

    if #targets > 0 then
      local finalDamage = damage

      if (targets[1].paralyzed) then
        finalDamage = finalDamage * 2
      end
      
      global_attack.cast(
        player,
        targets[1],
        finalDamage,
        0,
        2001
      )
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)

  end
}

phantom_strike_5 = {
  cast = function(player)

    local spellName = "Phantom Strike"
    local spellIdent = "phantom_strike_5"

    local formula = 2000 + player.grace * 6
    local damage = math.floor(formula)

    local vitaCost = 440
    local manaCost = 220

    local side = player.side
    local distFinish = 0
    local counter = 0
    
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

    repeat
      counter = counter + 1

      local x = player.x
      local y = player.y

      if side == 0 then
        y = y - counter
      elseif side == 1 then
        x = x + counter
      elseif side == 2 then
        y = y + counter
      elseif side == 3 then
        x = x - counter
      end

      if checkSpecificTile(player, x, y) then
        distFinish = counter
      else
        break
      end

    until counter >= 3

    if distFinish > 0 then
      if side == 0 then
        player:warp(player.m, player.x, player.y - distFinish)
      elseif side == 1 then
        player:warp(player.m, player.x + distFinish, player.y)
      elseif side == 2 then
        player:warp(player.m, player.x, player.y + distFinish)
      elseif side == 3 then
        player:warp(player.m, player.x - distFinish, player.y)
      end
    end

    player:sendAnimation(2001)

    local tx = player.x
    local ty = player.y

    if side == 0 then
      ty = ty - 1
    elseif side == 1 then
      tx = tx + 1
    elseif side == 2 then
      ty = ty + 1
    elseif side == 3 then
      tx = tx - 1
    end

    local targets = player:getObjectsInCell(
      player.m,
      tx,
      ty,
      BL_MOB
    )

    if #targets > 0 then
      local finalDamage = damage

      if (targets[1].paralyzed) then
        finalDamage = finalDamage * 2
      end
      
      global_attack.cast(
        player,
        targets[1],
        finalDamage,
        0,
        2001
      )
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)

  end
}