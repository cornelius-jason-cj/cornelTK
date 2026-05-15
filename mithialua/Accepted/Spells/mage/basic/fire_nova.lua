fire_nova = {
	cast = function(player)
		local spellName = "Fire Nova"
		local spellIdent = "fire_nova"

		if not player:canCast(1, 1, 0) then
			return
		end

    local multiplier = 0.085 + (player.level + 1) / 1000
    local damage = math.floor(player.maxMagic * multiplier)

    local magicCost = damage * 0.15
    
    local spellFX = 3002
    local x = {-1,  1, -1,  0,  1, -1,  0,  1}
    local y = { 0,  0,  1,  1,  1, -1, -1, -1}

		if (player.magic < magicCost) then
			player:sendMinitext("You do not have enough mana.")
			return
		end


		for i = 1, #x do
			local target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_MOB
			)
			if #target > 0 then
				global_zap.cast(player, target[1], damage, magicCost, spellFX)
			end

			target = player:getObjectsInCell(
				player.m,
				player.x + x[i],
				player.y + y[i],
				BL_PC
			)
			if #target > 0 then
				local worked = global_zap.cast(player, target[1], damage, magicCost, spellFX)
				if worked == 2 then
					target:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
				end
			end
		end

		player:sendStatus()
		player:sendMinitext("You cast " .. spellName .. ".")
		player:sendAction(6, 35)
	end,

	requirements = function(player)
		local level = 10
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Strike your surroundings with fire."
		return level, items, itemAmounts, description
	end
}
