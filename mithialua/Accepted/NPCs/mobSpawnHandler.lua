-- local _defaultRates = {
--     -- Newbie
--     ["thirsty_ogre"] = 90,
--     ["kingdom_rat"] = 300,
--     ["green_squirrel"] = {300, 240, 330},
--     ["sheep"] = 240,

--     -- Mythic
--     ["monkey_sentry"] = {300, 300, 300},
--     ["dog_sentry"] = {300, 300, 240},
--     ["rooster_sentry"] = {120, 120, 120},
--     ["rat_sentry"] = {300, 300, 300},
--     ["horse_sentry"] = {300, 300, 210},
--     ["ox_sentry"] = {300, 300, 300},
--     ["pig_sentry"] = {300, 300, 300},
--     ["snake_sentry"] = {115, 115, 115},
--     ["sheep_sentry"] = {300, 300, 300},
--     ["dragon_sentry"] = {300, 300, 300},

--     -- Bosses
--     ["zangze_zinte_chtan_sintu"] = 6000,
--     ["golden_lobster"] = 3600
-- }

-- local _rebalancedRates = {
--     -- Newbie
--     ["thirsty_ogre"] = 90,
--     ["kingdom_rat"] = 300,
--     ["green_squirrel"] = {300, 240, 330},
--     ["sheep"] = 120,

--     -- Mythic
--     ["monkey_sentry"] = {300, 300, 300},
--     ["dog_sentry"] = {300, 300, 240},
--     ["rooster_sentry"] = {120, 120, 120},
--     ["rat_sentry"] = {300, 300, 300},
--     ["horse_sentry"] = {300, 300, 210},
--     ["ox_sentry"] = {300, 300, 300},
--     ["pig_sentry"] = {300, 300, 300},
--     ["snake_sentry"] = {115, 115, 115},
--     ["sheep_sentry"] = {300, 300, 300},
--     ["dragon_sentry"] = {300, 300, 300},

--     -- Bosses
--     ["zangze_zinte_chtan_sintu"] = 1500,
--     ["golden_lobster"] = 900
-- }

-- local _fastRates = {
--     -- Newbie
--     ["thirsty_ogre"] = 30,
--     ["kingdom_rat"] = 60,
--     ["green_squirrel"] = {60, 60, 60},
--     ["sheep"] = 60,

--     -- Mythic
--     ["monkey_sentry"] = {60, 60, 60},
--     ["dog_sentry"] = {60, 60, 60},
--     ["rooster_sentry"] = {60, 60, 60},
--     ["rat_sentry"] = {60, 60, 60},
--     ["horse_sentry"] = {60, 60, 60},
--     ["ox_sentry"] = {60, 60, 60},
--     ["pig_sentry"] = {60, 60, 60},
--     ["snake_sentry"] = {60, 60, 60},
--     ["sheep_sentry"] = {60, 60, 60},
--     ["dragon_sentry"] = {60, 60, 60},

--     -- Bosses
--     ["zangze_zinte_chtan_sintu"] = 600,
--     ["golden_lobster"] = 240
-- }

