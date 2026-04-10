small_meat = {
	use = function(player)
		local healAmount = 1000
		player:sendAction(8, 25)
		player:addHealthExtend(healAmount, 0, 0, 0, 0, 0)
	end
}
