molten_scorch = {
  cast = function(player)

    local spellName = "Molten Scorch"
    local spellIdent = "molten_scorch"
		local duration = 30000
    local aethers = 5000
		local magicCost = 2500
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}

    if (player.magic < magicCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end
    
    for i = 1, #x do
      local target = player:getObjectsInCell(
          player.m,
          player.x + x[i],
          player.y + y[i],
          BL_MOB
      )
        
      if (#target > 0) then
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(172, 0)
          target[1].armor = target[1].armor + 15
          target[1].cursed = 1
				end
      end

      target = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )

      if (#target > 0) then    
        if( target[1].state == 1 or target[1].blType == BL_PC) then
					player:sendMinitext("You can not cast on player")
				else
					target[1]:setDuration(spellIdent, duration)
					target[1]:sendAnimation(172, 0)
          target[1].armor = target[1].armor + 15
          target[1].cursed = 1
				end
      end
    end

    player.magic = player.magic - magicCost
		player:sendAction(6, 35)
		player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendStatus()

    end,
    
	while_cast = function(block)
		if (block.blType == BL_MOB and block.charState ~= 2) then
			block:sendAnimation(34, 0)
		elseif (block.blType == BL_PC and block.state ~= 2) then
			block:sendAnimation(34, 0)
		end
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
    
    requirements = function(player)
		local level = 65
		local items = {"gold_acorn"}
		local itemAmounts = {200}
		local description = "Reduce enemy armor with your fire"
		return level, items, itemAmounts, description
	end
}