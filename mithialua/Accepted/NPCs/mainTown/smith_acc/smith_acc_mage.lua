MageAccSmithNpc = {
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
        
		local opts = {'Amber', 'Dark Amber', 'White Amber', 'Yellow Amber'}

		local choice = player:menuString(
            "Hello, traveler! I can help you craft a powerful ring. What type of ring would you like to create?",
            opts
		)
		local choice2

        if choice == "Amber" then
            choice2 = player:menuString(
                "Ah, a ring crafted from Amber filled with natural energy!\nTo make this, I will need 50 pieces of amber. Do you agree to provide them?",
                {"Yes, let's craft", "No, maybe later"}
			)

            if choice2 == "Yes, let's craft" then
                if player:hasItem("amber", 50) == true then
                    player:removeItem("amber", 50)
                    local results = {}
                    for i = 1, 3 do
                        local chance = math.random(100)
                        if chance <= 50 then
                            player:addItem("small_amber_ring", 1)
                            table.insert(results, "Small Amber ring")
                        elseif chance <= 80 then
                            player:addItem("medium_amber_ring", 1)
                            table.insert(results, "Medium Amber ring")
                        else
                            player:addItem("large_amber_ring", 1)
                            table.insert(results, "Large Amber ring")
                        end
                    end
                    player:dialogSeq({
                        t,
                        "Here is the result you got:\n" .. results[1] .. "\n" .. results[2] .. "\n" .. results[3]
                    }, 0)
                else 
                    player:dialogSeq({t, "It seems you don't have enough amber. Come back when you have 50 pieces."}, 0)
                end
            end

            if choice2 == "No, maybe later" then
                player:dialogSeq({t, "Okay see you later"}, 0)
            end
        end

        if choice == "Dark Amber" then
            choice2 = player:menuString(
                "Ah, Dark Amber! This rare gem is said to hold mystical properties. Gather 50 pieces, and I can craft something truly special.",
                {"Yes, let's craft", "No, maybe later"}
			)

            if choice2 == "Yes, let's craft" then
                if player:hasItem("dark_amber", 50) == true then
                    player:removeItem("dark_amber", 50)
                    local results = {}
                    for i = 1, 3 do
                        local chance = math.random(100)
                        if chance <= 50 then
                            player:addItem("small_dark_ring", 1)
                            table.insert(results, "Small dark ring")
                        elseif chance <= 80 then
                            player:addItem("medium_dark_ring", 1)
                            table.insert(results, "Medium dark ring")
                        else
                            player:addItem("large_dark_ring", 1)
                            table.insert(results, "Large dark ring")
                        end
                    end
                    player:dialogSeq({
                        t,
                        "Here is the result you got:\n" .. results[1] .. "\n" .. results[2] .. "\n" .. results[3]
                    }, 0)
                else 
                    player:dialogSeq({t, "It seems you don't have enough dark amber. Come back when you have 50 pieces."}, 0)
                end
            end

            if choice2 == "No, maybe later" then
                player:dialogSeq({t, "Okay see you later"}, 0)
            end
        end

        if choice == "White Amber" then
            choice2 = player:menuString(
                "Ah, White Amber! This rare gem is said to hold mystical properties. Gather 50 pieces, and I can craft something truly special.",
                {"Yes, let's craft", "No, maybe later"}
			)

            if choice2 == "Yes, let's craft" then
                if player:hasItem("white_amber", 50) == true then
                    player:removeItem("white_amber", 50)
                    local results = {}
                    for i = 1, 3 do
                        local chance = math.random(100)
                        if chance <= 50 then
                            player:addItem("small_white_ring", 1)
                            table.insert(results, "Small white ring")
                        elseif chance <= 80 then
                            player:addItem("medium_white_ring", 1)
                            table.insert(results, "Medium white ring")
                        else
                            player:addItem("large_white_ring", 1)
                            table.insert(results, "Large white ring")
                        end
                    end
                    player:dialogSeq({
                        t,
                        "Here is the result you got:\n" .. results[1] .. "\n" .. results[2] .. "\n" .. results[3]
                    }, 0)
                else 
                    player:dialogSeq({t, "It seems you don't have enough white amber. Come back when you have 50 pieces."}, 0)
                end
            end

            if choice2 == "No, maybe later" then
                player:dialogSeq({t, "Okay see you later"}, 0)
            end
        end

        if choice == "Yellow Amber" then
            choice2 = player:menuString(
                "Ah, Yellow Amber! This rare gem is said to hold mystical properties. Gather 50 pieces, and I can craft something truly special.",
                {"Yes, let's craft", "No, maybe later"}
			)

            if choice2 == "Yes, let's craft" then
                if player:hasItem("yellow_amber", 50) == true then
                    player:removeItem("yellow_amber", 50)
                    local results = {}
                    for i = 1, 3 do
                        local chance = math.random(100)
                        if chance <= 50 then
                            player:addItem("small_yellow_ring", 1)
                            table.insert(results, "Small yellow ring")
                        elseif chance <= 80 then
                            player:addItem("medium_yellow_ring", 1)
                            table.insert(results, "Medium yellow ring")
                        else
                            player:addItem("large_yellow_ring", 1)
                            table.insert(results, "Large yellow ring")
                        end
                    end
                    player:dialogSeq({
                        t,
                        "Here is the result you got:\n" .. results[1] .. "\n" .. results[2] .. "\n" .. results[3]
                    }, 0)
                else 
                    player:dialogSeq({t, "It seems you don't have enough yellow amber. Come back when you have 50 pieces."}, 0)
                end
            end

            if choice2 == "No, maybe later" then
                player:dialogSeq({t, "Okay see you later"}, 0)
            end
        end
	end),
}

