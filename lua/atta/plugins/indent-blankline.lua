local indent_blankline = require("indent_blankline")

local M = {}

function M.setup()
	vim.opt.list = true

	indent_blankline.setup({
		space_char_blankline = " ",
		show_current_context = true,
		show_current_context_start = true,
		buftype_exclude = { "terminal", "telescope" },
	})
end

return M
