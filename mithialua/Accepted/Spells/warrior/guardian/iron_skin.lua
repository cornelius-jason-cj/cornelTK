local aethers = 60000

iron_skin_1 = {
  cast = function(player)
    local spellName = "Iron Skin"
    local spellIdent = "iron_skin_1"
    local desc = "Your armor increase."
    local durations = 5 * 1000

    local manaCost = 60

    if (not player:canCast(1, 1, 0)) then
			return
		end

		if (player.state == 1) then
			return
		end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, duration)
    player:sendAnimation(2)
    player:calcStat()
  end,

	recast = function(player)
		player.bonusArmor = player.bonusArmor - 5
		player:sendStatus()
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

iron_skin_2 = {
  cast = function(player)
    local spellName = "Iron Skin"
    local spellIdent = "iron_skin_2"
    local desc = "Your armor increase."
    local durations = 10 * 1000

    local manaCost = 80

    if (not player:canCast(1, 1, 0)) then
			return
		end

		if (player.state == 1) then
			return
		end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, duration)
    player:sendAnimation(2)
    player:calcStat()
  end,

	recast = function(player)
		player.bonusArmor = player.bonusArmor - 10
		player:sendStatus()
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

iron_skin_3 = {
  cast = function(player)
    local spellName = "Iron Skin"
    local spellIdent = "iron_skin_3"
    local desc = "Your armor increase."
    local durations = 15 * 1000

    local manaCost = 120

    if (not player:canCast(1, 1, 0)) then
			return
		end

		if (player.state == 1) then
			return
		end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.magic = player.magic - manaCost
    
    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, duration)
    player:sendAnimation(2)
    player:calcStat()
  end,

	recast = function(player)
		player.bonusArmor = player.bonusArmor - 15
		player:sendStatus()
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

iron_skin_4 = {
  cast = function(player)
    local spellName = "Iron Skin"
    local spellIdent = "iron_skin_4"
    local desc = "Your armor increase."
    local durations = 20 * 1000

    local manaCost = 160

    if (not player:canCast(1, 1, 0)) then
			return
		end

		if (player.state == 1) then
			return
		end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, duration)
    player:sendAnimation(2)
    player:calcStat()
  end,

	recast = function(player)
		player.bonusArmor = player.bonusArmor - 25
		player:sendStatus()
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

iron_skin_5 = {
  cast = function(player)
    local spellName = "Iron Skin"
    local spellIdent = "iron_skin_5"
    local desc = "Your armor increase."
    local durations = 30 * 1000

    local manaCost = 220

    if (not player:canCast(1, 1, 0)) then
			return
		end

		if (player.state == 1) then
			return
		end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, duration)
    player:sendAnimation(2)
    player:calcStat()
  end,

	recast = function(player)
		player.bonusArmor = player.bonusArmor - 50
		player:sendStatus()
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}