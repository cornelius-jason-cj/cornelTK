mythicFavorQuest = {
    mythic_rabbit = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic rabbit. Gather the required items and be richly rewarded.",
                "Requirements:\n- 10 titanium gloves\n- 10 whisper bracelets",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "titanium_glove"
            local reqItem2 = "whisper_bracelet"
            local reqQty1 = 10
            local reqQty2 = 10
            local rewardItem = "rabbit_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_rabbit_favor"
            local legendName = "Finished Mythic Rabbit Favor"
            local legendId = "finish_mythic_rabbit_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough titanium glove"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough whisper bracelet"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty2)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )

            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Rabbit Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,
    
    mythic_monkey = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic monkey. Gather the required items and be richly rewarded.",
                "Requirements:\n- 10 sen gloves\n- 10 scribes book",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "sen_glove"
            local reqItem2 = "scribes_book"
            local reqQty1 = 10
            local reqQty2 = 10
            local rewardItem = "monkey_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_monkey_favor"
            local legendName = "Finished Mythic Monkey Favor"
            local legendId = "finish_mythic_monkey_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough sen glove"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough scribes book"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty2)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )
            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Monkey Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,

    mythic_dog = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic dog. Gather the required items and be richly rewarded.",
                "Requirements:\n- 10 Chung Ryong Key\n- 10 Baekho Key\n- 10 Ju Jak Key\n- 10 Hyun Moo Key",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "chung_ryong_key"
            local reqItem2 = "baekho_key"
            local reqItem3 = "ju_jak_key"
            local reqItem4 = "hyun_moo_key"
            local reqQty1 = 10
            local rewardItem = "dog_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_dog_favor"
            local legendName = "Finished Mythic Dog Favor"
            local legendId = "finish_mythic_dog_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough chung ryong key"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough baekho key"}, 0)
                return
            end

            if player:hasItem(reqItem3, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough ju jak key"}, 0)
                return
            end

            if player:hasItem(reqItem4, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough hyun moo key"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty1)
            player:removeItem(reqItem3, reqQty1)
            player:removeItem(reqItem4, reqQty1)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )
            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Dog Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,

    mythic_rooster = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic rooster. Gather the required items and be richly rewarded.",
                "Requirements:\n- 10 Chung Ryong Key\n- 10 Baekho Key\n- 10 Ju Jak Key\n- 10 Hyun Moo Key",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "chung_ryong_key"
            local reqItem2 = "baekho_key"
            local reqItem3 = "ju_jak_key"
            local reqItem4 = "hyun_moo_key"
            local reqQty1 = 10
            local rewardItem = "rooster_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_rooster_favor"
            local legendName = "Finished Mythic Rooster Favor"
            local legendId = "finish_mythic_rooster_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough chung ryong key"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough baekho key"}, 0)
                return
            end

            if player:hasItem(reqItem3, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough ju jak key"}, 0)
                return
            end

            if player:hasItem(reqItem4, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough hyun moo key"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty1)
            player:removeItem(reqItem3, reqQty1)
            player:removeItem(reqItem4, reqQty1)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )
            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Rooster Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,

    mythic_rat = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic rat. Gather the required items and be richly rewarded.",
                "Requirements:\n- 20 Earth Key\n- 800 Tarnished amber\n- 800 White amber",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "earth_key"
            local reqItem2 = "tarnished_amber"
            local reqItem3 = "white_amber"
            local reqQty1 = 20
            local reqQty2 = 800
            local rewardItem = "rat_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_rat_favor"
            local legendName = "Finished Mythic Rat Favor"
            local legendId = "finish_mythic_rat_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough earth key"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished amber"}, 0)
                return
            end

            if player:hasItem(reqItem3, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough white amber"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty2)
            player:removeItem(reqItem3, reqQty2)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )
            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Rat Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,

    mythic_horse = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic horse. Gather the required items and be richly rewarded.",
                "Requirements:\n- 20 Fire Key\n- 800 Tarnished amber\n- 800 Yellow amber",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "fire_key"
            local reqItem2 = "tarnished_amber"
            local reqItem3 = "yellow_amber"
            local reqQty1 = 20
            local reqQty2 = 800
            local rewardItem = "horse_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_horse_favor"
            local legendName = "Finished Mythic Horse Favor"
            local legendId = "finish_mythic_horse_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough fire key"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished amber"}, 0)
                return
            end

            if player:hasItem(reqItem3, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough yellow amber"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty2)
            player:removeItem(reqItem3, reqQty2)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )
            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Horse Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,
    
    mythic_ox = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic ox. Gather the required items and be richly rewarded.",
                "Requirements:\n- 20 Wind Key\n- 800 Tarnished amber\n- 800 Tarnished dark amber",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "wind_key"
            local reqItem2 = "tarnished_amber"
            local reqItem3 = "tarnished_dark_amber"
            local reqQty1 = 20
            local reqQty2 = 800
            local rewardItem = "ox_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_ox_favor"
            local legendName = "Finished Mythic ox Favor"
            local legendId = "finish_mythic_ox_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough wind key"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished amber"}, 0)
                return
            end

            if player:hasItem(reqItem3, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished dark amber"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty2)
            player:removeItem(reqItem3, reqQty2)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )
            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Ox Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,
    
    mythic_pig = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic pig. Gather the required items and be richly rewarded.",
                "Requirements:\n- 20 Heaven Key\n- 800 Tarnished amber\n- 800 Tarnished dark amber",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "heaven_key"
            local reqItem2 = "tarnished_amber"
            local reqItem3 = "tarnished_dark_amber"
            local reqQty1 = 20
            local reqQty2 = 800
            local rewardItem = "pig_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_pig_favor"
            local legendName = "Finished Mythic Pig Favor"
            local legendId = "finish_mythic_pig_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough heaven key"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished amber"}, 0)
                return
            end

            if player:hasItem(reqItem3, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished dark amber"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty2)
            player:removeItem(reqItem3, reqQty2)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )
            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Pig Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,
    
    mythic_snake = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic snake. Gather the required items and be richly rewarded.",
                "Requirements:\n- 20 Pond Key\n- 800 Tarnished amber\n- 800 Tarnished dark amber",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "pond_key"
            local reqItem2 = "tarnished_amber"
            local reqItem3 = "tarnished_dark_amber"
            local reqQty1 = 20
            local reqQty2 = 800
            local rewardItem = "snake_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_snake_favor"
            local legendName = "Finished Mythic Snake Favor"
            local legendId = "finish_mythic_snake_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough pond key"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished amber"}, 0)
                return
            end

            if player:hasItem(reqItem3, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished dark amber"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty2)
            player:removeItem(reqItem3, reqQty2)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )
            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Snake Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,
    
    mythic_sheep = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic sheep. Gather the required items and be richly rewarded.",
                "Requirements:\n- 20 Thunder Key\n- 800 Tarnished amber\n- 800 Tarnished white amber",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "thunder_key"
            local reqItem2 = "tarnished_amber"
            local reqItem3 = "tarnished_white_amber"
            local reqQty1 = 20
            local reqQty2 = 800
            local rewardItem = "sheep_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_sheep_favor"
            local legendName = "Finished Mythic sheep Favor"
            local legendId = "finish_mythic_sheep_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough thunder key"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished amber"}, 0)
                return
            end

            if player:hasItem(reqItem3, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished white amber"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty2)
            player:removeItem(reqItem3, reqQty2)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )
            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Sheep Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,
    
    mythic_tiger = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic tiger. Gather the required items and be richly rewarded.",
                "Requirements:\n- 20 Water Key\n- 800 Tarnished amber\n- 800 Tarnished yellow amber",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "water_key"
            local reqItem2 = "tarnished_amber"
            local reqItem3 = "tarnished_yellow_amber"
            local reqQty1 = 20
            local reqQty2 = 800
            local rewardItem = "tiger_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_tiger_favor"
            local legendName = "Finished Mythic Tiger Favor"
            local legendId = "finish_mythic_tiger_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough water key"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished amber"}, 0)
                return
            end

            if player:hasItem(reqItem3, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished yellow amber"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty2)
            player:removeItem(reqItem3, reqQty2)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )
            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Tiger Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,
    
    mythic_dragon = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        player:dialogSeq(
            {
                t, 
                "To earn the favor of the mythic dragon. Gather the required items and be richly rewarded.",
                "Requirements:\n- 20 Thunder Key\n- 800 Tarnished dark amber\n- 800 Tarnished white amber\n- 800 Tarnished yellow amber",
            },
            1
        )

        local opts = {"Yes, here it is", "No"}

        local choice = player:menuString(
            "Have you bring those items?",
            opts
        )

        if choice == "Yes, here it is" then
            local reqItem1 = "mountain_key"
            local reqItem2 = "tarnished_dark_amber"
            local reqItem3 = "tarnished_white_amber"
            local reqItem4 = "tarnished_yellow_amber"
            local reqQty1 = 20
            local reqQty2 = 800
            local rewardItem = "dragon_favor"
            local rewardQty = 1
            local rewardKarma = 10
            local registryName = "mythic_dragon_favor"
            local legendName = "Finished Mythic Dragon Favor"
            local legendId = "finish_mythic_dragon_favor"


            if player:hasItem(reqItem1, reqQty1) ~= true then
                player:dialogSeq({t, "It seems you don't have enough mountain key"}, 0)
                return
            end

            if player:hasItem(reqItem2, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished amber"}, 0)
                return
            end

            if player:hasItem(reqItem3, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished white amber"}, 0)
                return
            end

            if player:hasItem(reqItem4, reqQty2) ~= true then
                player:dialogSeq({t, "It seems you don't have enough tarnished yellow amber"}, 0)
                return
            end

            player:removeItem(reqItem1, reqQty1)
            player:removeItem(reqItem2, reqQty2)
            player:removeItem(reqItem3, reqQty2)
            player:removeItem(reqItem4, reqQty2)

            player:addItem(rewardItem, rewardQty)
            player:addGold(200000)
            player.karma = player.karma + rewardKarma

            player.registry[registryName] = 1
            player:sendAnimation(49)
            player:addLegend(
                legendName,
                legendId,
                79,
                79
            )
            broadcast(
                -1,
                "[CONGRATULATIONS] " .. player.name .. " has finished Mythic Dragon Favor!"
            )

            player:forceSave()
        end

        if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
        end

    end,
}