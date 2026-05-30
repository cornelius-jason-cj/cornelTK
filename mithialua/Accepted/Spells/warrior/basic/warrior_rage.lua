warrior_rage = {
  cast = function(player)
    local spellName = "Warrior Rage"
    local spellIdent = "warrior_rage"
    local durations = math.max(1, player.level - 9) * 10000
    local multiplier = 5
		local vitaMultiplier = math.floor(player.baseHealth / 20000)
		local manaMultiplier = math.floor(player.baseMagic / 10000)

		if baseMultiplier > multiplier then
			multiplier = baseMultiplier
		end

		if not player:canCast(1, 1, 0) then
			return
		end

    if player:checkIfCast(lesserFuries) or player.rage > 1 then
			player:sendMinitext("This spell is already active.")
			return
		end

		player.rage = multiplier
		player:playSound(4)
		player:setDuration("warrior_rage", durations)
		player:sendAnimation(36)
		player:sendStatus()
		player:sendAction(6, 35)
	end,

	recast = function(player)
		player.rage = multiplier
	end,
	
	while_cast = function(player)
		local defaultMultiplier = 5
		local vitaMultiplier = math.floor(player.baseHealth / 20000)
		local manaMultiplier = math.floor(player.baseMagic / 10000)
		local calculatedMultiplier = vitaMultiplier + manaMultiplier

		local finalMultiplier = defaultMultiplier + vitaMultiplier + manaMultiplier

		player.rage = finalMultiplier
	end,
	uncast = function(player)
		player.rage = 1
	end,
	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Increases your weapon damage x3 and increase depends on your level."
		return level, items, itemAmounts, description
	end
}