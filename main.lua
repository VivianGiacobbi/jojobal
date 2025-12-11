if JojobalMod then
	sendDebugMessage('[Jojobal] already provided. Skipping...')
	return
end

JojobalMod = SMODS.current_mod
JojobalMod.current_config = copy_table(JojobalMod.config)

SMODS.current_mod.optional_features = {
	retrigger_joker = true,
	quantum_enhancements = true,
}

ArrowAPI.ui.add_badge_colors(SMODS.current_mod, {
	co_jojo = G.C.STAND,
    te_jojo = HEX('FFFFFF'),
	co_uzumaki = HEX('374244'),
    te_uzumaki = HEX('bfc7d5'),
	co_phantom = HEX('245482'),
	te_phantom = HEX('eee4a6'),
	co_battle = HEX('DD5668'),
	te_battle = HEX('338FC4'),
	co_stardust = HEX('425F7C'),
	te_stardust = HEX('EFCB70'),
	co_diamond = HEX('BEE5E5'),
	te_diamond = HEX('C479BE'),
	co_vento = HEX('EDCE49'),
	te_vento = HEX('D168BC'),
	co_feedback = HEX('7e2786'),
	te_feedback = HEX('fe9818'),
	co_stone = HEX('0076b2'),
	te_stone = HEX('97c348'),
	co_steel = HEX('A38168'),
	te_steel = HEX('A9CF3C'),
	co_lion = HEX('dcf5fc'),
	te_lion = HEX('7832c4'),
	co_lands = HEX('394E90'),
	te_lands = HEX('409CE8'),
})

ArrowAPI.config_tools.use_credits(JojobalMod, {
    matrix = {col = 20, row = 16},
    {
        key = 'direction',
        title_colour = G.C.YELLOW,
        pos_start = {col = 0, row = 0},
        pos_end = {col = 5, row = 16},
        contributors = {
            ["BarrierTrio/Gote"] = true,
			["Kekulism"] = true,
            ["Vivian Giacobbi"] = true,
        }
    },
    {
        key = 'artist',
        title_colour = G.C.ETERNAL,
        pos_start = {col = 5, row = 0},
        pos_end = {col = 12, row = 16}
    },
    {
        key = 'programmer',
        title_colour = G.C.GOLD,
        pos_start = {col = 12, row = 0},
        pos_end = {col = 16, row = 10},
    },
    {
        key = 'shader',
        title_colour = G.C.DARK_EDITION,
        pos_start = {col = 16, row = 0},
        pos_end = {col = 20, row = 10},
        contributors = {
            ["Vivian Giacobbi"] = true,
        }
    },
    {
        key = 'special',
        title_colour = G.C.GREEN,
        pos_start = {col = 12, row = 10},
        pos_end = {col = 20, row = 16},
        contributors = {
            ["Hirohiko Araki"] = true,
            ["LuckyLand Communications"] = true,
        }
    },
})

ArrowAPI.game.add_game_globals_func(Cardsauce, function(run_start)
    jojobal_reset_paper_rank()
end)

local includes = {
	-- object hooks
	'hooks/card',
	'hooks/misc_functions',
	'hooks/smods',

	'ui',
	'items',
}

for _, module in ipairs(includes) do
	local init, error = NFS.load(SMODS.current_mod.path .. "includes/" .. module ..".lua")
	if error then sendErrorMessage("[Stands] Failed to load "..module.." with error "..error) else
		init()
		sendDebugMessage("[Stands] Loaded module: " .. module)
	end
end