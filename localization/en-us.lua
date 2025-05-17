return {
	misc = {
		poker_hands = {
			csau_Fibonacci = 'Fibonacci',
			csau_FlushFibonacci = 'Flush Fib',
		},
		poker_hand_descriptions = {
			csau_Fibonacci = {
				'5 cards that follow the Fibonacci sequence',
			},
			csau_FlushFibonacci = {
				"5 cards that follow the Fibonacci sequence",
				"with all cards sharing the same suit",
			}
		},
		labels = {
			csau_stand = "Stands",
		},
		dictionary = {
			stand_credits_direct = "Direction",
			stand_credits_artists = "Art",
			stand_credits_coding = "Programming",
			stand_credits_thanks = "Special Thanks",
			stand_credits_shaders = "Graphics",

			k_galaxy = "Galaxy",
			k_galaxy_q = "Galaxy?",

			k_csau_stand = "Stand",
			b_csau_stand_cards = "Stands",
			k_csau_evolved = "Evolved Stand",
			b_csau_evolved_cards = "Evolved Stands",
			k_stand_stickers = "Stand Stickers",

			stand_options_enableStands = 'Stands',
			stand_options_enableWipItems = "WIP Items",
			stand_options_enableConsumables = "Consumables",
			stand_options_enableDecks = "Decks",
			stand_options_enableVouchers = "Vouchers",
			stand_options_enableTags = "Tags",
			stand_options_sub = "(Restart required to apply)",

			-- badges
			ba_jojo = "JoJo's Bizarre Adventure",
			ba_phantom = 'Phantom Blood',
			ba_battle = 'Battle Tendency',
			ba_stardust = 'Stardust Crusaders',
			ba_diamond = 'Diamond is Unbreakable',
			ba_vento = 'Golden Wind',
			ba_feedback = 'Purple Haze Feedback',
			ba_stone = 'Stone Ocean',
			ba_steel = 'Steel Ball Run',
			ba_lion = 'JoJolion',
			ba_lands = 'The JOJOLands',
			

			-- stand related loc strings
			k_stand_evolved = 'Evolved!',
			k_stand_devolved = 'Devolved!',
			k_echoes_recorded = 'Recorded!',
			k_boing = "Boing!",
			k_metal = "Metal!",
			k_gold_exp = "Gold Experience!",
			k_stone_free = "Stone Free!",
			k_bsa = "Bigmouth Strikes Again!",
			k_smooth_operators = "Modified!",
		},
	},
	descriptions = {
		Other = {
			white_sticker={
				name="White Sticker",
				text={
					"Used this #1#",
					"to win on {C:attention}White",
					"{C:attention}Stake{} difficulty",
				},
			},
			red_sticker={
				name="Red Sticker",
				text={
					"Used this #1#",
					"to win on {C:attention}Red",
					"{C:attention}Stake{} difficulty",
				},
			},
			green_sticker={
				name="Green Sticker",
				text={
					"Used this #1#",
					"to win on {C:attention}Green",
					"{C:attention}Stake{} difficulty",
				},
			},
			black_sticker={
				name="Black Sticker",
				text={
					"Used this #1#",
					"to win on {C:attention}Black",
					"{C:attention}Stake{} difficulty",
				},
			},
			blue_sticker={
				name="Blue Sticker",
				text={
					"Used this #1#",
					"to win on {C:attention}Blue",
					"{C:attention}Stake{} difficulty",
				},
			},
			purple_sticker={
				name="Purple Sticker",
				text={
					"Used this #1#",
					"to win on {C:attention}Purple",
					"{C:attention}Stake{} difficulty",
				},
			},
			orange_sticker={
				name="Orange Sticker",
				text={
					"Used this #1#",
					"to win on {C:attention}Orange",
					"{C:attention}Stake{} difficulty",
				},
			},
			gold_sticker={
				name="Gold Sticker",
				text={
					"Used this #1#",
					"to win on {C:attention}Gold",
					"{C:attention}Stake{} difficulty",
				},
			},
			undiscovered_csau_stand = {
				name = "Not Discovered",
				text = {
					"Purchase this card in",
					"an unseeded run to",
					"learn what it does",
				},
			},
			csau_stand_info = {
				name = "Stand Limit",
				text = {
					"You can only",
					"have {C:attention}#1#{} {C:stand}#2#{}",
					"at a time",
				},
			},
			csau_stand_info_unlimited = {
				name = "Stand Limit",
				text = {
					"You can have",
					"as many {C:stand}Stands{}",
					"as you have",
					"consumable slots"
				},
			},

			csau_artistcredit = {
				name = "Artist",
				text = {
					"{E:1}#1#{}"
				},
			},
			csau_artistcredit_2 = {
				name = "Artists",
				text = {
					"{E:1}#1#{}",
					"{E:1}#2#{}"
				},
			},
		},
		Planet = {
			c_csau_planet_whirlpool = {
				name = "Whirlpool",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips",
				}
			},
			c_csau_planet_lost = {
				name = "Lost Galaxy",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips",
				}
			},
		},
		Tarot = {
			c_csau_tarot_arrow = {
				name = "The Arrow",
				text = {
					"Create a random {C:stand}Stand{}",
					"{C:inactive}(Must have room){}",
				}
			},
		},
		Spectral = {
			c_csau_spec_stone = {
				name = "Stone Mask",
				text = {
					"Add {C:dark_edition}Holographic{} and {C:attention}Eternal{}",
					"to a random Joker, overwriting",
					"existing {C:dark_edition}editions{} and {C:attention}stickers{}"
				}
			},
			c_csau_spec_diary = {
				name = "The Diary",
				text = {
					"Create a random",
					"{C:stand}Evolved Stand{}",
					"{C:inactive}(Must have room){}",
				}
			},
		},
		csau_Stand = {
			c_csau_stardust_star = {
				name = "Star Platinum",
				text = {
					"If {C:attention}first hand{} of round",
					"is all {V:1}#2#{}, gain {C:blue}+1{} Hand",
				},
			},
			c_csau_stardust_tohth = {
				name = "Tohth",
				text = {
					"{C:attention}Preview{} the top {C:attention}#1#{} cards in your deck{}",
				},
			},
			c_csau_stardust_world = {
				name = "DIO's World",
				text = {
					"If {C:attention}first hand{} of round",
					"is all {V:1}#2#{}, gain {C:blue}+1{} Hand",
				},
			},
			c_csau_diamond_crazy = {
				name = "Crazy Diamond",
				text = {
					"Played {C:attention}debuffed{} cards are {C:attention}healed{}",
				},
			},
			c_csau_diamond_hand = {
				name = "The Hand",
				text = {
					"Whenever a card is {C:attention}destroyed{},",
					"give adjacent cards the same",
					"{C:attention}rank{}, {C:attention}suit{}, and {C:attention}enhancement{}",
				},
			},
			c_csau_diamond_echoes_1 = {
				name = "Echoes ACT1",
				text = {
					"If {C:attention}first hand{} of round",
					"has only {C:attention}#1#{} card, cards",
					"with matching {C:attention}suit{} give",
					"{C:mult}+#2#{} Mult when scored",
					"{C:inactive}(Current suit:{} {V:1}#4#{}{C:inactive})",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after {C:attention}#3#{} rounds",
				},
			},
			c_csau_diamond_echoes_2 = {
				name = "Echoes ACT2",
				text = {
					"If {C:attention}first hand{} of round",
					"has only {C:attention}#1#{} card, cards",
					"with matching {C:attention}suit{} give",
					"{C:mult}+#2#{} Mult when scored",
					"The first {C:attention}non-matching{}",
					"card turns into that suit",
					"{C:inactive}(Current suit:{} {V:1}#4#{}{C:inactive})",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after {C:attention}#3#{} rounds",
				},
			},
			c_csau_diamond_echoes_3 = {
				name = "Echoes ACT3",
				text = {
					"If played hand contains a {C:attention}Flush{}",
					"each card scored gives {C:mult}+#1#{} Mult",
					"{C:attention}Stone Cards{} count as {C:attention}all suits{}",
					"and give {X:mult,C:white}X#2#{} Mult when scored",
				},
			},
			c_csau_diamond_killer = {
				name = "Killer Queen",
				text = {
					"Whenever you {C:attention}destroy{} a card,",
					"gain {C:chips}+#1#{} hand this Ante {C:inactive}({C:chips}+#2#{C:inactive})",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after destroying {C:attention}#3#{} cards {C:inactive}({C:attention}#4#{C:inactive}/#3#)"
				},
			},
			c_csau_diamond_killer_btd = {
				name = "Killer Queen: Bites the Dust",
				text = {
					"After your {C:attention}last card{} is scored,",
					"retrigger the others in {C:attention}reverse order{}"
				},
			},
			c_csau_vento_gold = {
				name = "Gold Experience",
				text = {
					"{C:green}#1# in #2#{} chance for scored {V:1}#3#{}",
					"to become {C:attention}Gold Cards{}",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after using {C:tarot}The Arrow{}",
				},
			},
			c_csau_vento_gold_requiem = {
				name = "Gold Experience Requiem",
				text = {
					"{C:green}#1# in #2#{} chance to {C:planet}level up{} played {C:attention}poker hand{}",
					"{s:0.1} {}",
					"Each scoring {C:attention}Gold Card{} increases odds by {C:green}#3#{}",
				},
			},
			c_csau_vento_moody = {
				name = "Moody Blues",
				text = {
					"{C:vhs}VHS Tapes{} have {C:attention}double{}",
					"the Running Time",
				},
			},
			c_csau_vento_metallica = {
				name = "Metallica",
				text = {
					"Played {C:attention}Jacks{} become {C:attention}Steel Cards{}",
					"{s:0.1} {}",
					"{C:attention}Steel Jacks{} act as {C:attention}Glass Cards{} when played",
				},
			},
			c_csau_vento_epitaph = {
				name = "Epitaph",
				text = {
					"{C:attention}Preview{} the top card of your deck",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after skipping {C:attention}#1#{} Blinds",
				},
			},
			c_csau_vento_epitaph_king = {
				name = "King Crimson",
				text = {
					"Each selected {C:attention}Blind{} awards",
					"its {C:attention}skip tag{} when defeated"
				},
			},
			c_csau_vento_watchtower = {
				name = "All Along Watchtower",
				text = {
					"{X:mult,C:white}X#1#{} Mult if deck is {C:attention}52{} cards,",
					"{C:attention}2-A{} for each suit"
				},
			},
			c_csau_stone_stone = {
				name = "Stone Free",
				text = {
					"Scoring {C:attention}Stone Cards{} lose",
					"their enhancement but",
					"permanently gain {C:chips}+#1#{} Chips"
				},
			},
			c_csau_stone_marilyn = {
				name = "Marilyn Manson",
				text = {
					"Prevents {C:red}death{} by exchanging",
					"{C:money}$#1#{} for {C:attention}#2#%{} of Blind score",
					"If no {C:money}Money{}, sells random {C:attention}Jokers{}",
					"If no {C:attention}Jokers{}, sells random {C:attention}Playing Cards{}"
				},
			},
			c_csau_stone_white = {
				name = "Whitesnake",
				text = {
					"{C:attention}Retrigger{} each played {C:attention}6{}",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after playing",
					"{C:attention}#1#{} scoring {C:attention}#2#s{}"
				},
			},
			c_csau_stone_white_moon = {
				name = "C-MOON",
				text = {
					"{C:attention}Retrigger{} each played {C:attention}6{}",
					"{C:attention}Retrigger{} each played {C:attention}Straight{}",
					"{s:0.1} {}",
					"{C:dark_edition,s:0.8}The time for Heaven has almost come...",
				},
			},
			c_csau_stone_white_moon_detailed = {
				name = "C-MOON",
				text = {
					"{C:attention}Retrigger{} each played {C:attention}6{}",
					"{C:attention}Retrigger{} each played {C:attention}Straight{}",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after using {C:attention}#1#{} {C:tarot}The Moon{} cards",
				},
			},
			c_csau_stone_white_heaven = {
				name = "Made in Heaven",
				text = {
					"After {C:attention}playing{} or {C:attention}discarding{}",
					"a hand, gain a {C:blue}Hand{} or {C:red}Discard{}",
				},
			},
			c_csau_steel_tusk_1 = {
				name = "Tusk ACT1",
				text = {
					"Each played {C:attention}Ace{} or {C:attention}2{} gives",
					"{C:chips}+#1#{} Chips when scored",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after {C:attention}#2#{}",
					"{C:attention}Aces{} or {C:attention}2s{} are scored",
				},
			},
			c_csau_steel_tusk_2 = {
				name = "Tusk ACT2",
				text = {
					"Each played {C:attention}Ace{}, {C:attention}2{}, or {C:attention}3{} gives",
					"{C:chips}+#1#{} Chips when scored",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after {C:attention}#2#{} cards",
					"are {C:attention}destroyed{}",
				},
			},
			c_csau_steel_tusk_3 = {
				name = "Tusk ACT3",
				text = {
					"Each played {C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, or {C:attention}5{}",
					"gives {C:chips}+#1#{} Chips when scored",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after defeating a {C:attention}Blind{}",
					"within {C:attention}#2#%{} of required chips",
				},
			},
			c_csau_steel_tusk_4 = {
				name = "Tusk ACT4",
				text = {
					"{C:dark_edition}Unlocks Fibonacci poker hands{}",
					"{C:inactive}(ex: {C:attention}8 5 3 2 A{C:inactive})",
					"{s:0.1} {}",
					"Played Fibonacci {C:attention}ranks{} give",
					"{C:chips}+#1#{} Chips when scored",
					"{s:0.1} {}",
					"If played hand contains a",
					"{C:attention}Fibonacci{}, gain {C:blue}+#2#{} Hand",
				},
			},
			c_csau_steel_civil = {
				name = "Civil War",
				text = {
					"{C:tarot}The Fool{} and {C:tarot}The Emperor{}",
					"always create {C:tarot,T:c_hanged_man}#1#{}",
				},
			},
			c_csau_steel_d4c = {
				name = "Dirty Deeds Done Dirt Cheap",
				text = {
					"Your first scored {C:attention}Pair{}",
					"each round is {C:attention}destroyed{}",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after your deck",
					"contains {C:attention}#1# Lucky Cards {C:inactive}({}{C:attention}#2#{}{C:inactive}/#1#)",
				},
			},
			c_csau_steel_d4c_love = {
				name = "D4C -Love Train-",
				text = {
					"All played {C:attention}Lucky Cards{}",
					"always payout at least {C:attention}once{}",
				},
			},
			c_csau_lion_soft = {
				name = "Soft & Wet",
				text = {
					"Scoring {C:attention}Bonus{}/{C:attention}Mult Cards{}",
					"lose their enhancements but",
					"permanently gain {C:attention}half{} their",
					"enhancements' bonuses",
					"{s:0.1} {}",
					"{C:stand}Evolves{} after playing a {C:attention}Secret Hand{}",
				},
			},
			c_csau_lion_soft_beyond = {
				name = "Soft & Wet: Go Beyond",
				text = {
					"Scoring {C:attention}Bonus{}/{C:attention}Mult Cards{}",
					"lose their enhancements but",
					"permanently gain {C:attention}all{} of",
					"their enhancements' bonuses"
				},
			},
			c_csau_lion_paper = {
				name = "Paper Moon King",
				text = {
					"All {C:attention}face{} cards are",
					"considered {C:attention}#1#s{}",
					"{s:0.8}Rank changes at end of round",
					
				},
			},
			c_csau_lion_rock = {
				name = "I Am a Rock",
				text = {
					"Add one {C:attention}Stone Card{} to deck",
					"every time a {C:attention}playing card",
					"is added to your deck",
				},
			},
			c_csau_lion_wonder= {
				name = "Wonder of U",
				text = {
					"When a {C:attention}Lucky Card{} is scored,",
					"{C:attention}destroy{} it and gain {X:mult,C:white}X#1#{} Mult",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					
				},
			},
			c_csau_lands_november = {
				name = "November Rain",
				text = {
					"All playing cards ranked",
					"{C:attention}#1# or lower{} are always",
					"scored and give {C:chips}+#2#{} Chips",
				},
			},
			c_csau_lands_smooth = {
				name = "Smooth Operators",
				text = {
					"Before scoring, if an unscored card",
					"is an {C:attention}adjacent rank{} to a scored card,",
					"{C:attention}upgrade or downgrade{} it one rank",
				},
			},
			c_csau_lands_bigmouth = {
				name = "Bigmouth Strikes Again",
				text = {
					"{C:attention}Flushes{} may be made with {C:attention}4{} cards",
					"If a fifth is played with a different suit,",
					"{C:attention}transform{} it into the {C:attention}Flush's suit{}",
				},
			},
		},
		Back = {
			b_csau_disc = {
				name = "DISC Deck",
				text = {
					"Start with the",
					"{C:tarot}Crystal Ball{} voucher",
					"There is no {C:stand}Stand{} limit",
				},
				unlock = {
					"{C:attention}Evolve{} a {C:stand}Stand",
				},
			},
		},
		Voucher = {
			v_csau_foo = {
				name = 'Foo Fighter',
				text = {
					"{C:stand}Stands{} can be purchased",
					"from the {C:attention}shop{}"
				}
			},
			v_csau_plant = {
				name = 'Plant Appraiser',
				text = {
					"{C:stand}Evolved Stands{} can be purchased",
					"from the {C:attention}shop{}"
				},
				unlock = {
					"Buy a total of",
					"{C:attention}#1#{} {C:stand}Stands",
					"from the shop",
					"{C:inactive}(#2#)",
				},
			},
		},
		Tag = {
			tag_csau_spirit = {
				name = "Spirit Tag",
				text = {
					"Create a random {C:stand}Stand",
					"{C:inactive}(Must have room)",
				},
			},
		}
	}
}