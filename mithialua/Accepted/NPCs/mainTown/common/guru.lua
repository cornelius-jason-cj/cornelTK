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
      table.insert(opts, "---------------------")
      table.insert(opts, "Gathering Quest")
      -- table.insert(opts, "Mythic Quest")
    end
    
    -- if player.level == 99 then
    --   table.insert(opts, "Gathering Quest")
    -- end
    
    -- if player.level < 99 then
    --   table.insert(opts, "I need your guidance")
    -- end

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
        "Welcome to our town! I'm Cornel, and I'll help you get started.",
        "First, go to Heimdall (17,42) and select Field 00",
        "Hunt squirrels and rabbits, then collect 10 Acorns and 10 Rabbit Meat",
        "You can come back to town using return spell"
      },
      1
    )        

    choice2 = player:menuString(
      "Do you bring 10 acorn and 10 rabbit meat?",
      {"Yes", "No"}
    )
    if choice2 == "Yes" then
        if player:hasItem("acorn", 10) == true and player:hasItem('rabbit_meat', 10) == true then
            player:dialogSeq(
                {
                  t,
                  "Great job!",
                  "Remember, dropped items can't be used directly. You need to craft them into usable items first.",
                  "Go to the Lien at (044, 034) and craft small meat.",
                  "After that, you can use the small meat to help with hunting. Come back to me once you reach level 5."
                },
                1
            )
            player:giveXP(2000)
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
      local opts = {}
      
      if player:hasLegend("explore_field_cave_02") == true then
        table.insert(opts, "Field Cave 02")
      end

      if player:hasLegend("explore_field_cave_03") == true then
        table.insert(opts, "Field Cave 03")
      end

      if player:hasLegend("explore_field_cave_04") == true then
        table.insert(opts, "Field Cave 04")
      end

      if player:hasLegend("explore_field_cave_05") == true then
        table.insert(opts, "Field Cave 05")
      end

      local choice = player:menuString(
        "Which cave do you want to explore?",
        opts
      )

      if choice == "Field Caves 02" then
        explorationFieldQuest.fieldCaves(player, npc)
      end

      if choice == "Field Caves 03" then
        explorationFieldQuest.fieldCaves(player, npc)
      end

      if choice == "Field Caves 04" then
        explorationFieldQuest.fieldCaves(player, npc)
      end

      if choice == "Field Caves 05" then
        explorationFieldQuest.fieldCaves(player, npc)
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
			player:sendAnimation(296)
			player:sendAnimation(297)
      player:setAether("guru_heal", 30000)
      player:sendStatus()
		end
	end),
}