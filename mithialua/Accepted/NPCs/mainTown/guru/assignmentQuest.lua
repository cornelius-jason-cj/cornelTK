assignmentQuest = {
  quests = {
    firstAssignment = {
      title = "first assignment",
      legend = "finish_first_assignment_quest",
      legendText = "Finish First Assignment Quest",

      intro = {
        "Hello, here is your first assignment",
        "Collect 100 of each item dropped by monster in Field 01"
      },

      requirements = {
        {item = "rat_meat", amount = 100, name = "Rat Meat"},
        {item = "mica", amount = 100, name = "Mica"},
        {item = "ginseng_piece", amount = 100, name = "Ginseng Piece"},
        {item = "ginseng", amount = 100, name = "Ginseng"},
        {item = "snake_meat", amount = 100, name = "Snake Meat"},
        {item = "fine_snake_meat", amount = 100, name = "Fine Snake Meat"}
      },

      rewards = function(player)
        player:addLegend(
          "Finish First Assignment Quest",
          "finish_first_assignment_quest",
          3,
          1
        )

        player.registry["first_assignment"] = 1
        player.karma = player.karma + 0.2
        player:sendAnimation(348)
      end,

      successDialog = {
        "Great job! Your karma has slightly increased.",
        "Come back to me when you reach level 35."
      }
    },

    secondAssignment = {
      title = "second assignment",

      intro = {
        "Hello, here is your second assignment",
        "Collect\n25 pcs fox fur\n25 pcs red fox fur\n5 pcs fox tail"
      },

      requirements = {
        {item = "fox_fur", amount = 200, name = "Fox Fur"},
        {item = "red_fox_fur", amount = 200, name = "Red Fox Fur"},
        {item = "fox_tail", amount = 100, name = "Fox Tail"}
      },

      rewards = function(player)
        player.registry["second_assignment"] = 1
        player:addItem("jolt_spear", 1)

        if player.sex == 0 then
          player:addItem("winter_mantle", 1)
        else
          player:addItem("winter_drapery", 1)
        end
      end,

      successDialog = {
        "Great job!",
        "Here is your reward"
      }
    }
  }
}

assignmentQuest.hasRequirements = function(player, requirements)
  for i = 1, #requirements do
    local req = requirements[i]

    if not player:hasItem(req.item, req.amount) then
      return false
    end
  end

  return true
end

assignmentQuest.removeRequirements = function(player, requirements)
  for i = 1, #requirements do
    local req = requirements[i]

    player:removeItem(req.item, req.amount)
  end
end

assignmentQuest.showRequirements = function(requirements)
  local text = "Requirements:\n"

  for i = 1, #requirements do
    local req = requirements[i]

    text = text .. req.amount .. "x " .. req.name

    if i < #requirements then
      text = text .. "\n"
    end
  end

  return text
end

assignmentQuest.startQuest = function(player, npc, questKey)
  local quest = assignmentQuest.quests[questKey]

  local t = {
    graphic = convertGraphic(npc.look, "monster"),
    color = npc.lookColor
  }

  -- Check finished legend
  if quest.legend ~= nil then
    if player:hasLegend(quest.legend) then
      player:dialogSeq({t, "You have already finished this quest."}, 0)
      return
    end
  end

  -- Intro dialog
  local dialog = {t}

  for i = 1, #quest.intro do
    table.insert(dialog, quest.intro[i])
  end

  table.insert(dialog, assignmentQuest.showRequirements(quest.requirements))

  player:dialogSeq(dialog, 1)

  -- Choice
  local choice = player:menuString(
    "Do you bring all the requirement items?",
    {"Yes", "No"}
  )

  if choice == "No" then
    player:dialogSeq({t, "Okay, see you later."}, 0)
    return
  end

  -- Requirement check
  if not assignmentQuest.hasRequirements(player, quest.requirements) then
    player:dialogSeq(
      {t, "Come back to me when you have all required items."},
      0
    )
    return
  end

  -- Remove items
  assignmentQuest.removeRequirements(player, quest.requirements)

  -- Give rewards
  if quest.rewards ~= nil then
    quest.rewards(player)
  end

  -- Success dialog
  local successDialog = {t}

  for i = 1, #quest.successDialog do
    table.insert(successDialog, quest.successDialog[i])
  end

  player:dialogSeq(successDialog, 1)
end

assignmentQuest.firstAssignment = function(player, npc)
  assignmentQuest.startQuest(player, npc, "firstAssignment")
end

assignmentQuest.secondAssignment = function(player, npc)
  assignmentQuest.startQuest(player, npc, "secondAssignment")
end