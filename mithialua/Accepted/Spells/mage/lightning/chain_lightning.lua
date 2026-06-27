local aethers = 2000

chain_lightning_1 = {
  cast = function(player, target)

    local spellName = "Chain Lightning"
    local spellIdent = "chain_lightning_1"

    local manaCost = 60
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 120 + player.will + player.grace
    local damage = math.floor(formula)

    local worked = global_zap.cast(
      player,
      target,
      damage,
      manaCost,
      spellFX
    )

    if worked == 0 then
      return
    end

    player:sendMinitext(
      "You cast " .. spellName .. "."
    )

    local hitTargets = {}
    hitTargets[target.ID] = true

    local currentTarget = target

    local jumps = 2
    local jumpDamage = math.floor(damage * 0.8)

    for jump = 1, jumps do

      local nextTarget = nil

      for xx = -2, 2 do

        for yy = -2, 2 do

          local mobs =
            player:getObjectsInCell(
              currentTarget.m,
              currentTarget.x + xx,
              currentTarget.y + yy,
              BL_MOB
            )

          if #mobs > 0 then

            for k = 1, #mobs do

              if not hitTargets[mobs[k].ID] then
                nextTarget = mobs[k]
                break
              end

            end

          end

          if nextTarget ~= nil then
            break
          end

        end

        if nextTarget ~= nil then
          break
        end

      end

      if nextTarget == nil then
        break
      end

      nextTarget:sendAnimation(spellFX)

      global_zap.cast(
        player,
        nextTarget,
        jumpDamage,
        0,
        spellFX
      )

      hitTargets[nextTarget.ID] = true

      currentTarget = nextTarget

      jumpDamage =
        math.floor(jumpDamage * 0.8)

      if jumpDamage < 1 then
        break
      end

    end

    player:setAether(
      spellIdent,
      aethers
    )

  end,
}

chain_lightning_2 = {
  cast = function(player, target)

    local spellName = "Chain Lightning"
    local spellIdent = "chain_lightning_2"

    local manaCost = 90
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 180 + player.will + player.grace
    local damage = math.floor(formula)

    local worked = global_zap.cast(
      player,
      target,
      damage,
      manaCost,
      spellFX
    )

    if worked == 0 then
      return
    end

    player:sendMinitext(
      "You cast " .. spellName .. "."
    )

    local hitTargets = {}
    hitTargets[target.ID] = true

    local currentTarget = target

    local jumps = 3
    local jumpDamage = math.floor(damage * 0.8)

    for jump = 1, jumps do

      local nextTarget = nil

      for xx = -2, 2 do

        for yy = -2, 2 do

          local mobs =
            player:getObjectsInCell(
              currentTarget.m,
              currentTarget.x + xx,
              currentTarget.y + yy,
              BL_MOB
            )

          if #mobs > 0 then

            for k = 1, #mobs do

              if not hitTargets[mobs[k].ID] then
                nextTarget = mobs[k]
                break
              end

            end

          end

          if nextTarget ~= nil then
            break
          end

        end

        if nextTarget ~= nil then
          break
        end

      end

      if nextTarget == nil then
        break
      end

      nextTarget:sendAnimation(spellFX)

      global_zap.cast(
        player,
        nextTarget,
        jumpDamage,
        0,
        spellFX
      )

      hitTargets[nextTarget.ID] = true

      currentTarget = nextTarget

      jumpDamage =
        math.floor(jumpDamage * 0.8)

      if jumpDamage < 1 then
        break
      end

    end

    player:setAether(
      spellIdent,
      aethers
    )

  end,
}

