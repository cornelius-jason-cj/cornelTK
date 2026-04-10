flame_pillar = {
    cast = function(player, target)
        local spellName = "Flame Pillar"
        local spellIdent = "flame_pillar"
        local magicCost = math.floor(player.maxMagic * 0.4)
        local healthCost = math.floor(player.maxHealth * 0.25)
        local multiplier = 0.3 + player.baseWill / 1000
        local damage = math.floor((player.maxMagic * multiplier) + (player.maxHealth * 0.125))
		local aethers = 30000
        local durations = 20000 

        if not player:canCast(1,1,0) then return end

        if target.state == 1 then player:sendMinitext("Your target is dead!") return end

        if (player.magic < magicCost) then
            player:sendMinitext("You do not have enough mana.")
            return
        end

        if (player.health < healthCost) then
            player:sendMinitext("You do not have enough health.")
            return
        end
      
        player:sendAction(6, 20)
        player.magic = player.magic - magicCost
        player.health = player.health - healthCost
        player:setDuration(spellIdent, durations)
        player:setAether(spellIdent, aethers)
        player:sendMinitext("You cast Flame Pillar")
        player:playSound(sound)
        player:sendAnimation(anim)
      
        player:sendStatus()
      
    end,

    while_cast = function(player)
        local spellName = "Flame Pillar"
        local spellIdent = "flame_pillar"
        local magicCost = math.floor(player.maxMagic * 0.4)
        local healthCost = math.floor(player.maxHealth * 0.25)
        local multiplier = 0.3 + player.baseWill / 1000
        local damage = math.floor((player.maxMagic * multiplier) + (player.maxHealth * 0.125))
        
        local spellFX = 3005
        
        -- Coordinates for wider AoE (radius -3 to 3 in both X and Y directions)
        -- local x = {-3, -2, -1, 0, 1, 2, 3, -3, 3, -3, 3, -2, -2, 2, 2, -1, 1, 0}
        -- local y = { 0,  0,  0, 0, 0, 0, 0, -2, -2, 2, 2, -1, 1, -1, 1, -3, 3, -3}
        local x = {-3, -2, -1, 0, 1, 2, 3, -2, -1,  0,  1,  2, -1,  0,  1,  0, -2, -1, 0, 1, 2, -1, 0, 1, 0}
        local y = { 0,  0,  0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -2, -2, -2, -3,  1,  1, 1, 1, 1,  2, 2, 2, 3}
        

        -- Loop through the expanded range of coordinates
        for i = 1, #x do
            -- Check for mobs in the expanded range
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
        
            -- Check for players in the expanded range
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
                    targets[1]:sendMinitext(player.name .. " cast " .. spellName .. " on you.")
                end
            end
        end        
    end,

    requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Unleash both your life force and magical energy to summon a massive pillar of fire"
		return level, items, itemAmounts, description
    end
}