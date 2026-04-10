taunt_warrior = {
	cast = function(player)
		local spellName = "Taunt"
        local spellIdent = "taunt_warrior"
		local durations = 60000
		local aethers = 10000
		local magicCost = player.maxMagic * 0.1
		local threatDamage = 500 + (math.floor(player.baseHealth) * 1.25)

		if (not player:canCast(1, 1, 0)) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("Not enough mana.")
			return
		end

		player:sendAction(6, 20)
		player.magic = player.magic - magicCost

		local targets = player:getObjectsInMap(player.m, BL_MOB)
		if #targets > 0 then

			for i = 1, #targets do
				if targets[i].behavior ~= 2 then
					targets[i].attacker = player.ID
					targets[i]:setDuration(spellIdent, durations)
					player:setThreat(targets[i].ID, 1)
					targets[i]:sendAnimation(248)

				end
			end
		end

		player:sendStatus()
		player:playSound(2)
		player:sendMinitext("You cast Taunt.")
        player:setDuration(spellIdent, durations)
        player:setAether(spellIdent, aethers)
	end,

	while_cast = function(block)
		block:sendAnimation(248)
	end,

	recast = function(target)
		target:sendStatus()
	end,
	
	uncast = function(target)
		target:sendStatus()
	end,


	requirements = function(player)
		local level = 6
		local items = {Item("acorn").id, Item("rabbit_meat").id}
		local itemAmounts = {20, 5}
		local description = "Gain the attention of your foe."
		return level, items, itemAmounts, description
	end
}