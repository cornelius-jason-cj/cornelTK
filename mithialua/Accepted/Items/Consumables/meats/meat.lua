small_meat = {
	use = function(player)
		local healAmount = 500

    if not player:canAction(1, 0, 0) then
			return
		end

    if player.state == 1 then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		
    player:sendAction(8, 25)
    player:playSound(403)
		player:addHealthExtend(healAmount, 0, 0, 0, 0, 0)
	end
}

regular_meat = {
	use = function(player)
		local healAmount = 1000

    if not player:canAction(1, 0, 0) then
			return
		end

    if player.state == 1 then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		
    player:sendAction(8, 25)
    player:playSound(403)
		player:addHealthExtend(healAmount, 0, 0, 0, 0, 0)
	end
}
