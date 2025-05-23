local consumInfo = {
    name = 'I Am a Rock',
    set = 'Stand',
    config = {
        aura_colors = { '7ec7ffDC', 'ffbb49DC' },
        stand_mask = true,
    },
    cost = 4,
    rarity = 'arrow_StandRarity',
    hasSoul = true,
    part = 'lion',
    blueprint_compat = true,
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_stone
    info_queue[#info_queue+1] = {key = "artistcredit", set = "Other", vars = { G.jojobal_mod_team.gote } }
end

function consumInfo.calculate(self, card, context)
    if context.playing_card_added and not card.debuff then
        local flare_card = context.blueprint_card or card
        local cards = {}
        for i, v in ipairs(context.cards) do
            if not v.jojobal_rock_effect then
                local front = pseudorandom_element(G.P_CARDS, pseudoseed('jojobal_rock'))
                local new_stone = create_playing_card({ front = front, center = G.P_CENTERS.m_stone }, nil, true, true, { G.C.RED }, true)
                new_stone.states.visible = false
                new_stone:hard_set_T(G.ROOM.T.x + G.ROOM.T.w/2 - new_stone.T.w/2, G.ROOM.T.y + G.ROOM.T.h/2 - new_stone.T.h/2, new_stone.T.w, new_stone.T.h)
                new_stone.jojobal_rock_effect = true

                G.FUNCS.flare_stand_aura(flare_card, 0.50)  
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        new_stone.states.visible = true
                        flare_card:juice_up()
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        attention_text({
                            text = localize('k_iamarock'),
                            scale = 1,
                            hold = 0.55,
                            backdrop_colour = G.C.STAND,
                            align = 'bm',
                            major = flare_card,
                            offset = {x = 0, y = 0.05*G.CARD_H}
                        })             
                        new_stone:start_materialize({G.C.SECONDARY_SET.Enhanced})
                        return true
                    end
                }))

                delay(0.8)

                draw_card(nil, G.discard, i*100/#context.cards, 'up', false, new_stone)

                cards[#cards+1] = new_stone
            end
        end

        if #cards > 0 then  
            playing_card_joker_effects(cards)
        end
    end
end

return consumInfo