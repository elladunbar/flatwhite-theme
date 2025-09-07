local M = {}

M.setup = function(theme)
	local groups = require("flatwhite.groups").setup(theme)
	for group, setting in pairs(groups) do
		vim.api.nvim_set_hl(0, group, setting)
	end
end

return M
