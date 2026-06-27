local assassinRequirement = {
  [2] = {
    might = 5,
    grace = 60,
    will = 5
  },
  [3] = {
    might = 5,
    grace = 115,
    will = 5
  },
  [4] = {
    might = 5,
    grace = 185,
    will = 5
  },
  [5] = {
    might = 5,
    grace = 255,
    will = 5
  }
}

local poisonRequirement = {
  [2] = {
    might = 5,
    grace = 30,
    will = 30
  },
  [3] = {
    might = 5,
    grace = 60,
    will = 60
  },
  [4] = {
    might = 5,
    grace = 95,
    will = 95
  },
  [5] = {
    might = 5,
    grace = 130,
    will = 130
  }
}

local shadowRequirement = {
  [2] = {
    might = 30,
    grace = 30,
    will = 5
  },
  [3] = {
    might = 60,
    grace = 60,
    will = 5
  },
  [4] = {
    might = 95,
    grace = 95,
    will = 5
  },
  [5] = {
    might = 130,
    grace = 130,
    will = 5
  }
}

local trapMasterRequirement = {
  [2] = {
    might = 20,
    grace = 30,
    will = 20
  },
  [3] = {
    might = 35,
    grace = 50,
    will = 35
  },
  [4] = {
    might = 55,
    grace = 70,
    will = 55
  },
  [5] = {
    might = 80,
    grace = 105,
    will = 80
  }
}

function upgradeSpell(player, oldSpell, newSpell)
  player:removeSpell(oldSpell)
  player:addSpell(newSpell)
end

function spellLevelUp(player)
  player:playSound(123)
  player:sendAnimation(71)
  player:sendAnimation(72)
  player:sendAnimation(88)
  player:sendMinitext("Your spells have become stronger!")
end

function checkRequirement(player, req)
  return player.baseMight >= req.might and
         player.baseGrace >= req.grace and
         player.baseWill >= req.will
end

function upgradeAssassin(player, level)
  spellLevelUp(player)
  upgradeSpell(player,
      "assasinate_" .. (level - 1),
      "assasinate_" .. level)
  upgradeSpell(player,
      "critical_focus_" .. (level - 1),
      "critical_focus_" .. level)
  upgradeSpell(player,
      "death_mark_" .. (level - 1),
      "death_mark_" .. level)
end

function upgradePoison(player, level)
  spellLevelUp(player)
  upgradeSpell(player,
      "deadly_toxin_" .. (level - 1),
      "deadly_toxin_" .. level)
  upgradeSpell(player,
      "toxic_cloud_" .. (level - 1),
      "toxic_cloud_" .. level)
  upgradeSpell(player,
      "venom_blade_" .. (level - 1),
      "venom_blade_" .. level)
end

function upgradeShadow(player, level)
  spellLevelUp(player)
  upgradeSpell(player,
      "eclipse_" .. (level - 1),
      "eclipse_" .. level)
  upgradeSpell(player,
      "phantom_strike_" .. (level - 1),
      "phantom_strike_" .. level)
  upgradeSpell(player,
      "shadow_form_" .. (level - 1),
      "shadow_form_" .. level)
end

function upgradeTrapMaster(player, level)
  spellLevelUp(player)
  upgradeSpell(player,
      "explosive_trap_" .. (level - 1),
      "explosive_trap_" .. level)
  upgradeSpell(player,
      "poison_trap_" .. (level - 1),
      "poison_trap_" .. level)
  upgradeSpell(player,
      "spike_trap_" .. (level - 1),
      "spike_trap_" .. level)
end


rogueStatus = {}

rogueStatus.increase = function(player, npc)
  local rogueBuild = player.registry["rogue_build"]
  local might = player.baseMight
  local grace = player.baseGrace
  local will =  player.baseWill

  if(rogueBuild == 1) then
    local nextLevel = player.registry["assassin_spell_level"] + 1

    if nextLevel <= 5 then
      local req = assassinRequirement[nextLevel]
      
      if checkRequirement(player, req) then
        player.registry["assassin_spell_level"] = nextLevel
        upgradeAssassin(player, nextLevel)
      end
    end
  end

  if(rogueBuild == 2) then
    local nextLevel = player.registry["poison_spell_level"] + 1

    if nextLevel <= 5 then
      local req = poisonRequirement[nextLevel]
      
      if checkRequirement(player, req) then
        player.registry["poison_spell_level"] = nextLevel
        upgradePoison(player, nextLevel)
      end
    end
  end

  if(rogueBuild == 3) then
    local nextLevel = player.registry["shadow_spell_level"] + 1
    
    if nextLevel <= 5 then
      local req = shadowRequirement[nextLevel]
      
      if checkRequirement(player, req) then
        player.registry["shadow_spell_level"] = nextLevel
        upgradeShadow(player, nextLevel)
      end
    end
  end
  
  if(rogueBuild == 4) then
    local nextLevel = player.registry["trap_master_spell_level"] + 1

    if nextLevel <= 5 then
      local req = trapMasterRequirement[nextLevel]
      
      if checkRequirement(player, req) then
        player.registry["trap_master_spell_level"] = nextLevel
        upgradeTrapMaster(player, nextLevel)
      end
    end
  end

end