SMODS.current_mod.reset_game_globals = function(run_start)
    jojobal_reset_paper_rank()
end

local ref_four_fingers = SMODS.four_fingers
function SMODS.four_fingers()
	local ret = ref_four_fingers()
	if not ret then
		sendDebugMessage('checking for bigmouth')
		ret = next(SMODS.find_card('c_jojobal_lands_bigmouth')) 
	end
	return ret
end

SMODS.Joker:take_ownership('j_perkeo', {
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
		return { vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if not context.ending_shop or #G.consumeables.cards < 1 then
			if not context.repetition then
				return nil, true
			end

			return
		end

		local valid_consumeables = {}
		for _, v in ipairs(G.consumeables.cards) do
			if v.ability.set ~= 'Stand' then
				valid_consumeables[#valid_consumeables+1] = v
			end
		end

		if #valid_consumeables > 0 then
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
		return nil, true
	end
}, true)