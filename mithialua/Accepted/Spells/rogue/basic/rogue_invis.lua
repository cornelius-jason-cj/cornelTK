rogue_invis = {
    cast = function(player)
      local durations = (player.level + 21) * 1000
    
      if not player:canCast(1, 1, 0) then
        return
      end
          
      if player:hasDuration("rogue_invis") then
        player:sendMinitext("You're already invisible.")
        return
      end
      
      
      player:sendAction(6, 20)
      player:setDuration("rogue_invis", durations)
      player:calcStat()
      player:sendMinitext("You cast Invisible")
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
      local level = 5
      local items = {"gold_acorn"}
      local itemAmounts = {10}
      local description = "Hide in the shadows and gain strength."
      return level, items, itemAmounts, description
    end
}