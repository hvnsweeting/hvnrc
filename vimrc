set nocompatible
set encoding=utf-8
set history=50
"
" For macvim
if has("gui_running")
  if has("gui_macvim")
    set guifont=Go\ Mono:h14
  endif
endif

" Indenting
set autoindent
set cindent
set smartindent
"
" Tab
set expandtab
set sw=4
set ts=4

set backspace=indent,eol,start
set cursorline
set colorcolumn=80
set nu
set ruler
set showcmd
set spell
syntax on

set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

set wildmenu
set autochdir

" Vim pathogen
if !empty(glob("~/.vim/autoload/pathogen.vim"))
  execute pathogen#infect()
endif

" solarized was cloned to install by pathogen
" git://github.com/altercation/vim-colors-solarized.git

colorscheme default
" colorscheme badwolf
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    colorscheme solarized
endif

"" open a NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"let g:NERDTreeChDirMode=2

" close vim if the only window left open is a NERDTree
" TODO, not work autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Binding
nnoremap j gj
nnoremap k gk
" move to curdir
nmap gc :cd %:h<CR>


nmap <Leader>ag :grep
nmap <Leader>p :se paste!<CR>i
nmap <Leader>src :source $MYVIMRC<CR>
nmap <Leader>erc :e $MYVIMRC<CR>
nmap <C-K> :q<CR>
nmap <C-X> :e#<CR>
nmap <C-T> :tabe<CR>
nmap <C-E> :NERDTreeToggle<CR>
nmap <tab> :tabnext<CR>
nmap <S-tab> :tabprevious<CR>
nmap <C-N> :next<CR>
nmap <C-B> :prev<CR>

nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>tig :cd %:h<CR>:! tig<CR>

" fugitive
nmap <Leader>gs :Gstatus<CR>
" j = down in vim
nmap <Leader>gj :Git pull<CR>
nmap <Leader>gd :Git diff<CR>
nmap <Leader>ga :Git add %<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Git push origin HEAD<CR>
nmap <Leader>gn :Git checkout -b
nmap <Leader>gm :Git checkout master<CR>
nmap <Leader>gb :Git checkout
nmap <Leader>gf :Git fetch --all --prune -v<CR>
nmap <Leader>gr :Git rebase -i origin/

nmap <Leader>mk :!make<CR>


" TODO Toggle
nmap <C-H> :vs ~/.vimnotebook.md<CR>

filetype plugin indent on
autocmd FileType text setlocal textwidth=78
autocmd BufNewFile,BufRead *.jinja,*.jinja2 set ft=sls
autocmd BufWritePre * :%s/\s\+$//e

" Python
autocmd FileType python nmap <Leader>r :!python %<CR>
autocmd FileType python nmap <Leader># ggO#!/usr/bin/env python<CR># -*- coding: utf-8 -*-<Esc>o
autocmd FileType python nmap <Leader>m Giif __name__ == "__main__":<CR>
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Shell
autocmd FileType sh nmap <Leader>r :!bash %<CR>
autocmd FileType sh nmap <Leader># ggO#!/bin/bash<Esc>o

" Golang
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage)
autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
autocmd FileType go nmap <Leader>m Gipackage main<CR><CR>import (<CR>"log"<CR>)<CR>func main() {<CR>}<ESC>O

" elixir
autocmd FileType elixir nmap <Leader>r :!elixir %<CR>
" Haskell
autocmd FileType haskell nmap <Leader>r :!runhaskell %<CR>

" Rust
let g:rustfmt_autosave = 1
autocmd FileType rust nmap <Leader>r :!cargo run <CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"let g:go_auto_type_info = 1

" Ctags
let Tlist_WinWidth = 55
map T :TaskList<CR>
" D stands for def
map D :TlistToggle<CR>

function! CurDir()
    return substitute(getcwd(), expand("$HOME"), "~", "g")
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

function! HasFlake()
  if !exists("*Flake8()") && executable('flake8')
      return ''
  endif
  return 'NO'
endfunction

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L\ %{fugitive#statusline()}\ FLAKE:%{HasFlake()}
if !exists("*Flake8()") && executable('flake8')
  autocmd BufWritePost *.py call Flake8()
endif


" The Silver Searcher
if executable('rg')
  " Use rg over grep
  " https://github.com/BurntSushi/ripgrep
  set grepprg=rg\ --no-heading\ --color=never

  " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg %s -l --color=never -g ""'

  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
