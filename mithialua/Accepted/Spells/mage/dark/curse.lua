local aethers = 2000
local durations = 10000

curse_1 = {
  cast = function(player, target)
    local spellName = "Curse"
    local spellIdent = "curse_1"

    local manaCost = 40

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

  	if (target.blType == BL_MOB) then
			target.armor = target.armor + 5
			target.cursed = 1
		  target:setDuration("curse_1", durations)
      target:sendAnimation(1, 0)
		end
    
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 5
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 5
		target.cursed = 0
		target:sendStatus()
	end,
}

curse_2 = {
  cast = function(player, target)
    local spellName = "Curse"
    local spellIdent = "curse_2"

    local manaCost = 65

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

  	if (target.blType == BL_MOB) then
			target.armor = target.armor + 10
			target.cursed = 1
		  target:setDuration("curse_1", durations)
      target:sendAnimation(1, 0)
		end
    
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 10
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 10
		target.cursed = 0
		target:sendStatus()
	end,
}

curse_3 = {
  cast = function(player, target)
    local spellName = "Curse"
    local spellIdent = "curse_3"

    local manaCost = 100

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

  	if (target.blType == BL_MOB) then
			target.armor = target.armor + 15
			target.cursed = 1
		  target:setDuration("curse_1", durations)
      target:sendAnimation(1, 0)
		end
    
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 15
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 15
		target.cursed = 0
		target:sendStatus()
	end,
}

curse_4 = {
  cast = function(player, target)
    local spellName = "Curse"
    local spellIdent = "curse_4"

    local manaCost = 145

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

  	if (target.blType == BL_MOB) then
			target.armor = target.armor + 20
			target.cursed = 1
		  target:setDuration("curse_1", durations)
      target:sendAnimation(1, 0)
		end
    
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 20
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 20
		target.cursed = 0
		target:sendStatus()
	end,
}

curse_5 = {
  cast = function(player, target)
    local spellName = "Curse"
    local spellIdent = "curse_5"

    local manaCost = 200

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

  	if (target.blType == BL_MOB) then
			target.armor = target.armor + 30
			target.cursed = 1
		  target:setDuration("curse_1", durations)
      target:sendAnimation(1, 0)
		end
    
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 30
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 30
		target.cursed = 0
		target:sendStatus()
	end,
}
