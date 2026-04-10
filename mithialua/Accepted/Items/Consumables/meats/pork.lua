pork = {
	use = function(player)
		local health = 128

		player:sendAction(8, 25)
		player.attacker = player.ID
		player:addHealthExtend(health, 0, 0, 0, 0, 0)
		player:removeItem('pork', 1)

		if player.health == player.maxHealth then
			player:sendMinitext("You feel satiated.")
		end
	end
}

rare_pork = {
	use = function(player)
		local health = 31

		player:sendAction(8, 25)
		player.attacker = player.ID
		player:addHealthExtend(health, 0, 0, 0, 0, 0)
		player:removeItem('rare_pork', 1)

		if player.health == player.maxHealth then
			player:sendMinitext("You feel satiated.")
		end
	end
}
