WarriorWeaponSmithNpc = {
    click = async(function(player, npc)
		local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}
		player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.dialogType = 0
		player.lastClick = npc.ID

        if player.baseClass ~= 1 then
			player:dialogSeq({t, "You are not a member of our clan."}, 0)
        end  
        
		local opts = {'Frozen Sword'}

		local choice = player:menuString(
            "Hello, traveler! I can help you to refine weapon. What type of weapon would you like to refine?",
            opts
		)

		local choice2

		if choice == 'Frozen Sword' then
			local weapon
			
			if player:hasItem(2018, 1) == true then
				weapon = 2018
			elseif player:hasItem(2019, 1) == true then
				weapon = 2019
			elseif player:hasItem(2020, 1) == true then
				weapon = 2020
			elseif player:hasItem(2021, 1) == true then
				weapon = 2021
			elseif player:hasItem(2022, 1) == true then
				weapon = 2022
			elseif player:hasItem(2023, 1) == true then
				weapon = 2023
			elseif player:hasItem(2024, 1) == true then
				weapon = 2024
			end

			if weapon == 2018 then
				choice2 = player:menuString(
					"To enchant this sword I need 10 pcs of well crafted amber and 25.000 gold. Do you agree to provide them?",
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
					player:removeItem(2018, 1)
					player:addItem(2019, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen sword +2 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen sword +2"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2019 then
				choice2 = player:menuString(
					"To enchant this sword I need 10 pcs of well crafted amber and 25.000 gold. Do you agree to provide them?",
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
					player:removeItem(2019, 1)
					player:addItem(2020, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen sword +3 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen sword +3"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2020 then
				choice2 = player:menuString(
					"To enchant this sword I need 10 pcs of well crafted dark amber and 50.000 gold. Do you agree to provide them?",
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
					player:removeItem(2020, 1)
					player:addItem(2021, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen sword +4 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen sword +4"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2021 then
				choice2 = player:menuString(
					"To enchant this sword I need 10 pcs of well crafted dark amber and 50.000 gold. Do you agree to provide them?",
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
					player:removeItem(2021, 1)
					player:addItem(2022, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen sword +5 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen sword +5"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2022 then
				choice2 = player:menuString(
					"To enchant this sword I need 20 pcs of well crafted white amber and 100.000 gold. Do you agree to provide them?",
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
					player:removeItem(2022, 1)
					player:addItem(2023, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen sword +6 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen sword +6"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end
			
			if weapon == 2023 then
				choice2 = player:menuString(
					"To enchant this sword I need 20 pcs of well crafted yellow amber and 200.000 gold. Do you agree to provide them?",
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
					player:removeItem(2023, 1)
					player:addItem(2024, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen sword +7 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen sword +7"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2024 then
				player:dialogSeq({t, "The weapon has reach maximum refine"}, 0)
			end
		end

	end),
}

