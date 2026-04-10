tigers_heart = {
	use = function(player)
		local health = 1000

		player:sendAction(8, 25)
		player.attacker = player.ID
		player:addHealthExtend(health, 0, 0, 0, 0, 0)
		player:removeItem('tigers_heart', 1)

		if player.health == player.maxHealth then
			player:sendMinitext("You feel satiated.")
		end
	end
}
