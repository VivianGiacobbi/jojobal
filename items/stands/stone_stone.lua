local consumInfo = {
    name = 'Stone Free',
    set = 'Stand',
    config = {
        aura_colors = { '4db8cfDC', '4d89cfDC' },
        stand_mask = true,
        extra = {
            chips = 60,
        }
    },
    cost = 4,
    rarity = 'arrow_StandRarity',
    alerted = true,
    hasSoul = true,
    part = 'stone',
    blueprint_compat = true
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_stone
    info_queue[#info_queue+1] = {key = "artistcredit", set = "Other", vars = { G.jojobal_mod_team.chvsau } }
    return { vars = {card.ability.extra.chips}}
end

function consumInfo.calculate(self, card, context)
    if context.individual and context.cardarea == G.play and not card.debuff then
        if context.other_card.config.center.key == 'm_stone' or context.other_card.jojobal_stone_effect then
            local stone_card = context.other_card
            local juice_card = context.blueprint_card or card
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            if not stone_card.jojobal_stone_effect then
                                stone_card:set_ability(G.P_CENTERS.c_base)
                                stone_card.jojobal_stone_effect = true
                            end
                            
                            G.FUNCS.flare_stand_aura(juice_card, 0.50)
                            juice_card:juice_up()                    
                            stone_card.ability.perma_bonus = stone_card.ability.perma_bonus or 0
                            stone_card.ability.perma_bonus = stone_card.ability.perma_bonus + card.ability.extra.chips
                            return true
                        end)
                    }))
                end,
                extra = {
                    message = localize('k_stone_free'),
                    colour = G.C.CHIPS,
                    card = context.other_card
                }
            }
        end
    end
end


return consumInfo