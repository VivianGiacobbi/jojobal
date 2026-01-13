local consumInfo = {
    name = 'Red Stone',
    atlas = 'jojobal_spectrals',
    prefix_config = {atlas = false},
    pos = {x = 1, y = 0},
    config = {
        max_highlighted = 1,
        min_highlighted = 1,
    },
    set = "Spectral",
    cost = 4,
    origin = {
        category = 'jojo',
        sub_origins = {
            'battle',
        },
        custom_color = 'battle'
    },
    artist = 'Vivian Giacobbi',
    programmer = 'Vivian Giacobbi'
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.e_jojobal_hamon
    local multi = card.ability.max_highlighted ~= 1
    return {
        vars = {
            card.ability.max_highlighted,
        },
        key = self.key..(multi and '_multi' or '') or nil
    }
end

function consumInfo.use(self, card, area, copier)
    for i = 1, #G.hand.highlighted do
        local hand_card = G.hand.highlighted[i]
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = function()
                hand_card:set_edition({jojobal_hamon = true}, true, true)
                hand_card:juice_up()
                play_sound('negative', 1.9, 0.4)
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
    end

    delay(0.6)
end

function consumInfo.can_use(self, card)
    return card.ability.max_highlighted >= #G.hand.highlighted and #G.hand.highlighted >= card.ability.min_highlighted
end

return consumInfo