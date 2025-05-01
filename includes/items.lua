local items_to_load = {	
	Deck = {
		'disc',
	},

	Consumable = {
		'planet_whirlpool',
		'planet_lost',
		
		'spec_stone',
		'spec_diary',
		'tarot_arrow',
	},

	Stand = {
		-- stardust crusaders
		'stardust_star',
		'stardust_tohth',
		'stardust_world',

		-- diamond is unbreakable
		'diamond_crazy',
		'diamond_hand',
		'diamond_echoes_1',
		'diamond_echoes_2',
		'diamond_echoes_3',
		'diamond_killer',
		'diamond_killer_btd',
		
		-- vento aureo
		'vento_gold',
		'vento_gold_requiem',
		'vento_moody',
		'vento_metallica',
		'vento_epitaph',
		'vento_epitaph_king',
		'vento_watchtower',

		-- stone ocean
		'stone_stone',
		'stone_marilyn',
		'stone_white',
		'stone_white_moon',
		'stone_white_heaven',

		-- steel ball run
		'steel_tusk_1',
		'steel_tusk_2',
		'steel_tusk_3',
		'steel_tusk_4',
		'steel_civil',
		'steel_d4c',
		'steel_d4c_love',

		-- jojolion
		'lion_soft',
		'lion_soft_beyond',
		'lion_paper',
		'lion_rock',
		'lion_wonder',

		-- jojolands
		'lands_november',
		'lands_smooth',
		'lands_bigmouth',
	},

	Voucher = {
		'foo',
		'plant',
	},

	Tag = {
		'spirit'
	}
}

-- stand pool
if not SMODS.ObjectTypes['csau_StandPool'] then
	SMODS.ObjectType {
		default = 'c_csau_stardust_star',
		key = 'csau_StandPool',
		prefix_config = false,
	}
end

-- evolved stand pool
if not SMODS.ObjectTypes['csau_EvolvedPool'] then
	SMODS.ObjectType {
		default = 'c_csau_stardust_star',
		key = 'csau_EvolvedPool',
		prefix_config = false,
	}
end

if not SMODS.Rarities['csau_StandRarity'] then
	SMODS.Rarity {
		key = 'csau_StandRarity',
		default_weight = 1,
		no_mod_badges = true,
		prefix_config = false,
		badge_colour = 'FFFFFF'
	}
end

if not SMODS.Rarities['csau_EvolvedRarity'] then
	SMODS.Rarity {
		key = 'csau_EvolvedRarity',
		default_weight = 0,
		no_mod_badges = true,
		prefix_config = false,
		badge_colour = 'FFFFFF',
		get_weight = function(self, weight, object_type)
			return G.GAME.used_vouchers.v_stand_plant and 0.12 or 0
		end
	}
end


-- Stand Consumable
if not SMODS.UndiscoveredSprites['csau_Stand'] then
	SMODS.Atlas({ key = 'csau_undiscovered', path = "undiscovered.png", px = 71, py = 95, prefix_config = false })
	SMODS.UndiscoveredSprite {
		key = "csau_Stand",
		prefix_config = false,
		atlas = "csau_undiscovered",
		pos = { x = 0, y = 0 },
		overlay_pos = { x = 1, y = 0 }
	}
end

if not SMODS.ConsumableTypes['csau_Stand'] then
	SMODS.Atlas({ key = 'csau_stickers', path = "stickers.png", px = 71, py = 95, prefix_config = false })
	SMODS.ConsumableType {
		key = 'csau_Stand',
		primary_colour = G.C.STAND,
		secondary_colour = G.C.STAND,
		collection_rows = { 8, 8 },
		shop_rate = 0,
		default = "c_csau_diamond_star",
		prefix_config = false,
		rarities = {
			{key = 'csau_StandRarity'},
			{key = 'csau_EvolvedRarity'},
		},
		inject_card = function(self, center)
			if center.set ~= self.key then SMODS.insert_pool(G.P_CENTER_POOLS[self.key], center) end
			local pool_key = center.config.evolved and 'csau_EvolvedPool' or 'csau_StandPool'
			SMODS.insert_pool(G.P_CENTER_POOLS[pool_key], center)
			if center.rarity and self.rarity_pools[center.rarity] then
				SMODS.insert_pool(self.rarity_pools[center.rarity], center)
			end
		end,
		delete_card = function(self, center)
			if center.set ~= self.key then SMODS.remove_pool(G.P_CENTER_POOLS[self.key], center.key) end
			local pool_key = center.config.evolved and 'csau_EvolvedPool' or 'csau_StandPool'
			SMODS.remove_pool(G.P_CENTER_POOLS[pool_key], center)
			if center.rarity and self.rarity_pools[center.rarity] then
				SMODS.remove_pool(self.rarity_pools[center.rarity], center.key)
			end
		end,
	}
end

for k, v in pairs(items_to_load) do
	if next(items_to_load[k]) and stand_enabled['enable'..k..'s'] then
		for i = 1, #v do
			StandLoadStandItem(v[i], k)
		end
	end
end

