" vi compatible off
set nocompatible
" auto start new line off
set textwidth=0
" auto backup off
set nobackup
" auto reload file, if the file chenge in other editor
set autoread
" not make swap file
set noswapfile
" able to open other file, ever if a file is not saved
set hidden
" able to delete : indent, eol, forwards
set backspace=indent,eol,start
" beep sound off
set vb t_vb=
" no turn at end
set nowrap
" show command
set showcmd
" show current mode
set showmode
" clipboard set : unnamed, system
set clipboard=unnamed,autoselect
" colorscheme is defined at plugin
syntax on
" encoding
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp
" indent
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" search
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" enable mouse support
set mouse=a
" share copies with system clipboard
set guioptions+=a
" enable mouse support
set ttymouse=xterm2
" en message
language C
" display cursor location
set ruler
" show correspond bracket
set showmatch
" set row number
set number
" show cursor line
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
" view of statusline
set statusline=%=\ [%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%04l,%04v][%p%%]
" disp. ststusline on
set laststatus=2
" trim white space when the file saved
autocmd BufWritePre * :%s/\s\+$//ge
" non stop cursor
set whichwrap=b,s,h,l,<,>,[,]
" display zenkakuspace
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
autocmd FileType json,yaml setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2

