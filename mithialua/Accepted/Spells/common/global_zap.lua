global_zap = {
	cast = function(player, target, damage, manacost, pcalign)
		local start = os.time() * 1000 + timeMS()
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

		--10/11/12 are for the few zaps that are different animations when unaligned
		--but all become the same once alignment is chosen:
		------thunder bolt = 10, spark = 11, singe = 12.
		--13 is for taunt or other spells that play zap sound but no animation.

		if (pcalign == 3001) then -- blaze torent
			target:playSound(2)
			target:sendAnimation(45)
		elseif (pcalign == 3002) then -- fire nova
			target:playSound(21)
			target:sendAnimation(46)
		elseif (pcalign == 3003) then -- hell fire
			target:playSound(42)
			target:sendAnimation(112)
		elseif (pcalign == 3004) then -- molten flame
			target:playSound(42)
			target:sendAnimation(104)
		elseif (pcalign == 3005) then -- molten flame
			target:playSound(43)
			target:sendAnimation(352)
		elseif (pcalign == 4001) then -- crashing echo
			target:playSound(21)
			target:sendAnimation(228)
		else
			-- default unaligned zap.
			target:playSound(56)
			target:sendAnimation(4)
		end

		if target.id ~= player.id and target.blType == BL_PC then
			return 2
		end
		broadcast(4, "global zap: " .. (os.time() * 1000 + timeMS()) - start)
		return 1
	end
}
