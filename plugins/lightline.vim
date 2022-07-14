let g:lightline = {
\ 'enable': {
\   'tabline': 0
\ },
\ 'active': {
\   'left': [ ['mode', 'paste'],
\             ['jolename'],
\             ['jolestatus']
\ ],
\  'right': [ ['lineinfo'],
\             ['percent'],
\             ['fileformat', 'fileencoding', 'filetype'],
\             ['linter_errors', 'linter_warnings', 'linter_infos', 'linter_hints', 'linter_ok']
\ ]
\ },
\ 'component_function': {
\   'jolename': 'JoleName',
\   'jolestatus': 'JoleStatus'
\ }
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

function! JoleStatus()
	if luaeval('#vim.lsp.buf_get_clients() > 0')
		return luaeval("require('lsp-status').status()")
	endif
	return ''
endfunction

augroup lightline#lsp
	autocmd!
	autocmd User LspDiagnosticsChanged call lightline#update()
augroup END
