
local essenceConfig = {
  {
    itemIdentifier = "basic_weapon_essence",
    itemName = "Basic Weapon Essence (BAE)",
    requirements = {
      {
        itemIdentifier = "tiger_pelt",
        itemName = "Tiger Pelt",
        amount = 20
      },
      {
        itemIdentifier = "tiger_meat",
        itemName = "Tiger Meat",
        amount = 40
      }
    },
    expTable = {
      [1] = 8000,
      [5] = 45000,
      [10] = 110000,
      [20] = 252000
    },
    karmaTable = {
      [1] = 0.01,
      [5] = 0.05,
      [10] = 0.1,
      [20] = 0.2
    }
  },
  -- {
  --   itemIdentifier = "refine_weapon_essence",
  --   itemName = "Basic Weapon Essence (BAE)",
  --   requirements = {
  --     {
  --       itemIdentifier = "fox_tail",
  --       itemName = "Fox Tail",
  --       amount = 20
  --     },
  --     {
  --       itemIdentifier = "obsidian",
  --       itemName = "obsidian",
  --       amount = 40
  --     }
  --   },
  --   expTable = {
  --     [1] = 12000,
  --     [5] = 67500,
  --     [10] = 165000,
  --     [20] = 378000
  --   },
  --   karmaTable = {
  --     [1] = 0.01,
  --     [5] = 0.05,
  --     [10] = 0.1,
  --     [20] = 0.2
  --   }
  -- },
  -- {
  --   itemIdentifier = "mystic_weapon_essence",
  --   itemName = "Mystic Weapon Essence (MWE)",
  --   requirements = {
  --     {
  --       itemIdentifier = "fox_tail",
  --       itemName = "Fox Tail",
  --       amount = 20
  --     },
  --     {
  --       itemIdentifier = "topaz",
  --       itemName = "Topaz",
  --       amount = 40
  --     }
  --   },
  --   expTable = {
  --     [1] = 12000,
  --     [5] = 67500,
  --     [10] = 165000,
  --     [20] = 378000
  --   },
  --   karmaTable = {
  --     [1] = 0.01,
  --     [5] = 0.05,
  --     [10] = 0.1,
  --     [20] = 0.2
  --   }
  -- },
}

local weaponConfig = {
  [1] = {
    display = "Maxcaliber",
    identifier = "maxcaliber"
  },
  [2] = {
    display = "Moonblade",
    identifier = "moonblade"
  },
  [3] = {
    display = "Wicked Staff",
    identifier = "wicked_staff"
  },
  [4] = {
    display = "Deaths Fan",
    identifier = "deaths_fan"
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

local function getPlayerWeaponBase(player)

  local classWeapon = weaponConfig[player.baseClass]

  return classWeapon.identifier
end

local function getPlayerWeaponDisplay(player)

  local classWeapon = weaponConfig[player.baseClass]

  return classWeapon.display
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

local function getCurrentForgeLevel(player, baseWeapon)
  for i = 0, maxForge do

    local itemName

    if i == 0 then
      itemName = baseWeapon
    else
      itemName = baseWeapon .. "_" .. i
    end

    if player:hasItem(itemName, 1) == true then
      currentLevel = i
      currentItem = itemName
      return currentLevel, currentItem
    end
  end

  return nil, nil
end

local function getNextForgeItem(basWeapon, nextLevel)

  if nextLevel == 0 then
    return basWeapon
  end

  return basWeapon .. "_" .. nextLevel
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

    player:sendMinitext("itemNeed " .. itemNeed)
    player:sendMinitext("quantity " .. quantity)
    player:sendMinitext("totalNeed " .. totalNeed)

    if player:hasItem(itemNeed, totalNeed) ~= true
    then
      player:dialogSeq({t, "It looks like you don't have enough ingredients."}, 0)
      return
    end
  end

  for i = 1, #config.requirements do
    local requirement = config.requirements[i]
    local totalNeed = requirement.amount * quantity
    player:removeItem(requirement.itemIdentifier, totalNeed)
  end

  -- local gainedExp = config.expTable[quantity] or 0
  -- local gainedKarma = config.karmaTable[quantity] or 0

  -- player:giveXP(gainedExp)
  -- player.karma = player.karma + gainedKarma

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

local function forgeWeapon(player, npc)

  local t = {
    graphic = convertGraphic(npc.look, "monster"),
    color = npc.lookColor
  }

  local baseWeapon = getPlayerWeaponBase(player)
  local currentLevel, currentItem = getCurrentForgeLevel(player, baseWeapon)

  if currentLevel == nil then
    player:dialogSeq({
      t,
      "You do not possess the required weapon."
    }, 0)

    return
  end

  if currentLevel >= maxForge then
    player:dialogSeq({
      t,
      "Your weapon has already reached +10."
    }, 0)

    return
  end

  local possibleForge = 1

  local essenceNeed = possibleForge * forgeCost

  if player:hasItem(
    "basic_weapon_essence",
    essenceNeed
  ) ~= true then

    player:dialogSeq({
      t,
      "You do not have enough essence."
    }, 0)

    return
  end

  player:removeItem("basic_weapon_essence", essenceNeed)
  player:removeItem(currentItem, 1)

  local nextLevel = currentLevel + possibleForge

  local nextWeapon =
    getNextForgeItem(
      baseWeapon,
      nextLevel
    )

  player:addItem(nextWeapon, 1)

  player:sendAnimation(49)

  player:dialogSeq({
    t,
    "Success!\n" ..
    "Your weapon has been forged to +" ..
    nextLevel
  }, 0)
end

SmithWeaponNpc = {
  click = async(function(player, npc)
    local t = getNpcTable(npc)

		player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.dialogType = 0
		player.lastClick = npc.ID

    if player.level < 15 or 
      player:hasLegend("learn_basic_weapon_forging") == false 
    then
      player:dialogSeq({t, "Go to your guru at level 15 to learn forging."}, 0)
    end

    local opts = {
      "Create Essence",
      "Forge Weapon",
      "-------------",
      "Upgrade Weapon"
    }

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

    if choice == "Forge Weapon" then
      local weaponName = getPlayerWeaponDisplay(player)

      local choice2 = player:menuString(
        "Which weapon do you want to forge",
        {weaponName}
      )

      forgeWeapon(player, npc)

    end

    if choice == "Upgrade Weapon" then
      if player.karma < 0.08806 then
        player:dialogSeq({
          t,
          "Your spirit has not yet reached the level I require. Return when you have earned the title of Colonel."
        }, 0)
      end
    end

  end),
}