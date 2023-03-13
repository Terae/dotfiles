" only do this part when compiled with support for autocommands
if has("autocmd")
    autocmd BufNewFile,BufRead *.md,*.tex,*.latex,*.tex set spell spelllang=en

    " Restore cursor position upon reopening files ---------------------------- {{{
    autocmd BufReadPost *
        \ if &filetype != "gitcommit" && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
    " }}}

    " Filetype specific handling ---------------------------------------------- {{{
    augroup invisible_chars "{{{
        au!

        " Show invisible characters in all of these files
        autocmd filetype vim setlocal list
        autocmd filetype python,rst setlocal list
        autocmd filetype ruby setlocal list
        autocmd filetype javascript,css setlocal list
    augroup end "}}}

    augroup vim_files "{{{
        au!

        " Bind <F1> to show the keyword under cursor
        " general help can still be entered manually, with :h
        autocmd filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
        autocmd filetype vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>

        autocmd filetype vim setlocal foldmethod=marker
        autocmd filetype vim setlocal nolinebreak

        autocmd filetype vim nnoremap <buffer> <F5> :source %<CR>

        autocmd filetype vim setlocal keywordprg=:help
    augroup end "}}}

    augroup html_files "{{{
        au!

        " This function detects, based on HTML content, whether this is a
        " Django template, or a plain HTML file, and sets filetype accordingly
        fun! s:DetectHTMLVariant()
            let n = 1
            while n < 50 && n < line("$")
                " check for django
                if getline(n) =~ '{%\s*\(extends\|load\|block\|if\|for\|include\|trans\)\>'
                    set ft=htmldjango.html
                    return
                endif
                let n = n + 1
            endwhile
            " go with html
            set ft=html
        endfun

        " Auto-tidy selection
        vnoremap <leader>x :!tidy -q -i --show-errors 0 --show-body-only 1 --wrap 0<cr><cr>

        autocmd BufNewFile,BufRead *.html,*.htm,*.j2 call s:DetectHTMLVariant()
    augroup end " }}}

    augroup python_files "{{{
        au!

        " This function detects, based on Python content, whether this is a
        " Django file, which may enabling snippet completion for it
        fun! s:DetectPythonVariant()
            let n = 1
            while n < 50 && n < line("$")
                " check for django
                if getline(n) =~ 'import\s\+\<django\>' || getline(n) =~ 'from\s\+\<django\>\s\+import'
                    set ft=python.django
                    "set syntax=python
                    return
                endif
                let n = n + 1
            endwhile
            " go with html
            set ft=python
        endfun
        autocmd BufNewFile,BufRead *.py call s:DetectPythonVariant()

        " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
        " earlier, as it is important)
        autocmd filetype python setlocal textwidth=78
        autocmd filetype python match ErrorMsg '\%>120v.\+'

        " But disable autowrapping as it is super annoying
        autocmd filetype python setlocal formatoptions-=t

        " Folding for Python (uses syntax/python.vim for fold definitions)
        "autocmd filetype python,rst setlocal nofoldenable
        "autocmd filetype python setlocal foldmethod=expr

        " Python runners
        autocmd filetype python noremap <buffer> <F5> :w<CR>:!python %<CR>
        autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
        autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
        autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>

        " Automatic insertion of breakpoints
        autocmd filetype python nnoremap <buffer> <leader>bp :normal oimport pdb; pdb.set_trace()  # TODO: BREAKPOINT  # noqa<Esc>

        " Run a quick static syntax check every time we save a Python file
        " autocmd BufWritePost *.py call Flake8()

        " Defer to isort for sorting Python imports (instead of using Unix sort)
        autocmd filetype python nnoremap <leader>s mX:%!isort -<cr>`X:redraw!<cr>
        autocmd FileType python setlocal foldmethod=indent
    augroup end " }}}

    augroup js_files "{{{
        au!

        autocmd filetype javascript setlocal foldmethod=syntax

        " Defer to import-sort for sorting JavaScript imports (instead of using Unix sort)
        " autocmd filetype javascript nnoremap <leader>s :StopAutoSortImport<cr>:w<cr>:SortImport<cr>:StartAutoSortImport<cr>
        autocmd filetype javascript nnoremap <leader>s :write<cr>

    augroup end " }}}

    augroup clojure_files "{{{
        au!

        " Set up <leader>r to run the entire file with vim-fireplace
        autocmd filetype clojure nnoremap <leader>r :%Eval<cr>
        autocmd filetype clojure RainbowParenthesesActivate
        autocmd filetype clojure RainbowParenthesesLoadRound
        autocmd filetype clojure RainbowParenthesesLoadSquare
        autocmd filetype clojure RainbowParenthesesLoadBraces
    augroup end " }}}

    augroup supervisord_files "{{{
        au!

        autocmd BufNewFile,BufRead supervisord.conf set ft=dosini
    augroup end " }}}

    augroup markdown_files "{{{
        au!

        autocmd filetype markdown noremap <buffer> <leader>p :w<CR>:!open -a 'Marked 2' %<CR><CR>
        autocmd filetype markdown setlocal wrap
        autocmd filetype markdown setlocal linebreak
        autocmd filetype markdown nnoremap <buffer> j gj
        autocmd filetype markdown nnoremap <buffer> k gk
    augroup end " }}}

    augroup ruby_files "{{{
        au!

    augroup end " }}}

    augroup rst_files "{{{
        au!

        " Auto-wrap text around 74 chars
        autocmd filetype rst setlocal textwidth=74
        autocmd filetype rst setlocal formatoptions+=nqt
        autocmd filetype rst match ErrorMsg '\%>74v.\+'
    augroup end " }}}

    augroup css_files "{{{
        au!

        autocmd filetype css,less setlocal foldmethod=marker foldmarker={,}
    augroup end "}}}

    augroup javascript_files "{{{
        au!

        autocmd filetype javascript setlocal expandtab
        autocmd filetype javascript setlocal listchars=trail:·,extends:#,nbsp:·
        autocmd filetype javascript setlocal foldmethod=marker foldmarker={,}

        " Enable insertion of "debugger" statement in JS files
        autocmd filetype javascript nnoremap <leader>b Odebugger;<esc>

    augroup end "}}}

    augroup textile_files "{{{
        au!

        autocmd filetype textile set tw=78 wrap

        " Render YAML front matter inside Textile documents as comments
        autocmd filetype textile syntax region frontmatter start=/\%^---$/ end=/^---$/
        autocmd filetype textile highlight link frontmatter Comment
    augroup end "}}}

    augroup git_files "{{{
        au!

        " Don't remember the last cursor position when editing commit
        " messages, always start on line 1
        autocmd filetype gitcommit call setpos('.', [0, 1, 1, 0])
    augroup end "}}}
    " }}}
endif