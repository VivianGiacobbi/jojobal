local jokerInfo = {
    name = "Jokerdrive",
    config = {
        extra = {
            mult = 15,
        },
    },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    part = 'jojo',
}

function jokerInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = {key = "artistcredit", set = "Other", vars = { G.jojobal_mod_team.gote } }
    return { vars = { card.ability.extra.mult } }
end

function jokerInfo.calculate(self, card, context)
    if context.joker_main and context.cardarea == G.jokers and G.FUNCS.get_leftmost_stand() then
        return {
            mult = card.ability.extra.mult
        }
    end
end

return jokerInfo