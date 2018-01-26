set expandtab
set shiftwidth=2
set softtabstop=2
set list listchars=tab:→\ ,trail:·

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'ElmCast/elm-vim'
Plug 'kudabux/vim-srcery-drk'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-airline'
call plug#end()

colorscheme srcery-drk
setlocal indentkeys+=0
