gatheringQuest = {
    amber = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local level = player.level
        local totalGathering = player.registry["guru_gathering_quest"]
        local newTotalGathering = totalGathering + 1

        local opts = {"Yes, here it is", "No"}
        
        player:dialogSeq(
            {
                t, 
                "Adventurer, I have an important task for you. Our people are in need of these items",
                "They need 200 pcs of this items:\n- Amber\n- Dark amber\n- Tarnished amber\n- Tarnisehd dark amber",
            },
            1
        )


        local choice = player:menuString(
            "can we count on you to bring them?",
            opts
        )

        if choice == "Yes, here it is" then
            if player:hasItem("amber", 200) == true and
            player:hasItem("dark_amber", 200) == true and
            player:hasItem("tarnished_amber", 200) == true and
            player:hasItem("tarnished_dark_amber", 200) ==true then
                player:removeItem("amber", 200)
                player:removeItem("dark_amber", 200)
                player:removeItem("tarnished_amber", 200)
                player:removeItem("tarnished_dark_amber", 200)
                player:giveXP(1000000000)
                player:addGold(25000)
                player.karma = player.karma + 0.05
                player.registry["guru_gathering_quest"] = newTotalGathering

                if (player:hasLegend("guru_gathering_quest")) then
                    player:removeLegendbyName("guru_gathering_quest")
                end
                
                player:addLegend(
                    "Help Guru Gathering Items " .. newTotalGathering .. " times",
                    "guru_gathering_quest",
                    3,
                    128
                )
                player:forceSave()
                player:sendAnimation(49)
                player:dialogSeq(
                    {
                        t,
                        "Thank you so much for your help",
                    },
                    0
                )
            else
                player:dialogSeq({t, "Come back to me when you have those items"}, 0)
            end
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end
    end,
}