chain_lightning_3 = {
  cast = function(player, target)

    local spellName = "Chain Lightning"
    local spellIdent = "chain_lightning_3"

    local manaCost = 130
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 260 + player.will + player.grace
    local damage = math.floor(formula)

    local worked = global_zap.cast(
      player,
      target,
      damage,
      manaCost,
      spellFX
    )

    if worked == 0 then
      return
    end

    player:sendMinitext(
      "You cast " .. spellName .. "."
    )

    local hitTargets = {}
    hitTargets[target.ID] = true

    local currentTarget = target

    local jumps = 4
    local jumpDamage = math.floor(damage * 0.8)

    for jump = 1, jumps do

      local nextTarget = nil

      for xx = -2, 2 do

        for yy = -2, 2 do

          local mobs =
            player:getObjectsInCell(
              currentTarget.m,
              currentTarget.x + xx,
              currentTarget.y + yy,
              BL_MOB
            )

          if #mobs > 0 then

            for k = 1, #mobs do

              if not hitTargets[mobs[k].ID] then
                nextTarget = mobs[k]
                break
              end

            end

          end

          if nextTarget ~= nil then
            break
          end

        end

        if nextTarget ~= nil then
          break
        end

      end

      if nextTarget == nil then
        break
      end

      nextTarget:sendAnimation(spellFX)

      global_zap.cast(
        player,
        nextTarget,
        jumpDamage,
        0,
        spellFX
      )

      hitTargets[nextTarget.ID] = true

      currentTarget = nextTarget

      jumpDamage =
        math.floor(jumpDamage * 0.8)

      if jumpDamage < 1 then
        break
      end

    end

    player:setAether(
      spellIdent,
      aethers
    )

  end,
}

chain_lightning_4 = {
  cast = function(player, target)

    local spellName = "Chain Lightning"
    local spellIdent = "chain_lightning_4"

    local manaCost = 180
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 360 + player.will + player.grace
    local damage = math.floor(formula)

    local worked = global_zap.cast(
      player,
      target,
      damage,
      manaCost,
      spellFX
    )

    if worked == 0 then
      return
    end

    player:sendMinitext(
      "You cast " .. spellName .. "."
    )

    local hitTargets = {}
    hitTargets[target.ID] = true

    local currentTarget = target

    local jumps = 5
    local jumpDamage = math.floor(damage * 0.8)

    for jump = 1, jumps do

      local nextTarget = nil

      for xx = -2, 2 do

        for yy = -2, 2 do

          local mobs =
            player:getObjectsInCell(
              currentTarget.m,
              currentTarget.x + xx,
              currentTarget.y + yy,
              BL_MOB
            )

          if #mobs > 0 then

            for k = 1, #mobs do

              if not hitTargets[mobs[k].ID] then
                nextTarget = mobs[k]
                break
              end

            end

          end

          if nextTarget ~= nil then
            break
          end

        end

        if nextTarget ~= nil then
          break
        end

      end

      if nextTarget == nil then
        break
      end

      nextTarget:sendAnimation(spellFX)

      global_zap.cast(
        player,
        nextTarget,
        jumpDamage,
        0,
        spellFX
      )

      hitTargets[nextTarget.ID] = true

      currentTarget = nextTarget

      jumpDamage =
        math.floor(jumpDamage * 0.8)

      if jumpDamage < 1 then
        break
      end

    end

    player:setAether(
      spellIdent,
      aethers
    )

  end,
}

chain_lightning_5 = {
  cast = function(player, target)

    local spellName = "Chain Lightning"
    local spellIdent = "chain_lightning_5"

    local manaCost = 240
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 480 + player.will + player.grace
    local damage = math.floor(formula)

    local worked = global_zap.cast(
      player,
      target,
      damage,
      manaCost,
      spellFX
    )

    if worked == 0 then
      return
    end

    player:sendMinitext(
      "You cast " .. spellName .. "."
    )

    local hitTargets = {}
    hitTargets[target.ID] = true

    local currentTarget = target

    local jumps = 6
    local jumpDamage = math.floor(damage * 0.8)

    for jump = 1, jumps do

      local nextTarget = nil

      for xx = -2, 2 do

        for yy = -2, 2 do

          local mobs =
            player:getObjectsInCell(
              currentTarget.m,
              currentTarget.x + xx,
              currentTarget.y + yy,
              BL_MOB
            )

          if #mobs > 0 then

            for k = 1, #mobs do

              if not hitTargets[mobs[k].ID] then
                nextTarget = mobs[k]
                break
              end

            end

          end

          if nextTarget ~= nil then
            break
          end

        end

        if nextTarget ~= nil then
          break
        end

      end

      if nextTarget == nil then
        break
      end

      nextTarget:sendAnimation(spellFX)

      global_zap.cast(
        player,
        nextTarget,
        jumpDamage,
        0,
        spellFX
      )

      hitTargets[nextTarget.ID] = true

      currentTarget = nextTarget

      jumpDamage =
        math.floor(jumpDamage * 0.8)

      if jumpDamage < 1 then
        break
      end

    end

    player:setAether(
      spellIdent,
      aethers
    )

  end,
}