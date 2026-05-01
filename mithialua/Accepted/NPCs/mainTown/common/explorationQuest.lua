explorationQuest = {
    fieldCaves = function(player, npc)
      local t = {
        graphic = convertGraphic(npc.look, "monster"),
        color = npc.lookColor
      }
      local caves = {}
      
      if player.level < 15 then
        caves = {
          "Rat Cave",
          "Bat Cave",
          "Snake Cave",
        }
      elseif player.level >= 15 and player.level < 35 then
        caves = {
          "Bear Cave",
          "Tiger Cave",
        }
      elseif player.level >= 35 and player.level < 55 then
        caves = {
          "Fox Cave",
          "Scorpion Cave",
        }
      elseif player.level >= 55 and player.level < 75 then
        caves = {
          "Lobster Cave",
          "Ghost Cave",
        }
      else
        caves = {
          "Haunted House"
        }
      end


      local choice = player:menuString(
          "Which cave do you want to explore?",
          caves
      )

      if choice == "Rat Cave" then
          if player:hasLegend("explore_rat_cave") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "As proof of your exploration in the Rat Cave, I need you to bring back 10 pieces of Black Stone. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("mica", 10) == true then
                  player.karma = player.karma + 0.1
                  player:removeItem("mica",10)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Rat Cave",
                      "explore_rat_cave",
                      163,
                      6
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore rat cave",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end

      if choice == "Bat Cave" then
          if player:hasLegend("explore_bat_cave") == true or player.registry["explore_bat_cave"] == 3 then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          if player.registry["explore_bat_cave"] == 1 then
              player:dialogSeq({t, "You havent finish your task, bring 15 pieces of ginseng to mage guru and said explore"}, 0)
          end

          if player.registry["explore_bat_cave"] == 2 then
              player.registry["explore_bat_cave"] = 3
              player:sendAnimation(49)
              player.karma = player.karma + 0.1
              player:addLegend(
                  "Explore Bat Cave",
                  "explore_bat_cave",
                  163,
                  6
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore rat cave",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
              return
          end

          player:dialogSeq(
              {
                  t,
                  "As proof of your exploration in the Bat Cave, I need you to bring 15 pieces of ginseng to mage guru and said explore",
              },
              1
          )
          player.registry["explore_bat_cave"] = 1
          player:msg(
              0,
              "==[Quest Update]==",
              player.ID
          )
      end

      if choice == "Snake Cave" then
          if player:hasLegend("explore_snake_cave") == true or player.registry["explore_snake_cave"] == 3 then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          if player.registry["explore_snake_cave"] == 1 then
              player:dialogSeq({t, "You havent finish your task, bring 15 pieces of fine snake meat to poet guru and said explore"}, 0)
          end

          if player.registry["explore_snake_cave"] == 2 then
              player.registry["explore_snake_cave"] = 3
              player:sendAnimation(49)
              player.karma = player.karma + 0.1
              player:addLegend(
                  "Explore Snake Cave",
                  "explore_snake_cave",
                  163,
                  6
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore snake cave",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
              return
          end

          player:dialogSeq(
              {
                  t,
                  "As proof of your exploration in the Snake Cave, I need you to bring 15 pieces of fine snake meat to poet guru and said explore.",
              },
              1
          )

          
          player.registry["explore_snake_cave"] = 1
          player:msg(
              0,
              "==[Quest Update]==",
              player.ID
          )
      end

      if choice == "Bear Cave" then
          if player:hasLegend("explore_bear_cave") == true or player.registry["explore_bear_cave"] == 3 then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          if player.registry["explore_bear_cave"] == 1 then
              player:dialogSeq({t, "You havent finish your task, bring 1 pieces of splendid bear fur to warrior guru and said explore"}, 0)
          end

          if player.registry["explore_bear_cave"] == 2 then
              player.registry["explore_bear_cave"] = 3
              player:sendAnimation(49)
              player.karma = player.karma + 0.1
              player:addLegend(
                  "Explore Bear Cave",
                  "explore_bear_cave",
                  163,
                  6
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore bear cave",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
              return
          end

          player:dialogSeq(
              {
                  t,
                  "As proof of your exploration in the Bear Cave, I need you to bring 1 pieces of splendid bear fur to warrior guru and said explore.",
                  "To craft this item, you can use SHIFT + I for creation by combining 25 pieces of bear fur and 25 pieces of bear liver."
              },
              1
          )

          
          player.registry["explore_bear_cave"] = 1
          player:msg(
              0,
              "==[Quest Update]==",
              player.ID
          )
      end

      if choice == "Tiger Cave" then
          if player:hasLegend("explore_tiger_cave") == true or player.registry["explore_tiger_cave"] == 3 then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          if player.registry["explore_tiger_cave"] == 1 then
              player:dialogSeq({t, "You havent finish your task, bring 1 pieces of splendid tiger pelt to rogue guru and said explore."}, 0)
          end

          if player.registry["explore_tiger_cave"] == 2 then
              player.registry["explore_tiger_cave"] = 3
              player:sendAnimation(49)
              player.karma = player.karma + 0.1
              player:addLegend(
                  "Explore Tiger Cave",
                  "explore_tiger_cave",
                  163,
                  6
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore tiger cave",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
              return
          end

          player:dialogSeq(
              {
                  t,
                  "As proof of your exploration in the tiger Cave, I need you to bring 1 pieces of splendid tiger pelt to rogue guru and said explore",
                  "To craft this item, you can use SHIFT + I for creation by combining 25 pieces of tiger pelt and 25 pieces of tiger heart."
              },
              1
          )

          
          player.registry["explore_tiger_cave"] = 1
          player:msg(
              0,
              "==[Quest Update]==",
              player.ID
          )
      end

      if choice == "Fox Cave" then
          if player:hasLegend("explore_fox_cave") == true or player.registry["explore_fox_cave"] == 3 then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          if player.registry["explore_fox_cave"] == 1 then
              player:dialogSeq({t, "You havent finish your task, bring 1 pieces of amethyst to mage guru and said explore"}, 0)
          end

          if player.registry["explore_fox_cave"] == 2 then
              player.registry["explore_fox_cave"] = 3
              player:sendAnimation(49)
              player.karma = player.karma + 0.1
              player:addLegend(
                  "Explore Fox Cave",
                  "explore_fox_cave",
                  163,
                  6
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore fox cave",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
              return
          end

          player:dialogSeq(
              {
                  t,
                  "As proof of your exploration in the fox Cave, I need you to bring 1 pieces of amethyst to mage guru and said explore.",
                  "To craft this item, you can use SHIFT + I for creation by combining 25 fox fur, 25 red fox fur and 2 fox tail."
              },
              1
          )

          
          player.registry["explore_fox_cave"] = 1
          player:msg(
              0,
              "==[Quest Update]==",
              player.ID
          )
      end

      if choice == "Scorpion Cave" then
          if player:hasLegend("explore_scorpion_cave") == true or player.registry["explore_scorpion_cave"] == 3 then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          if player.registry["explore_scorpion_cave"] == 1 then
              player:dialogSeq({t, "You havent finish your task, bring 15 pieces of amber to warrior guru and said explore"}, 0)
          end

          if player.registry["explore_scorpion_cave"] == 2 then
              player.registry["explore_scorpion_cave"] = 3
              player:sendAnimation(49)
              player.karma = player.karma + 0.1
              player:addLegend(
                  "Explore Scorpion Cave",
                  "explore_scorpion_cave",
                  163,
                  6
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore scorpion cave",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
              return
          end

          player:dialogSeq(
              {
                  t,
                  "As proof of your exploration in the scorpion Cave, I need you to bring 15 pieces of amber to warrior guru and said explore.",
              },
              1
          )

          
          player.registry["explore_scorpion_cave"] = 1
          player:msg(
              0,
              "==[Quest Update]==",
              player.ID
          )
      end

      if choice == "Lobster Cave" then
          if player:hasLegend("explore_lobster_cave") == true or player.registry["explore_lobster_cave"] == 3 then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          if player.registry["explore_lobster_cave"] == 1 then
              player:dialogSeq({t, "You havent finish your task, bring 2 pcs of small ambe ring to poet guru and said explore"}, 0)
          end

          if player.registry["explore_lobster_cave"] == 2 then
              player.registry["explore_lobster_cave"] = 3
              player:sendAnimation(49)
              player.karma = player.karma + 0.1
              player:addLegend(
                  "Explore Lobster Cave",
                  "explore_lobster_cave",
                  163,
                  6
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore lobster cave",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
              return
          end

          player:dialogSeq(
              {
                  t,
                  "As proof of your exploration in the lobster Cave, I need you to bring 2 pcs of small ambe ring to poet guru and said explore.",
                  "You can craft this ring, by visiting NPC in every village ask him to create amber ring"
              },
              1
          )

          
          player.registry["explore_lobster_cave"] = 1
          player:msg(
              0,
              "==[Quest Update]==",
              player.ID
          )
      end

      if choice == "Ghost Cave" then
          if player:hasLegend("explore_ghost_cave") == true or player.registry["explore_ghost_cave"] == 3 then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          if player.registry["explore_ghost_cave"] == 1 then
              player:dialogSeq({t, "You havent finish your task, bring 5 pieces of ash and 1 piece of each type of bone to the Warrior Guru and said explore"}, 0)
          end

          if player.registry["explore_ghost_cave"] == 2 then
              player.registry["explore_ghost_cave"] = 3
              player:sendAnimation(49)
              player.karma = player.karma + 0.1
              player:addLegend(
                  "Explore Ghost Cave",
                  "explore_ghost_cave",
                  163,
                  6
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore ghost cave",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
              return
          end

          player:dialogSeq(
              {
                  t,
                  "As proof of your exploration in the Ghost Cave, please bring 5 pieces of ash and 1 piece of each type of bone to the Warrior Guru and said explore.",
              },
              1
          )

          
          player.registry["explore_ghost_cave"] = 1
          player:msg(
              0,
              "==[Quest Update]==",
              player.ID
          )
      end

      if choice == "Haunted House" then
          if player:hasLegend("explore_haunted_house") == true or player.registry["explore_haunted_house"] == 3 then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          if player.registry["explore_haunted_house"] == 1 then
              player:dialogSeq({t, "You havent finish your task, bring 1 piece of each type of seal to the Rogue Guru and said explore."}, 0)
          end

          if player.registry["explore_haunted_house"] == 2 then
              player.registry["explore_haunted_house"] = 3
              player:sendAnimation(49)
              player.karma = player.karma + 0.1
              player:addLegend(
                  "Explore Haunted House",
                  "explore_haunted_house",
                  163,
                  6
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore haunted house",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
              return
          end

          player:dialogSeq(
              {
                  t,
                  "As proof of your exploration in the Ghost Cave, please bring 1 piece of each type of seal to the Rogue Guru and said explore.",
                  "You can use SHIFT + I for creation the seal, here is the ingredients",
                  "War seal: 5 ash, 2 war bone\nRogue seal: 5 ash, 2 rog bone\nMage seal: 5 ash, 2 mage bone\nPoet seal: 5 ash, 2 poet bone"
              },
              1
          )

          
          player.registry["explore_haunted_house"] = 1
          player:msg(
              0,
              "==[Quest Update]==",
              player.ID
          )
      end
    end,

    shadowedCrypts = function(player, npc)
      local t = {
        graphic = convertGraphic(npc.look, "monster"),
        color = npc.lookColor
      }
      
      local caves = {}

      if player.level >= 45 and player.level < 65 then
        caves = {
          "Dark Crypt",
          "Vio Crypt",
        }
      elseif player.level >= 65 and player.level < 85 then
        caves = {
          "Brown Den",
          "White Den",
        }
      else
        caves = {
          "Skeleton Cave"
        }
      end


        local choice = player:menuString(
          "Which cave do you want to explore?",
          caves
        )

        if choice == "Dark Crypt" then
          if player:hasLegend("explore_dark_crypt") == true then
            player:dialogSeq({t, "You already explore this cave"}, 0)
            return
          end

          player:dialogSeq(
            {
              t,
              "To open dark crypt teleportation, I need you to bring back 100 pieces of mica. Only then will I know you've truly ventured into its depths.",
            },
            1
          )

          local choice2 = player:menuString(
            "Did you bring the proof I requested?",
            {"Yes", "No"}
          )

          if choice2 == "Yes" then
            if player:hasItem("mica", 100) == true then
              player.karma = player.karma + 0.1
              player:removeItem("mica",100)
              player:sendAnimation(49)
              player:addLegend(
                  "Explore Dark Crypt",
                  "explore_dark_crypt",
                  9,
                  15
              )
              player:forceSave()
              player:dialogSeq(
                {
                  t,
                  "Congratulations you have success to explore dark crypt",
                  "Now you can use teleport menu from f1"
                },
                0
              )
            else 
              player:dialogSeq({t, "Come back to me when you have those items"}, 0)
            end
          end

          if choice2 == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
          end
        end

        if choice == "Vio Crypt" then
          if player:hasLegend("explore_vio_crypt") == true then
            player:dialogSeq({t, "You already explore this cave"}, 0)
            return
          end

          player:dialogSeq(
            {
              t,
              "To open dark crypt teleportation, I need you to bring back 25 pieces of dark amber. Only then will I know you've truly ventured into its depths.",
            },
            1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
            if player:hasItem("dark_amber", 25) == true then
              player.karma = player.karma + 0.1
					    player:removeItem("dark_amber",25)
              player:sendAnimation(49)
              player:addLegend(
                  "Explore Vio Crypt",
                  "explore_vio_crypt",
                  9,
                  15
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore dark crypt",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
            else 
              player:dialogSeq({t, "Come back to me when you have those items"}, 0)
            end
          end

          if choice2 == "No" then
            player:dialogSeq({t, "Okay see you later"}, 0)
          end
        end

        if choice == "Brown Den" then
          if player:hasLegend("explore_brown_den") == true then
            player:dialogSeq({t, "You already explore this cave"}, 0)
            return
          end

          player:dialogSeq(
            {
              t,
              "To open brown den teleportation, I need you to bring back 5 pieces of herb pipe. Only then will I know you've truly ventured into its depths.",
            },
            1
          )

          local choice2 = player:menuString(
            "Did you bring the proof I requested?",
            {"Yes", "No"}
          )

          if choice2 == "Yes" then
            if player:hasItem("herb_pipe", 5) == true then
              player.karma = player.karma + 0.1
					    player:removeItem("herb_pipe",5)
              player:sendAnimation(49)
              player:addLegend(
                  "Explore Brown Den",
                  "explore_brown_den",
                  9,
                  15
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore brown den",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
              else 
                player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
            end

            if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
            end
        end

        if choice == "White Den" then
          if player:hasLegend("explore_white_den") == true then
            player:dialogSeq({t, "You already explore this cave"}, 0)
            return
          end

          player:dialogSeq(
            {
              t,
              "To open white den teleportation, I need you to bring back 15 pieces of white amber. Only then will I know you've truly ventured into its depths.",
            },
            1
          )

          local choice2 = player:menuString(
            "Did you bring the proof I requested?",
            {"Yes", "No"}
          )

          if choice2 == "Yes" then
            if player:hasItem("white_amber", 15) == true then
              player.karma = player.karma + 0.1
					    player:removeItem("white_amber", 15)
              player:sendAnimation(49)
              player:addLegend(
                "Explore White Den",
                "explore_white_den",
                9,
                15
              )
              player:forceSave()
              player:dialogSeq(
                {
                  t,
                  "Congratulations you have success to explore white den",
                  "Now you can use teleport menu from f1"
                },
                0
              )
              else 
                player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
            end

            if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
            end
        end

        if choice == "Skeleton Cave" then
          if player:hasLegend("explore_skeleton_cave") == true then
            player:dialogSeq({t, "You already explore this cave"}, 0)
            return
          end

          player:dialogSeq(
            {
              t,
              "To open Skeleton Cave teleportation, I need you to bring back 2 pieces of large amber ring. Only then will I know you've truly ventured into its depths.",
            },
            1
          )

          local choice2 = player:menuString(
            "Did you bring the proof I requested?",
            {"Yes", "No"}
          )

          if choice2 == "Yes" then
            if player:hasItem("large_amber_ring", 2) == true then
              player.karma = player.karma + 0.1
					    player:removeItem("large_amber_ring", 2)
              player:sendAnimation(49)
              player:addLegend(
                  "Explore Skeleton Cave",
                  "explore_skeleton_cave",
                  9,
                  15
              )
              player:forceSave()
              player:dialogSeq(
                  {
                      t,
                      "Congratulations you have success to explore skeleton cave",
                      "Now you can use teleport menu from f1"
                  },
                  0
              )
              else 
                player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
            end

            if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
            end
        end
    end,

    myhthicCaves = function(player, npc)
      local t = {
        graphic = convertGraphic(npc.look, "monster"),
        color = npc.lookColor
      }

      local caves = {}

      if player.level < 15 then
        caves = {
          "Rabbit",
          "Monkey",
        }
      elseif player.level >= 30 and player.level < 45 then
        caves = {
          "Dog",
          "Rooster",
        }
      elseif player.level >= 45 and player.level < 60 then
        caves = {
          "Rat",
          "Horse",
        }
      elseif player.level >= 60 and player.level < 75 then
        caves = {
          "Ox",
          "Pig",
        }
      elseif player.level >= 75 and player.level < 90 then
        caves = {
          "Snake",
          "Sheep",
        }
      else
        caves = {
          "Tiger",
          "Dragon",
        }
      end

      local choice = player:menuString(
          "Which cave do you want to explore?",
          caves
      )

      if choice == "Rabbit" then
          if player:hasLegend("explore_mythic_rabbit") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic rabbit teleportation, I need you to bring back 200 pieces of rabbit meat. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("rabbit_meat", 200) == true then
                  player.karma = player.karma + 0.1
        player:removeItem("rabbit_meat", 200)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Rabbit",
                      "explore_mythic_rabbit",
                      175,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic rabbit",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end

      if choice == "Monkey" then
          if player:hasLegend("explore_mythic_monkey") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic monkey teleportation, I need you to bring back 25 pieces of amber and dark amber. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("amber", 25) == true and
              player:hasItem("dark_amber", 25) == true then
                  player.karma = player.karma + 0.1
        player:removeItem("amber", 25)
        player:removeItem("dark_amber", 25)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Monkey",
                      "explore_mythic_monkey",
                      176,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic monkey",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end

      if choice == "Dog" then
          if player:hasLegend("explore_mythic_dog") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic dog teleportation, I need you to bring back 5 small amber ring. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("small_amber_ring", 5) == true then
                  player.karma = player.karma + 0.1
        player:removeItem("small_amber_ring", 5)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Dog",
                      "explore_mythic_dog",
                      177,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic dog",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end

      if choice == "Rooster" then
          if player:hasLegend("explore_mythic_rooster") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic rooster teleportation, I need you to bring back 50 dark amber and 25 white amber. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("dark_amber", 50) == true and
              player:hasItem("white_amber", 25) == true then
                  player.karma = player.karma + 0.1
        player:removeItem("dark_amber", 50)
        player:removeItem("white_amber", 25)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Rooster",
                      "explore_mythic_rooster",
                      178,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic rooster",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end

      if choice == "Rat" then
          if player:hasLegend("explore_mythic_rat") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic rat teleportation, I need you to bring back 100 tarnished amber. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("tarnished_amber", 100) == true then
                  player.karma = player.karma + 0.1
        player:removeItem("tarnished_amber", 100)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Rat",
                      "explore_mythic_rat",
                      175,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic rat",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end

      if choice == "Horse" then
          if player:hasLegend("explore_mythic_horse") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic horse teleportation, I need you to bring back 5 earth key. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("earth_key", 5) == true then
                  player.karma = player.karma + 0.5
        player:removeItem("earth_key", 5)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Horse",
                      "explore_mythic_horse",
                      176,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic horse",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end
      
      if choice == "Ox" then
          if player:hasLegend("explore_mythic_ox") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic ox teleportation, I need you to bring back 5 fire key. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("fire_key", 5) == true then
                  player.karma = player.karma + 0.5
        player:removeItem("fire_key", 5)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Ox",
                      "explore_mythic_ox",
                      177,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic Ox",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end

      if choice == "Pig" then
          if player:hasLegend("explore_mythic_pig") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic ox teleportation, I need you to bring back 5 wind key. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("wind_key", 5) == true then
                  player.karma = player.karma + 0.5
        player:removeItem("wind_key", 5)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Pig",
                      "explore_mythic_pig",
                      178,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic pig",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end

      if choice == "Snake" then
          if player:hasLegend("explore_mythic_snake") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic snake teleportation, I need you to bring back 5 heaven key. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("heaven_key", 5) == true then
                  player.karma = player.karma + 0.5
        player:removeItem("heaven_key", 5)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Snake",
                      "explore_mythic_snake",
                      175,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic snake",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end
      
      if choice == "Sheep" then
          if player:hasLegend("explore_mythic_sheep") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic sheep teleportation, I need you to bring back 5 pond key. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("pond_key", 5) == true then
                  player.karma = player.karma + 0.5
        player:removeItem("pond_key", 5)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Sheep",
                      "explore_mythic_sheep",
                      176,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic sheep",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end

      if choice == "Tiger" then
          if player:hasLegend("explore_mythic_tiger") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic sheep teleportation, I need you to bring back 5 thunder key. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("thunder_key", 5) == true then
                  player.karma = player.karma + 0.5
        player:removeItem("thunder_key", 5)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Tiger",
                      "explore_mythic_tiger",
                      177,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic tiger",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end

      if choice == "Dragon" then
          if player:hasLegend("explore_mythic_dragon") == true then
              player:dialogSeq({t, "You already explore this cave"}, 0)
              return
          end

          player:dialogSeq(
              {
                  t,
                  "To open mythic dragon teleportation, I need you to bring back 5 water key. Only then will I know you've truly ventured into its depths.",
              },
              1
          )

          local choice2 = player:menuString(
              "Did you bring the proof I requested?",
              {"Yes", "No"}
          )

          if choice2 == "Yes" then
              if player:hasItem("water_key", 5) == true then
                  player.karma = player.karma + 0.5
        player:removeItem("water_key", 5)
                  player:sendAnimation(49)
                  player:addLegend(
                      "Explore Mythic Dragon",
                      "explore_mythic_dragon",
                      178,
                      15
                  )
                  player:forceSave()
                  player:dialogSeq(
                      {
                          t,
                          "Congratulations you have success to explore mythic dragon",
                          "Now you can use teleport menu from f1"
                      },
                      0
                  )
              else 
                  player:dialogSeq({t, "Come back to me when you have those items"}, 0)
              end
          end

          if choice2 == "No" then
              player:dialogSeq({t, "Okay see you later"}, 0)
          end
      end
    end,
}