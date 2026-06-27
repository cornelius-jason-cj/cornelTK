defiance_1 = {
  cast = function(player)
    local spellName = "Defiance"
    local spellIdent = "defiance_1"
    local desc = "Defiance strengthens your armor while wounded."
    local durations = 5 * 1000
    
    local halfVita = player.health <= (player.maxHealth * 0.5)
    local manaCost = 60

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    if halfVita then
      player:sendAnimation(474)
    else
      player:sendMinitext("This spell only work when your vita below 50%")
      return
    end

    player.magic = player.magic - manaCost
    player:sendMinitext('armor' .. player.armor)
    player:sendMinitext('bonus' .. player.bonusArmor)
    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:calcStat()
  end,

  while_cast = function(player)
    local halfVita = player.health <= (player.maxHealth * 0.5)
    if halfVita then
      player:sendAnimation(474)
    end
  end,

  recast = function(player)
		player.bonusArmor = player.bonusArmor - 5
		player:sendStatus()
	end,

	uncast = function(player)
    local aethers = 5 * 1000
    local spellIdent = "defiance_1"
    player:setAether(spellIdent, aethers)
		player:sendStatus()
    player:calcStat()
	end,
}

defiance_2 = {
  cast = function(player)
    local spellName = "Defiance"
    local spellIdent = "defiance_2"
    local desc = "Defiance strengthens your armor while wounded."
    local durations = 8 * 1000
    
    local halfVita = player.health <= (player.maxHealth * 0.5)
    local manaCost = 80

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    if halfVita then
      player:sendAnimation(474)
    else
      player:sendMinitext("This spell only work when your vita below 50%")
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
		player.bonusArmor = player.bonusArmor - 10
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

defiance_3 = {
  cast = function(player)
    local spellName = "Defiance"
    local spellIdent = "defiance_3"
    local desc = "Defiance strengthens your armor while wounded."
    local durations = 12 * 1000
    
    local halfVita = player.health > (player.maxHealth * 0.5)
    local manaCost = 120

    if not player:canCast(1, 1, 0) then
      return
    end

    if (halfVita ~= true) then
      player:sendMinitext("This spell only work when your vita beow 50%")
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
		player.bonusArmor = player.bonusArmor - 15
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

defiance_4 = {
  cast = function(player)
    local spellName = "Defiance"
    local spellIdent = "defiance_4"
    local desc = "Defiance strengthens your armor while wounded."
    local durations = 18 * 1000
    
    local halfVita = player.health > (player.maxHealth * 0.5)
    local manaCost = 160

    if not player:canCast(1, 1, 0) then
      return
    end

    if (halfVita ~= true) then
      player:sendMinitext("This spell only work when your vita beow 50%")
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
		player.bonusArmor = player.bonusArmor - 25
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

defiance_5 = {
  cast = function(player)
    local spellName = "Defiance"
    local spellIdent = "defiance_5"
    local desc = "Defiance strengthens your armor while wounded."
    local durations = 25 * 1000
    
    local halfVita = player.health > (player.maxHealth * 0.5)
    local manaCost = 160

    if not player:canCast(1, 1, 0) then
      return
    end

    if (halfVita ~= true) then
      player:sendMinitext("This spell only work when your vita beow 50%")
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
		player.bonusArmor = player.bonusArmor - 35
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

