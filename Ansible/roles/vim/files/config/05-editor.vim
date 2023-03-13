" Editing behaviour ------------------------------------------------------- {{{
set showmode                    " always show what mode we're currently editing in
" set nowrap                      " don't wrap lines
set lbr                         " Wrap text instead of being o one line
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set smartindent                 " does the right thing (mostly) in programs
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set scrolloff=2                 " keep 4 lines off the edges of the screen when scrolling
set hlsearch                    " highlight search terms
nohlsearch
set incsearch                   " show search matches as you type
set ic                          " insensitive search
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:»\ ,trail:·,extends:>,nbsp:.
set wildmode=longest:list,full

set list                        " show invisible characters by default,
                                " but it is disabled for some file types (see later)

set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)
set fileformats="unix,dos,mac"
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)

set nrformats=                  " make <C-a> and <C-x> play well with
                                "    zero-padded numbers (i.e. don't consider
                                "    them octal or hex)

set shortmess+=I                " hide the launch screen
set clipboard=unnamed           " normal OS clipboard interaction
set autoread                    " automatically reload files changed outside of Vim

set updatetime=1000             " Speed up the updatetime so gitgutter and friends are quicker

" Make the keyboard faaaaaaast
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50

" Same clipboard between Vim and the system
if v:version > 703
    if exists('+clipboard')
        set clipboard=unnamedplus
    endif
endif
" }}}

" Editor layout ----------------------------------------------------------- {{{
set termencoding=utf-8 nobomb
set encoding=utf-8 nobomb
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set cmdheight=2                 " use a status bar that is 2 rows high
" }}}