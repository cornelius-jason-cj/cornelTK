local aethers = 1000

ice_bolt_1 = {
  cast = function(player, target)
    local spellName = "Ice Bolt"
    local spellIdent = "ice_bolt_1"

    local manaCost = 30
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 60 + player.will * 1 + player.might * 1
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      -- target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
      return
    end
    
    player:setAether(spellIdent, aethers)
  end,
}

ice_bolt_2 = {
  cast = function(player, target)
    local spellName = "Ice Bolt"
    local spellIdent = "ice_bolt_2"

    local manaCost = 70
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 140 + player.will * 2 + player.might * 2
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      -- target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
      return
    end
      
    player:setAether(spellIdent, aethers)
  end,
}

ice_bolt_3 = {
  cast = function(player, target)
    local spellName = "Ice Bolt"
    local spellIdent = "ice_bolt_3"

    local manaCost = 120
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 240 + player.will * 3 + player.grace * 3
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      -- target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
      return
    end
      
    player:setAether(spellIdent, aethers)
  end,
}

ice_bolt_4 = {
  cast = function(player, target)
    local spellName = "Ice Bolt"
    local spellIdent = "ice_bolt_4"

    local manaCost = 180
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 360 + player.will * 4 + player.grace * 4
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      -- target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
      return
    end
      
    player:setAether(spellIdent, aethers)
  end,
}

ice_bolt_5 = {
  cast = function(player, target)
    local spellName = "Ice Bolt"
    local spellIdent = "ice_bolt_5"

    local manaCost = 280
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 560 + player.will * 5 + player.grace * 5
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
    end
    
    if worked == 2 then
      -- target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
      return
    end
      
    player:setAether(spellIdent, aethers)
  end,
}