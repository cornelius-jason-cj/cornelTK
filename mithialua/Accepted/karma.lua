KarmaSystem = {}

KarmaSystem.tiers = {
  {
    karma = 0,
    title = "Karma Baby",
    legend = "karma_baby"
  },
  {
    karma = 0.00050,
    title = "Karma Child",
    legend = "karma_child"
  },
  {
    karma = 0.00120,
    title = "Karma Adult",
    legend = "karma_adult"
  },
  {
    karma = 0.00264,
    title = "Karma Common",
    legend = "karma_common"
  },
  {
    karma = 0.00581,
    title = "Karma Soldier",
    legend = "karma_soldier"
  },
  {
    karma = 0.01220,
    title = "Karma Sergeant",
    legend = "karma_sergeant"
  },
  {
    karma = 0.02439,
    title = "Karma Captain",
    legend = "karma_captain"
  },
  {
    karma = 0.04635,
    title = "Karma Major",
    legend = "karma_major"
  },
  -----------------------------------------------------
  {
    karma = 0.08806,
    title = "Karma Colonel",
    legend = "karma_colonel"
  },
  {
    karma = 0.14020,
    title = "Karma General",
    legend = "karma_general"
  },
  {
    karma = 0.20537,
    title = "Karma Citizen",
    legend = "karma_citizen"
  },
  {
    karma = 0.28683,
    title = "Karma Amateur",
    legend = "karma_amateur"
  },
  -----------------------------------------------------
  {
    karma = 0.38867,
    title = "Karma Sir",
    legend = "karma_sir"
  },
  {
    karma = 0.51595,
    title = "Karma Baron",
    legend = "karma_baron"
  },
  {
    karma = 0.67507,
    title = "Karma Viscount",
    legend = "karma_viscount"
  },
  {
    karma = 0.87395,
    title = "Karma Count",
    legend = "karma_count"
  },
  -----------------------------------------------------
  {
    karma = 1.12256,
    title = "Karma Marquis",
    legend = "karma_marquis"
  },
  {
    karma = 1.43333,
    title = "Karma Duke",
    legend = "karma_duke"
  },
  {
    karma = 1.82178,
    title = "Karma King",
    legend = "karma_king"
  },
  {
    karma = 2.30735,
    title = "Karma Great King",
    legend = "karma_great_king"
  },
  -----------------------------------------------------
  {
    karma = 2.91431,
    title = "Karma Incredible",
    legend = "karma_incredible"
  },
  {
    karma = 3.67301,
    title = "Karma Invicible",
    legend = "karma_invicible"
  },
  {
    karma = 4.62139,
    title = "Karma Veteran",
    legend = "karma_Veteran"
  },
  {
    karma = 5.80686,
    title = "Karma Centurion",
    legend = "karma_centurion"
  },
  -----------------------------------------------------
  {
    karma = 7.28869,
    title = "Karma Praetorian",
    legend = "karma_praetorian"
  },
  {
    karma = 9.36327,
    title = "Karma Lieutenant",
    legend = "karma_lieutenant"
  },
  {
    karma = 12.26767,
    title = "Karma Commander",
    legend = "karma_commander"
  },
  {
    karma = 16.33383,
    title = "Karma Hero",
    legend = "karma_hero"
  },
  -----------------------------------------------------
  {
    karma = 22.02645,
    title = "Karma Nobel",
    legend = "karma_nobel"
  },
  {
    karma = 29.99613,
    title = "Karma Majestic",
    legend = "karma_majestic"
  },
  {
    karma = 41.15367,
    title = "Karma Venerable",
    legend = "karma_venerable"
  },
  {
    karma = 56.77423,
    title = "Karma Master",
    legend = "karma_master"
  },
  -----------------------------------------------------
  {
    karma = 78.64302,
    title = "Karma Golem",
    legend = "karma_golem"
  },
  {
    karma = 109.25932,
    title = "Karma Immortal",
    legend = "karma_immortal"
  },
  {
    karma = 152.12214,
    title = "Karma Legendary",
    legend = "karma_legendary"
  },
  {
    karma = 212.13009,
    title = "Karma Mythical",
    legend = "karma_mythical"
  },
  {
    karma = 296.14122,
    title = "Karma Omnipotent",
    legend = "karma_omnipotent"
  },
  {
    karma = 413.75680,
    title = "Karma Demigod",
    legend = "karma_demigod"
  },
}

function KarmaSystem.addKarma(player, amount)
  player.karma = player.karma + amount
  KarmaSystem.updateTitle(player)
end

function KarmaSystem.getCurrentTier(player)
  local currentTier = nil

  for i = 1, #KarmaSystem.tiers do
    local tier = KarmaSystem.tiers[i]
    local result = player.karma >= tier.karma

    if result then
      currentTier = tier
    end
  end

  return currentTier
end

function KarmaSystem.removeOldTitles(player)
  for i = 1, #KarmaSystem.tiers do
    local tier = KarmaSystem.tiers[i]
    if player:hasLegend(tier.legend) then
      player:removeLegendbyName(tier.legend)
    end
  end
end

function KarmaSystem.updateTitle(player)
  local tier = KarmaSystem.getCurrentTier(player)

  if tier == nil then
    return
  end

  if player:hasLegend(tier.legend) then
    return
  end

  KarmaSystem.removeOldTitles(player)

  player:addLegend(
    tier.title,
    tier.legend,
    130,
    61
  )
  player:sendAnimation(348)
  player:playSound(123)
  player:sendMinitext(
    "You have been promoted to " ..
    tier.title .. "."
  )
end

function KarmaSystem.getNextTier(player)
  for i = 1, #KarmaSystem.tiers do
    local tier = KarmaSystem.tiers[i]

    if player.karma < tier.karma then
      return tier
    end
  end

  return nil
end

function KarmaSystem.getKarmaProgress(player)
  local nextTier = KarmaSystem.getNextTier(player)

  if nextTier == nil then
    return {
      isMax = true
    }
  end

  return {
    isMax = false,
    nextTitle = nextTier.title,
    needed = nextTier.karma - player.karma
  }
end