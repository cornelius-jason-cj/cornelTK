local aethers = 1000
local durations = 5000

lightning_bolt_1 = {
  cast = function(player, target)
    local spellName = "Lightning Bolt"
    local spellIdent = "lightning_bolt_1"

    local manaCost = 40
    local spellFX = 3001
    
    local chanceReduceArmor = math.random(1,10)

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 80 + player.will  + player.might 
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
      if (chanceReduceArmor <= 1) then
        target.bonusArmor = target.bonusArmor + 5
        target.cursed = 1
        target:setDuration(spellIdent, durations)
      end
    end
    
    if worked == 2 then
      -- target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
      return
    end
    
    player:setAether(spellIdent, aethers)
  end,

  recast = function(target)
		target.bonusArmor = target.bonusArmor + 5
		target.cursed = 1
		target:sendStatus()
	end,

	uncast = function(target)
		target.bonusArmor = target.bonusArmor - 5
		target.cursed = 0
		target:sendStatus()
	end,
}

lightning_bolt_2 = {
  cast = function(player, target)
    local spellName = "Lightning Bolt"
    local spellIdent = "lightning_bolt_2"

    local manaCost = 65
    local spellFX = 3001

    local chanceReduceArmor = math.random(1,10)

    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 130 + player.will + player.might
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
      if (chanceReduceArmor <= 2) then
        target.bonusArmor = target.bonusArmor + 5
        target.cursed = 1
        target:setDuration(spellIdent, durations)
      end
    end
    
    if worked == 2 then
      -- target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
      return
    end
      
    player:setAether(spellIdent, aethers)
  end,

  
  recast = function(target)
		target.bonusArmor = target.bonusArmor + 5
		target.cursed = 1
		target:sendStatus()
	end,

	uncast = function(target)
		target.bonusArmor = target.bonusArmor - 5
		target.cursed = 0
		target:sendStatus()
	end,
}

lightning_bolt_3 = {
  cast = function(player, target)
    local spellName = "Lightning Bolt"
    local spellIdent = "lightning_bolt_3"

    local manaCost = 100
    local spellFX = 3001

    local chanceReduceArmor = math.random(1,10)
    
    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 200 + player.will + player.grace
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
      if (chanceReduceArmor <= 2) then
        target.bonusArmor = target.bonusArmor + 10
        target.cursed = 1
        target:setDuration(spellIdent, durations)
      end
    end
    
    if worked == 2 then
      -- target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
      return
    end
      
    player:setAether(spellIdent, aethers)
  end,

  
  recast = function(target)
		target.bonusArmor = target.bonusArmor + 10
		target.cursed = 1
		target:sendStatus()
	end,

	uncast = function(target)
		target.bonusArmor = target.bonusArmor - 10
		target.cursed = 0
		target:sendStatus()
	end,
}

lightning_bolt_4 = {
  cast = function(player, target)
    local spellName = "Lightning Bolt"
    local spellIdent = "lightning_bolt_4"

    local manaCost = 145
    local spellFX = 3001

    local chanceReduceArmor = math.random(1,10)
    
    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 290 + player.will + player.grace
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
      if (chanceReduceArmor <= 3) then
        target.bonusArmor = target.bonusArmor + 10
        target.cursed = 1
        target:setDuration(spellIdent, durations)
      end
    end
    
    if worked == 2 then
      -- target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
      return
    end
      
    player:setAether(spellIdent, aethers)
  end,

  recast = function(target)
		target.bonusArmor = target.bonusArmor + 10
		target.cursed = 1
		target:sendStatus()
	end,

	uncast = function(target)
		target.bonusArmor = target.bonusArmor - 10
		target.cursed = 0
		target:sendStatus()
	end,
}

lightning_bolt_5 = {
  cast = function(player, target)
    local spellName = "Lightning Bolt"
    local spellIdent = "lightning_bolt_5"

    local manaCost = 200
    local spellFX = 3001

    local chanceReduceArmor = math.random(1,10)
    
    if not player:canCast(1, 1, 0) then
      return
    end

    local formula = 400 + player.will + player.grace
    local damage = math.floor(formula)

    local worked = global_zap.cast(player, target, damage, manaCost, spellFX)
    
    if worked ~= 0 then
      player:sendMinitext("You cast " .. spellName .. ".")
      if (chanceReduceArmor <= 5) then
        target.bonusArmor = target.bonusArmor + 20
        target.cursed = 1
        target:setDuration(spellIdent, durations)
      end
    end
    
    if worked == 2 then
      -- target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
      return
    end
      
    player:setAether(spellIdent, aethers)
  end,
  
  recast = function(target)
		target.bonusArmor = target.bonusArmor + 20
		target.cursed = 1
		target:sendStatus()
	end,

	uncast = function(target)
		target.bonusArmor = target.bonusArmor - 20
		target.cursed = 0
		target:sendStatus()
	end,
}