
local aethers = 70000

blood_rage_1 = {
  cast = function(player)
    local durations = 10 * 1000
    local spellIdent = "blood_rage_1"
    local desc = "Damage increase 10%, Armor -10"

    local manaCost = 50

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.magic = player.magic - manaCost
    
    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)
  end,

  recast = function(player)
		player.bonusDamage  = player.bonusDamage + 1.1
		player.bonusArmor = player.bonusArmor - 10
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

blood_rage_2 = {
  cast = function(player)
    local durations = 15 * 1000
    local spellIdent = "blood_rage_2"
    local desc = "Damage increase 20%, Armor -10"

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
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)
  end,

  recast = function(player)
		player.bonusDamage  = player.bonusDamage + 1.2
		player.bonusArmor = player.bonusArmor - 10
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

blood_rage_3 = {
  cast = function(player)
    local durations = 25 * 1000
    local spellIdent = "blood_rage_3"
    local desc = "Damage increase 30%, Armor -10"

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
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)
  end,

  recast = function(player)
		player.bonusDamage  = player.bonusDamage + 1.35
		player.bonusArmor = player.bonusArmor - 10
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

blood_rage_4 = {
  cast = function(player)
    local durations = 40 * 1000
    local spellIdent = "blood_rage_4"
    local desc = "Damage increase 40%, Armor -10"

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
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)
  end,

  recast = function(player)
		player.bonusDamage  = player.bonusDamage + 1.55
		player.bonusArmor = player.bonusArmor - 10
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

blood_rage_5 = {
  cast = function(player)
    local durations = 60 * 1000
    local spellIdent = "blood_rage_5"
    local desc = "Damage increase 50%, Armor -10"
    
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
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)
  end,

  recast = function(player)
		player.bonusDamage  = player.bonusDamage + 1.8
		player.bonusArmor = player.bonusArmor - 10
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}
