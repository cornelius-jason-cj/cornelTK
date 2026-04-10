local _defaultRates = {
    -- Newbie
    ["thirsty_ogre"] = 90,
    ["kingdom_rat"] = 300,
	["green_squirrel"] = {300, 240, 330},
	["sheep"] = 240,

    -- Mythic
    ["monkey_sentry"] = {300, 300, 300},
    ["dog_sentry"] = {300, 300, 240},
    ["rooster_sentry"] = {120, 120, 120},
    ["rat_sentry"] = {300, 300, 300},
    ["horse_sentry"] = {300, 300, 210},
    ["ox_sentry"] = {300, 300, 300},
    ["pig_sentry"] = {300, 300, 300},
    ["snake_sentry"] = {115, 115, 115},
    ["sheep_sentry"] = {300, 300, 300},
    ["dragon_sentry"] = {300, 300, 300},

    -- Bosses
    ["zangze_zinte_chtan_sintu"] = 6000,
    ["golden_lobster"] = 3600
}

local _rebalancedRates = {
    -- Newbie
    ["thirsty_ogre"] = 90,
    ["kingdom_rat"] = 300,
	["green_squirrel"] = {300, 240, 330},
	["sheep"] = 120,

    -- Mythic
    ["monkey_sentry"] = {300, 300, 300},
    ["dog_sentry"] = {300, 300, 240},
    ["rooster_sentry"] = {120, 120, 120},
    ["rat_sentry"] = {300, 300, 300},
    ["horse_sentry"] = {300, 300, 210},
    ["ox_sentry"] = {300, 300, 300},
    ["pig_sentry"] = {300, 300, 300},
    ["snake_sentry"] = {115, 115, 115},
    ["sheep_sentry"] = {300, 300, 300},
    ["dragon_sentry"] = {300, 300, 300},

    -- Bosses
    ["zangze_zinte_chtan_sintu"] = 1500,
    ["golden_lobster"] = 900
}

local _fastRates = {
    -- Newbie
    ["thirsty_ogre"] = 30,
    ["kingdom_rat"] = 60,
	["green_squirrel"] = {60, 60, 60},
	["sheep"] = 60,

    -- Mythic
    ["monkey_sentry"] = {60, 60, 60},
    ["dog_sentry"] = {60, 60, 60},
    ["rooster_sentry"] = {60, 60, 60},
    ["rat_sentry"] = {60, 60, 60},
    ["horse_sentry"] = {60, 60, 60},
    ["ox_sentry"] = {60, 60, 60},
    ["pig_sentry"] = {60, 60, 60},
    ["snake_sentry"] = {60, 60, 60},
    ["sheep_sentry"] = {60, 60, 60},
    ["dragon_sentry"] = {60, 60, 60},

    -- Bosses
    ["zangze_zinte_chtan_sintu"] = 600,
    ["golden_lobster"] = 240
}

