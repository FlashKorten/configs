runtime! debian.vim
call pathogen#infect()
if has("syntax")
  syntax on
endif
set background=dark

if has("autocmd")
  filetype plugin indent on
endif

set showcmd    " Show (partial) command in status line.
set showmatch  " Show matching brackets.
set ignorecase " Do case insensitive matching
set smartcase  " Do smart case matching
set incsearch  " Incremental search
"set autowrite " Automatically save before commands like :next and :make
"set hidden    " Hide buffers when they are abandoned
"set mouse=a   " Enable mouse usage (all modes)

runtime macros/matchit.vim

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

colorscheme vividchalk
set number
"set list
set autoindent
set expandtab
set tabstop=2 shiftwidth=2
set backspace=indent,eol,start
set ignorecase
set smartcase
set t_Co=256
set nrformats=
set history=200
set wildmode=longest,list
set pastetoggle=<F2>
let mapleader=","
let g:UltiSnipsExpandTrigger = "<c-j>"
nnoremap <F5> :GundoToggle<CR>

" Unobtrusive highlighting of whitespace at the end of a line
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

au BufNewFile,BufRead *.ftl set filetype=html.ftl
au Filetype java setlocal omnifunc=javacomplete#Complete

" au Bufenter *.hs compiler ghc
" let g:haddock_browser = "/usr/bin/firefox"
" let g:ghc = "/opt/lang/haskell/7.4.2/bin/ghc"
" let g:haddock_docdir = "/opt/lang/haskell/7.4.2/share/doc/ghc/html/"
" let g:haddock_indexfiledir = "/home/sebastian/.haddock_indexfiledir/"
