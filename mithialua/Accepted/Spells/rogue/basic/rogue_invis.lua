invis_rogue = {
    cast = function(player)
      local durations = (player.level - 9) * 10000
    
      if not player:canCast(1, 1, 0) then
        return
      end
          
      if player:hasDuration("invis_rogue") then
        player:sendMinitext("You're already invisible.")
        return
      end

      local magicCost = durations / 500

      if (player.magic < magicCost) then
        player:sendMinitext("Not enough mana.")
        return
      end
      
      player:sendAction(6, 20)
      player:setDuration("invis_rogue", durations)
      player:calcStat()
      player:sendMinitext("You cast Invisible")
      player.magic = player.magic - magicCost
      player.state = 2
      if player.gfxClone == 1 then player.gfxName = "" end
      player:updateState()
    
    end,

    uncast = function(player)
      if player.health < 1 then
          player.state = 1
      else
          if player.state == 2 then player.state = 0 end
      end
        if player.gfxClone == 1 then player.gfxName = player.name end 
      player.invis = 1
      player:updateState()
      player:sendMinitext("You are no longer invisible.")
    end,

    requirements = function(player)
      local level = 35
      local items = {"gold_acorn"}
      local itemAmounts = {10}
      local description = "Hide in the shadows and gain strength."
      return level, items, itemAmounts, description
    end
}