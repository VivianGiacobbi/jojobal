local consumInfo = {
    name = 'King Crimson',
    set = 'Stand',
    config = {
        evolved = true,
        stand_mask = true,
        aura_colors = { 'e53663DC', 'a71d40DC' },
    },
    cost = 10,
    rarity = 'arrow_EvolvedRarity',
    alerted = true,
    hasSoul = true,
    part = 'vento',
    in_progress = true,
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = {key = "artistcredit", set = "Other", vars = { G.stands_mod_team.gote } }
end

function consumInfo.in_pool(self, args)
    if next(SMODS.find_card('j_showman')) then
        return true
    end
    
    return (not G.GAME.used_jokers['c_jojo_vento_epitaph'])
end

function consumInfo.calculate(self, card, context)
    local bad_context = context.repetition or context.blueprint or context.individual or context.retrigger_joker
    if context.end_of_round and not G.GAME.blind.boss and not bad_context then
        add_tag(Tag(G.GAME.round_resets.blind_tags[G.GAME.blind_on_deck]))
        card:juice_up()
        G.FUNCS.flare_stand_aura(card, 0.50)
    end
end


return consumInfo