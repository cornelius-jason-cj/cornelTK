selectBuild = {}

selectBuild.warrior = function(player, npc)
  local t = {
    graphic = convertGraphic(npc.look, "monster"),
    color = npc.lookColor
  }
  player.npcGraphic = t.graphic
  player.npcColor = t.color
  player.dialogType = 0
  player.lastClick = npc.ID

  local opts = {"Berseker", "Counter", "Guardian", "Weapon Master"}

  local choice = player:menuString(
    "Choose your pat carefully! Once selected, your build cannot be change, which path will you follow?",
    opts
  )

  if choice == "Berseker" then
    local choice2 = player:menuString(
      "Are you sure want to follow path of Berseker?",
      {"Yes", "No"}
    )

    if choice2 == "Yes" then
      local choice3 = player:menuString(
        "Please bring 40 Acorns and 40 Rabbit Meat\nDo you bring the items?",
        {"Yes", "No"}
      )

      if choice3 == "Yes" then
        if player:hasItem("acorn", 40) == true and player:hasItem('rabbit_meat', 40) == true then
          player:dialogSeq(
            {
              t,
              "You have chosen the path of the Berseker.\nFrom this day onward, your destiny is set.\nMay your blades never miss their mark."
            },
            1
          )

          player:removeItem("acorn", 40)
          player:removeItem("rabbit_meat", 40)
          player:playSound(123)
          player:sendAnimation(178, 0)
          player:sendAnimation(72, 0)
          player:addSpell("blood_rage_1")
          player:addSpell("execution_1")
          player:addSpell("last_stand_1")
          player:giveXP(12000)
          player.registry["berseker_spell_level"] = 1
          player.registry["warrior_build"] = 1
        else 
          player:dialogSeq({t, "Come back to me when you have those items"}, 0)
        end
      end

      if choice3 == "No" then
        player:dialogSeq(
          {
            t,
            "Very well, I will be waiting here if you change your mind. I am seeking great people all the time to join this great path."
          },
          1
        )
      end
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
  
  if choice == "Counter" then
    local choice2 = player:menuString(
      "Are you sure want to follow path of Counter?",
      {"Yes", "No"}
    )

    if choice2 == "Yes" then
      local choice3 = player:menuString(
        "Please bring 20 Antlers and 40 Rabbit Meat\nDo you bring the items?",
        {"Yes", "No"}
      )

      if choice3 == "Yes" then
        if player:hasItem("antler", 20) == true and player:hasItem('rabbit_meat', 40) == true then
          player:dialogSeq(
            {
              t,
              "You have chosen the path of the Counter.\nFrom this day onward, your destiny is set.\nMay your blades never miss their mark."
            },
            1
          )

          player:removeItem("antler", 20)
          player:removeItem("rabbit_meat", 40)
          player:playSound(123)
          player:sendAnimation(490, 0)
          player:sendAnimation(491, 0)
          player:addSpell("counter_stance_1")
          player:addSpell("defiance_1")
          player:addSpell("thorns_1")
          player:giveXP(12000)
          player.registry["counter_spell_level"] = 1
          player.registry["warrior_build"] = 2
        else 
          player:dialogSeq({t, "Come back to me when you have those items"}, 0)
        end
      end

      if choice3 == "No" then
        player:dialogSeq(
          {
            t,
            "Very well, I will be waiting here if you change your mind. I am seeking great people all the time to join this great path."
          },
          1
        )
      end
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
  
  if choice == "Guardian" then
     local choice2 = player:menuString(
      "Are you sure want to follow path of Guardian?",
      {"Yes", "No"}
    )

    if choice2 == "Yes" then
      local choice3 = player:menuString(
        "Please bring 15 Gold Acorns and 40 Rabbit Meat\nDo you bring the items?",
        {"Yes", "No"}
      )
      
      if choice3 == "Yes" then
        if player:hasItem("gold_acorn", 15) == true and player:hasItem('rabbit_meat', 40) == true then
          player:dialogSeq(
            {
              t,
              "You have chosen the path of the Guardian.\nFrom this day onward, your destiny is set.\nMay your blades never miss their mark."
            },
            1
          )

          player:removeItem("gold_acorn", 15)
          player:removeItem("rabbit_meat", 40)
          player:playSound(123)
          player:sendAnimation(116, 0)
          player:sendAnimation(446, 0)
          player:addSpell("defender_roar_1")
          player:addSpell("iron_skin_1")
          player:addSpell("shield_slam_1")
          player:giveXP(12000)
          player.registry["guardian_spell_level"] = 1
          player.registry["rogue_build"] = 3
        else 
          player:dialogSeq({t, "Come back to me when you have those items"}, 0)
        end
      end

      if choice3 == "No" then
        player:dialogSeq(
          {
            t,
            "Very well, I will be waiting here if you change your mind. I am seeking great people all the time to join this great path."
          },
          1
        )
      end
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
  
  if choice == "Weapon Master" then
    local choice2 = player:menuString(
      "Are you sure want to follow path of Weapon Master?",
      {"Yes", "No"}
    )

    if choice2 == "Yes" then
      local choice3 = player:menuString(
        "Please bring 10 Gold Acorns, 15 Antlers, 25 Rabbit Meat\nDo you bring the items?",
        {"Yes", "No"}
      )

      if choice3 == "Yes" then
        if player:hasItem("gold_acorn", 10) == true and player:hasItem('antler', 15) == true and player:hasItem('rabbit_meat', 25) == true then
          player:dialogSeq(
            {
              t,
              "You have chosen the path of the Weapon Master.\nFrom this day onward, your destiny is set.\nMay your blades never miss their mark."
            },
            1
          )

          player:removeItem("gold_acorn", 10)
          player:removeItem("antler", 15)
          player:removeItem("rabbit_meat", 25)
          player:playSound(123)
          player:sendAnimation(459, 0)
          player:sendAnimation(501, 0)
          player:addSpell("combo_strike_1")
          player:addSpell("precision_slash_1")
          player:addSpell("whirlwind_1")
          player:giveXP(12000)
          player.registry["weapon_master_spell_level"] = 1
          player.registry["warrior_build"] = 4
        else 
          player:dialogSeq({t, "Come back to me when you have those items"}, 0)
        end
      end

      if choice3 == "No" then
        player:dialogSeq(
          {
            t,
            "Very well, I will be waiting here if you change your mind. I am seeking great people all the time to join this great path."
          },
          1
        )
      end
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
end

