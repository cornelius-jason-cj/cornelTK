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

		local items = {"Small Meat", "Herb Pipe"}

		local choice = player:menuString(
			"Hello! What would you like to craft today?",
			items
		)

		if choice == "Small Meat" then
			local choice2 = player:menuString(
				"To craft Small Meat, you'll need 10 acorns and 10 rabbit meats. Do you have the ingredients?",
				{"Yes, here they are", "Never mind"}
			)
			if choice2 == "Yes, here they are" then
				if player:hasItem("acorn", 10) == true and player:hasItem('rabbit_meat', 10) == true then
					player:removeItem("acorn", 10)
					player:removeItem("rabbit_meat", 10)
					player:addItem("small_meat", 1)
					player:giveXP(500)
					player:dialogSeq({t, "Great! You've successfully crafted Small Meat."}, 0)
				else 
					player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
				end
			elseif choice2 == "Never mind" then
				player:dialogSeq({t, "Okay see you"}, 0)
			end
		end

		if choice == "Herb Pipe" then
			local choice2 = player:menuString(
				"To craft Small Meat, you'll need 10 antler and 1 gold acorn. Do you have the ingredients?",
				{"Yes, here they are", "Never mind"}
			)
			if choice2 == "Yes, here they are" then
				if player:hasItem("antler", 10) == true and player:hasItem('gold_acorn', 1) == true then
					player:removeItem("antler", 10)
					player:removeItem("gold_acorn", 1)
					player:addItem("herb_pipe", 1)
					player:giveXP(500)
					player:dialogSeq({t, "Great! You've successfully crafted Small Meat."}, 0)
				else 
					player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
				end
			elseif choice2 == "Never mind" then
				player:dialogSeq({t, "Okay see you"}, 0)
			end
		end
	end),

}
