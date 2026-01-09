ArrowAPI.loc.add_loc_text_func(JojobalMod, function()
    ---------------------------
    --------------------------- Poker hands
    ---------------------------
    SMODS.process_loc_text(G.localization.misc.poker_hands, 'jojobal_Fibonacci', {['en-us'] = 'Fibonacci'})
    SMODS.process_loc_text(G.localization.misc.poker_hands, 'jojobal_FlushFibonacci', {['en-us'] = 'Flush Fibonacci'})



    ---------------------------
    --------------------------- Poker Hand Descriptions
    ---------------------------
    SMODS.process_loc_text(G.localization.misc.poker_hand_descriptions, 'jojobal_Fibonacci', {['en-us'] = {
        "5 cards that makecd .. a Fibonacci sequence",
        "(each card's rank is the sum of the",
        "two ranks that precede it)"
    }})
    SMODS.process_loc_text(G.localization.misc.poker_hand_descriptions, 'jojobal_FlushFibonacci', {['en-us'] = {
        "5 cards making a Fibonacci sequence",
        "(each card's rank is the sum of the",
        "two ranks that precede it), with",
        "all cards sharing the same suit",
    }})



    ---------------------------
    --------------------------- Dictionary
    ---------------------------
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_galaxy', {['en-us'] = "Galaxy"})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_galaxy_q', {['en-us'] = "Galaxy?"})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'arrow_options_enable_Title', {['en-us'] = 'Enable Title'})

    --- badge names
    SMODS.process_loc_text(G.localization.misc.dictionary, 'ba_jojo', {['en-us'] = "Jojo's Bizarre Adventure"})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'ba_phantom', {['en-us'] = 'Phantom Blood'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'ba_battle', {['en-us'] = 'Battle Tendency'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'ba_stardust', {['en-us'] = 'Stardust Crusaders'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'ba_diamond', {['en-us'] = 'Diamond is Unbreakable'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'ba_vento', {['en-us'] = 'Golden Wind'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'ba_feedback', {['en-us'] = 'Purple Haze Feedback'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'ba_stone', {['en-us'] = 'Stone Ocean'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'ba_steel', {['en-us'] = 'Steel Ball Run'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'ba_lion', {['en-us'] = 'JoJolion'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'ba_lands', {['en-us'] = 'The JOJOLands'})

    --- stand callouts
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_stand_evolved', {['en-us'] = 'Evolved!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_echoes_recorded', {['en-us'] = 'Recorded!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_iamarock', {['en-us'] = 'Rock!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_boing', {['en-us'] = 'Boing!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_metal', {['en-us'] = 'Metal!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_gold_exp', {['en-us'] = 'Gold Experience!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_stone_free', {['en-us'] = 'Stone Free!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_bsa', {['en-us'] = 'Bigmouth Strikes Again!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_smooth_operators', {['en-us'] = 'Dragged!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_soft_and_wet', {['en-us'] = 'Stolen!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_bites_the_dust', {['en-us'] = 'Bites the Dust!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_thehand', {['en-us'] = 'Swipe!'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_stand_stickers', {['en-us'] = 'Stand Stickers'})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'k_plus_hand', {['en-us'] = '+1 Hand'})



    ---------------------------
    --------------------------- Variable Dictionary
    ---------------------------
    SMODS.process_loc_text(G.localization.misc.dictionary, 'a_multilevel', {['en-us'] = "Level Up X#1#!"})
    SMODS.process_loc_text(G.localization.misc.dictionary, 'a_plus_discard', {['en-us'] = "+#1# Discard"})



    ---------------------------
    --------------------------- Jokers
    ---------------------------
    SMODS.process_loc_text(G.localization.descriptions.Joker, 'j_jojobal_jojo_gravity', {['en-us'] = {
        name = "Gravity",
        text = {
            "This Joker gains {C:mult}+#1#{} Mult every",
            "round you have a {C:stand}Stand{},",
            "resets when a {C:stand}Stand{} is",
            "{C:attention}sold{} or {C:attention}destroyed{}",
            "{C:inactive}(Currently {}{C:mult}+#2#{}{C:inactive} Mult{}{C:inactive}){}",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Joker, 'j_jojobal_jojo_jokerdrive', {['en-us'] = {
        name = "Jokerdrive",
        text = {
            "{C:mult}+#1#{} Mult if you",
            "do not have a {C:stand}Stand{}",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Joker, 'j_jojobal_jojo_photodad', {['en-us'] = {
        name = "Photodad",
        text = {
            "When {C:attention}final hand{} of round",
            "is played, create {C:tarot}The Arrow{}",
            "{C:inactive}(Must have room)",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Joker, 'j_jojobal_jojo_no2', {['en-us'] = {
        name = "No. 2 Joker",
        text = {
            "All {C:stand}Stands{} retrigger",
            "{C:inactive}(if applicable){}"
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Joker, 'j_jojobal_jojo_sotw', {['en-us'] = {
        name = "Stand of the Week",
        text = {
            "Gains {X:mult,C:white}X#1#{} Mult for every",
            "{C:attention}unique{} {C:stand}Stand{} obtained this run",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
        },
        unlock = {
            "Discover {E:1,C:attention}#1#{} {E:1,C:stand}Stands",
            "{C:inactive}[#2#/#1#]",
        },
    }})



    ---------------------------
    --------------------------- Tarot
    ---------------------------
    SMODS.process_loc_text(G.localization.descriptions.Tarot, 'c_emperor_civil', {['en-us'] = {
        name = "The Emperor",
        text = {
            "Creates {C:tarot}The Hanged Man{} and",
            "{C:attention}#1#{} random {C:tarot}Tarot{} card",
            "{C:inactive}(Must have room)"
        }
    }})



    ---------------------------
    --------------------------- Planets
    ---------------------------
    SMODS.process_loc_text(G.localization.descriptions.Planet, 'c_jojobal_planet_whirlpool', {['en-us'] = {
        name = "Whirlpool",
        text = {
            "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
            "{C:attention}#2#",
            "{C:mult}+#3#{} Mult and",
            "{C:chips}+#4#{} chips",
        }
    }})
    SMODS.process_loc_text(G.localization.descriptions.Planet, 'c_jojobal_planet_lost', {['en-us'] = {
        name = "Lost Galaxy",
        text = {
            "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
            "{C:attention}#2#",
            "{C:mult}+#3#{} Mult and",
            "{C:chips}+#4#{} chips",
        }
    }})



    ---------------------------
    --------------------------- Spectral
    ---------------------------
    SMODS.process_loc_text(G.localization.descriptions.Spectral, 'c_jojobal_spec_mask', {['en-us'] = {
        name = "Stone Mask",
        text = {
            "Add {C:dark_edition}Holographic{} and {C:attention}Eternal{}",
            "to a random Joker, overwriting",
            "existing {C:dark_edition}editions{} and {C:attention}stickers{}"
        }
    }})



    ---------------------------
    --------------------------- Stand
    ---------------------------
    G.localization.descriptions.Stand = {}
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_stardust_star', {['en-us'] = {
        name = "Star Platinum",
        text = {
            "If {C:attention}first hand{} of round",
            "is all {V:1}#2#{}, gain {C:blue}+1{} Hand",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_stardust_tohth', {['en-us'] = {
        name = "Tohth",
        text = {
            "{C:attention}Preview{} the top {C:attention}#1#{}",
            " cards in your deck{}",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_stardust_world', {['en-us'] = {
        name = "DIO's World",
        text = {
            "If {C:attention}first hand{} of round",
            "is all {V:1}#2#{}, gain {C:blue}+1{} Hand",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_diamond_crazy', {['en-us'] = {
        name = "Crazy Diamond",
        text = {
            "Played {C:attention}debuffed{} cards",
            "are {C:attention}healed{}",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_diamond_hand', {['en-us'] = {
        name = "The Hand",
        text = {
            "Whenever a card is {C:attention}destroyed{},",
            "give adjacent cards the same",
            "{C:attention}rank{}, {C:attention}suit{}, and {C:attention}enhancement{}",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_diamond_echoes_1', {['en-us'] = {
        name = "Echoes ACT1",
        text = {
            {
                "If {C:attention}first hand{} of round",
                "has only {C:attention}#1#{} card, cards",
                "of {V:1}#4#{}#5# {C:attention}suit{} give",
                "{C:mult}+#2#{} Mult when scored",
            },
            {
                "{C:stand}Evolves{} after {C:attention}#3#{} rounds",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_diamond_echoes_2', {['en-us'] = {
        name = "Echoes ACT2",
        text = {
            {
                "If {C:attention}first hand{} of round has only",
                "{C:attention}#1#{} card, the first {C:attention}scoring{} card",
                "each hand becomes {V:1}#4#{}{C:attention}#5#{}",
            },
            {
                "{V:1}#6#{}{C:attention}#7#{} give#8# {C:mult}+#2#{} Mult",
                "when scored",
            },
            {
                "{C:stand}Evolves{} after {C:attention}#3#{} rounds",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_diamond_echoes_3', {['en-us'] = {
        name = "Echoes ACT3",
        text = {
            {
                "If played hand contains a {C:attention}Flush{}",
                "each card scored gives {C:mult}+#1#{} Mult",
            },
            {
                "{C:attention}Stone Cards{} count as {C:attention}all suits{}",
                "and give {X:mult,C:white}X#2#{} Mult when scored",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_diamond_killer', {['en-us'] = {
        name = "Killer Queen",
        text = {
            {
                "Whenever you {C:attention}destroy{} a card,",
                "gain {C:chips}+#1#{} hand this Ante {C:inactive}({C:chips}+#2#{C:inactive})",
            },
            {
                "{C:stand}Evolves{} after destroying",
                "{C:attention}#3#{} cards {C:inactive}({C:attention}#4#{C:inactive}/#3#)"
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_diamond_killer_btd', {['en-us'] = {
        name = {
            "Killer Queen:",
            "Bites the Dust",
        },
        text = {
            "After your {C:attention}last card{} is scored,",
            "retrigger hand in {C:attention}reverse order{}"
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_vento_gold', {['en-us'] = {
        name = "Gold Experience",
        text = {
            {
                "{C:green}#1# in #2#{} chance for scored",
                "{V:1}#3#{} to become {C:attention}Gold Cards{}",
            },
            {
                "{C:stand}Evolves{} after using {C:tarot}The Arrow{}",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_vento_gold_requiem', {['en-us'] = {
        name = {
            "Gold Experience",
            "Requiem",
        },
        text = {
            "{C:green}#1# in #2#{} chance per scoring",
            "{C:attention}Gold Card{} to {C:planet}level up{}",
            "played {C:attention}poker hand{}",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_vento_moody', {['en-us'] = {
        name = "Moody Blues",
        text = {
            "{C:vhs}VHS Tapes{} have {C:attention}double{}",
            "the Running Time",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_vento_metallica', {['en-us'] = {
        name = "Metallica",
        text = {
            {
                "Played {C:attention}Jacks{} become {C:attention}Steel Cards{}",
            },
            {
                "{C:attention}Steel Jacks{} act as",
                "{C:attention}Glass Cards{} when scored",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_vento_epitaph', {['en-us'] = {
        name = "Epitaph",
        text = {
            {
                "{C:attention}Preview{} the top card of your deck",
            },
            {
                "{C:stand}Evolves{} after skipping {C:attention}#1#{} Blinds",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_vento_epitaph_king', {['en-us'] = {
        name = "King Crimson",
        text = {
            "Each selected {C:attention}Blind{} awards",
            "its {C:attention}skip tag{} when defeated"
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_vento_watchtower', {['en-us'] = {
        name = {
            "All Along The",
            "Watchtower",
        },
        text = {
            "{X:mult,C:white}X#1#{} Mult if deck is",
            "{C:attention}52{} cards, {C:attention}2-A{} for each suit"
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_stone_stone', {['en-us'] = {
        name = "Stone Free",
        text = {
            "Scoring {C:attention}Stone Cards{} lose",
            "their enhancement but",
            "permanently gain {C:chips}+#1#{} Chips"
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_stone_marilyn', {['en-us'] = {
        name = "Marilyn Manson",
        text = {
            {
                "Prevents {C:red}death{} by exchanging",
                "{C:money}$#1#{} for {C:attention}#2#%{} of Blind score",
            },
            {
                "If no {C:money}Money{}, sells random {C:attention}Jokers{}",
                "If no {C:attention}Jokers{}, sells random {C:attention}Playing Cards{}"
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_stone_white', {['en-us'] = {
        name = "Whitesnake",
        text = {
            {
                "{C:attention}Retrigger{} each played {C:attention}6{}",
            },
            {
                "{C:stand}Evolves{} after playing",
                "{C:attention}#1#{} scoring {C:attention}#2#s{}"
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_stone_white_moon', {['en-us'] = {
        name = "C-MOON",
        text = {
            {
                "{C:attention}Retrigger{} each played {C:attention}6{}",
                "{C:attention}Retrigger{} each played {C:attention}Straight{}",
            },
            {
                "{C:dark_edition,s:0.8}The time for Heaven has almost come...",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_stone_white_moon_detailed', {['en-us'] = {
        name = "C-MOON",
        text = {
            {
                "{C:attention}Retrigger{} each played {C:attention}6{}",
                "{C:attention}Retrigger{} each played {C:attention}Straight{}",
            },
            {
                "{C:stand}Evolves{} after using",
            "{C:attention}#1#{} {C:tarot}The Moon{} cards",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_stone_white_heaven', {['en-us'] = {
        name = "Made in Heaven",
        text = {
            "After {C:attention}playing{} or {C:attention}discarding{}",
            "a hand, gain a {C:blue}Hand{} or {C:red}Discard{}",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_steel_tusk_1', {['en-us'] = {
        name = "Tusk ACT1",
        text = {
            {
                "{C:dark_edition}Unlocks Fibonacci poker hands{}",
            },
            {
                "Each played {C:attention}Ace{} or {C:attention}2{} gives",
                "{C:chips}+#1#{} Chips when scored",
            },
            {
                "{C:stand}Evolves{} after {C:attention}#2#{}",
                "{C:attention}Aces{} or {C:attention}2s{} are scored",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_steel_tusk_2', {['en-us'] = {
        name = "Tusk ACT2",
        text = {
            {
                "{C:dark_edition}Unlocks Fibonacci poker hands{}",
            },
            {
                "Each played {C:attention}Ace{}, {C:attention}2{}, or {C:attention}3{} gives",
                "{C:chips}+#1#{} Chips when scored",
            },
            {
                "{C:stand}Evolves{} after {C:attention}#2#{} cards",
                "are {C:attention}destroyed{}",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_steel_tusk_3', {['en-us'] = {
        name = "Tusk ACT3",
        text = {
            {
                "{C:dark_edition}Unlocks Fibonacci poker hands{}",
            },
            {
                "Each played {C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, or {C:attention}5{}",
                "gives {C:chips}+#1#{} Chips when scored",
            },
            {
                "{C:stand}Evolves{} after defeating a {C:attention}Blind{}",
                "within {C:attention}#2#%{} of required chips",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_steel_tusk_4', {['en-us'] = {
        name = "Tusk ACT4",
        text = {
            {
                "{C:dark_edition}Unlocks Fibonacci poker hands{}",
            },
            {
                "Played Fibonacci {C:attention}ranks{} give",
                "{C:chips}+#1#{} Chips when scored",
            },
            {
                "If played hand contains a",
                "{C:attention}Fibonacci{}, gain {C:blue}+#2#{} Hand",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_steel_civil', {['en-us'] = {
        name = "Civil War",
        text = {
            "{C:tarot}The Fool{} and {C:tarot}The Emperor{}",
            "always create {C:tarot,T:c_hanged_man}#1#{}",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_steel_d4c', {['en-us'] = {
        name = {
            "Dirty Deeds Done",
            "Dirt Cheap",
        },
        text = {
            {
                "Your first scored {C:attention}Pair{}",
                "each round is {C:attention}destroyed{}",
            },
            {
                "{C:stand}Evolves{} after your deck",
                "contains {C:attention}#1# Lucky Cards {C:inactive}({}{C:attention}#2#{}{C:inactive}/#1#)",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_steel_d4c_love', {['en-us'] = {
        name = "D4C -Love Train-",
        text = {
            "All played {C:attention}Lucky Cards{}",
            "always payout at least {C:attention}once{}",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_lion_soft', {['en-us'] = {
        name = "Soft & Wet",
        text = {
            {
                "Scoring {C:attention}Bonus{} and {C:attention}Mult Cards{}",
                "lose their {C:attention}Enhancements{} but",
                "permanently gain {C:attention}half{} their",
                "Chip and Mult bonuses",
            },
            {
                "{C:stand}Evolves{} after playing a {C:attention}Secret Hand{}",
            }
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_lion_soft_beyond', {['en-us'] = {
        name = {
            "Soft & Wet:",
            "Go Beyond",
        },
        text = {
            "Scoring {C:attention}Bonus{} and {C:attention}Mult Cards{}",
            "lose their {C:attention}Enhancements{} but",
            "permanently gain {C:attention}all{} their",
            "Chip and Mult bonuses"
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_lion_paper', {['en-us'] = {
        name = "Paper Moon King",
        text = {
            "All {C:attention}face{} cards are",
            "considered {C:attention}#1#s{}",
            "{s:0.8}Rank changes at end of round",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_lion_rock', {['en-us'] = {
        name = "I Am a Rock",
        text = {
            "Add one {C:attention}Stone Card{} to deck",
            "every time a {C:attention}playing card",
            "is added to your deck",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_lion_wonder', {['en-us'] = {
        name = "Satoru Akefu",
        text = {
            "When a {C:attention}Lucky Card{} is scored,",
            "{C:attention}destroy{} it and gain {X:mult,C:white}X#1#{} Mult",
            "{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",

        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_lion_wonder_2', {['en-us'] = {
        name = "Satoru Akefu...?",
        text = {
            "When a {C:attention}Lucky Card{} is scored,",
            "{C:attention}destroy{} it and gain {X:mult,C:white}X#1#{} Mult",
            "{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",

        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_lion_wonder_3', {['en-us'] = {
        name = "Wonder of U",
        text = {
            "When a {C:attention}Lucky Card{} is scored,",
            "{C:attention}destroy{} it and gain {X:mult,C:white}X#1#{} Mult",
            "{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",

        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_lands_november', {['en-us'] = {
        name = "November Rain",
        text = {
            "All playing cards ranked",
            "{C:attention}#1# or lower{} are always",
            "scored and give {C:chips}+#2#{} Chips",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_lands_smooth', {['en-us'] = {
        name = "Smooth Operators",
        text = {
            "Before scoring, if an unscored card",
            "is an {C:attention}adjacent rank{} to a scored card,",
            "{C:attention}upgrade or downgrade{} it one rank",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'c_jojobal_lands_bigmouth', {['en-us'] = {
        name = "Smooth Operators",
        text = {
            "Before scoring, if an unscored card",
            "is an {C:attention}adjacent rank{} to a scored card,",
            "{C:attention}upgrade or downgrade{} it one rank",
        },
    }})



    ---------------------------
    --------------------------- Back
    ---------------------------
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'b_jojobal_stone_disc', {['en-us'] = {
        name = "DISC Deck",
        text = {
            "Start with the",
            "{C:stand}Foo Fighter{} voucher",
            "There is no {C:stand}Stand limit{}",
        },
        unlock = {
            "{C:attention}Evolve{} a {C:stand}Stand",
        },
    }})



    ---------------------------
    --------------------------- Sleeve
    ---------------------------
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'sleeve_jojobal_sleeve_stone_disc', {['en-us'] = {
        name = "DISC Sleeve",
        text = {
            "Start run with {C:tarot,T:v_crystal_ball}#1#{}",
            "There is no {C:stand}Stand{} limit",
        },
    }})
    SMODS.process_loc_text(G.localization.descriptions.Stand, 'sleeve_jojobal_sleeve_stone_disc_alt', {['en-us'] = {
        name = "DISC Sleeve",
        text = {
            "Start run with {C:stand,T:v_csau_foo}#1#{}",
        },
    }})
end)