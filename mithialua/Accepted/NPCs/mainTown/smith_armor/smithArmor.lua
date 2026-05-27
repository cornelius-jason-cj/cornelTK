
local essenceConfig = {
  {
    itemIdentifier = "basic_armor_essence",
    itemName = "Basic Armor Essence (BAE)",
    requirements = {
      {
        itemIdentifier = "bear_fur",
        itemName = "Bear Fur",
        amount = 20
      },
      {
        itemIdentifier = "bear_liver",
        itemName = "Bear Liver",
        amount = 40
      }
    },
    expTable = {
      [1] = 8000,
      [5] = 40000,
      [10] = 80000,
      [20] = 160000
    },
    karmaTable = {
      [1] = 0.01,
      [5] = 0.05,
      [10] = 0.1,
      [20] = 0.2
    }
  },
  {
    itemIdentifier = "refine_armor_essence",
    itemName = "Rasic Armor Essence (RAE)",
    requirements = {
      {
        itemIdentifier = "fox_tail",
        itemName = "Fox Tail",
        amount = 20
      },
      {
        itemIdentifier = "topaz",
        itemName = "Topaz",
        amount = 40
      }
    },

    expTable = {
      [1] = 12000,
      [5] = 67500,
      [10] = 165000,
      [20] = 378000
    }
  },
}

local armorConfig = {
  [1] = {
    male = "vanguard_mail",
    female = "vanguard_mail_dress",
    display = {
      male = "Vanguard Mail",
      female = "Vanguard Mail Dress"
    }
  },

  [2] = {
    male = "phantom_waistcoat",
    female = "phantom_blouse",
    display = {
      male = "Phantom Waistcoat",
      female = "Phantom Blouse"
    }
  },

  [3] = {
    male = "arcane_garb",
    female = "arcane_dress",
    display = {
      male = "Arcane Garb",
      female = "Arcane Dress"
    }
  },

  [4] = {
    male = "lunar_robes",
    female = "lunar_gown",
    display = {
      male = "Lunar Robes",
      female = "Lunar Gown"
    }
  }
}

local forgeCost = 2
local maxForge = 10
local essenceQty = {1, 5, 10, 20}

local function getNpcTable(npc)
  return {
    graphic = convertGraphic(npc.look, "monster"),
    color = npc.lookColor
  }
end

local function getPlayerArmorBase(player)

  local classArmor = armorConfig[player.baseClass]

  if player.sex == 0 then
    return classArmor.male
  end

  return classArmor.female
end

local function getPlayerArmorDisplay(player)

  local classArmor = armorConfig[player.baseClass]

  if player.sex == 0 then
    return classArmor.display.male
  end

  return classArmor.display.female
end

local function getEssenceConfigByName(name)

  for i = 1, #essenceConfig do

    if essenceConfig[i].itemName == name then
      return essenceConfig[i]
    end
  end

  return nil
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

local function getCurrentForgeLevel(player, baseArmor)
  for i = 0, maxForge do

    local itemName

    if i == 0 then
      itemName = baseArmor
    else
      itemName = baseArmor .. "_" .. i
    end

    if player:hasItem(itemName, 1) == true then
      currentLevel = i
      currentItem = itemName
      return currentLevel, currentItem
    end
  end

  return nil, nil
end

local function getNextForgeItem(baseArmor, nextLevel)

  if nextLevel == 0 then
    return baseArmor
  end

  return baseArmor .. "_" .. nextLevel
end

local function removeRequirements(player, requirements)
  for i = 1, #requirements do
    player:removeItem(
      requirements[i].itemIdent,
      requirements[i].amount
    )
  end
end

local function craftEssence( player, npc, config, quantity)
  local t = getNpcTable(npc)

  -- local config = essenceConfig[essenceName]

  if config == nil then
    player:dialogSeq({
      t,
      "Invalid essence."
    }, 0)

    return
  end
  
  for i = 1, #config.requirements do
    local requirement = config.requirements[i]
    local itemNeed = requirement.itemIdentifier
    local totalNeed = requirement.amount * quantity

    if player:hasItem(itemNeed, totalNeed) ~= true
    then
      player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
      return
    end
  end

  for i = 1,  #config.requirements do
    local requirement = config.requirements[i]
    local totalNeed = requirement.amount * quantity
    player:removeItem(requirement.itemIdentifier, totalNeed)
  end

  -- local gainedExp = config.expTable[quantity] or 0
  local gainedKarma = config.karmaTable[quantity] or 0

  -- player:giveXP(gainedExp)
  player.karma = player.karma + gainedKarma

  player:sendAnimation(49)
  player:addItem(config.itemIdentifier, quantity)
  player:dialogSeq({
    t,
    "Success!\n" ..
    "You created " ..
    quantity ..
    " " ..
    config.itemName .. "."
  }, 0)
end

local function forgeArmor(player, npc)

  local t = {
    graphic = convertGraphic(npc.look, "monster"),
    color = npc.lookColor
  }

  local baseArmor = getPlayerArmorBase(player)
  local currentLevel, currentItem = getCurrentForgeLevel(player, baseArmor)

  if currentLevel == nil then
    player:dialogSeq({
      t,
      "You do not possess the required armor."
    }, 0)

    return
  end

  if currentLevel >= maxForge then
    player:dialogSeq({
      t,
      "Your armor has already reached +10."
    }, 0)

    return
  end

  local possibleForge = 1

  local essenceNeed = 
    possibleForge * forgeCost

  if player:hasItem(
    "basic_armor_essence",
    essenceNeed
  ) ~= true then

    player:dialogSeq({
      t,
      "You do not have enough essence."
    }, 0)

    return
  end

  player:removeItem("basic_armor_essence", essenceNeed)
  player:removeItem(currentItem, 1)

  local nextLevel = currentLevel + possibleForge

  local nextArmor =
    getNextForgeItem(
      baseArmor,
      nextLevel
    )

  player:addItem(nextArmor, 1)

  player:sendAnimation(49)

  player:dialogSeq({
    t,
    "Success!\n" ..
    "Your armor has been forged to +" ..
    nextLevel
  }, 0)
end

SmithArmorNpc = {
  click = async(function(player, npc)
    local t = getNpcTable(npc)

		player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.dialogType = 0
		player.lastClick = npc.ID

    if player.level < 15 or 
      player:hasLegend("learn_basic_armor_forging") == false 
    then
      player:dialogSeq({t, "Go to your guru at level 15 to learn forging."}, 0)
    end

    local opts = {"Create Essence", "Forge Armor"}

    local choice = player:menuString(
			"Hello! How can I help you today?",
			opts
		)

    if choice == "Create Essence" then
      local essenceList = {}

     for i = 1, #essenceConfig do
        table.insert(essenceList, essenceConfig[i].itemName)
      end

      local choice2 = player:menuString(
        "Which essence do you want to create",
        essenceList
      )

      local config = getEssenceConfigByName(choice2)

      local choice3 = player:menuString(
        "Each essence need: \n" ..
        buildRequirementText(
          config.requirements
        ) ..
        "\nRemember, your bag can only hold 80 items.",
        essenceQty
      )

      craftEssence(
        player,
        npc,
        config,
        choice3
      )
    end

    if choice == "Forge Armor" then
      local armorName = getPlayerArmorDisplay(player)

      local choice2 = player:menuString(
        "Which armor do you want to forge",
        {armorName}
      )

      forgeArmor(player, npc)

    end

  end),
}