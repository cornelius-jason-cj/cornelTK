small_blue_potion = {
	use = function(player)
		local healAmount = 500

    if player.magic == player.maxMagic then
			player:sendMinitext("You mana is full.")
      return
		end
		
    player:sendAction(8, 25)
		player.attacker = player.ID
    player:addMana(healAmount)
		player:removeItem("small_blue_potion", 1)
	end
}

regular_blue_potion = {
	use = function(player)
		local healAmount = 1500

    if player.magic == player.maxMagic then
			player:sendMinitext("You mana is full.")
      return
		end
		
    player:sendAction(8, 25)
		player.attacker = player.ID
    player:addMana(healAmount)
		player:removeItem("regular_blue_potion", 1)
	end
}

large_blue_potion = {
	use = function(player)
		local healAmount = 5000

    if player.magic == player.maxMagic then
			player:sendMinitext("You mana is full.")
      return
		end
		
    player:sendAction(8, 25)
		player.attacker = player.ID
    player:addMana(healAmount)
		player:removeItem("large_blue_potion", 1)
	end
}
