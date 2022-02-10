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
	"Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Languages
	Plug 'thesis/vim-solidity'
	Plug 'octol/vim-cpp-enhanced-highlight'
	
	" LSP
	Plug 'L3MON4D3/LuaSnip'
	Plug 'chen244/rust-tools.nvim'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'neovim/nvim-lspconfig'
	Plug 'nikvdp/nvim-lsp-config'
	Plug 'nvim-lua/lsp-status.nvim'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'tamago324/nlsp-settings.nvim'
	Plug 'williamboman/nvim-lsp-installer'

	" Themes
	Plug 'Haron-Prime/Antares'
	"Plug 'bluz71/vim-moonfly-colors'
	"Plug 'djjcast/mirodark'
	"Plug 'neg-serg/neg'
	"Plug 'nikolvs/vim-sunbather'
	"Plug 'ryanpcmcquen/true-monochrome_vim'
	"Plug 't184256/vim-boring'
	"Plug 'zaki/zazen'
call plug#end()

let c_space_errors = 1

let mapleader = ";"

" SNIPS
nnoremap ;c	:-1read $HOME/.config/nvim/snips/skeleton.c<CR>/{<CR>:noh<CR>o
nnoremap ;h	:-1read $HOME/.config/nvim/snips/index.html<CR>5jo
nnoremap ;y	:-1read $HOME/.config/nvim/snips/skeleton.py<CR>o

" binds
imap jk <Esc>
set timeoutlen=800
nnoremap <leader>p :NnnPicker %:p:h<CR>
nnoremap <leader>n :NnnExplorer %:p:h<CR>
nnoremap <leader>r :!"%:p"<Enter>

" THEME
colorscheme antares
"highlight Pmenu ctermbg=gray guibg=gray

" SOURCE
"source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/lsp/init.lua
source $HOME/.config/nvim/lsp/kb.vim

lua <<EOF
local nlspsettings = require("nlspsettings")
nlspsettings.setup({
  config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
  local_settings_root_markers = { '.git' },
  jsonls_append_default_schemas = true
})
EOF

" Statusline

"set statusline^=\ %#StatusLine#%f\ %#Conceal#
			                    "\ %{coc#status()}%{get(b:,'coc_current_function','')}
set statusline^=\ %#StatusLine#%f\ %#Conceal#%{LspStatus()}
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction


