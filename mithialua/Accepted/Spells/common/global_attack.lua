global_attack = {
	cast = function(player, target, damage, manacost, pcalign)
		local start = os.time() * 1000 + timeMS()
		if (not player:canCast(1, 1, 0)) then
			return 0
		end

		if not distanceSquare(player, target, 10) then
			return 0
		end

		if (player.magic < manacost) then
			player:sendMinitext("You do not have enough mana.")
			return 0
		end

		if (target.state == 1) then
			player:sendMinitext("It is already dead.")
			return 0
		end


		if target.blType == BL_MOB then
			local threat = threat.getHighestThreat(target)
			player:setThreat(target.ID, threat + damage)
		elseif target.blType == BL_PC then
			if (not player:canPK(target)) then
				player:sendMinitext("You cannot attack that target.")
				return 0
			end
		end


		if manacost ~= 0 then
			player.magic = player.magic - manacost
			player:sendStatus()
			player:sendAction(6, 35)
		end


		target.attacker = player.ID
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		target:sendStatus()

		if (pcalign == 1001) then -- triple slash
			target:playSound(14)
			target:sendAnimation(60)
		elseif (pcalign == 1002) then -- vampiric slash
			target:playSound(12)
			target:sendAnimation(120)
		elseif (pcalign == 2001) then -- tiger claw
			target:playSound(12)
			target:sendAnimation(32)
		else -- default unaligned zap.
			target:playSound(56)
			target:sendAnimation(4)
		end


		if target.id ~= player.id and target.blType == BL_PC then
			return 2
		end

		broadcast(4, "global attack: " .. (os.time() * 1000 + timeMS()) - start)
		return 1
	end
}
