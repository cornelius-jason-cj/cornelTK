PoetArmorSmithNpc = {
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
        
		local opts = {'Star Armor', 'Moon Armor', 'Sun Armor'}

		local choice = player:menuString(
            "Hello, traveler! I can help you craft a powerful armor. What type of armor would you like to craft?",
            opts
		)

		local choice2

		if choice == 'Star Armor' then
			choice2 = player:menuString(
                "To make this, I will need\n400 pcs of Crafted Amber\n800 pcs of Tarnished Amber\n800 pcs of Amber\n50.000 gold. Do you agree to provide them?",
                {"Yes, let's craft", "No, maybe later"}
			)

			if choice2 == "Yes, let's craft" then
				if player:hasItem("crafted_amber", 400) ~= true then
					player:dialogSeq({t, "It seems you don't have enough crafted amber"}, 0)
                    return
                end

				if player:hasItem("tarnished_amber", 800) ~= true then
					player:dialogSeq({t, "It seems you don't have enough tarnished amber"}, 0)
                    return
                end

				if player:hasItem("amber", 800) ~= true then
					player:dialogSeq({t, "It seems you don't have enough amber"}, 0)
                    return
                end

                if player.money < 50000 then
                    player:dialogSeq({t, "It seems you don't have enough money"}, 0)
                    return
                end

                player:removeItem("crafted_amber", 400)
                player:removeItem("tarnished_amber", 800)
                player:removeItem("amber", 800)
                player:removeGold(50000)

				if player.sex == 0 then
					player:addItem("star_mantle", 1)
				elseif player.sex == 1 then
					player:addItem("star_drapery", 1)
				end
				
                player.registry["craft_star_armor"] = 1

                player:addLegend(
                    "Success Craft Star Armor",
                    "craft_star_armor",
                    75,
                    20
                )

				broadcast(
					-1,
					"[CONGRATULATIONS] " .. player.name .. " has successfully crafted a Star Armor!"
				)

				player:dialogSeq({
                    t,
                    "Here take the Star Armor"
                }, 0)

			end
		end

		if choice == 'Moon Armor' then
			choice2 = player:menuString(
                "Please bring your star armor and\n400 pcs of Crafted Dark Amber\n800 pcs of Tarnished Dark Amber\n800 pcs of Dark Amber\n100.000 gold. Do you agree to provide them?",
                {"Yes, let's craft", "No, maybe later"}
			)

			if choice2 == "Yes, let's craft" then

				if player.sex == 0 then
					if player:hasItem("star_mantle", 1) ~= true then
						player:dialogSeq({t, "It seems you don't have star armor"}, 0)
						return
					end
				end

				if player.sex == 1 then
					if player:hasItem("star_drapery", 1) ~= true then
						player:dialogSeq({t, "It seems you don't have star armor"}, 0)
						return
					end
				end

				if player:hasItem("crafted_dark_amber", 400) ~= true then
					player:dialogSeq({t, "It seems you don't have enough crafted dark amber"}, 0)
                    return
                end

				if player:hasItem("tarnished_dark_amber", 800) ~= true then
					player:dialogSeq({t, "It seems you don't have enough tarnished dark amber"}, 0)
                    return
                end

				if player:hasItem("dark_amber", 800) ~= true then
					player:dialogSeq({t, "It seems you don't have enough dark amber"}, 0)
                    return
                end

                if player.money < 100000 then
                    player:dialogSeq({t, "It seems you don't have enough money"}, 0)
                    return
                end

                player:removeItem("crafted_dark_amber", 400)
                player:removeItem("tarnished_dark_amber", 800)
                player:removeItem("dark_amber", 800)
                player:removeGold(100000)

				if player.sex == 0 then
					player:removeItem("star_mantle", 1)
					player:addItem("moon_mantle", 1)
				elseif player.sex == 1 then
					player:removeItem("star_drapery", 1)
					player:addItem("moon_drapery", 1)
				end

				player.registry["craft_moon_armor"] = 1

                player:addLegend(
                    "Success Craft Moon Armor",
                    "craft_moon_armor",
                    75,
                    66
                )
				
				broadcast(
					-1,
					"[CONGRATULATIONS] " .. player.name .. " has successfully crafted a Moon Armor!"
				)

				player:dialogSeq({
                    t,
                    "Here take the Moon Armor"
                }, 0)

			end
		end

		if choice == 'Sun Armor' then
			choice2 = player:menuString(
                "Please bring your moon armor and\n400 pcs of Crafted White Amber\n800 pcs of Tarnished White Amber\n800 pcs of White Amber\n200.000 gold. Do you agree to provide them?",
                {"Yes, let's craft", "No, maybe later"}
			)

			if choice2 == "Yes, let's craft" then

				if player.sex == 0 then
					if player:hasItem("moon_mantle", 1) ~= true then
						player:dialogSeq({t, "It seems you don't have moon armor"}, 0)
						return
					end
				end

				if player.sex == 1 then
					if player:hasItem("moon_drapery", 1) ~= true then
						player:dialogSeq({t, "It seems you don't have moon armor"}, 0)
						return
					end
				end

				if player:hasItem("crafted_white_amber", 400) ~= true then
					player:dialogSeq({t, "It seems you don't have enough crafted white amber"}, 0)
                    return
                end

				if player:hasItem("tarnished_white_amber", 800) ~= true then
					player:dialogSeq({t, "It seems you don't have enough tarnished white amber"}, 0)
                    return
                end

				if player:hasItem("white_amber", 800) ~= true then
					player:dialogSeq({t, "It seems you don't have enough white amber"}, 0)
                    return
                end

                if player.money < 200000 then
                    player:dialogSeq({t, "It seems you don't have enough money"}, 0)
                    return
                end

                player:removeItem("crafted_white_amber", 400)
                player:removeItem("tarnished_white_amber", 800)
                player:removeItem("white_amber", 800)
                player:removeGold(200000)

				if player.sex == 0 then
					player:removeItem("moon_mantle", 1)
					player:addItem("sun_mantle", 1)
				elseif player.sex == 1 then
					player:removeItem("moon_drapery", 1)
					player:addItem("sun_drapery", 1)
				end

				player.registry["craft_sun_armor"] = 1

                player:addLegend(
                    "Success Craft Sun Armor",
                    "craft_sun_armor",
                    75,
                    39
                )
				
				broadcast(
					-1,
					"[CONGRATULATIONS] " .. player.name .. " has successfully crafted a Sun Armor!"
				)

				player:dialogSeq({
                    t,
                    "Here take the Sun Armor"
                }, 0)

			end
		end

	end),
}

