local consumInfo = {
    name = 'Whitesnake',
    set = 'Stand',
    config = {
        aura_colors = { '8b6cc9DC', '6c4ca0DC' },
        stand_mask = true,
        evolve_key = 'c_jojobal_stone_white_moon',
        extra = {
            evolve_cards = 0,
            evolve_num = 36,
            evolve_val = '6'
        }
    },
    cost = 4,
    rarity = 'arrow_StandRarity',
    hasSoul = true,
    part = 'stone',
    blueprint_compat = true
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = {key = "artistcredit", set = "Other", vars = { G.jojobal_mod_team.wario } }
    return { vars = {card.ability.extra.evolve_num - card.ability.extra.evolve_cards, SMODS.Ranks[card.ability.extra.evolve_val].key}}
end

function consumInfo.in_pool(self, args)
    if next(SMODS.find_card('j_showman')) then
        return true
    end

    if G.GAME.used_jokers['c_jojobal_stone_white_moon']
    or G.GAME.used_jokers['c_jojobal_stone_white_heaven'] then
        return false
    end
    
    return true
end

function consumInfo.calculate(self, card, context)
    if context.cardarea == G.play and context.repetition and not context.repetition_only then
        if context.other_card:get_id() == 6 then
            return {
                func = function()
                    G.FUNCS.flare_stand_aura(context.blueprint_card or card, 0.50)
                end,
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
        end
    end

    if context.before and not card.debuff and not context.blueprint and not context.retrigger_joker then
        local six = 0
        for _, v in ipairs(context.scoring_hand) do
            if v:get_id() == 6 then
                six = six + 1
            end
        end
        card.ability.extra.evolve_cards = card.ability.extra.evolve_cards + six
        if to_big(card.ability.extra.evolve_cards) >= to_big(card.ability.extra.evolve_num) then
            G.FUNCS.evolve_stand(card)
        elseif #six > 0 then
            return {
                message = card.ability.extra.evolve_cards..'/'..card.ability.extra.evolve_num,
                colour = G.C.STAND
            }
        end
    end
end


return consumInfo