
replenish_warrior = {
  cast = function(player)
    local spellName = "Replenish"
    local spellIdent = "replenish_warrior"
    local multiplier = 0.055 + (player.level + 1) / 1000
    local healAmount = math.floor(player.maxMagic * multiplier )
    local aether = (11 - math.floor(player.level / 9)) * 1000
    local magicCost = healAmount * 0.25

    if (not player:canCast(1, 1, 0)) then
      return
    end
		
    if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		
    player.attacker = player.ID
		player:addHealthExtend(healAmount, 0, 0, 0, 0, 0)
		player.magic = player.magic - magicCost
    player:setAether(spellIdent, aether)
		player:playSound(5)
		player:sendAnimation(295)
		player:sendMinitext("You cast " .. spellName)
		player:sendStatus()
		player:sendAction(6, 35)
	end,

	requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Heal your vita depends on your mana"
		return level, items, itemAmounts, description
	end
}