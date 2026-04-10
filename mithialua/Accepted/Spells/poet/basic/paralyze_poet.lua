paralyze_poet = {
	cast = function(player, target)
		-- local aether = (5 - math.floor(player.level + 1 / 20)) * 1000
		local duration = 30000
		local magicCost = player.level * 2

		if (not player:canCast(1, 1, 0)) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("Not enough mana.")
			return
		end

		if (target.state == 1 or target.blType == BL_PC) then
			player:sendMinitext("It doesn't work.")
			return
		end

		if (target.paralyzed == true) then
			player:sendMinitext("You already cast that spell.")
			return
		end

		if (target.blType == BL_MOB) then
			player:sendAction(6, 20)
			player.magic = player.magic - magicCost
			player:sendStatus()
			player:playSound(70)
			-- player:setAether("paralyze_poet", aether)
			player:sendMinitext("You cast Paralyze.")
			target:setDuration("paralyze_poet", duration)
			target:sendAnimation(1, 0)
			target.paralyzed = true
		end
	end,

	uncast = function(target)
		target.paralyzed = false
	end,

	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Disables a target from moving."
		return level, items, itemAmounts, description
	end
}