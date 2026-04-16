acorn = {
	use = function(player)
     player:dialogSeq(
      { 
            t,
            "you can't use dropped items until you craft them into usable items.",
      },
      1
    )
		-- local health = 8

		-- player:sendAction(8, 25)
		-- player.attacker = player.ID
		-- player:addHealthExtend(health, 0, 0, 0, 0, 0)
		-- player:removeItem('acorn', 1)

		-- if player.health == player.maxHealth then
		-- 	player:sendMinitext("You feel satiated.")
		-- end
	end
}

gold_acorn = {
	use = function(player)
		local health = 8

		player:sendAction(8, 25)
		player.attacker = player.ID
		player:addHealthExtend(health, 0, 0, 0, 0, 0)
		player:removeItem('gold_acorn', 1)

		if player.health == player.maxHealth then
			player:sendMinitext("You feel satiated.")
		end
	end
}
