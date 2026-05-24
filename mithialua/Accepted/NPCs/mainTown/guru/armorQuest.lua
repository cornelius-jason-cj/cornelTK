armorQuest = {}

local armorTiers = {
  {
    legendIdentifier = "finish_basic_armor_quest",
    legendText = "Finish Basic Armor Quest",
    minLevel = 1,
    maxLevel = 15,
    exp = 15000,
    karma = 0.1,
    choiceText =  "To obtain basic armor, you'll need:\n",
    requirements = {
      {item = "acorn", amount = 100},
      {item = "rabbit_meat", amount = 100},
      {item = "antler", amount = 25},
      {item = "gold_acorn", amount = 25}
    },
    
    rewardQty = 1,
    rewards = {
      [1] = {"vanguard_mail", "vanguard_mail_dress"},
      [2] = {"phantom_waistcoat", "phantom_blouse"},
      [3] = {"arcane_garb", "arcane_dress"},
      [4] = {"lunar_robes", "lunar_gown"}
    },
    rewardText = "Great! Here is your reward:\n15000 exp and small karma",
  },

  {
    legendIdentifier = "learn_basic_armor_forging",
    legendText = "Learn Basic Armor Forging",
    requiredLegend = "finish_basic_armor_quest",
    minLevel = 15,
    maxLevel = 34,
    exp = 175000,
    karma = 0.2,
    choiceText =  "To learn forge basic armor, you'll need:\n",
    
    requirements = {
      {
        item = "Gold Acorn",
        itemIdent = "gold_acorn",
        amount = 25
      },
      {
        item = "Bear Fur",
        itemIdent = "bear_fur",
        amount = 75
      },
      {
        item = "Bear Liver",
        itemIdent = "bear_liver",
        amount = 150
      },
    },
    
    rewardQty = 1,
    rewards = {
      [1] = {"basic_armor_essence", "basic_armor_essence"},
      [2] = {"basic_armor_essence", "basic_armor_essence"},
      [3] = {"basic_armor_essence", "basic_armor_essence"},
      [4] = {"basic_armor_essence", "basic_armor_essence"}
    },
    rewardText = "Great! Remember, forging never fails. You can forge your armor from +1 to +10, then evolve it to the next tier.\n",
  }
}

local function buildRequirementText(requirements)
  local text = ""

  for i = 1, #requirements do
    text = text .. 
    requirements[i].amount ..
    " " ..
    requirements[i].item ..
    "\n"
  end

  return text
end

local function hasRequirements(player, requirements)
  for i = 1, #requirements do
    if not player:hasItem(requirements[i].itemIdent, requirements[i].amount) then
      return false
    end
  end

  return true
end

local function removeRequirements(player, requirements)
  for i = 1, #requirements do
    player:removeItem(
      requirements[i].itemIdent,
      requirements[i].amount
    )
  end
end

armorQuest.basicArmor = function(player, npc)

  local t = {
    graphic = convertGraphic(npc.look, "monster"),
    color = npc.lookColor
  }

  local selectedTier = nil

  for i = 1, #armorTiers do
    local tier = armorTiers[i]

    local requirementPassed = true

    if tier.requiredLegend ~= nil then
      requirementPassed = player:hasLegend(tier.requiredLegend)
    end

    if requirementPassed
      and player.level >= tier.minLevel
      and player.level <= tier.maxLevel
      and not player:hasLegend(tier.legendIdentifier) then

      selectedTier = tier
      break
    end
  end

  if selectedTier == nil then
    player:dialogSeq({t, "There are no armor quests available for you right now."}, 0)
    return
  end

  local choiceMessage =
    selectedTier.choiceText ..
    buildRequirementText(selectedTier.requirements) ..
    "\nDo you have the ingredients?"

  local choice = player:menuString(
    choiceMessage,
    {"Yes, here they are", "Never mind"}
  )

  if choice == "Never mind" then
    player:dialogSeq({t, "Okay, see you later."}, 0)
    return
  end

  if not hasRequirements(player, selectedTier.requirements) then
    player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
    return
  end

  removeRequirements(player, selectedTier.requirements)

  player:giveXP(selectedTier.exp)
  player.karma = player.karma + selectedTier.karma

  local rewardData = selectedTier.rewards[player.baseClass]
  local rewardQty = selectedTier.rewardQty
    
  if rewardData ~= nil then
    local rewardItem

    if player.sex == 0 then
      rewardItem = rewardData[1]
    else
      rewardItem = rewardData[2]
    end

    player:addItem(rewardItem, rewardQty)
  end

  player:addLegend(
    selectedTier.legendText,
    selectedTier.legendIdentifier,
    5,
    15
  )

  player:sendAnimation(49)

  player:dialogSeq({
    t,
    selectedTier.rewardText
  }, 0)
end