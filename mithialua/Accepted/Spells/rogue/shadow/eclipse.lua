local aethers = 14000

eclipse_1 = {
  cast = function(player)
    local spellName = "Eclipse"
    local spellIdent = "eclipse_1"
      
    local formula = 200 + player.grace * 2
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

eclipse_2 = {
  cast = function(player)
    local spellName = "Eclipse"
    local spellIdent = "eclipse_2"
      
    local formula = 300 + player.grace * 3
    local damage = math.floor(formula)

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

eclipse_3 = {
  cast = function(player)
    local spellName = "Eclipse"
    local spellIdent = "eclipse_3"
      
    local formula = 500 + player.grace * 4
    local damage = math.floor(formula)

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

eclipse_4 = {
  cast = function(player)
    local spellName = "Eclipse"
    local spellIdent = "eclipse_4"
      
    local formula = 800 + player.grace * 5
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

eclipse_5 = {
  cast = function(player)
    local spellName = "Eclipse"
    local spellIdent = "eclipse_5"
      
    local formula = 1200 + player.grace * 6
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