local ref_card_id = Card.get_id
function Card:get_id(skip_pmk)
    skip_pmk = skip_pmk or false
    if not skip_pmk and (self.area == G.hand or self.area == G.play) and self:is_face(true) and next(SMODS.find_card("c_jojobal_lion_paper")) then
        return SMODS.Ranks[G.GAME.current_round.jojobal_paper_rank or 'Jack'].id
    end
    return ref_card_id(self)
end





---------------------------
--------------------------- Card destruction calc context
---------------------------

local ref_card_dissolve = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
    local ret = ref_card_dissolve(self, dissolve_colours, silent, dissolve_time_fac, no_juice)

    if self.area then
        SMODS.calculate_context({jojobal_card_removed = true, card = self})
    end

    return ret
end