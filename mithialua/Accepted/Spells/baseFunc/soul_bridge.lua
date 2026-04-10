soul_bridge = {
    cast = function(player)
        local target = Player(player.partner)

        if target ~= nil then
            player:warp(target.m, target.x, target.y)
        else
            anim(player)
            player:sendMinitext("user not found!")
        end

    end,

    requirements = function(player)
	end 
}