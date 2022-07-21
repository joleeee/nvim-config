" TextEdit might fail if hidden is not set.
set hidden

" Don't pass messages to |ins-completion-menu|.
"set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved. =yes to merge with number column
set signcolumn=yes

" For some reason cokeline has another ordering than the built in buffer-order
" therefore just use its binds...
nmap <silent> <C-p> <Plug>(cokeline-focus-prev)
nmap <silent> <C-n> <Plug>(cokeline-focus-next)

nmap <silent> <A-p> <Plug>(cokeline-switch-prev)
nmap <silent> <A-n> <Plug>(cokeline-switch-next)

nmap <silent> <A-1> <Plug>(cokeline-focus-1)
nmap <silent> <A-2> <Plug>(cokeline-focus-2)
nmap <silent> <A-3> <Plug>(cokeline-focus-3)
nmap <silent> <A-4> <Plug>(cokeline-focus-4)
nmap <silent> <A-5> <Plug>(cokeline-focus-5)
nmap <silent> <A-6> <Plug>(cokeline-focus-6)
nmap <silent> <A-7> <Plug>(cokeline-focus-7)
nmap <silent> <A-8> <Plug>(cokeline-focus-8)
nmap <silent> <A-9> <Plug>(cokeline-focus-9)
nmap <silent> <A-0> <Plug>(cokeline-focus-10)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <cmd>lua vim.diagnostic.goto_prev()<CR>
nmap <silent> ]g <cmd>lua vim.diagnostic.goto_next()<CR>

" already used g for ^, use v for 'version control'
nmap <silent> [v <cmd>lua package.loaded.gitsigns.next_hunk()<CR>
nmap <silent> ]v <cmd>lua package.loaded.gitsigns.prev_hunk()<CR>

" GoTo code navigation.
nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nmap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nmap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nmap <silent> ga <cmd>lua vim.lsp.buf.code_action()<CR>

" Use K to show documentation in preview window.
nmap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

" Highlight refs
nmap <silent> <C-k> <cmd>lua vim.lsp.buf.document_highlight()<CR>
autocmd CursorMoved  * lua vim.lsp.buf.clear_references()
autocmd CursorMovedI * lua vim.lsp.buf.clear_references()

" Symbol renaming.
nmap <F2> <cmd>lua vim.lsp.buf.rename()<CR>

" language [S]erver
nmap <leader>sf  <cmd>lua vim.lsp.buf.formatting()<CR>

" [T]elescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
