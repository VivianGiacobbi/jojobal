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
    hasSoul = true,
    part = 'vento',
    blueprint_compat = true,
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = {key = "artistcredit", set = "Other", vars = { G.jojobal_mod_team.gote } }
end

function consumInfo.in_pool(self, args)
    if next(SMODS.find_card('j_showman')) then
        return true
    end
    
    return (not G.GAME.used_jokers['c_jojobal_vento_epitaph'])
end

function consumInfo.calculate(self, card, context)
    if context.end_of_round and context.cardarea == G.consumeables and G.GAME.blind:get_type() ~= 'Boss' then
        local flare_card = context.blueprint_card or card
        G.FUNCS.flare_stand_aura(flare_card, 0.50)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function()
                add_tag(Tag(G.GAME.round_resets.blind_tags[G.GAME.blind_on_deck]))
                
                flare_card:juice_up()

                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end)
        }))
        delay(0.35)
    end
end


return consumInfo