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

MayorOfCityNpc = {
    click = async(function(player, npc)
		local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}
		player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.dialogType = 0
		player.lastClick = npc.ID

		local opts = {}

    if player.registry["start_journey"] == 0 then
        table.insert(opts, "Start Journey")
    end

    if player.registry["start_journey"] == 1 and player.class == 0 then
        table.insert(opts, "I have reach level 5")
    end

    if player.class ~= 0 then
      table.insert(opts, "Exploration Quest")
      -- table.insert(opts, "Mythic Quest")
    end
    
    if player.level == 99 then
      table.insert(opts, "Gathering Quest")
    end

    table.insert(opts, "---------------------")
    
    if player.level < 99 then
      table.insert(opts, "I need your guidance")
    end

    if player.registry["hunting_quest_mythic_rabbit"] >= 50 and
        player.registry["mythic_rabbit_favor"] == 0 then
        table.insert(opts, "Mythic Rabbit Favor")
    end

    if player.registry["hunting_quest_mythic_monkey"] >= 50 and
        player.registry["mythic_monkey_favor"] == 0 then
        table.insert(opts, "Mythic Monkey Favor")
    end

    if player.registry["hunting_quest_mythic_dog"] >= 50 and
        player.registry["mythic_dog_favor"] == 0 then
        table.insert(opts, "Mythic Dog Favor")
    end
    
    if player.registry["hunting_quest_mythic_rooster"] >= 50 and
        player.registry["mythic_rooster_favor"] == 0 then
        table.insert(opts, "Mythic Rooster Favor")
    end

    if player.registry["hunting_quest_mythic_rat"] >= 50 and
        player.registry["mythic_rat_favor"] == 0 then
        table.insert(opts, "Mythic Rat Favor")
    end

    if player.registry["hunting_quest_mythic_horse"] >= 50 and
        player.registry["mythic_horse_favor"] == 0 then
        table.insert(opts, "Mythic Horse Favor")
    end

    if player.registry["hunting_quest_mythic_ox"] >= 50 and
        player.registry["mythic_ox_favor"] == 0 then
        table.insert(opts, "Mythic Ox Favor")
    end

    if player.registry["hunting_quest_mythic_pig"] >= 50 and
        player.registry["mythic_pig_favor"] == 0 then
        table.insert(opts, "Mythic Pig Favor")
    end

    if player.registry["hunting_quest_mythic_snake"] >= 50 and
        player.registry["mythic_snake_favor"] == 0 then
        table.insert(opts, "Mythic Snake Favor")
    end
    
    if player.registry["hunting_quest_mythic_sheep"] >= 50 and
        player.registry["mythic_sheep_favor"] == 0 then
        table.insert(opts, "Mythic Sheep Favor")
    end
    
    if player.registry["hunting_quest_mythic_tiger"] >= 50 and
        player.registry["mythic_tiger_favor"] == 0 then
        table.insert(opts, "Mythic Tiger Favor")
    end
    
    if player.registry["hunting_quest_mythic_dragon"] >= 50 and
        player.registry["mythic_dragon_favor"] == 0 then
        table.insert(opts, "Mythic Dragon Favor")
    end

    if player.registry["soul_bridge"] == 0 then
        table.insert(opts, "Soul Bridge")
    end

		local choice = player:menuString(
			"Hello! How can I help you today?",
			opts
		)

		local choice2
    
		if choice == "---------------------" then
			return
		end

    if choice == "Start Journey" then
      player:dialogSeq(
      {
        t,
        "Welcome to our town! I'm Cornelius, and I'll help you get started.",
        "First, please hunt squirrels and rabbits.",
        "Then come to me when you got 5 acorn and 5 rabbit meat"
      },
      1
    )        

      choice2 = player:menuString(
        "Do you bring 5 acorn and 5 rabbit meat?",
        {"Yes", "No"}
			)
      if choice2 == "Yes" then
        if player:hasItem("acorn", 5) == true and player:hasItem('rabbit_meat', 5) == true then
            player:dialogSeq(
                {
                  t,
                  "Great job!",
                  "Remember, you can't use dropped items until you craft them into usable items.",
                  "Go to the Lien at (044, 034) and craft the meat.",
                  "After that, you can use the meat to help with hunting. Come back to me once you reach level 5."
                },
                1
            )
            -- player:addItem("wooden_sabre", 1)
            -- player:addItem("small_meat", 1)
            -- player:addItem("herb_pipe", 1)
            player:giveXP(750)
            player.registry["start_journey"] = 1
        else 
            player:dialogSeq({t, "Come back to me when you have those items"}, 0)
        end
    end
            
    if choice2 == "No" then
      player:dialogSeq({t, "Okay see you later"}, 0)
      end
    end

    if choice == "I have reach level 5" then
      if player.level ~= 5 then 
        player:dialogSeq({t, "Come back to me when you have reach level 5, you can earn EXP by crafting items at (044, 034)"}, 0)
      end 
            
      player:dialogSeq(
				{
					t,
          "Great job! Now it's time to choose your class.",
          "There are four classes: Warrior, Rogue, Mage, and Poet.",
          "Warriors are melee fighters with strong armor and moderate damage.",
          "Rogues are melee fighters with high damage but moderate armor.",
          "Mages are ranged fighters with high DPS but weak armor.",
          "Poets can fight both melee and ranged, excelling in support spells with normal armor."
				},
				1
			)
      choice2 = player:menuString(
				"Which class do you want to choose?",
				{"Warrior", "Rogue", "Mage", "Poet"}
			)

      if choice2 == "Warrior" then
        player:dialogSeq(
          {
            t,
            "Great Choice!",
            "I will transfer you to Warrior Guru"
          },
          1
        )
        player:warp(101, 8, 7)
        elseif choice2 == "Rogue" then
          player:dialogSeq(
            {
              t,
              "Great Choice!",
              "I will transfer you to Rogue Guru"
            },
            1
          )
          player:warp(101, 41, 7)
        elseif choice2 == "Mage" then
          player:dialogSeq(
            {
              t,
              "Great Choice!",
              "I will transfer you to Mage Guru"
            },
            1
          )
          player:warp(101, 19, 7)
        elseif choice2 == "Poet" then
          player:dialogSeq(
            {
              t,
              "Great Choice!",
              "I will transfer you to Poet Guru"
            },
            1
          )
          player:warp(101, 30, 7)
        end
      end

      if choice == "Rare Weapon" then
        if (player.class == 1 and player.registry["learn_repair_blue_dragon_sword"] == 1) or
        (player.class == 2 and player.registry["learn_repair_white_tiger_blade"] == 1) or
        (player.class == 3 and player.registry["learn_repair_red_phoenix_staff"] == 1) or
        (player.class == 4 and player.registry["learn_repair_black_turtle_fan"] == 1) then
          player:dialogSeq(
            {
              t,
              "You already have my blessing you go repair the weapon",
            },
            1
          )
          return
        end

        player:dialogSeq(
          {
            t,
            "I've heard a rumor about a mysterious purple pig-like creature.",
            "They say it drops rare weapons for warriors, rogues, mages, and poets.",
            "If you happen to have one of those broken items, I can guide you on how to repair it."
          },
          1
        )

        local opts = {}

        if player.class == 1 and player:hasItem("broken_blue_dragon_sword", 1) == true then
          table.insert(opts, "Broken Blue Dragon Sword")
        end

        if player.class == 2 and player:hasItem("broken_white_tiger_blade", 1) == true then
          table.insert(opts, "Broken White Tiger Blade")
        end

        if player.class == 3 and player:hasItem("broken_red_phoenix_staff", 1) == true then
          table.insert(opts, "Broken Red Phoenix Staff")
        end

        if player.class == 4 and player:hasItem('broken_black_turtle_fan', 1) == true then
          table.insert(opts, "Broken Black Turtle Fan")
        end

        if #opts == 0 then
          player:dialogSeq({t, "Return to me once you have obtained one of the rare weapons."}, 1)
        else 
          local choice2 = player:menuString(
            "Which weapon would you like to repair?",
            opts
          )

          if choice2 == "Broken Blue Dragon Sword" then
            player:dialogSeq(
              {
                t,
                "Okay listen carefully, to repair this broken blue dragon sword",
                "You need \n- 1 pcs of pure gold\n- 1 pcs of pure meat\n- 10 pcs of warrior bone",
                "You can ask your master about how to craft pure gold and pure meat",
                "Last I give you my blessing to repair that weapon"
              },
              1
            )
            player:sendAnimation(49)
            player.registry["learn_repair_blue_dragon_sword"] = 1
          end

          if choice2 == "Broken White Tiger Blade" then
            player:dialogSeq(
              {
                t,
                "Okay listen carefully, to repair this Broken White Tiger Blade",
                "You need \n- 1 pcs of pure gold\n- 1 pcs of pure meat\n- 10 pcs of rogue bone",
                "You can ask your master about how to craft pure gold and pure meat",
                "Last I give you my blessing to repair that weapon"
              },
              1
            )
            player:sendAnimation(49)
            player.registry["learn_repair_white_tiger_blade"] = 1
          end

          if choice2 == "Broken Red Phoenix Staff" then
            player:dialogSeq(
              {
                t,
                "Okay listen carefully, to repair this Broken Red Phoenix Staff",
                "You need \n- 1 pcs of pure gold\n- 1 pcs of pure meat\n- 10 pcs of mage bone",
                "You can ask your master about how to craft pure gold and pure meat",
                "Last I give you my blessing to repair that weapon"
              },
              1
            )
            player:sendAnimation(49)
            player.registry["learn_repair_red_phoenix_staff"] = 1
          end

          if choice2 == "Broken Black Turtle Fan" then
            player:dialogSeq(
              {
                t,
                "Okay listen carefully, to repair this Broken Black Turtle Fan",
                "You need \n- 1 pcs of pure gold\n- 1 pcs of pure meat\n- 10 pcs of poet bone",
                "You can ask your master about how to craft pure gold and pure meat",
                "Last I give you my blessing to repair that weapon"
              },
              1
            )
            player:sendAnimation(49)
            player.registry["learn_repair_black_turtle_fan"] = 1
          end
        end
      end

      if choice == "I need your guidance" then
        local level = player.level

        if level < 15 then
          player:dialogSeq(
            {
              t,
              "Greetings, young one. I sense you are seeking knowledge and guidance on your journey.",
              "As you grow stronger, you will soon find yourself at a pivotal point... When you reach level 15, your guru will bestow upon you a challenging assignment.",
              "You will need to prove your worth. From what I've heard, you will be required to gather 15 items dropped by the creatures and mysteries lurking in fields and caves.",
              "Here is the cave coordinates\nField 01 (001, 013)\nField 02 (015, 010)\nField 03 (004, 016)",
              "This is all I can reveal for now. Stay vigilant and trust in your path, for many trials lie ahead."
            },
            1
          )
        end

        if level < 35 then
          player:dialogSeq(
            {
              t,
              "Greetings, young one. I sense you are seeking knowledge and guidance on your journey.",
              "As you grow stronger, you will soon find yourself at a pivotal point... When you reach level 35, your guru will bestow upon you a challenging assignment.",
              "You will need to prove your worth. From what I've heard, you will be required to gather items dropped by the creatures in fox cave.",
              "Fox cave is located at poet village then you go to field 09 (004, 014)",
              "This is all I can reveal for now. Stay vigilant and trust in your path, for many trials lie ahead."
            },
            1
          )
          return
        end

        if level < 55 then
          player:dialogSeq(
            {
              t,
              "Greetings, young one. I sense you are seeking knowledge and guidance on your journey.",
              "As you grow stronger, you will soon find yourself at a pivotal point... When you reach level 55, your guru will bestow upon you a challenging assignment.",
              "You will need to prove your worth. From what I've heard, you will be required to gather bones dropped by the creatures in skeleton cave.",
              "Skeleton cave is located at rogue village then you go to field 09 (004, 014)",
              "This is all I can reveal for now. Stay vigilant and trust in your path, for many trials lie ahead."
            },
            1
          )
          return
        end
      end

      if choice == "Exploration Quest" then
        local opts = {"Field Caves"}

        if player.level >= 25 then
          table.insert(opts, "Mythic Caves")
        end

        if player.level >= 45 then
          table.insert(opts, "Shadowed Crypts")
        end

        local choice = player:menuString(
          "Which cave do you want to explore?",
          opts
        )

        if choice == "Field Caves" then
          explorationFieldQuest.fieldCaves(player, npc)
        end

        if choice == "Shadowed Crypts" then
          explorationQuest.shadowedCrypts(player, npc)
        end

        if choice == "Mythic Caves" then
          explorationQuest.myhthicCaves(player, npc)
        end
      end

      if choice == "Gathering Quest" then
        if player.level < 99 then
          player:dialogSeq({t, "You are not strong enough my friends, comeback when you are lv 99"}, 0)
        else
          gatheringQuest.amber(player, npc)
        end
      end

      if choice == "Mythic Quest" then
        local opts = {}

        local activeQuestStatus = false
        local activeQuestName

        for _, quest in ipairs(questList) do
          if player.registry[quest] == 1 then
            activeQuestStatus = true
            activeQuestName = quest
            break
          end
        end

        if activeQuestStatus == true then
          if activeQuestName == "killing_quest_mythic_rabbit" then
            table.insert(opts, "Mythic Rabbit")
          end
          if activeQuestName == "killing_quest_mythic_monkey" then
            table.insert(opts, "Mythic Monkey")
          end
          if activeQuestName == "killing_quest_mythic_dog" then
            table.insert(opts, "Mythic Dog")
          end
          if activeQuestName == "killing_quest_mythic_rooster" then
            table.insert(opts, "Mythic Rooster")
          end
          if activeQuestName == "killing_quest_mythic_rat" then
            table.insert(opts, "Mythic Rat")
          end
          if activeQuestName == "killing_quest_mythic_horse" then
            table.insert(opts, "Mythic Horse")
          end
          if activeQuestName == "killing_quest_mythic_ox" then
            table.insert(opts, "Mythic Ox")
          end
          if activeQuestName == "killing_quest_mythic_pig" then
            table.insert(opts, "Mythic Pig")
          end
          if activeQuestName == "killing_quest_mythic_snake" then
            table.insert(opts, "Mythic Snake")
          end
          if activeQuestName == "killing_quest_mythic_sheep" then
            table.insert(opts, "Mythic Sheep")
          end
          if activeQuestName == "killing_quest_mythic_tiger" then
            table.insert(opts, "Mythic Tiger")
          end
          if activeQuestName == "killing_quest_mythic_dragon" then
            table.insert(opts, "Mythic Dragon")
          end
        else 
          table.insert(opts, "Mythic Rabbit")
          table.insert(opts, "Mythic Monkey")
          table.insert(opts, "Mythic Dog")
          table.insert(opts, "Mythic Rooster")
          table.insert(opts, "Mythic Rat")
          table.insert(opts, "Mythic Horse")
          table.insert(opts, "Mythic Ox")
          table.insert(opts, "Mythic Pig")
          table.insert(opts, "Mythic Snake")
          table.insert(opts, "Mythic Sheep")
          table.insert(opts, "Mythic Tiger")
          table.insert(opts, "Mythic Dragon")
        end


        local choice = player:menuString(
          "Which cave do you want to hunt?",
          opts
        )
          
        if choice == "Mythic Rabbit" then
          huntingQuest.mythic_rabbit(player, npc)
        end

        if choice == "Mythic Monkey" then
          huntingQuest.mythic_monkey(player, npc)
        end

        if choice == "Mythic Dog" then
          huntingQuest.mythic_dog(player, npc)
        end

        if choice == "Mythic Rooster" then
          huntingQuest.mythic_rooster(player, npc)
        end

        if choice == "Mythic Rat" then
          huntingQuest.mythic_rat(player, npc)
        end

        if choice == "Mythic Horse" then
          huntingQuest.mythic_horse(player, npc)
        end

        if choice == "Mythic Ox" then
          huntingQuest.mythic_ox(player, npc)
        end

        if choice == "Mythic Pig" then
          huntingQuest.mythic_pig(player, npc)
        end

        if choice == "Mythic Snake" then
          huntingQuest.mythic_snake(player, npc)
        end

        if choice == "Mythic Sheep" then
          huntingQuest.mythic_sheep(player, npc)
        end

        if choice == "Mythic Tiger" then
          huntingQuest.mythic_tiger(player, npc)
        end
        
        if choice == "Mythic Dragon" then
          huntingQuest.mythic_dragon(player, npc)
        end
      end

      if choice == "Mythic Rabbit Favor" then
        mythicFavorQuest.mythic_rabbit(player, npc)
      end

      if choice == "Mythic Monkey Favor" then
        mythicFavorQuest.mythic_monkey(player, npc)
      end

      if choice == "Mythic Dog Favor" then
        mythicFavorQuest.mythic_dog(player, npc)
      end

      if choice == "Mythic Rooster Favor" then
        mythicFavorQuest.mythic_rooster(player, npc)
      end

      if choice == "Mythic Rat Favor" then
        mythicFavorQuest.mythic_rat(player, npc)
      end

      if choice == "Mythic Horse Favor" then
        mythicFavorQuest.mythic_horse(player, npc)
      end

      if choice == "Mythic Ox Favor" then
        mythicFavorQuest.mythic_ox(player, npc)
      end

      if choice == "Mythic Pig Favor" then
        mythicFavorQuest.mythic_pig(player, npc)
      end

      if choice == "Mythic Snake Favor" then
        mythicFavorQuest.mythic_snake(player, npc)
      end

      if choice == "Mythic Sheep Favor" then
        mythicFavorQuest.mythic_sheep(player, npc)
      end

      if choice == "Mythic Tiger Favor" then
        mythicFavorQuest.mythic_tiger(player, npc)
      end

      if choice == "Mythic Dragon Favor" then
        mythicFavorQuest.mythic_dragon(player, npc)
      end

      if choice == "Soul Bridge" then
          
        local opts = {"Yes, here it is", "No"}

        player:dialogSeq(
          {
            t, 
            "Ah, you've come seeking the power to meet with others at will? I can grant you that ability",
            "But first, you must prove your worth by gathering some materials. Only then will I grant you the means to connect with another soul.",
            "You must gather 10 pcs of these following items:\n- Well crafted amber\n- Well crafted dark amber\n- Well crafted white amber\n- Well crafted yellow amber",
          },
          1
        )

        local choice = player:menuString(
          "Have you bring those items?",
          opts
        )
  
        if choice == "Yes, here it is" then
          if player:hasItem("well_crafted_amber", 10) ~= true then
            player:dialogSeq({t, "It seems you don't have enough well crafted amber"}, 0)
            return
          end
              
          if player:hasItem("well_crafted_amber", 10) ~= true then
            player:dialogSeq({t, "It seems you don't have enough well crafted dark amber"}, 0)
            return
          end
              
          if player:hasItem("well_crafted_amber", 10) ~= true then
            player:dialogSeq({t, "It seems you don't have enough well crafted white amber"}, 0)
            return
          end

          if player:hasItem("well_crafted_amber", 10) ~= true then
            player:dialogSeq({t, "It seems you don't have enough well crafted yellow amber"}, 0)
            return
          end

          local choice2 = player:inputSeq(
            "Great! Now tell me the name of your soulmate",
            "",
            "",
            {},
            {}
          )

          if choice2 == "" then
            return
          end

          if choice2 == player.name then
            player:dialog("You can't marry yourself.", {})
            return
          end
          
          local target = Player(choice2)

          if target == nil then
            player:dialog("Player is not valid or not online.", {})
            return
          end

          local found = false

          local pcs = player:getObjectsInArea(BL_PC)
            for i = 1, #pcs do
                if pcs[i].ID == target.ID then
                    found = true
                end
            end

            if found == false then
                player:popUp("Your soulmate must be near you when you make this commitment.")
                return
            end

            if target:hasLegend("sould_bridge") or target.partner ~= 0 then
              player:dialog(
                target.name .. " is already committed to someone else!",
                {}
              )
              return
            end

            player:addLegend(
              "Soulmate with " .. target.name,
              "soul_bridge",
              6,
              1
            )

            target:addLegend(
              "Soulmate with " .. player.name,
              "soul_bridge",
              6,
              1
            )

            player:addSpell("soul_bridge")
            target:addSpell("soul_bridge")

            player.registry["soul_bridge"] = target.ID
            target.registry["soul_bridge"] = player.ID

            player.partner = target.ID
            target.partner = player.ID
            player:removeItem("well_crafted_amber", 10)
            player:removeItem("well_crafted_dark_amber", 10)
            player:removeItem("well_crafted_white_amber", 10)
            player:removeItem("well_crafted_yellow_amber", 10)

            broadcast(
              -1,
              "[CONGRATULATIONS] " .. player.name .. " and " .. target.name .. " has become soulmate!"
            )

            player:dialogSeq(
              {
                t,
                "You've done well! You are now free to teleport to them whenever you wish. Use this newfound power wisely.",
              },
              0
            )
          end

          if choice == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end
	end),

  onSayClick = async(function(player, npc)
		local speech = string.lower(player.speech)

		local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}
		player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.dialogType = 0
		player.lastClick = npc.ID

		if speech == "heal" then
      if player:hasDuration("guru_heal") then
        player:sendMinitext("Please wait aethers to settle. ")
        return
      end
      player.health = player.maxHealth
      player.magic = player.maxMagic
      player:updateState()
      player:calcStat()
			player:sendAnimation(64)
      player:setDuration("guru_heal", 30000)
      player:sendStatus()
		end
	end),
}