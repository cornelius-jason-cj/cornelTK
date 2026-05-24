itemCreation = async(function(player)
	-- local items = {}
	-- local itemAmounts = {}
	-- local defaultChance = 50
	-- local playerKarma = player.karma / 10
	-- local successChance = math.floor(defaultChance + playerKarma)

	-- local i = 1
	-- while i < #creationItems do
	-- 	table.insert(items, Item(creationItems[i]).yname)
	-- 	table.insert(itemAmounts, creationItems[i + 1])
	-- 	i = i + 2
	-- end

	-- local itemsCreated = {
  --   "basic_armor_essence",
  --   "basic_weapon_essence",
	-- }

	-- local takeItem, takeAmountReq, giveItem
	-- local success = false

	-- for i = 1, #itemsCreated do
	-- 	itemReq, itemAmountReq = getItemsForItemCreation(itemsCreated[i])

	-- 	if itemReq ~= nil then
	-- 		local count = 0
	-- 		for j = 1, #itemReq do
	-- 			for k = 1, #items do
	-- 				if items[k] == itemReq[j] and itemAmounts[k] >= itemAmountReq[j] then
	-- 					count = count + 1
	-- 					break
	-- 				end
	-- 			end
	-- 		end

	-- 		if count == #itemReq then
	-- 			takeItem = itemReq
	-- 			takeAmountReq = itemAmountReq
	-- 			giveItem = itemsCreated[i]
	-- 			success = true
	-- 			break
	-- 		end
	-- 	end
	-- end

	-- if success == false then
	-- 	player:sendMinitext("Wrong Ingredients!")
	-- end

	-- if success and math.random(100) <= successChance then
	-- 	for i = 1, #takeItem do
	-- 		player:removeItem(takeItem[i], takeAmountReq[i])
	-- 	end
	-- 	player:addItem(giveItem, 1)
	-- 	player:sendAnimation(266)
	-- 	player:playSound(123)
	-- 	player:sendMinitext("You were successful!")
    
	-- 	if (giveItem == 'chung_ryong_helm') then
	-- 		broadcast(
  --       -1,
  --       "[CONGRATULATIONS] " .. player.name .. " has successfully created a Chung Ryong Helm!"
  --     )
	-- 		return
	-- 	end

	-- 	if (giveItem == 'baekho_helm') then
	-- 		broadcast(
  --       -1,
  --       "[CONGRATULATIONS] " .. player.name .. " has successfully created a Baekho Helm"
  --     )
	-- 		return
	-- 	end

	-- 	if (giveItem == 'ju_jak_helm') then
	-- 		broadcast(
  --       -1,
  --       "[CONGRATULATIONS] " .. player.name .. " has successfully created a Ju Jak Helm"
  --     )
	-- 		return
	-- 	end

	-- 	if (giveItem == 'hyun_moo_helm') then
	-- 		broadcast(
  --       -1,
  --       "[CONGRATULATIONS] " .. player.name .. " has successfully created a Hyun Moo Helm"
  --     )
	-- 		return
	-- 	end
		
	-- else
	-- 	for i = 1, #takeItem do
	-- 		if takeItem[i] == 'ancient_helm' or
	-- 		takeItem[i] == 'blood_helm' or
	-- 		takeItem[i] == 'earth_helm' then
				
	-- 		else
	-- 			player:removeItem(takeItem[i], takeAmountReq[i])
	-- 		end
	-- 	end
	-- 	player:sendAnimation(267)
	-- 	player:playSound(301)
	-- 	player:sendMinitext("You were unsuccessful.")
	-- end
end)

-- getItemsForItemCreation = function(itemsCreated)
-- 	local items = {}
-- 	local itemAmounts = {}

-- 	if itemsCreated == "basic_armor_essence" then
-- 		items = {"bear_fur", "bear_liver"}
-- 		itemAmounts = {25, 50}
-- 	elseif itemsCreated == "basic_weapon_essence" then
-- 		items = {"tiger_pelt", "tiger_meat"}
-- 		itemAmounts = {25, 50}
-- 	end

-- 	return items, itemAmounts
-- end
