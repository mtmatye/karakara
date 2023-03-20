local M = {}

M.config = function()
	vim.g.catppuccin_flavour = "mocha"
	local catppuccin = require("catppuccin")
	catppuccin.setup({
		transparent_background = lvim.transparent_window,
		term_colors = true,
		dim_inactive = {
			enabled = true,
		},
		styles = {
			comments = { "italic" },
			strings = { "italic" },
			keywords = { "italic" },
			functions = { "italic" },
			numbers = { "italic" },
		},
		integrations = {
			lsp_trouble = true,
			nvimtree = true,
			which_key = true,
			ts_rainbow = true,
			hop = true,
      telescope = true,
		},
	})
end

return M
