StorageNpc = {
    -- click = async(function(player, npc)
	-- 	Tools.configureDialog(player, npc)
    --     local opts = {}

    --     table.insert(opts, "Deposit Item")
    --     table.insert(opts, "Withdraw Item")
    --     print('storage npc')
	-- 	local choice = player:menuString(
	-- 		"Hello! How can I help you today?",
	-- 		opts
	-- 	)
	-- 	StorageNpc.process_menu_selection(player, npc, selection)
    -- end),

    -- process_menu_selection = function(player, npc, selection, bankOwnerName)
	-- 	if (bankOwnerName == nil) then
	-- 		bankOwnerName = player.name
	-- 	end
		
	-- 	local bankOwner = StorageNpc.get_bankOwner(player, bankOwnerName)

	-- 	if (bankOwner == nil) then
	-- 		return
	-- 	end

	-- 	-- if (selection == "Deposit Item") then
    --     --     print('masuk ke deposit')
	-- 	-- 	player:showBankDeposit(npc, bankOwnerName)
	-- 	-- 	return
	-- 	-- end

	-- 	-- if (selection == "Withdraw Item") then
    --     --     print('masuk ke withdraw')
	-- 	-- 	player:showBankWithdraw(npc, bankOwnerName)
	-- 	-- 	return
	-- 	-- end

	-- 	-- If we get to this point, we know the player is on the main menu and selected a player's
	-- 	-- name. We also know that we did not receive a bankOwnerName in this scenario, so we assumed
	-- 	-- at the beginning of this method that bankOwner = player. However, that will not actually
	-- 	-- be true in this scenario unless the player selected his/her own name. But since the value
	-- 	-- of the selection contains the correct bankOwnerName, we can ditch our initial assumption
	-- 	-- that bankOwner = player and use selection to overwrite bankOwner with the correct entity.
		
	-- 	bankOwner = Player(selection)

	-- 	if (bankOwner ~= nil) then
	-- 		StorageNpc.show_sub_menu(player, npc, bankOwner.name)
	-- 	end
	-- end,

	-- get_bankOwner = function(player, bankOwnerName)
	-- 	local bankOwner = Player(bankOwnerName)
		
	-- 	if (bankOwner == nil) then
	-- 		player:dialogSeq({"Transaction canceled. " .. bankOwnerName .. " has left the kingdom. Please try again later."})
	-- 	end

	-- 	return bankOwner
	-- end,

	-- show_sub_menu = function(player, npc, bankOwnerName)
	-- 	local bankOwner = StorageNpc.get_bankOwner(player, bankOwnerName)

	-- 	if (bankOwner == nil) then
	-- 		return
	-- 	end

	-- 	local opts = {}
	-- 	table.insert(opts, "Deposit Item")
	-- 	table.insert(opts, "Withdraw Item")

	-- 	local selection = player:menuString("Please select from the following options:", opts)
	-- 	StorageNpc.process_menu_selection(player, npc, selection, bankOwnerName)
	-- end,
}