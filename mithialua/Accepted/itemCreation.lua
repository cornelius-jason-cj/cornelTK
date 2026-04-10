itemCreation = async(function(player)
	local items = {}
	local itemAmounts = {}
	local defaultChance = 50
	local playerKarma = player.karma / 10
	local successChance = math.floor(defaultChance + playerKarma)

	local i = 1
	while i < #creationItems do
		table.insert(items, Item(creationItems[i]).yname)
		table.insert(itemAmounts, creationItems[i + 1])
		i = i + 2
	end

	local itemsCreated = {
		"splendid_bear_fur",
		"splendid_tiger_pelt",
		"amethyst",
		"warrior_seal",
		"rogue_seal",
		"mage_seal",
		"poet_seal",
		"well_crafted_amber",
		"well_crafted_dark_amber",
		"well_crafted_white_amber",
		"well_crafted_yellow_amber",
		"farmer_helm",
		"royal_helm",
		"sky_helm",
		"ancient_helm",
		"blood_helm",
		"earth_helm",
		"chung_ryong_helm",
		"baekho_helm",
		"ju_jak_helm",
		"hyun_moo_helm",
	}

	local takeItem, takeAmountReq, giveItem
	local success = false

	for i = 1, #itemsCreated do
		itemReq, itemAmountReq = getItemsForItemCreation(itemsCreated[i])

		if itemReq ~= nil then
			local count = 0
			for j = 1, #itemReq do
				for k = 1, #items do
					if items[k] == itemReq[j] and itemAmounts[k] >= itemAmountReq[j] then
						count = count + 1
						break
					end
				end
			end

			if count == #itemReq then
				takeItem = itemReq
				takeAmountReq = itemAmountReq
				giveItem = itemsCreated[i]
				success = true
				break
			end
		end
	end

	if success == false then
		player:sendMinitext("Wrong Ingredients!")
	end

	if success and math.random(100) <= successChance then
		for i = 1, #takeItem do
			player:removeItem(takeItem[i], takeAmountReq[i])
		end
		player:addItem(giveItem, 1)
		player:sendAnimation(266)
		player:playSound(123)
		player:sendMinitext("You were successful!")
		if (giveItem == 'chung_ryong_helm') then
			broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has successfully created a Chung Ryong Helm!"
            )
			return
		end

		if (giveItem == 'baekho_helm') then
			broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has successfully created a Baekho Helm"
            )
			return
		end

		if (giveItem == 'ju_jak_helm') then
			broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has successfully created a Ju Jak Helm"
            )
			return
		end

		if (giveItem == 'hyun_moo_helm') then
			broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has successfully created a Hyun Moo Helm"
            )
			return
		end
		
	else
		for i = 1, #takeItem do
			if takeItem[i] == 'ancient_helm' or
			takeItem[i] == 'blood_helm' or
			takeItem[i] == 'earth_helm' then
				
			else
				player:removeItem(takeItem[i], takeAmountReq[i])
			end
		end
		player:sendAnimation(267)
		player:playSound(301)
		player:sendMinitext("You were unsuccessful.")
	end
end)

getItemsForItemCreation = function(itemsCreated)
	local items = {}
	local itemAmounts = {}

	if itemsCreated == "splendid_bear_fur" then
		items = {"bear_fur", "bears_liver"}
		itemAmounts = {25, 25}
	elseif itemsCreated == "splendid_tiger_pelt" then
		items = {"tiger_pelt", "tigers_heart"}
		itemAmounts = {25, 25}
	elseif itemsCreated == "amethyst" then
		items = {"fox_fur", "red_fox_fur", "fox_tail"}
		itemAmounts = {25, 25, 2}
	elseif itemsCreated == "warrior_seal" then
		items = {"ash", "warrior_bone"}
		itemAmounts = {5, 2}
	elseif itemsCreated == "rogue_seal" then
		items = {"ash", "rogue_bone"}
		itemAmounts = {5, 2}
	elseif itemsCreated == "mage_seal" then
		items = {"ash", "mage_bone"}
		itemAmounts = {5, 2}
	elseif itemsCreated == "poet_seal" then
		items = {"ash", "poet_bone"}
		itemAmounts = {5, 2}
	elseif itemsCreated == "well_crafted_amber" then
		items = {"tarnished_amber", "crafted_amber"}
		itemAmounts = {200, 50}
	elseif itemsCreated == "well_crafted_dark_amber" then
		items = {"tarnished_dark_amber", "crafted_dark_amber"}
		itemAmounts = {200, 50}
	elseif itemsCreated == "well_crafted_white_amber" then
		items = {"tarnished_white_amber", "crafted_white_amber"}
		itemAmounts = {200, 50}
	elseif itemsCreated == "well_crafted_yellow_amber" then
		items = {"tarnished_yellow_amber", "crafted_yellow_amber"}
		itemAmounts = {200, 50}
	elseif itemsCreated == "farmer_helm" then
		items = {"merchant_helm", "ore", "metal"}
		itemAmounts = {1, 200, 200}
	elseif itemsCreated == "royal_helm" then
		items = {"farmer_helm", "ore", "metal"}
		itemAmounts = {1, 200, 200}
	elseif itemsCreated == "sky_helm" then
		items = {"royal_helm", "ore", "metal"}
		itemAmounts = {1, 200, 200}
	elseif itemsCreated == "ancient_helm" then
		items = {"sky_helm", "ore", "metal"}
		itemAmounts = {1, 200, 200}
	elseif itemsCreated == "blood_helm" then
		items = {"ancient_helm", "ore", "metal"}
		itemAmounts = {1, 200, 200}
	elseif itemsCreated == "earth_helm" then
		items = {"blood_helm", "ore", "metal"}
		itemAmounts = {1, 200, 200}
	elseif itemsCreated == "chung_ryong_helm" then
		items = {"earth_helm", "chung_ryong_key", "warrior_bone", "ore", "metal"}
		itemAmounts = {1, 10, 100, 200, 200}
	elseif itemsCreated == "baekho_helm" then
		items = {"earth_helm", "baekho_key", "rogue_bone", "ore", "metal"}
		itemAmounts = {1, 10, 100, 200, 200}
	elseif itemsCreated == "ju_jak_helm" then
		items = {"earth_helm", "ju_jak_key", "mage_bone", "ore", "metal"}
		itemAmounts = {1, 10, 100, 200, 200}
	elseif itemsCreated == "hyun_moo_helm" then
		items = {"earth_helm", "hyun_moo_key", "poet_bone", "ore", "metal"}
		itemAmounts = {1, 10, 100, 200, 200}
	end

	return items, itemAmounts
end
