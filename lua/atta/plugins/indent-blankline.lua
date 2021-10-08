local indent_blankline = require("indent_blankline")

local M = {}

function M.setup()
	indent_blankline.setup({
		use_treesitter = true,
		buftype_exclude = { "terminal", "telescope" },
	})
end

return M
