" Vundle settings --------------------------------------------------------- {{{
" https://github.com/VundleVim/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Git {{{
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
" }}}

" Ruby {{{
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'

" Insert 'end' automatically
Plugin 'tpope/vim-endwise'
" }}}

" Plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'ervandew/supertab'
" :GV - commit browser
" :GV! only commits for current file
"  o or <cr> on a commit to display the content of it
"  o or <cr> on commits to display the diff in the range
"  O opens a new tab instead
"  gb for :Gbrowse
"  ]] and [[ to move between commits
"  . to start command-lline with :Git [CURSOR] SHA à la fugitive
"  q to close
Plugin 'junegunn/gv.vim'
Plugin 'kracejic/themeinabox.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'mileszs/ack.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'tmhedberg/SimpylFold'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/a.vim'
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'pearofducks/ansible-vim'
Plugin 'phenomenes/ansible-snippets'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on
filetype plugin on
" }}}