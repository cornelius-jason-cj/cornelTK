local aethers = 6000

thunderstorm_1 = {
  cast = function(player)

    local spellName = "Thunderstorm"
    local spellIdent = "thunderstorm_1"

    local formula = 300 + player.grace * 2
    local damage = math.floor(formula)

    local vitaCost = 120
    local manaCost = 60

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