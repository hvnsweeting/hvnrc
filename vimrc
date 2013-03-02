" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

if has('mouse')
  set mouse=a
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set nu
set expandtab
set ts=4
set hlsearch
set sw=4
set cindent
set backupdir=/tmp
set directory=/tmp
set colorcolumn=80
set autoindent
set smartindent
set showmatch
set cursorline
colorscheme desert

map <F4> :TlistToggle<CR>
map <F5> ggOToday: <Esc>:r !date<CR>kJ
map <F7> : !ruby %<CR>
map <F8> :!pep8 %<CR>
map T :TaskList<CR>

nmap j gj
nmap k gk
nmap <Leader>E :NERDTreeToggle<CR>
nmap <Leader>r :!python %<CR>
nmap <Leader>rb :!bash %<CR>
nmap <Leader>p :set paste!<CR>i
nmap <Leader>s :source $MYVIMRC<CR>
nmap <Leader>v :e $MYVIMRC<CR>
nmap <Leader>z :e ~/.zshrc<CR>
nmap <Leader># ggO#!/usr/bin/env python<Esc>o
nmap <Leader>b ggO#!/bin/bash<Esc>o
nmap <Leader>m Giif __name__ == "__main__":<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInString=1
"For latex"
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

"miniBuf"
""let g:miniBufExplMapWindowNavVim = 1
""let g:miniBufExplMapWindowNavArrows = 1
""let g:miniBufExplMapCTabSwitchBufs = 1
""et g:miniBufExplModSelTarget = 1 

" Rope AutoComplete
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
let g:ropevim_autoimport_modules = ["os.*","traceback","django.*","xml.etree"]
imap <C-Space> <C-R>=RopeCodeAssistInsertMode()<CR>

"Taglist abovenerdtree"
let Tlist_Use_Split_Window = 1
"com TT NERDTree | TlistToggle

"Switching between windows"
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

filetype plugin indent on
