" Plugin Keyboard-Mappings
" ---

if dein#tap('telescope.nvim')
	" git_commits    git_bcommits   git_branches
	" git_status     git_stash      git_files
	" file_browser   tags           fd             autocommands   quickfix
	" filetypes      commands       man_pages      help_tags      loclist
	" lsp_workspace_diagnostics     lsp_document_diagnostics

	nnoremap <silent><LocalLeader>f <cmd>Telescope find_files<CR>
	nnoremap <silent><LocalLeader>g <cmd>Telescope live_grep<CR>
	nnoremap <silent><LocalLeader>b <cmd>Telescope buffers<CR>
	nnoremap <silent><LocalLeader>h <cmd>Telescope highlights<CR>
	nnoremap <silent><LocalLeader>j <cmd>Telescope jumplist<CR>
	nnoremap <silent><LocalLeader>m <cmd>Telescope marks<CR>
	nnoremap <silent><LocalLeader>o <cmd>Telescope vim_options<CR>
	nnoremap <silent><LocalLeader>t <cmd>Telescope lsp_dynamic_workspace_symbols<CR>
	nnoremap <silent><LocalLeader>v <cmd>Telescope registers<CR>
	nnoremap <silent><LocalLeader>u <cmd>Telescope spell_suggest<CR>
	nnoremap <silent><LocalLeader>s <cmd>Telescope session-lens search_session<CR>
	nnoremap <silent><LocalLeader>x <cmd>Telescope oldfiles<CR>
	nnoremap <silent><LocalLeader>z <cmd>Telescope zoxide list<CR>
	nnoremap <silent><LocalLeader>; <cmd>Telescope command_history<CR>
	nnoremap <silent><LocalLeader>/ <cmd>Telescope search_history<CR>
	nnoremap <silent><LocalLeader>n :lua require 'telescope.builtin'.find_files({prompt_title = "plugins", cwd = "$XDG_DATA_HOME/nvim/dein/repos/github.com"})<CR>
	nnoremap <silent><LocalLeader>w :lua require 'telescope.builtin'.find_files({prompt_title = "docs", cwd = "$HOME/docs/blog"})<CR>

	nnoremap <silent><LocalLeader>dd <cmd>Telescope lsp_definitions<CR>
	nnoremap <silent><LocalLeader>di <cmd>Telescope lsp_implementations<CR>
	nnoremap <silent><LocalLeader>dr <cmd>Telescope lsp_references<CR>
	nnoremap <silent><LocalLeader>da <cmd>Telescope lsp_code_actions<CR>
	vnoremap <silent><LocalLeader>da :Telescope lsp_range_code_actions<CR>

	nnoremap <silent> <Leader>/  <cmd>Telescope current_buffer_fuzzy_find<CR>
	nnoremap <silent> <Leader>gt <cmd>Telescope lsp_workspace_symbols default_text=<C-r>=shellescape(expand('<cword>'), 1)<CR><CR>
	nnoremap <silent> <Leader>gf <cmd>Telescope find_files default_text=<C-r>=shellescape(expand('<cword>'), 1)<CR><CR>
	nnoremap <silent> <Leader>gg <cmd>Telescope grep_string<CR>
	vnoremap <silent> <Leader>gg :<C-u>Telescope grep_string default_text=<C-r>=shellescape(<SID>get_selection(), 1)<CR><CR>

	" Returns visually selected text
	function! s:get_selection() abort
		try
			let a_save = @a
			silent! normal! gv"ay
			return substitute(escape(@a, '\/'), '\n', '\\n', 'g')
		finally
			let @a = a_save
		endtry
	endfunction
endif

if dein#tap('fern.vim')
	nnoremap <silent> <LocalLeader>e :<C-u>Fern -toggle -drawer .<CR>
	nnoremap <silent> <LocalLeader>a :<C-u>Fern -reveal=% -drawer .<CR>
endif

if dein#tap('symbols-outline.nvim')
	nnoremap <silent> <Leader>o :<C-u>SymbolsOutline<CR>
endif

if dein#tap('vim-vsnip')
	imap <expr><C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
	smap <expr><C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
endif

if dein#tap('emmet-vim')
	autocmd user_events FileType html,css,vue,javascript,javascriptreact,svelte
		\ EmmetInstall
		\ | imap <silent><buffer> <C-y> <Plug>(emmet-expand-abbr)
endif

