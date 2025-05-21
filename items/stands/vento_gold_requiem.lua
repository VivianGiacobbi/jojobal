local consumInfo = {
    name = 'Gold Experience Requiem',
    set = 'Stand',
    config = {
        stand_mask = true,
        aura_colors = { '99d3ffDC' , 'd3f5fbDC' },
        evolved = true,
        extra = {
            chance = 0,
            divide = 5,
        }
    },
    cost = 10,
    rarity = 'arrow_EvolvedRarity',
    hasSoul = true,
    part = 'vento',
    blueprint_compat = true,
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_gold
    info_queue[#info_queue+1] = {key = "artistcredit_2", set = "Other", vars = { G.jojobal_mod_team.reda, G.jojobal_mod_team.wario } }
    return { vars = { card.ability.extra.chance, card.ability.extra.divide, G.GAME.probabilities.normal}}
end

function consumInfo.in_pool(self, args)
    if next(SMODS.find_card('j_showman')) then
        return true
    end
    return (not G.GAME.used_jokers['c_jojobal_vento_gold'])
end

function consumInfo.calculate(self, card, context)
    if context.before and not card.debuff then
        local gold = {}
        for _, v in ipairs(context.scoring_hand) do
            if SMODS.has_enhancement(v, 'm_gold') then
                gold[#gold+1] = v
            end
        end

        if pseudorandom('jojobal_gerequiem') < G.FUNCS.jojobal_add_chance(card.ability.extra.chance+#gold, {multiply = true}) / card.ability.extra.divide then
            return {
                func = function()
                    G.FUNCS.flare_stand_aura(context.blueprint_card or card, 0.50)
                end,
                extra = {
                    card = context.blueprint_card or card,
                    level_up = true,
                    message = localize('k_level_up_ex')
                }
            }
        end
    end
end


return consumInfo