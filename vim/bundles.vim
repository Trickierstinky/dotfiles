"
"  Vundle configuration
"
set nocompatible
filetype off

" let Vundle manage Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-unimpaired'
" Plugin 'flazz/vim-colorschemes'
Plugin 'briandoll/change-inside-surroundings.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tomtom/quickfixsigns_vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tomtom/tcomment_vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ap/vim-buftabline'
Plugin 'marciomazza/vim-brogrammer-theme'
Plugin 'mileszs/ack.vim'


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
