set expandtab
set shiftwidth=2
set softtabstop=2
set list listchars=tab:→\ ,trail:·
set mouse=a
set wildmode=longest,list,full
set wildmenu
let mapleader=" "
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
colorscheme elflord
setlocal indentkeys+=0

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'
call plug#end()

