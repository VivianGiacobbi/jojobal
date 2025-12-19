local consumInfo = {
    name = 'Whirlpool',
    set = "Planet",
    config = { hand_type = 'jojobal_Fibonacci' },
    artist = 'BarrierTrio/Gote',
    programmer = 'Kekulism'
}

function consumInfo.loc_vars(self, info_queue, card)
    local hand = self.config.hand_type
    return { vars = {G.GAME.hands[hand].level,localize(hand, 'poker_hands'), G.GAME.hands[hand].l_mult, G.GAME.hands[hand].l_chips, colours = {(G.GAME.hands[hand].level==1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[hand].level)])}} }
end

function consumInfo.in_pool (self, args)
    return next(SMODS.find_card("c_jojobal_steel_tusk_4")) and G.GAME.hands.jojobal_Fibonacci.played > 0
end

function consumInfo.set_card_type_badge(self, card, badges)
    badges[1] = create_badge(localize('k_galaxy'), get_type_colour(self or card.config, card), nil, 1.2)
end

return consumInfo