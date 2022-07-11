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
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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
	Plug 'simrat39/rust-tools.nvim'

	" Themes
	Plug 'bluz71/vim-moonfly-colors'
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
