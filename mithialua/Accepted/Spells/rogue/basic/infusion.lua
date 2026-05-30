
infusion_rogue = {
  cast = function(player)
    local spellName = "Infusion"
    local spellIdent = "infusion_rogue"
		local aethers = 20000
    local multiplier = (0.085 + player.karma)
    local damage = math.floor(player.maxHealth * multiplier)
    local healthCost =  math.floor(damage * 0.15)

		if (not player:canCast(1, 1, 0)) then
			return
		end
		
    if (player.health < healthCost) then
      player:sendMinitext("You do not have enough vita.")
      return
    end

    if (player.health - healthCost < 100) then
      player.health = 100
    else
      player.health = player.health - healthCost
    end
		
    player.attacker = player.ID
		target:addMana(damage)
    player:setAether(spellIdent, aether)
		player:playSound(5)
		player:sendAnimation(293)
		player:sendMinitext("You cast " .. spellName)
		player:sendStatus()
		player:sendAction(6, 35)
	end,

	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Heal your mana depends on your damage"
		return level, items, itemAmounts, description
	end
}