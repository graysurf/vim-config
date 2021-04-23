let g:python3_host_prog = "/usr/bin/python3"
let g:tabline_plugin_enable = 0
let g:statusline_plugin_enable = 0
set number
set splitbelow
set nobackup
set noswapfile
set guicursor=a:blinkon2-hor20-Cursor

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1

let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

function! NearestMethodOrFunction() abort
	  return get(b:, 'vista_nearest_method_or_function', '')
	endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
nnoremap <silent><nowait> <space>. :<C-u>Vista!!<cr>

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'  ],
      \             [ 'readonly', 'filename', 'modified', 'method'  ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }
