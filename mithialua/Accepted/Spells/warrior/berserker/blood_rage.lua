blood_rage_1 = {
  cast = function(player)
    local durations = 5 * 1000
    local spellName = "Blood Rage"
    local spellIdent = "blood_rage_1"

    local manaCost = 20

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:setDuration(spellIdent, durations)
    player:sendAnimation(178)
    player:calcStat()
  end,

  recast = function(player)
    local bonusDmg = 1.1
    local penaltyDef = 10

    if player.armor + penalty > 100 then
      penalty = 100 - player.armor
    end

		player.bonusDamage  = player.bonusDamage + bonusDmg
		player.bonusArmor = player.bonusArmor + penalty
		player:sendStatus()
	end,

	uncast = function(player)
    local spellIdent = "blood_rage_1"
    local aethers = 30 * 1000
    player:setAether(spellIdent, aethers)
		player:sendStatus()
    player:calcStat()
	end,
}

blood_rage_2 = {
  cast = function(player)
    local durations = 10 * 1000
    local spellName = "Blood Rage"
    local spellIdent = "blood_rage_2"

    local manaCost = 75

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:setDuration(spellIdent, durations)
    player:sendAnimation(178)
    player:calcStat()
  end,

  recast = function(player)
    local bonusDmg = 1.2
    local penaltyDef = 15

    if player.armor + penalty > 100 then
      penalty = 100 - player.armor
    end

		player.bonusDamage  = player.bonusDamage + bonusDmg
		player.bonusArmor = player.bonusArmor + penalty
		player:sendStatus()
	end,

	uncast = function(player)
    local spellIdent = "blood_rage_2"
    local aethers = 25 * 1000
    player:setAether(spellIdent, aethers)
		player:sendStatus()
    player:calcStat()
	end,
}

blood_rage_3 = {
  cast = function(player)
    local durations = 15 * 1000
    local spellName = "Blood Rage"
    local spellIdent = "blood_rage_3"

    local manaCost = 100

    if not player:canCast(1, 1, 0) then
      return
    end
    
    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end
    
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:setDuration(spellIdent, durations)
    player:sendAnimation(178)
    player:calcStat()
  end,

  recast = function(player)
    local bonusDmg = 1.35
    local penaltyDef = 20

    if player.armor + penalty > 100 then
      penalty = 100 - player.armor
    end

		player.bonusDamage  = player.bonusDamage + bonusDmg
		player.bonusArmor = player.bonusArmor + penalty
		player:sendStatus()
	end,

	uncast = function(player)
    local spellIdent = "blood_rage_3"
    local aethers = 20 * 1000
    player:setAether(spellIdent, aethers)
		player:sendStatus()
    player:calcStat()
	end,
}

blood_rage_4 = {
  cast = function(player)
    local durations = 20 * 1000
    local spellName = "Blood Rage"
    local spellIdent = "blood_rage_4"

    local manaCost = 125

    if not player:canCast(1, 1, 0) then
      return
    end
    
    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end
    
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:setDuration(spellIdent, durations)
    player:sendAnimation(178)
    player:calcStat()
  end,

  recast = function(player)
    local bonusDmg = 1.55
    local penaltyDef = 25

    if player.armor + penalty > 100 then
      penalty = 100 - player.armor
    end

		player.bonusDamage  = player.bonusDamage + bonusDmg
		player.bonusArmor = player.bonusArmor + penalty
		player:sendStatus()
	end,

	uncast = function(player)
    local spellIdent = "blood_rage_4"
    local aethers = 15 * 1000
    player:setAether(spellIdent, aethers)
		player:sendStatus()
    player:calcStat()
	end,
}

blood_rage_5 = {
  cast = function(player)
    local durations = 30 * 1000
    local spellName = "Blood Rage"
    local spellIdent = "blood_rage_5"
    
    local manaCost = 150

    if not player:canCast(1, 1, 0) then
      return
    end
    
    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end
    
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:setDuration(spellIdent, durations)
    player:sendAnimation(178)
    player:calcStat()
  end,

  recast = function(player)
    local bonusDmg = 1.8
    local penaltyDef = 30

    if player.armor + penalty > 100 then
      penalty = 100 - player.armor
    end

		player.bonusDamage  = player.bonusDamage + bonusDmg
		player.bonusArmor = player.bonusArmor + penalty
		player:sendStatus()
	end,

	uncast = function(player)
    local spellIdent = "blood_rage_5"
    local aethers = 10 * 1000
    player:setAether(spellIdent, aethers)
		player:sendStatus()
    player:calcStat()
	end,
}
