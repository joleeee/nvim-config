local lsp_installer = require "nvim-lsp-installer"

-- status
local lspstatus = require('lsp-status')
lspstatus.config({
	status_symbol = '',
	show_filename = false,
	indicator_errors = 'E',
	indicator_warnings = 'W',
	indicator_info = 'I',
	indicator_hint = 'H',
	indicator_ok = '',
	indicator_separator = '',
})
lspstatus.register_progress()

local lspconfig = require('lspconfig')

-- install servers
local servers = {
	"rust_analyzer",
	"pyright",
	"yamlls",
	"sumneko_lua",
	"clangd",
}
for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end

lsp_installer.on_server_ready(function(server)
	-- Specify the default options which we'll use to setup all servers
	local opts = {
		on_attach = lspstatus.on_attach,
	}

	if server.name == "rust_analyzer" then
		require("rust-tools").setup {
			-- The "server" property provided in rust-tools setup function are the
			-- settings rust-tools will provide to lspconfig during init.    --
			-- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
			-- with the user's own settings (opts).
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		}
		server:attach_buffers()
	else
		server:setup(opts)
	end
end)
