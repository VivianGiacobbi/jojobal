jojobal_config = SMODS.current_mod.config
jojobal_enabled = copy_table(jojobal_config)

SMODS.current_mod.optional_features = {
	retrigger_joker = true,
	quantum_enhancements = true,
}

G.C.STAND = SMODS.current_mod.badge_colour

local includes = {
	-- includes utility functions required for following files
	'tables',
	'utility',
	'compat',

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