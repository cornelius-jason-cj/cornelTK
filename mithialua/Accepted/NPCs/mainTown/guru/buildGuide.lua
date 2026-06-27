buildGuide = {}

buildGuide.warrior = function(player, npc)
   local t = {
    graphic = convertGraphic(npc.look, "monster"),
    color = npc.lookColor
  }
  player.npcGraphic = t.graphic
  player.npcColor = t.color
  player.dialogType = 0
  player.lastClick = npc.ID

  local opts = {"Berseker", "Counter", "Guardian", "Weapon Master"}

  local choice = player:menuString(
    "Hello! How can I help you today?",
    opts
  )

  if choice == "Berseker" then
    player:dialogSeq({
      t,
      "Berserker\n\nA fearless Warrior who relies on raw strength and relentless attacks.",

      "Primary Attributes\n\nMight ******\nGrace **\nWill  *",

      "Playstyle\n\n- High Damage\n- Lifesteal\n- Low Defense",

      "Blood Rage\n\nIncrease your damage while lowering your Armor.",

      "Execution\n\nDeliver a devastating melee strike that scales with your Might.",

      "Last Stand\n\nGain Lifesteal and restore Health whenever you deal damage.",

      "Spell Requirements\n\nSpells level up automatically when you meet the required attributes.",

      "Lv2  Might 60\nLv3  Might 115\nLv4  Might 185\nLv5  Might 255\n\nLevel 5 also requires\nTrial of Rage.",
    }, 1)
  end

  if choice == "Counter" then
    player:dialogSeq({
      t,
      "Counter\n\nA defensive Warrior who punishes enemies whenever they dare to attack.",

      "Primary Attributes\n\nMight ****\nGrace **\nWill  **",

      "Playstyle\n\n- High Defense\n- Counter Damage\n- Thorn",

      "Counter Stance\n\nReflect incoming damage back to attackers for a short duration.",

      "Defiance\n\nGreatly increases your Armor while your Health is below 50%.",

      "Thorns\n\nRelease piercing thorns around you, damaging all nearby enemies.",

      "Spell Requirements\n\nSpells level up automatically when you meet the required attributes.",

      "Lv2 Might 40 Grace 15 Will 15\nLv3 Might 70 Grace 25 Will 25\nLv4 Might 105 Grace 45 Will 45\nLv5 Might 145 Grace 60 Will 60\n\nLevel 5 also requires\nTrial of Resolve."
    }, 1)
  end

  if choice == "Guardian" then
    player:dialogSeq({
      t,

      "Guardian\n\nAn unbreakable Warrior who protects allies and controls the battlefield.",

      "Primary Attributes\n\nMight *****\nGrace *\nWill **",

      "Playstyle\n\n- Highest Defense\n- Crowd Control\n- Frontline Tank",

      "Defender's Roar\n\nDeal damage in a wide area and weaken enemy Armor.",

      "Iron Skin\n\nGreatly increases your Armor for a short duration.",

      "Shield Slam\n\nSmash a single enemy, dealing damage and stunning the target.",

      "Spell Requirements\n\nSpells level up automatically when you meet the required attributes.",

      "Lv2 Might 55 Will 10\nLv3 Might 105 Will 15\nLv4 Might 160 Will 30\nLv5 Might 200 Will 60\n\nLevel 5 also requires\nTrial of the Shield."
    }, 1)

  end

  if choice == "Weapon Master" then
    player:dialogSeq({
      t,

      "Weapon Master\n\nA disciplined Warrior who overwhelms enemies with superior weapon techniques.",

      "Primary Attributes\n\nMight ****\nGrace ***\nWill *",

      "Playstyle\n\n- Balanced Damage\n- Critical Strikes\n- Weapon Techniques",

      "Combo Strike\n\nUnleash a rapid combo with a chance to deal devastating critical damage.",

      "Precision Slash\n\nDeliver an accurate strike that can reduce the target's Armor.",

      "Whirlwind\n\nSpin your weapon to damage all nearby enemies.",

      "Spell Requirements\n\nSpells level up automatically when you meet the required attributes.",

      "Lv2 Might 40 Grace 25\nLv3 Might 75 Grace 45\nLv4 Might 115 Grace 75\nLv5 Might 160 Grace 100\n\nLevel 5 also requires\nTrial of Mastery."
    }, 1)
  end
end

