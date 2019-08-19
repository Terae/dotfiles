#!/bin/bash
home="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$home"/script/installer.sh

print_information "Installation of VIM"

install_if_needed curl
install_if_needed git
install_if_needed vim

cp "$home"/vim/vimrc ~/.vimrc

info "Installation of vim::Vundle"
mkdir -p ~/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

exit

info "Installation of vim::pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

info "Installation of vim::bundles"
cd ~/.vim/bundle
git clone https://github.com/Rip-Rip/clang_complete
git clone https://github.com/chrisbra/csv.vim.git
git clone https://github.com/mattn/gist-vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/rust-lang/rust.vim.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/ntpeters/vim-better-whitespace.git
git clone https://github.com/tpope/vim-dispatch.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/svermeulen/vim-easyclip.git
git clone https://github.com/plasticboy/vim-markdown.git
git clone https://github.com/maciakl/vim-neatstatus.git
git clone https://github.com/sheerun/vim-polyglot.git
git clone https://github.com/tpope/vim-repeat.git
git clone https://github.com/kshenoy/vim-signature.git
git clone https://github.com/mattn/webapi-vim.git
# git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git

