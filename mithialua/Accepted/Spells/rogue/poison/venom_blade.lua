
local aethers = 40000

venom_blade_1 = {
  cast = function(player)
    local durations = 5 * 1000
    local spellIdent = "venom_blade_1"
    local desc = "Damage increase 40"

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
		player.bonusDamage  = player.bonusDamage + 40
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

venom_blade_2 = {
  cast = function(player)
    local durations = 10 * 1000
    local spellIdent = "venom_blade_2"
    local desc = "Damage increase 60"

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
		player.bonusDamage  = player.bonusDamage + 60
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

venom_blade_3 = {
  cast = function(player)
    local durations = 15 * 1000
    local spellIdent = "venom_blade_3"
    local desc = "Damage increase 90"

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
		player.bonusDamage  = player.bonusDamage + 90
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

venom_blade_4 = {
  cast = function(player)
    local durations = 20 * 1000
    local spellIdent = "venom_blade_4"
    local desc = "Damage increase 130"

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
		player.bonusDamage  = player.bonusDamage + 130
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

venom_blade_5 = {
  cast = function(player)
    local durations = 30 * 1000
    local spellIdent = "venom_blade_5"
    local desc = "Damage increase 200"

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
		player.bonusDamage  = player.bonusDamage + 200
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}
