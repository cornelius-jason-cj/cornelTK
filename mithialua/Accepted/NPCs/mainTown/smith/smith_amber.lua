AmberSmithNpc = {
    click = async(function(player, npc)
		local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}
		player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.dialogType = 0
		player.lastClick = npc.ID

		local opts = {'Amber', 'Dark Amber', 'White Amber', 'Yellow Amber'}

		local choice = player:menuString(
            "Hello, traveler! I can help you to refine amber. What type of amber would you like to refine?",
            opts
		)
		local choice2

        if choice == "Amber" then
            choice2 = player:menuString(
                "It will cost you\n200 pieces of amber\n10.000 gold\nDo you agree to provide them?",
                {"Yes, let's craft", "No, maybe later"}
			)

            if choice2 == "Yes, let's craft" then
                if player:hasItem("amber", 200) ~= true then
                    player:dialogSeq({t, "It seems you don't have enough amber"}, 0)
                    return
                end

                if player.money < 10000 then
                    player:dialogSeq({t, "It seems you don't have enough money"}, 0)
                    return
                end

                player:removeItem("amber", 200)
                player:removeGold(10000)

                local defaultLowGet = 1
                local defaultHighGet = 20
                local playerKarma = player.karma
                local lowGet = math.floor(defaultLowGet + playerKarma)
                local HighGet = math.floor(defaultHighGet + playerKarma)

                local total = math.random(lowGet, HighGet)

                player:addItem("crafted_amber", total)

                player:dialogSeq({
                    t,
                    "Here is the result you got:\n" .. total .. " pcs crafted amber"
                }, 0)
            end

            if choice2 == "No, maybe later" then
                player:dialogSeq({t, "Okay see you later"}, 0)
            end
        end

        if choice == "Dark Amber" then
            choice2 = player:menuString(
                "I need\n200 pieces of dark amber\n15.000 gold. Do you agree to provide them?",
                {"Yes, let's craft", "No, maybe later"}
			)
            if choice2 == "Yes, let's craft" then
                if player:hasItem("dark_amber", 200) ~= true then
                    player:dialogSeq({t, "It seems you don't have enough dark amber"}, 0)
                    return
                end

                if player.money < 15000 then
                    player:dialogSeq({t, "It seems you don't have enough money"}, 0)
                    return
                end

                player:removeItem("dark_amber", 200)
                player:removeGold(15000)

                local defaultLowGet = 1
                local defaultHighGet = 20
                local playerKarma = player.karma
                local lowGet = math.floor(defaultLowGet + playerKarma)
                local HighGet = math.floor(defaultHighGet + playerKarma)

                local total = math.random(lowGet, HighGet)

                player:addItem("crafted_dark_amber", total)

                player:dialogSeq({
                    t,
                    "Here is the result you got:\n" .. total .. " pcs crafted dark amber"
                }, 0)
            end

            if choice2 == "No, maybe later" then
                player:dialogSeq({t, "Okay see you later"}, 0)
            end
        end

        if choice == "White Amber" then
            choice2 = player:menuString(
                "I need\n200 pieces of white amber\n20.000 gold. Do you agree to provide them?",
                {"Yes, let's craft", "No, maybe later"}
			)

            if choice2 == "Yes, let's craft" then
                if player:hasItem("white_amber", 200) ~= true then
                    player:dialogSeq({t, "It seems you don't have enough white amber"}, 0)
                    return
                end

                if player.money < 20000 then
                    player:dialogSeq({t, "It seems you don't have enough money"}, 0)
                    return
                end

                player:removeItem("white_amber", 200)
                player:removeGold(20000)

                local defaultLowGet = 1
                local defaultHighGet = 20
                local playerKarma = player.karma
                local lowGet = math.floor(defaultLowGet + playerKarma)
                local HighGet = math.floor(defaultHighGet + playerKarma)

                local total = math.random(lowGet, HighGet)

                player:addItem("crafted_white_amber", total)

                player:dialogSeq({
                    t,
                    "Here is the result you got:\n" .. total .. " pcs crafted white amber"
                }, 0)
            end

            if choice2 == "No, maybe later" then
                player:dialogSeq({t, "Okay see you later"}, 0)
            end
        end

        if choice == "Yellow Amber" then
            choice2 = player:menuString(
                "I need\n200 pieces of yellow amber\n25.000 gold. Do you agree to provide them?",
                {"Yes, let's craft", "No, maybe later"}
			)

            if choice2 == "Yes, let's craft" then
                if player:hasItem("yellow_amber", 200) ~= true then
                    player:dialogSeq({t, "It seems you don't have enough yellow amber"}, 0)
                    return
                end

                if player.money < 25000 then
                    player:dialogSeq({t, "It seems you don't have enough money"}, 0)
                    return
                end

                player:removeItem("yellow_amber", 200)
                player:removeGold(25000)

                local defaultLowGet = 1
                local defaultHighGet = 20
                local playerKarma = player.karma
                local lowGet = math.floor(defaultLowGet + playerKarma)
                local HighGet = math.floor(defaultHighGet + playerKarma)

                local total = math.random(lowGet, HighGet)

                player:addItem("crafted_yellow_amber", total)

                player:dialogSeq({
                    t,
                    "Here is the result you got:\n" .. total .. " pcs crafted yellow amber"
                }, 0)
            end

            if choice2 == "No, maybe later" then
                player:dialogSeq({t, "Okay see you later"}, 0)
            end
        end
	end),
}