" if dein#tap('vim-gitgutter')
" 	nmap ]g <Plug>(GitGutterNextHunk)
" 	nmap [g <Plug>(GitGutterPrevHunk)
" 	nmap gS <Plug>(GitGutterStageHunk)
" 	xmap gS <Plug>(GitGutterStageHunk)
" 	nmap <Leader>gr <Plug>(GitGutterUndoHunk)
" 	nmap gs <Plug>(GitGutterPreviewHunk)
" endif

if dein#tap('vim-sandwich')
	nmap <silent> sa <Plug>(operator-sandwich-add)
	xmap <silent> sa <Plug>(operator-sandwich-add)
	omap <silent> sa <Plug>(operator-sandwich-g@)
	nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sd <Plug>(operator-sandwich-delete)
	nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sr <Plug>(operator-sandwich-replace)
	nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	omap ir <Plug>(textobj-sandwich-auto-i)
	xmap ir <Plug>(textobj-sandwich-auto-i)
	omap ab <Plug>(textobj-sandwich-auto-a)
	xmap ab <Plug>(textobj-sandwich-auto-a)
	omap is <Plug>(textobj-sandwich-query-i)
	xmap is <Plug>(textobj-sandwich-query-i)
	omap as <Plug>(textobj-sandwich-query-a)
	xmap as <Plug>(textobj-sandwich-query-a)
endif

if dein#tap('vim-niceblock')
	silent! xmap I  <Plug>(niceblock-I)
	silent! xmap gI <Plug>(niceblock-gI)
	silent! xmap A  <Plug>(niceblock-A)
endif

if dein#tap('accelerated-jk')
	nmap <silent> j <Plug>(accelerated_jk_gj)
	nmap <silent> k <Plug>(accelerated_jk_gk)
endif

if dein#tap('vim-edgemotion')
	map gj <Plug>(edgemotion-j)
	map gk <Plug>(edgemotion-k)
	xmap gj <Plug>(edgemotion-j)
	xmap gk <Plug>(edgemotion-k)
endif

if dein#tap('vim-quickhl')
	nmap <Leader>mt <Plug>(quickhl-manual-this)
	xmap <Leader>mt <Plug>(quickhl-manual-this)
endif

if dein#tap('vim-sidemenu')
	nmap <Leader>l <Plug>(sidemenu)
	xmap <Leader>l <Plug>(sidemenu-visual)
endif

if dein#tap('vim-indent-guides')
	nmap <silent><Leader>ti :<C-u>IndentGuidesToggle<CR>
endif

if dein#tap('vim-signature')
	let g:SignatureIncludeMarks = 'abcdefghijkloqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
	let g:SignatureMap = {
		\ 'Leader':            'm',
		\ 'ListBufferMarks':   'm/',
		\ 'ListBufferMarkers': 'm?',
		\ 'PlaceNextMark':     'm,',
		\ 'ToggleMarkAtLine':  'mm',
		\ 'PurgeMarksAtLine':  'm-',
		\ 'DeleteMark':        'dm',
		\ 'PurgeMarks':        'm<Space>',
		\ 'PurgeMarkers':      'm<BS>',
		\ 'GotoNextLineAlpha': "']",
		\ 'GotoPrevLineAlpha': "'[",
		\ 'GotoNextSpotAlpha': '`]',
		\ 'GotoPrevSpotAlpha': '`[',
		\ 'GotoNextLineByPos': "]'",
		\ 'GotoPrevLineByPos': "['",
		\ 'GotoNextSpotByPos': 'mn',
		\ 'GotoPrevSpotByPos': 'mp',
		\ 'GotoNextMarker':    ']-',
		\ 'GotoPrevMarker':    '[-',
		\ 'GotoNextMarkerAny': ']=',
		\ 'GotoPrevMarkerAny': '[=',
		\ }
endif

if dein#tap('nvim-bqf')
	nmap <silent> <Leader>q <cmd>lua require('user').qflist.toggle()<CR>
endif

