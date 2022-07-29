lua <<EOF
require('packer').startup(function(use)
	-- Utils
	use 'mcchrish/nnn.vim'
	use 'preservim/nerdcommenter'
	use 'preservim/nerdtree'
	use 'nvim-lua/plenary.nvim'
	use 'tpope/vim-fugitive'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-ui-select.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Languages
	use 'thesis/vim-solidity'
	use 'octol/vim-cpp-enhanced-highlight'
	use 'joleeee/vim-yulp'

	-- LSP client
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

	-- LSP cmp
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	-- LSP Config
	use 'nikvdp/nvim-lsp-config'
	use 'tamago324/nlsp-settings.nvim'
	-- temporary fix
	-- use 'nvim-lua/lsp-status.nvim'
	use 'JonatanLima/lsp-status.nvim'

	-- LSP Language specific
	use 'simrat39/rust-tools.nvim'

	-- Themes
	use 'bluz71/vim-moonfly-colors'
	use 'itchyny/lightline.vim'
	use 'spywhere/lightline-lsp'
	use 'kyazdani42/nvim-web-devicons' -- If you want devicons
	use 'noib3/nvim-cokeline' -- bufferline

	-- Git
	use 'lewis6991/gitsigns.nvim'
end)
EOF

let c_space_errors = 1

map ; <Nop>
let mapleader = ";"

" binds
imap jk <Esc>
set timeoutlen=800
nnoremap <leader>p :NnnPicker %:p:h<CR>
nnoremap <leader>n :NnnExplorer %:p:h<CR>
nnoremap <leader>r :!"%:p"<Enter>
command Bd bp | sp | bn | bd

" THEME
colorscheme moonfly

" SOURCE
for f in [
	\ 'lsp/init.lua',
	\ 'lsp/cmp.lua',
	\ 'lsp/kb.vim',
	\ 'plugins/gitsigns.lua',
	\ 'plugins/lightline.vim',
	\ 'plugins/cokeline.lua',
	\ 'plugins/nlspsettings.lua',
	\ 'plugins/telescope.lua',
	\]
	exec "source " . stdpath('config') . '/' . f
endfor

set noshowmode "lightline shows this anyway

set cursorline
set number
set relativenumber

set smartcase
set ignorecase
set hlsearch
set incsearch

set termguicolors

" hover highlights (document_highlight) (copy from Visual)
hi LspReferenceText ctermbg=238 guibg=#505050
hi LspReferenceRead ctermbg=238 guibg=#505050
hi LspReferenceWrite ctermbg=238 guibg=#505050
