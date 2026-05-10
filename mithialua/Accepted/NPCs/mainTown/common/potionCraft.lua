PotionCraftNpc = {
	click = async(function(player, npc)
		local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}
		player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.dialogType = 0
		player.lastClick = npc.ID

		local items = {}

    if player:hasLegend("explore_field_cave_01") == false then
      table.insert(items, "Small Meat")
      table.insert(items, "Small Pipe")
    end

    if player:hasLegend("explore_field_cave_01") == true then
      table.insert(items, "Regular Meat")
      table.insert(items, "Regular Pipe")
    end

		local choice = player:menuString(
			"Hello! What would you like to craft today?",
			items
		)

		if choice == "Small Meat" then
			local choice2 = player:menuString(
				"To craft Small Meat, you'll need 5 acorns and 5 rabbit meats. Do you have the ingredients?",
				{"Yes, here they are", "Never mind"}
			)
			if choice2 == "Yes, here they are" then
				if player:hasItem("acorn", 5) == true and player:hasItem('rabbit_meat', 5) == true then
					player:removeItem("acorn", 5)
					player:removeItem("rabbit_meat", 5)
					player:addItem("small_meat", 10)
					player:giveXP(500)
					player:dialogSeq({t, "Great! You've successfully crafted Small Meat."}, 0)
				else 
					player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
				end
			elseif choice2 == "Never mind" then
				player:dialogSeq({t, "Okay see you"}, 0)
			end
		end

    if choice == "Regular Meat" then
			local choice2 = player:menuString(
				"To craft Regular Meat, you'll need 20 rat meats and 20 snake meats. Do you have the ingredients?",
				{"Yes, here they are", "Never mind"}
			)
			if choice2 == "Yes, here they are" then
				if player:hasItem("rat_meat", 20) == true and
          player:hasItem('snake_meat', 20) == true
        then
					player:removeItem("rat_meat", 20)
					player:removeItem("snake_meat", 20)
					player:addItem("regular_meat", 20)
					player:giveXP(3500)
					player:dialogSeq({t, "Great! You've successfully crafted Regular Meat."}, 0)
				else 
					player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
				end
			elseif choice2 == "Never mind" then
				player:dialogSeq({t, "Okay see you"}, 0)
			end
		end

		if choice == "Small Pipe" then
			local choice2 = player:menuString(
				"To craft Small Pipe, you'll need 10 antler and 1 gold acorn. Do you have the ingredients?",
				{"Yes, here they are", "Never mind"}
			)
			if choice2 == "Yes, here they are" then
				if player:hasItem("antler", 10) == true and
          player:hasItem('gold_acorn', 1) == true
        then
					player:removeItem("antler", 10)
					player:removeItem("gold_acorn", 1)
					player:addItem("small_pipe", 10)
					player:giveXP(500)
					player:dialogSeq({t, "Great! You've successfully crafted Small Pipe."}, 0)
				else 
					player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
				end
			elseif choice2 == "Never mind" then
				player:dialogSeq({t, "Okay see you"}, 0)
			end
		end

    if choice == "Regular Pipe" then
			local choice2 = player:menuString(
				"To craft Regular Pipe, you'll need 15 ginseng piece and 5 mica. Do you have the ingredients?",
				{"Yes, here they are", "Never mind"}
			)
			if choice2 == "Yes, here they are" then
				if player:hasItem("ginseng_piece", 15) == true and
          player:hasItem('mica', 5) == true
        then
					player:removeItem("ginseng_piece", 15)
					player:removeItem("mica", 5)
					player:addItem("regular_pipe", 10)
					player:giveXP(3500)
					player:dialogSeq({t, "Great! You've successfully crafted Regular Pipe."}, 0)
				else 
					player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
				end
			elseif choice2 == "Never mind" then
				player:dialogSeq({t, "Okay see you"}, 0)
			end
		end
	end),

}
