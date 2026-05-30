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
			rates = {75, 50}
		}
	},
	["mouse"] = {
		loot = {
			items = {"rat_meat", "mica"},
			amounts = {1, 1},
			rates = {75, 50}
		}
	},
	["bat"] = {
		loot = {
			items = {"ginseng_piece", "ginseng"},
			amounts = {1, 1},
			rates = {75, 50}
		}
	},
	["big_bat"] = {
		loot = {
			items = {"ginseng_piece", "ginseng"},
			amounts = {1, 1},
			rates = {75, 50}
		}
	},
	["snake"] = {
		loot = {
			items = {"snake_meat", "fine_snake_meat"},
			amounts = {1, 1},
			rates = {75, 50}
		}
	},
	["mud_snake"] = {
		loot = {
			items = {"snake_meat", "fine_snake_meat"},
			amounts = {1, 1},
			rates = {75, 50}
		}
	},
	--------------
  ["warthog"] = {
		loot = {
			items = {"pork", "rare_pork"},
			amounts = {1, 1},
			rates = {75, 50}
		}
	},
  ["bear"] = {
		loot = {
			items = {"bear_liver", "bear_fur"},
			amounts = {1, 1},
			rates = {75, 50}
		}
	},
  ["tiger"] = {
		loot = {
			items = {"tiger_meat", "tiger_pelt"},
			amounts = {1, 1},
			rates = {75, 50}
		}
	},
  --------------
  ["dark_fox"] = {
		loot = {
			items = {"fox_fur"},
			amounts = {1},
			rates = {75}
		}
	},
  ["blood_fox"] = {
		loot = {
			items = {"red_fox_fur"},
			amounts = {1},
			rates = {75}
		}
	},
  ["nine_tailed_fox"] = {
		loot = {
			items = {"fox_tail"},
			amounts = {1},
			rates = {25}
		}
	},
  --------------
  ["vile_scorpion"] = {
		loot = {
			items = {"topaz"},
			amounts = {1},
			rates = {75}
		}
	},
  ["pale_scorpion"] = {
		loot = {
			items = {"obsidian"},
			amounts = {1},
			rates = {75}
		}
	},
  ["crimson_scorpion"] = {
		loot = {
			items = {"limestone"},
			amounts = {1},
			rates = {25}
		}
	},
  --------------
  ["black_skeleton"] = {
		loot = {
			items = {"ash"},
			amounts = {1},
			rates = {75}
		}
	},
  ["skeleton_mage"] = {
		loot = {
			items = {"ash","mage_bone"},
			amounts = {1, 1},
			rates = {75, 25}
		}
	},
  ["skeleton_warrior"] = {
		loot = {
			items = {"ash","warrior_bone"},
			amounts = {1, 1},
			rates = {75, 25}
		}
	},
  ["skeleton_rogue"] = {
		loot = {
			items = {"ash","rogue_bone"},
			amounts = {1, 1},
			rates = {75, 25}
		}
	},
  ["skeleton_poet"] = {
		loot = {
			items = {"ash","poet_bone"},
			amounts = {1, 1},
			rates = {75, 25}
		}
	},
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
	
	for i = 1, #items do
		local roll = math.random(1, 100000)

		if (amounts[i] > 0 and roll <= rates[i] * 1000) then
      -- mob:dropItem(items[i], 1, 0, 0)
      player:addItem(items[i], 1)
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
