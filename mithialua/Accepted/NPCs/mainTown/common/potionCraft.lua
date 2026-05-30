local potionConfig = {
  {
    name = "Small Red Potion",
    item = "small_red_potion",
    stackSize = 20,
    stackPrice = 15
  },
  {
    name = "Regular Red Potion",
    item = "regular_red_potion",
    stackSize = 20,
    stackPrice = 40
  },
  {
    name = "Large Red Potion",
    item = "large_red_potion",
    stackSize = 20,
    stackPrice = 140
  },
  {
    name = "Small Blue Potion",
    item = "small_blue_potion",
    stackSize = 20,
    stackPrice = 20
  },
  {
    name = "Regular Blue Potion",
    item = "regular_blue_potion",
    stackSize = 20,
    stackPrice = 50
  },
  {
    name = "Large Blue Potion",
    item = "large_blue_potion",
    stackSize = 20,
    stackPrice = 175
  }
}

local stackOptions = {
  {
    text = "1 stack",
    multiplier = 1
  },
  {
    text = "5 stack",
    multiplier = 5
  },
  {
    text = "10 stack",
    multiplier = 10
  }
}

local function getPotionByMenu(menuText)
  for i = 1, #potionConfig do
    local potion = potionConfig[i]

    local label =
      potion.name ..
      " (" .. potion.stackSize .. "pcs) - " ..
      potion.stackPrice ..
      " gold"

    if menuText == label then
      return potion
    end
  end

  return nil
end

PotionCraftNpc = {
	click = async(function(player, npc)
		local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}
		player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.dialogType = 0
		player.lastClick = npc.ID

    local choiceMenu = {"Buy Items", "Craft Items"}
    local choice = player:menuString(
      "Hello! How can I help you today?",
      choiceMenu
    )
    if choice == "Buy Items" then
      local potionList = {}

      for i = 1, #potionConfig do
        local potion = potionConfig[i]

        table.insert(
          potionList,
          potion.name ..
          " (" .. potion.stackSize .. "pcs) - " ..
          potion.stackPrice ..
          " gold"
        )

        if i == 3 then
          table.insert(potionList, "------------------")
        end
      end
    
      local choicePotion = player:menuString(
        "Which Potion do you want to buy?",
        potionList
      )

      if choicePotion == "------------------" then
        return
      end

      local potion = getPotionByMenu(choicePotion)

      if potion == nil then
        return
      end

      local qtyMenu = {}

      for i = 1, #stackOptions do
        table.insert(qtyMenu, stackOptions[i].text)
      end

      local choiceQty = player:menuString(
        "How many potions do you want to buy?",
        qtyMenu
      )

      local multiplier = 1

      for i = 1, #stackOptions do
        if choiceQty == stackOptions[i].text then
          multiplier = stackOptions[i].multiplier
          break
        end
      end

      local totalPrice = potion.stackPrice * multiplier
      local totalPotion = potion.stackSize * multiplier

      if player.money < totalPrice then
        player:dialogSeq(
          {t, "You don't have enough money."},
          0
        )
        return
      end

      player:removeGold(totalPrice)

      player:addItem(
        potion.item,
        totalPotion
      )

      player:sendMinitext(
        "You pay " .. totalPrice .. " gold."
      )

      player:dialogSeq(
        {
          t,
          "Thank you.\n\n" ..
          "You received " ..
          totalPotion ..
          " " ..
          potion.name
        },
        0
      )
    end

    if choice == "Craft Items" then
      local items = {"Small Meat", "Small Pipe"}

      if player:hasLegend("explore_field_cave_01") == true then
        table.insert(items, "------------")
        table.insert(items, "Regular Meat")
        table.insert(items, "Regular Pipe")
      end

      local choiceCraft = player:menuString(
        "Hello! What would you like to craft today?",
        items
      )

      if choiceCraft == "------------" then
        return
      end

      if choiceCraft == "Small Meat" then
        local choice2 = player:menuString(
          "To craft Small Meat, you'll need 5 acorns and 5 rabbit meats. Do you have the ingredients?",
          {"Yes, here they are", "Never mind"}
        )
        if choice2 == "Yes, here they are" then
          if player:hasItem("acorn", 10) == true and player:hasItem('rabbit_meat', 10) == true then
            player:removeItem("acorn", 10)
            player:removeItem("rabbit_meat", 10)
            player:addItem("small_meat", 10)
            player:giveXP(500)
            player:dialogSeq({t, "Great! You've successfully crafted Small Meat."}, 0)
          else 
            player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
          end
        elseif choice2 == "Never mind" then
          player:dialogSeq({t, "Okay see you"}, 0)
        end
      end

      if choiceCraft == "Regular Meat" then
        local choice2 = player:menuString(
          "To craft Regular Meat, you'll need 20 rat meats and 20 snake meats. Do you have the ingredients?",
          {"Yes, here they are", "Never mind"}
        )
        if choice2 == "Yes, here they are" then
          if player:hasItem("rat_meat", 20) == true and
            player:hasItem('snake_meat', 20) == true
          then
            player:removeItem("rat_meat", 20)
            player:removeItem("snake_meat", 20)
            player:addItem("regular_meat", 20)
            player:giveXP(3500)
            player:dialogSeq({t, "Great! You've successfully crafted Regular Meat."}, 0)
          else 
            player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
          end
        elseif choice2 == "Never mind" then
          player:dialogSeq({t, "Okay see you"}, 0)
        end
      end

      if choiceCraft == "Small Pipe" then
        local choice2 = player:menuString(
          "To craft Small Pipe, you'll need 10 antler and 1 gold acorn. Do you have the ingredients?",
          {"Yes, here they are", "Never mind"}
        )
        if choice2 == "Yes, here they are" then
          if player:hasItem("antler", 10) == true and
            player:hasItem('gold_acorn', 1) == true
          then
            player:removeItem("antler", 10)
            player:removeItem("gold_acorn", 1)
            player:addItem("small_pipe", 10)
            player:giveXP(500)
            player:dialogSeq({t, "Great! You've successfully crafted Small Pipe."}, 0)
          else 
            player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
          end
        elseif choice2 == "Never mind" then
          player:dialogSeq({t, "Okay see you"}, 0)
        end
      end

      if choiceCraft == "Regular Pipe" then
        local choice2 = player:menuString(
          "To craft Regular Pipe, you'll need 15 ginseng piece and 5 mica. Do you have the ingredients?",
          {"Yes, here they are", "Never mind"}
        )
        if choice2 == "Yes, here they are" then
          if player:hasItem("ginseng_piece", 15) == true and
            player:hasItem('mica', 5) == true
          then
            player:removeItem("ginseng_piece", 15)
            player:removeItem("mica", 5)
            player:addItem("regular_pipe", 10)
            player:giveXP(3500)
            player:dialogSeq({t, "Great! You've successfully crafted Regular Pipe."}, 0)
          else 
            player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
          end
        elseif choice2 == "Never mind" then
          player:dialogSeq({t, "Okay see you"}, 0)
        end
      end
    end
	end),

}
