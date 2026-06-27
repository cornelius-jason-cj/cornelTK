local aethers = 10000
local durations = 5000

Meteor_1 = {
  cast = function(player, target)
    local spellName = "Meteor"
    local spellIdent = "Meteor_1"
    local spellBurnIdent = "Meteor_burn_1"

    local manaCost = 175
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 700 + player.will * 5
    local damage = math.floor(formula)
    local chanceBurn = math.random(1, 10)
    local areaDamage = math.floor(damage * 0.3)
    target.registry["meteorDamage"] = damage * 0.1
    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
      if(chanceBurn <= 5) then
        if target:hasDuration(spellBurnIdent) then
          target:setDuration(spellBurnIdent, 0)
          target:setDuration(spellBurnIdent, durations)
        else
          target:setDuration(spellBurnIdent, durations)
        end
      end
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end

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
    
    
    player:setAether(spellIdent, aethers)
  end,
}

Meteor_burn_1 = {
  while_cast_1500 = function(block, player)
    local damage = block.registry["meteorDamage"]

    block:sendAnimation(1, 5)

    if damage > 0 then
      block:removeHealthExtend(
        damage,
        1,
        1,
        0,
        0
      )
    end
	end
}


Meteor_2 = {
  cast = function(player, target)
    local spellName = "Meteor"
    local spellIdent = "Meteor_2"
    local spellBurnIdent = "Meteor_burn_2"

    local manaCost = 300
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 1200 + player.will * 6
    local damage = math.floor(formula)
    local chanceBurn = math.random(1, 10)
    local areaDamage = math.floor(damage * 0.3)
    target.registry["meteorDamage"] = damage * 0.1
    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
      if(chanceBurn <= 5) then
        if target:hasDuration(spellBurnIdent) then
          target:setDuration(spellBurnIdent, 0)
          target:setDuration(spellBurnIdent, durations)
        else
          target:setDuration(spellBurnIdent, durations)
        end
      end
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end

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
    
    
    player:setAether(spellIdent, aethers)
  end,
}

Meteor_burn_2 = {
  while_cast_1500 = function(block, player)
    local damage = block.registry["meteorDamage"]

    block:sendAnimation(1, 5)

    if damage > 0 then
      block:removeHealthExtend(
        damage,
        1,
        1,
        0,
        0
      )
    end
	end
}


Meteor_3 = {
  cast = function(player, target)
    local spellName = "Meteor"
    local spellIdent = "Meteor_3"
    local spellBurnIdent = "Meteor_burn_3"

    local manaCost = 475
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 1900 + player.will * 7
    local damage = math.floor(formula)
    local chanceBurn = math.random(1, 10)
    local areaDamage = math.floor(damage * 0.3)
    target.registry["meteorDamage"] = damage * 0.1
    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
      if(chanceBurn <= 5) then
        if target:hasDuration(spellBurnIdent) then
          target:setDuration(spellBurnIdent, 0)
          target:setDuration(spellBurnIdent, durations)
        else
          target:setDuration(spellBurnIdent, durations)
        end
      end
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end

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
    
    
    player:setAether(spellIdent, aethers)
  end,
}

Meteor_burn_3 = {
  while_cast_1500 = function(block, player)
    local damage = block.registry["meteorDamage"]

    block:sendAnimation(1, 5)

    if damage > 0 then
      block:removeHealthExtend(
        damage,
        1,
        1,
        0,
        0
      )
    end
	end
}


Meteor_4 = {
  cast = function(player, target)
    local spellName = "Meteor"
    local spellIdent = "Meteor_4"
    local spellBurnIdent = "Meteor_burn_4"

    local manaCost = 700
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 2800 + player.will * 8
    local damage = math.floor(formula)
    local chanceBurn = math.random(1, 10)
    local areaDamage = math.floor(damage * 0.3)
    target.registry["meteorDamage"] = damage * 0.1
    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
      if(chanceBurn <= 5) then
        if target:hasDuration(spellBurnIdent) then
          target:setDuration(spellBurnIdent, 0)
          target:setDuration(spellBurnIdent, durations)
        else
          target:setDuration(spellBurnIdent, durations)
        end
      end
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end

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
    
    
    player:setAether(spellIdent, aethers)
  end,
}

Meteor_burn_4 = {
  while_cast_1500 = function(block, player)
    local damage = block.registry["meteorDamage"]

    block:sendAnimation(1, 5)

    if damage > 0 then
      block:removeHealthExtend(
        damage,
        1,
        1,
        0,
        0
      )
    end
	end
}


Meteor_5 = {
  cast = function(player, target)
    local spellName = "Meteor"
    local spellIdent = "Meteor_5"
    local spellBurnIdent = "Meteor_burn_5"

    local manaCost = 975
    local spellFX = 3001

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 3900 + player.will * 10
    local damage = math.floor(formula)
    local chanceBurn = math.random(1, 10)
    local areaDamage = math.floor(damage * 0.3)
    target.registry["meteorDamage"] = damage * 0.1
    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
      if(chanceBurn <= 5) then
        if target:hasDuration(spellBurnIdent) then
          target:setDuration(spellBurnIdent, 0)
          target:setDuration(spellBurnIdent, durations)
        else
          target:setDuration(spellBurnIdent, durations)
        end
      end
    end
    
    if worked == 2 then
      target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
    end

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
    
    
    player:setAether(spellIdent, aethers)
  end,
}

Meteor_burn_5 = {
  while_cast_1500 = function(block, player)
    local damage = block.registry["meteorDamage"]

    block:sendAnimation(1, 5)

    if damage > 0 then
      block:removeHealthExtend(
        damage,
        1,
        1,
        0,
        0
      )
    end
	end
}