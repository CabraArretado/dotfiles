local present, lspconfig = pcall(require, "lspconfig")
if not present then
	return
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

------------- Mappings ----------------

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local lsp_map = function(modes, lhs, rhs, desc)
		local options = { noremap = true, silent = true, buffer = bufnr }
		if desc then
			options.desc = 'LSP: ' .. desc
		end
		vim.keymap.set(modes, lhs, rhs, options)
	end
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	lsp_map('n', 'gD', vim.lsp.buf.declaration, '[G]o to [D]eclaration')
	lsp_map('n', 'gd', vim.lsp.buf.definition, '[G]o to [d]efinition')
	lsp_map('n', '<leader>k', vim.lsp.buf.hover, 'Hover over')
	lsp_map('n', 'gi', vim.lsp.buf.implementation, '[G]o to [I]mplementation')
	lsp_map('n', '<space>kh', vim.lsp.buf.signature_help, '[S]ignature [H]elp')
	lsp_map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, '')
	lsp_map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
	lsp_map('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end)
	lsp_map('n', '<space>D', vim.lsp.buf.type_definition)
	lsp_map('n', '<space>rn', vim.lsp.buf.rename)
	lsp_map('n', '<space>ca', vim.lsp.buf.code_action)
	lsp_map('n', '<space>f', function()
		vim.lsp.buf.format({ async = true })
	end)
	lsp_map('n', '<F6>', vim.diagnostic.hide)
	lsp_map('n', '<space>e', vim.diagnostic.open_float)
	lsp_map('n', '[d', vim.diagnostic.goto_prev)
	lsp_map('n', ']d', vim.diagnostic.goto_next)
	lsp_map('n', '<space>q', vim.diagnostic.setloclist)
	lsp_map('n', 'gi', '<cmd>Telescope lsp_incoming_calls<cr>')
	lsp_map('n', 'go', '<cmd>Telescope lsp_outgoing_calls<cr>')
	lsp_map('n', 'gr', '<cmd>Telescope lsp_references<cr>')
	lsp_map('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
	lsp_map('n', 'gq', '<cmd>Telescope quickfix<cr>')
	lsp_map('n', '<leader>ls', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>')
end

if vim.fn.executable('lua-language-server') == 1 then
	lspconfig.sumneko_lua.setup {
		capabilities = capabilities,
		on_attach = on_attach,
		flags = lsp_flags,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { 'vim' },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
				format = {
					enable = true,
					-- Put format options here
					-- NOTE: the value should be STRING!!
					defaultConfig = {
						indent_style = "space",
						indent_size = "2",
					}
				},
			},
		},
	}
end
-- List all servers here --
-- tables of string with the server's names

local to_install = { 'pylsp', 'tsserver' }

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = to_install,
	automatic_installation = false,
})


for _, lsp in pairs(to_install) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		flags = lsp_flags,
		capabilities = capabilities
	}
end
