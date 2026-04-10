peaceful_mind = {
    cast = function(player)
        local spellName = "Peaceful Mind"
        local spellIdent = "peaceful_mind"
		local multiplier = 0.145 + player.baseWill / 1000
        local healAmount = math.floor(player.maxMagic * multiplier )
        local magicCost = healAmount * 0.5
        local spellFX = 3001
		
        if not player:canCast(1, 1, 0) then
			return
		end

        if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		
        
        -- player.magic = player.magic - magicCost	
        local worked = global_heal.cast(player, player, healAmount, magicCost, spellFX)

		local aether = 5000
		if player.level < 99 then
			aether = (25 - math.floor(player.level / 9)) * 1000
		end

		if worked == 1 then
            player:setAether("peaceful_mind", aether)
			player:sendMinitext("You cast " .. spellName .. ".")
		end
	end,

	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Heal yourself for a large amount."
		return level, items, itemAmounts, description
	end
}