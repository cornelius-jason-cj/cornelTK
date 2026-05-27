scourge_poet = {
	cast = function(player)
    local spellIdent = "scourge_poet"
		local duration = 30000
		local magicCost = player.maxMagic * 0.1
		local aethers = 30000

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
				if targets[i]:checkIfCast(curses) or targets[i].cursed == 1 then
					return
				end
				targets[i].armor = targets[i].armor + 50
				targets[i].cursed = 1
				targets[i]:sendAnimation(39, 0)
				targets[i]:setDuration("scourge_poet", duration)
			end
		end

		player:sendStatus()
		player:playSound(2)
		player:sendMinitext("You cast Scourge.")
    player:setAether(spellIdent, aethers)
		-- target:setDuration("scourge_poet", duration)
		-- target:sendAnimation(39, 0)

		-- if (target.blType == BL_MOB) then
		-- 	target.armor = target.armor + 50
		-- 	target.cursed = 1
		-- elseif (target.blType == BL_PC and player:canPK(target)) then
		-- 	target:sendMinitext(player.name .. " casts Scourge on you.")
		-- 	target:calcStat()
		-- end
	end,

	while_cast = function(block)
		if (block.blType == BL_MOB and block.charState ~= 2) then
			block:sendAnimation(34, 0)
		elseif (block.blType == BL_PC and block.state ~= 2) then
			block:sendAnimation(34, 0)
		end
	end,

	recast = function(target)
		target.armor = target.armor + 50
		target.cursed = 1
		target:sendStatus()
	end,
	
	uncast = function(target)
		target.armor = target.armor - 50
		target.cursed = 0
		target:sendStatus()
	end,

	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Raises target +50 AC"
		return level, items, itemAmounts, description
	end
}