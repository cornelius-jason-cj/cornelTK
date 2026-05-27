triple_slash = {
    cast = function(player)
      local spellName = "Triple Slash"
      local spellIdent = "triple_slash"
		  local aethers = 1000

      if not player:canCast(1, 1, 0) then
        return
      end

      -- local multiplier = (0.25 + (player.level + 1) / 1000)
      -- local rage = player.rage / 3
      -- local damage = math.floor(player.maxHealth * multiplier ) * rage
      -- local currentMagic = player.magic
      -- local magicCost = player.maxMagic * 0.1
      -- local healthCost = math.floor(player.maxHealth * 0.1 )
      -- local damage = math.floor(player.maxHealth * 0.2 )
      local multiplier = (0.175 + (player.level + 1) / 1000)
      local damage = math.floor(player.maxHealth * multiplier)
      local healthCost =  math.floor(damage * 0.15)
      -- local magicCost = 0
      local spellFX = 1001
      local x = {-1, 0, 1, 0}
      local y = {0, -1, 0, 1}
        
      -- if (player.magic < magicCost) then
			--   player:sendMinitext("You do not have enough mana.")
			-- return

      if (player.health < healthCost) then
        player:sendMinitext("You do not have enough vita.")
        return
      end

      
      if (player.health - healthCost < 100) then
        player.health = 100
      else
        player.health = player.health - healthCost
      end


      for i = 1, 4 do
        local targets = player:getObjectsInCell(
          player.m,
          player.x + x[i],
          player.y + y[i],
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
            player.x + x[i],
            player.y + y[i],
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
        end
        
    -- player.magic = player.magic - magicCost
    -- player.health = player.health - healthCost
		player:sendStatus()
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
    end,

    requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Slash monster around you"
		return level, items, itemAmounts, description
	end
}