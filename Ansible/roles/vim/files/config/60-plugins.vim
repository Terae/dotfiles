" Airline {{{
"let g:airline_theme='hybridline'
let g:airline_theme='base16_eighties'
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#non_zero_only = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#whitespace#enabled = 1
set fillchars+=stl:\ ,stlnc:\  " Space
" }}}

" quickfix {{{
let g:quickfix_is_open = 0

function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}

" Silver Searcher over grep {{{
if executable('ag')
   " Use ag over grep
   set grepprg=ag\ --nogroup\ --nocolor
   let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" }}}

" NERDTree {{{
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>
nmap <silent> <C-t> :NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeFind<CR>

let NERDTreeMinimalUI=0

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]

let g:NERDTreeMapActivateNode="<F2>"
let g:NERDTreeMapPreview="<F3>"
" }}}

" UndoTree {{{
let g:undotree_WindowLayout=3
nnoremap <F6> :UndotreeToggle<CR>
let g:UndotreeToggle=1
" }}}

" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_cpp_compiler_options = "-std=c++14"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END
" }}}

" vim-sort-imports (import-sort fixer) {{{

" TODO: Ideally, this command would be run as an ALE fixer, so we can get rid
" of the vim-sort-imports plugin.
let g:import_sort_auto = 0

" }}}

" SuperTab {{{
let g:SuperTabDefaultCompletionType="<c-n>"
" }}}

" CtrlP {{{
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
" }}}

" Rainbow Parentheses {{{
" Remove black. It's bloody invisible.
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]

" One less colour without black
let g:rbpt_max = 15

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}}

" Powerline {{{
let g:Powerline_symbols = 'compatible'
"let g:Powerline_symbols = 'fancy'
" }}}

" Python mode {{{
" Don't run pylint on every save
let g:pymode = 1
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_doc = 0
let g:pymode_doc_bind = 'K'
let g:pymode_folding = 0
let g:pymode_indent = 0
let g:pymode_lint = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_ignore = ''
let g:pymode_lint_message = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_select = ''
let g:pymode_lint_signs = 1
let g:pymode_motion = 0
let g:pymode_options = 0
let g:pymode_paths = []
let g:pymode_quickfix_maxheight = 6
let g:pymode_quickfix_minheight = 3
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_run = 0
let g:pymode_run_bind = '<leader>r'
let g:pymode_trim_whitespaces = 0

" vim-flake8 default configuration
let g:flake8_show_in_gutter=0
" }}}

" JavaScript {{{
let g:javascript_plugin_jsdoc = 0
let g:javascript_plugin_flow = 1
" }}}

" vim-expand-region {{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

let g:expand_region_text_objects = {
   \ 'iw'  : 0,
   \ 'i"'  : 1,
   \ 'i''' : 1,
   \ 'a"'  : 0,
   \ 'a''' : 0,
   \ 'i)'  : 1,
   \ 'i}'  : 1,
   \ 'i]'  : 1,
   \ 'a)'  : 1,
   \ 'a}'  : 1,
   \ 'a]'  : 1,
   \ }
" }}}

" ArgWrap {{{
let g:argwrap_tail_comma = 1
nnoremap <leader>w :ArgWrap<cr>
" }}}

" ALE {{{

" let g:ale_enabled = 1
let g:ale_completion_enabled = 0
let g:ale_lint_delay = 200   " millisecs
" let g:ale_lint_on_text_changed = 'always'  " never/insert/normal/always
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" let g:ale_open_list = 1

" TODO: Temporary hack until our eslint is configured correctly
let g:ale_javascript_eslint_options = '--rulesdir eslint --no-ignore'

let g:ale_linters = {
\   'graphql': ['eslint', 'flow'],
\   'javascript.jsx': ['eslint', 'flow'],
\   'javascript': ['eslint', 'flow'],
\   'typescript': ['typescript'],
\}
let g:ale_fixers = {
\   'graphql': ['eslint', 'prettier'],
\   'javascript.jsx': ['eslint', 'prettier'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\}

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

" Check JS with Flow {{{
" Uncomment this if it gets annoying
" let g:asyncomplete_auto_popup = 0
" let g:asyncomplete_remove_duplicates = 1

" Tab completion for vim-lsp
" inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <tab> <c-n>
" inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"
" set completeopt=menu,longest,preview

" Force refresh completion
imap <s-space> <Plug>(asyncomplete_force_refresh)

" vim-lsp configuration for IDE-like Flow help
" See https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Flow
if executable('flow-language-server')
   nnoremap gd :LspDefinition<cr>
   nnoremap <leader>i :LspHover<cr>
   autocmd FileType javascript setlocal omnifunc=lsp#complete
   autocmd FileType javascript.jsx setlocal omnifunc=lsp#complete

   au User lsp_setup call lsp#register_server({
      \ 'name': 'flow-language-server',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'flow-language-server --stdio']},
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
      \ 'whitelist': ['javascript', 'javascript.jsx'],
      \ })
endif
" }}}

" Switch.vim {{{
let g:switch_mapping = "!"
let g:switch_custom_definitions =
  \ [
  \   {
  \     'x\(\d\*\)\?': 'y\1',
  \     'y\(\d\*\)\?': 'x\1',
  \   },
  \   ['width', 'height'],
  \ ]

autocmd FileType gitrebase let b:switch_custom_definitions =
   \ [
   \   ['pick', 'fixup', 'squash', 'reword', 'edit', 'exec']
   \ ]
" }}}
