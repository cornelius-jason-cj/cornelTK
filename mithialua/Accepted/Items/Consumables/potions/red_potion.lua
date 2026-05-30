small_red_potion = {
	use = function(player)
		local healAmount = 500

    if player.health == player.maxHealth then
			player:sendMinitext("Your vita is full.")
      return
		end
		
    player:sendAction(8, 25)
		player.attacker = player.ID
		player:addHealthExtend(healAmount, 0, 0, 0, 0, 0)
		player:removeItem("small_red_potion", 1)
	end
}

regular_red_potion = {
	use = function(player)
		local healAmount = 1500

    if player.health == player.maxHealth then
			player:sendMinitext("Your vita is full.")
      return
		end
		
    player:sendAction(8, 25)
		player.attacker = player.ID
		player:addHealthExtend(healAmount, 0, 0, 0, 0, 0)
		player:removeItem("regular_red_potion", 1)
	end
}

large_red_potion = {
	use = function(player)
		local healAmount = 5000

    if player.health == player.maxHealth then
			player:sendMinitext("Your vita is full.")
      return
		end
		
    player:sendAction(8, 25)
		player.attacker = player.ID
		player:addHealthExtend(healAmount, 0, 0, 0, 0, 0)
		player:removeItem("large_red_potion", 1)
	end
}
