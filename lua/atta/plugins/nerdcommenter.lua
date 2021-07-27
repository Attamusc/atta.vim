local g = vim.g

local utils = require("atta.utils")

local M = {}

function M.setup()
  g.NERDSpaceDelims = 1
  g.NERDToggleCheckAllLines = 1

  utils.map("", "<leader>cc", "<plug>NERDCommenterToggle")
end

return M
