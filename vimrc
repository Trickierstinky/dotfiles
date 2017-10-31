" Forget being compatible with good ol' vi
set nocompatible

" Default encoding
set encoding=utf-8

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

"
" Vundle configuration
"
source ~/.vim/bundles.vim

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Tabs are shown as 2 spaces
set softtabstop=2
set shiftwidth=2

" When 'Search next' reach the end of the file, it wraps around the beginning
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Command line height
set ch=2

" set visual bell
set vb

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Keep some stuff in the history
set history=100

" Make the command-line completion better
set wildmenu

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" don't initially wrap
set nowrap

" When wrap is on, show breaks with symbol
let &showbreak = '↳ '

" Indent lines
set autoindent
set smartindent

" Turn tabs into spaces
set expandtab

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Display line number
set number

" Lines above/below cursor when scrolling
set scrolloff=5

" Minimal columns displayed when scrolling horizontally
set sidescrolloff=5

" Enable scrolling horizontally column by column
set sidescroll=1

" Apparence
set background=dark
set t_Co=256
colorscheme brogrammer

" Highlight current line
set cursorline

" Enable the mouse
set mouse=a
set ttymouse=xterm2

" Merge selection and system clipboard
set clipboard=unnamedplus,unnamed,autoselect,exclude:cons\|linux

" Isolate swap and backup files to a single directory
set backupdir=~/.vim/.backupdir,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/.backupdir,~/.tmp,~/tmp,/var/tmp,/tmp

" Yes, we have a fast terminal
set ttyfast

" Move the cursor to the matching pair of (){}[]
set showmatch

" Indent to the nearest tabstop when using > and <
set shiftround


"
" Mappings
"

" Map leader
let mapleader = ","

" Remap ' as ` because ` remembers line AND column for marks
" 'a will jump to the line in the current file marked with ma
" `a will jump to the line and column marked with ma
nnoremap ' `

" By default, <C-e> and <C-y> scroll the viewport a single line. Speed this up:
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" set text wrapping toggles
nmap <silent> <Leader>w :setl invwrap<CR>:setl wrap?<CR>

" Highlight all instances of the current word under the cursor
nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Show/Hide search highlighting
map <Leader>l :setl hlsearch!<CR>

" Edit vimrc file (mnemonic for the key sequence is 'e'dit 'v'imrc)
nmap <silent> <Leader>ev :e $MYVIMRC<CR>

" Source vimrc file (mnemonic for the key sequence is 's'ource 'v'imrc)
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" Ctrl-s for saving.
" Needs in the shell: stty -ixon -ixoff
nmap <C-s> :update<CR>
vmap <C-s> <C-c>:update<CR>
imap <C-s> <C-o>:update<CR>

" Using vim-impaired, enable moving lines
" - Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" - Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv


" Indent/unindent visual mode selection
vmap <tab> >gv
vmap <S-tab> <gv

" Easy navigation between windows
map <C-h> <C-w>h
map <C-l> <C-w>l

"
" Autoexec commands
"

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Show warning on focus when file has been modified by an external program
set updatetime=100
au BufWinEnter * checktime

" Enhance % for matching if/end/tags in some language (html, jsp...)
runtime macros/matchit.vim


"
" GVim configuration
"
if has('gui_running')
  "set guifont=Monospace\ Bold\ 9
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 10

  " Turn off toolbar and menu
  set guioptions-=T
  set guioptions-=m

  " Window size
  set lines=50 columns=120
end


"
" CtrlP
"

nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprev<CR>

" Opens buffer list
map <Leader>b :CtrlPBuffer<CR>

" Some more ignored dirs
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\target$\|\.class$\|\.settings\|node_modules\|DS_Store\|public\/system$'
" Increase windows height
let g:ctrlp_max_height = 30

set backspace=indent,eol,start
set colorcolumn=80,120

" Completeion
:set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_w = 1

map <Leader>` :Errors<CR>
map <Leader>1 :lopen<CR>
map <Leader>2 :lclose<CR>
map <Leader>3 :lnext<CR>

"OS X and Windows systems only have 1 clipboard
noremap <C-S-c> "+y<CR>
noremap <C-S-v> "+p<CR>

let g:buftabline_indicators = 1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


"Reindent
map <F7> mzgg=G`z

"Highlight and remove whitespace
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch

  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()

nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

"sort lines
vnoremap <F9> :sort<CR>

"move lines
nnoremap <S-k> :m .-2<CR>==
nnoremap <S-j> :m .+1<CR>==

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
