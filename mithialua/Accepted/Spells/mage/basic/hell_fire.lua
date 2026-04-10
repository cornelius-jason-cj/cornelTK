hell_fire = {
    cast = function(player, target)
        local spellName = "Hell Fire"
        local spellIdent = "hell_fire"
        local damage = 0
        local threat
		local aethers = 12000
        local spellFX = 3003
        local multiplier = 10
        
        if not player:canCast(1, 1, 0) then
			return
		end
        
        local damage = math.floor(player.magic * multiplier)
		local worked = global_zap.cast(player, target, damage, 0, spellFX)
		print(worked)
		if worked == 1 then
			player:sendMinitext("You cast " .. spellName .. ".")
			player.magic = 30
			player:sendStatus()
			player:setAether(spellIdent, aethers)
		end
		if worked == 2 then
			target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
			player.magic = 30
			player:sendStatus()
			player:setAether(spellIdent, aethers)
		end
        
        
      end,

      requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Unleash your full magical energy to blaze enemies"
		return level, items, itemAmounts, description
      end
}