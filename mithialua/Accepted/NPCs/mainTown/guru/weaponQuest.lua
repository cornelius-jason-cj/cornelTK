weaponQuest = {}

local weaponTiers = {
  {
    legendIdentifier = "finish_basic_weapon_quest",
    legendText = "Finish Basic Armor Quest",
    minLevel = 5,
    maxLevel = 99,
    exp = 15000,
    choiceText =  "To obtain basic weapon, you'll need:",

    requirements = {
      {
        item = "Acorn",
        itemIdent = "acorn",
        amount = 100
      },
      {
        item = "Rabbit meat",
        itemIdent = "rabbit_meat",
        amount = 100
      },
      {
        item = "Antler",
        itemIdent = "antler",
        amount = 25}
        ,
      {
        item = "Gold Acorn",
        itemIdent = "gold_acorn",
        amount = 25}
    },

    rewardQty = 1,
    rewards = {
      [1] = "maxcaliber",
      [2] = "moonblade",
      [3] = "wicked_staff",
      [4] = "deaths_fan"
    },
    rewardText = "Great! Here is take your weapon",
  },

  {
    legendIdentifier = "learn_basic_weapon_forging",
    legendText = "Learn Basic Weapon Forging",
    requiredLegend = "finish_basic_weapon_quest",
    minLevel = 15,
    maxLevel = 99,
    exp = 175000,
    choiceText =  "To learn forge basic weapon, you'll need:",
    
    requirements = {
      {
        item = "Gold Acorn",
        itemIdent = "gold_acorn",
        amount = 25
      },
      {
        item = "Tiger Pelt",
        itemIdent = "tiger_pelt",
        amount = 75
      },
      {
        item = "Tiger Meat",
        itemIdent = "tiger_meat",
        amount = 150
      },
    },
    
    rewardQty = 1,
    rewards = {
      [1] = "basic_weapon_essence",
      [2] = "basic_weapon_essence",
      [3] = "basic_weapon_essence",
      [4] = "basic_weapon_essence"
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
    if player:hasItem(requirements[i].itemIdent, requirements[i].amount) ~= true then
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

weaponQuest.basicWeapon = function(player, npc)

  local t = {
    graphic = convertGraphic(npc.look, "monster"),
    color = npc.lookColor
  }

  local selectedTier = nil

  for i = 1, #weaponTiers do

    local tier = weaponTiers[i]
    local requirementPassed = true

    if tier.requiredLegend ~= nil then
      requirementPassed = player:hasLegend(
        tier.requiredLegend
      )
    end

    if requirementPassed
      and player.level >= tier.minLevel
      and player.level <= tier.maxLevel
      and not player:hasLegend(tier.legendIdentifier)
    then
      selectedTier = tier
      break
    end
  end

  if selectedTier == nil then
    player:dialogSeq({
      t,
      "There are no weapon quests available for you right now."
    }, 0)

    return
  end
  player:sendMinitext("selectedTier.choiceText")
  local choiceMessage =
    selectedTier.choiceText ..
    buildRequirementText(selectedTier.requirements) ..
    "Do you have the ingredients?"

  local choice = player:menuString(
    choiceMessage,
    {"Yes, here they are", "Never mind"}
  )

  if choice == "Never mind" then
    player:dialogSeq({
      t,
      "Okay, see you later."
    }, 0)

    return
  end

  if hasRequirements(player, selectedTier.requirements) ~= true then
    player:dialogSeq({
      t,
      "It looks like you don't have enough ingredients."
    }, 0)

    return
  end

  removeRequirements(player, selectedTier.requirements)

  player:giveXP(selectedTier.exp)

  local rewardItem = selectedTier.rewards[player.baseClass]
  local rewardQty = selectedTier.rewardQty

  if rewardItem ~= nil then
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