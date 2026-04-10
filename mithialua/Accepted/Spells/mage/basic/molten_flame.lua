molten_flame = {
    cast = function(player)
      local spellName = "Molten Flame"
      local spellIdent = "molten_flame"
      local multiplier = (0.645 + (player.level + 1) / 1000 + player.baseWill / 1000)
      local damage = math.floor(player.maxMagic * multiplier)
      local aethers = 6000

      local magicCost = damage * 0.15
      local spellFX = 3004
      local x = {-1, 0, 1, 0, -1, -1, 1, 1, -2, 0, 2, 0}
      local y = {0, -1, 0, 1, -1, 1, -1, 1, 0, -2, 0, 2}

      if (player.magic < magicCost) then
        player:sendMinitext("You do not have enough mana.")
        return
      end


      for i = 1, 12 do
			  local targets = player:getObjectsInCell(
          player.m,
          player.x + x[i],
          player.y + y[i],
          BL_MOB
        )
        
        if (#targets > 0) then
            global_zap.cast(
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
          local worked = global_zap.cast(
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
      
      player.magic = player.magic - magicCost
      player:sendStatus()
      player:setAether(spellIdent, aethers)

    end,


    requirements = function(player)
      local level = 5
      local items = {"gold_acorn"}
      local itemAmounts = {10}
      local description = "Burn enemy around you with big fire"
      return level, items, itemAmounts, description
    end
}