" if dein#tap('vim-qf')
" 	nmap <Leader>a :call <SID>toggle_qf(1)<CR>
" 	silent! nunmap ]q
" 	silent! nunmap [q
" 	nnoremap ]q <Plug>(qf_qf_next)
" 	nnoremap [q <Plug>(qf_qf_previous)
"
" 	function! s:toggle_qf(stay)
" 		" save the view if the current window is not a quickfix window
" 		if get(g:, 'qf_save_win_view', 1) && !qf#IsQfWindow(winnr())
" 			let winview = winsaveview()
" 		else
" 			let winview = {}
" 		endif
"
" 		" get user-defined maximum height
" 		let max_height = get(g:, 'qf_max_height', 10) < 1 ? 10 : get(g:, 'qf_max_height', 10)
"
" 		" if one of the windows is a quickfix window close it and return
" 		if qf#IsQfWindowOpen()
" 			cclose
" 			if !empty(winview)
" 				call winrestview(winview)
" 			endif
" 		else
" 			execute get(g:, 'qf_auto_resize', 1) ? min([ max_height, len(getqflist()) ]) . 'copen' : max_height . 'copen'
" 			if qf#IsQfWindowOpen()
" 				wincmd p
" 				if !empty(winview)
" 					call winrestview(winview)
" 				endif
" 				if !a:stay
" 					wincmd p
" 				endif
" 			endif
" 		endif
" 	endfunction
" endif

if dein#tap('goto-preview')
	nnoremap gb <cmd>lua require('goto-preview').goto_preview_definition()<CR>
	nnoremap go <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
	" nnoremap <Leader>gP <cmd>lua require('goto-preview').close_all_win()<CR>
endif

if dein#tap('committia.vim')
	let g:committia_hooks = {}
	function! g:committia_hooks.edit_open(info)
		setlocal winminheight=1 winheight=10
		resize 10
		imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
		imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
		imap <buffer><C-f> <Plug>(committia-scroll-diff-down-page)
		imap <buffer><C-b> <Plug>(committia-scroll-diff-up-page)
		imap <buffer><C-j> <Plug>(committia-scroll-diff-down)
		imap <buffer><C-k> <Plug>(committia-scroll-diff-up)
	endfunction
endif

if dein#tap('vim-shot-f')
	nmap f  <Plug>(shot-f-f)
	nmap F  <Plug>(shot-f-F)
	nmap t  <Plug>(shot-f-t)
	nmap T  <Plug>(shot-f-T)
	xmap f  <Plug>(shot-f-f)
	xmap F  <Plug>(shot-f-F)
	xmap t  <Plug>(shot-f-t)
	xmap T  <Plug>(shot-f-T)
	omap f  <Plug>(shot-f-f)
	omap F  <Plug>(shot-f-F)
	omap t  <Plug>(shot-f-t)
	omap T  <Plug>(shot-f-T)
endif

if dein#tap('todo-comments.nvim')
	nnoremap <leader>tt <cmd>TodoTelescope<CR>
endif

