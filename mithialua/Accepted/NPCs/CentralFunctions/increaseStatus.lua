increaseStatus = {}

increaseStatus.warrior = function(player, npc)
  local statusPoints = player.registry["status_points"]
  local status = {"Might", "Grace", "Will"}
  local msg
  
  if statusPoints == 0 then
    player:dialogSeq({ t,"Sorry you do not have status point."},1)
    return
  end

  local choice = player:menuString(
    "You have " .. statusPoints .. " status points which status do you want to increase?",
    status
  )
  if choice == "Might" then
    player.baseMight = player.baseMight + 1
    msg = "your might has increase by 1"
  end
  if choice == "Grace" then
    player.baseGrace = player.baseGrace + 1
    msg = "your grace has increase by 1"
  end
  if choice == "Will" then
    player.baseWill = player.baseWill + 1
    msg = "your will has increase by 1"
  end

  player.registry["status_points"] = statusPoints - 1
  player:calcStat()
  player:sendStatus()
  warriorStatus.increase(player, npc)
  player:dialogSeq({ t,"Very well, " .. msg .. "."},1)
end

increaseStatus.rogue = function(player, npc)
  local statusPoints = player.registry["status_points"]
  local status = {"Might", "Grace", "Will"}
  local msg
  
  if statusPoints == 0 then
    player:dialogSeq({ t,"Sorry you do not have status point."},1)
    return
  end

  local choice = player:menuString(
    "You have " .. statusPoints .. " status points which status do you want to increase?",
    status
  )
  if choice == "Might" then
    player.baseMight = player.baseMight + 1
    msg = "your might has increase by 1"
  end
  if choice == "Grace" then
    player.baseGrace = player.baseGrace + 1
    msg = "your grace has increase by 1"
  end
  if choice == "Will" then
    player.baseWill = player.baseWill + 1
    msg = "your will has increase by 1"
  end

  player.registry["status_points"] = statusPoints - 1
  player:calcStat()
  player:sendStatus()
  rogueStatus.increase(player, npc)
  player:dialogSeq({ t,"Very well, " .. msg .. "."},1)
end

increaseStatus.mage = function(player, npc)
end

increaseStatus.poet = function(player, npc)
end