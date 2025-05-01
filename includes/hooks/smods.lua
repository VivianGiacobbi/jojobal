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