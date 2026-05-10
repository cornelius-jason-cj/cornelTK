weaponQuest = {
  basicWeapon = function(player, npc)
    local t = {
      graphic = convertGraphic(npc.look, "monster"),
      color = npc.lookColor
    }

    if player:hasLegend("finish_basic_weapon_quest") == true then 
      player:dialogSeq({t, "You have finish this quest"}, 0)
    end

    local choice = player:menuString(
      "To get first Weapon, you'll need\n100 Acorn\n100 Rabbit Meat\n25 Antler\n25 Gold Acorn\nDo you have the ingredients?",
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

        player:giveXP(15000)
        player.karma = player.karma + 0.1

        if player.baseClass == 1 then
          player:addItem("maxcaliber", 1)
        end

        if player.baseClass == 2 then
          player:addItem("moonblade", 1)
        end

        if player.baseClass == 3 then
          player:addItem("wicked_staff", 1)
        end

        if player.baseClass == 4 then
          player:addItem("deaths_fan", 1)
        end

        player:addLegend(
          "Finish Basic Weapon Quest",
          "finish_basic_weapon_quest",
          5,
          15
        )

        player:sendAnimation(49)
        player:dialogSeq({t, "Great! Here is your reward\nBasic Weapon\n31.450 exp\nSmall karma"}, 0)
      else 
        player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
      end
    elseif choice == "Never mind" then
      player:dialogSeq({t, "Okay see you"}, 0)
    end

  end,
}