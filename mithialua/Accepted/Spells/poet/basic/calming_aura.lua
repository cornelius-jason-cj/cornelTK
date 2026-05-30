calming_aura = {
    cast = function(player)
		local spellName = "Calming Aura"
		local spellIdent = "calming_aura"
		local magicCost = math.floor((player.maxHealth + player.maxMagic) * 0.25)
    local aethers = 35000
    local durations = 30000
    local spellFX = 4002

		if (not player:canCast(1, 1, 0)) then
			return
		end

		if (player.magic < magicCost) then
			player:sendMinitext("You need " .. magicCost .. " mana")
			return
		end

		if player:hasAether(spellIdent) then
			return
		end

		player.magic = player.magic - magicCost
		player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 20)
		player:playSound(22)

	end,

	while_cast = function(player)
		local spellName = "Calming Aura"
		local spellIdent = "calming_aura"
    local multiplier = (0.125 + player.karma)
    local healVitaAmount = math.floor(player.maxHealth * multiplier)
    local healManaAmount = math.floor(player.maxMagic * multiplier)
		for i = 1, #player.group do
			local target = Player(player.group[i])

			if distanceSquare(player, target, 3) then
				target.attacker = player.ID
				target:sendAnimation(425)
				target:addHealthExtend(healVitaAmount, 0, 0, 0, 0, 0)
        target:addMana(healManaAmount)
			end
		end
    end,

	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "a healing spell that heals group members surrounding you base on your vita and mana."
		return level, items, itemAmounts, description
	end
}