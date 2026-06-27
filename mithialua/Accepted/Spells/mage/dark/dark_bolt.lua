local aethers = 1000

dark_bolt_1 = {
  cast = function(player, target)
    local spellName = "Dark Bolt"
    local spellIdent = "dark_bolt_1"

    local manaCost = 35
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 70 + player.will * 2 + player.grace * 1
    local damage = math.floor(formula)

    local multiplier = 1
    local healMultiplier = 0

    if player:hasDuration("soul_sacrifice_1") then
      multiplier = 1.15
      healMultiplier = 0.025
    elseif player:hasDuration("soul_sacrifice_2") then
      multiplier = 1.25
      healMultiplier = 0.05
    elseif player:hasDuration("soul_sacrifice_3") then
      multiplier = 1.35
      healMultiplier = 0.075
    elseif player:hasDuration("soul_sacrifice_4") then
      multiplier = 1.45
      healMultiplier = 0.1
    elseif player:hasDuration("soul_sacrifice_5") then
      multiplier = 1.65
      healMultiplier = 0.15
    end

    local finalDamage = math.floor(damage * multiplier)
    local finaHealAmount =  math.floor(finalDamage * healMultiplier)

    local worked = global_zap.cast(player, target, finalDamage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end
    
    player:addHealthExtend(finaHealAmount, 0, 0, 0, 0, 0)
    player:setAether(spellIdent, aethers)
  end,
}

dark_bolt_2 = {
  cast = function(player, target)
    local spellName = "Dark Bolt"
    local spellIdent = "dark_bolt_2"

    local manaCost = 75
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 150 + player.will * 3 + player.grace * 2
    local damage = math.floor(formula)

    local multiplier = 1
    local healMultiplier = 0

    if player:hasDuration("soul_sacrifice_1") then
      multiplier = 1.15
      healMultiplier = 0.025
    elseif player:hasDuration("soul_sacrifice_2") then
      multiplier = 1.25
      healMultiplier = 0.05
    elseif player:hasDuration("soul_sacrifice_3") then
      multiplier = 1.35
      healMultiplier = 0.075
    elseif player:hasDuration("soul_sacrifice_4") then
      multiplier = 1.45
      healMultiplier = 0.1
    elseif player:hasDuration("soul_sacrifice_5") then
      multiplier = 1.65
      healMultiplier = 0.15
    end

    local finalDamage = math.floor(damage * multiplier)
    local finaHealAmount =  math.floor(finalDamage * healMultiplier)

    local worked = global_zap.cast(player, target, finalDamage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end
      
    player:addHealthExtend(finaHealAmount, 0, 0, 0, 0, 0)
    player:setAether(spellIdent, aethers)
  end,
}

dark_bolt_3 = {
  cast = function(player, target)
    local spellName = "Dark Bolt"
    local spellIdent = "dark_bolt_3"

    local manaCost = 135
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 270 + player.will * 4 + player.grace * 3
    local damage = math.floor(formula)

    local multiplier = 1
    local healMultiplier = 0

    if player:hasDuration("soul_sacrifice_1") then
      multiplier = 1.15
      healMultiplier = 0.025
    elseif player:hasDuration("soul_sacrifice_2") then
      multiplier = 1.25
      healMultiplier = 0.05
    elseif player:hasDuration("soul_sacrifice_3") then
      multiplier = 1.35
      healMultiplier = 0.075
    elseif player:hasDuration("soul_sacrifice_4") then
      multiplier = 1.45
      healMultiplier = 0.1
    elseif player:hasDuration("soul_sacrifice_5") then
      multiplier = 1.65
      healMultiplier = 0.15
    end

    local finalDamage = math.floor(damage * multiplier)
    local finaHealAmount =  math.floor(finalDamage * healMultiplier)

    local worked = global_zap.cast(player, target, finalDamage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end
      
    player:addHealthExtend(finaHealAmount, 0, 0, 0, 0, 0)
    player:setAether(spellIdent, aethers)
  end,
}

dark_bolt_4 = {
  cast = function(player, target)
    local spellName = "Dark Bolt"
    local spellIdent = "dark_bolt_4"

    local manaCost = 215
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 430 + player.will * 5 + player.grace * 4
    local damage = math.floor(formula)

    local multiplier = 1
    local healMultiplier = 0

    if player:hasDuration("soul_sacrifice_1") then
      multiplier = 1.15
      healMultiplier = 0.025
    elseif player:hasDuration("soul_sacrifice_2") then
      multiplier = 1.25
      healMultiplier = 0.05
    elseif player:hasDuration("soul_sacrifice_3") then
      multiplier = 1.35
      healMultiplier = 0.075
    elseif player:hasDuration("soul_sacrifice_4") then
      multiplier = 1.45
      healMultiplier = 0.1
    elseif player:hasDuration("soul_sacrifice_5") then
      multiplier = 1.65
      healMultiplier = 0.15
    end

    local finalDamage = math.floor(damage * multiplier)
    local finaHealAmount =  math.floor(finalDamage * healMultiplier)

    local worked = global_zap.cast(player, target, finalDamage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end
      
    player:addHealthExtend(finaHealAmount, 0, 0, 0, 0, 0)
    player:setAether(spellIdent, aethers)
  end,
}

dark_bolt_5 = {
  cast = function(player, target)
    local spellName = "Dark Bolt"
    local spellIdent = "dark_bolt_5"

    local manaCost = 330
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 660 + player.will * 6 + player.grace * 5
    local damage = math.floor(formula)

    local multiplier = 1
    local healMultiplier = 0

    if player:hasDuration("soul_sacrifice_1") then
      multiplier = 1.15
      healMultiplier = 0.025
    elseif player:hasDuration("soul_sacrifice_2") then
      multiplier = 1.25
      healMultiplier = 0.05
    elseif player:hasDuration("soul_sacrifice_3") then
      multiplier = 1.35
      healMultiplier = 0.075
    elseif player:hasDuration("soul_sacrifice_4") then
      multiplier = 1.45
      healMultiplier = 0.1
    elseif player:hasDuration("soul_sacrifice_5") then
      multiplier = 1.65
      healMultiplier = 0.15
    end

    local finalDamage = math.floor(damage * multiplier)
    local finaHealAmount =  math.floor(finalDamage * healMultiplier)

    local worked = global_zap.cast(player, target, finalDamage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end
      
    player:addHealthExtend(finaHealAmount, 0, 0, 0, 0, 0)
    player:setAether(spellIdent, aethers)
  end,
}