
local aethers = 4000
local durations = 6000

explosive_trap_1 = {
  cast = function(player)
    local spellName = "Explosive Trap"
    local spellIdent = "explosive_trap_1"
    
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
    local spellIdent = "explosive_trap_1"
    local owner = Player(npc.owner)
    local damage = math.floor(200 + owner.might * 2)
    local splashDamage = math.floor(damage * 0.6)

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end

    block:playSound(sound)
    block:sendAnimation(anim)

    block.attacker = owner.ID

    global_attack.cast(
      owner,
      block,
      damage,
      0,
      spellFX
    )

    local spellFX = 1001
    local x = {-1,  1,  0,  0, 0}
    local y = { 0,  0,  1, -1, 0}
    
    for i = 1, #x do
			local targets = block:getObjectsInCell(
				block.m,
				block.x + x[i],
				block.y + y[i],
				BL_MOB
			)
			if #targets > 0 then
        global_attack.cast(
          owner,
          targets[1],
          splashDamage,
          0,
          spellFX
        )
			end

      -- targets = block:getObjectsInCell(
      --   block.m,
      --   block.x + x[i],
      --   block.y + y[i],
      --   BL_PC
      -- )
      -- if #targets > 0 then
				-- local worked = global_zap.cast(block, target[i], damage, 0, spellFX)
				-- if worked == 2 then
				-- 	target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
				-- end
      -- end
		end


    removeTrap(npc)

  end,

  endAction = function(npc)
    removeTrap(npc)
  end,
}

explosive_trap_2 = {
  cast = function(player)
    local spellName = "Explosive Trap"
    local spellIdent = "explosive_trap_2"
    
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
    local spellIdent = "explosive_trap_2"
    local owner = Player(npc.owner)
    local damage = math.floor(300 + owner.might * 3)
    local splashDamage = math.floor(damage * 0.6)

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end

    block:playSound(sound)
    block:sendAnimation(anim)

    block.attacker = owner.ID

    global_attack.cast(
      owner,
      block,
      damage,
      0,
      spellFX
    )

    local spellFX = 1001
    local x = {-1,  1,  0,  0, 0}
    local y = { 0,  0,  1, -1, 0}
    
    for i = 1, #x do
			local targets = block:getObjectsInCell(
				block.m,
				block.x + x[i],
				block.y + y[i],
				BL_MOB
			)
			if #targets > 0 then
        global_attack.cast(
          owner,
          targets[i],
          splashDamage,
          0,
          spellFX
        )
			end

      -- targets = block:getObjectsInCell(
      --   block.m,
      --   block.x + x[i],
      --   block.y + y[i],
      --   BL_PC
      -- )
      -- if #targets > 0 then
				-- local worked = global_zap.cast(block, target[i], damage, 0, spellFX)
				-- if worked == 2 then
				-- 	target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
				-- end
      -- end
		end


    removeTrap(npc)

  end,

  endAction = function(npc)
    removeTrap(npc)
  end,
}

explosive_trap_3 = {
  cast = function(player)
    local spellName = "Explosive Trap"
    local spellIdent = "explosive_trap_3"
    
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
    local spellIdent = "explosive_trap_3"
    local owner = Player(npc.owner)
    local damage = math.floor(500 + owner.might * 4)
    local splashDamage = math.floor(damage * 0.6)

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end

    block:playSound(sound)
    block:sendAnimation(anim)

    block.attacker = owner.ID

    global_attack.cast(
      owner,
      block,
      damage,
      0,
      spellFX
    )

    local spellFX = 1001
    local x = {-1,  1,  0,  0, 0}
    local y = { 0,  0,  1, -1, 0}
    
    for i = 1, #x do
			local targets = block:getObjectsInCell(
				block.m,
				block.x + x[i],
				block.y + y[i],
				BL_MOB
			)
			if #targets > 0 then
        global_attack.cast(
          owner,
          targets[1],
          splashDamage,
          0,
          spellFX
        )
			end

      -- targets = block:getObjectsInCell(
      --   block.m,
      --   block.x + x[i],
      --   block.y + y[i],
      --   BL_PC
      -- )
      -- if #targets > 0 then
				-- local worked = global_zap.cast(block, target[i], damage, 0, spellFX)
				-- if worked == 2 then
				-- 	target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
				-- end
      -- end
		end


    removeTrap(npc)

  end,

  endAction = function(npc)
    removeTrap(npc)
  end,
}

explosive_trap_4 = {
  cast = function(player)
    local spellName = "Explosive Trap"
    local spellIdent = "explosive_trap_4"
    
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
    local spellIdent = "explosive_trap_4"
    local owner = Player(npc.owner)
    local damage = math.floor(800 + owner.might * 5)
    local splashDamage = math.floor(damage * 0.6)

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end

    block:playSound(sound)
    block:sendAnimation(anim)

    block.attacker = owner.ID

    global_attack.cast(
      owner,
      block,
      damage,
      0,
      spellFX
    )

    local spellFX = 1001
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}
    for i = 1, #x do
			local targets = block:getObjectsInCell(
				block.m,
				block.x + x[i],
				block.y + y[i],
				BL_MOB
			)
			if #targets > 0 then
        global_attack.cast(
          owner,
          targets[1],
          splashDamage,
          0,
          spellFX
        )
			end

      -- targets = block:getObjectsInCell(
      --   block.m,
      --   block.x + x[i],
      --   block.y + y[i],
      --   BL_PC
      -- )
      -- if #targets > 0 then
				-- local worked = global_zap.cast(block, target[i], damage, 0, spellFX)
				-- if worked == 2 then
				-- 	target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
				-- end
      -- end
		end


    removeTrap(npc)

  end,

  endAction = function(npc)
    removeTrap(npc)
  end,
}

explosive_trap_5 = {
  cast = function(player)
    local spellName = "Explosive Trap"
    local spellIdent = "explosive_trap_5"
    
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
    local spellIdent = "explosive_trap_5"
    local owner = Player(npc.owner)
    local damage = math.floor(1200 + owner.might * 6)
    local splashDamage = math.floor(damage * 0.6)

    local anim = 2
    local sound = 19

    if not canTriggerTrap(block, npc) then return end

    block:playSound(sound)
    block:sendAnimation(anim)

    block.attacker = owner.ID

    global_attack.cast(
      owner,
      block,
      damage,
      0,
      spellFX
    )

    local spellFX = 1001
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}
    
    for i = 1, #x do
			local targets = block:getObjectsInCell(
				block.m,
				block.x + x[i],
				block.y + y[i],
				BL_MOB
			)
			if #targets > 0 then
        global_attack.cast(
          owner,
          targets[1],
          splashDamage,
          0,
          spellFX
        )
			end

      -- targets = block:getObjectsInCell(
      --   block.m,
      --   block.x + x[i],
      --   block.y + y[i],
      --   BL_PC
      -- )
      -- if #targets > 0 then
				-- local worked = global_zap.cast(block, target[i], damage, 0, spellFX)
				-- if worked == 2 then
				-- 	target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
				-- end
      -- end
		end


    removeTrap(npc)

  end,

  endAction = function(npc)
    removeTrap(npc)
  end,
}