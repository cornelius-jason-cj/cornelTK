
local aethers = 40000

critical_focus_1 = {
  cast = function(player)
    local spellName = "Critical Focus"
    local spellIdent = "critical_focus_1"
    
    local durations = 5 * 1000
    local desc = "Critical Chance increase 5%"

    local manaCost = 40

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
		player.bonusCrit  = player.bonusCrit + 5
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

critical_focus_2 = {
  cast = function(player)
    local spellName = "Critical Focus"
    local spellIdent = "critical_focus_2"
    
    local durations = 10 * 1000
    local desc = "Critical Chance increase 10%"

    local manaCost = 60

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
		player.bonusCrit  = player.bonusCrit + 10
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

critical_focus_3 = {
  cast = function(player)
    local spellName = "Critical Focus"
    local spellIdent = "critical_focus_3"
    
    local durations = 15 * 1000
    local desc = "Critical Chance increase 15%"

    local manaCost = 80

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
		player.bonusCrit  = player.bonusCrit + 15
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

critical_focus_4 = {
  cast = function(player)
    local spellName = "Critical Focus"
    local spellIdent = "critical_focus_5"
    
    local durations = 20 * 1000
    local desc = "Critical Chance increase 20%"

    local manaCost = 120

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
		player.bonusCrit  = player.bonusCrit + 20
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

critical_focus_5 = {
  cast = function(player)
    local spellName = "Critical Focus"
    local spellIdent = "critical_focus_5"
    
    local durations = 30 * 1000
    local desc = "Critical Chance increase 30%"

    local manaCost = 180

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
		player.bonusCrit  = player.bonusCrit + 30
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}
