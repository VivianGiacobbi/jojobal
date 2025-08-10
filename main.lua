jojobal_config = SMODS.current_mod.config
jojobal_enabled = copy_table(jojobal_config)

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

ArrowAPI.credits.add_credits(SMODS.current_mod, {
	['gote'] = "BarrierTrio/Gote",
	['cejai'] = "SagaciousCejai",
	['eremel'] = "Eremel",
	['keku'] = "Keku",
	['guff'] = "GuffNFluff",
	['wario'] = "MightyKingWario",
	['rerun'] = "KawaiiRerun",
	['vivi'] = "Vivian Giacobbi",
	['gameboy'] = "Sir. Gameboy",
	['chvsau'] = "chvsau",
	['dolos'] = "Dolos",
	['stup'] = 'Stupisms',
	['reda'] = 'Redastrin',
	['araki'] = 'Hirohiko Araki',
	['luckyland'] = 'Lucky Land Communications',
})

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