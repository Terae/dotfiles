" Basic settings ---------------------------------------------------------- {{{
" Forces Vim to source .vimrc file if it present in working directory
set exrc
set secure

syntax on

set shell=/bin/zsh

" store lots of :cmdline history
set history=1000
" }}}

" Vim behaviour ----------------------------------------------------------- {{{
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set undoreload=10000
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo
    set backupdir=~/.vim/.backup
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set nowritebackup               " do not write out changes via backup files
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.swap
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "    than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.exe
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
"set ttyfast                     " always use a fast terminal
set nocursorline                " don't highlight the current line
                                     " (useful for quick orientation, but also slow to redraw)

" Switch from block-cursor to vertical-line-cursor when going into/out of
" insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" }}}

function! EnsureDirectoryExists(path) " {{{
if !isdirectory(expand(a:path))
  call mkdir(expand(a:path))
endif
endfunction " }}}

call EnsureDirectoryExists(&undodir)
call EnsureDirectoryExists(&backupdir)
call EnsureDirectoryExists(&directory)

" Spell checking ---------------------------------------------------------- {{{
" Common abbreviations / misspellings
source ~/.vim/autocorrect.vim

function! ToggleSpellLang()
    if !&spell
        :set spelllang=en
        :set spell
    elseif &spelllang =~# 'en'
        :set spelllang=fr
    elseif &spelllang =~# 'fr'
        :set spelllang=en
        :set spell!
    endif
endfunction
" }}}

" Pulse ------------------------------------------------------------------- {{{
function! PulseCursorLine()
    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 14m

    hi CursorLine guibg=#4a4a4a
    redraw
    sleep 10m

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 14m

    hi CursorLine guibg=#2a2a2a
    redraw
    sleep 10m

    execute 'hi ' . old_hi
    setlocal nocursorline
endfunction
" }}}