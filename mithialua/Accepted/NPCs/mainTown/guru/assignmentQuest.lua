assignmentQuest = {
  firstAssignment = function(player, npc)
    local t = {
      graphic = convertGraphic(npc.look, "monster"),
      color = npc.lookColor
    }

    if player:hasLegend("finish_first_assignment_quest") == true then 
      player:dialogSeq({t, "You have finish this quest"}, 0)
    end

    player:dialogSeq(
      {
        t,
        "Hello, here is your first assigment",
        "Collect 100 of each item dropped by monster in Field 01",
      },
      1
    )

    local choice = player:menuString(
      "Do you bring all the requirement items?",
      {"Yes", "No"}
    )

    if choice == "Yes" then
      if player:hasItem("rat_meat", 100) == true and
        player:hasItem('mica', 100) == true and
        player:hasItem('ginseng_piece', 100) == true and
        player:hasItem('ginseng', 100) == true and
        player:hasItem('snake_meat', 100) == true and
        player:hasItem('fine_snake_meat', 100) == true
      then
        player:dialogSeq(
          {
            t,
            "Great job!",
            "Here is your reward"
          },
          1
        )

        player:removeItem("rat_meat",100)
        player:removeItem("mica",100)
        player:removeItem("ginseng_piece",100)
        player:removeItem("ginseng",100)
        player:removeItem("snake_meat",100)
        player:removeItem("fine_snake_meat",100)

        player:addLegend(
          "Finish First Assignment Quest",
          "finish_first_assignment_quest",
          3,
          1
        )
        player.registry["first_assignment"] = 1
      else 
        player:dialogSeq({t, "Come back to me when you have those items"}, 0)
      end
    end

    if choice2 == "No" then
      player:dialogSeq({t, "Okay see you later"}, 0)
    end

  end,
}