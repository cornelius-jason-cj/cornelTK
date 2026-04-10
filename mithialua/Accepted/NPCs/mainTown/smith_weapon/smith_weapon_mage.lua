MageWeaponSmithNpc = {
    click = async(function(player, npc)
		local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}
		player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.dialogType = 0
		player.lastClick = npc.ID

        if player.baseClass ~= 3 then
			player:dialogSeq({t, "You are not a member of our clan."}, 0)
        end  
        
		local opts = {'Fire Staff'}

		local choice = player:menuString(
            "Hello, traveler! I can help you to refine weapon. What type of weapon would you like to refine?",
            opts
		)

		local choice2

		if choice == 'Fire Staff' then
			local weapon
			
			if player:hasItem(2010, 1) == true then
				weapon = 2010
			elseif player:hasItem(2011, 1) == true then
				weapon = 2011
			elseif player:hasItem(2012, 1) == true then
				weapon = 2012
			elseif player:hasItem(2013, 1) == true then
				weapon = 2013
			elseif player:hasItem(2014, 1) == true then
				weapon = 2014
			elseif player:hasItem(2015, 1) == true then
				weapon = 2015
			elseif player:hasItem(2016, 1) == true then
				weapon = 2016
			end

			if weapon == 2010 then
				choice2 = player:menuString(
					"To enchant this staff I need 10 pcs of well crafted amber and 25.000 gold. Do you agree to provide them?",
					{"Yes, let's craft", "No, maybe later"}
				)

				if choice2 == "Yes, let's craft" then
					if player:hasItem("well_crafted_amber", 10) ~= true then
						player:dialogSeq({t, "It seems you don't have enough well crafted amber"}, 0)
						return
					end

					if player.money < 25000 then
						player:dialogSeq({t, "It seems you don't have enough money"}, 0)
						return
					end

					player:removeItem("well_crafted_amber", 10)
					player:removeGold(25000)
					player:removeItem(2010, 1)
					player:addItem(2011, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine fire staff +2 !"
					)

					player:dialogSeq({
						t,
						"Here take the fire staff +2"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2011 then
				choice2 = player:menuString(
					"To enchant this staff I need 10 pcs of well crafted amber and 25.000 gold. Do you agree to provide them?",
					{"Yes, let's craft", "No, maybe later"}
				)

				if choice2 == "Yes, let's craft" then
					if player:hasItem("well_crafted_amber", 10) ~= true then
						player:dialogSeq({t, "It seems you don't have enough well crafted amber"}, 0)
						return
					end

					if player.money < 25000 then
						player:dialogSeq({t, "It seems you don't have enough money"}, 0)
						return
					end

					player:removeItem("well_crafted_amber", 10)
					player:removeGold(25000)
					player:removeItem(2011, 1)
					player:addItem(2012, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine fire staff +3 !"
					)

					player:dialogSeq({
						t,
						"Here take the fire staff +3"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2012 then
				choice2 = player:menuString(
					"To enchant this staff I need 10 pcs of well crafted dark amber and 50.000 gold. Do you agree to provide them?",
					{"Yes, let's craft", "No, maybe later"}
				)

				if choice2 == "Yes, let's craft" then
					if player:hasItem("well_crafted_dark_amber", 10) ~= true then
						player:dialogSeq({t, "It seems you don't have enough well crafted amber"}, 0)
						return
					end

					if player.money < 50000 then
						player:dialogSeq({t, "It seems you don't have enough money"}, 0)
						return
					end

					player:removeItem("well_crafted_dark_amber", 10)
					player:removeGold(50000)
					player:removeItem(2012, 1)
					player:addItem(2013, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine fire staff +4 !"
					)

					player:dialogSeq({
						t,
						"Here take the fire staff +4"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2013 then
				choice2 = player:menuString(
					"To enchant this staff I need 10 pcs of well crafted dark amber and 50.000 gold. Do you agree to provide them?",
					{"Yes, let's craft", "No, maybe later"}
				)

				if choice2 == "Yes, let's craft" then
					if player:hasItem("well_crafted_dark_amber", 10) ~= true then
						player:dialogSeq({t, "It seems you don't have enough well crafted amber"}, 0)
						return
					end

					if player.money < 50000 then
						player:dialogSeq({t, "It seems you don't have enough money"}, 0)
						return
					end

					player:removeItem("well_crafted_dark_amber", 10)
					player:removeGold(50000)
					player:removeItem(2013, 1)
					player:addItem(2014, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine fire staff +5 !"
					)

					player:dialogSeq({
						t,
						"Here take the fire staff +5"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2014 then
				choice2 = player:menuString(
					"To enchant this staff I need 20 pcs of well crafted white amber and 100.000 gold. Do you agree to provide them?",
					{"Yes, let's craft", "No, maybe later"}
				)

				if choice2 == "Yes, let's craft" then
					if player:hasItem("well_crafted_white_amber", 20) ~= true then
						player:dialogSeq({t, "It seems you don't have enough well crafted amber"}, 0)
						return
					end

					if player.money < 100000 then
						player:dialogSeq({t, "It seems you don't have enough money"}, 0)
						return
					end

					player:removeItem("well_crafted_white_amber", 20)
					player:removeGold(100000)
					player:removeItem(2014, 1)
					player:addItem(2015, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine fire staff +6 !"
					)

					player:dialogSeq({
						t,
						"Here take the fire staff +6"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end
			
			if weapon == 2015 then
				choice2 = player:menuString(
					"To enchant this staff I need 20 pcs of well crafted yellow amber and 200.000 gold. Do you agree to provide them?",
					{"Yes, let's craft", "No, maybe later"}
				)

				if choice2 == "Yes, let's craft" then
					if player:hasItem("well_crafted_yellow_amber", 20) ~= true then
						player:dialogSeq({t, "It seems you don't have enough well crafted amber"}, 0)
						return
					end

					if player.money < 200000 then
						player:dialogSeq({t, "It seems you don't have enough money"}, 0)
						return
					end

					player:removeItem("well_crafted_yellow_amber", 20)
					player:removeGold(200000)
					player:removeItem(2015, 1)
					player:addItem(2016, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine fire staff +7 !"
					)

					player:dialogSeq({
						t,
						"Here take the fire staff +7"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2016 then
				player:dialogSeq({t, "The weapon has reach maximum refine"}, 0)
			end
		end

	end),
}

