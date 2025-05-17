SMODS.current_mod.reset_game_globals = function(run_start)
    if run_start then
        G.GAME.modifiers.max_stands = 1
    end

    csau_reset_paper_rank()
end

local ref_ccuib = SMODS.card_collection_UIBox
SMODS.card_collection_UIBox = function(_pool, rows, args)
	if _pool == G.P_CENTER_POOLS.csau_Stand then
		args.modify_card = function(card, center, i, j)
			card.sticker = get_stand_win_sticker(center)
		end
	end

	return ref_ccuib(_pool, rows, args)
end

SMODS.Joker:take_ownership('j_perkeo', {
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
		return { vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if not (context.ending_shop and context.cardarea == G.jokers) or #G.consumeables.cards < 1 then
			return	
		end

		local valid_consumeables = {}
		for _, v in ipairs(G.consumeables.cards) do
			if v.ability.consumeable and v.ability.set ~= 'csau_Stand' then
				valid_consumeables[#valid_consumeables+1] = v
			end
		end

		G.E_MANAGER:add_event(Event({
			func = function() 
				local copied_card = copy_card(pseudorandom_element(valid_consumeables, pseudoseed('perkeo')), nil)
				copied_card:set_edition({negative = true}, true)
				copied_card:add_to_deck()
				G.consumeables:emplace(copied_card) 
				return true
			end}))
		card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
	end
}, true)