local consumInfo = {
    name = 'Soft & Wet: Go Beyond',
    set = 'Stand',
    config = {
        aura_colors = { 'ebfafeDC', 'b48df1DC' },
        stand_mask = true,
        evolved = true,
        extra = {
            perma_mod = 1,
        }
    },
    cost = 10,
    rarity = 'arrow_EvolvedRarity',
    hasSoul = true,
    part = 'lion',
    blueprint_compat = true,
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
    info_queue[#info_queue+1] = G.P_CENTERS.m_mult
    info_queue[#info_queue+1] = {key = "artistcredit", set = "Other", vars = { G.jojobal_mod_team.stup } }
end

function consumInfo.in_pool(self, args)
    if next(SMODS.find_card('j_showman')) then
        return true
    end

    if G.GAME.used_jokers['c_jojobal_lion_soft'] then
        return false
    end
    
    return true
end

function consumInfo.calculate(self, card, context)
    if context.before and not card.debuff then
        local enhanced = {}
        for _, v in ipairs(context.scoring_hand) do
            if ((v.config.center.key == 'm_bonus' or v.config.center.key == 'm_mult') or v.jjba_soft_effect) and not v.debuff then
                enhanced[#enhanced+1] = v

                if not v.jjba_soft_effect then
                    v.jjba_soft_effect = v.config.center.key
                    v:set_ability(G.P_CENTERS.c_base, nil, true)
                end

                if v.jjba_soft_effect == 'm_bonus' then
                    v.ability.perma_bonus = v.ability.perma_bonus or 0
                    v.ability.perma_bonus = v.ability.perma_bonus + (G.P_CENTERS[v.jjba_soft_effect].bonus*card.ability.extra.perma_mod)
                elseif v.jjba_soft_effect == 'm_mult' then
                    v.ability.perma_mult = v.ability.perma_mult or 0
                    v.ability.perma_mult = v.ability.perma_mult + (G.P_CENTERS[v.jjba_soft_effect].mult*card.ability.extra.perma_mod)
                end
                
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local color = v.jjba_soft_effect == 'm_mult' and G.C.MULT or G.C.CHIPS
                        card_eval_status_text(v, 'extra', nil, nil, nil, {message = localize('k_soft_and_wet'), colour = (color)})
                        return true
                    end
                }))
            end
        end

        if #enhanced > 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local juice_card = context.blueprint_card or card
                    G.FUNCS.flare_stand_aura(juice_card, 0.50)
                    juice_card:juice_up()
                    return true
                end
            }))
        end
    end

    if context.after and not context.retrigger_joker and not context.blueprint then
        for _, v in ipairs(context.scoring_hand) do
            v.jjba_soft_effect = nil
        end
    end
end


return consumInfo