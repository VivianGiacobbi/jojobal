local consumInfo = {
    name = 'November Rain',
    set = 'Stand',
    config = {
        aura_colors = { '43b7abDC', '2e8cfaDC' },
        stand_mask = true,
        extra = {
            max_rank = 9,
            chips = 9,
        }
    },
    cost = 4,
    rarity = 'arrow_StandRarity',
    hasSoul = true,
    part = 'lands',
    blueprint_compat = true
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = {key = "artistcredit", set = "Other", vars = { G.jojobal_mod_team.gote } }
    return { vars = {card.ability.extra.max_rank, card.ability.extra.chips}}
end

function consumInfo.calculate(self, card, context)
    if context.modify_scoring_hand and not context.blueprint and not card.debuff then
        local chip_val = context.other_card.base.nominal
        if to_big(chip_val) <= to_big(9) then
            return {
                add_to_hand = true
            }
        end
    end

    if context.individual and context.cardarea == G.play and not card.debuff then
        local chip_val = context.other_card.base.nominal
        if to_big(chip_val) <= to_big(9) then
            local flare_card = context.blueprint_card or card
            return {
                func = function()
                    G.FUNCS.flare_stand_aura(flare_card, 0.50)
                end,
                extra = {
                    card = flare_card,
                    chips = card.ability.extra.chips
                }
            }
        end
    end
end


return consumInfo