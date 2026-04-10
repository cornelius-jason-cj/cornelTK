-- -------------------------------------------------
-- Note: Actual amount of each drop is a randomly
-- selected number between 1 and the stated amount.
-- -------------------------------------------------
local _mobDropsTable = {
	--------------
	["rabbit"] = {
		loot = {
			items = {"rabbit_meat"},
			amounts = {1},
			rates = {80}
		}
	},
	["squirrel"] = {
		loot = {
			items = {"acorn", "gold_acorn"},
			amounts = {1, 1},
			rates = {75, 25}
		}
	},
	["deer"] = {
		loot = {
			items = {"antler"},
			amounts = {1},
			rates = {50}
		}
	},
	["doe"] = {
		loot = {
			items = {"antler"},
			amounts = {1},
			rates = {50}
		}
	},
	--------------
	["mouse"] = {
		loot = {
			items = {"rat_meat"},
			amounts = {1},
			rates = {50}
		}
	},
	["rat"] = {
		loot = {
			items = {"rat_meat"},
			amounts = {1},
			rates = {50}
		}
	},
	["white_rat"] = {
		loot = {
			items = {"mica"},
			amounts = {1},
			rates = {35}
		}
	},
	["big_rat"] = {
		loot = {
			items = {"mica"},
			amounts = {1},
			rates = {50}
		}
	},
	--------------
	["black_bat"] = {
		loot = {
			items = {"ginseng_piece"},
			amounts = {1},
			rates = {35}
		}
	},
	["blue_bat"] = {
		loot = {
			items = {"ginseng_piece"},
			amounts = {1},
			rates = {35}
		}
	},
	["red_bat"] = {
		loot = {
			items = {"ginseng"},
			amounts = {1},
			rates = {35}
		}
	},
	["white_bat"] = {
		loot = {
			items = {"ginseng"},
			amounts = {1},
			rates = {35}
		}
	},
	--------------
	["snake"] = {
		loot = {
			items = {"snake_meat"},
			amounts = {1},
			rates = {35}
		}
	},
	["white_snake"] = {
		loot = {
			items = {"snake_meat"},
			amounts = {1},
			rates = {35}
		}
	},
	["mud_snake"] = {
		loot = {
			items = {"fine_snake_meat"},
			amounts = {1},
			rates = {35}
		}
	},
	["earth_snake"] = {
		loot = {
			items = {"fine_snake_meat"},
			amounts = {1},
			rates = {35}
		}
	},
	--------------
	["brown_bear"] = {
		loot = {
			items = {"bear_fur"},
			amounts = {1},
			rates = {15}
		}
	},
	["black_bear"] = {
		loot = {
			items = {"bears_liver"},
			amounts = {1},
			rates = {35}
		}
	},
	["purple_bear"] = {
		loot = {
			items = {"bear_fur"},
			amounts = {1},
			rates = {15}
		}
	},
	--------------	
	["brown_tiger"] = {
		loot = {
			items = {"tiger_pelt"},
			amounts = {1},
			rates = {35}
		}
	},
	["black_tiger"] = {
		loot = {
			items = {"tigers_heart"},
			amounts = {1},
			rates = {35}
		}
	},
	["purple_tiger"] = {
		loot = {
			items = {"tiger_pelt"},
			amounts = {1},
			rates = {35}
		}
	},
	["red_tiger"] = {
		loot = {
			items = {"tiger_pelt"},
			amounts = {1},
			rates = {35}
		}
	},
	["blue_tiger"] = {
		loot = {
			items = {"tigers_heart"},
			amounts = {1},
			rates = {35}
		}
	},
	--------------
	["dark_fox"] = {
		loot = {
			items = {"fox_fur"},
			amounts = {1},
			rates = {35}
		}
	},
	["blood_fox"] = {
		loot = {
			items = {"red_fox_fur"},
			amounts = {1},
			rates = {25}
		}
	},
	["lava_fox"] = {
		loot = {
			items = {"red_fox_fur"},
			amounts = {1},
			rates = {25}
		}
	},
	["sun_fox"] = {
		loot = {
			items = {"red_fox_fur"},
			amounts = {1},
			rates = {15}
		}
	},
	["nine_tailed_fox"] = {
		loot = {
			items = {"fox_tail"},
			amounts = {1},
			rates = {50}
		}
	},
	--------------
	["giant_scorpion"] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {35}
		}
	},
	["pale_scorpion"] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["vile_scorpion"] = {
		loot = {
			items = {"white_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	["radiant_scorpion"] = {
		loot = {
			items = {"yellow_amber"},
			amounts = {2},
			rates = {75}
		}
	},
	--------------
	["lobster"] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {35}
		}
	},
	["sand_lobster"] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["rock_lobster"] = {
		loot = {
			items = {"white_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	["golden_lobster"] = {
		loot = {
			items = {"yellow_amber"},
			amounts = {2},
			rates = {75}
		}
	},
	--------------
	["white_ghost"] = {
		loot = {
			items = {"ash"},
			amounts = {1},
			rates = {35}
		}
	},
	["black_ghost"] = {
		loot = {
			items = {"ash"},
			amounts = {1},
			rates = {35}
		}
	},
	["ghost_ha"] = {
		loot = {
			items = {"warrior_bone"},
			amounts = {1},
			rates = {25}
		}
	},
	["ghost_he"] = {
		loot = {
			items = {"rogue_bone"},
			amounts = {1},
			rates = {25}
		}
	},
	["ghost_hi"] = {
		loot = {
			items = {"mage_bone"},
			amounts = {1},
			rates = {25}
		}
	},
	["ghost_ho"] = {
		loot = {
			items = {"poet_bone"},
			amounts = {1},
			rates = {25}
		}
	},
	["ghost_hu"] = {
		loot = {
			items = {"poet_bone"},
			amounts = {1},
			rates = {25}
		}
	},
	----------------
	["white_skeleton"] = {
		loot = {
			items = {"ash"},
			amounts = {1},
			rates = {35}
		}
	},
	["black_skeleton"] = {
		loot = {
			items = {"ash"},
			amounts = {1},
			rates = {35}
		}
	},
	["skeleton_ja"] = {
		loot = {
			items = {"warrior_bone"},
			amounts = {1},
			rates = {25}
		}
	},
	["skeleton_je"] = {
		loot = {
			items = {"rogue_bone"},
			amounts = {1},
			rates = {25}
		}
	},
	["skeleton_ji"] = {
		loot = {
			items = {"mage_bone"},
			amounts = {1},
			rates = {25}
		}
	},
	["skeleton_jo"] = {
		loot = {
			items = {"poet_bone"},
			amounts = {1},
			rates = {25}
		}
	},
	["skeleton_ju"] = {
		loot = {
			items = {"poet_bone"},
			amounts = {1},
			rates = {25}
		}
	},
	----------------
	["giant_centipede"] = {
		loot = {
			items = {"mica"},
			amounts = {1},
			rates = {15}
		}
	},
	["mud_black"] = {
		loot = {
			items = {"ambrosia"},
			amounts = {1},
			rates = {5}
		}
	},
	["mud_white"] = {
		loot = {
			items = {"fragile_rose"},
			amounts = {1},
			rates = {5}
		}
	},
	----------------
	["large_centipede"] = {
		loot = {
			items = {"mica"},
			amounts = {1},
			rates = {25}
		}
	},
	["mud_brown"] = {
		loot = {
			items = {"lucky_coin"},
			amounts = {1},
			rates = {5}
		}
	},
	["mud_green"] = {
		loot = {
			items = {"scribes_pen"},
			amounts = {1},
			rates = {5}
		}
	},
	----------------
	["dark_blue_doe"] = {
		loot = {
			items = {"ore"},
			amounts = {1},
			rates = {10}
		}
	},
	["dark_green_doe"] = {
		loot = {
			items = {"ore"},
			amounts = {1},
			rates = {10}
		}
	},
	["dark_orange_doe"] = {
		loot = {
			items = {"ore"},
			amounts = {1},
			rates = {10}
		}
	},
	["dark_red_doe"] = {
		loot = {
			items = {"ore"},
			amounts = {1},
			rates = {10}
		}
	},
	["white_doe"] = {
		loot = {
			items = {"ore"},
			amounts = {1},
			rates = {10}
		}
	},
	["black_doe"] = {
		loot = {
			items = {"ore"},
			amounts = {1},
			rates = {10}
		}
	},
	----------------
	["northern_ogre"] = {
		loot = {
			items = {"metal"},
			amounts = {1},
			rates = {10}
		}
	},
	["frost_ogre"] = {
		loot = {
			items = {"metal"},
			amounts = {1},
			rates = {10}
		}
	},
	["ice_ogre"] = {
		loot = {
			items = {"metal"},
			amounts = {1},
			rates = {10}
		}
	},
	["citelam_ogre"] = {
		loot = {
			items = {"metal"},
			amounts = {1},
			rates = {10}
		}
	},
	["maletic_ogre"] = {
		loot = {
			items = {"metal"},
			amounts = {1},
			rates = {10}
		}
	},
	["ice_panther"] = {
		loot = {
			items = {"metal"},
			amounts = {1},
			rates = {10}
		}
	},
	----------------
	["deep_woods_mantis"] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {35}
		}
	},
	["giant_spider"] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {35}
		}
	},
	["dark_mantis"] = {
		loot = {
			items = {"tarnished_dark_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	["ghost_mantis"] = {
		loot = {
			items = {"tarnished_dark_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	["radiant_spider"] = {
		loot = {
			items = {"tarnished_white_amber"},
			amounts = {1},
			rates = {5}
		}
	},
	----------------
	["shadow_mantis"] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {35}
		}
	},
	["trapdoor_spider"] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {35}
		}
	},
	["dark_mantis"] = {
		loot = {
			items = {"tarnished_dark_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	["ghost_mantis"] = {
		loot = {
			items = {"tarnished_dark_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	["radiant_spider"] = {
		loot = {
			items = {"tarnished_white_amber"},
			amounts = {1},
			rates = {5}
		}
	},
	----------------
	["blue_rabbit"] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["green_rabbit"] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["orange_rabbit"] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["red_rabbit"] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["golden_rabbit"] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["magic_rabbit"] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["mad_rabbit"] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["rabbit_divine"] = {
		loot = {
			items = {"titanium_glove", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	["rabbit_sentry"] = {
		loot = {
			items = {"whisper_bracelet", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 1}
		}
	},
	["rabbit_guardian"] = {
		loot = {
			items = {"titanium_glove", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	["rabbit_witch"] = {
		loot = {
			items = {"whisper_bracelet", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 1}
		}
	},
	["rabbit_defender"] = {
		loot = {
			items = {"titanium_glove", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	["rabbit_spirit"] = {
		loot = {
			items = {"whisper_bracelet", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 1}
		}
	},
	["rabbit_avenger"] = {
		loot = {
			items = {"titanium_glove", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	----------------
	["simple_monkey"] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["quick_monkey"] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["agile_monkey"] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["bright_monkey"] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["fast_monkey"] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["spunky_monkey"] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["monsterous_monkey"] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["monkey_guardian"] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["monkey_diamond"] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["monkey_defender"] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	["monkey_witch"] = {
		loot = {
			items = {"sen_glove", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	["monkey_defender"] = {
		loot = {
			items = {"scribes_book", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	["monkey_spirit"] = {
		loot = {
			items = {"sen_glove", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	["monkey_avenger"] = {
		loot = {
			items = {"scribes_book", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	----------------
	['dog_trooper'] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	['crazed_mongrel'] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	['spunky_dog'] = {
		loot = {
			items = {"amber"},
			amounts = {1},
			rates = {25}
		}
	},
	['death_mongrel'] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	['guardian_dog'] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	['divine_dog'] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	['dog_cutthroat'] = {
		loot = {
			items = {"dark_amber"},
			amounts = {1},
			rates = {25}
		}
	},
	['spotted_mutt'] = {
		loot = {
			items = {"white_amber"},
			amounts = {1},
			rates = {10}
		}
	},
	['frothing_mutt'] = {
		loot = {
			items = {"white_amber"},
			amounts = {1},
			rates = {10}
		}
	},
	['killer_mongrel'] = {
		loot = {
			items = {"white_amber"},
			amounts = {1},
			rates = {10}
		}
	},
	['wolf_kin'] = {
		loot = {
			items = {"chung_ryong_key", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	['defender_dog'] = {
		loot = {
			items = {"baekho_key", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	['spirit_dog'] = {
		loot = {
			items = {"ju_jak_key", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	['avenger_dog'] = {
		loot = {
			items = {"hyun_moo_key", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	----------------
	['red_chick'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['fiery_chick'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['wild_chick'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['sunfeather'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['rooster_sentry'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['mythic_rooster'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['rooster_swordsman'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['rooster_guardian'] = {
		loot = {
			items = {"tarnished_amber", "dark_amber"},
			amounts = {1, 1},
			rates = {10, 5}
		}
	},
	['divine_rooster'] = {
		loot = {
			items = {"tarnished_amber", "dark_amber"},
			amounts = {1, 1},
			rates = {10, 5}
		}
	},
	['rooster_barbarian'] = {
		loot = {
			items = {"chung_ryong_key", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	['rooster_defender'] = {
		loot = {
			items = {"baekho_key", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	['spirit_rooster'] = {
		loot = {
			items = {"ju_jak_key", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	['rooster_avenger'] = {
		loot = {
			items = {"hyun_moo_key", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	
	----------------
	['mud_rat'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['hunter_rat'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['earth_rat'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['lava_rat'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['fire_rat'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['beady_rat'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['spirit_mouse'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['rat_guardian'] = {
		loot = {
			items = {"tarnished_amber", "white_amber"},
			amounts = {1, 1},
			rates = {10, 5}
		}
	},
	['rat_defender'] = {
		loot = {
			items = {"tarnished_amber", "white_amber"},
			amounts = {1, 1},
			rates = {10, 5}
		}
	},
	['rat_mythic'] = {
		loot = {
			items = {"earth_key", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	['rat_mighty'] = {
		loot = {
			items = {"earth_key", "merchant_helm"},
			amounts = {1, 1},
			rates = {5, 5}
		}
	},
	['rat_divine'] = {
		loot = {
			items = {"earth_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['rat_lord'] = {
		loot = {
			items = {"earth_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['rat_spirit'] = {
		loot = {
			items = {"earth_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['rat_avenger'] = {
		loot = {
			items = {"earth_key"},
			amounts = {1},
			rates = {5}
		}
	},

	----------------
	['spirited_horse'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['diamond_horse'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['golden_horse'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['wooden_horse'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['lake_winny'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['fire_snorter'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['horse_guardian'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['horse_divine'] = {
		loot = {
			items = {"tarnished_amber", "yellow_amber"},
			amounts = {1, 1},
			rates = {10, 5}
		}
	},
	['horse_chongun'] = {
		loot = {
			items = {"tarnished_amber", "yellow_amber"},
			amounts = {1, 1},
			rates = {10, 5}
		}
	},
	['horse_swordsman'] = {
		loot = {
			items = {"fire_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['horse_hoves'] = {
		loot = {
			items = {"fire_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['horse_defender'] = {
		loot = {
			items = {"fire_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['horse_spirit'] = {
		loot = {
			items = {"fire_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['horse_avenger'] = {
		loot = {
			items = {"fire_key"},
			amounts = {1},
			rates = {5}
		}
	},


	------------------------
	['giant_bull'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['rampaging_bull'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['great_horns'] = {
		loot = {
			items = {"tarnished_amber", "yellow_amber"},
			amounts = {1, 1},
			rates = {10, 5}
		}
	},
	['pale_hunger'] = {
		loot = {
			items = {"tarnished_amber", "yellow_amber"},
			amounts = {1, 1},
			rates = {10, 5}
		}
	},
	['angry_ox'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['tough_fight'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['ox_guardian'] = {
		loot = {
			items = {"wind_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['ox_divine'] = {
		loot = {
			items = {"wind_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['ox_charger'] = {
		loot = {
			items = {"wind_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['ox_defender'] = {
		loot = {
			items = {"wind_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['ox_spirit'] = {
		loot = {
			items = {"wind_key"},
			amounts = {1},
			rates = {10}
		}
	},
	['ox_avenger'] = {
		loot = {
			items = {"wind_key"},
			amounts = {1},
			rates = {10}
		}
	},


	---------------------------------
	['stout_piglet'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['stout_pig'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['bold_piglet'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['bold_pig'] = {
		loot = {
			items = {"tarnished_amber", "yellow_amber"},
			amounts = {1, 1},
			rates = {10, 5}
		}
	},
	['obese_pig'] = {
		loot = {
			items = {"tarnished_amber", "yellow_amber"},
			amounts = {1, 1},
			rates = {10, 5}
		}
	},
	['bold_hog'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['stout_warthog'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['bold_boar'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['pig_guardian'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['pig_divine'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['pig_champion'] = {
		loot = {
			items = {"heaven_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['pig_defender'] = {
		loot = {
			items = {"heaven_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['pig_spirit'] = {
		loot = {
			items = {"heaven_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['pig_avenger'] = {
		loot = {
			items = {"heaven_key"},
			amounts = {1},
			rates = {5}
		}
	},


	------------------------------
	['simple_snake'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['glowing_snake'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['slitherly'] = {
		loot = {
			items = {"tarnished_amber"},
			amounts = {1},
			rates = {15}
		}
	},
	['meter_worm'] = {
		loot = {
			items = {"tarnished_amber", "yellow_amber"},
			amounts = {1, 1},
			rates = {10, 5}
		}
	},
	['lava_snake'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['dark_snake'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['spasm'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_white_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['storm_snake'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_white_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['snake_guardian'] = {
		loot = {
			items = {"pond_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['divine_snake'] = {
		loot = {
			items = {"pond_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['snake_mage'] = {
		loot = {
			items = {"pond_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['snake_defender'] = {
		loot = {
			items = {"pond_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['spirit_snake'] = {
		loot = {
			items = {"pond_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['snake_avenger'] = {
		loot = {
			items = {"pond_key"},
			amounts = {1},
			rates = {5}
		}
	},


	-----------------------------
	['black_sheep'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['red_sheep'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['flaming_sheep'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_white_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['dark_sheep'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_yellow_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['sheep_guardian'] = {
		loot = {
			items = {"thunder_key"},
			amounts = {1},
			rates = {10}
		}
	},
	['divine_sheep'] = {
		loot = {
			items = {"thunder_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['sheep_shepherd'] = {
		loot = {
			items = {"thunder_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['sheep_defender'] = {
		loot = {
			items = {"thunder_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['spirit_sheep'] = {
		loot = {
			items = {"thunder_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['sheep_avenger'] = {
		loot = {
			items = {"thunder_key"},
			amounts = {1},
			rates = {5}
		}
	},



	---------------------------------
	['raging_tiger'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['black_tiger'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['huge_tiger'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_white_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['crazy_claw'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_white_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['knap'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_yellow_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['brazen'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_yellow_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['divine_tiger'] = {
		loot = {
			items = {"water_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['tiger_slasher'] = {
		loot = {
			items = {"water_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['spirit_tiger'] = {
		loot = {
			items = {"water_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['tiger_avenger'] = {
		loot = {
			items = {"water_key"},
			amounts = {1},
			rates = {5}
		}
	},


	----------------
	['adolescent_dragon'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['mature_dragon'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['great_wyrm'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['mighty_wyrm'] = {
		loot = {
			items = {"tarnished_amber", "tarnished_dark_amber"},
			amounts = {1, 1},
			rates = {15, 10}
		}
	},
	['serpentine_dragon'] = {
		loot = {
			items = {"tarnished_white_amber"},
			amounts = {1},
			rates = {10}
		}
	},
	['dragon_guardian'] = {
		loot = {
			items = {"tarnished_white_amber"},
			amounts = {1},
			rates = {10}
		}
	},
	['old_dragon'] = {
		loot = {
			items = {"tarnished_white_amber"},
			amounts = {1},
			rates = {10}
		}
	},
	['dragon_defender'] = {
		loot = {
			items = {"tarnished_yellow_amber"},
			amounts = {1},
			rates = {10}
		}
	},
	['divine_dragon'] = {
		loot = {
			items = {"mountain_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['dragon_slayer'] = {
		loot = {
			items = {"mountain_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['spirit_dragon'] = {
		loot = {
			items = {"mountain_key"},
			amounts = {1},
			rates = {5}
		}
	},
	['dragon_avenger'] = {
		loot = {
			items = {"mountain_key"},
			amounts = {1},
			rates = {5}
		}
	},

}
-- ------------------------------
-- Common drops
-- ------------------------------
local _handleLoot = function(mob, loot, player)
	if (loot == nil) then
		return
	end

	local items = loot.items
	local amounts = loot.amounts
	local rates = loot.rates
	local karma = math.floor(player.karma / 20)

	if player.gmLevel == 50 then
		print('player karma', karma)
	end
	
	for i = 1, #items do
		local roll = math.random(1, 100000)

		if (amounts[i] > 0 and roll <= (rates[i] + karma) * 1000) then
			-- if (type(items[i]) == 'number') then
			-- 	-- Gold
			-- 	if (amounts[i] == 1) then
			-- 		mob:dropItem(0, amounts[i], 0, 0)
			-- 	elseif (amounts[i] >= 2 and amounts[i] <= 99) then
			-- 		mob:dropItem(1, amounts[i], 0, 0)
			-- 	elseif (amounts[i] >= 100 and amounts[i] <= 999) then
			-- 		mob:dropItem(2, amounts[i], 0, 0)
			-- 	elseif (amounts[i] >= 1000) then
			-- 		mob:dropItem(3, amounts[i], 0, 0)
			-- 	end
			-- else
				-- mob:dropItem(items[i], math.random(1, amounts[i]), 0, 0)
				mob:dropItem(items[i], 1, 0, 0)
			-- end

			characterLog.dropLog(mob, items, amounts)
		end
	end
end

-- ------------------------------
-- Rare drops
-- ------------------------------
local _handleRareLoot = function(mob, rareLoot)
	if (rareLoot == nil) then
		return
	end

	local items = rareLoot.items
	local rates = rareLoot.rates
	local droppedItems = {}

	for i = 1, #items do
		local roll = math.random(1, 100000)

		broadcast(4, "Mob: " .. mob.yname .. "; Roll: " .. roll)

		if (roll <= rates[i] * 1000) then
			table.insert(droppedItems, items[i])
		end
	end

	if (#droppedItems > 0) then
		local droppedItem = droppedItems[1]
		mob:dropItem(droppedItem, 1, 0, 0)
		characterLog.dropLog(mob, {droppedItem}, {1})
	end
end


-- ------------------------------
-- Mob drops handler
-- ------------------------------
HandleMobDrops = function(player, mob)
	if player.blType ~= BL_PC then
		return
	end

	local mobName = mob.yname

	if (Tools.tableContainsKey(_mobDropsTable, mobName)) then
		local loot = _mobDropsTable[mobName].loot
		_handleLoot(mob, loot, player)
	end
end
