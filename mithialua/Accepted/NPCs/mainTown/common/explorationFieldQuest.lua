explorationFieldQuest = {
  fieldCaves = function(player, npc)
    local t = {
      graphic = convertGraphic(npc.look, "monster"),
      color = npc.lookColor
    }
    local caves = {}
    
    if player.level < 15 then
      table.insert(caves, "field Cave 01")
    end
    
    if player.level >= 15 and
      player.level < 35 and
      player:hasLegend("explore_field_cave_01") == true
    then
      table.insert(caves, "field Cave 02")
    end
    
    if player.level >= 35 and
      player.level < 55 and 
      player:hasLegend("explore_field_cave_02") == true
    then
      table.insert(caves, "field Cave 03")
    end
    
    if player.level >= 55 and
      player.level < 75 and 
      player:hasLegend("explore_field_cave_03") == true
    then
      table.insert(caves, "field Cave 04")
    end

    if player.level >= 75 and 
      player:hasLegend("explore_field_cave_04") == true
    then
      table.insert(caves, "field Cave 05")
    end


    local choice = player:menuString(
        "Which cave do you want to explore?",
        caves
    )

    if choice == "field Cave 01" then
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
  end,
}