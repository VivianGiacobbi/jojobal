---------------------------
--------------------------- Basic Mod Functions
---------------------------

local ref_loc_colour = loc_colour
function loc_colour(_c, _default)
	ref_loc_colour(_c, _default)
	G.ARGS.LOC_COLOURS.stand = G.C.STAND
	return G.ARGS.LOC_COLOURS[_c] or _default or G.C.UI.TEXT_DARK
end

function G.FUNCS.stand_restart()
	local settingsMatch = true
	for k, v in pairs(stand_enabled) do
		if v ~= stand_config[k] then
			settingsMatch = false
		end
	end
	
	if settingsMatch then
		sendDebugMessage('Settings match')
		SMODS.full_restart = 0
	else
		sendDebugMessage('Settings mismatch, restart required')
		SMODS.full_restart = 1
	end
end

--- Resets the rank used by the Paper Moon King stand card
function csau_reset_paper_rank()
    G.GAME.current_round.paper_rank = 'Jack'
	local valid_ranks = {}
    for _, rank in pairs(SMODS.Ranks) do
        if rank.face then valid_ranks[#valid_ranks+1] = rank.key end
    end
	G.GAME.current_round.paper_rank = pseudorandom_element(valid_ranks, pseudoseed('papermoon'..G.GAME.round_resets.ante))
end





---------------------------
--------------------------- Stand Helper Functions
---------------------------

--- Based on code from Ortalab
--- Replaces a card in-place with a card of the specified key
--- @param card Card Balatro card table of the card to replace
--- @param to_key string string key (including prefixes) to replace the given card
--- @param evolve boolean boolean for stand evolution
G.FUNCS.csau_transform_card = function(card, to_key, evolve)
	evolve = evolve or false
	local old_card = card
	local new_card = G.P_CENTERS[to_key]
	card.children.center = Sprite(card.T.x, card.T.y, G.CARD_W, G.CARD_H, G.ASSET_ATLAS[new_card.atlas], new_card.pos)
	card.children.center.scale = {
		x = 71,
		y = 95
	}
	card.children.center.states.hover = card.states.hover
	card.children.center.states.click = card.states.click
	card.children.center.states.drag = card.states.drag
	card.children.center.states.collide.can = false
	card.children.center:set_role({major = card, role_type = 'Glued', draw_major = card})
	card:set_ability(new_card)
	card:set_cost()
	if evolve and old_card.on_evolve and type(old_card.on_evolve) == 'function' then
		old_card:on_evolve(old_card, card)
	end
	if new_card.soul_pos then
		card.children.floating_sprite = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS[new_card.atlas], new_card.soul_pos)
		card.children.floating_sprite.role.draw_major = card
		card.children.floating_sprite.states.hover.can = false
		card.children.floating_sprite.states.click.can = false
	end

	if not card.edition then
		card:juice_up()
		play_sound('generic1')
	else
		card:juice_up(1, 0.5)
		if card.edition.foil then play_sound('foil1', 1.2, 0.4) end
		if card.edition.holo then play_sound('holo1', 1.2*1.58, 0.4) end
		if card.edition.polychrome then play_sound('polychrome1', 1.2, 0.7) end
		if card.edition.negative then play_sound('negative', 1.5, 0.4) end
	end
end

--- Gets the leftmost stand in the consumable slots
--- @return Card | nil # The first Stand in the consumables slot, or nil if you have no Stands
G.FUNCS.csau_get_leftmost_stand = function()
    if not G.consumeables then return nil end

    local stand = nil
    for i, card in ipairs(G.consumeables.cards) do
        if card.ability.set == "csau_Stand" then
            stand = card
            break
        end
    end

    return stand
end

--- Gets the number of stands in your consumable slots
--- @return integer
G.FUNCS.csau_get_num_stands = function()
    if not G.consumeables then return 0 end

    local count = 0
    for i, v in ipairs(G.consumeables.cards) do
        if v.ability.set == "csau_Stand" then
            count = count+1
        end
    end

   return count
end

