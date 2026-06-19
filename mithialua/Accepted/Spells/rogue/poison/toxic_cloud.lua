local aethers = 25000
local durations = 4000

toxic_cloud_1 = {
  cast = function(player)
    local spellName = "Toxic Cloud"
    local spellIdent = "toxic_cloud_1"

    local manaCost = 80

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    local spellFX = 1001
    local x = {-1,  1,  0,  0}
    local y = { 0,  0,  1, -1}

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

toxic_cloud_2 = {
  cast = function(player)
    local spellName = "Toxic Cloud"
    local spellIdent = "toxic_cloud_2"

    local manaCost = 100

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    local spellFX = 1001
    local x = {-1,  1,  0,  0}
    local y = { 0,  0,  1, -1}

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

toxic_cloud_3 = {
  cast = function(player)
    local spellName = "Toxic Cloud"
    local spellIdent = "toxic_cloud_3"

    local manaCost = 140

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

toxic_cloud_4 = {
  cast = function(player)
    local spellName = "Toxic Cloud"
    local spellIdent = "toxic_cloud_4"

    local manaCost = 180

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < manaCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end

    local spellFX = 1001
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}

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

toxic_cloud_5 = {
  cast = function(player)
    local spellName = "Toxic Cloud"
    local spellIdent = "toxic_cloud_5"

    local manaCost = 260

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
		target.armor = target.armor + 25
		target.cursed = 1
		target:sendStatus()
	end,

  uncast = function(target)
		target.armor = target.armor - 25
		target.cursed = 0
		target:sendStatus()
	end,
}