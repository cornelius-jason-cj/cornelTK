

burst = {
    cast = function(player)
      -- local pveAether = 10000
      -- local pvpAether = 300000
      local aether
      local magicCost = 500
      local anim
      local sound = 8
      
      if player.class == 1 then
        anim = 292
        aether = 4000
      elseif player.class == 2 then
        anim = 279
        aether = 0
      elseif player.class == 3 then
        anim = 415
        aether = 6000
      elseif player.class == 4 then
        anim = 432
        aether = 6000
      else 
        aether = 600000
      end

      if not player:canCast(1, 1, 0) then return end

      if player.magic < magicCost then
  			player:sendMinitext("You do not have enough mana.")
        return
      end
      
      player:sendAnimationXY(anim, player.x, player.y)
      
      if player.side == 0 then
        if player:objectCanMoveFrom(player.x, player.y, 0) then
          if burst.checkMove(player, player.m, player.x, player.y-1) then  -- can move 1 space
            if burst.checkMove(player, player.m, player.x, player.y-2) then  -- can move 2 spaces
              if burst.checkMove(player, player.m, player.x, player.y-3) then  -- can move 3 spaces
                if burst.checkWarp(player, player.m, player.x, player.y-3) then
                  player:warp(player.m, player.x, player.y-3)
                elseif burst.checkBoth(player, player.m, player.x, player.y-4) then
                  player:warp(player.m, player.x, player.y-4)
                elseif burst.checkBoth(player, player.m, player.x-1, player.y-3) then
                  player:warp(player.m, player.x-1, player.y-3)
                elseif burst.checkBoth(player, player.m, player.x+1, player.y-3) then
                  player:warp(player.m, player.x+1, player.y-3)
                elseif burst.checkWarp(player, player.m, player.x, player.y-2) then
                  player:warp(player.m, player.x, player.y-2)
                elseif burst.checkWarp(player, player.m, player.x, player.y-1) then
                  player:warp(player.m, player.x, player.y-1)
                end
              else  -- can move 2 only
                if burst.checkWarp(player, player.m, player.x, player.y-2) then
                  player:warp(player.m, player.x, player.y-2)
                elseif burst.checkWarp(player, player.m, player.x, player.y-1) then
                  player:warp(player.m, player.x, player.y-1)
                end
              end
            else  -- can move 1 only
              if burst.checkWarp(player, player.m, player.x, player.y-1) then
                player:warp(player.m, player.x, player.y-1)
              end
            end
          end
        end
      
      elseif player.side == 1 then
        if player:objectCanMoveFrom(player.x, player.y, 0) then
          if burst.checkMove(player, player.m, player.x+1, player.y) then  -- can move 1 space
            if burst.checkMove(player, player.m, player.x+2, player.y) then  -- can move 2 spaces
              if burst.checkMove(player, player.m, player.x+3, player.y) then  -- can move 3 spaces
                if burst.checkWarp(player, player.m, player.x+3, player.y) then
                  player:warp(player.m, player.x+3, player.y)
                elseif burst.checkBoth(player, player.m, player.x+4, player.y) then
                  player:warp(player.m, player.x+4, player.y)
                elseif burst.checkBoth(player, player.m, player.x+3, player.y+1) then
                  player:warp(player.m, player.x+3, player.y+1)
                elseif burst.checkBoth(player, player.m, player.x+3, player.y-1) then
                  player:warp(player.m, player.x+3, player.y-1)
                elseif burst.checkWarp(player, player.m, player.x+2, player.y) then
                  player:warp(player.m, player.x+2, player.y)
                elseif burst.checkWarp(player, player.m, player.x+1, player.y) then
                  player:warp(player.m, player.x+1, player.y)
                end
              else  -- can move 2 only
                if burst.checkWarp(player, player.m, player.x+2, player.y) then
                  player:warp(player.m, player.x+2, player.y)
                elseif burst.checkWarp(player, player.m, player.x+1, player.y) then
                  player:warp(player.m, player.x+1, player.y)
                end
              end
            else  -- can move 1 only
              if burst.checkWarp(player, player.m, player.x+1, player.y) then
                player:warp(player.m, player.x+1, player.y)
              end
            end
          end
        end
      
      elseif player.side == 2 then
        if player:objectCanMoveFrom(player.x, player.y, 0) then
          if burst.checkMove(player, player.m, player.x, player.y+1) then  -- can move 1 space
            if burst.checkMove(player, player.m, player.x, player.y+2) then  -- can move 2 spaces
              if burst.checkMove(player, player.m, player.x, player.y+3) then  -- can move 3 spaces
                if burst.checkWarp(player, player.m, player.x, player.y+3) then
                  player:warp(player.m, player.x, player.y+3)
                elseif burst.checkBoth(player, player.m, player.x, player.y+4) then
                  player:warp(player.m, player.x, player.y+4)
                elseif burst.checkBoth(player, player.m, player.x+1, player.y+3) then
                  player:warp(player.m, player.x+1, player.y+3)
                elseif burst.checkBoth(player, player.m, player.x-1, player.y+3) then
                  player:warp(player.m, player.x-1, player.y+3)
                elseif burst.checkWarp(player, player.m, player.x, player.y+2) then
                  player:warp(player.m, player.x, player.y+2)
                elseif burst.checkWarp(player, player.m, player.x, player.y+1) then
                  player:warp(player.m, player.x, player.y+1)
                end
              else  -- can move 2 only
                if burst.checkWarp(player, player.m, player.x, player.y+2) then
                  player:warp(player.m, player.x, player.y+2)
                elseif burst.checkWarp(player, player.m, player.x, player.y+1) then
                  player:warp(player.m, player.x, player.y+1)
                end
              end
            else  -- can move 1 only
              if burst.checkWarp(player, player.m, player.x, player.y+1) then
                player:warp(player.m, player.x, player.y+1)
              end
            end
          end
        end
      
      elseif player.side == 3 then
        if player:objectCanMoveFrom(player.x, player.y, 0) then
          if burst.checkMove(player, player.m, player.x-1, player.y) then  -- can move 1 space
            if burst.checkMove(player, player.m, player.x-2, player.y) then  -- can move 2 spaces
              if burst.checkMove(player, player.m, player.x-3, player.y) then  -- can move 3 spaces
                if burst.checkWarp(player, player.m, player.x-3, player.y) then
                  player:warp(player.m, player.x-3, player.y)
                elseif burst.checkBoth(player, player.m, player.x-4, player.y) then
                  player:warp(player.m, player.x-4, player.y)
                elseif burst.checkBoth(player, player.m, player.x-3, player.y-1) then
                  player:warp(player.m, player.x-3, player.y-1)
                elseif burst.checkBoth(player, player.m, player.x-3, player.y+1) then
                  player:warp(player.m, player.x-3, player.y+1)
                elseif burst.checkWarp(player, player.m, player.x-2, player.y) then
                  player:warp(player.m, player.x-2, player.y)
                elseif burst.checkWarp(player, player.m, player.x-1, player.y) then
                  player:warp(player.m, player.x-1, player.y)
                end
              else  -- can move 2 only
                if burst.checkWarp(player, player.m, player.x-2, player.y) then
                  player:warp(player.m, player.x-2, player.y)
                elseif burst.checkWarp(player, player.m, player.x-1, player.y) then
                  player:warp(player.m, player.x-1, player.y)
                end
              end
            else  -- can move 1 only
              if burst.checkWarp(player, player.m, player.x-1, player.y) then
                player:warp(player.m, player.x-1, player.y)
              end
            end
          end
        end
      
      end
      
      player:playSound(sound)
      player:sendAction(6, 20)
      player.magic = player.magic - magicCost
      player:sendMinitext("You cast Burst")
      player:setAether("burst", aether)
      
      -- if player.pvp == 1 then
      --   player:setAether(8902, pvpAether)
      -- else
      --   player:setAether(8902, pveAether)
      -- end
      
      player:sendStatus()
    
    end,
    
    checkMove = function(player, m, x, y)
      if not player:objectCanMove(x, y, 0) then return false end
      if getPass(m, x, y) ~= 0 then return false end
      if getWarp(m, x, y) then return false end
      return true
    end,
    
    checkWarp = function(player, m, x, y)
      local mob = player:getObjectsInCell(m, x, y, BL_MOB)[1]
      local pc = player:getObjectsInCell(m, x, y, BL_PC)[1]
      local npc = player:getObjectsInCell(m, x, y, BL_NPC)[1]
      if mob ~= nil then return false end
      if pc ~= nil then return false end
      if npc ~= nil then return false end
      return true
    end,
    
    checkBoth = function(player, m, x, y)
      local move = burst.checkMove(player, m, x, y)
      local warp = burst.checkWarp(player, m, x, y)
      if move and warp then return true else return false end
    end,
    
    requirements = function(player)
      local level = 5
      local items = {"gold_acorn"}
      local itemAmounts = {10}
      local description = "Increases your weapon damage x5 and increase depends on your level."
      return level, items, itemAmounts, description
    end
    
}