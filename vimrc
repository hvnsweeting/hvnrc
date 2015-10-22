set nocompatible
set encoding=utf-8
set history=50

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
colorscheme peachpuff

set hlsearch
set incsearch
set showmatch

" Vim pathogen
execute pathogen#infect()

" Binding
nmap j gj
nmap k gk

nmap <Leader>E :NERDTreeToggle<CR>
nmap <Leader>p :set paste!<CR>i
nmap <Leader>s :source $MYVIMRC<CR>
nmap <Leader>v :e $MYVIMRC<CR>

filetype plugin indent on
autocmd FileType text setlocal textwidth=78
autocmd BufNewFile,BufRead *.jinja,*.jinja2 set ft=sls
autocmd BufWritePre * :%s/\s\+$//e

" Python
autocmd FileType python nmap <Leader>r :!python %<CR>
autocmd FileType python nmap <Leader># ggO#!/usr/bin/env python2<CR># -*- coding: utf-8 -*-<Esc>o
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

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1

" Ctags
let Tlist_WinWidth = 55

" For simple status bar
function! GitBranch()
    let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    if branch != ''
        return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
    en
    return ''
endfunction

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
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}\ FLAKE:%{HasFlake()}
if !exists("*Flake8()") && executable('flake8')
  autocmd BufWritePost *.py call Flake8()
endif


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
