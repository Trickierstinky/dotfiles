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
Plugin 'Lokaltog/vim-powerline'
Plugin 'sheerun/vim-polyglot'
Plugin 'tomtom/tcomment_vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'marciomazza/vim-brogrammer-theme'
Plugin 'mileszs/ack.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'ap/vim-css-color'
" All of your Plugins must be added before the following line

call vundle#end()
filetype plugin indent on
