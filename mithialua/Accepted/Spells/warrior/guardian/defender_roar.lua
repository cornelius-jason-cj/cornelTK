local aethers = 12000
local durations = 6000

defender_roar_1 = {
  cast = function(player)
    local spellName = "Defender Roar"
    local spellIdent = "defender_roar_1"
      
    local formula = 50 + player.might * 0.5
    local damage = math.floor(formula)

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
          targets[1]:setDuration(spellIdent, durations)
          targets[1]:sendAnimation(39, 0)
          targets[1].cursed = 1
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
          targets[1]:setDuration(spellIdent, durations)
          targets[1]:sendAnimation(39, 0)
          targets[1].paralyzed = 1
        end
      end
		end

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 2
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 2
		target.cursed = 0
		target:sendStatus()
	end,
}

defender_roar_2 = {
  cast = function(player)
    local spellName = "Defender Roar"
    local spellIdent = "defender_roar_2"
      
    local formula = 100 + player.might * 1
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
          targets[1]:setDuration(spellIdent, durations)
          targets[1]:sendAnimation(39, 0)
          targets[1].cursed = 1
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
          targets[1]:setDuration(spellIdent, durations)
          targets[1]:sendAnimation(39, 0)
          targets[1].paralyzed = 1
        end
      end
		end

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 4
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 4
		target.cursed = 0
		target:sendStatus()
	end,
}

defender_roar_3 = {
  cast = function(player)
    local spellName = "Defender Roar"
    local spellIdent = "defender_roar_3"
      
    local formula = 150 + player.might * 1.5
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
          targets[1]:setDuration(spellIdent, durations)
          targets[1]:sendAnimation(39, 0)
          targets[1].cursed = 1
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
          targets[1]:setDuration(spellIdent, durations)
          targets[1]:sendAnimation(39, 0)
          targets[1].paralyzed = 1
        end
      end
		end

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 6
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 6
		target.cursed = 0
		target:sendStatus()
	end,
}

defender_roar_4 = {
  cast = function(player)
    local spellName = "Defender Roar"
    local spellIdent = "defender_roar_4"
      
    local formula = 200 + player.might * 2
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
          targets[1]:setDuration(spellIdent, durations)
          targets[1]:sendAnimation(39, 0)
          targets[1].cursed = 1
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
          targets[1]:setDuration(spellIdent, durations)
          targets[1]:sendAnimation(39, 0)
          targets[1].paralyzed = 1
        end
      end
		end

    player:sendStatus()
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
  end,

  recast = function(target)
		target.armor = target.armor + 8
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 8
		target.cursed = 0
		target:sendStatus()
	end,
}

defender_roar_5 = {
  cast = function(player)
    local spellName = "Defender Roar"
    local spellIdent = "defender_roar_5"
      
    local formula = 300 + player.might * 3
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
          targets[1]:setDuration(spellIdent, durations)
          targets[1]:sendAnimation(39, 0)
          targets[1].cursed = 1
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
          targets[1]:setDuration(spellIdent, durations)
          targets[1]:sendAnimation(39, 0)
          targets[1].paralyzed = 1
        end
      end
		end

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