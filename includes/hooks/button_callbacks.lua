---------------------------
--------------------------- Stand buy space
---------------------------

local ref_check_buy_space = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    local ret = ref_check_buy_space(card)
    if not ret then
        return ret
    end

    if card.ability.set == 'csau_Stand' and not G.GAME.stand_unlimited_stands and G.FUNCS.csau_get_leftmost_stand() then
        return false
    end

    return ret
end