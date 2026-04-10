return_spell = {
	cast = function(player)
		local magic = 0
		if (not player:canCast(1, 1, 0)) then
			return
		end
		player:returnFunc()
	end,

	requirements = function(player)
		local level = 1
		local items = {"rabbit_meat", "acorn"}
		local itemAmounts = {5, 5}
		local description = "Returns you to your home city."
		return level, items, itemAmounts, description
	end
}
