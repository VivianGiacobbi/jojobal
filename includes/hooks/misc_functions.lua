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
function jojobal_reset_paper_rank()
    G.GAME.current_round.jojobal_paper_rank = 'Jack'
	local valid_ranks = {}
    for _, rank in pairs(SMODS.Ranks) do
        if rank.face then valid_ranks[#valid_ranks+1] = rank.key end
    end
	G.GAME.current_round.jojobal_paper_rank = pseudorandom_element(valid_ranks, pseudoseed('papermoon'..G.GAME.round_resets.ante))
end





---------------------------
--------------------------- Stand Helper Functions
---------------------------

function G.FUNCS.jojobal_preview_cardarea(preview_num)
	local preview_cards = {}
	local count = 0
	local deck_size = #G.deck.cards

	while count < preview_num and deck_size >= 1 do
		local card = G.deck.cards[deck_size]
		if card then
			table.insert(preview_cards, card)
			count = count + 1
		end
		deck_size = deck_size - 1
	end

	if count < 1 then
		return nil
	end


    local preview_area = CardArea(
            0, 0,
            (math.min(card.ability.extra.preview, #preview_cards) * G.CARD_W)*0.55,
            G.CARD_H*0.5,
            {card_limit = #preview_cards, type = 'title', highlight_limit = 0, card_w = G.CARD_W*0.7}
    )

    for i=1, #preview_cards do
        local copied_card = copy_card(preview_cards[i], nil, nil, G.playing_card)
        preview_area:emplace(copied_card)
    end

    return {{
        n=G.UIT.R, 
        config = {align = "cm", colour = G.C.CLEAR, r = 0.0, padding = 0.5},
        nodes={{
            n=G.UIT.O, config = {object = preview_area}
        }}
    }}
end

G.FUNCS.jojobal_add_chance = function(num, extra)
	local multiply = extra and extra.multiply or false
	local startAtOne = extra and extra.start_at_one or false
	if multiply then
		if G.GAME.probabilities and G.GAME.probabilities.normal then
			return ((startAtOne and 1 or 0) + num) * G.GAME.probabilities.normal
		end
	end
	return (startAtOne and 1 or 0) + num
end





---------------------------
--------------------------- Fibonacci scoring
---------------------------

local function is_perfect_square(x)
	local sqrt = math.sqrt(x)
	return sqrt^2 == x
end

function jojobal_get_fibonacci(hand)
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