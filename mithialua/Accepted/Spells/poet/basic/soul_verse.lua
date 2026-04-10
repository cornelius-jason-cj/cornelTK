soul_verse = {
	cast = function(player, target)
        local spellName = "Soul Verse"
        local spellIdent = "soul_verse"
		local aethers = 60000

		if (player.state ~= 1) then
			player:sendMinitext("You are not dead!")
			return
		end

		if player.state == 1 then
			player.state = 0
			player.health = player.maxHealth
			player:sendAction(6, 20)
			player:sendAnimation(96)
			player:setDuration(spellIdent, durations)
			player:setAether(spellIdent, aethers)
			player:sendMinitext("You cast " .. spellName .. ".")
			player:sendStatus()
			player:updateState()
		end
	end,

	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Poet's spirit weaves a verse to bring you back to life"
		return level, items, itemAmounts, description
	end
}