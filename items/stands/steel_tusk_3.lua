local consumInfo = {
    name = 'Tusk ACT3',
    set = 'Stand',
    config = {
        aura_colors = { 'ff7dbcDC', '3855aeDC' },
        stand_mask = true,
        evolved = true,
        evolve_key = 'c_jojobal_steel_tusk_4',
        extra = {
            chips = 34,
            evolve_percent = 0.1,
            evolved = false,
            valid_ids = {
                [2] = true,
                [3] = true,
                [5] = true,
                [14] = true,
            }
        }
    },
    cost = 10,
    rarity = 'arrow_EvolvedRarity',
    hasSoul = true,
    part = 'steel',
    blueprint_compat = true
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = {key = "artistcredit_2", set = "Other", vars = { G.jojobal_mod_team.wario, G.jojobal_mod_team.cauthen } }
    return {vars = {card.ability.extra.chips, card.ability.extra.evolve_percent * 100}}
end

function consumInfo.in_pool(self, args)
    if G.GAME.used_jokers['c_jojobal_steel_tusk_1']
    or G.GAME.used_jokers['c_jojobal_steel_tusk_2']
    or G.GAME.used_jokers['c_jojobal_steel_tusk_4'] then
        return false
    end
    
    return true
end

function consumInfo.calculate(self, card, context)
    if card.debuff then return end

    if context.individual and context.cardarea == G.play and card.ability.extra.valid_ids[context.other_card:get_id()] then
        local flare_card = context.blueprint_card or card
        return {
            func = function()
                G.FUNCS.flare_stand_aura(flare_card, 0.50)
            end,
            extra = {
                chips = card.ability.extra.chips,
                card = flare_card
            }
        }
    end

    if context.end_of_round and context.main_eval and not context.blueprint and not context.retrigger_joker
    and to_big(G.GAME.chips) <= to_big(G.GAME.blind.chips * (1+card.ability.extra.evolve_percent)) and not card.ability.extra.evolved then
        card.ability.extra.evolved = true
        G.E_MANAGER:add_event(Event({
            func = (function()
                check_for_unlock({ type = "evolve_tusk" })
                G.FUNCS.evolve_stand(card)
                return true
            end)
        }))
    end
end


return consumInfo