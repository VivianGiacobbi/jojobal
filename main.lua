if #SMODS.find_mod('Cardsauce') > 0 then
	G.has_csau = SMODS.find_mod('Cardsauce')[1]
	if not G.has_csau.can_load thenG.has_csau = nil end
end
if G.has_csau and G.has_csau.can_load then
	local init, error = NFS.load(SMODS.current_mod.path .. "includes/ui.lua")
	if error then sendErrorMessage("[Stands] Failed to load 'ui' with error "..error) else
		init()
		sendDebugMessage("[Stands] Loaded module: 'ui'")
	end
    return
end

stand_config = SMODS.current_mod.config
stand_enabled = copy_table(stand_config)

SMODS.optional_features.quantum_enhancements = true
SMODS.optional_features.cardareas.unscored = true

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