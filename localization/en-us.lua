return {
	misc = {
		poker_hands = {
			jojobal_Fibonacci = 'Fibonacci',
			jojobal_FlushFibonacci = 'Flush Fibonacci',
		},
		poker_hand_descriptions = {
			jojobal_Fibonacci = {
				"5 cards that make a Fibonacci sequence",
				"(each card's rank is the sum of the",
				"two ranks that precede it)"
			},
			jojobal_FlushFibonacci = {
				"5 cards making a Fibonacci sequence",
				"(each card's rank is the sum of the",
				"two ranks that precede it), with",
				"all cards sharing the same suit",
			}
		},
		dictionary = {
			jojobal_credits_direct = "Direction",
			jojobal_credits_artists = "Art",
			jojobal_credits_coding = "Programming",
			jojobal_credits_thanks = "Special Thanks",
			jojobal_credits_shaders = "Graphics",

			k_galaxy = "Galaxy",
			k_galaxy_q = "Galaxy?",

			jojobal_options_enable_Stands = 'Stands',
			jojobal_options_enable_Jokers = 'Jokers',
			jojobal_options_enable_Consumables = "Consumables",
			jojobal_options_enable_Decks = "Decks",
			jojobal_options_enable_Vouchers = "Vouchers",
			jojobal_options_enable_Tags = "Tags",
			jojobal_options_sub = "(Restart required to apply)",

			-- badge names for jojo parts
			ba_jojo = "Jojo's Bizarre Adventure",
			ba_phantom = 'Phantom Blood',
			ba_battle = 'Battle Tendency',
			ba_stardust = 'Stardust Crusaders',
			ba_diamond = 'Diamond is Unbreakable',
			ba_vento = 'Golden Wind',
			ba_stone = 'Stone Ocean',
			ba_steel = 'Steel Ball Run',
			ba_lion = 'JoJolion',
			ba_lands = 'The JOJOLands',
			ba_feedback = 'Purple Haze Feedback',

			-- stand related loc strings
			k_stand_evolved = 'Evolved!',
			k_echoes_recorded = 'Recorded!',
			k_iamarock = "Rock!",
			k_boing = "Boing!",
			k_metal = "Metal!",
			k_gold_exp = "Gold Experience!",
			k_stone_free = "Stone Free!",
			k_bsa = "Bigmouth Strikes Again!",
			k_smooth_operators = "Dragged!",
			k_soft_and_wet = "Stolen!",
			k_bites_the_dust = "Bites the Dust!",
			k_thehand = "Swipe!",
			k_stand_stickers = "Stand Stickers",
			k_plus_hand = "+1 Hand",
		},
		v_dictionary = {
			a_multilevel = "Level Up X#1#!",
			a_plus_discard = "+#1# Discard",
		},
	},
	descriptions = {
		Joker = {
			j_jojobal_jojo_gravity = {
				name = "Gravity",
				text = {
					"This Joker gains {C:mult}+#1#{} Mult every",
					"round you have a {C:stand}Stand{},",
					"resets when a {C:stand}Stand{} is",
					"{C:attention}sold{} or {C:attention}destroyed{}",
					"{C:inactive}(Currently {}{C:mult}+#2#{}{C:inactive} Mult{}{C:inactive}){}",
				},
			},
			j_jojobal_jojo_jokerdrive = {
				name = "Jokerdrive",
				text = {
					"{C:mult}+#1#{} Mult if you",
					"do not have a {C:stand}Stand{}",
				},
			},
			j_jojobal_jojo_photodad = {
				name = "Photodad",
				text = {
					"When {C:attention}final hand{} of round",
					"is played, create {C:tarot}The Arrow{}",
					"{C:inactive}(Must have room)",
				},
			},
			j_jojobal_jojo_no2 = {
				name = "No. 2 Joker",
				text = {
					"All {C:stand}Stands{} retrigger",
					"{C:inactive}(if applicable){}"
				},
			},
			j_jojobal_jojo_sotw = {
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
			},
		},
		Planet = {
			c_jojobal_planet_whirlpool = {
				name = "Whirlpool",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips",
				}
			},
			c_jojobal_planet_lost = {
				name = "Lost Galaxy",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips",
				}
			},
		},
		Spectral = {
			c_jojobal_spec_mask = {
				name = "Stone Mask",
				text = {
					"Add {C:dark_edition}Holographic{} and {C:attention}Eternal{}",
					"to a random Joker, overwriting",
					"existing {C:dark_edition}editions{} and {C:attention}stickers{}"
				}
			},
		},
		Stand = {
			c_jojobal_stardust_star = {
				name = "Star Platinum",
				text = {
					"If {C:attention}first hand{} of round",
					"is all {V:1}#2#{}, gain {C:blue}+1{} Hand",
				},
			},
			c_jojobal_stardust_tohth = {
				name = "Tohth",
				text = {
					"{C:attention}Preview{} the top {C:attention}#1#{}",
					" cards in your deck{}",
				},
			},
			c_jojobal_stardust_world = {
				name = "DIO's World",
				text = {
					"If {C:attention}first hand{} of round",
					"is all {V:1}#2#{}, gain {C:blue}+1{} Hand",
				},
			},
			c_jojobal_diamond_crazy = {
				name = "Crazy Diamond",
				text = {
					"Played {C:attention}debuffed{} cards",
					"are {C:attention}healed{}",
				},
			},
			c_jojobal_diamond_hand = {
				name = "The Hand",
				text = {
					"Whenever a card is {C:attention}destroyed{},",
					"give adjacent cards the same",
					"{C:attention}rank{}, {C:attention}suit{}, and {C:attention}enhancement{}",
				},
			},
			c_jojobal_diamond_echoes_1 = {
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
			},
			c_jojobal_diamond_echoes_2 = {
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
			},
			c_jojobal_diamond_echoes_3 = {
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
			},
			c_jojobal_diamond_killer = {
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
			},
			c_jojobal_diamond_killer_btd = {
				name = {
					"Killer Queen:",
					"Bites the Dust",
				},
				text = {
					"After your {C:attention}last card{} is scored,",
					"retrigger hand in {C:attention}reverse order{}"
				},
			},
			c_jojobal_vento_gold = {
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
			},
			c_jojobal_vento_gold_requiem = {
				name = {
					"Gold Experience",
					"Requiem",
				},
				text = {
					"{C:green}#1# in #2#{} chance per scoring",
					"{C:attention}Gold Card{} to {C:planet}level up{}",
					"played {C:attention}poker hand{}",
				},
			},
			c_jojobal_vento_moody = {
				name = "Moody Blues",
				text = {
					"{C:vhs}VHS Tapes{} have {C:attention}double{}",
					"the Running Time",
				},
			},
			c_jojobal_vento_metallica = {
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
			},
			c_jojobal_vento_epitaph = {
				name = "Epitaph",
				text = {
					{
						"{C:attention}Preview{} the top card of your deck",
					},
					{
						"{C:stand}Evolves{} after skipping {C:attention}#1#{} Blinds",
					}
				},
			},
			c_jojobal_vento_epitaph_king = {
				name = "King Crimson",
				text = {
					"Each selected {C:attention}Blind{} awards",
					"its {C:attention}skip tag{} when defeated"
				},
			},
			c_jojobal_vento_watchtower = {
				name = {
					"All Along The",
					"Watchtower",
				},
				text = {
					"{X:mult,C:white}X#1#{} Mult if deck is",
					"{C:attention}52{} cards, {C:attention}2-A{} for each suit"
				},
			},
			c_jojobal_stone_stone = {
				name = "Stone Free",
				text = {
					"Scoring {C:attention}Stone Cards{} lose",
					"their enhancement but",
					"permanently gain {C:chips}+#1#{} Chips"
				},
			},
			c_jojobal_stone_marilyn = {
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
			},
			c_jojobal_stone_white = {
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
			},
			c_jojobal_stone_white_moon = {
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
			},
			c_jojobal_stone_white_moon_detailed = {
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
			},
			c_jojobal_stone_white_heaven = {
				name = "Made in Heaven",
				text = {
					"After {C:attention}playing{} or {C:attention}discarding{}",
					"a hand, gain a {C:blue}Hand{} or {C:red}Discard{}",
				},
			},
			c_jojobal_steel_tusk_1 = {
				name = "Tusk ACT1",
				text = {
					{
						"Each played {C:attention}Ace{} or {C:attention}2{} gives",
						"{C:chips}+#1#{} Chips when scored",
					},
					{
						"{C:stand}Evolves{} after {C:attention}#2#{}",
						"{C:attention}Aces{} or {C:attention}2s{} are scored",
					}
				},
			},
			c_jojobal_steel_tusk_2 = {
				name = "Tusk ACT2",
				text = {
					{
						"Each played {C:attention}Ace{}, {C:attention}2{}, or {C:attention}3{} gives",
						"{C:chips}+#1#{} Chips when scored",
					},
					{
						"{C:stand}Evolves{} after {C:attention}#2#{} cards",
						"are {C:attention}destroyed{}",
					}
				},
			},
			c_jojobal_steel_tusk_3 = {
				name = "Tusk ACT3",
				text = {
					{
						"Each played {C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, or {C:attention}5{}",
						"gives {C:chips}+#1#{} Chips when scored",
					},
					{
						"{C:stand}Evolves{} after defeating a {C:attention}Blind{}",
						"within {C:attention}#2#%{} of required chips",
					}
				},
			},
			c_jojobal_steel_tusk_4 = {
				name = "Tusk ACT4",
				text = {
					{
						"{C:dark_edition}Unlocks Fibonacci poker hands{}",
						"{C:inactive}(ex: {C:attention}8 5 3 2 A{C:inactive})",
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
			},
			c_jojobal_steel_civil = {
				name = "Civil War",
				text = {
					"{C:tarot}The Fool{} and {C:tarot}The Emperor{}",
					"always create {C:tarot,T:c_hanged_man}#1#{}",
				},
			},
			c_jojobal_steel_d4c = {
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
			},
			c_jojobal_steel_d4c_love = {
				name = "D4C -Love Train-",
				text = {
					"All played {C:attention}Lucky Cards{}",
					"always payout at least {C:attention}once{}",
				},
			},
			c_jojobal_lion_soft = {
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
			},
			c_jojobal_lion_soft_beyond = {
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
			},
			c_jojobal_lion_paper = {
				name = "Paper Moon King",
				text = {
					"All {C:attention}face{} cards are",
					"considered {C:attention}#1#s{}",
					"{s:0.8}Rank changes at end of round",
				},
			},
			c_jojobal_lion_rock = {
				name = "I Am a Rock",
				text = {
					"Add one {C:attention}Stone Card{} to deck",
					"every time a {C:attention}playing card",
					"is added to your deck",
				},
			},
			c_jojobal_lion_wonder= {
				name = "Wonder of U",
				text = {
					"When a {C:attention}Lucky Card{} is scored,",
					"{C:attention}destroy{} it and gain {X:mult,C:white}X#1#{} Mult",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					
				},
			},
			c_jojobal_lands_november = {
				name = "November Rain",
				text = {
					"All playing cards ranked",
					"{C:attention}#1# or lower{} are always",
					"scored and give {C:chips}+#2#{} Chips",
				},
			},
			c_jojobal_lands_smooth = {
				name = "Smooth Operators",
				text = {
					"Before scoring, if an unscored card",
					"is an {C:attention}adjacent rank{} to a scored card,",
					"{C:attention}upgrade or downgrade{} it one rank",
				},
			},
			c_jojobal_lands_bigmouth = {
				name = "Bigmouth Strikes Again",
				text = {
					{
						"{C:attention}Flushes{} may be made with {C:attention}4{} cards",
					},
					{
						"All additional cards or {C:attention}Wild Cards{} will",
						"{C:attention}transform{} into the {C:attention}Flush's suit{}",
					}
				},
			},
		},
		Back = {
			b_jojobal_stone_disc = {
				name = "DISC Deck",
				text = {
					"Start with the",
					"{C:stand}Foo Fighter{} voucher",
					"There is no {C:stand}Stand limit{}",
				},
				unlock = {
					"{C:attention}Evolve{} a {C:stand}Stand",
				},
			},
		},
	}
}