--- Evolves a Stand. A Stand must have an 'evolve_key' field to evolve
--- @param stand Card Balatro card table representing a Stand consumable
G.FUNCS.csau_evolve_stand = function(stand, text)
	if stand.children.stand_aura then
		stand.children.stand_aura.atlas = G.ASSET_ATLAS[stand.ability.evolved and 'csau_blank_evolved' or 'csau_blank']
	end
	G.FUNCS.csau_flare_stand_aura(stand, 0.50)

	G.E_MANAGER:add_event(Event({
        func = function()
			
			G.FUNCS.csau_transform_card(stand, stand.ability.evolve_key, true)
			check_for_unlock({ type = "evolve_stand" })

			attention_text({
                text = text or localize('k_stand_evolved'),
                scale = 0.7, 
                hold = 0.55,
                backdrop_colour = G.C.STAND,
                align = 'bm',
                major = stand,
                offset = {x = 0, y = 0.05*stand.T.h}
            })

			if not stand.edition then
				play_sound('polychrome1')
			end

			return true
		end
    }))
end

--- Creates a new stand in the consumables card area, on the side of Stands
--- @param evolved boolean Whether or not to use the Evolved Stand pool
G.FUNCS.csau_new_stand = function(evolved)
	local pool_key = evolved and 'csau_EvolvedPool' or 'csau_StandPool'
    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
	local stand = create_card(pool_key, G.consumeables, nil, nil, nil, nil, nil, 'arrow')
	stand:add_to_deck()
	G.consumeables:emplace(stand, nil, nil, nil, nil, G.FUNCS.csau_get_num_stands() + 1)
	stand:juice_up(0.3, 0.5)
	G.GAME.consumeable_buffer = 0
end

--- Queues a stand aura to flare for delay_time if a Stand has an aura attached
--- @param stand Card Balatro card table representing a stand
--- @param delay_time number length of flare in seconds
G.FUNCS.csau_flare_stand_aura = function(stand, delay_time, blockable)
	if not stand.children.stand_aura then
		return
	end
	
	G.E_MANAGER:add_event(Event({
		trigger = 'immediate',
		blockable = blockable or true,
		blocking = false,
		func = function()
			stand.ability.aura_flare_queued = true
			stand.ability.aura_flare_target = delay_time and (delay_time / 2) or nil
        	return true
		end 
	}))
end

--- Sets relevant sprites for stand auras and overlays (if applicable)
--- @param stand Card Balatro card table representing a stand
G.FUNCS.csau_set_stand_sprites = function(stand)
	-- add stand aura
	if stand.ability.aura_colors and #stand.ability.aura_colors == 2 then
		stand.no_shadow = true
		G.ASSET_ATLAS['csau_noise'].image:setWrap('repeat', 'repeat', 'clamp')

		local blank_atlas = G.ASSET_ATLAS[stand.ability.evolved and 'csau_blank_evolved' or 'csau_blank']
		local aura_scale_x = blank_atlas.px / stand.children.center.atlas.px
		local aura_scale_y = blank_atlas.py / stand.children.center.atlas.py
		local aura_width = stand.T.w * aura_scale_x
		local aura_height = stand.T.h * aura_scale_y
		local aura_x_offset = (aura_width - stand.T.w) / 2
		local aura_y_offset = (aura_height - stand.T.h) / 1.1
		
		stand.ability.aura_spread = 0.47
		stand.ability.aura_rate = 0.7
		stand.children.stand_aura = Sprite(
			stand.T.x - aura_x_offset,
			stand.T.y - aura_y_offset,
			aura_width,
			aura_height,
			blank_atlas,
			stand.children.center.config.pos
		)
		stand.children.stand_aura:set_role({
			role_type = 'Minor',
			major = stand,
			offset = { x = -aura_x_offset, y = -aura_y_offset },
			xy_bond = 'Strong',
			wh_bond = 'Weak',
			r_bond = 'Strong',
			scale_bond = 'Strong',
			draw_major = stand
		})
		stand.children.stand_aura:align_to_major()
		stand.children.stand_aura.custom_draw = true
	end
end





---------------------------
--------------------------- Fibonacci scoring
---------------------------

local function is_perfect_square(x)
	local sqrt = math.sqrt(x)
	return sqrt^2 == x
end

