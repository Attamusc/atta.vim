-- Bundling all these plguins into one config since they need to come
-- in a specific order. I might split them apart if this files ends up
-- too large.
local lspconfig = require("lspconfig")
local lspinstall = require("lspinstall")
local kind = require("lspkind")
local saga = require("lspsaga")
local compe = require("compe")
local utils = require("atta.utils")

local cmd = vim.cmd
local lsp = vim.lsp
local fn = vim.fn

local M = {}

function M.format()
	vim.lsp.buf.formatting()
end

local function on_attach(client)
	if client.resolved_capabilities.document_formatting then
		cmd([[augroup Format]])
		cmd([[autocmd! * <buffer>]])
		cmd([[autocmd BufWritePost <buffer> lua require('atta.plugins.lsp').format()]])
		cmd([[augroup END]])
	end
end

local server_configs = {
	bash = {},
	csharp = {},
	lua = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[fn.expand("$VIMRUNTIME/lua")] = true,
						[fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		},
	},
	php = {},
	typescript = {},
	rust = {
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			on_attach(client)
		end,
	},
	go = {
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			on_attach(client)
		end,
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				linksInHover = false,
				codelenses = {
					generate = true,
					gc_details = true,
					regenerate_cgo = true,
					tidy = true,
					upgrade_depdendency = true,
					vendor = true,
				},
				usePlaceholders = true,
			},
		},
	},
	efm = {
		on_attach = on_attach,
		init_options = { documentFormatting = true },
		settings = {
			rootMarkers = { ".git/" },
			languages = {
				go = {
					{ formatCommand = "goimports", formatStdin = true },
					{ formatCommand = "gofmt", formatStdin = true },
					{ formatCommand = "golines", formatStdin = true },
				},
				lua = {
					{
						formatCommand = "stylua --search-parent-directories --stdin-filepath ${INPUT} -",
						formatStdin = true,
					},
				},
				rust = {
					{ formatCommand = "rustfmt --emit=stdout --edition=2018", formatStdin = true },
				},
			},
		},
	},
}

local function setup_servers()
	lspinstall.setup()

	local servers = lspinstall.installed_servers()

	for _, server in pairs(servers) do
		local config = server_configs[server] or {}
		lspconfig[server].setup(config)
	end

	lspinstall.post_install_hook = function()
		setup_servers()
		cmd([[bufdo e]])
	end
end

local function setup_completions()
	compe.setup({
		enabled = true,
		autocomplete = true,
		debug = false,
		min_length = 1,
		preselect = "enable",
		throttle_time = 80,
		source_timeout = 200,
		resolve_timeout = 800,
		incomplete_delay = 400,
		max_abbr_width = 100,
		max_kind_width = 100,
		max_menu_width = 100,
		documentation = {
			border = { "", "", "", " ", "", "", "", " " },
			winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
			max_width = 120,
			min_width = 60,
			max_height = math.floor(vim.o.lines * 0.3),
			min_height = 1,
		},

		source = {
			path = true,
			buffer = true,
			calc = true,
			vsnip = true,
			nvim_lsp = true,
			nvim_lua = true,
			spell = true,
			tags = true,
			snippets_nvim = true,
			treesitter = true,
		},
	})
end

local function setup_saga()
	saga.init_lsp_saga()
end

local function setup_kind()
	kind.init()
end

local function check_back_space()
	local col = fn.col(".") - 1
	if col == 0 or fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

function _G.tab_complete()
	if fn.pumvisible() == 1 then
		return utils.t("<C-n>")
	elseif fn.call("vsnip#available", { 1 }) == 1 then
		return utils.t("<Plug>(vsnip-expand-or-jump)")
	elseif check_back_space() then
		return utils.t("<Tab>")
	else
		return fn["compe#complete"]()
	end
end

function _G.s_tab_complete()
	if fn.pumvisible() == 1 then
		return utils.t("<C-p>")
	elseif fn.call("vsnip#jumpable", { -1 }) == 1 then
		return utils.t("<Plug>(vsnip-jump-prev)")
	else
		return utils.t("<S-Tab>")
	end
end

local function bind_keymaps()
	-- These all have some issue when defined in lua, so bounce out
	-- to vim to define them
	cmd([[imap <expr> <Tab> v:lua.tab_complete()]])
	cmd([[imap <expr> <S-Tab> v:lua.s_tab_complete()]])

	cmd([[smap <expr> <Tab> v:lua.tab_complete()]])
	cmd([[smap <expr> <S-Tab> v:lua.s_tab_complete()]])

	cmd([[inoremap <silent><expr> <C-Space> compe#complete()]])
	cmd([[inoremap <silent><expr> <CR> compe#confirm('<CR>')]])
	cmd([[inoremap <silent><expr> <C-e> compe#close('<C-e>')]])
	cmd([[inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })]])
	cmd([[inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })]])

	-- Use K to show documentation in preview window.
	utils.noremap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", { silent = true })

	-- scroll down hover doc
	utils.noremap("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", { silent = true })
	-- scroll up hover doc
	utils.noremap("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", { silent = true })

	-- code action
	utils.noremap("n", "<leader>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", { silent = true })
	utils.noremap(
		"v",
		"<leader>ca",
		":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>",
		{ silent = true }
	)

	-- line diagnostics
	utils.noremap(
		"n",
		"<leader>cd",
		"<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
		{ silent = true }
	)
	utils.noremap("n", "[e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", { silent = true })
	utils.noremap("n", "]e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", { silent = true })
end

local function setup_diagnostics()
	lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			prefix = "»",
			spacing = 4,
		},
		signs = true,
		update_in_insert = false,
	})

	fn.sign_define("LspDiagnosticsSignError", { text = "", texthl = "LspDiagnosticsDefaultError" })
	fn.sign_define("LspDiagnosticsSignWarning", { text = "", texthl = "LspDiagnosticsDefaultWarning" })
	fn.sign_define("LspDiagnosticsSignInformation", { text = "", texthl = "LspDiagnosticsDefaultInformation" })
	fn.sign_define("LspDiagnosticsSignHint", { text = "", texthl = "LspDiagnosticsDefaultHint" })
end

function M.setup()
	setup_servers()
	setup_saga()
	setup_kind()
	setup_completions()
	setup_diagnostics()
	bind_keymaps()
end

return M
