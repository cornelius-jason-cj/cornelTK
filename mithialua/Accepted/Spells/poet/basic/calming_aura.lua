calming_aura = {
    cast = function(player)
		local spellName = "Calming Aura"
		local spellIdent = "calming_aura"
    local healthCost = math.floor(player.maxHealth * 0.25)
		local magicCost = math.floor(player.maxMagic * 0.25)
    local aethers = 20000
    local durations = 15000
    local spellFX = 4002

		if (not player:canCast(1, 1, 0)) then
			return
		end

    if (player.health < healthCost) then
      player:sendMinitext("You need " .. healthCost .. " vita")
      return
    end

		if (player.magic < magicCost) then
			player:sendMinitext("You need " .. magicCost .. " mana")
			return
		end

		if player:hasAether(spellIdent) then
			return
		end

		player:sendAction(6, 20)
		player:playSound(22)
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
		player:sendMinitext("You cast " .. spellName .. ".")
    player.health = player.health - healthCost
		player.magic = player.magic - magicCost
		player:sendStatus()

		-- for i = 1, #player.group do
		-- 	local target = Player(player.group[i])

		-- 	if distanceSquare(player, target, 3) then
		-- 		target.attacker = player.ID
		-- 		target:sendAnimation(5, 0)
		-- 		target:addHealthExtend(healAmount, 0, 0, 0, 0, 0)
		-- 		target:sendMinitext(player.name .. " casts " .. spellName .. " on you.")
		-- 	end
		-- end
	end,

	while_cast = function(player)
		local spellName = "Calming Aura"
		local spellIdent = "calming_aura"
    local multiplier = (0.075 + (player.level + 1) / 1000)
    -- local healAmount = math.floor(player.maxHealth * 0.025 + player.maxMagic * 0.05)
    local healVitaAmount = math.floor(player.maxHealth * multiplier)
    local healManaAmount = math.floor(player.maxMagic * multiplier)
		for i = 1, #player.group do
			local target = Player(player.group[i])

			if distanceSquare(player, target, 3) then
				target.attacker = player.ID
				target:sendAnimation(425)
				target:addHealthExtend(healVitaAmount, 0, 0, 0, 0, 0)
        target:addMana(healManaAmount)
				target:sendMinitext(player.name .. " casts " .. spellName .. " on you.")
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