
local _huntingQuestInfo = "hunting_quest_info"
local _huntingQuestKillCount = "hunting_quest_kill_count_"

local questList = {
    "killing_quest_mythic_rabbit",
    "killing_quest_mythic_monkey",
    "killing_quest_mythic_dog",
    "killing_quest_mythic_rooster",
    "killing_quest_mythic_rat",
    "killing_quest_mythic_horse",
    "killing_quest_mythic_ox",
    "killing_quest_mythic_pig",
    "killing_quest_mythic_snake",
    "killing_quest_mythic_sheep",
    "killing_quest_mythic_tiger",
    "killing_quest_mythic_dragon",
}

local huntingListQuest = {
    ["mythic_rabbit"] = {
        displayName = "Mythic Rabbit",
        mobs = {
            "blue_rabbit",
            "green_rabbit",
            "orange_rabbit",
            "red_rabbit",
            "golden_rabbit",
            "magic_rabbit",
            "mad_rabbit"
        }
    },
    ["mythic_monkey"] = {
        displayName = "Mythic Monkey",
        mobs = {
            "simple_monkey",
            "quick_monkey",
            "agile_monkey",
            "bright_monkey",
            "fast_monkey",
            "spunky_monkey",
            "monsterous_monkey",
        }
    },
    ["mythic_dog"] = {
        displayName = "Mythic Dog",
        mobs = {
            "dog_trooper",
            "crazed_mongrel",
            "spunky_dog",
            "death_mongrel",
            "guardian_dog",
            "divine_dog",
            "dog_cutthroat",
            "spotted_mutt",
            "frothing_mutt",
            "killer_mongrel",
        }
    },
    ["mythic_rooster"] = {
        displayName = "Mythic Rooster",
        mobs = {
            "red_chick",
            "fiery_chick",
            "wild_chick",
            "sunfeather",
            "rooster_sentry",
            "mythic_rooster",
            "rooster_swordsman",
            "rooster_guardian",
            "divine_rooster"
        }
    },
    ["mythic_rat"] = {
        displayName = "Mythic Rat",
        mobs = {
            "mud_rat",
            "hunter_rat",
            "earth_rat",
            "lava_rat",
            "fire_rat",
            "beady_rat",
            "spirit_mouse",
            "rat_guardian",
            "rat_defender",
        }
    },
    ["mythic_horse"] = {
        displayName = "Mythic Horse",
        mobs = {
            "spirited_horse",
            "diamond_horse",
            "golden_horse",
            "wooden_horse",
            "lake_winny",
            "fire_snorter",
            "horse_guardian",
            "horse_divine",
            "horse_chongun",
        }
    },
    ["mythic_ox"] = {
        displayName = "Mythic Ox",
        mobs = {
            "giant_bull",
            "rampaging_bull",
            "great_horns",
            "pale_hunger",
            "angry_ox",
            "tough_fight",
        }
    },
    ["mythic_pig"] = {
        displayName = "Mythic Pig",
        mobs = {
            "stout_piglet",
            "stout_pig",
            "bold_piglet",
            "bold_pig",
            "obese_pig",
            "bold_hog",
            "stout_warthog",
            "bold_boar",
            "pig_guardian",
            "pig_divine",
        }
    },
    ["mythic_snake"] = {
        displayName = "Mythic Snake",
        mobs = {
            "simple_snake",
            "glowing_snake",
            "slitherly",
            "meter_worm",
            "lava_snake",
            "dark_snake",
            "spasm",
            "storm_snake",
        }
    },
    ["mythic_sheep"] = {
        displayName = "Mythic Sheep",
        mobs = {
            "black_sheep",
            "red_sheep",
            "flaming_sheep",
            "dark_sheep",
        }
    },
    ["mythic_tiger"] = {
        displayName = "Mythic Tiger",
        mobs = {
            "raging_tiger",
            "black_tiger",
            "huge_tiger",
            "crazy_claw",
            "knap",
            "brazen",
        }
    },
    ["mythic_dragon"] = {
        displayName = "Mythic Dragon",
        mobs = {
            "adolescent_dragon",
            "mature_dragon",
            "great_wyrm",
            "mighty_wyrm",
            "serpentine_dragon",
            "dragon_guardian",
            "old_dragon",
            "dragon_defender",
        }
    },
}

