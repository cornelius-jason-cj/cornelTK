PoetWeaponSmithNpc = {
    click = async(function(player, npc)
		local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}
		player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.dialogType = 0
		player.lastClick = npc.ID

        if player.baseClass ~= 4 then
			player:dialogSeq({t, "You are not a member of our clan."}, 0)
        end  
        
		local opts = {'Frozen Staff'}

		local choice = player:menuString(
            "Hello, traveler! I can help you to refine weapon. What type of weapon would you like to refine?",
            opts
		)

		local choice2

		if choice == 'Frozen Staff' then
			local weapon
			
			if player:hasItem(2026, 1) == true then
				weapon = 2026
			elseif player:hasItem(2027, 1) == true then
				weapon = 2027
			elseif player:hasItem(2028, 1) == true then
				weapon = 2028
			elseif player:hasItem(2029, 1) == true then
				weapon = 2029
			elseif player:hasItem(2030, 1) == true then
				weapon = 2030
			elseif player:hasItem(2031, 1) == true then
				weapon = 2031
			elseif player:hasItem(2032, 1) == true then
				weapon = 2032
			end

			if weapon == 2026 then
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
					player:removeItem(2026, 1)
					player:addItem(2027, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen staff +2 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen staff +2"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2027 then
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
					player:removeItem(2027, 1)
					player:addItem(2028, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen staff +3 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen staff +3"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2028 then
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
					player:removeItem(2028, 1)
					player:addItem(2029, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen staff +4 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen staff +4"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2029 then
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
					player:removeItem(2029, 1)
					player:addItem(2030, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen staff +5 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen staff +5"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2030 then
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
					player:removeItem(2030, 1)
					player:addItem(2031, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen staff +6 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen staff +6"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end
			
			if weapon == 2031 then
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
					player:removeItem(2031, 1)
					player:addItem(2032, 1)

					broadcast(
						-1,
						"[CONGRATULATIONS] " .. player.name .. " has successfully refine frozen staff +7 !"
					)

					player:dialogSeq({
						t,
						"Here take the frozen staff +7"
					}, 0)
				end

				if choice2 == "No, maybe later" then
					player:dialogSeq({t, "See you later"}, 0)
				end
			end

			if weapon == 2032 then
				player:dialogSeq({t, "The weapon has reach maximum refine"}, 0)
			end
		end

	end),
}

