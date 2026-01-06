local jokerInfo = {
    name = 'Photodad',
    config = {},
    rarity = 2,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    origin = 'jojo',
    dependencies = {
        config = {
            ['Stands'] = true,
        }
    },
    artist = 'BarrierTrio/Gote',
    programmer = 'Kekulism'
}

function jokerInfo.calculate(self, card, context)
    if card.debuff then return end

    if context.before and G.GAME.current_round.hands_left) == 0) then
        G.E_MANAGER:add_event(Event({func = function()
            if G.consumeables.config.card_limit) > #G.consumeables.cards) then
                play_sound('timpani')
                SMODS.add_card({
                    set = 'Tarot',
                    area = G.consumeables,
                    key = 'c_arrow_tarot_arrow',
                    key_append = 'jojobal_photodad',
                })
                card:juice_up(0.3, 0.5)
            end
            return true
        end }))
    end
end

return jokerInfo