function csau_get_fibonacci(hand)
	local ret = {}
	if #hand < 5 then return ret end
	local vals = {}
	for i = 1, #hand do
		local value = hand[i].base.nominal
		if hand[i].base.value == 'Ace' then
			value = 1
		elseif SMODS.has_no_rank(hand[i]) then
			value = 0
		end
		
		vals[#vals+1] = value
	end
	table.sort(vals, function(a, b) return a < b end)

	if not vals[1] == 0 and not (is_perfect_square(5 * vals[1]^2 + 4) or is_perfect_square(5 * vals[1]^2 - 4)) then
		return ret
	end

	local sum = 0
	local prev_1 = vals[1]
	local prev_2 = 0
	for i=1, #vals do
		sum = prev_1 + prev_2
		
		if vals[i] ~= sum then
			return ret
		end

		prev_2 = prev_1
		prev_1 = vals[i] == 0 and 1 or vals[i]
	end

	local t = {}
	for i=1, #hand do
		t[#t+1] = hand[i]
	end

	table.insert(ret, t)
	return ret
end





---------------------------
--------------------------- Stand Stake Sticker functions
---------------------------

function set_stand_win()
	G.PROFILES[G.SETTINGS.profile].stand_usage = G.PROFILES[G.SETTINGS.profile].stand_usage or {}
	for k, v in pairs(G.consumeables.cards) do
		if v.config.center_key and v.ability.set == 'csau_Stand' then
			G.PROFILES[G.SETTINGS.profile].stand_usage[v.config.center_key] = G.PROFILES[G.SETTINGS.profile].stand_usage[v.config.center_key] or {count = 1, order = v.config.center.order, wins = {}, losses = {}, wins_by_key = {}, losses_by_key = {}}
			if G.PROFILES[G.SETTINGS.profile].stand_usage[v.config.center_key] then
				G.PROFILES[G.SETTINGS.profile].stand_usage[v.config.center_key].wins = G.PROFILES[G.SETTINGS.profile].stand_usage[v.config.center_key].wins or {}
				G.PROFILES[G.SETTINGS.profile].stand_usage[v.config.center_key].wins[G.GAME.stake] = (G.PROFILES[G.SETTINGS.profile].stand_usage[v.config.center_key].wins[G.GAME.stake] or 0) + 1
				G.PROFILES[G.SETTINGS.profile].stand_usage[v.config.center_key].wins_by_key[SMODS.stake_from_index(G.GAME.stake)] = (G.PROFILES[G.SETTINGS.profile].stand_usage[v.config.center_key].wins_by_key[SMODS.stake_from_index(G.GAME.stake)] or 0) + 1
			end
		end
	end
	G:save_settings()
end

function get_stand_win_sticker(_center, index)
	if not G.PROFILES[G.SETTINGS.profile].stand_usage then return 0 end
	local stand_usage = G.PROFILES[G.SETTINGS.profile].stand_usage[_center.key] or {}
	if stand_usage.wins then
		if SMODS and SMODS.can_load then
			local applied = {}
			local _count = 0
			local _stake = nil
			for k, v in pairs(stand_usage.wins_by_key or {}) do
				SMODS.build_stake_chain(G.P_STAKES[k], applied)
			end
			for i, v in ipairs(G.P_CENTER_POOLS.Stake) do
				if applied[v.order] then
					_count = _count+1
					if (v.stake_level or 0) > (_stake and G.P_STAKES[_stake].stake_level or 0) then
						_stake = v.key
					end
				end
			end
			if index then return _count end
			if _count > 0 then return G.sticker_map[_stake] end
		else
			local _stake = 0
			for k, v in pairs(G.PROFILES[G.SETTINGS.profile].stand_usage[_center.key].wins or {}) do
				_stake = math.max(k, _stake)
			end
			if index then return _stake end
			if _stake > 0 then return G.sticker_map[_stake] end
		end
	end
	if index then return 0 end
end

local ref_spp = set_profile_progress
function set_profile_progress()
	ref_spp()
	G.PROGRESS.stand_stickers = {tally = 0, of = 0}
	for _, v in pairs(G.P_CENTERS) do
		if v.set == 'csau_Stand' then
			G.PROGRESS.stand_stickers.of = G.PROGRESS.stand_stickers.of + #G.P_CENTER_POOLS.Stake
			G.PROGRESS.stand_stickers.tally = G.PROGRESS.stand_stickers.tally + get_stand_win_sticker(v, true)
		end
	end
	G.PROFILES[G.SETTINGS.profile].progress.stand_stickers = copy_table(G.PROGRESS.stand_stickers)
end