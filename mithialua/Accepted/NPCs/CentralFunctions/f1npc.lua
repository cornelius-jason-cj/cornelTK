local caveMappings = {
	fieldCaves = {
		{"explore_rat_cave", "Rat Cave"},
		{"explore_bat_cave", "Bat Cave"},
		{"explore_snake_cave", "Snake Cave"},
		{"explore_bear_cave", "Bear Cave"},
		{"explore_tiger_cave", "Tiger Cave"},
		{"explore_fox_cave", "Fox Cave"},
		{"explore_scorpion_cave", "Scorpion Cave"},
		{"explore_lobster_cave", "Lobster Cave"},
		{"explore_ghost_cave", "Ghost Cave"},
		{"explore_haunted_house", "Haunted House"}
	},
	shadowedCrypts = {
		{"explore_dark_crypt", "Dark Crypt"},
		{"explore_vio_crypt", "Vio Crypt"},
		{"explore_brown_den", "Brown Den"},
		{"explore_white_den", "White Den"},
		{"explore_skeleton_cave", "Skeleton Cave"}
	},
	mythicCaves = {
		{"explore_mythic_rabbit", "Rabbit"},
		{"explore_mythic_monkey", "Monkey"},
		{"explore_mythic_dog", "Dog"},
		{"explore_mythic_rooster", "Rooster"},
		{"explore_mythic_rat", "Rat"},
		{"explore_mythic_horse", "Horse"},
		{"explore_mythic_ox", "Ox"},
		{"explore_mythic_pig", "Pig"},
		{"explore_mythic_snake", "Snake"},
		{"explore_mythic_sheep", "Sheep"},
		{"explore_mythic_tiger", "Tiger"},
		{"explore_mythic_dragon", "Dragon"},
	}
}

local caveWarps = {
    fieldCaves = {
        ["Rat Cave"] = {map = 201, x = 1, y = 12, message = "Teleport to Rat Cave!"},
        ["Bat Cave"] = {map = 202, x = 17, y = 11, message = "Teleport to Bat Cave!"},
        ["Snake Cave"] = {map = 203, x = 3, y = 17, message = "Teleport to Snake Cave!"},
        ["Bear Cave"] = {map = 204, x = 20, y = 16, message = "Teleport to Bear Cave!"},
        ["Tiger Cave"] = {map = 205, x = 34, y = 14, message = "Teleport to Tiger Cave!"},
        ["Fox Cave"] = {map = 209, x = 3, y = 15, message = "Teleport to Fox Cave!"},
        ["Scorpion Cave"] = {map = 210, x = 14, y = 14, message = "Teleport to Scorpion Cave!"},
        ["Lobster Cave"] = {map = 211, x = 2, y = 4, message = "Teleport to Lobster Cave!"},
        ["Ghost Cave"] = {map = 206, x = 38, y = 28, message = "Teleport to Ghost Cave!"},
        ["Haunted House"] = {map = 207, x = 8, y = 10, message = "Teleport to Haunted House!"}
    },
    shadowedCrypts = {
        ["Dark Crypt"] = {map = 320, x = 20, y = 35, message = "Teleport to Dark Crypt!"},
        ["Vio Crypt"] = {map = 323, x = 20, y = 3, message = "Teleport to Vio Crypt!"},
        ["Brown Den"] = {map = 326, x = 3, y = 16, message = "Teleport to Brown Den!"},
        ["White Den"] = {map = 332, x = 6, y = 6, message = "Teleport to White Den!"},
        ["Skeleton Cave"] = {map = 315, x = 47, y = 6, message = "Teleport to Skeleton Cave!"}
    },
    mythicCaves = {
        ["Rabbit"] = {map = 338, x = 18, y = 3, message = "Teleport to Mythic Rabbit!"},
        ["Monkey"] = {map = 346, x = 1, y = 4, message = "Teleport to Mythic Monkey!"},
        ["Dog"] = {map = 356, x = 12, y = 28, message = "Teleport to Mythic Dog!"},
        ["Rooster"] = {map = 374, x = 14, y = 3, message = "Teleport to Mythic Rooster!"},
        ["Rat"] = {map = 366, x = 11, y = 28, message = "Teleport to Mythic Rat!"},
        ["Horse"] = {map = 383, x = 6, y = 8, message = "Teleport to Mythic Horse!"},
        ["Ox"] = {map = 392, x = 4, y = 9, message = "Teleport to Mythic Ox!"},
        ["Pig"] = {map = 403, x = 13, y = 10, message = "Teleport to Mythic Pig!"},
        ["Snake"] = {map = 413, x = 10, y = 13, message = "Teleport to Mythic Snake!"},
        ["Sheep"] = {map = 422, x = 7, y = 7, message = "Teleport to Mythic Sheep!"},
        ["Tiger"] = {map = 437, x = 22, y = 20, message = "Teleport to Mythic Tiger!"},
        ["Dragon"] = {map = 447, x = 1, y = 12, message = "Teleport to Mythic Tiger!"},
    }
}

