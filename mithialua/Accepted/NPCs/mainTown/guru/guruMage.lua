MageGuruNpc = {
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


		if player.class == 0 then
			table.insert(opts, "Become a Mage")
		elseif player.baseClass ~= 3 then
			player:dialogSeq({t, "I'm not your Guru"}, 0)
		elseif player.baseClass == 3 then
			-- table.insert(opts, "Learn Secret")
      -- table.insert(opts, "Forget Secret")
			-- table.insert(opts, "Karma Check")
      table.insert(opts,"Build Guide")
      table.insert(opts, "---------------------")
      table.insert(opts, "Quest Weapon")
      table.insert(opts, "Quest Armor")
		end

		-- if player.level >= 15 and
		--   player.registry["first_assignment"] == 0
    -- then
		-- 	table.insert(opts, "Take First Assignment")
		-- end

		-- if player.level >= 35 and
    --   player.registry["first_assignment"] == 1 and
    --   player.registry["second_assignment"] == 0
    -- then
		-- 	table.insert(opts, "Take Second Assignment")
		-- end
		
		-- if player.level >= 55 and
    --   player.registry["first_assignment"] == 1 and
    --   player.registry["second_assignment"] == 1 and
    --   player.registry["third_assignment"] == 0
    -- then
		-- 	table.insert(opts, "Take Third Assignment")
		-- end

		local choice = player:menuString(
			"Hello! How can I help you today?",
			opts
		)
		local choice2

		if choice == "---------------------" then
			return
		end

		if choice == "Become a Mage" then
			if player.level < 5 then
				player:dialogSeq(
					{
						t,
						"Hail, little one! Please return to me when you have reached the 5th insight."
					},
					0
				)
				return
			end

			player:dialogSeq(
				{
					t,
					"Hail, mighty one! Welcome to my sanctuary, the sanctuary of the healer.",
					"Have you come to pick your path? I think you would make a great mage, and a great hero."
				},
				1
			)

			choice2 = player:menuString(
				"Will you join the path of the mage?",
				{"Yes", "No"}
      )
            
      if choice2 == "Yes" then
        player:dialogSeq(
          {
            t,
            "Great! You have made a great decision. I see you becoming a great hero in these lands. Now let me set you up with some supplies."
          },
          1
        )

				if player.sex == 0 then
					player:addItem("peasant_garb", 1)
				end

				if player.sex == 1 then
          player:addItem("peasant_dress", 1)
				end

        player:addItem("red_horse_mount", 1)
        player:addItem("wooden_saber", 1)
        player:addGold(50)
        player:updatePath(3, 0)
				player.baseHealth = 250
				player.baseMagic = 350
        player.baseMight = 5
        player.baseGrace = 5
        player.baseWill = 5
				player.registry["start_journey"] = 2
				player:calcStat()
				player:sendStatus()
    
        player:dialogSeq(
          {
            t,
            "Here is some armor, and a weapon. These are specific to the mage path, and will help get you started.",
            "I have also given you some gold, it's all I can spare right now. It will help you with repairs, and getting some other equipment like rings.",
            "You also have four herb pipes, these will replenish your mana. Once they are used up you should buy some more, shop keepers around town sell them",
            "If you wish to learn some skills let me know, I can teach you many things to help you in battle."
          },
          1
        )
      end
            
      if choice2 == "No" then
        player:dialogSeq(
          {
            t,
            "Very well, I will be waiting here if you change your mind. I am seeking great people all the time to join this great path."
          },
          1
        )
      end
    end

		if choice == "Divine Secret" then
			player:futureSpells(npc)
    end
		
    if choice == "Learn Secret" then
			player:learnMagic(npc)
		end
        
    if choice == "Forget Secret" then
      player:forgetSpell(npc)
    end

    if choice == "Quest Weapon" then
      weaponQuest.basicWeapon(player, npc)
    end

    if choice == "Quest Armor" then
      armorQuest.basicArmor(player, npc)
    end

		if choice == "Take First Assignment" then
      assignmentQuest.firstAssignment(player, npc)
		end

		if choice == "Take Second Assignment" then
			player:dialogSeq(
				{
					t,
          "Hello, here is your second assigment",
          "Collect\n25 pcs fox fur\n25 pcs red fox fur\n5 pcs fox tail ",
				},
				1
			)
            choice2 = player:menuString(
				"Do you bring all the requirement items?",
				{"Yes", "No"}
			)
			if choice2 == "Yes" then
				if player:hasItem("fox_fur", 25) == true and
				player:hasItem('red_fox_fur', 25) == true and
				player:hasItem('fox_tail', 5) == true then
                    player:dialogSeq(
                        {
                            t,
                            "Great job!",
							"Here is your reward"
                        },
                        1
                    )

					player:removeItem("fox_fur",25)
					player:removeItem("red_fox_fur",25)
					player:removeItem("fox_tail",5)

                    player.registry["second_assignment"] = 1
					player:addItem("cursed_staff", 1)
										
					if player.sex == 0 then 
						player:addItem("sky_clothes", 1)
					end
					
					if player.sex == 1 then
						player:addItem("winter_skirt", 1)
					end
                else 
                    player:dialogSeq({t, "Come back to me when you have those items"}, 0)
                end
			end

			if choice2 == "No" then
                player:dialogSeq({t, "Okay see you later"}, 0)
            end
		end

		if choice == "Take Third Assignment" then
			player:dialogSeq(
				{
					t,
                    "Hello, here is your third assigment",
                    "Collect 25 pcs mage bone and 1 Large amber ring",
				},
				1
			)
            choice2 = player:menuString(
				"Do you bring all the requirement items?",
				{"Yes", "No"}
			)
			if choice2 == "Yes" then
				if player:hasItem("mage_bone", 25) == true and
				player:hasItem('large_amber_ring', 1) == true then
                    player:dialogSeq(
                        {
                            t,
                            "Great job!",
							"Here is your reward"
                        },
                        1
                    )

					player:removeItem("mage_bone",25)
					player:removeItem("large_amber_ring",1)

                    player.registry["third_assignment"] = 1
					player:addItem("star_staff", 1)
					if player.sex == 0 then 
						player:addItem("earth_clothes", 1)
					end
					
					if player.sex == 1 then
						player:addItem("earth_skirt", 1)
					end
                else 
                    player:dialogSeq({t, "Come back to me when you have those items"}, 0)
                end
			end

			if choice2 == "No" then
                player:dialogSeq({t, "Okay see you later"}, 0)
            end
		end

		if choice == "Karma Check" then
			choice2 = player:menuString(
				"Ah, you wish to uncover the truth of your karma? Bring me 2 pieces of gold acorn, and I shall reveal it to you. Do you accept this task?",
				{"Yes, I accept", "No, maybe later"}
			)

			if choice2 == "Yes, I accept" then
				if player:hasItem("gold_acorn", 2) ~= true then
					player:dialogSeq({t, "Come back to me when you have those items"}, 0)
					return
				end

				local karmaPoint = player.karma

                player:removeItem("gold_acorn", 2)
				player:dialogSeq({t, "Your Karma Points:\n" .. karmaPoint .. " points"}, 0)

			end
			
			if choice2 == "No, maybe later" then
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

		if speech == "explore" then
			if player.registry["explore_bat_cave"] == 1 then
				if player:hasItem("ginseng", 15) == true then
					player:dialogSeq(
						{
							t,
							"Ah, you've returned with proof of your exploration! Let's have a look... Yes, I see the ginseng you've brought. Thank you very much for your efforts!",
							"Now, return to the Guru to see your progress and will have a reward waiting for you."
						},
						1
					)
					player:removeItem("ginseng", 15)
					player.registry["explore_bat_cave"] = 2
					player:msg(
						0,
						"==[Quest Update]==",
						player.ID
					)
				else 
					player:dialogSeq(
						{
							t,
							"Ah, you've come back to show proof of your exploration Hmm, it seems you do not have the proof I was expecting. Please return once you've gathered it!",
						},
						1
					)
				end
			end
			if player.registry["explore_fox_cave"] == 1 then
				if player:hasItem("amethyst", 1) == true then
					player:dialogSeq(
						{
							t,
							"Ah, you've returned with proof of your exploration! Let's have a look... Yes, I see the amethyst you've brought. Thank you very much for your efforts!",
							"Now, return to the Guru to see your progress and will have a reward waiting for you."
						},
						1
					)
					player:removeItem("amethyst", 1)
					player.registry["explore_fox_cave"] = 2
					player:msg(
						0,
						"==[Quest Update]==",
						player.ID
					)
				else 
					player:dialogSeq(
						{
							t,
							"Ah, you've come back to show proof of your exploration Hmm, it seems you do not have the proof I was expecting. Please return once you've gathered it!",
						},
						1
					)
				end
			end
			return
		end

		if speech == "fire staff" and
		player.level >=75 then

			if player.registry["craft_fire_staff"] == 2 then
				player:dialogSeq({t, "You have craft this staff"}, 0)
				return
			end

			if player.registry["craft_fire_staff"] == 1 then
				local choice = player:menuString(
					"Did you bring the materials?",
					{"Yes", "No"}
				)

				if choice == "Yes" then
					if player:hasItem("ore", 50) == true and
					player:hasItem("metal", 50) == true and
					player:hasItem("tarnished_amber", 50) == true and
					player:hasItem("mage_seal", 25) == true then
						player.karma = player.karma + 1
						player.registry["craft_fire_staff"] = 2
						player:removeItem("ore",50)
						player:removeItem("metal",50)
						player:removeItem("tarnished_amber",50)
						player:removeItem("mage_seal",25)
						player:addItem(2010, 1)
						player:sendAnimation(49)
						player:addLegend(
							"Craft Fire Staff",
							"craft_fire_staff",
							4,
							12
                    	)
						player:forceSave()
						
						local message = "[CRAFT]: " .. player.name .. " successfuly craft fire staff"
						broadcast(-1, message)
						player:dialogSeq(
							{
								t,
								"Here take the fire staff",
							},
							0
						)
					else 
						player:dialogSeq({t, "Come back to me when you have those items"}, 0)
					end
				end

				if choice == "No" then
				end
			end

			if player.registry["craft_fire_staff"] == 0 then
				player:dialogSeq(
					{
						t,
						"Ah, so you have heard tales of a staff that blazes with the fury of fire.",
						"I can see it in your eyes you are seeking a weapon of true power, we called it Fire Staff,",
						"Crafting such a weapon is no simple task. The staff requires rare ingredients and a steady hand."
					},
					1
				)
				local choice = player:menuString(
					"Are you sure you're ready for the challenge?",
					{"Yes, I am ready", "No, I am not"}
				)

				if choice == "Yes, I am ready" then
					player:dialogSeq(
						{
							t,
							"Very well. I will tell you only once",
							"You must bring me four things:\n50 pcs ore\n50 pcs metal\n50 pcs tarnished amber\n25 pcs mage seal",
							"Once you've gathered the materials, return here, and I will start the forging."
						},
						1
					)

					player.registry["craft_fire_staff"] = 1
					player:msg(
						0,
						"==[Quest Update]==",
						player.ID
					)
				end

				if choice == "No, I am not" then
					player:dialogSeq({t, "Come back to me when you are ready"}, 0)
				end
			end
		end
	end)
}
