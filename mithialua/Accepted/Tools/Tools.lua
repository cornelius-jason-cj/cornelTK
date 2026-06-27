
Tools = {
	-- ----------------------------------------------------------------------
	-- Prevents a player from talking to an NPC if his/her karma is too low.
	-- Note: This will end the entire call stack when triggered.
	-- ----------------------------------------------------------------------
	checkKarma = function(player)
		if player.karma <= -3 then
			player:dialogSeq({"Go away scum!"}, 0) -- @TODO: Have to rework this if you ever fix the fact that the 0 arg ends the entire call stack
			return
		end
	end,

	-- ------------------------------------------------------------------------------------
	-- Helper method for configuring the appearance of dialog boxes when talking to an NPC
	-- ------------------------------------------------------------------------------------
	configureDialog = function(player, npc, dialogType, lastClickNpcId)
		if (not dialogType) then
			dialogType = 0
		end

		if (not lastClickNpcId) then
			lastClickNpcId = npc.ID
		end

		local stateTable = {
			graphic = convertGraphic(npc.look, "monster"),
			color = npc.lookColor
		}

		player.npcGraphic = stateTable.graphic
		player.npcColor = stateTable.color
		player.dialogType = 0
		player.lastClick = npc.ID

		return stateTable
	end,

	-- -------------------------------------------------------------------------------------------
	-- Causes the player to speak the name and location of every object on the current map.
	-- This does not appear to be in use anywhere, but it should be reworked to be a GM function.
	-- -------------------------------------------------------------------------------------------
	findObjectsInMap = function(player)
		local block = player:getObjectsInSameMap(BL_ALL)

		for z = 1, #block do
			player:talkSelf(0, block[z].name .. " " .. block[z].x .. " " .. block[z].y)
		end
	end,

	-- ---------------------------------------
	-- Returns a number formatted with commas
	-- ---------------------------------------
	formatNumber = function(value)
		local formattedValue = value
		local count

		while true do
			formattedValue, count = string.gsub(formattedValue, "^(-?%d+)(%d%d%d)", '%1,%2')

			if (count == 0) then
				break
			end
		end

		return formattedValue
	end,

	-- ------------------------------------------------------------------
	-- Returns true if a value is in between the values of the lower and
	-- upper bound parameters. Comparisons are inclusive.
	-- ------------------------------------------------------------------
	isBetween = function(value, lowerBound, upperBound)
		return value >= lowerBound and value <= upperBound
	end,

	-- ----------------------------------------------------------
	-- Rounds a number to the specified number of decimal places
	-- ----------------------------------------------------------
	round = function(value, numberOfDecimalPlaces)
		local mult = 10 ^ (numberOfDecimalPlaces or 0)
		return math.floor(value * mult + 0.5) / mult
	end,

	-- ------------------------------------------------------------------------------------------------
	-- Returns an arrary of values from a string delimited by commas, semicolons, pipes, and/or spaces
	-- ------------------------------------------------------------------------------------------------
	split = function(delimitedString)
		local values = {}

		for match in string.gmatch(delimitedString, '([^,;|%s]+)') do
			table.insert(values, match)
		end

		return values
	end,

	-- ---------------------------------------------------
	-- Returns true if a table contains the specified key
	-- ---------------------------------------------------
	tableContainsKey = function(table, key)
		return table[key] ~= nil
	end,

	-- -----------------------------------------------------
	-- Returns true if a table contains the specified value
	-- -----------------------------------------------------
	tableContainsValue = function(table, value)
		for _, v in pairs(table) do
			if (v == value) then
				return true
			end
		end

		return false
	end,

    -- --------------------------------------------------------------------
    -- This function is executed whenever a GM speaks "/testlua" or "/tl".
    -- --------------------------------------------------------------------
	testLua = function(player)
		print(player.name)
		local name = 'cornel'
		local target = Player(name)
    target.baseGrace = 68
    target.registry["status_points"] = 0
    target:calcStat()
    target:sendStatus()
    -- target.registry["rogue_build"] = 0

    
    -- target:removeSpell("assasinate_1")
    -- target:removeSpell("critical_focus_1")
    -- target:removeSpell("death_mark_1")

    -- target:removeSpell("deadly_toxin_1")
    -- target:removeSpell("toxic_cloud_1")
    -- target:removeSpell("venom_blade_1")

    -- target:removeSpell("eclipse_1")
    -- target:removeSpell("phantom_strike_1")
    -- target:removeSpell("shadow_form_1")

    -- target:removeSpell("explosive_trap_1")
    -- target:removeSpell("poison_trap_1")
    -- target:removeSpell("spike_trap_1")

    -- target:addLegend(
    --   "Karma Baby",
    --   "karma_baby",
    --   130,
    --   61
    -- )
		-- target.karma = target.karma + 10
		-- print(target.karma)
		-- target.karma = target.karma + 120
		-- target.registry['killing_quest_mythic_rabbit'] = 0
		-- target.registry['killing_quest_mythic_monkey'] = 0
		-- target.registry['killing_quest_mythic_dog'] = 0
		-- target.registry['killing_quest_mythic_rooster'] = 0
		-- target.registry['killing_quest_mythic_rat'] = 0
		-- target.registry['killing_quest_mythic_horse'] = 0
		-- target.registry['killing_quest_mythic_ox'] = 0
		-- target.registry['killing_quest_mythic_pig'] = 0
		-- target.registry['killing_quest_mythic_snake'] = 0
		-- target.registry['killing_quest_mythic_sheep'] = 0
		-- target.registry['killing_quest_mythic_tiger'] = 0
		-- target.registry['killing_quest_mythic_dragon'] = 0
		

		-- local questName = "killing_quest_mythic_rabbit"
        -- local registryName = "hunting_quest_mythic_rabbit"
        -- local legendName = "Mythic Rabbit"
		-- local newTotalHunting = 20

		-- if (target:hasLegend(registryName)) then
		-- 	target:removeLegendbyName(registryName)
		-- end
		-- target:removeLegendbyName('guru_hunting_quest')
		
		-- target.registry[registryName] = newTotalHunting

		-- target:addLegend(
		-- 	"Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
		-- 	registryName,
		-- 	3,
		-- 	128
		-- )

		-- target:forceSave()
		-- target.karma = target.karma + 200

        -- local registryName = "help_finding_bugs"
		-- local total = 5
		-- local legendName = "Mythic Dragon"

		-- if (target:hasLegend(registryName)) then
		-- 	target:removeLegendbyName(registryName)
		-- end
		
		-- target.registry[registryName] = total

		-- target:addLegend(
		-- 	"Conqueror " .. legendName .. " " .. newTotalHunting .. " times",
		-- 	registryName,
		-- 	3,
		-- 	128
		-- )
		
		-- target:addLegend(
		-- 	"Help GM find bugs " .. total .. " times",
		-- 	registryName,
		-- 	3,
		-- 	128
		-- )
        -- target:forceSave()
		
		-- broadcast(
		-- 	-1,
		-- 	"[CONGRATULATIONS] " .. player.name .. " has successfully crafted a Star Armor!"
		-- )
		-- target.rage = 1
		-- local will = player.baseWill

		-- target.baseWill = 130
		-- target.baseWill = 130

		-- print('will', will)
		-- local invis = target.invis
		
		-- player.registry["second_assignment"] = 1
		-- player.registry["third_assignment"] = 1
		-- 103
		-- player.bgm = 158
		-- print(player.bgm)
		-- target:removeSpell("res_poet")
		-- target:removeSpell("warrior_endure")
		-- print(invis)
		-- target:flushDuration()
		-- before
		-- target.baseHealth = 300000
		-- target.baseMagic = 100000
		
		-- target.class = 2
		-- target.baseHealth = 2000000
		-- target.baseMagic = 1000000
		-- target:killCount(58)
		-- target:flushAether()
		-- target:flushDuration()
		-- target:calcStat()
		-- target:sendStatus()
		-- target:addItem(85266, 1)
		-- target:removeItem("white_bunny_mount", 1)
		-- target:removeItem("festive_dragon_mount", 1)
		-- res
		-- target.state = 0
		-- target.health = target.maxHealth
		-- target.magic = target.maxMagic
		-- target:sendStatus()
		-- target:updateState()

		-- for i = 1, 244 do
		-- 	target:addLegend(
		-- 		"icon " .. i,
		-- 		"icon_" .. i,
		-- 		i,
		-- 		i
		-- 	)
		-- end
		-- if player:hasLegend("born") then
		-- 	target:sendMinitext('ada born')
		-- end
		-- if not player:hasLegend("born") then
		-- 	target:sendMinitext('tidak ada born')
		-- end
		-- target:giveXP()
		-- target:updatePath(0, 0)
		-- player:calcStat()
		-- player:sendStatus()
		-- target.baseHealth = 700
		-- target.baseMagic = 600
		-- target:calcStat()
		-- target:sendStatus()
		-- target:addItem('2001', 1)
		-- target:addItem('bear_fur', 50)
		-- target:addItem('acorn', 60)
		-- target:addItem('rabbit_meat', 60)
		-- target:addItem('gold_acorn', 60)
		-- target:addItem('antler', 30)
		-- target:addItem('summer_mantle', 1)
		-- target:removeItem('white_cloud_mount', 1)
		-- target:removeItem('summer_blouse', 1)
		-- target:addItem(2001, 1)
		-- target:removeItem(2001, 1)
		-- target:addItem('acorn', 60)
		-- broadcast(
		-- 	-1,
		-- 	"[CORNEL]: Guys gw off dlu yak anak nangis, besok gw lanjut bikin quest lg"
		-- )
    end
}
