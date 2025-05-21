local consumInfo = {
    name = 'Made in Heaven',
    set = 'Stand',
    config = {
        aura_colors = { 'bd53f3DC', '491d96DC' },
        stand_mask = true,
        evolved = true,
        extra = {
            hand_mod = 1,
            discard_mod = 1
        }
    },
    cost = 10,
    rarity = 'arrow_EvolvedRarity',
    hasSoul = true,
    part = 'stone',
    blueprint_compat = true
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = {key = "artistcredit", set = "Other", vars = { G.jojobal_mod_team.wario } }
end

function consumInfo.in_pool(self, args)
    if next(SMODS.find_card('j_showman')) then
        return true
    end

    if G.GAME.used_jokers['c_jojobal_stone_white_moon']
    or G.GAME.used_jokers['c_jojobal_stone_white'] then
        return false
    end
    
    return true
end

function consumInfo.calculate(self, card, context)
    if context.before and not card.debuff then
        ease_hands_played(card.ability.extra.hand_mod)
        return {
            func = function()
                G.FUNCS.flare_stand_aura(context.blueprint_card or card, 0.50)
            end,
            extra = {
                card = context.blueprint_card or card,
                message = localize{type = 'variable', key = 'a_plus_hand', vars = {card.ability.extra.hand_mod}},
                colour = G.C.BLUE
            }
        }
    end

    if context.pre_discard and not card.debuff then
        ease_discard(card.ability.extra.discard_mod)
        return {
            func = function()
                G.FUNCS.flare_stand_aura(context.blueprint_card or card, 0.50)
            end,
            extra = {
                card = context.blueprint_card or card,
                message = localize{type = 'variable', key = 'a_plus_discard', vars = {card.ability.extra.discard_mod}},
                colour = G.C.RED
            }
        }
    end
end


return consumInfo