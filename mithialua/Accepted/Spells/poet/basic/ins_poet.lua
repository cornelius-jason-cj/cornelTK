ins_poet = {
    cast = function(player, target)

        local magicCost
        local anim = 322
        local sound = 54
        local needMana = target.maxMagic - target.magic
        if needMana >= player.magic then
        magicCost = (player.magic - 30)
        else
        magicCost = needMana
        end
        
        if not player:canCast(1,1,0) then return end
        if player.magic <= 0 then notEnoughMP(player) return end
        if (target.blType ~= BL_PC) or (target.ID == player.ID) then player:sendMinitext("Invalid target.") return end
        if target.state == 1 then player:sendMinitext("Your target is dead!") return end
        
        player:sendAction(6, 20)
        player.magic = player.magic - magicCost
        target.magic = target.magic + magicCost
        player:sendMinitext("You cast Inspire")
        target:sendMinitext(player.name.." inspires your mind.")
        player:sendStatus()
        target:sendStatus()
        player:playSound(sound)
        target:sendAnimation(anim)
    end,

    requirements = function(player)
		local level = 5
		local items = {"gold_acorn"}
		local itemAmounts = {10}
		local description = "Give an ally your mana"
		return level, items, itemAmounts, description
	end
}