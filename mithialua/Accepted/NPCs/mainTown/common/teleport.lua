TeleportNpc = {
  click = async(function(player, npc)
    local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

    player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.dialogType = 0
		player.lastClick = npc.ID

    local opts = {"field Cave 00 (Rabbit, Squirrel, Deer)"}

    if player.level >= 5 then
      table.insert(opts, "field Cave 01 (Rats, Bats, Snakes)")
    end

    if player.level >= 15 then
      table.insert(opts, "field Cave 02 (Warthog, Bear, Tiger)")
    end

    if player.level >= 25 then
      table.insert(opts, "field Cave 03 (Dark Fox, Blood Fox, Nine Tail Fox)")
    end

    if player.level >= 35 then
      table.insert(opts, "field Cave 04 (Scorpions)")
    end

    if player.level >= 45 then
      table.insert(opts, "field Cave 05 (Skeletons)")
    end
    

    local choice = player:menuString(
			"Hello! Where do you want to go?",
			opts
		)

    if choice == "field Cave 00 (Rabbit, Squirrel, Deer)" then
      local choice2 = player:menuString(
        "Are you sure want to go to Field Cave 00?",
        {"Yes", "No"}
      )

      if choice2 == "Yes" then
        local map = 102
        local x = math.random(11, 28) 
        local y = math.random(12, 28)
        player:warp(map, x, y)
      end

      if choice2 == "No" then
        player:dialogSeq({t, "Okay see you later"}, 0)
      end

    end

    if choice == "field Cave 01 (Rats, Bats, Snakes)" then
      local choice2 = player:menuString(
        "Are you sure want to go to Field Cave 01?",
        {"Yes", "No"}
      )

      if choice2 == "Yes" then
        local map = 103
        local x = math.random(11, 28) 
        local y = math.random(12, 28)
        player:warp(map, x, y)
      end

      if choice2 == "No" then
        player:dialogSeq({t, "Okay see you later"}, 0)
      end

    end

    if choice == "field Cave 02 (Warthog, Bear, Tiger)" then
      local choice2 = player:menuString(
        "Are you sure want to go to Field Cave 02?",
        {"Yes", "No"}
      )

      if choice2 == "Yes" then
        local map = 104
        local x = math.random(11, 23) 
        local y = math.random(12, 28)
        player:warp(map, x, y)
      end

      if choice2 == "No" then
        player:dialogSeq({t, "Okay see you later"}, 0)
      end

    end

    if choice == "field Cave 03 (Dark Fox, Blood Fox, Nine Tail Fox)" then
      local choice2 = player:menuString(
        "Are you sure want to go to Field Cave 02?",
        {"Yes", "No"}
      )

      if choice2 == "Yes" then
        local map = 105
        local x = math.random(10, 20) 
        local y = math.random(10, 28)
        player:warp(map, x, y)
      end

      if choice2 == "No" then
        player:dialogSeq({t, "Okay see you later"}, 0)
      end

    end

    if choice == "field Cave 04 (Scorpions)" then
      local choice2 = player:menuString(
        "Are you sure want to go to Field Cave 02?",
        {"Yes", "No"}
      )

      if choice2 == "Yes" then
        local map = 106
        local x = math.random(10, 20) 
        local y = math.random(10, 28)
        player:warp(map, x, y)
      end

      if choice2 == "No" then
        player:dialogSeq({t, "Okay see you later"}, 0)
      end

    end

    if choice == "field Cave 05 (Skeletons)" then
      local choice2 = player:menuString(
        "Are you sure want to go to Field Cave 02?",
        {"Yes", "No"}
      )

      if choice2 == "Yes" then
        local map = 107
        local x = math.random(10, 20) 
        local y = math.random(10, 28)
        player:warp(map, x, y)
      end

      if choice2 == "No" then
        player:dialogSeq({t, "Okay see you later"}, 0)
      end

    end

  end)
}