selectBuild.rogue = function(player, npc)
  local t = {
    graphic = convertGraphic(npc.look, "monster"),
    color = npc.lookColor
  }
  player.npcGraphic = t.graphic
  player.npcColor = t.color
  player.dialogType = 0
  player.lastClick = npc.ID

  local opts = {"Assassin", "Poison", "Shadow", "Trap Master"}

  local choice = player:menuString(
    "Choose your pat carefully! Once selected, your build cannot be change, which path will you follow?",
    opts
  )

  if choice == "Assassin" then
    local choice2 = player:menuString(
      "Are you sure want to follow path of Assassin?",
      {"Yes", "No"}
    )

    if choice2 == "Yes" then
      local choice3 = player:menuString(
        "Please bring 40 Acorns and 40 Rabbit Meat\nDo you bring the items?",
        {"Yes", "No"}
      )

      if choice3 == "Yes" then
        if player:hasItem("acorn", 40) == true and player:hasItem('rabbit_meat', 40) == true then
          player:dialogSeq(
            {
              t,
              "You have chosen the path of the Assassin.\nFrom this day onward, your destiny is set.\nMay your blades never miss their mark."
            },
            1
          )
          player:removeItem("acorn", 40)
          player:removeItem("rabbit_meat", 40)
          player:playSound(123)
          player:sendAnimation(71, 0)
          player:sendAnimation(72, 0)
          player:sendAnimation(88, 0)
          player:addSpell("assasinate_1")
          player:addSpell("critical_focus_1")
          player:addSpell("death_mark_1")
          player:giveXP(12000)
          player.registry["assassin_spell_level"] = 1
          player.registry["rogue_build"] = 1
        else 
          player:dialogSeq({t, "Come back to me when you have those items"}, 0)
        end
      end

      if choice3 == "No" then
        player:dialogSeq(
          {
            t,
            "Very well, I will be waiting here if you change your mind. I am seeking great people all the time to join this great path."
          },
          1
        )
      end
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
  
  if choice == "Poison" then
    local choice2 = player:menuString(
      "Are you sure want to follow path of Poison?",
      {"Yes", "No"}
    )

    if choice2 == "Yes" then
      local choice3 = player:menuString(
        "Please bring 20 Antlers and 40 Rabbit Meat\nDo you bring the items?",
        {"Yes", "No"}
      )

      if choice3 == "Yes" then
        if player:hasItem("antler", 20) == true and player:hasItem('rabbit_meat', 40) == true then
          player:dialogSeq(
            {
              t,
              "You have chosen the path of the Poison.\nFrom this day onward, your destiny is set.\nMay your blades never miss their mark."
            },
            1
          )

          player:dialogSeq(
            {
              t,
              "You have chosen the path of the Poison.\nFrom this day onward, your destiny is set.\nMay your blades never miss their mark."
            },
            1
          )

          player:removeItem("antler", 20)
          player:removeItem("rabbit_meat", 40)
          player:playSound(123)
          player:sendAnimation(415, 0)
          player:sendAnimation(452, 0)
          player:addSpell("deadly_toxin_1")
          player:addSpell("toxic_cloud_1")
          player:addSpell("venom_blade_1")
          player:giveXP(12000)
          player.registry["poison_spell_level"] = 1
          player.registry["rogue_build"] = 2
        else 
          player:dialogSeq({t, "Come back to me when you have those items"}, 0)
        end
      end

      if choice3 == "No" then
        player:dialogSeq(
          {
            t,
            "Very well, I will be waiting here if you change your mind. I am seeking great people all the time to join this great path."
          },
          1
        )
      end
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
  
  if choice == "Shadow" then
     local choice2 = player:menuString(
      "Are you sure want to follow path of Shadow?",
      {"Yes", "No"}
    )

    if choice2 == "Yes" then
      local choice3 = player:menuString(
        "Please bring 15 Gold Acorns and 40 Rabbit Meat\nDo you bring the items?",
        {"Yes", "No"}
      )
      
      if choice3 == "Yes" then
        if player:hasItem("gold_acorn", 15) == true and player:hasItem('rabbit_meat', 40) == true then
          player:dialogSeq(
            {
              t,
              "You have chosen the path of the Shadow.\nFrom this day onward, your destiny is set.\nMay your blades never miss their mark."
            },
            1
          )

          player:removeItem("gold_acorn", 15)
          player:removeItem("rabbit_meat", 40)
          player:playSound(123)
          player:sendAnimation(286, 0)
          player:sendAnimation(167, 0)
          player:addSpell("eclipse_1")
          player:addSpell("phantom_strike_1")
          player:addSpell("shadow_form_1")
          player:giveXP(12000)
          player.registry["shadow_spell_level"] = 1
          player.registry["rogue_build"] = 3
        else 
          player:dialogSeq({t, "Come back to me when you have those items"}, 0)
        end
      end

      if choice3 == "No" then
        player:dialogSeq(
          {
            t,
            "Very well, I will be waiting here if you change your mind. I am seeking great people all the time to join this great path."
          },
          1
        )
      end
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
  
  if choice == "Trap Master" then
    local choice2 = player:menuString(
      "Are you sure want to follow path of Trap Master?",
      {"Yes", "No"}
    )

    if choice2 == "Yes" then
      local choice3 = player:menuString(
        "Please bring 10 Gold Acorns, 15 Antlers, 25 Rabbit Meat\nDo you bring the items?",
        {"Yes", "No"}
      )

      if choice3 == "Yes" then
        if player:hasItem("gold_acorn", 10) == true and player:hasItem('antler', 15) == true and player:hasItem('rabbit_meat', 25) == true then
          player:dialogSeq(
            {
              t,
              "You have chosen the path of the Trap Master.\nFrom this day onward, your destiny is set.\nMay your blades never miss their mark."
            },
            1
          )

          player:removeItem("gold_acorn", 10)
          player:removeItem("antler", 15)
          player:removeItem("rabbit_meat", 25)
          player:playSound(123)
          player:sendAnimation(116, 0)
          player:sendAnimation(119, 0)
          player:addSpell("explosive_trap_1")
          player:addSpell("poison_trap_1")
          player:addSpell("spike_trap_1")
          player:giveXP(12000)
          player.registry["trap_master_spell_level"] = 1
          player.registry["rogue_build"] = 4
        else 
          player:dialogSeq({t, "Come back to me when you have those items"}, 0)
        end
      end

      if choice3 == "No" then
        player:dialogSeq(
          {
            t,
            "Very well, I will be waiting here if you change your mind. I am seeking great people all the time to join this great path."
          },
          1
        )
      end
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

end

selectBuild.mage = function(player, npc)
end

selectBuild.poet = function(player, npc)
end