huntingQuest = {
    removeValueFromTable = function(tbl, valueToRemove)
        for i = #tbl, 1, -1 do
            if tbl[i] == valueToRemove then
                table.remove(tbl, i)
                break
            end
        end
    end,

    calculateKillCount = function(player, mobTable)
        local killCount = 0
        for _, mob in ipairs(mobTable) do
            local mobKills = player:killCount(mob)
            killCount = killCount + mobKills
        end
        return killCount
    end,

    mythic_rabbit = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_rabbit"
        local registryName = "hunting_quest_mythic_rabbit"
        local legendName = "Mythic Rabbit"
        local rewardExp = 100000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_rabbit.displayName
		local mobs = huntingListQuest.mythic_rabbit.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 rabbits in mythic rabbit, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,

    mythic_monkey = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_monkey"
        local registryName = "hunting_quest_mythic_monkey"
        local legendName = "Mythic Monkey"
        local rewardExp = 250000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_monkey.displayName
		local mobs = huntingListQuest.mythic_monkey.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 monkeys in mythic monkey, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,

    mythic_dog = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_dog"
        local registryName = "hunting_quest_mythic_dog"
        local legendName = "Mythic Dog"
        local rewardExp = 550000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_dog.displayName
		local mobs = huntingListQuest.mythic_dog.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 dogs in mythic dog, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,

    mythic_rooster = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_rooster"
        local registryName = "hunting_quest_mythic_rooster"
        local legendName = "Mythic Rooster"
        local rewardExp = 750000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_rooster.displayName
		local mobs = huntingListQuest.mythic_rooster.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 roosters in mythic rooster, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,

    mythic_rat = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_rat"
        local registryName = "hunting_quest_mythic_rat"
        local legendName = "Mythic Rat"
        local rewardExp = 950000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_rat.displayName
		local mobs = huntingListQuest.mythic_rat.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 rats in mythic rat, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,
    
    mythic_horse = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_horse"
        local registryName = "hunting_quest_mythic_horse"
        local legendName = "Mythic Horse"
        local rewardExp = 1150000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_horse.displayName
		local mobs = huntingListQuest.mythic_horse.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 horses in mythic horse, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,

    mythic_ox = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_ox"
        local registryName = "hunting_quest_mythic_ox"
        local legendName = "Mythic Ox"
        local rewardExp = 1500000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_ox.displayName
		local mobs = huntingListQuest.mythic_ox.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 oxen in mythic ox, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,

    mythic_pig = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_pig"
        local registryName = "hunting_quest_mythic_pig"
        local legendName = "Mythic Pig"
        local rewardExp = 1750000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_pig.displayName
		local mobs = huntingListQuest.mythic_pig.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 pigs in mythic pig, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,

    mythic_snake = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_snake"
        local registryName = "hunting_quest_mythic_snake"
        local legendName = "Mythic Snake"
        local rewardExp = 2000000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_snake.displayName
		local mobs = huntingListQuest.mythic_snake.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 snakes in mythic snake, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,
    
    mythic_sheep = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_sheep"
        local registryName = "hunting_quest_mythic_sheep"
        local legendName = "Mythic Sheep"
        local rewardExp = 2750000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_sheep.displayName
		local mobs = huntingListQuest.mythic_sheep.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 sheep in mythic sheep, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,

    mythic_tiger = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_tiger"
        local registryName = "hunting_quest_mythic_tiger"
        local legendName = "Mythic Tiger"
        local rewardExp = 3000000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_tiger.displayName
		local mobs = huntingListQuest.mythic_tiger.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 tigers in mythic tiger, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,
    
    mythic_dragon = function(player, npc)
        local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

        local questName = "killing_quest_mythic_dragon"
        local registryName = "hunting_quest_mythic_dragon"
        local legendName = "Mythic Dragon"
        local rewardExp = 4000000000
        local rewardGold = 5000
        local mobName = huntingListQuest.mythic_dragon.displayName
		local mobs = huntingListQuest.mythic_dragon.mobs
        local totalHunting = player.registry[registryName]
        local newTotalHunting = totalHunting + 1

        if  player.registry[questName] == 1 then
            local killCount = huntingQuest.calculateKillCount(player, mobs)
            local maxKills = 500
    
            if (killCount >= maxKills) then
                player:giveXP(rewardExp)
                player:addGold(rewardGold)
                player.karma = player.karma + 0.1
                player.registry[registryName] = newTotalHunting

                if (player:hasLegend(registryName)) then
                    player:removeLegendbyName(registryName)
                end
                
                for i = 1, #mobs do
                    local mob = mobs[i]
                    player.registry[_huntingQuestKillCount .. mob] = 0
                    player:flushKills(mob)
                end

                player.registry[questName] = 0

                player:addLegend(
                    "Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
                    registryName,
                    3,
                    128
                )
                player:forceSave()
                
                player:dialogSeq({t, "Thank you, my friend. You have done a great service, please take these rewards as a token of our gratitude."}, 0)
                return
            else
                player:dialogSeq({t, "Come back to me when you finish the task"}, 0)
                return
            end
        end

        player:dialogSeq({t, "Your task is to killing 500 dragons in mythic dragon, the boss doesn't count"}, 1)
        player.registry[questName] = 1

		for i = 1, #mobs do
			local mob = mobs[i]
			player.registry[_huntingQuestKillCount .. mob] = player:killCount(mob)
		end

        player:forceSave()
    end,
}