sword_mastery = {
    cast = function(player)
        local spellName = "Sword Mastery"
        local spellIdent = "sword_mastery"
        local durations = (player.level - 9) * 10000

		if not player:canCast(1, 1, 0) then
			return
		end

    if player:hasDuration("sword_mastery") then
      player:sendMinitext("You have cast this spell")
			return
    end

    local magicCost = durations / 500

    if (player.magic < magicCost) then
			player:sendMinitext("Not enough mana.")
			return
		end

		player:removeDuras(flanks)

		player:sendAction(6, 35)
		player:sendAnimation(71)
		player:setDuration("sword_mastery", durations)
    player.magic = player.magic - magicCost
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
		local level = 10
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Passive spell to attack at all sides."
		return level, items, itemAmounts, description
	end
}