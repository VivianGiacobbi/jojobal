local consumInfo = {
    name = 'Paper Moon King',
    set = 'Stand',
    config = {
        aura_colors = { 'afb5b1DC', '4a7e38DC' },
        aura_hover = true,
    },
    cost = 4,
    rarity = 'arrow_StandRarity',
    hasSoul = true,
    part = 'lion',
    blueprint_compat = false,
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = {key = "artistcredit", set = "Other", vars = { G.jojobal_mod_team.gote } }
    return {vars = {(G.GAME and G.GAME.current_round and G.GAME.current_round.jojobal_paper_rank) or 'Jack'}}
end

return consumInfo