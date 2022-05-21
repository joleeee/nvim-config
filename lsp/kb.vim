" TextEdit might fail if hidden is not set.
set hidden

" Don't pass messages to |ins-completion-menu|.
"set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("patch-8.1.1564")
  "" Recently vim can merge signcolumn and number column into one
  "set signcolumn=number
"else
  "set signcolumn=yes
"endif
set signcolumn=yes

" For some reason cokeline has another ordering than the built in buffer-order
" therefore just use its binds...
nmap <silent> <C-p> <Plug>(cokeline-focus-prev)
nmap <silent> <C-n> <Plug>(cokeline-focus-next)

nmap <silent> <A-p> <Plug>(cokeline-switch-prev)
nmap <silent> <A-n> <Plug>(cokeline-switch-next)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <cmd>lua vim.diagnostic.goto_prev()<CR>
nmap <silent> ]g <cmd>lua vim.diagnostic.goto_next()<CR>

" GoTo code navigation.
nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nmap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nmap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nmap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <F2> <cmd>lua vim.lsp.buf.rename()<CR>

" Formatting selected code.
"xmap <leader>f  <cmd>lua vim.lsp.buf.formatting()<CR>
"nmap <leader>f  <cmd>lua vim.lsp.buf.formatting()<CR>

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"set statusline^=\ %#StatusLine#%f\ %#Conceal#\ %{coc#status()}%{get(b:,'coc_current_function','')}

