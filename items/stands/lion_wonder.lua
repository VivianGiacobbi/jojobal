local consumInfo = {
    name = 'Wonder of U',
    set = 'Stand',
    config = {
        aura_colors = { '280101DC', '711b1aDC' },
        stand_mask = true,
        extra = {
            form = 'lion_wonder',
            xmult = 1,
            xmult_mod = 0.2,
        }
    },
    cost = 4,
    rarity = 'StandRarity',
    hasSoul = true,
    origin = {
        category = 'jojo',
        sub_origins = {
            'lion',
        },
        custom_color = 'lion'
    },
    blueprint_compat = true,
    artist = 'cauthen',
}

function consumInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
    return {vars = {card.ability.extra.xmult_mod, card.ability.extra.xmult}}
end

local forms = {
    ['lion_wonder'] = true,
    ['lion_wonder_2'] = true,
    ['lion_wonder_3'] = true,
}

SMODS.Atlas({ key = 'lion_wonder_2', path = "stands/lion_wonder_2.png", px = 71, py = 95 })
SMODS.Atlas({ key = 'lion_wonder_3', path = "stands/lion_wonder_3.png", px = 71, py = 95 })

function consumInfo.set_sprites(self, card, context)
    if not card.config.center.discovered and (G.OVERLAY_MENU or G.STAGE == G.STAGES.MAIN_MENU) then
        return
    end

    if G.SETTINGS.highest_wonder then
        card.ability.extra.form = G.SETTINGS.highest_wonder

        card.config.center.atlas = "jojobal_"..card.ability.extra.form
        card:set_sprites(card.config.center)
        card.config.center.atlas = 'jojoba_lion_wonder'
    end
end

function consumInfo.calculate(self, card, context)
    if card.debuff then return end

    if context.joker_main and card.ability.extra.xmult > 1 then
        local flare_card = context.blueprint_card or card
        return {
            func = function()
                ArrowAPI.stands.flare_aura(flare_card, 0.50)
            end,
            extra = {
                x_mult = card.ability.extra.xmult,
                card = flare_card
            }
        }
    end
        
    if context.destroy_card and not context.blueprint and not context.retrigger_joker then
        if SMODS.has_enhancement(context.destroy_card, 'm_lucky') and SMODS.in_scoring(context.destroy_card, context.scoring_hand) and not context.destroy_card.debuff then
            context.destroy_card.jojobal_removed_by_wonder = true
            return {
                no_retrigger = true,
                remove = true,
            }
        end
    end

    if context.jojobal_card_destroyed and context.removed.jojobal_removed_by_wonder and not context.blueprint then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod

        local update_sprite = false
        if to_big(card.ability.extra.xmult) >= to_big(1.9) and card.ability.extra.form == 'lion_wonder' then
            card.ability.extra.form = 'lion_wonder_2'
            update_sprite = true
        elseif to_big(card.ability.extra.xmult) >= to_big(3) and card.ability.extra.form == 'lion_wonder_2' then
            card.ability.extra.form = 'lion_wonder_3'
            update_sprite = true
        end

        return {
            func = function()
                ArrowAPI.stands.flare_aura(card, 0.50)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if update_sprite then
                            card.config.center.atlas = "jojobal_"..card.ability.extra.form
                            card:set_sprites(card.config.center)
                            card.config.center.atlas = 'jojoba_lion_wonder'

                            G.SETTINGS.highest_wonder = card.ability.extra.form
                            G:save_settings()
                        end
                        
                        context.removed:juice_up()
                        return true
                    end
                }))
            end,
            extra = {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED,
                card = card
            }
        }
    end
end

return consumInfo