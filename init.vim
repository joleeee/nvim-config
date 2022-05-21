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

" lightline
set noshowmode
let g:lightline = {
\ 'enable': {
\ 'tabline': 0
\ },
\ 'active': {
\	'left' : [ ['mode', 'paste'], ['jolename'], ['jolestatus']],
\ 	'right': [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'], [ 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_hints', 'linter_ok' ] ]  },
\ 'component_function': { 'jolename': 'JoleName' , 'jolestatus': 'JoleStatus'}
\ }

let g:lightline.component_expand = {
	\ 'linter_hints': 'lightline#lsp#hints',
	\ 'linter_infos': 'lightline#lsp#infos',
	\ 'linter_warnings': 'lightline#lsp#warnings',
	\ 'linter_errors': 'lightline#lsp#errors',
	\ 'linter_ok': 'lightline#lsp#ok',
	\ }

let g:lightline.component_type = {
	\ 'linter_hints': 'right',
	\ 'linter_infos': 'right',
	\ 'linter_warnings': 'warning',
	\ 'linter_errors': 'error',
	\ 'linter_ok': 'right',
	\ }

function! JoleName()
	let l:path = expand('%')
	return l:path
	"return pathshorten(l:path)
endfunction

"let g:lightline.active = { 'right': [[ 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_hints', 'linter_ok' ]] }
function! JoleStatus()
	if luaeval('#vim.lsp.buf_get_clients() > 0')
		return luaeval("require('lsp-status').status()")
	endif
	return ''
endfunction

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

" NLSP settings
lua <<EOF
local nlspsettings = require("nlspsettings")
nlspsettings.setup({
	config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
	local_settings_root_markers = { '.git' },
	jsonls_append_default_schemas = true
})
EOF

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

lua << EOF
require('gitsigns').setup {
	signs = {
		add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
		change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
	},
	signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
	numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
		yadm = {
		enable = false
	},
}
EOF

augroup lightline#lsp
	autocmd!
	autocmd User LspDiagnosticsChanged call lightline#update()
augroup END
