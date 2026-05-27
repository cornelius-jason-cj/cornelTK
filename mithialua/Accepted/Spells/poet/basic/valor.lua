valor_poet = {
	cast = function(player)
		local duration = 120000

		if (not player:canCast(1, 1, 0)) then
			return
		end

		if player:checkIfCast(mights) then
			return
		end

		player:sendMinitext("Your muscles develop.")
		player:sendAction(6, 35)
		player:setDuration("valor_poet", duration)
		player:playSound(12)
		player:sendAnimation(11)
		player:calcStat()
	end,

	recast = function(player)
		player.might = player.might + player.level
		player:sendStatus()
	end,

	uncast = function(player)
		player.might = player.might - player.level
		player:sendStatus()
	end,

  requirements = function(player)
		local level = 15
		local items = {"gold_acorn"}
		local itemAmounts = {30}
		local description = "A spell that develop your muscles"
		return level, items, itemAmounts, description
	end
}
