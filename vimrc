" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set encoding=utf-8

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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

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

map <F5> ggOToday: <Esc>:r !date<CR>kJ
map <F7> : !ruby %<CR>
map <F8> :!pep8 %<CR>
nnoremap <Leader>t :TlistToggle<CR>
nnoremap <Leader>T :TlistShowPrototype<CR>

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
"For latex"
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

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

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.jinja2 set ft=jinja
filetype plugin indent on

"Git branch
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
" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}
