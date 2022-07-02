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
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-ui-select.nvim'

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
	" temporary fix
	" Plug 'nvim-lua/lsp-status.nvim'
	Plug 'JonatanLima/lsp-status.nvim'

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
command Bd bp | sp | bn | bd

" THEME
colorscheme antares

" SOURCE
source $HOME/.config/nvim/lsp/init.lua
source $HOME/.config/nvim/lsp/cmp.lua
source $HOME/.config/nvim/lsp/kb.vim
source $HOME/.config/nvim/gitsigns.lua
source $HOME/.config/nvim/lightline.vim
source $HOME/.config/nvim/cokeline.lua
source $HOME/.config/nvim/nlspsettings.lua
source $HOME/.config/nvim/telescope.lua

set noshowmode "lightline shows this anyway

set cursorline
set number
set relativenumber

set smartcase
set ignorecase
set hlsearch
set incsearch

set termguicolors
