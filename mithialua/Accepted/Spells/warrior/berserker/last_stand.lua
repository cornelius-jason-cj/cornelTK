last_stand_1 = {
  cast = function(player)
    local durations = 5 * 1000
    local spellIdent = "last_stand_1"
    local spellName = "last stand"

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
    player:setDuration(spellIdent, durations)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAnimation(74)
    player:sendAnimation(72)
    player:calcStat()
  end,

  recast = function(player)
    local lifeStealPct = 0.10
		player.bonusLifeSteal  = player.bonusLifeSteal + lifeStealPct
		player:sendStatus()
	end,

	uncast = function(player)
    local spellIdent = "last_stand_1"
    local aethers = 30 * 1000
    player:setAether(spellIdent, aethers)
		player:sendStatus()
    player:calcStat()
	end,
}

last_stand_2 = {
  cast = function(player)
    local durations = 10 * 1000
    local spellIdent = "last_stand_2"
    local spellName = "last stand"

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
    player:setDuration(spellIdent, durations)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAnimation(74)
    player:sendAnimation(72)
    player:calcStat()
  end,

  recast = function(player)
    local lifeStealPct = 0.20
		player.bonusLifeSteal  = player.bonusLifeSteal + lifeStealPct
		player:sendStatus()
	end,

	uncast = function(player)
    local spellIdent = "last_stand_2"
    local aethers = 25 * 1000
    player:setAether(spellIdent, aethers)
		player:sendStatus()
    player:calcStat()
	end,
}

last_stand_3 = {
  cast = function(player)
    local durations = 15 * 1000
    local spellIdent = "last_stand_3"
    local spellName = "last stand"

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
    player:setDuration(spellIdent, durations)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAnimation(74)
    player:sendAnimation(72)
    player:calcStat()
  end,
    

  recast = function(player)
    local lifeStealPct = 0.30
		player.bonusLifeSteal  = player.bonusLifeSteal + lifeStealPct
		player:sendStatus()
	end,

	uncast = function(player)
    local spellIdent = "last_stand_3"
    local aethers = 20 * 1000
    player:setAether(spellIdent, aethers)
		player:sendStatus()
    player:calcStat()
	end,
}

last_stand_4 = {
  cast = function(player)
    local durations = 20 * 1000
    local spellIdent = "last_stand_4"
    local spellName = "last stand"

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
    player:setDuration(spellIdent, durations)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAnimation(74)
    player:sendAnimation(72)
    player:calcStat()
  end,

  recast = function(player)
    local lifeStealPct = 0.40
		player.bonusLifeSteal  = player.bonusLifeSteal + lifeStealPct
		player:sendStatus()
	end,

	uncast = function(player)
    local spellIdent = "last_stand_4"
    local aethers = 15 * 1000
    player:setAether(spellIdent, aethers)
		player:sendStatus()
    player:calcStat()
	end,
}

last_stand_5 = {
  cast = function(player)
    local durations = 30 * 1000
    local spellIdent = "last_stand_5"
    local spellName = "last stand"

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
    player:setDuration(spellIdent, durations)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAnimation(74)
    player:sendAnimation(72)
    player:calcStat()
  end,
      
  recast = function(player)
    local lifeStealPct = 0.50
		player.bonusLifeSteal  = player.bonusLifeSteal + lifeStealPct
		player:sendStatus()
	end,

	uncast = function(player)
    local spellIdent = "last_stand_5"
    local aethers = 10 * 1000
    player:setAether(spellIdent, aethers)
		player:sendStatus()
    player:calcStat()
	end,
}