local aethers = 2000

fire_ball_1 = {
  cast = function(player, target)
    local spellName = "Fire Ball"
    local spellIdent = "fire_ball_1"

    local manaCost = 40
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 400 + player.will * 2
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end
    
    player:setAether(spellIdent, aethers)
  end,
}

fire_ball_2 = {
  cast = function(player, target)
    local spellName = "Fire Ball"
    local spellIdent = "fire_ball_2"

    local manaCost = 90
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 600 + player.will * 3
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end
    
    player:setAether(spellIdent, aethers)
  end,
}

fire_ball_3 = {
  cast = function(player, target)
    local spellName = "Fire Ball"
    local spellIdent = "fire_ball_3"

    local manaCost = 160
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 900 + player.will * 4
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end
    
    player:setAether(spellIdent, aethers)
  end,
}

fire_ball_4 = {
  cast = function(player, target)
    local spellName = "Fire Ball"
    local spellIdent = "fire_ball_4"

    local manaCost = 240
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 1300 + player.will * 5
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end
    
    player:setAether(spellIdent, aethers)
  end,
}

fire_ball_5 = {
  cast = function(player, target)
    local spellName = "Fire Ball"
    local spellIdent = "fire_ball_5"

    local manaCost = 340
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 1800 + player.will * 6
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end

    local chanceArea = math.random(1, 10)

    if (chanceArea <= 3) then
      local areaDamage = math.floor(damage * 0.5)
      local x = {-1,  1, -1,  0,  1, -1,  0,  1}
      local y = { 0,  0,  1,  1,  1, -1, -1, -1}

      for i = 1, #x do
        local targets = player:getObjectsInCell(
          target.m,
          target.x + x[i],
          target.y + y[i],
          BL_MOB
        )
        if #targets > 0 then
          global_zap.cast(player, targets[1], areaDamage, 0, spellFX) 
        end

        targets = player:getObjectsInCell(
          target.m,
          target.x + x[i],
          target.y + y[i],
          BL_PC
        )
        if #targets > 0 then
          global_zap.cast(player, targets[1], areaDamage, 0, spellFX)
        end
      end

    end
    
    player:setAether(spellIdent, aethers)
  end,
}



