armorQuest = {
  basicArmor = function(player, npc)
    local t = {
      graphic = convertGraphic(npc.look, "monster"),
      color = npc.lookColor
    }

    if player:hasLegend("finish_basic_armor_quest") == true then 
      player:dialogSeq({t, "You have finish this quest"}, 0)
    end

    local choice = player:menuString(
      "To get first Armor, you'll need\n100 Acorn\n100 Rabbit Meat\n25 Antler\n25 Gold Acorn\nDo you have the ingredients?",
      {"Yes, here they are", "Never mind"}
    )

    if choice == "Yes, here they are" then
      if player:hasItem("acorn", 100) == true and
      player:hasItem('rabbit_meat', 100) == true and
      player:hasItem('antler', 25) == true and
      player:hasItem('gold_acorn', 25) == true
      then
        player:removeItem("acorn", 100)
        player:removeItem("rabbit_meat", 100)
        player:removeItem("antler", 25)
        player:removeItem("gold_acorn", 25)

        player:giveXP(7000)
        player:giveXP(10200)
        player:giveXP(14250)
        player.karma = player.karma + 0.1

        if player.baseClass == 1 then
          if player.sex == 0 then
            player:addItem("vanguard_mail", 1)
          elseif player.sex == 1 then
            player:addItem("vanguard_mail_dress", 1)
          end
        end

        if player.baseClass == 2 then
          if player.sex == 0 then
            player:addItem("phantom_waistcoat", 1)
          elseif player.sex == 1 then
            player:addItem("phantom_blouse", 1)
          end
        end

        if player.baseClass == 3 then
          if player.sex == 0 then
            player:addItem("arcane_garb", 1)
          elseif player.sex == 1 then
            player:addItem("arcane_dress", 1)
          end
        end

        if player.baseClass == 4 then
          if player.sex == 0 then
            player:addItem("lunar_robes", 1)
          elseif player.sex == 1 then
            player:addItem("lunar_gown", 1)
          end
        end

        player:addLegend(
          "Finish Basic Armor Quest",
          "finish_basic_armor_quest",
          5,
          15
        )

        player:sendAnimation(49)
        player:dialogSeq({t, "Great! Here is your reward\nBasic Armor\n31.450 exp\nSmall karma"}, 0)
      else 
        player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
      end
    elseif choice == "Never mind" then
      player:dialogSeq({t, "Okay see you"}, 0)
    end

  end,
}