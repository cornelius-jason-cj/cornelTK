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

    local opts = {}

    if player.level >= 5 and player.level < 15 then
      table.insert(opts, "field Cave 01 (Rats, Bats, Snakes)")
    end

    local choice = player:menuString(
			"Hello! Where do you want to go?",
			opts
		)

    if choice == "field Cave 01 (Rats, Bats, Snakes)" then
      local choice2 = player:menuString(
        "Are you sure want to go to Field Cave 01?",
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

  end)
}