if dein#tap('trouble.nvim')
	nnoremap <leader>e <cmd>TroubleToggle lsp_document_diagnostics<CR>
	nnoremap <leader>r <cmd>TroubleToggle lsp_workspace_diagnostics<CR>
	nnoremap <leader>xq <cmd>TroubleToggle quickfix<CR>
	nnoremap <leader>xl <cmd>TroubleToggle loclist<CR>
	nnoremap ]t <cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>
	nnoremap [t <cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>
	nnoremap gR <cmd>TroubleToggle lsp_references<CR>
endif

if dein#tap('diffview.nvim')
	nnoremap <silent> <Leader>gv :<C-u>DiffviewOpen<CR>
endif

if dein#tap('vimwiki')
	nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
endif

if dein#tap('vim-choosewin')
	nmap -         <Plug>(choosewin)
	nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
endif

if dein#tap('vimagit')
	nnoremap <silent> <Leader>mg :Magit<CR>
endif

if dein#tap('gina.vim')
	nnoremap <silent> <leader>ga :Gina add %:p<CR>
	nnoremap <silent> <leader>gd :Gina compare<CR>
	nnoremap <silent> <leader>gc :Gina commit<CR>
	nnoremap <silent> <leader>gb :Gina blame --width=40<CR>
	nnoremap <silent> <leader>gs :Gina status -s<CR>
	nnoremap <silent> <leader>gl :Gina log --graph --all<CR>
	nnoremap <silent> <leader>gF :Gina! fetch<CR>
	" nnoremap <silent> <leader>gp :Gina! push<CR>
	nnoremap <silent> <leader>go :,Gina browse :<CR>
	vnoremap <silent> <leader>go :Gina browse :<CR>
endif

if dein#tap('vim-gitgrep')
	nnoremap <silent> <Leader>;
		\ :<C-u>call gitgrep#run('', expand('<cword>'), { 'ignorecase': 1 })<CR>
	autocmd user_events FileType GitGrep
		\  nnoremap <buffer> gq :<C-u>quit<CR>
		\| nmap <buffer> <nowait> <Space> zak
endif

if dein#tap('zen-mode.nvim')
	nnoremap <silent> <Leader>z <cmd>ZenMode<CR>
endif

if dein#tap('rest.nvim')
	nmap <silent> ,ht <plug>RestNvim
endif

if dein#tap('yaml.nvim')
	nnoremap <silent> ,av <Cmd>lua require("yaml_nvim").view()<CR>
	nnoremap <silent> ,ay <Cmd>lua require("yaml_nvim").yank()<CR>
	" nnoremap <silent> ,aY <Cmd>lua require("yaml_nvim").yank_path()<CR>
	" nnoremap <silent> ,a <Cmd>lua require("yaml_nvim").telescope()<CR>
endif

if dein#tap('any-jump.vim')
	" Normal mode: Jump to definition under cursor
	nnoremap <silent> <leader>ii :AnyJump<CR>

	" Visual mode: jump to selected text in visual mode
	xnoremap <silent> <leader>ii :AnyJumpVisual<CR>

	" Normal mode: open previous opened file (after jump)
	nnoremap <silent> <leader>ib :AnyJumpBack<CR>

	" Normal mode: open last closed search window again
	nnoremap <silent> <leader>il :AnyJumpLastResults<CR>
endif

if dein#tap('undotree')
	nnoremap <Leader>gu :UndotreeToggle<CR>
endif

if dein#tap('thesaurus_query.vim')
	nnoremap <silent> <Leader>K :<C-u>ThesaurusQueryReplaceCurrentWord<CR>
endif

if dein#tap('vim-asterisk')
	map *   <Plug>(asterisk-g*)
	map g*  <Plug>(asterisk-*)
	map #   <Plug>(asterisk-g#)
	map g#  <Plug>(asterisk-#)

	map z*  <Plug>(asterisk-z*)
	map gz* <Plug>(asterisk-gz*)
	map z#  <Plug>(asterisk-z#)
	map gz# <Plug>(asterisk-gz#)
endif

if dein#tap('sideways.vim')
	nnoremap <silent> <, :SidewaysLeft<CR>
	nnoremap <silent> >, :SidewaysRight<CR>
	nnoremap <silent> [, :SidewaysJumpLeft<CR>
	nnoremap <silent> ], :SidewaysJumpRight<CR>
	omap <silent> a, <Plug>SidewaysArgumentTextobjA
	xmap <silent> a, <Plug>SidewaysArgumentTextobjA
	omap <silent> i, <Plug>SidewaysArgumentTextobjI
	xmap <silent> i, <Plug>SidewaysArgumentTextobjI
endif

if dein#tap('splitjoin.vim')
	nmap sj :SplitjoinJoin<CR>
	nmap sk :SplitjoinSplit<CR>
endif

if dein#tap('linediff.vim')
	vnoremap <Leader>mdf :Linediff<CR>
	vnoremap <Leader>mda :LinediffAdd<CR>
	nnoremap <Leader>mds :<C-u>LinediffShow<CR>
	nnoremap <Leader>mdr :<C-u>LinediffReset<CR>
endif

if dein#tap('dsf.vim')
	nmap dsf <Plug>DsfDelete
	nmap csf <Plug>DsfChange
endif

if dein#tap('caw.vim')
	function! InitCaw() abort
		if &l:modifiable && &buftype ==# '' && &filetype !=# 'gitrebase'
			xmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
			nmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
			xmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
			nmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
			nmap <buffer> gc <Plug>(caw:prefix)
			xmap <buffer> gc <Plug>(caw:prefix)
			nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
			xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
		else
			silent! nunmap <buffer> <Leader>V
			silent! xunmap <buffer> <Leader>V
			silent! nunmap <buffer> <Leader>v
			silent! xunmap <buffer> <Leader>v
			silent! nunmap <buffer> gc
			silent! xunmap <buffer> gc
			silent! nunmap <buffer> gcc
			silent! xunmap <buffer> gcc
		endif
	endfunction
	autocmd user_events FileType * call InitCaw()
	call InitCaw()
endif

" vim: set ts=2 sw=2 tw=80 noet :
