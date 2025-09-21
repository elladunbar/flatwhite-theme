return function(theme)
	local colors = require("flatwhite.palette")[theme]

	return {
		normal = {
			a = { bg = colors.blue_bg, fg = colors.blue_text, gui = "bold" },
			b = { bg = colors.base5, fg = colors.blue_text_sec },
			c = { bg = "NONE", fg = colors.base3 },
		},

		insert = {
			a = { bg = colors.green_bg, fg = colors.green_text, gui = "bold" },
			b = { bg = colors.base5, fg = colors.green_text_sec },
		},

		command = {
			a = { bg = colors.orange_bg, fg = colors.orange_text, gui = "bold" },
			b = { bg = colors.base5, fg = colors.orange_text_sec },
		},

		visual = {
			a = { bg = colors.purple_bg, fg = colors.purple_text, gui = "bold" },
			b = { bg = colors.base5, fg = colors.purple_text_sec },
		},

		replace = {
			a = { bg = colors.teal_bg, fg = colors.teal_text, gui = "bold" },
			b = { bg = colors.base5, fg = colors.teal_text_sec },
		},

		terminal = {
			a = { bg = colors.teal_bg, fg = colors.teal_text, gui = "bold" },
			b = { bg = colors.base5, fg = colors.teal_text_sec },
		},

		inactive = {
			a = { bg = "NONE", fg = colors.blue_text },
			b = { bg = "NONE", fg = colors.base3, gui = "bold" },
			c = { bg = "NONE", fg = colors.base3 },
		},
	}
end