MobSpawnHandlerNpc = {
	action = function(npc)
		-- local start = os.time() * 1000 + timeMS()
		-- local spawnRates = _defaultRates

		-- if (Config.rebalancedSpawnsEnabled) then
		-- 	spawnRates = _rebalancedRates
		-- end

		-- if (Config.fastSpawnsEnabled) then
		-- 	spawnRates = _fastRates
		-- end

		--(npc,map,{mob ids},{mob counts},timer)

		--handleSpawn = function(npc, map, mobs, maxMobs, timer, spawnMinX, spawnMinY, spawnMaxX, spawnMaxY)

		-------------------
		-- For spy quest --
		-------------------
		-- if os.time() % 60 == 0 then
		-- 	if os.time() > getMapRegistry(npc.m, "hwan") + 60 then
		-- 		-- this will check for the last time he was taken so it doesn't respawn immediately
		-- 		local mob = npc:getObjectsInCell(330, 38, 99, BL_MOB)
		-- 		if #mob == 0 then
		-- 			if (curTime() >= 22 and curTime() <= 24) or (curTime() >= 0 and curTime() <= 5) then
		-- 				npc:spawn(729, 38, 99, 1, 330)
		-- 			end
		-- 		else
		-- 			if curTime() >= 6 and curTime() <= 21 then
		-- 				if mob[1].yname == "spy_hwan" then
		-- 					mob[1]:delete()
		-- 				end
		-- 			end
		-- 		end
		-- 	end
		-- end

    -- field cave 00 rabbit squirrel deer doe
		MobSpawnHandlerNpc.handleSpawn(npc, 102, {1}, {70}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 102, {2}, {70}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 102, {3}, {15}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 102, {4}, {15}, 120)

    -- field cave 01 rat mouse bat big_bat snake mud_snake
		MobSpawnHandlerNpc.handleSpawn(npc, 103, {5}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 103, {6}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 103, {7}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 103, {8}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 103, {9}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 103, {10}, {25}, 120)

    -- field cave 02  warthog bear tiger
		MobSpawnHandlerNpc.handleSpawn(npc, 104, {11}, {35}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 104, {12}, {35}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 104, {13}, {35}, 120)

    -- field cave 03 dark_fox blood_fox nine_tailed_fox
		MobSpawnHandlerNpc.handleSpawn(npc, 105, {14}, {45}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 105, {15}, {45}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 105, {16}, {10}, 120)

    -- field cave 04 vile_scorpion pale_scorpion crimson_scorpion
		MobSpawnHandlerNpc.handleSpawn(npc, 106, {17}, {45}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 106, {18}, {45}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 106, {19}, {10}, 120)

    -- field cave 05  black_skeleton skeleton_mage skeleton_warrior skeleton_rogue skeleton_poet
		MobSpawnHandlerNpc.handleSpawn(npc, 107, {20}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 107, {21}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 107, {22}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 107, {23}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 107, {24}, {25}, 120)

    -- field cave 06  muck_ogre slime_ogre log_ogre hill_ogre
		MobSpawnHandlerNpc.handleSpawn(npc, 108, {25}, {30}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 108, {26}, {30}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 108, {27}, {30}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 108, {28}, {30}, 120)

    -- field cave 07  red_shade blue_shade
		MobSpawnHandlerNpc.handleSpawn(npc, 109, {43}, {50}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 109, {44}, {50}, 120)

    -- field cave 08  star_fire egogo green_ogre horong
		MobSpawnHandlerNpc.handleSpawn(npc, 110, {45}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 110, {46}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 110, {47}, {25}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 110, {48}, {25}, 120)

    -- field cave 09  coral_devourer sea_specter abyssal_serpent shadow_serpent leviathan
		MobSpawnHandlerNpc.handleSpawn(npc, 111, {29}, {30}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 111, {30}, {30}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 111, {31}, {20}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 111, {32}, {20}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 111, {33}, {1}, 600)

    -- field cave 10  nimble_ninja nimble_assasin skilled_ninja skilled_assasin Onyx
		MobSpawnHandlerNpc.handleSpawn(npc, 112, {35}, {30}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 112, {36}, {30}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 112, {37}, {20}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 112, {38}, {20}, 120)
		MobSpawnHandlerNpc.handleSpawn(npc, 112, {39}, {1}, 600)

	end,


	spawnMob = function(npc, map, mobs, maxMobs, timer, spawnMinX, spawnMinY, spawnMaxX, spawnMaxY)
		local minX = 0
		local maxX = getMapXMax(map)
		local minY = 0
		local maxY = getMapYMax(map)

		if (spawnMinX ~= nil and spawnMaxX ~= nil and spawnMinY ~= nil and spawnMaxY ~= nil) then
			minX = spawnMinX
			maxX = spawnMaxX
			minY = spawnMinY
			maxY = spawnMaxY

			if maxX > getMapXMax(map) then
				maxX = getMapXMax(map)
			end
			if maxY > getMapYMax(map) then
				maxY = getMapYMax(map)
			end
		end

		local pc = npc:getObjectsInMap(map, BL_PC)

		--local pc = getMapUsers(map)
		local mobBlocks = npc:getObjectsInMap(map, BL_MOB)

		if (spawnTable[map][mobs[1]] == nil) then
			spawnTable[map][mobs[1]] = 0
		end

		if (os.time() > (spawnTable[map][mobs[1]] + timer) and #pc > 0) then
			--if(os.time() > (getMapRegistry(map,"lastSpawn"..mobs[1]) + timer) and #pc > 0) then
			for z = 1, #mobs do
				local fail = 0
				local mobCount = 0
				if (#mobBlocks > 0) then
					for i = 1, #mobBlocks do
						if (mobBlocks[i].mobID == mobs[z]) then
							mobCount = mobCount + 1
						end
					end
				end

				if (mobCount < maxMobs[z]) then
					repeat
						local spawnX = math.random(minX, maxX)
						local spawnY = math.random(minY, maxY)

						local passCheck = getPass(map, spawnX, spawnY)
						local objCheck = getObject(map, spawnX, spawnY)
						local pcCheck = npc:getObjectsInCell(
							map,
							spawnX,
							spawnY,
							BL_PC
						)
						local mobCheck = npc:getObjectsInCell(
							map,
							spawnX,
							spawnY,
							BL_MOB
						)
						if (passCheck == 0 and #pcCheck == 0 and #mobCheck == 0 and objCheck == 0 and not getWarp(
							map,
							spawnX,
							spawnY
						)) then
							npc:spawn(mobs[z], spawnX, spawnY, 1, map)
							mobCount = mobCount + 1
						else
							fail = fail + 1
							if (fail >= maxMobs[z] * 4) then
								mobCount = maxMobs[z]
							end
						end
					until mobCount >= maxMobs[z]
				end
			end

			--setMapRegistry(map,"lastSpawn"..mobs[1],os.time())
			spawnTable[map][mobs[1]] = os.time()
		else
			if (#mobBlocks == 0) then
				if (os.time() % 10 == 0) then
					local spawnTimer = spawnTable[map][mobs[1]] - 10
					if (spawnTimer > 0) then
						spawnTable[map][mobs[1]] = spawnTimer
					end
				end
			end
		end
	end,

	deleteMob = function(npc, map, mobs, maxMobs, timer, spawnMinX, spawnMinY, spawnMaxX, spawnMaxY)
		local minX = 0
		local maxX = getMapXMax(map)
		local minY = 0
		local maxY = getMapYMax(map)

		if (spawnMinX ~= nil and spawnMaxX ~= nil and spawnMinY ~= nil and spawnMaxY ~= nil) then
			minX = spawnMinX
			maxX = spawnMaxX
			minY = spawnMinY
			maxY = spawnMaxY

			if maxX > getMapXMax(map) then
				maxX = getMapXMax(map)
			end
			if maxY > getMapYMax(map) then
				maxY = getMapYMax(map)
			end
		end

		if (spawnTable[map][mobs[1]] == nil) then
			spawnTable[map][mobs[1]] = 0
		end

		--local pc = getMapUsers(map)
		local pc = npc:getObjectsInMap(map, BL_PC)
		local mobBlocks = {}

		--if(pc == 0 and (os.time() > (getMapRegistry(map,"lastSpawn"..mobs[1]) + timer))) then
		if (#pc == 0 and (os.time() > (spawnTable[map][mobs[1]] + timer))) then
			mobBlocks = npc:getObjectsInMap(map, BL_MOB)

			if (#mobBlocks > 0) then
				for i = 1, #mobBlocks do
					for z = 1, #mobs do
						if (mobBlocks[i] ~= nil) then
							if (mobBlocks[i].mobID == mobs[z] and mobBlocks[i].x >= minX and mobBlocks[i].x <= maxX and mobBlocks[
								i
							].y >= minY and mobBlocks[i].y <= maxY) then
								--mobBlocks[i].attacker = 0
								--mobBlocks[i]:removeHealth(4000000000)
								mobBlocks[i]:delete()
								mobBlocks[i] = nil

								--table.remove(mobBlocks,mobBlocks[i])
								--i=i-1
							end
						end
					end
				end
			end
		end
	end,

	handleSpawn = function(npc, map, mobs, maxMobs, timer, spawnMinX, spawnMinY, spawnMaxX, spawnMaxY)
		MobSpawnHandlerNpc.deleteMob(
			npc,
			map,
			mobs,
			maxMobs,
			timer,
			spawnMinX,
			spawnMinY,
			spawnMaxX,
			spawnMaxY
		)
		MobSpawnHandlerNpc.spawnMob(
			npc,
			map,
			mobs,
			maxMobs,
			timer,
			spawnMinX,
			spawnMinY,
			spawnMaxX,
			spawnMaxY
		)
	end
}
