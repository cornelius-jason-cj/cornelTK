-- -------------------------------------------------
-- Note: Actual amount of each drop is a randomly
-- selected number between 1 and the stated amount.
-- -------------------------------------------------
local _mobDropsTable = {
	--------------
	["rabbit"] = {
		loot = {
			items = {"rabbit_meat"},
			amounts = {1},
			rates = {90}
		}
	},
	["squirrel"] = {
		loot = {
			items = {"acorn", "gold_acorn"},
			amounts = {1, 1},
			rates = {90, 25}
		}
	},
	["deer"] = {
		loot = {
			items = {"antler"},
			amounts = {1},
			rates = {75}
		}
	},
	["doe"] = {
		loot = {
			items = {"antler"},
			amounts = {1},
			rates = {75}
		}
	},
	--------------
	["rat"] = {
		loot = {
			items = {"rat_meat", "mica"},
			amounts = {1, 1},
			rates = {50, 25}
		}
	},
	["mouse"] = {
		loot = {
			items = {"rat_meat", "mica"},
			amounts = {1, 1},
			rates = {50, 25}
		}
	},
	["bat"] = {
		loot = {
			items = {"ginseng_piece", "ginseng"},
			amounts = {1, 1},
			rates = {50, 25}
		}
	},
	["big_bat"] = {
		loot = {
			items = {"ginseng_piece", "ginseng"},
			amounts = {1, 1},
			rates = {50, 25}
		}
	},
	["snake"] = {
		loot = {
			items = {"snake_meat", "fine_snake_meat"},
			amounts = {1, 1},
			rates = {50, 25}
		}
	},
	["mud_snake"] = {
		loot = {
			items = {"snake_meat", "fine_snake_meat"},
			amounts = {1, 1},
			rates = {50, 25}
		}
	}
}
-- ------------------------------
-- Common drops
-- ------------------------------
local _handleLoot = function(mob, loot, player)
	if (loot == nil) then
		return
	end

	local items = loot.items
	local amounts = loot.amounts
	local rates = loot.rates
	local karma = math.floor(player.karma / 20)

	-- if player.gmLevel == 50 then
	-- 	print('player karma', karma)
	-- end
	
	for i = 1, #items do
		local roll = math.random(1, 100000)

		if (amounts[i] > 0 and roll <= (rates[i] + karma) * 1000) then
			-- if (type(items[i]) == 'number') then
			-- 	-- Gold
			-- 	if (amounts[i] == 1) then
			-- 		mob:dropItem(0, amounts[i], 0, 0)
			-- 	elseif (amounts[i] >= 2 and amounts[i] <= 99) then
			-- 		mob:dropItem(1, amounts[i], 0, 0)
			-- 	elseif (amounts[i] >= 100 and amounts[i] <= 999) then
			-- 		mob:dropItem(2, amounts[i], 0, 0)
			-- 	elseif (amounts[i] >= 1000) then
			-- 		mob:dropItem(3, amounts[i], 0, 0)
			-- 	end
			-- else
				-- mob:dropItem(items[i], math.random(1, amounts[i]), 0, 0)
				mob:dropItem(items[i], 1, 0, 0)
			-- end

			characterLog.dropLog(mob, items, amounts)
		end
	end
end

-- ------------------------------
-- Rare drops
-- ------------------------------
local _handleRareLoot = function(mob, rareLoot)
	if (rareLoot == nil) then
		return
	end

	local items = rareLoot.items
	local rates = rareLoot.rates
	local droppedItems = {}

	for i = 1, #items do
		local roll = math.random(1, 100000)

		broadcast(4, "Mob: " .. mob.yname .. "; Roll: " .. roll)

		if (roll <= rates[i] * 1000) then
			table.insert(droppedItems, items[i])
		end
	end

	if (#droppedItems > 0) then
		local droppedItem = droppedItems[1]
		mob:dropItem(droppedItem, 1, 0, 0)
		characterLog.dropLog(mob, {droppedItem}, {1})
	end
end


-- ------------------------------
-- Mob drops handler
-- ------------------------------
HandleMobDrops = function(player, mob)
	if player.blType ~= BL_PC then
		return
	end

	local mobName = mob.yname

	if (Tools.tableContainsKey(_mobDropsTable, mobName)) then
		local loot = _mobDropsTable[mobName].loot
		_handleLoot(mob, loot, player)
	end
end
