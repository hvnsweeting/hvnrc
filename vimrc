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
syntax on
colorscheme torte

set hlsearch
set incsearch
set showmatch

" Binding
nmap j gj
nmap k gk
map <F5> ggOToday: <Esc>:r !date<CR>kJ
map <F7> : !ruby %<CR>
map <F8> :!pep8 %<CR>

nmap <Leader>E :NERDTreeToggle<CR>
nmap <Leader>r :!python %<CR>
nmap <Leader>rb :!bash %<CR>
nmap <Leader>p :set paste!<CR>i
nmap <Leader>s :source $MYVIMRC<CR>
nmap <Leader>v :e $MYVIMRC<CR>
nmap <Leader># ggO#!/usr/bin/env python<Esc>o
nmap <Leader>b ggO#!/bin/bash<Esc>o
nmap <Leader>m Giif __name__ == "__main__":<CR>

if has('mouse')
  set mouse=a
endif

filetype plugin indent on
autocmd FileType text setlocal textwidth=80
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd BufNewFile,BufRead *.jinja,*.jinja2 so ~/.vim/yaml.vim
autocmd BufWritePre * :%s/\s\+$//e

" For simple status bar
function! GitBranch()
    let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    if branch != ''
        return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
    en
    return ''
endfunction

function! CurDir()
    return substitute(getcwd(), '/home/hvn', "~/", "g")
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}
