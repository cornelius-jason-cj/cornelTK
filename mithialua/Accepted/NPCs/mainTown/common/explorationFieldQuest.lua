local caveConfig = {
  {
    name = "Field Cave 01",
    legend = "explore_field_cave_01",
    minLevel = 1,
    exp = 80000,
    karma = 0.1,

    requirements = {
      {
        itemIdentifier = "mica",
        itemName = "Mica",
        amount = 25
      },
      {
        itemIdentifier = "ginseng",
        itemName = "Ginseng",
        amount = 25
      },
      {
        itemIdentifier = "fine_snake_meat",
        itemName = "Fine Snake Meat",
        amount = 25
      }
    }
  },
  {
    name = "Field Cave 02",
    legend = "explore_field_cave_02",
    requiredLegend = "explore_field_cave_01",
    minLevel = 16,
    exp = 230000,
    karma = 0.1,

    requirements = {
      {
        itemIdentifier = "pork",
        itemName = "Pork",
        amount = 100
      },
      {
        itemIdentifier = "bear_liver",
        itemName = "Bear Liver",
        amount = 100
      },
      {
        itemIdentifier = "tiger_meat",
        itemName = "Tiger Meat",
        amount = 100
      },
    }
  },

  {
    name = "Field Cave 03",
    legend = "explore_field_cave_03",
    requiredLegend = "explore_field_cave_02",
    minLevel = 22,
    exp = 450000,
    karma = 0.1,

    requirements = {
      {
        itemIdentifier = "fox_tail",
        itemName = "Fox Tail",
        amount = 50
      },

      {
        itemIdentifier = "red_fox_fur",
        itemName = "Red Fox Fur",
        amount = 100
      },

      {
        itemIdentifier = "fox_fur",
        itemName = "Fox Fur",
        amount = 100
      }
    }
  }
}

local function getNpcTable(npc)

  return {
    graphic = convertGraphic(npc.look, "monster"),
    color = npc.lookColor
  }
end

local function buildRequirementText(requirements)

  local text = ""

  for i = 1, #requirements do

    text = text ..
      requirements[i].amount ..
      " " ..
      requirements[i].itemName ..
      "\n"
  end

  return text
end

local function hasRequirements(player, requirements)

  player:sendMinitext("2")
  for i = 1, #requirements do

    local requirement =
      requirements[i]
      player:sendMinitext("requirement.itemIdentifier" .. requirement.itemIdentifier)
      player:sendMinitext("requirement.amount" .. requirement.amount)

    if player:hasItem(
      requirement.itemIdentifier,
      requirement.amount
    ) == true then
      return true
    end
  end

  return false
end

local function removeRequirements(player, requirements)

  for i = 1, #requirements do

    local requirement =
      requirements[i]

    player:removeItem(
      requirement.itemIdentifier,
      requirement.amount
    )
  end
end

local function getAvailableCaves(player)

  local available = {}

  for i = 1, #caveConfig do

    local cave = caveConfig[i]

    local requirementPassed = true

    if cave.requiredLegend ~= nil then

      requirementPassed =
        player:hasLegend(
          cave.requiredLegend
        )
    end

    if requirementPassed and
      not player:hasLegend(cave.legend)
    then

      table.insert(
        available,
        cave.name
      )
    end
  end

  return available
end

local function getCaveByName(name)

  for i = 1, #caveConfig do

    if caveConfig[i].name == name then
      return caveConfig[i]
    end
  end

  return nil
end