buildGuide.rogue = function(player, npc)
  
   local t = {
    graphic = convertGraphic(npc.look, "monster"),
    color = npc.lookColor
  }
  player.npcGraphic = t.graphic
  player.npcColor = t.color
  player.dialogType = 0
  player.lastClick = npc.ID

  local opts = {"Assassin", "Poison", "Shadow", "Trap Master"}

  local choice = player:menuString(
    "Hello! How can I help you today?",
    opts
  )

  if choice == "Assassin" then
    player:dialogSeq({
      t,

      "Assassin\n\nA deadly Rogue who eliminates enemies with speed, precision, and deadly critical strikes.",

      "Primary Attributes\n\nMight *\nGrace *****\nWill *",

      "Playstyle\n\n• High Burst Damage\n• Critical Strikes\n• Mobile",

      "Assassinate\n\nStrike enemies standing in front of you.",

      "Critical Focus\n\nIncrease your Critical Chance for a short duration.",

      "Death Mark\n\nMark enemies, reducing their Armor and making them vulnerable.",

      "Spell Requirements\n\nSpells level up automatically when you meet the required attributes.",

      "Lv2 Grace 60\nLv3 Grace 115\nLv4 Grace 185\nLv5 Grace 255\n\nLevel 5 also requires\nTrial of Focus."
    }, 1)
  end

  if choice == "Poison" then
    player:dialogSeq({
      t,

      "Poison\n\nA cunning Rogue who weakens enemies with deadly toxins and relentless poison attacks.",

      "Primary Attributes\n\nMight *\nGrace ****\nWill  ****",

      "Playstyle\n\n- Damage over Time\n- Debuffs\n- Sustained Damage",

      "Deadly Toxin\n\nInject a deadly poison that continuously damages the target.",

      "Toxic Cloud\n\nRelease poisonous fumes that weaken nearby enemies by reducing their Armor.",

      "Venom Blade\n\nCoat your weapon with venom to increase your attack damage.",

      "Spell Requirements\n\nSpells level up automatically when you meet the required attributes.",

      "Lv2 Grace 30 Will 30\nLv3 Grace 60 Will 60\nLv4 Grace 95 Will 95\nLv5 Grace 130 Will 130\n\nLevel 5 also requires\nTrial of Venom."
    }, 1)
  end

  if choice == "Shadow" then
    player:dialogSeq({
      t,

      "Shadow\n\nA swift Rogue who outmaneuvers enemies with speed, deception, and deadly ambushes.",

      "Primary Attributes\n\nMight ****\nGrace ****\nWill *",

      "Playstyle\n\n• High Mobility\n• Ambush\n• Area Damage",

      "Eclipse\n\nRelease a burst of shadow energy that damages nearby enemies.",

      "Phantom Strike\n\nBlink through enemies, damaging everyone along your path.",

      "Shadow Form\n\nBecome one with the shadows, greatly increasing your mobility and combat potential.",

      "Spell Requirements\n\nSpells level up automatically when you meet the required attributes.",

      "Lv2 Might 30 Grace 30\nLv3 Might 60 Grace 60\nLv4 Might 95 Grace 95\nLv5 Might 130 Grace 130\n\nLevel 5 also requires\nTrial of the Phantom."
    }, 1)
  end

  if choice == "Trap Master" then
    player:dialogSeq({
      t,

      "Trap Master\n\nA tactical Rogue who dominates the battlefield with deadly traps and careful planning.",

      "Primary Attributes\n\nMight ***\nGrace ****\nWill ***",

      "Playstyle\n\n- Battlefield Control\n- Area Denial\n- Tactical Damage",

      "Explosive Trap\n\nPlant an explosive trap that deals area damage when triggered.",

      "Poison Trap\n\nRelease poisonous gas that damages enemies over time and reduces their Armor.",

      "Spike Trap\n\nImpale enemies with deadly spikes, dealing heavy damage and paralyzing them.",

      "Spell Requirements\n\nSpells level up automatically when you meet the required attributes.",

      "Lv2 Might 20 Grace 30 Will 20\nLv3 Might 35 Grace 50 Will 35\nLv4 Might 55 Grace 70 Will 55\nLv5 Might 80 Grace 105 Will 80\n\nLevel 5 also requires\nTrial of Cunning."
    }, 1)
  end
end

buildGuide.mage = function(player, npc)
end

buildGuide.poet = function(player, npc)
end