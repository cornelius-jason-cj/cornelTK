sword_mastery = {
    cast = function(player)
        local spellName = "Sword Mastery"
        local spellIdent = "sword_mastery"
        local durations = math.max(1, player.level - 9) * 10000

		if not player:canCast(1, 1, 0) then
			return
		end

		player:removeDuras(flanks)

		player:sendAction(6, 35)
		player:setDuration("sword_mastery", durations)
		player:playSound(4)
		player:calcStat()
	end,
	recast = function(player)
		player.flank = true
		player.backstab = true
		player:sendStatus()
	end,
	while_cast = function(player)
		local enchant = 2
		player.flank = true
		player.backstab = true
		player.enchant = enchant
		player:sendStatus()
	end,
	uncast = function(player)
		player.flank = false
		player.backstab = false
		player:sendStatus()
	end,
	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Passive spell to attack at all sides."
		return level, items, itemAmounts, description
	end
}