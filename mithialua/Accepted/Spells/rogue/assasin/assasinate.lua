local aethers = 6000

assasinate_1 = {
  cast = function(player)
    local spellName = "Assasinate"
    local spellIdent = "assasinate_1"

    local formula = 400 + player.grace * 3
    local damage = math.floor(formula)
    local side = player.side
    
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

    local spellFX = 2001
    local x = {0}
    local y = {0}

    if (side == 0) then
      y = {-1}
    elseif (side == 1) then
      x = {1}
    elseif (side == 2) then
      y = {1}
    elseif (side == 3) then
      x = {-1}
    else
      return
    end

    local targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_MOB
    )
    
    if (#targets > 0) then
      global_attack.cast(
        player,
        targets[1],
        damage,
        0,
        spellFX
      )
    end

    targets = player:getObjectsInCell(
      player.m,
      player.x + x[1],
      player.y + y[1],
      BL_PC
    )

    if (#targets > 0) then
      local worked = global_attack.cast(
        player,
        targets[1],
        damage,
        0,
        spellFX
      )

      if (worked == 2) then
        targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
      end
    end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,
}

assasinate_2 = {
  cast = function(player)
    local spellName = "Assasinate"
    local spellIdent = "assasinate_2"

    local formula = 600 + player.grace * 4
    local damage = math.floor(formula)
    local side = player.side
    
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

    local spellFX = 2001
    local x = {0, 0}
    local y = {0, 0}

    if (side == 0) then
      y = {-1, -2}
    elseif (side == 1) then
      x = {1, 2}
    elseif (side == 2) then
      y = {1, 2}
    elseif (side == 3) then
      x = {-1, -2}
    else
      return
    end

    for i = 1, #x do
			local target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #target > 0 then
				global_zap.cast(player, target[1], damage, 0, spellFX)
			end

			target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
			if #target > 0 then
				local worked = global_zap.cast(player, target[1], damage, 0, spellFX)
				if worked == 2 then
					target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
				end
			end
		end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,
}

assasinate_3 = {
  cast = function(player)
    local spellName = "Assasinate"
    local spellIdent = "assasinate_3"

    local formula = 900 + player.grace * 5
    local damage = math.floor(formula)
    local side = player.side
    
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

    local spellFX = 2001
    local x = {0, 0, 0}
    local y = {0, 0, 0}

    if (side == 0) then
      y = {-1, -2, -3}
    elseif (side == 1) then
      x = {1, 2, 3}
    elseif (side == 2) then
      y = {1, 2, 3}
    elseif (side == 3) then
      x = {-1, -2, -3}
    else
      return
    end

    for i = 1, #x do
			local target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #target > 0 then
				global_zap.cast(player, target[1], damage, 0, spellFX)
			end

			target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
			if #target > 0 then
				local worked = global_zap.cast(player, target[1], damage, 0, spellFX)
				if worked == 2 then
					target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
				end
			end
		end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,
}

assasinate_4 = {
  cast = function(player)
    local spellName = "Assasinate"
    local spellIdent = "assasinate_4"

    local formula = 1300 + player.grace * 6
    local damage = math.floor(formula)
    local side = player.side
    
    local vitaCost = 250
    local manaCost = 125
      
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

    local spellFX = 2001
    local x = {0, 0, 0, 0}
    local y = {0, 0, 0, 0}

    if (side == 0) then
      y = {-1, -2, -3, -4}
    elseif (side == 1) then
      x = {1, 2, 3, 4}
    elseif (side == 2) then
      y = {1, 2, 3, 4}
    elseif (side == 3) then
      x = {-1, -2, -3, -4}
    else
      return
    end

    for i = 1, #x do
			local target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #target > 0 then
				global_zap.cast(player, target[1], damage, 0, spellFX)
			end

			target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
			if #target > 0 then
				local worked = global_zap.cast(player, target[1], damage, 0, spellFX)
				if worked == 2 then
					target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
				end
			end
		end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,
}

assasinate_5 = {
  cast = function(player)
    local spellName = "Assasinate"
    local spellIdent = "assasinate_5"

    local formula = 1800 + player.grace * 7
    local damage = math.floor(formula)
    local side = player.side
    
    local vitaCost = 300
    local manaCost = 150
      
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

    local spellFX = 2001
    local x = {0, 0, 0, 0, 0}
    local y = {0, 0, 0, 0, 0}

    if (side == 0) then
      y = {-1, -2, -3, -4, -5}
    elseif (side == 1) then
      x = {1, 2, 3, 4, 5}
    elseif (side == 2) then
      y = {1, 2, 3, 4, 5}
    elseif (side == 3) then
      x = {-1, -2, -3, -4, -5}
    else
      return
    end

    for i = 1, #x do
			local target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #target > 0 then
				global_zap.cast(player, target[1], damage, 0, spellFX)
			end

			target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
			if #target > 0 then
				local worked = global_zap.cast(player, target[1], damage, 0, spellFX)
				if worked == 2 then
					target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
				end
			end
		end
    
    player.health = player.health - vitaCost
    player.magic = player.magic - manaCost

    player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,
}