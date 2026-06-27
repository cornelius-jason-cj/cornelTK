
local aethers = 4000
local durations = 6000

poison_trap_1 = {
  cast = function(player)
    local spellName = "Poison Trap"
    local spellIdent = "poison_trap_1"
    
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

    local m, x, y = player.m, player.x, player.y

    local sound = 1
    local anim = 1
      
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendAction(6, 40)
    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName)
    player:selfAnimationXY(player.ID, 599, x, y)
    setTrap(player, spellIdent, durations)
  end,

  click = function(block, npc)
    local spellIdent = "poison_trap_1"
    local owner = Player(npc.owner)
    local poisonDurations = 5000

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end
    
    if block.blType == BL_PC then
      block:sendMinitext("You feel your eyelids getting heavy..")
    end

    block:playSound(sound)
    block:sendAnimation(anim)

    block:setDuration(spellIdent, paraDurations)
    block.cursed = 1

    removeTrap(npc)
  end,

  endAction = function(npc)
    removeTrap(npc)
  end,

  while_cast = function(block, player)
    local multiplier = 1
		local damage = player.will * multiplier
    block:sendAnimation(1, 5)
		if block.health > damage then
			block:sendHealth(damage, 0)
		end
  end,

  recast = function(block)
    block.armor = block.armor + 5
		block.cursed = 1
		block:sendStatus()
  end,

  uncast = function(block)
    block.armor = block.armor - 5
		block.cursed = 0
		block:sendStatus()
  end,
}

poison_trap_2 = {
  cast = function(player)
    local spellName = "Poison Trap"
    local spellIdent = "poison_trap_2"
    
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

    local m, x, y = player.m, player.x, player.y

    local sound = 1
    local anim = 1
      
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendAction(6, 40)
    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName)
    player:selfAnimationXY(player.ID, 599, x, y)
    setTrap(player, spellIdent, durations)
  end,

  click = function(block, npc)
    local spellIdent = "poison_trap_2"
    local owner = Player(npc.owner)
    local poisonDurations = 5000

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end
    
    if block.blType == BL_PC then
      block:sendMinitext("You feel your eyelids getting heavy..")
    end

    block:playSound(sound)
    block:sendAnimation(anim)

    block:setDuration(spellIdent, paraDurations)
    block.cursed = 1

    removeTrap(npc)
  end,

  endAction = function(npc)
    removeTrap(npc)
  end,

  while_cast = function(block, player)
    local multiplier = 2
		local damage = player.will * multiplier
    block:sendAnimation(1, 5)
		if block.health > damage then
			block:sendHealth(damage, 0)
		end
  end,

  recast = function(block)
    block.armor = block.armor + 10
		block.cursed = 1
		block:sendStatus()
  end,

  uncast = function(block)
    block.armor = block.armor - 10
		block.cursed = 0
		block:sendStatus()
  end,
}

poison_trap_3 = {
  cast = function(player)
    local spellName = "Poison Trap"
    local spellIdent = "poison_trap_3"
    
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

    local m, x, y = player.m, player.x, player.y

    local sound = 1
    local anim = 1
      
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendAction(6, 40)
    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName)
    player:selfAnimationXY(player.ID, 599, x, y)
    setTrap(player, spellIdent, durations)
  end,

  click = function(block, npc)
    local spellIdent = "poison_trap_3"
    local owner = Player(npc.owner)
    local poisonDurations = 5000

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end
    
    if block.blType == BL_PC then
      block:sendMinitext("You feel your eyelids getting heavy..")
    end

    block:playSound(sound)
    block:sendAnimation(anim)

    block:setDuration(spellIdent, paraDurations)
    block.cursed = 1

    removeTrap(npc)
  end,

  endAction = function(npc)
    removeTrap(npc)
  end,

  while_cast = function(block, player)
    local multiplier = 3
		local damage = player.will * multiplier
    block:sendAnimation(1, 5)
		if block.health > damage then
			block:sendHealth(damage, 0)
		end
  end,

  recast = function(block)
    block.armor = block.armor + 15
		block.cursed = 1
		block:sendStatus()
  end,

  uncast = function(block)
    block.armor = block.armor - 15
		block.cursed = 0
		block:sendStatus()
  end,
}

poison_trap_4 = {
  cast = function(player)
    local spellName = "Poison Trap"
    local spellIdent = "poison_trap_4"
    
    local vitaCost = 260
    local manaCost = 130

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

    local m, x, y = player.m, player.x, player.y

    local sound = 1
    local anim = 1
      
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendAction(6, 40)
    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName)
    player:selfAnimationXY(player.ID, 599, x, y)
    setTrap(player, spellIdent, durations)
  end,

  click = function(block, npc)
    local spellIdent = "poison_trap_4"
    local owner = Player(npc.owner)
    local poisonDurations = 5000

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end
    
    if block.blType == BL_PC then
      block:sendMinitext("You feel your eyelids getting heavy..")
    end

    block:playSound(sound)
    block:sendAnimation(anim)

    block:setDuration(spellIdent, paraDurations)
    block.cursed = 1

    removeTrap(npc)
  end,

  endAction = function(npc)
    removeTrap(npc)
  end,

  while_cast = function(block, player)
    local multiplier = 3
		local damage = player.will * multiplier
    block:sendAnimation(1, 5)
		if block.health > damage then
			block:sendHealth(damage, 0)
		end
  end,

  recast = function(block)
    block.armor = block.armor + 20
		block.cursed = 1
		block:sendStatus()
  end,

  uncast = function(block)
    block.armor = block.armor - 20
		block.cursed = 0
		block:sendStatus()
  end,
}

poison_trap_5 = {
  cast = function(player)
    local spellName = "Poison Trap"
    local spellIdent = "poison_trap_5"
    
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

    local m, x, y = player.m, player.x, player.y

    local sound = 1
    local anim = 1
      
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendAction(6, 40)
    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName)
    player:selfAnimationXY(player.ID, 599, x, y)
    setTrap(player, spellIdent, durations)
  end,

  click = function(block, npc)
    local spellIdent = "poison_trap_5"
    local owner = Player(npc.owner)
    local poisonDurations = 5000

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end
    
    if block.blType == BL_PC then
      block:sendMinitext("You feel your eyelids getting heavy..")
    end

    block:playSound(sound)
    block:sendAnimation(anim)

    block:setDuration(spellIdent, paraDurations)
    block.cursed = 1

    removeTrap(npc)
  end,

  endAction = function(npc)
    removeTrap(npc)
  end,

  while_cast = function(block, player)
    local multiplier = 3
		local damage = player.will * multiplier
    block:sendAnimation(1, 5)
		if block.health > damage then
			block:sendHealth(damage, 0)
		end
  end,

  recast = function(block)
    block.armor = block.armor + 30
		block.cursed = 1
		block:sendStatus()
  end,

  uncast = function(block)
    block.armor = block.armor - 30
		block.cursed = 0
		block:sendStatus()
  end,
}