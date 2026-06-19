local aethers = 60000

counter_stance_1 = {
  cast = function(player)
    local spellName = "Counter Stance"
    local spellIdent = "counter_stance_1"
    local desc = "You cast " .. spellName .. "."
    local durations = 5 * 1000

    local vitaCost = 80
    local manaCost = 40

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)
  end,
  
  recast = function(player)
    local reflect = 50 + player.might * 0.1
		player.bonusReflect = reflect
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

counter_stance_2 = {
  cast = function(player)
    local spellName = "Counter Stance"
    local spellIdent = "counter_stance_2"
    local desc = "You cast " .. spellName .. "."
    local durations = 10 * 1000

    local vitaCost = 120
    local manaCost = 60

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)

  end,
    
  recast = function(player)
    local reflect = 150 + player.might * 0.3
		player.bonusReflect = reflect
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

counter_stance_3 = {
  cast = function(player)
    local spellName = "Counter Stance"
    local spellIdent = "counter_stance_3"
    local desc = "You cast " .. spellName .. "."
    local durations = 15 * 1000

    local vitaCost = 180
    local manaCost = 90

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)

  end,
      
  recast = function(player)
    local reflect = 350 + player.might * 0.6
		player.bonusReflect = reflect
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

counter_stance_4 = {
  cast = function(player)
    local spellName = "Counter Stance"
    local spellIdent = "counter_stance_4"
    local desc = "You cast " .. spellName .. "."
    local durations = 20 * 1000
    
    local vitaCost = 240
    local manaCost = 120

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)

  end,

  recast = function(player)
    local reflect = 650 + player.might * 1
		player.bonusReflect = reflect
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}

counter_stance_5 = {
  cast = function(player)
    local spellName = "Counter Stance"
    local spellIdent = "counter_stance_5"
    local desc = "You cast " .. spellName .. "."
    local durations = 30 * 1000
  
    local vitaCost = 360
    local manaCost = 180

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.health - vitaCost < 100 ) then
      player:sendMinitext("You do not have enough vita.")
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    player:playSound(5)
    player:sendMinitext(desc)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendAnimation(2)

  end,
    recast = function(player)
    local reflect = 1050 + player.might * 1.5
		player.bonusReflect = reflect
	end,

	uncast = function(player)
		player:sendStatus()
    player:calcStat()
	end,
}