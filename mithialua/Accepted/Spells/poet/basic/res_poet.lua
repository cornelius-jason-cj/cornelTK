res_poet = {
	cast = function(player, target)
		local aether = (21 - math.floor(player.level / 9)) * 1000
		local magicCost = 3000

		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("Your will is too weak.")
			return
		end

		if player:canPK(target) then
			return
		end

		player:sendAction(6, 20)
		target:sendAnimation(62)
		player.magic = player.magic - magicCost
		player:sendMinitext("You cast Resurrect.")
		player:setAether("resurrect_poet", 8000)
		player:sendStatus()

		if target.state == 1 then
			target.state = 0
			target.health = target.maxHealth
			target:sendMinitext(player.name .. " cast Resurrect on you.")
			target:sendStatus()
			target:updateState()
		end
	end,

	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Brings a dead player back to life at full health."
		return level, items, itemAmounts, description
	end
}