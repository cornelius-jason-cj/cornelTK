onLevel = function(player)
	local primary = 0
	local secondary = 0
	local tertiary = 0

	if player.baseClass ~= 0 then
		if ((player.level + 1) % 3 == 0 and (player.level + 1) % 2 == 0) then
			secondary = 1
			tertiary = 1
		elseif ((player.level + 1) % 2 == 0) then
			secondary = 1
			tertiary = 0
		elseif ((player.level + 1) % 3 == 0) then
			secondary = 0
			tertiary = 1
		end
	end

	if player.baseClass == 0 then
		-- peasants
		if ((player.level + 1) % 2 == 0) then
			primary = 1
			secondary = 0
			tertiary = 0
		elseif ((player.level + 1) % 3 == 0) then
			primary = 0
			secondary = 1
			tertiary = 1
		elseif ((player.level + 1) % 5 == 0) then
			primary = 0
			secondary = 1
			tertiary = 1
		end
	end

	if (player.level >= 99) then
		return
	end

	if (player.class == 0 and player.level >= 5) then
		player:sendMinitext("You cannot increase your level without choosing a path first.")
		return
	end

	if (player.baseClass == 1) then
		player.baseHealth = player.baseHealth + 140
		player.baseMagic = player.baseMagic + 20
    player.registry["status_points"] = player.registry["status_points"] + 3
    player.level = player.level + 1
	elseif (player.baseClass == 2) then
		player.baseHealth = player.baseHealth + 100
		player.baseMagic = player.baseMagic + 40
    player.registry["status_points"] = player.registry["status_points"] + 3
    player.level = player.level + 1
	elseif (player.baseClass == 3) then
		player.baseHealth = player.baseHealth + 40
		player.baseMagic = player.baseMagic + 90
    player.registry["status_points"] = player.registry["status_points"] + 3
    player.level = player.level + 1
	elseif (player.baseClass == 4) then
		player.baseHealth = player.baseHealth + 60
		player.baseMagic = player.baseMagic + 60
    player.registry["status_points"] = player.registry["status_points"] + 3
    player.level = player.level + 1
	elseif (player.baseClass == 0) then
		player.baseHealth = player.baseHealth + 20
		player.baseMagic = player.baseMagic + 10
	end

	player.level = player.level + 1
	-- player.baseArmor = player.baseArmor - 1

	-- if player.level >= 99 then
		-- player.baseArmor = 1
	-- end

	player:calcStat()
	player.health = player.maxHealth
	player.magic = player.maxMagic
	player:playSound(123)
	player:sendStatus()
	player:sendAnimation(2, 0)
	player:sendMinitext("You have gained new insight.")
	characterLog.levelUpWrite(player, player.level)
end
