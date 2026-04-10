global_heal = {
	cast = function(player, target, healamount, manacost, pcalign)
		if (not player:canCast(1, 1, 0)) then
			return 0
		end

		if not distanceSquare(player, target, 10) then
			return 0
		end

		-- maximum 10 tiles away in either direction (verified on NTK)

		if (player.magic < manacost) then
			player:sendMinitext("You do not have enough mana.")
			return 0
		end
		if (target.state == 1) then
			player:sendMinitext("You need a different type of cure.")
			return 0
		end

		player:sendAction(6, 35)

		if (pcalign == 4001) then
			-- Kwi-Sin heals
			target:playSound(4)
			target:sendAnimation(66)
		elseif (pcalign == 3001) then
			-- Kwi-Sin heals
			target:playSound(4)
			target:sendAnimation(66)
		else
			-- Unaligned heals
			target:playSound(4)
			target:sendAnimation(5)
		end

		target.attacker = player.ID
		target:addHealthExtend(healamount, 0, 0, 0, 0, 0)

		player.magic = player.magic - manacost
		player:sendStatus()

		target:sendStatus()

		if target.id ~= player.id then
			return 2
		end

		return 1
	end
}
