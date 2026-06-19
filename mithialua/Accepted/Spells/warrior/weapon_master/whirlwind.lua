local aethers = 8000
local durations = 6000

whirlwind_1 = {
  cast = function(player)
    local spellName = "Whirlwind"
    local spellIdent = "whirlwind_1"
      
    local formula = 150 + player.might * 1.5
    local damage = math.floor(formula)

    local vitaCost = 100
    local manaCost = 50

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

    local spellFX = 1001
    local x = {-1,  1,  0,  0}
    local y = { 0,  0,  1, -1}

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost
    
    for i = 1, #x do
			local targets = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #targets > 0 then
         if( targets[1].state == 1 or targets[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
				  global_zap.cast(player, targets[1], damage, 0, spellFX)
        end
			end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )
      if #targets > 0 then
        if( targets[1].state == 1 or targets[1].blType == BL_PC) then
        player:sendMinitext("You can not cast on player")
        else
          global_zap.cast(player, targets[1], damage, 0, spellFX)
        end
      end
		end

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,
}

whirlwind_2 = {
  cast = function(player)
    local spellName = "Whirlwind"
    local spellIdent = "whirlwind_2"
      
    local formula = 250 + player.might * 2
    local damage = math.floor(formula)

    local vitaCost = 150
    local manaCost = 75

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

    local spellFX = 1001
    local x = {-1,  1,  0,  0}
    local y = { 0,  0,  1, -1}

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost
    
    for i = 1, #x do
			local targets = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #targets > 0 then
         if( targets[1].state == 1 or targets[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
				  global_zap.cast(player, targets[1], damage, 0, spellFX)
        end
			end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )
      if #targets > 0 then
        if( targets[1].state == 1 or targets[1].blType == BL_PC) then
        player:sendMinitext("You can not cast on player")
        else
          global_zap.cast(player, targets[1], damage, 0, spellFX)
        end
      end
		end

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,
}

whirlwind_3 = {
  cast = function(player)
    local spellName = "Whirlwind"
    local spellIdent = "whirlwind_3"
      
    local formula = 400 + player.might * 2.5
    local damage = math.floor(formula)

    local vitaCost = 200
    local manaCost = 100

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

    local spellFX = 1001
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost
    
    for i = 1, #x do
			local targets = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #targets > 0 then
         if( targets[1].state == 1 or targets[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
				  global_zap.cast(player, targets[1], damage, 0, spellFX)
        end
			end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )
      if #targets > 0 then
        if( targets[1].state == 1 or targets[1].blType == BL_PC) then
        player:sendMinitext("You can not cast on player")
        else
          global_zap.cast(player, targets[1], damage, 0, spellFX)
        end
      end
		end

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,
}

whirlwind_4 = {
  cast = function(player)
    local spellName = "Whirlwind"
    local spellIdent = "whirlwind_4"
      
    local formula = 650 + player.might * 3
    local damage = math.floor(formula)

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

    local spellFX = 1001
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost
    
    for i = 1, #x do
			local targets = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #targets > 0 then
         if( targets[1].state == 1 or targets[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
				  global_zap.cast(player, targets[1], damage, 0, spellFX)
        end
			end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )
      if #targets > 0 then
        if( targets[1].state == 1 or targets[1].blType == BL_PC) then
        player:sendMinitext("You can not cast on player")
        else
          global_zap.cast(player, targets[1], damage, 0, spellFX)
        end
      end
		end

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,
}

whirlwind_5 = {
  cast = function(player)
    local spellName = "Whirlwind"
    local spellIdent = "whirlwind_5"
      
    local formula = 1000 + player.might * 4
    local damage = math.floor(formula)

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

    local spellFX = 1001
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}

    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost
    
    for i = 1, #x do
			local targets = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #targets > 0 then
         if( targets[1].state == 1 or targets[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
				  global_zap.cast(player, targets[1], damage, 0, spellFX)
        end
			end

      targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )
      if #targets > 0 then
        if( targets[1].state == 1 or targets[1].blType == BL_PC) then
        player:sendMinitext("You can not cast on player")
        else
          global_zap.cast(player, targets[1], damage, 0, spellFX)
        end
      end
		end

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,
}