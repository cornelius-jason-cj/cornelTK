crashing_echo = {
  cast = function(player)
    local spellName = "Crashing Echo"
    local spellIdent = "crashing_echo"
    local aethers = 20000
    local durations = 15000

    if not player:canCast(1, 1, 0) then
      return
    end

    local multiplier = (0.125 + player.karma)
    local damage = math.floor(player.maxMagic * multiplier)

    local currentMagic = player.magic

    if damage > 10000 then
      damage = 10000
    end

    local magicCost = damage

    if (player.magic < magicCost) then
      player:sendMinitext("You do not have enough mana.")
      return
    end
    
    player.magic = player.magic - magicCost
    player:sendStatus()
    player:setDuration(spellIdent, durations)
    player:setAether(spellIdent, aethers)
    player:sendMinitext("You cast " .. spellName .. ".")
    player:sendAction(6, 35)
		player:playSound(18)
  end,

  while_cast = function(player)
    local spellName = "Crashing Echo"
    local spellIdent = "crashing_echo"
    local multiplier = (0.125 + player.karma)
    local damage = math.floor(player.maxMagic * multiplier)

    local spellFX = 4001
    local x = {-2, -1,  1,  2, -1,  0,  1, -1,  0,  1,  0,  0}
    local y = { 0,  0,  0,  0,  1,  1,  1, -1, -1, -1,  2, -2}
      
    for i = 1, #x do
      local targets = player:getObjectsInCell(
        player.m,
        player.x + x[i],
        player.y + y[i],
        BL_MOB
      )
      
        if (#targets > 0) then
          global_zap.cast(
            player,
            targets[1],
            damage,
            0,
            spellFX
          )
        end

        targets = player:getObjectsInCell(
          player.m,
          player.x + x[i],
          player.y + y[i],
          BL_PC
        )
        if (#targets > 0) then
          local worked = global_zap.cast(
            player,
            targets[1],
            damage,
            0,
            spellFX
          )

        if (worked == 2) then
          -- targets[1]:sendMinitext(player.name .. " cast " .. spellNames[alignmentIndex] .. " on you.")
        end
      end
    end
  end,


  requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Slash monster around you"
		return level, items, itemAmounts, description
	end
}