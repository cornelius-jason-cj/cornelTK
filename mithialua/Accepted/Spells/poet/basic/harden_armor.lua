harden_armor_poet = {
	cast = function(player)
		local duration = 120000

		if (not player:canCast(1, 1, 0)) then
			return
		end

		if (player.state == 1) then
			return
		end

		if player:checkIfCast(hardarmors) then
			return
		end

		player:sendMinitext("Your armor is strengthened.")
		if (player.blType == BL_MOB) then
			return
		elseif (player.blType == BL_PC) then
			player:playSound(5)
			player:sendMinitext("You cast Harden Armor.")
			player:setDuration("harden_armor_poet", duration)
			player:sendAnimation(2)
			player:calcStat()
		end
	end,

	recast = function(player)
		player.armor = player.armor - 20
		player:sendStatus()
	end,

	uncast = function(player)
		player.armor = player.armor + 20
		player:sendStatus()
	end,

  requirements = function(player)
		local level = 15
		local items = {"gold_acorn"}
		local itemAmounts = {30}
		local description = "A spell that strengthened your armor"
		return level, items, itemAmounts, description
	end
}
