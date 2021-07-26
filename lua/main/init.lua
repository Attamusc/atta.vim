local M = {}

function M:mapleader()
  -- Use spacebar as leader and , as secondary-leader
  -- Required before loading plugins!
  vim.g.mapleader = " "
  vim.g.maplocalleader = ","
end

M:mapleader()
