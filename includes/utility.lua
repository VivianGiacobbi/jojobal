---------------------------
--------------------------- Loading/Debug Functions
---------------------------

-- Modified code from Cryptid
local function dynamic_badges(info)
	if not SMODS.config.no_mod_badges then
		local function calc_scale_fac(text)
			local size = 0.9
			local font = G.LANG.font
			local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
			local calced_text_width = 0
			-- Math reproduced from DynaText:update_text
			for _, c in utf8.chars(text) do
				local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
						+ 2.7 * 1 * G.TILESCALE * font.FONTSCALE
				calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
			end
			local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
			return scale_fac
		end
		local scale_fac = {}
		local min_scale_fac = 0.4

		local strings = {
			localize('ba_jojo'),
			info.part ~= 'jojo' and localize('ba_'..info.part) or nil
		}
		local badge_colour = info.part ~= 'jojo' and (SMODS.Gradients['jojobal_'..info.part] or HEX(G.arrow_badge_colours['co_'..info.part])) or G.C.STAND
		local text_colour = info.part ~= 'jojo' and HEX(G.arrow_badge_colours['te_'..info.part]) or G.C.WHITE

		for i = 1, #strings do
			scale_fac[i] = calc_scale_fac(strings[i])
			min_scale_fac = math.min(min_scale_fac, scale_fac[i])
		end
		local ct = {}
		for i = 1, #strings do
			ct[i] = {
				string = strings[i],
			}
		end
		return {
			n = G.UIT.R,
			config = { align = "cm" },
			nodes = {
				{
					n = G.UIT.R,
					config = {
						align = "cm",
						colour = badge_colour,
						r = 0.1,
						minw = 1 / min_scale_fac,
						minh = 0.36,
						emboss = 0.05,
						padding = 0.03 * 0.9,
					},
					nodes = {
						{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
						{
							n = G.UIT.O,
							config = {
								object = DynaText({
									string = ct or "ERROR",
									colours = { text_colour },
									silent = true,
									float = true,
									shadow = true,
									offset_y = -0.03,
									spacing = 1,
									scale = 0.33 * 0.9,
								}),
							},
						},
						{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
					},
				},
			},
		}
	end
end

--- Load an item definition using SMODS
--- @param file_key string file name to load within the "Items" directory, excluding file extension
--- @param item_type string SMODS item type (such as Joker, Consumable, Deck, etc)
function StandLoadStandItem(file_key, item_type)
	local key = string.lower(item_type)..'s'
	local info = assert(SMODS.load_file("items/" .. key .. "/" .. file_key .. ".lua"))()

	info.key = info.key or file_key
	local smods_item = item_type
	if item_type == 'Stand' then
		smods_item = 'Consumable'
		
		-- add universal set_consumable_usage() for stands
		local ref_add_to_deck = function(self, card, from_debuff) end
		if info.add_to_deck then
			ref_add_to_deck = info.add_to_deck
		end
		function info.add_to_deck(self, card, from_debuff)
			ref_add_to_deck(self, card, from_debuff)

			-- only set initially
			if not from_debuff then
				set_consumeable_usage(card)
			end
			
		end

		-- force no use for stands
		function info.can_use(self, card)
			return false
		end

		-- add universal update to evolved Stand badges
		if info.rarity == 'arrow_EvolvedRarity' then
			local ref_type_badge = function(self, card, badges) end
			if info.set_card_type_badge then
				ref_type_badge = info.set_card_type_badge
			end
			function info.set_card_type_badge(self, card, badges)
				badges[1] = create_badge(localize('k_evolved_stand'), get_type_colour(self or card.config, card), nil, 1.2)
				ref_type_badge(self, card)
			end
		end
	end

	if item_type == 'Deck' then smods_item = 'Back' end
	
	if item_type ~= 'Challenge' and item_type ~= 'Edition' then
		info.atlas = file_key
		info.pos = { x = 0, y = 0 }
		if info.hasSoul then
			info.pos = { x = 1, y = 0 }
			info.soul_pos = { x = 2, y = 0 }
		end
	end

	if not info.no_mod_badges and info.part then
		info.no_mod_badges = true
		local sb_ref = function(self, card, badges) end
		if info.set_badges then
			sb_ref = info.set_badges
		end
		info.set_badges = function(self, card, badges)
			sb_ref(self, card, badges)
			if card.area and card.area == G.jokers or card.config.center.discovered then
				badges[#badges+1] = dynamic_badges(info)
			end
		end
	end

	if item_type == 'Blind' and info.color then
		info.boss_colour = info.color
		info.color = nil
	end

	local new_item = SMODS[smods_item](info)
	for k_, v_ in pairs(new_item) do
		if type(v_) == 'function' then
			new_item[k_] = info[k_]
		end
	end

    if item_type == 'Challenge' or item_type == 'Edition' then
        -- these dont need visuals
        return
    end

    if item_type == 'Blind' then
        -- separation for animated spritess
        SMODS.Atlas({ key = file_key, atlas_table = "ANIMATION_ATLAS", path = "blinds/" .. file_key .. ".png", px = 34, py = 34, frames = 21 })
	else
		local width = 71
		local height = 95
		if item_type == 'Tag' then width = 34; height = 34 end
        SMODS.Atlas({ key = file_key, path = key .. "/" .. file_key .. ".png", px = new_item.width or width, py = new_item.height or height })
    end
end
