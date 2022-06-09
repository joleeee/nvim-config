require("nvim-lsp-installer").setup {
	automatic_installation = true
}

-- status
local lspstatus = require("lsp-status")
lspstatus.config({
	status_symbol = "",
	show_filename = false,
	indicator_errors = "E",
	indicator_warnings = "W",
	indicator_info = "I",
	indicator_hint = "H",
	indicator_ok = "",
	indicator_separator = "",
})
lspstatus.register_progress()

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup {}
lspconfig.pyright.setup {}
lspconfig.yamlls.setup {}
lspconfig.sumneko_lua.setup {}
lspconfig.clangd.setup {}
