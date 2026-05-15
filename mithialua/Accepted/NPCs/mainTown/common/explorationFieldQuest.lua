explorationFieldQuest = {
  fieldCaves = function(player, npc)
    local t = {
      graphic = convertGraphic(npc.look, "monster"),
      color = npc.lookColor
    }
    local caves = {}

    if player:hasLegend("explore_field_cave_01") == false
    then
      table.insert(caves, "Field Cave 01")
    end
    
    if player:hasLegend("explore_field_cave_01") == true and 
      player:hasLegend("explore_field_cave_02") == false
    then
      table.insert(caves, "Field Cave 02")
    end
    
    if player:hasLegend("explore_field_cave_01") == true and 
      player:hasLegend("explore_field_cave_02") == true and 
      player:hasLegend("explore_field_cave_03") == false
    then
      table.insert(caves, "Field Cave 03")
    end
    
    if player:hasLegend("explore_field_cave_01") == true and 
      player:hasLegend("explore_field_cave_02") == true and 
      player:hasLegend("explore_field_cave_03") == true and
      player:hasLegend("explore_field_cave_04") == false
    then
      table.insert(caves, "Field Cave 04")
    end

    if player:hasLegend("explore_field_cave_01") == true and 
      player:hasLegend("explore_field_cave_02") == true and 
      player:hasLegend("explore_field_cave_03") == true and
      player:hasLegend("explore_field_cave_04") == true and
      player:hasLegend("explore_field_cave_05") == false
    then
      table.insert(caves, "Field Cave 05")
    end

    local choice = player:menuString(
      "Which cave do you want to explore?",
      caves
    )

    if choice == "Field Cave 01" then
      player:dialogSeq(
        {
          t,
          "As proof of your exploration in Field Cave 01, I need you to bring back\n25 Mica\n25 Ginseng\n25 Fine Snake Meat\nOnly then will I know you've truly ventured into its depths.",
        },
        1
      )

      local choice2 = player:menuString(
        "Did you bring the proof I requested?",
        {"Yes", "No"}
      )

      if choice2 == "Yes" then
        if player:hasItem("mica", 25) == true and
          player:hasItem("ginseng", 25) == true and
          player:hasItem("fine_snake_meat", 25) == true
        then
          player.karma = player.karma + 0.1
          player:removeItem("mica", 25)
          player:removeItem("ginseng", 25)
          player:removeItem("fine_snake_meat", 25)
          player:giveXP(80000)
          player:sendAnimation(49)
          player:addLegend(
            "Explore Field Cave 01",
            "explore_field_cave_01",
            163,
            6
          )
          player:forceSave()
          player:dialogSeq(
            {
              t,
              "Congratulations you have success to explore field cave 01",
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

    if choice == "Field Cave 02" then
      if player.level <= 15 then
        player:dialogSeq({t, "Come back to me when you reach level 15"}, 0)
      end 

      player:dialogSeq(
        {
          t,
          "As proof of your exploration in Field Cave 02, I need you to bring back\n50 Bear Liver\n50 Tiger Liver\n50 Fox Fur\nOnly then will I know you've truly ventured into its depths.",
        },
        1
      )

      local choice2 = player:menuString(
        "Did you bring the proof I requested?",
        {"Yes", "No"}
      )

      if choice2 == "Yes" then
        if player:hasItem("bear_liver", 50) == true and
          player:hasItem("tiger_liver", 50) == true and
          player:hasItem("fox_fur", 50) == true
        then
          player.karma = player.karma + 0.1
          player:removeItem("bear_liver", 50)
          player:removeItem("tiger_liver", 50)
          player:removeItem("fine_snake_meat", 50)
          player:giveXP(50000)
          player:sendAnimation(49)
          player:addLegend(
            "Explore Field Cave 02",
            "explore_field_cave_02",
            163,
            6
          )
          player:forceSave()
          player:dialogSeq(
            {
              t,
              "Congratulations you have success to explore field cave 01",
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