blaze_torent = {
    cast = function(player, target)
      local spellName = "Blaze Torent"
      local spellIdent = "blaze_torent"
      local aethers = 1000
      local spellFX = 3001

      if not player:canCast(1, 1, 0) then
        return
      end

      local multiplier = (0.115 + (player.level + 1) / 1000)
      local damage = math.floor(player.maxMagic * multiplier)

      local magicCost = damage * 0.15
      local worked = global_zap.cast(player, target, damage, magicCost, spellFX)
      
      if worked ~= 0 then
        player:sendMinitext("You cast " .. spellName .. ".")
      end
      
      if worked == 2 then
        target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
      end
        
      player:setAether(spellIdent, aethers)
	end,

	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Unleashes a small burst of flames to scorch your target."
		return level, items, itemAmounts, description
	end
}