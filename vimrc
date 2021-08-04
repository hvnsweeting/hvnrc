set nocompatible
set encoding=utf-8
set history=50
let $PATH=$PATH.':/usr/local/bin/:'
"
" fzf
"
set runtimepath+=~/.fzf

" Indenting
set autoindent
set cindent
set smartindent
"
" Tab
set expandtab
set sw=4
set ts=4

filetype plugin indent on

set directory=$HOME/.vim/swapfiles/

set backspace=indent,eol,start
set cursorline
set colorcolumn=80
set nu
set ruler
set showcmd
syntax on

set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" Autosetup vim plug
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
" Initialize plugin system
"
"
"Plug 'Valloric/YouCompleteMe'

"Plug 'https://github.com/davidhalter/jedi-vim.git'

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
"Plug 'https://github.com/ElmCast/elm-vim.git'
"Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/morhetz/gruvbox.git'
"Plug 'https://github.com/udalov/kotlin-vim'
"Plug 'https://github.com/scrooloose/nerdtree.git'
"Plug 'https://github.com/elixir-lang/vim-elixir.git'
"Plug 'https://github.com/nvie/vim-flake8.git'
"Plug 'git://github.com/tpope/vim-fugitive.git'

Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plug 'reasonml-editor/vim-reason-plus'

" Broken Plug 'MarcWeber/vim-addon-nix'
"Plug 'LnL7/vim-nix'

"Plug 'https://github.com/zah/nim.vim'

" nice to have
"Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

call plug#end()

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ReasonML
"let g:LanguageClient_serverCommands = {
"    \ 'reason': ['/absolute/path/to/reason-language-server.exe'],
"    \ }
"" enable autocomplete
"let g:deoplete#enable_at_startup = 1
autocmd FileType reason nmap <Leader>r :!yarn build && node src/Demo.bs.js<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" For macvim
if has("gui_macvim")
  colorscheme gruvbox
  set guifont=Menlo:h14
  set spell
else
  " terminal
  set background=dark
  colorscheme gruvbox
endif

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree |   wincmd l | endif
let g:NERDTreeChDirMode=2

" close vim if the only window left open is a NERDTree
" TODO, not work autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Binding
nnoremap j gj
nnoremap k gk
" move to curdir
nmap gc :cd %:h<CR>


nmap <Leader>l :set background=light<CR>
nmap <Leader>ag :grep
nmap <Leader>rg :vimgrep! // %
" Pattern /^\./ to search all CSS class in current CSS file
" Pattern /^def / to search all function def in Python file
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
nmap <Leader>mkt :!make test<CR>


" TODO Toggle
nmap <C-H> :vs ~/.vimnotebook.md<CR>

autocmd FileType text setlocal textwidth=78
autocmd BufNewFile,BufRead *.jinja,*.jinja2 set ft=sls
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufNewFile,BufRead *.hy set ft=clojure

" Python
autocmd FileType python nmap <Leader>r :!python %<CR>
autocmd FileType python nmap <Leader># ggO#!/usr/bin/env python<CR># -*- coding: utf-8 -*-<Esc>o
autocmd FileType python nmap <Leader>m Giif __name__ == "__main__":<CR>
autocmd FileType python nmap <Leader>fmt :!~/py3/bin/black -l79 %<CR>
"autocmd FileType python set omnifunc=pythoncomplete#Complete

" Shell
autocmd FileType sh nmap <Leader>r :!bash %<CR>
autocmd FileType sh nmap <Leader># ggO#!/bin/bash<Esc>o

" Golang
let g:go_version_warning = 0
let g:go_auto_type_info = 1
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
autocmd FileType elixir nmap <Leader>t :!mix test --no-color<CR>
autocmd FileType elixir nmap <Leader>tl :execute '!mix test --trace --no-color ' . expand('%:p') . ':' . line('.')<CR>
autocmd FileType elixir nmap <Leader>tc :!mix test --trace --no-color %<CR>
autocmd FileType elixir nmap <Leader>tt :!mix test --trace --no-color<CR>
" Haskell
autocmd FileType haskell nmap <Leader>r :!runhaskell %<CR>

" Ocaml
autocmd FileType ocaml nmap <Leader>r :!ocaml %<CR>
autocmd FileType ocaml nmap <Leader>rr :!ocaml %

" Chicken scheme
autocmd FileType scheme nmap <Leader>b :!csc %:p<CR>
autocmd FileType scheme nmap <Leader>r :!csc %:p && ./%:r<CR>

" Nim
autocmd FileType nim nmap <Leader>r :!nim c -r %:p<CR>
autocmd FileType nim nmap <Leader>rs :!nim c -d:ssl -r %:p<CR>
autocmd FileType nim nmap <Leader>rp :!nim c -d:ssl --threads:on -r %:p<CR>
autocmd FileType nim nmap <Leader>rr :!nim c -d:ssl -r %:p

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

let g:flake8_cmd=glob("~/py3/bin/flake8")
function! HasFlake()
  if exists("*Flake8") && executable(g:flake8_cmd)
      return 'Yes'
  endif
  return 'NO'
endfunction

autocmd BufWritePost *.py call flake8#Flake8()

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L\ %{fugitive#statusline()}\ FLAKE:%{HasFlake()}


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

nnoremap <C-L> :call <SID>ToggleQuickFix()<cr>
function! s:ToggleQuickFix()
  for buffer in tabpagebuflist()
    if bufname(buffer) == ''
      " then it should be the quickfix window
      cclose
      return
    endif
  endfor
  copen
endfunction


setlocal rtp+=~/.opam/default/share/merlin/vim
setlocal rtp^="~/.opam/default/share/ocp-indent/vim"
