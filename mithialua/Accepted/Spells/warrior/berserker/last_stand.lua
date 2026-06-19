local aethers = 30000

last_stand_1 = {
  cast = function(player)
    local durations = 10 * 1000
    local spellIdent = "last_stand_1"
    local spellName = "last stand"

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
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAnimation(2)
  end,

  recast = function(player)
		player.bonusLifeSteal  = player.bonusLifeSteal + 0.5
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

last_stand_2 = {
  cast = function(player)
    local durations = 12 * 1000
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
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAnimation(2)
  end,
  
  recast = function(player)
		player.bonusLifeSteal  = player.bonusLifeSteal + 0.8
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

last_stand_3 = {
  cast = function(player)
    local durations = 14 * 1000
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
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAnimation(2)
  end,
    
  recast = function(player)
		player.bonusLifeSteal  = player.bonusLifeSteal + 0.12
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

last_stand_4 = {
  cast = function(player)
    local durations = 16 * 1000
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
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAnimation(2)
  end,
    
  recast = function(player)
		player.bonusLifeSteal  = player.bonusLifeSteal + 0.16
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

last_stand_5 = {
  cast = function(player)
    local durations = 20 * 1000
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
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAnimation(2)
  end,
      
  recast = function(player)
		player.bonusLifeSteal  = player.bonusLifeSteal + 0.2
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}