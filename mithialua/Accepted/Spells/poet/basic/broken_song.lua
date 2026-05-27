broken_song = {
  cast = function(player)
    local spellName = "Broken Song"
    local spellIdent = "broken_song"
    local magicCost = player.maxMagic * 0.1
    local aethers = 25000

    if not player:canCast(1, 1, 0) then
      return
    end

    if (player.magic < magicCost) then
      player:sendMinitext("Not enough mana.")
      return
    end

    player:sendAction(6, 20)
    player.magic = player.magic - magicCost

    local spellFX = 3002
    local x = {-2, -1,  1,  2, -1,  0,  1, -1,  0,  1,  0,  0}
    local y = { 0,  0,  0,  0,  1,  1,  1, -1, -1, -1,  2, -2}
    
    for i = 1, #x do
      local target = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_MOB
      )
      if #target > 0 then
        if( target[1].state == 1 or target[1].blType == BL_PC) then
          player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(39, 0)
          target[1].cursed = 1
        end
      end

      target = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_PC
      )
      if #target > 0 then
        if( target[1].state == 1 or target[1].blType == BL_PC) then
        player:sendMinitext("You can not cast on player")
        else
          target[1]:setDuration(spellIdent, duration)
          target[1]:sendAnimation(39, 0)
          target[1].paralyzed = 1
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

  requirements = function(player)
    local level = 25
    local items = {"gold_acorn"}
    local itemAmounts = {50}
    local description = "Slash monster around you"
		return level, items, itemAmounts, description
	end
}