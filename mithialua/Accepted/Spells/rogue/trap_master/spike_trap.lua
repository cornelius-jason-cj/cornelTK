
local aethers = 4000
local durations = 6000

spike_trap_1 = {
  cast = function(player)
    local spellName = "Spike Trap"
    local spellIdent = "spike_trap_1"
    
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
    local spellIdent = "spike_trap_1"
    local owner = Player(npc.owner)
    local damage = math.floor(200 + owner.grace * 2)
    local paraDurations = 2000

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end
    
    if block.blType == BL_PC then
      block:sendMinitext("You feel your eyelids getting heavy..")
    end

    block:playSound(sound)
    block:sendAnimation(anim)

    block.attacker = owner.ID
    block:removeHealthExtend(damage,1,1,1,1,0)

    block:setDuration(spellIdent, paraDurations)
    
    block.paralyzed = true
    removeTrap(npc)

  end,

  on_takedamage_while_cast = function(block)
    local spellIdent = "spike_trap_1"
    block:setDuration(spellIdent,0)
  end,

  endAction = function(npc)
    removeTrap(npc)
  end,

  while_cast = function(block)
    local anim = 2
    block:sendAnimation(anim)
    block.paralyzed = true
    if block.blType == BL_PC then
      block:sendMinitext("Your eyelids are heavy...")
    end
  end,

  recast = function(block)
    block.paralyzed = true
  end,

  uncast = function(block)
    block.paralyzed = false
    if block.blType == BL_PC then
      block:sendMinitext("You awaken from your slumber.")
    end
  end,
}

spike_trap_2 = {
  cast = function(player)
    local spellName = "Spike Trap"
    local spellIdent = "spike_trap_2"
    
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
    local spellIdent = "spike_trap_2"
    local owner = Player(npc.owner)
    local damage = math.floor(300 + owner.grace * 3)
    local paraDurations = 2000

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end
    
    if block.blType == BL_PC then
      block:sendMinitext("You feel your eyelids getting heavy..")
    end

    block:playSound(sound)
    block:sendAnimation(anim)

    block.attacker = owner.ID
    block:removeHealthExtend(damage,1,1,1,1,0)

    block:setDuration(spellIdent, paraDurations)
    
    block.paralyzed = true
    removeTrap(npc)

  end,

  on_takedamage_while_cast = function(block)
    local spellIdent = "spike_trap_2"
    block:setDuration(spellIdent,0)
  end,

  endAction = function(npc)
    removeTrap(npc)
  end,

  while_cast = function(block)
    local anim = 2
    block:sendAnimation(anim)
    block.paralyzed = true
    if block.blType == BL_PC then
      block:sendMinitext("Your eyelids are heavy...")
    end
  end,

  recast = function(block)
    block.paralyzed = true
  end,

  uncast = function(block)
    block.paralyzed = false
    if block.blType == BL_PC then
      block:sendMinitext("You awaken from your slumber.")
    end
  end,
}

spike_trap_3 = {
  cast = function(player)
    local spellName = "Spike Trap"
    local spellIdent = "spike_trap_3"
    
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
    local spellIdent = "spike_trap_3"
    local owner = Player(npc.owner)
    local damage = math.floor(500 + owner.grace * 4)
    local paraDurations = 2000

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end
    
    if block.blType == BL_PC then
      block:sendMinitext("You feel your eyelids getting heavy..")
    end

    block:playSound(sound)
    block:sendAnimation(anim)

    block.attacker = owner.ID
    block:removeHealthExtend(damage,1,1,1,1,0)

    block:setDuration(spellIdent, paraDurations)
    
    block.paralyzed = true
    removeTrap(npc)

  end,

  on_takedamage_while_cast = function(block)
    local spellIdent = "spike_trap_3"
    block:setDuration(spellIdent,0)
  end,

  endAction = function(npc)
    removeTrap(npc)
  end,

  while_cast = function(block)
    local anim = 2
    block:sendAnimation(anim)
    block.paralyzed = true
    if block.blType == BL_PC then
      block:sendMinitext("Your eyelids are heavy...")
    end
  end,

  recast = function(block)
    block.paralyzed = true
  end,

  uncast = function(block)
    block.paralyzed = false
    if block.blType == BL_PC then
      block:sendMinitext("You awaken from your slumber.")
    end
  end,
}

spike_trap_4 = {
  cast = function(player)
    local spellName = "Spike Trap"
    local spellIdent = "spike_trap_4"
    
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
    local spellIdent = "spike_trap_4"
    local owner = Player(npc.owner)
    local damage = math.floor(800 + owner.grace * 5)
    local paraDurations = 2000

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end
    
    if block.blType == BL_PC then
      block:sendMinitext("You feel your eyelids getting heavy..")
    end

    block:playSound(sound)
    block:sendAnimation(anim)

    block.attacker = owner.ID
    block:removeHealthExtend(damage,1,1,1,1,0)

    block:setDuration(spellIdent, paraDurations)
    
    block.paralyzed = true
    removeTrap(npc)

  end,

  on_takedamage_while_cast = function(block)
    local spellIdent = "spike_trap_4"
    block:setDuration(spellIdent,0)
  end,

  endAction = function(npc)
    removeTrap(npc)
  end,

  while_cast = function(block)
    local anim = 2
    block:sendAnimation(anim)
    block.paralyzed = true
    if block.blType == BL_PC then
      block:sendMinitext("Your eyelids are heavy...")
    end
  end,

  recast = function(block)
    block.paralyzed = true
  end,

  uncast = function(block)
    block.paralyzed = false
    if block.blType == BL_PC then
      block:sendMinitext("You awaken from your slumber.")
    end
  end,
}

spike_trap_5 = {
  cast = function(player)
    local spellName = "Spike Trap"
    local spellIdent = "spike_trap_5"
    
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
    local spellIdent = "spike_trap_5"
    local owner = Player(npc.owner)
    local damage = math.floor(1200 + owner.grace * 6)
    local paraDurations = 4000

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end
    
    if block.blType == BL_PC then
      block:sendMinitext("You feel your eyelids getting heavy..")
    end

    block:playSound(sound)
    block:sendAnimation(anim)

    block.attacker = owner.ID
    block:removeHealthExtend(damage,1,1,1,1,0)

    block:setDuration(spellIdent, paraDurations)
    
    block.paralyzed = true
    removeTrap(npc)

  end,

  on_takedamage_while_cast = function(block)
    local spellIdent = "spike_trap_5"
    block:setDuration(spellIdent,0)
  end,

  endAction = function(npc)
    removeTrap(npc)
  end,

  while_cast = function(block)
    local anim = 2
    block:sendAnimation(anim)
    block.paralyzed = true
    if block.blType == BL_PC then
      block:sendMinitext("Your eyelids are heavy...")
    end
  end,

  recast = function(block)
    block.paralyzed = true
  end,

  uncast = function(block)
    block.paralyzed = false
    if block.blType == BL_PC then
      block:sendMinitext("You awaken from your slumber.")
    end
  end,
}