F1Npc = {
	click = async(function(player, npc)
		local t = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}
		player.npcGraphic = t.graphic
		player.npcColor = t.color
		player.lastClick = npc.ID
		player.dialogType = 0

		local opts = {}

		local string = "Hello " .. player.name .. "! How can I help you today?"

		if player.gmLevel >= 99 then
			table.insert(opts, "GM Menu")
			string = string .. "\n\nMap ID: " .. player.m .. " X: " .. player.x .. " Y: " .. player.y
		end

		table.insert(opts, "Silver Thread")
		table.insert(opts, "My Karma")
		table.insert(opts, "Toggles")
		-- table.insert(opts, "Storage")
		-- table.insert(opts, "Teleport")

		if (player.level == 99 and player.karma > 0.38867) then
			table.insert(opts, "Convert Exp")
		end

		local choice = player:menuString(string, opts, {})

		if choice == "Silver Thread" then
			if player.state ~= 1 then
				player:dialogSeq(
					{
						t,
						"This is for the dead of the land to find a path to the shaman. You are not dead, so you have no path with me."
					},
					0
				)
				return
			end
			player:returnFunc()
			player.state = 0
			player.health = player.maxHealth
			player.magic = player.maxMagic
			player:sendStatus()
			player:updateState()
			player:menuString(
				"So shall it be! Keep yourself safe, and free from harm.",
				{},
				{}
			)
			return
		elseif choice == "GM Menu" then
			menu = player:menuString(
				"<b>[GM Menu]\n\nWhat would you like to do?",
				{
					"God Tools",
					"Private Tools",
					"Minigame Powers",
					"System Broadcast",
					"Wisdom Star Tools"
				}
			)
			if menu == "God Tools" then
				god_tools.f1click(player, npc)
			elseif menu == "Private Tools" then
				private_tools.click(player, npc)
			elseif menu == "Minigame Powers" then
				minigame_powers.f1click(player, npc)
			elseif menu == "System Broadcast" then
				local input = player:input("Enter what you want to broadcast")
				gmbroadcast(-1, "[Cornel]: " .. input)
			elseif menu == "Wisdom Star Tools" then
				local subChoices = {
					"Extend Wisdom Star",
					"Set Minutes Remaining",
					"Set Multiplier",
					"Set Total Points"
				}

				local subChoice = player:menuString("Select option", subChoices)
				if subChoice == "Extend Wisdom Star" then
					local minutes = player:inputNumberCheck(player:input("How many minutes would you like to extend by?"))

					local seconds = minutes * 60

					core.gameRegistry["wisdom_star_timer"] = core.gameRegistry[
						"wisdom_star_timer"
					] + seconds

					broadcast(
						-1,
						"Praise the Gods! GM " .. player.name .. " has manually extended Wisdom star by " .. minutes .. " minutes."
					)
				elseif subChoice == "Set Minutes Remaining" then
					local minutes = player:inputNumberCheck(player:input("How many minutes would you like to set?"))
					local seconds = minutes * 60

					core.gameRegistry["wisdom_star_timer"] = os.time() + seconds

					player:dialogSeq({t, "It is done."}, 0)
				elseif subChoice == "Set Multiplier" then
					local multiplier = player:input("What do you want to set the multiplier to (do not enter x)?")

					if tonumber(multiplier) < 1 then
						return
					end

					setWisdomStarMultiplier(multiplier)

					broadcast(
						-1,
						"Praise the Gods! GM " .. player.name .. " has set the Wisdom Star multiplier to " .. multiplier .. "x!"
					)
				elseif subChoice == "Set Total Points" then
					local points = player:input("What do you want to set the daily wisdom star points to?")

					if tonumber(points) < 0 then
						return
					end

					setKanDonationPoints(points)
				end
			end
		elseif choice == "Toggles" then
			local s = "buffer"
			while s ~= "nothing" do
				local menuChoice = player:menuString(
					"Choose a list of toggles you would like to change.",
					-- {"Chat Toggles", "Misc Toggles"},
					{"Misc Toggles"},
					{}
				)

				if menuChoice == "Chat Toggles" then
					local chats = {"Clan Chat", "SubPath Chat"}
					local currentStatus = {player.clanChat, player.subpathChat}
					local chatsS = {}

					for i = 1, #chats do
						status = ""
						if currentStatus[i] == 0 then
							status = "Off"
						elseif currentStatus[i] == 1 then
							status = "On"
						end

						table.insert(chatsS, chats[i] .. ": " .. status)
					end

					local choice = player:menuSeq(
						"Please select a toggle to turn it on and off.",
						chatsS,
						{}
					)

					if choice == 1 then
						if currentStatus[choice] == 0 then
							player.clanChat = 1
							player:sendMinitext("Clan Chat: ON")
						end
						if currentStatus[choice] == 1 then
							player.clanChat = 0
							player:sendMinitext("Clan Chat: OFF")
						end
					elseif choice == 2 then
						if currentStatus[choice] == 0 then
							player.subpathChat = 1
							player:sendMinitext("Subpath Chat: ON")
						end
						if currentStatus[choice] == 1 then
							player.subpathChat = 0
							player:sendMinitext("Subpath Chat: OFF")
						end
					end
				elseif menuChoice == "Misc Toggles" then
					-- local toggles = {"See Warps", "Disable Experience Gain"}
					local toggles = {"See Warps"}
					local currentStatus = {
						player.registry["see_warps"],
						player.registry["disableExperienceGain"]
					}
					local toggleS = {}
					local status

					for i = 1, #toggles do
						status = ""
						if currentStatus[i] == 0 then
							status = "Off"
						elseif currentStatus[i] == 1 then
							status = "On"
						end

						table.insert(toggleS, toggles[i] .. ": " .. status)
					end

					local toggleChoice = player:menuSeq(
						"Please select a toggle to turn it on and off.",
						toggleS,
						{}
					)

					if toggleChoice == 1 then
						if currentStatus[toggleChoice] == 0 then
							player.registry["see_warps"] = 1
							player:sendMinitext("See Warps: ON")
						end

						if currentStatus[toggleChoice] == 1 then
							player.registry["see_warps"] = 0
							player:sendMinitext("See Warps: OFF")
						end
					elseif toggleChoice == 2 then
						if currentStatus[toggleChoice] == 0 then
							player.registry["disableExperienceGain"] = 1
							player:sendMinitext("Disable Exp Gain: ON")
						end

						if currentStatus[toggleChoice] == 1 then
							player.registry["disableExperienceGain"] = 0
							player:sendMinitext("Disable Exp Gain: OFF")
						end
					end
				end
			end
		elseif choice == "Teleport" then
			if player:hasAether("teleport_cave") then
                player:sendMinitext("Please wait aethers to settle. ")
                return
            end
			local opts = {"Field Caves", "Shadowed Crypts", "Mythic Caves"}

			-- Initialize the groups
			local fieldCaves = {}
			local shadowedCrypts = {}
			local mythicCaves = {}
			-- Function to populate caves based on legends
			local function populateCaves(caveGroup, mappings, destination)
				for _, cave in ipairs(mappings[caveGroup]) do
					local legendKey, caveName = cave[1], cave[2]
					if player:hasLegend(legendKey) then
						table.insert(destination, caveName)
					end
				end
			end


			
			local function teleportToCave(group, caveList)
				local selectedCave = player:menuString("Which cave?", caveList)
				local caveData = caveWarps[group][selectedCave]
				local durations = 16000
				if caveData then
					player:warp(caveData.map, caveData.x, caveData.y)
					player:setAether("teleport_cave", durations)
					player:dialogSeq({t, caveData.message}, 0)
				else
					player:dialogSeq({t, "Invalid selection."}, 0)
				end
			end

			local groupCave = player:menuString(
				"Where do you want to go?",
				opts
			)
			if groupCave == "Field Caves" then
				populateCaves("fieldCaves", caveMappings, fieldCaves)
				teleportToCave("fieldCaves", fieldCaves)
			elseif groupCave == "Shadowed Crypts" then
				populateCaves("shadowedCrypts", caveMappings, shadowedCrypts)
				teleportToCave("shadowedCrypts", shadowedCrypts)
			elseif groupCave == "Mythic Caves" then
				populateCaves("mythicCaves", caveMappings, mythicCaves)
				teleportToCave("mythicCaves", mythicCaves)
			end

		elseif choice == "Storage" then
			local name = "<b>["..npc.name.."]\n\n"
			local t = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
			player.npcGraphic = t.graphic
			player.npcColor = t.color
			player.dialogType = 0
			
			local menu
			local maxBankSlots = player.maxSlots
			bank.lock_bank(player, player)
			menu = player:menuString(
				name.."STORAGE: How can I help you?",
				{"Deposit item", "Withdraw item", "Exit"}
			)
			if menu == "Deposit item" then
				player:showBankDeposit(npc, player.name)
			elseif menu == "Withdraw item" then	
				player:showBankWithdraw(npc, player.name)
			end
		elseif choice == "Convert Exp" then
			ExpSellerNpc.showShadowMainMenu(player, npc)
    elseif choice == "My Karma" then
      local info = KarmaSystem.getKarmaProgress(player)
      player:dialogSeq({
        t,
        "Current Karma: " .. string.format("%.5f", player.karma) ..
        "\n\nNext Title: " .. info.nextTitle ..
        "\nNeed: " .. string.format("%.5f", info.needed) .. " karma"
      }, 0)
		end
	end),

	-- level5popupDialog = function(player)
	-- 	local t = {graphic = convertGraphic(3, "monster"), color = 3}
	-- 	player.npcGraphic = t.graphic
	-- 	player.npcColor = t.color
	-- 	player.dialogType = 0

	-- 	local m = 0
	-- 	local x = 8
	-- 	local y = 7

	-- 	if (player.state == 1) then
	-- 		player:dialogSeq(
	-- 			{
	-- 				t,
	-- 				"You cannot travel anywhere because you are not alive. Please visit a Shaman first."
	-- 			},
	-- 			1
	-- 		)
	-- 	end
	-- 	local guilds = {
	-- 		"Warrior's Guild",
	-- 		"Rogue's Guild",
	-- 		"Mage's Guild",
	-- 		"Poet's Guild"
	-- 	}

	-- 	player:dialogSeq(
	-- 		{
	-- 			t,
	-- 			"Congratulations! You are young but your insight grows every day. Now you must choose a path to continue on your journey."
	-- 		},
	-- 		1
	-- 	)

	-- 	local choice = player:menuSeq(
	-- 		"Please select a guild that you'd like to visit.",
	-- 		guilds,
	-- 		{}
	-- 	)

	-- 	if choice == 1 then
	-- 		-- warriors guild
	-- 		if player.country == 1 then
	-- 			-- Koguryo
	-- 			m = 11
	-- 		elseif player.country == 2 then
	-- 			-- Buya
	-- 			m = 341
	-- 		end
	-- 	elseif choice == 2 then
	-- 		-- rogues guild
	-- 		if player.country == 1 then
	-- 			m = 15
	-- 		elseif player.country == 2 then
	-- 			m = 343
	-- 		end
	-- 	elseif choice == 3 then
	-- 		-- mages guild
	-- 		if player.country == 1 then
	-- 			m = 13
	-- 		elseif player.country == 2 then
	-- 			m = 342
	-- 		end
	-- 	elseif choice == 4 then
	-- 		-- poet's guild
	-- 		if player.country == 1 then
	-- 			m = 17
	-- 		elseif player.country == 2 then
	-- 			m = 344
	-- 		end
	-- 	end

	-- 	if choice ~= nil then
	-- 		player:warp(m, x, y)
	-- 	end
	-- end
}