local function completeCaveQuest(
  player,
  npc,
  cave
)

  local t = getNpcTable(npc)

  if player.level < cave.minLevel then

    player:dialogSeq({
      t,
      "Come back to me when you reach level " ..
      cave.minLevel .. "."
    }, 0)

    return
  end

  player:dialogSeq({
    t,
    "As proof of your exploration in " ..
    cave.name ..
    ", I need you to bring back:\n" ..
    buildRequirementText(
      cave.requirements
    ) ..
    "Only then will I know you've truly ventured into its depths."
  }, 1)

  local choice = player:menuString(
    "Did you bring the proof I requested?",
    {"Yes", "No"}
  )

  if choice == "No" then

    player:dialogSeq({
      t,
      "Okay, see you later."
    }, 0)

    return
  end

  if choice == "Yes" then
    player:sendMinitext("1")
    if hasRequirements(
      player,
      cave.requirements
    ) == false then

    player:sendMinitext("3")
      player:dialogSeq({
        t,
        "Come back to me when you have those items."
      }, 0)

      return
    end

    player:sendMinitext("4")
    removeRequirements(
      player,
      cave.requirements
    )

    player.karma =
      player.karma + cave.karma

    player:giveXP(cave.exp)

    player:sendAnimation(49)

    player:addLegend(
      "Explore " .. cave.name,
      cave.legend,
      163,
      6
    )

    player:forceSave()

    player:dialogSeq({
      t,
      "Congratulations!\n" ..
      "You have successfully explored " ..
      cave.name .. "."
    }, 0)
  end
end

--------------------------------------------------
-- QUEST
--------------------------------------------------

explorationFieldQuest = {

  fieldCaves = function(player, npc)

    local t = getNpcTable(npc)

    local caves =
      getAvailableCaves(player)

    if #caves <= 0 then

      player:dialogSeq({
        t,
        "You have already completed all available field cave explorations."
      }, 0)

      return
    end

    local choice = player:menuString(
      "Which cave do you want to explore?",
      caves
    )

    local selectedCave =
      getCaveByName(choice)

    if selectedCave == nil then
      return
    end

    completeCaveQuest(
      player,
      npc,
      selectedCave
    )
  end
}

