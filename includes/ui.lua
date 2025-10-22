-- Mod Icon in Mods tab
SMODS.Atlas({
	key = "modicon",
	path = "stand_icon.png",
	px = 32,
	py = 32
})

if JojobalMod.current_config['enable_Title'] then
	local file_data = assert(NFS.newFileData(JojobalMod.path..'assets/'..G.SETTINGS.GRAPHICS.texture_scaling..'x/jojobal_title_alt.png'),
		('Failed to collect file data for Atlas %s'):format('jojobal_title'))
	local image_data = assert(love.image.newImageData(file_data),
		('Failed to initialize image data for Atlas %s'):format('jojobal_title'))
		sendDebugMessage('jojobal title replacement')
	G.ASSET_ATLAS['balatro'] = {
		name = 'balatro',
		image = love.graphics.newImage(image_data, {mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling}),
		px = 489,
		py = 216,
	}
end

JojobalMod.config_tab = function()
	local ordered_config = {
		'enable_Stands',
		'enable_Jokers',
		'enable_Decks',
		'enable_Consumables',
		'enable_Vouchers',
		'enable_Tags',
		'enable_Title',
	}
	local left_settings = { n = G.UIT.C, config = { align = "tm" }, nodes = {} }
	local right_settings = { n = G.UIT.C, config = { align = "tm" }, nodes = {} }
	local left_count = 0
	local right_count = 0

	for i, k in ipairs(ordered_config) do
		if right_count < left_count then
			local main_node = create_toggle({
				label = localize("jojobal_options_"..ordered_config[i]),
				w = 1,
				ref_table = JojobalMod.config,
				ref_value = ordered_config[i],
				callback = G.FUNCS.jojobal_restart
			})
			main_node.config.align = 'tr'
			main_node.nodes[#main_node.nodes+1] = { n = G.UIT.C, config = { minw = 0.25, align = "cm" } }
			right_settings.nodes[#right_settings.nodes + 1] = main_node
			right_count = right_count + 1
		else
			local main_node = create_toggle({
				label = localize("jojobal_options_"..ordered_config[i]),
				w = 1,
				ref_table = JojobalMod.config,
				ref_value = ordered_config[i],
				callback = G.FUNCS.jojobal_restart
			})
			main_node.config.align = 'tr'
			main_node.nodes[#main_node.nodes+1] = { n = G.UIT.C, config = { minw = 0.25, align = "cm" } }
			left_settings.nodes[#left_settings.nodes + 1]  = main_node
			left_count = left_count + 1
		end
	end

	local jojobal_config_ui = { n = G.UIT.R, config = { align = "tm", padding = 0.25 }, nodes = { left_settings, right_settings } }
	return {
		n = G.UIT.ROOT,
		config = {
			emboss = 0.05,
			minh = 6,
			r = 0.1,
			minw = 10,
			align = "cm",
			padding = 0.05,
			colour = G.C.BLACK,
		},
		nodes = {
			jojobal_config_ui
		}
	}
end


local header_scale = 1.1
local bonus_padding = 1.15
local support_padding = 0.015
local artist_size = 0.5
local special_thanks_mod = 1
local special_thanks_padding = 0
local artist_padding = 0.03
local coding_scale = 0.90
local shader_scale = 0.9
local text_scale = 0.98

JojobalMod.credits_tab = function()
	chosen = true
	return {n=G.UIT.ROOT, config={align = "cm", padding = 0.2, colour = G.C.BLACK, r = 0.1, emboss = 0.05, minh = 6, minw = 10}, nodes={
		{n = G.UIT.C, config = { align = "tm", padding = 0.2 }, nodes = {
			{n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
				{n=G.UIT.T, config={text = localize("b_credits"), scale = text_scale*1.2, colour = G.C.GREEN, shadow = true}},
			}},
			{n=G.UIT.R, config={align = "cm", padding = 0.05,outline_colour = G.C.GREEN, r = 0.1, outline = 1}, nodes= {
				{n=G.UIT.C, config={align = "cm", padding = 0.1, r = 0.1}, nodes={
					{n=G.UIT.C, config={align = "cm", padding = 0}, nodes={
						{n=G.UIT.R, config={align = "cm", padding = 0.1, minh = 6.2, outline_colour = G.C.JOKER_GREY, r = 0.1, outline = 1}, nodes={
							{n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
								{n=G.UIT.T, config={text = localize('jojobal_credits_direct'), scale = header_scale * 0.6, colour = G.C.GOLD, shadow = true}},
							}},
							{n=G.UIT.R, config={align = "cm", padding = 0}, nodes= {
								{n=G.UIT.R, config={align = "tm", padding = 0.1}, nodes={
									{n=G.UIT.T, config={text = ArrowAPI.credits['jojobal'].gote, scale = text_scale*0.55, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
								}},
								{n=G.UIT.R, config={align = "tm", padding = 0.1}, nodes={
									{n=G.UIT.T, config={text = ArrowAPI.credits['jojobal'].keku, scale = text_scale*0.55, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
								}},
								{n=G.UIT.R, config={align = "tm", padding = 0.1}, nodes={
									{n=G.UIT.T, config={text = ArrowAPI.credits['jojobal'].vivi, scale = text_scale*0.55, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
								}},
							}},
						}},
					}},
				}},
				{n=G.UIT.C, config={align = "tm", padding = 0.1, r = 0.1}, nodes= {
					{ n = G.UIT.C, config = { align = "cm", padding = 0.1 * bonus_padding, minh = 6.140, outline_colour = G.C.JOKER_GREY, r = 0.1, outline = 1 }, nodes = {
						{ n = G.UIT.R, config = { align = "cm", padding = 0 }, nodes = {
							{ n = G.UIT.T, config = { text = localize('jojobal_credits_artists'), scale = header_scale * 0.6, colour = HEX('f75294'), shadow = true } },
						}},
						{n=G.UIT.R, config={align = "tm", padding = 0}, nodes={
							{n=G.UIT.C, config={align = "tl", padding = 0}, nodes={
								{ n = G.UIT.R, config = { align = "tm", padding = artist_padding }, nodes = {
									{ n = G.UIT.T, config = { text = ArrowAPI.credits['jojobal'].gote, scale = text_scale * artist_size, colour = G.C.UI.TEXT_LIGHT, shadow = true } },
								} },
								{ n = G.UIT.R, config = { align = "tm", padding = artist_padding }, nodes = {
									{ n = G.UIT.T, config = { text = ArrowAPI.credits['jojobal'].cejai, scale = text_scale * artist_size, colour = G.C.UI.TEXT_LIGHT, shadow = true } },
								} },
								{ n = G.UIT.R, config = { align = "tm", padding = artist_padding }, nodes = {
									{ n = G.UIT.T, config = { text = ArrowAPI.credits['jojobal'].keku, scale = text_scale * artist_size, colour = G.C.UI.TEXT_LIGHT, shadow = true } },
								} },
								{ n = G.UIT.R, config = { align = "tm", padding = artist_padding }, nodes = {
									{ n = G.UIT.T, config = { text = ArrowAPI.credits['jojobal'].guff, scale = text_scale * artist_size, colour = G.C.UI.TEXT_LIGHT, shadow = true } },
								} },
								{ n = G.UIT.R, config = { align = "tm", padding = artist_padding }, nodes = {
									{ n = G.UIT.T, config = { text = ArrowAPI.credits['jojobal'].wario, scale = text_scale * artist_size, colour = G.C.UI.TEXT_LIGHT, shadow = true } },
								} },
								{ n = G.UIT.R, config = { align = "tm", padding = artist_padding }, nodes = {
									{ n = G.UIT.T, config = { text = ArrowAPI.credits['jojobal'].chvsau, scale = text_scale * artist_size, colour = G.C.UI.TEXT_LIGHT, shadow = true } },
								} },
								{ n = G.UIT.R, config = { align = "tm", padding = artist_padding }, nodes = {
									{ n = G.UIT.T, config = { text = ArrowAPI.credits['jojobal'].dolos, scale = text_scale * artist_size, colour = G.C.UI.TEXT_LIGHT, shadow = true } },
								} },
								{ n = G.UIT.R, config = { align = "tm", padding = artist_padding }, nodes = {
									{ n = G.UIT.T, config = { text = ArrowAPI.credits['jojobal'].stup, scale = text_scale * artist_size, colour = G.C.UI.TEXT_LIGHT, shadow = true } },
								} },
								{ n = G.UIT.R, config = { align = "tm", padding = artist_padding }, nodes = {
									{ n = G.UIT.T, config = { text = ArrowAPI.credits['jojobal'].reda, scale = text_scale * artist_size, colour = G.C.UI.TEXT_LIGHT, shadow = true } },
								} },
							}},
						}},
					} },
				}},
				{n=G.UIT.C, config={align = "tm", padding = 0.1, r = 0.1}, nodes= {
					{ n = G.UIT.C, config = { align = "tm", padding = 0, r = 0.1, }, nodes = {
						{n=G.UIT.R, config={align = "tm", padding = 0}, nodes={
							{n=G.UIT.C, config={align = "cm", padding = 0.1*bonus_padding,outline_colour = G.C.JOKER_GREY, r = 0.1, outline = 1}, nodes={
								{n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
									{n=G.UIT.T, config={text = localize('jojobal_credits_coding'), scale = header_scale*0.6, colour = G.C.ORANGE, shadow = true}},
								}},
								{n=G.UIT.R, config={align = "cm", padding = 0}, nodes= {
									{n=G.UIT.R, config={align = "tm", padding = 0.05}, nodes={
										{n=G.UIT.T, config={text = ArrowAPI.credits['jojobal'].gote, scale = text_scale*0.44*coding_scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
									}},
									{n=G.UIT.R, config={align = "tm", padding = 0.05}, nodes={
										{n=G.UIT.T, config={text = ArrowAPI.credits['jojobal'].keku, scale = text_scale*0.45*coding_scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
									}},
									{n=G.UIT.R, config={align = "tm", padding = 0.05}, nodes={
										{n=G.UIT.T, config={text = ArrowAPI.credits['jojobal'].vivi, scale = text_scale*0.45*coding_scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
									}},
									{n=G.UIT.R, config={align = "tm", padding = 0.05}, nodes={
										{n=G.UIT.T, config={text = ArrowAPI.credits['jojobal'].eremel, scale = text_scale*0.45*coding_scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
									}},
								}},
							}},
							{n=G.UIT.C, config={align = "tm", padding = 0,outline_colour = G.C.CLEAR, r = 0.1, outline = 1}, nodes={
								{n=G.UIT.R, config={align = "tm", padding = 0}, nodes={
									{n=G.UIT.T, config={text = "SEPARATOR LMAO", scale = text_scale*0.3, colour = G.C.CLEAR, vert = true, shadow = true}},
								}},
							}},
							{n=G.UIT.C, config={align = "tl", padding = 0}, nodes={
								{n=G.UIT.R, config={align = "cm", padding = 0.1, minh = 3.9, outline_colour = G.C.JOKER_GREY, r = 0.1, outline = 1}, nodes={
									{n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
										{n=G.UIT.T, config={text = localize('jojobal_credits_shaders'), scale = header_scale * 0.515, colour = G.C.DARK_EDITION, shadow = true}},
									}},
									{n=G.UIT.R, config={align = "cm", padding = support_padding}, nodes= {
										{n=G.UIT.R, config={align = "tm", padding = 0.05}, nodes={
											{n=G.UIT.T, config={text = ArrowAPI.credits['jojobal'].gameboy, scale = text_scale*0.55*shader_scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
										}},
										{n=G.UIT.R, config={align = "tm", padding = 0.05}, nodes={
											{n=G.UIT.T, config={text = ArrowAPI.credits['jojobal'].vivi, scale = text_scale*0.55*shader_scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
										}},
									}},
								}},
							}},
						}},
						{n=G.UIT.R, config={align = "tm", padding = 0,outline_colour = G.C.CLEAR, r = 0.1, outline = 1}, nodes={
							{n=G.UIT.R, config={align = "tm", padding = 0}, nodes={
								{n=G.UIT.T, config={text = "SEPARATOR LMAO", scale = text_scale*0.3, colour = G.C.CLEAR, shadow = true}},
							}},
						}},
						{n=G.UIT.R, config={align = "tm", padding = 0.1,outline_colour = G.C.JOKER_GREY, r = 0.1, outline = 1, minh=2}, nodes={
							{n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
								{n=G.UIT.T, config={text = localize('jojobal_credits_thanks'), scale = header_scale*0.55, colour = G.C.GREEN, shadow = true}},
							}},
							{n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
								{n=G.UIT.C, config={align = "cm", padding = 0}, nodes={
									{n=G.UIT.R, config={align = "cm", padding = special_thanks_padding}, nodes={
										{n=G.UIT.T, config={text = ArrowAPI.credits['jojobal'].araki, scale = text_scale*0.45*special_thanks_mod, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
									}},
									{n=G.UIT.R, config={align = "cm", padding = special_thanks_padding}, nodes={
										{n=G.UIT.T, config={text = ArrowAPI.credits['jojobal'].luckyland, scale = text_scale*0.45*special_thanks_mod, colour = G.C.UI.TEXT_LIGHT, shadow = true}},
									}},
								}},
							}},
						}},
					}},
				}},
			}}
		}}
	}}
end