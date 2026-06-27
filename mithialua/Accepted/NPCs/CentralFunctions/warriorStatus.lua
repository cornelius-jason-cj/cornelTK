local bersekerRequirement = {
  [2] = {
    might = 60,
    grace = 5,
    will = 5
  },
  [3] = {
    might = 115,
    grace = 5,
    will = 5
  },
  [4] = {
    might = 185,
    grace = 5,
    will = 5
  },
  [5] = {
    might = 255,
    grace = 5,
    will = 5
  }
}

local counterRequirement = {
  [2] = {
    might = 40,
    grace = 15,
    will = 15
  },
  [3] = {
    might = 75,
    grace = 25,
    will = 25
  },
  [4] = {
    might = 105,
    grace = 45,
    will = 45
  },
  [5] = {
    might = 145,
    grace = 60,
    will = 60
  }
}

local guardianRequirement = {
  [2] = {
    might = 55,
    grace = 5,
    will = 10
  },
  [3] = {
    might = 105,
    grace = 5,
    will = 15
  },
  [4] = {
    might = 160,
    grace = 5,
    will = 30
  },
  [5] = {
    might = 200,
    grace = 5,
    will = 60
  }
}

local weaponMasterRequirement = {
  [2] = {
    might = 40,
    grace = 25,
    will = 5
  },
  [3] = {
    might = 75,
    grace = 45,
    will = 5
  },
  [4] = {
    might = 115,
    grace = 75,
    will = 5
  },
  [5] = {
    might = 160,
    grace = 100,
    will = 5
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

function upgradeBerseker(player, level)
  spellLevelUp(player)
  upgradeSpell(player,
      "blood_rage_" .. (level - 1),
      "blood_rage_" .. level)
  upgradeSpell(player,
      "execution_" .. (level - 1),
      "execution_" .. level)
  upgradeSpell(player,
      "last_stand_" .. (level - 1),
      "last_stand_" .. level)
end

function upgradeCounter(player, level)
  spellLevelUp(player)
  upgradeSpell(player,
      "counter_stance_" .. (level - 1),
      "counter_stance_" .. level)
  upgradeSpell(player,
      "defiance_" .. (level - 1),
      "defiance_" .. level)
  upgradeSpell(player,
      "thorns_" .. (level - 1),
      "thorns_" .. level)
end

function upgradeGuardian(player, level)
  spellLevelUp(player)
  upgradeSpell(player,
      "defender_roar_" .. (level - 1),
      "defender_roar_" .. level)
  upgradeSpell(player,
      "iron_skin_" .. (level - 1),
      "iron_skin_" .. level)
  upgradeSpell(player,
      "shield_slam_" .. (level - 1),
      "shield_slam_" .. level)
end

function upgradeWeaponMaster(player, level)
  spellLevelUp(player)
  upgradeSpell(player,
      "combo_strike_" .. (level - 1),
      "combo_strike_" .. level)
  upgradeSpell(player,
      "precision_slash_" .. (level - 1),
      "precision_slash_" .. level)
  upgradeSpell(player,
      "whirlwind_" .. (level - 1),
      "whirlwind_" .. level)
end


warriorStatus = {}

warriorStatus.increase = function(player, npc)
  local warriorBuild = player.registry["warrior_build"]
  local might = player.baseMight
  local grace = player.baseGrace
  local will =  player.baseWill

  if(warriorBuild == 1) then
    local nextLevel = player.registry["berseker_spell_level"] + 1

    if nextLevel <= 5 then
      local req = bersekerRequirement[nextLevel]
      
      if checkRequirement(player, req) then
        player.registry["berseker_spell_level"] = nextLevel
        upgradeBerseker(player, nextLevel)
      end
    end
  end

  if(rogueBuild == 2) then
    local nextLevel = player.registry["counter_spell_level"] + 1

    if nextLevel <= 5 then
      local req = counterRequirement[nextLevel]
      
      if checkRequirement(player, req) then
        player.registry["counter_spell_level"] = nextLevel
        upgradeCounter(player, nextLevel)
      end
    end
  end

  if(rogueBuild == 3) then
    local nextLevel = player.registry["guardian_spell_level"] + 1
    
    if nextLevel <= 5 then
      local req = guardianRequirement[nextLevel]
      
      if checkRequirement(player, req) then
        player.registry["guardian_spell_level"] = nextLevel
        upgradeGuardian(player, nextLevel)
      end
    end
  end
  
  if(rogueBuild == 4) then
    local nextLevel = player.registry["weapon_master_spell_level"] + 1

    if nextLevel <= 5 then
      local req = weaponMasterRequirement[nextLevel]
      
      if checkRequirement(player, req) then
        player.registry["weapon_master_spell_level"] = nextLevel
        upgradeWeaponMaster(player, nextLevel)
      end
    end
  end
  
end