-- explorationFieldQuest = {
--   fieldCaves = function(player, npc)
--     local t = {
--       graphic = convertGraphic(npc.look, "monster"),
--       color = npc.lookColor
--     }
--     local caves = {}

--     if player:hasLegend("explore_field_cave_01") == false
--     then
--       table.insert(caves, "Field Cave 01")
--     end
    
--     if player:hasLegend("explore_field_cave_01") == true and 
--       player:hasLegend("explore_field_cave_02") == false
--     then
--       table.insert(caves, "Field Cave 02")
--     end
    
--     if player:hasLegend("explore_field_cave_01") == true and 
--       player:hasLegend("explore_field_cave_02") == true and 
--       player:hasLegend("explore_field_cave_03") == false
--     then
--       table.insert(caves, "Field Cave 03")
--     end
    
--     if player:hasLegend("explore_field_cave_01") == true and 
--       player:hasLegend("explore_field_cave_02") == true and 
--       player:hasLegend("explore_field_cave_03") == true and
--       player:hasLegend("explore_field_cave_04") == false
--     then
--       table.insert(caves, "Field Cave 04")
--     end

--     if player:hasLegend("explore_field_cave_01") == true and 
--       player:hasLegend("explore_field_cave_02") == true and 
--       player:hasLegend("explore_field_cave_03") == true and
--       player:hasLegend("explore_field_cave_04") == true and
--       player:hasLegend("explore_field_cave_05") == false
--     then
--       table.insert(caves, "Field Cave 05")
--     end

--     local choice = player:menuString(
--       "Which cave do you want to explore?",
--       caves
--     )

--     if choice == "Field Cave 01" then
--       player:dialogSeq(
--         {
--           t,
--           "As proof of your exploration in Field Cave 01, I need you to bring back\n25 Mica\n25 Ginseng\n25 Fine Snake Meat\nOnly then will I know you've truly ventured into its depths.",
--         },
--         1
--       )

--       local choice2 = player:menuString(
--         "Did you bring the proof I requested?",
--         {"Yes", "No"}
--       )

--       if choice2 == "Yes" then
--         if player:hasItem("mica", 25) == true and
--           player:hasItem("ginseng", 25) == true and
--           player:hasItem("fine_snake_meat", 25) == true
--         then
--           player.karma = player.karma + 0.1
--           player:removeItem("mica", 25)
--           player:removeItem("ginseng", 25)
--           player:removeItem("fine_snake_meat", 25)
--           player:giveXP(80000)
--           player:sendAnimation(49)
--           player:addLegend(
--             "Explore Field Cave 01",
--             "explore_field_cave_01",
--             163,
--             6
--           )
--           player:forceSave()
--           player:dialogSeq(
--             {
--               t,
--               "Congratulations you have success to explore field cave 01",
--             },
--             0
--           )
--         else 
--           player:dialogSeq({t, "Come back to me when you have those items"}, 0)
--         end
--       end

--       if choice2 == "No" then
--         player:dialogSeq({t, "Okay see you later"}, 0)
--       end

--     end

--     if choice == "Field Cave 02" then
--       if player.level <= 15 then
--         player:dialogSeq({t, "Come back to me when you reach level 15"}, 0)
--       end 

--       player:dialogSeq(
--         {
--           t,
--           "As proof of your exploration in Field Cave 02, I need you to bring back\n50 Bear Liver\n50 Tiger Meat\n50 Fox Fur\nOnly then will I know you've truly ventured into its depths.",
--         },
--         1
--       )

--       local choice2 = player:menuString(
--         "Did you bring the proof I requested?",
--         {"Yes", "No"}
--       )

--       if choice2 == "Yes" then
--         if player:hasItem("bear_liver", 50) == true and
--           player:hasItem("tiger_meat", 50) == true and
--           player:hasItem("fox_fur", 50) == true
--         then
--           player.karma = player.karma + 0.1
--           player:removeItem("bear_liver", 50)
--           player:removeItem("tiger_meat", 50)
--           player:removeItem("fine_snake_meat", 50)
--           player:giveXP(50000)
--           player:sendAnimation(49)
--           player:addLegend(
--             "Explore Field Cave 02",
--             "explore_field_cave_02",
--             163,
--             6
--           )
--           player:forceSave()
--           player:dialogSeq(
--             {
--               t,
--               "Congratulations you have success to explore field cave 02",
--             },
--             0
--           )
--         else 
--           player:dialogSeq({t, "Come back to me when you have those items"}, 0)
--         end
--       end

--       if choice2 == "No" then
--         player:dialogSeq({t, "Okay see you later"}, 0)
--       end
      
--     end

--     if choice == "Field Cave 03" then
--       if player.level <= 15 then
--         player:dialogSeq({t, "Come back to me when you reach level 15"}, 0)
--       end 

--       player:dialogSeq(
--         {
--           t,
--           "As proof of your exploration in Field Cave 02, I need you to bring back\n50 Fox Tail\n100 Red Fox Fur\n100 Fox Fur\nOnly then will I know you've truly ventured into its depths.",
--         },
--         1
--       )

--       local choice2 = player:menuString(
--         "Did you bring the proof I requested?",
--         {"Yes", "No"}
--       )

--       if choice2 == "Yes" then
--         if player:hasItem("fox_tail", 50) == true and
--           player:hasItem("red_fox_fur", 100) == true and
--           player:hasItem("fox_fur", 100) == true
--         then
--           player.karma = player.karma + 0.1
--           player:removeItem("fox_tail", 50)
--           player:removeItem("red_fox_fur", 100)
--           player:removeItem("fox_fur", 100)
--           player:giveXP(150000)
--           player:sendAnimation(49)
--           player:addLegend(
--             "Explore Field Cave 03",
--             "explore_field_cave_03",
--             163,
--             6
--           )
--           player:forceSave()
--           player:dialogSeq(
--             {
--               t,
--               "Congratulations you have success to explore field cave 03",
--             },
--             0
--           )
--         else 
--           player:dialogSeq({t, "Come back to me when you have those items"}, 0)
--         end
--       end

--       if choice2 == "No" then
--         player:dialogSeq({t, "Okay see you later"}, 0)
--       end
      
--     end
--   end,
-- }