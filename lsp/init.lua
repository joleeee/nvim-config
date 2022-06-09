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
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require("lspconfig")

local langs = { 'rust_analyzer', 'gopls', 'pyright', 'yamlls', 'sumneko_lua', 'clangd' }
for _, server in pairs(langs) do
	lspconfig[server].setup {
		capabilities = capabilities,
	}
end