MobSpawnHandlerNpc = {
	action = function(npc)
		local start = os.time() * 1000 + timeMS()
		local spawnRates = _defaultRates

		if (Config.rebalancedSpawnsEnabled) then
			spawnRates = _rebalancedRates
		end

		if (Config.fastSpawnsEnabled) then
			spawnRates = _fastRates
		end

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

		-- MobSpawnHandlerNpc.handleSpawn(npc, 201, {3}, {15}, 120)
		-- MobSpawnHandlerNpc.handleSpawn(npc, 101, {4}, {30}, 300)
		-- field 01
		MobSpawnHandlerNpc.handleSpawn(npc, 201, {3}, {15}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 201, {4}, {15}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 201, {5}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 201, {6}, {10}, 150)
		-- sewer 01
		MobSpawnHandlerNpc.handleSpawn(npc, 300, {7}, {15}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 300, {8}, {15}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 300, {9}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 300, {10}, {10}, 150)


		-- field 02
		MobSpawnHandlerNpc.handleSpawn(npc, 202, {3}, {7}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 202, {4}, {7}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 202, {5}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 202, {6}, {5}, 150)
		-- bat 01
		MobSpawnHandlerNpc.handleSpawn(npc, 301, {11}, {15}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 301, {12}, {15}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 301, {13}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 301, {14}, {10}, 150)


		-- field 03
		MobSpawnHandlerNpc.handleSpawn(npc, 203, {3}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 203, {4}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 203, {5}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 203, {6}, {5}, 150)
		-- snake 01
		MobSpawnHandlerNpc.handleSpawn(npc, 302, {15}, {15}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 302, {16}, {15}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 302, {17}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 302, {18}, {10}, 150)


		-- field 04
		MobSpawnHandlerNpc.handleSpawn(npc, 204, {3}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 204, {4}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 204, {5}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 204, {6}, {5}, 150)
		-- bear 01
		MobSpawnHandlerNpc.handleSpawn(npc, 303, {21}, {6}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 303, {22}, {12}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 303, {23}, {6}, 150)
		-- bear 02
		MobSpawnHandlerNpc.handleSpawn(npc, 304, {21}, {6}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 304, {22}, {12}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 304, {23}, {6}, 150)


		-- field 05
		MobSpawnHandlerNpc.handleSpawn(npc, 205, {3}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 205, {4}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 205, {5}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 205, {6}, {5}, 150)
		-- tiger 01
		MobSpawnHandlerNpc.handleSpawn(npc, 305, {24}, {8}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 305, {25}, {8}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 305, {26}, {8}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 305, {27}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 305, {28}, {5}, 150)
		-- tiger 02
		MobSpawnHandlerNpc.handleSpawn(npc, 306, {24}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 306, {25}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 306, {26}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 306, {27}, {12}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 306, {28}, {12}, 150)


		-- field 06
		MobSpawnHandlerNpc.handleSpawn(npc, 206, {3}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 206, {4}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 206, {5}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 206, {6}, {5}, 150)
		-- Ghost Cave 01
		MobSpawnHandlerNpc.handleSpawn(npc, 313, {41}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 313, {42}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 313, {43}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 313, {44}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 313, {47}, {2}, 150)
		-- Ghost Cave 02
		MobSpawnHandlerNpc.handleSpawn(npc, 314, {41}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 314, {42}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 314, {45}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 314, {46}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 314, {47}, {2}, 150)


		-- field 07
		-- MobSpawnHandlerNpc.handleSpawn(npc, 207, {48}, {15}, 150)
		-- MobSpawnHandlerNpc.handleSpawn(npc, 207, {49}, {15}, 150)
		-- Haunted House 01
		MobSpawnHandlerNpc.handleSpawn(npc, 317, {50}, {8}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 317, {51}, {8}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 317, {52}, {8}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 317, {53}, {8}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 317, {54}, {8}, 150)
		-- Haunted House 02
		MobSpawnHandlerNpc.handleSpawn(npc, 318, {50}, {8}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 318, {51}, {8}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 318, {52}, {8}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 318, {53}, {8}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 318, {54}, {8}, 150)



		-- field 08
		MobSpawnHandlerNpc.handleSpawn(npc, 208, {3}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 208, {4}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 208, {5}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 208, {6}, {5}, 150)
		-- field 09
		MobSpawnHandlerNpc.handleSpawn(npc, 209, {3}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 209, {4}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 209, {5}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 209, {6}, {5}, 150)
		-- Fox Cave 01
		MobSpawnHandlerNpc.handleSpawn(npc, 307, {29}, {20}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 307, {30}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 307, {31}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 307, {32}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 307, {55}, {1}, 300)
		-- Fox Cave 02
		MobSpawnHandlerNpc.handleSpawn(npc, 308, {29}, {20}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 308, {30}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 308, {31}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 308, {32}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 308, {55}, {1}, 300)

		-- field 10
		MobSpawnHandlerNpc.handleSpawn(npc, 210, {3}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 210, {4}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 210, {5}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 210, {6}, {5}, 150)
		-- Scorpion 01
		MobSpawnHandlerNpc.handleSpawn(npc, 309, {33}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 309, {34}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 309, {35}, {10}, 150)
		-- Scorpion 02
		MobSpawnHandlerNpc.handleSpawn(npc, 310, {33}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 310, {34}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 310, {35}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 310, {36}, {1}, 300)

		-- field 11
		MobSpawnHandlerNpc.handleSpawn(npc, 211, {3}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 211, {4}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 211, {5}, {5}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 211, {6}, {5}, 150)
		-- Lobster 01
		MobSpawnHandlerNpc.handleSpawn(npc, 311, {37}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 311, {38}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 311, {39}, {10}, 150)
		-- Lobster 02
		MobSpawnHandlerNpc.handleSpawn(npc, 312, {37}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 312, {38}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 312, {39}, {10}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 312, {40}, {1}, 300)


		-- Skeleton 01
		MobSpawnHandlerNpc.handleSpawn(npc, 315, {227}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 315, {233}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 315, {230}, {1}, 300)
		MobSpawnHandlerNpc.handleSpawn(npc, 315, {232}, {1}, 300)
		MobSpawnHandlerNpc.handleSpawn(npc, 316, {235}, {1}, 300)
		-- Skeleton 01
		MobSpawnHandlerNpc.handleSpawn(npc, 316, {228}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 316, {234}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 315, {230}, {1}, 300)
		MobSpawnHandlerNpc.handleSpawn(npc, 316, {232}, {1}, 300)
		MobSpawnHandlerNpc.handleSpawn(npc, 316, {235}, {1}, 300)


		-- Dark Crypt 01
		MobSpawnHandlerNpc.handleSpawn(npc, 320, {236}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 320, {243}, {18}, 150)
		-- Dark Crypt 02
		MobSpawnHandlerNpc.handleSpawn(npc, 321, {236}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 321, {244}, {18}, 150)
		-- Dark Crypt 03
		MobSpawnHandlerNpc.handleSpawn(npc, 322, {236}, {12}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 322, {243}, {12}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 322, {244}, {12}, 150)

		
		-- Vio Crypt 01
		MobSpawnHandlerNpc.handleSpawn(npc, 323, {237}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 323, {245}, {18}, 150)
		-- Vio Crypt 02
		MobSpawnHandlerNpc.handleSpawn(npc, 324, {237}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 324, {246}, {18}, 150)
		-- Vio Crypt 03
		MobSpawnHandlerNpc.handleSpawn(npc, 325, {237}, {12}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 325, {245}, {12}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 325, {246}, {12}, 150)
		
		-- Brown Den
		MobSpawnHandlerNpc.handleSpawn(npc, 326, {252}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 327, {253}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 328, {254}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 329, {255}, {22}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 330, {256}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 331, {257}, {24}, 150)
		-- White Den
		MobSpawnHandlerNpc.handleSpawn(npc, 332, {213}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 333, {214}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 334, {215}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 335, {216}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 336, {217}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 337, {212}, {4}, 150)


		-- Mythic Rabbit 1
		MobSpawnHandlerNpc.handleSpawn(npc, 338, {56}, {30}, 150)
		-- Mythic Rabbit 2
		MobSpawnHandlerNpc.handleSpawn(npc, 339, {57}, {30}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 339, {63}, {1}, 300)
		-- Mythic Rabbit 3
		MobSpawnHandlerNpc.handleSpawn(npc, 340, {58}, {30}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 340, {64}, {1}, 300)
		-- Mythic Rabbit 4
		MobSpawnHandlerNpc.handleSpawn(npc, 341, {59}, {30}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 341, {65}, {1}, 300)
		-- Mythic Rabbit 5
		MobSpawnHandlerNpc.handleSpawn(npc, 342, {60}, {30}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 342, {66}, {1}, 300)
		-- Mythic Rabbit 6
		MobSpawnHandlerNpc.handleSpawn(npc, 343, {61}, {30}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 343, {67}, {1}, 300)
		-- Mythic Rabbit 7
		MobSpawnHandlerNpc.handleSpawn(npc, 344, {62}, {30}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 344, {68}, {1}, 300)
		-- Mythic Rabbit 8
		MobSpawnHandlerNpc.handleSpawn(npc, 345, {56}, {30}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 345, {69}, {1}, 300)

		-- Mythic Monkey 1
		MobSpawnHandlerNpc.handleSpawn(npc, 346, {70}, {25}, 150)
		-- Mythic Monkey 2
		MobSpawnHandlerNpc.handleSpawn(npc, 347, {71}, {25}, 150)
		-- Mythic Monkey 3
		MobSpawnHandlerNpc.handleSpawn(npc, 348, {72}, {25}, 150)
		-- Mythic Monkey 4
		MobSpawnHandlerNpc.handleSpawn(npc, 349, {73}, {25}, 150)
		-- Mythic Monkey 5
		MobSpawnHandlerNpc.handleSpawn(npc, 350, {74}, {25}, 150)
		-- Mythic Monkey 6
		MobSpawnHandlerNpc.handleSpawn(npc, 351, {75}, {25}, 150)
		-- Mythic Monkey 7
		MobSpawnHandlerNpc.handleSpawn(npc, 352, {76}, {25}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 352, {80}, {2}, 300)
		-- Mythic Monkey 8
		MobSpawnHandlerNpc.handleSpawn(npc, 353, {77}, {25}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 353, {81}, {2}, 300)
		-- Mythic Monkey 9
		MobSpawnHandlerNpc.handleSpawn(npc, 354, {78}, {25}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 354, {82}, {2}, 300)
		-- Mythic Monkey 10
		MobSpawnHandlerNpc.handleSpawn(npc, 355, {79}, {25}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 355, {83}, {2}, 300)


		-- Mythic Dog 1
		MobSpawnHandlerNpc.handleSpawn(npc, 356, {84}, {25}, 150)
		-- Mythic Dog 2
		MobSpawnHandlerNpc.handleSpawn(npc, 357, {85}, {25}, 150)
		-- Mythic Dog 3
		MobSpawnHandlerNpc.handleSpawn(npc, 358, {86}, {25}, 150)
		-- Mythic Dog 4
		MobSpawnHandlerNpc.handleSpawn(npc, 359, {87}, {25}, 150)
		-- Mythic Dog 5
		MobSpawnHandlerNpc.handleSpawn(npc, 360, {88}, {25}, 150)
		-- Mythic Dog 6
		MobSpawnHandlerNpc.handleSpawn(npc, 361, {89}, {25}, 150)
		-- Mythic Dog 7
		MobSpawnHandlerNpc.handleSpawn(npc, 362, {90}, {25}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 362, {94}, {2}, 300)
		-- Mythic Dog 8
		MobSpawnHandlerNpc.handleSpawn(npc, 363, {91}, {25}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 363, {95}, {2}, 300)
		-- Mythic Dog 9
		MobSpawnHandlerNpc.handleSpawn(npc, 364, {92}, {25}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 364, {96}, {2}, 300)
		-- Mythic Dog 10
		MobSpawnHandlerNpc.handleSpawn(npc, 365, {93}, {25}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 365, {97}, {2}, 300)


		-- Mythic Rooster 1
		MobSpawnHandlerNpc.handleSpawn(npc, 374, {113}, {26}, 150)
		-- Mythic Rooster 2
		MobSpawnHandlerNpc.handleSpawn(npc, 375, {114}, {26}, 150)
		-- Mythic Rooster 3
		MobSpawnHandlerNpc.handleSpawn(npc, 376, {115}, {26}, 150)
		-- Mythic Rooster 4
		MobSpawnHandlerNpc.handleSpawn(npc, 377, {116}, {26}, 150)
		-- Mythic Rooster 5
		MobSpawnHandlerNpc.handleSpawn(npc, 378, {117}, {26}, 150)
		-- Mythic Rooster 6
		MobSpawnHandlerNpc.handleSpawn(npc, 379, {118}, {26}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 379, {122}, {2}, 300)
		-- Mythic Rooster 7
		MobSpawnHandlerNpc.handleSpawn(npc, 380, {119}, {26}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 380, {123}, {2}, 300)
		-- Mythic Rooster 8
		MobSpawnHandlerNpc.handleSpawn(npc, 381, {120}, {26}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 381, {124}, {2}, 300)
		-- Mythic Rooster 9
		MobSpawnHandlerNpc.handleSpawn(npc, 382, {121}, {26}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 382, {125}, {2}, 300)

		
		-- Mythic Rat 1
		MobSpawnHandlerNpc.handleSpawn(npc, 366, {98}, {24}, 150)
		-- Mythic Rat 2
		MobSpawnHandlerNpc.handleSpawn(npc, 367, {99}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 367, {106}, {2}, 300)
		-- Mythic Rat 3
		MobSpawnHandlerNpc.handleSpawn(npc, 368, {100}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 368, {107}, {2}, 300)
		-- Mythic Rat 4
		MobSpawnHandlerNpc.handleSpawn(npc, 369, {101}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 369, {108}, {2}, 300)
		-- Mythic Rat 5
		MobSpawnHandlerNpc.handleSpawn(npc, 370, {102}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 370, {109}, {2}, 300)
		-- Mythic Rat 6
		MobSpawnHandlerNpc.handleSpawn(npc, 371, {103}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 371, {110}, {2}, 300)
		-- Mythic Rat 7
		MobSpawnHandlerNpc.handleSpawn(npc, 372, {104}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 372, {111}, {2}, 300)
		-- Mythic Rat 8
		MobSpawnHandlerNpc.handleSpawn(npc, 373, {105}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 373, {112}, {2}, 300)
		
		
		-- Mythic Horse 1
		MobSpawnHandlerNpc.handleSpawn(npc, 383, {126}, {24}, 150)
		-- Mythic Horse 2
		MobSpawnHandlerNpc.handleSpawn(npc, 384, {127}, {24}, 150)
		-- Mythic Horse 3
		MobSpawnHandlerNpc.handleSpawn(npc, 385, {128}, {24}, 150)
		-- Mythic Horse 4
		MobSpawnHandlerNpc.handleSpawn(npc, 386, {129}, {24}, 150)
		-- Mythic Horse 5
		MobSpawnHandlerNpc.handleSpawn(npc, 387, {130}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 387, {135}, {2}, 300)
		-- Mythic Horse 6
		MobSpawnHandlerNpc.handleSpawn(npc, 388, {131}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 388, {136}, {2}, 300)
		-- Mythic Horse 7
		MobSpawnHandlerNpc.handleSpawn(npc, 389, {132}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 389, {137}, {2}, 300)
		-- Mythic Horse 8
		MobSpawnHandlerNpc.handleSpawn(npc, 390, {133}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 390, {138}, {2}, 300)
		-- Mythic Horse 9
		MobSpawnHandlerNpc.handleSpawn(npc, 391, {134}, {24}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 391, {139}, {2}, 300)
		
		
		-- Mythic Ox 1
		MobSpawnHandlerNpc.handleSpawn(npc, 392, {140}, {22}, 150)
		-- Mythic Ox 2
		MobSpawnHandlerNpc.handleSpawn(npc, 393, {141}, {22}, 150)
		-- Mythic Ox 3
		MobSpawnHandlerNpc.handleSpawn(npc, 394, {141}, {22}, 150)
		-- Mythic Ox 4
		MobSpawnHandlerNpc.handleSpawn(npc, 395, {142}, {22}, 150)
		-- Mythic Ox 5
		MobSpawnHandlerNpc.handleSpawn(npc, 396, {142}, {22}, 150)
		-- Mythic Ox 6
		MobSpawnHandlerNpc.handleSpawn(npc, 397, {143}, {22}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 397, {146}, {2}, 300)
		-- Mythic Ox 7
		MobSpawnHandlerNpc.handleSpawn(npc, 398, {143}, {22}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 398, {147}, {2}, 300)
		-- Mythic Ox 8
		MobSpawnHandlerNpc.handleSpawn(npc, 399, {144}, {22}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 399, {148}, {2}, 300)
		-- Mythic Ox 9
		MobSpawnHandlerNpc.handleSpawn(npc, 400, {144}, {22}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 400, {149}, {2}, 300)
		-- Mythic Ox 10
		MobSpawnHandlerNpc.handleSpawn(npc, 401, {145}, {22}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 401, {150}, {2}, 300)
		-- Mythic Ox 11
		MobSpawnHandlerNpc.handleSpawn(npc, 402, {145}, {2}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 402, {151}, {2}, 300)


		-- Mythic Pig 1
		MobSpawnHandlerNpc.handleSpawn(npc, 403, {152}, {22}, 150)
		-- Mythic Pig 2
		MobSpawnHandlerNpc.handleSpawn(npc, 404, {153}, {22}, 150)
		-- Mythic Pig 3
		MobSpawnHandlerNpc.handleSpawn(npc, 405, {154}, {22}, 150)
		-- Mythic Pig 4
		MobSpawnHandlerNpc.handleSpawn(npc, 406, {155}, {22}, 150)
		-- Mythic Pig 5
		MobSpawnHandlerNpc.handleSpawn(npc, 407, {156}, {22}, 150)
		-- Mythic Pig 6
		MobSpawnHandlerNpc.handleSpawn(npc, 408, {157}, {22}, 150)
		-- Mythic Pig 7
		MobSpawnHandlerNpc.handleSpawn(npc, 409, {158}, {22}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 409, {162}, {2}, 300)
		-- Mythic Pig 8
		MobSpawnHandlerNpc.handleSpawn(npc, 410, {159}, {22}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 410, {163}, {2}, 300)
		-- Mythic Pig 9
		MobSpawnHandlerNpc.handleSpawn(npc, 411, {160}, {22}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 411, {164}, {2}, 300)
		-- Mythic Pig 10
		MobSpawnHandlerNpc.handleSpawn(npc, 412, {161}, {22}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 412, {165}, {2}, 300)

		
		-- Mythic Snake 1
		MobSpawnHandlerNpc.handleSpawn(npc, 413, {166}, {20}, 150)
		-- Mythic Snake 2
		MobSpawnHandlerNpc.handleSpawn(npc, 414, {167}, {20}, 150)
		-- Mythic Snake 3
		MobSpawnHandlerNpc.handleSpawn(npc, 415, {168}, {20}, 150)
		-- Mythic Snake 4
		MobSpawnHandlerNpc.handleSpawn(npc, 416, {169}, {20}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 416, {174}, {2}, 300)
		-- Mythic Snake 5
		MobSpawnHandlerNpc.handleSpawn(npc, 417, {170}, {20}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 417, {175}, {2}, 300)
		-- Mythic Snake 6
		MobSpawnHandlerNpc.handleSpawn(npc, 418, {171}, {20}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 418, {176}, {2}, 300)
		-- Mythic Snake 7
		MobSpawnHandlerNpc.handleSpawn(npc, 419, {172}, {20}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 419, {177}, {2}, 300)
		-- Mythic Snake 8
		MobSpawnHandlerNpc.handleSpawn(npc, 420, {173}, {20}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 420, {178}, {2}, 300)
		-- Mythic Snake 9
		MobSpawnHandlerNpc.handleSpawn(npc, 421, {173}, {20}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 421, {179}, {2}, 300)

		
		-- Mythic Sheep 1
		MobSpawnHandlerNpc.handleSpawn(npc, 422, {180}, {18}, 150)
		-- Mythic Sheep 2
		MobSpawnHandlerNpc.handleSpawn(npc, 423, {180}, {18}, 150)
		-- Mythic Sheep 3
		MobSpawnHandlerNpc.handleSpawn(npc, 424, {180}, {18}, 150)
		-- Mythic Sheep 4
		MobSpawnHandlerNpc.handleSpawn(npc, 425, {181}, {18}, 150)
		-- Mythic Sheep 5
		MobSpawnHandlerNpc.handleSpawn(npc, 426, {181}, {18}, 150)
		-- Mythic Sheep 6
		MobSpawnHandlerNpc.handleSpawn(npc, 427, {181}, {18}, 150)
		-- Mythic Sheep 7
		MobSpawnHandlerNpc.handleSpawn(npc, 428, {182}, {18}, 150)
		-- Mythic Sheep 8
		MobSpawnHandlerNpc.handleSpawn(npc, 429, {182}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 429, {184}, {2}, 300)
		-- Mythic Sheep 9
		MobSpawnHandlerNpc.handleSpawn(npc, 430, {182}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 430, {185}, {2}, 300)
		-- Mythic Sheep 10
		MobSpawnHandlerNpc.handleSpawn(npc, 431, {182}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 431, {186}, {2}, 300)
		-- Mythic Sheep 11
		MobSpawnHandlerNpc.handleSpawn(npc, 432, {183}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 432, {187}, {2}, 300)
		-- Mythic Sheep 12
		MobSpawnHandlerNpc.handleSpawn(npc, 433, {183}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 433, {188}, {2}, 300)
		-- Mythic Sheep 13
		MobSpawnHandlerNpc.handleSpawn(npc, 435, {183}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 435, {189}, {2}, 300)

		
		
		-- Mythic Tiger 1
		MobSpawnHandlerNpc.handleSpawn(npc, 437, {190}, {18}, 150)
		-- Mythic Tiger 2
		MobSpawnHandlerNpc.handleSpawn(npc, 438, {191}, {18}, 150)
		-- Mythic Tiger 3
		MobSpawnHandlerNpc.handleSpawn(npc, 439, {192}, {18}, 150)
		-- Mythic Tiger 4
		MobSpawnHandlerNpc.handleSpawn(npc, 440, {192}, {18}, 150)
		-- Mythic Tiger 5
		MobSpawnHandlerNpc.handleSpawn(npc, 441, {193}, {18}, 150)
		-- Mythic Tiger 6
		MobSpawnHandlerNpc.handleSpawn(npc, 442, {193}, {18}, 150)
		-- Mythic Tiger 7
		MobSpawnHandlerNpc.handleSpawn(npc, 443, {194}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 443, {196}, {2}, 300)
		-- Mythic Tiger 8
		MobSpawnHandlerNpc.handleSpawn(npc, 444, {194}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 444, {197}, {2}, 300)
		-- Mythic Tiger 9
		MobSpawnHandlerNpc.handleSpawn(npc, 445, {195}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 445, {198}, {2}, 300)
		-- Mythic Tiger 10
		MobSpawnHandlerNpc.handleSpawn(npc, 446, {195}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 446, {199}, {2}, 300)

		
		
		-- Mythic Dragon 1
		MobSpawnHandlerNpc.handleSpawn(npc, 447, {200}, {18}, 150)
		-- Mythic Dragon 2
		MobSpawnHandlerNpc.handleSpawn(npc, 448, {201}, {18}, 150)
		-- Mythic Dragon 3
		MobSpawnHandlerNpc.handleSpawn(npc, 449, {202}, {18}, 150)
		-- Mythic Dragon 4
		MobSpawnHandlerNpc.handleSpawn(npc, 450, {203}, {18}, 150)
		-- Mythic Dragon 5
		MobSpawnHandlerNpc.handleSpawn(npc, 451, {204}, {18}, 150)
		-- Mythic Dragon 6
		MobSpawnHandlerNpc.handleSpawn(npc, 452, {205}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 452, {208}, {2}, 300)
		-- Mythic Dragon 7
		MobSpawnHandlerNpc.handleSpawn(npc, 453, {206}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 453, {209}, {2}, 300)
		-- Mythic Dragon 8
		MobSpawnHandlerNpc.handleSpawn(npc, 454, {207}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 454, {210}, {2}, 300)
		-- Mythic Dragon 9
		MobSpawnHandlerNpc.handleSpawn(npc, 455, {207}, {18}, 150)
		MobSpawnHandlerNpc.handleSpawn(npc, 455, {211}, {2}, 300)

		broadcast(4, "Mob Spawn: " .. (os.time() * 1000 + timeMS()) - start)
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
