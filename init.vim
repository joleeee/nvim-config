let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . 'plugged')
	" Utils
	Plug 'mcchrish/nnn.vim'
	Plug 'preservim/nerdcommenter'
	Plug 'preservim/nerdtree'

	" Languages
	Plug 'thesis/vim-solidity'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'joleeee/vim-yulp'
	
	" LSP client
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'

	" LSP cmp
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

	" LSP Config
	Plug 'nikvdp/nvim-lsp-config'
	Plug 'tamago324/nlsp-settings.nvim'
	Plug 'nvim-lua/lsp-status.nvim'

	" LSP Language specific
	"Plug 'chen244/rust-tools.nvim'
	Plug 'simrat39/rust-tools.nvim'

	" Themes
	Plug 'Haron-Prime/Antares'
	Plug 'itchyny/lightline.vim'
	Plug 'spywhere/lightline-lsp'
	Plug 'kyazdani42/nvim-web-devicons' " If you want devicons
	Plug 'noib3/nvim-cokeline' " bufferline

	" Git
	Plug 'lewis6991/gitsigns.nvim'
call plug#end()

let c_space_errors = 1

map ; <Nop>
let mapleader = ";"

" binds
imap jk <Esc>
set timeoutlen=800
nnoremap <leader>p :NnnPicker %:p:h<CR>
nnoremap <leader>n :NnnExplorer %:p:h<CR>
nnoremap <leader>r :!"%:p"<Enter>

" THEME
colorscheme antares

" SOURCE
source $HOME/.config/nvim/lsp/init.lua
source $HOME/.config/nvim/lsp/kb.vim
source $HOME/.config/nvim/gitsigns.lua
source $HOME/.config/nvim/lightline.vim

" NLSP settings
lua <<EOF
local nlspsettings = require("nlspsettings")
nlspsettings.setup({
	config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
	local_settings_root_markers = { '.git' },
	jsonls_append_default_schemas = true
})
EOF

set noshowmode "lightline shows this anyway

set cursorline
set number
set relativenumber

set smartcase
set ignorecase
set hlsearch
set incsearch

set termguicolors
lua << EOF
  require('cokeline').setup()
EOF
