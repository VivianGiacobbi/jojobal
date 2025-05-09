G.has_csau = SMODS.find_mod('Cardsauce')

local min_load = {
	'ui',
	'tables'
}
if next(G.has_csau) and G.has_csau[1].can_load then
	for i, v in ipairs(min_load) do
		local init, error = NFS.load(SMODS.current_mod.path .. "includes/"..v..".lua")
		if error then sendErrorMessage("[Stands] Failed to load '"..v.."' with error "..error) else
			init()
			sendDebugMessage("[Stands] Loaded module: '"..v.."'")
		end
	end
    return
end

stand_config = SMODS.current_mod.config
stand_enabled = copy_table(stand_config)

SMODS.current_mod.optional_features = {
	retrigger_joker = true,
	post_trigger = true,
	quantum_enhancements = true,
	cardareas = {
		deck = true,
		discard = true,
	},
}

G.C.STAND = SMODS.current_mod.badge_colour

local includes = {
	-- includes utility functions required for following files
	'tables',
	'utility',
	'shaders',
	'compat',

	-- object hooks
	'hooks/card',
	'hooks/cardarea',
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