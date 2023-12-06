" vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=1:
" ----------------------------------------------------------------------------
" Name:     init.vim
" Version:  12.8
" Date:     2022-07-01
" Modified: 2023-12-05
" Author:   stillwwater@gmail.com
" ----------------------------------------------------------------------------

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'stillwwater/wm.vim'
call plug#end()

lua require('plugins')
" }}}

" OPTIONS ---------------------------------------------------------------- {{{
syntax on
set mouse=a
set tabstop=4 shiftwidth=4 softtabstop=4
set backspace=indent,eol,start
set expandtab
set smartindent
set laststatus=2
set showtabline=2
set noerrorbells
set belloff=all
set ignorecase
set smartcase
set incsearch
set hlsearch
set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos
set completeopt=
set pumheight=12
set pumwidth=10
set clipboard=unnamedplus
set guicursor=
set nofoldenable
set foldlevel=99
set foldmethod=syntax

set cino=N-s  " Don't indent namespace
set cino+=:0  " Don't indent switch labels
set cino+=l1  " Don't align case braces
set cino+=L0  " Don't auto unindent labels
set cino+=g0  " Don't indent public: or private: labels

if has('win32')
    set shell=cmd.exe
endif

nohlsearch

let c_no_curly_error = 0 " vim doesn't like C99 braces

let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_markdown_css = ''

let g:matchparen_timeout = 6
let g:matchparen_insert_timeout = 6

let g:easy_align_delimiters = {
  \ '\': {
  \     'pattern': '\\$',
  \ },
  \ }

" }}}

" AUTOCOMMANDS ----------------------------------------------------------- {{{
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufReadPost *.vert set syntax=c
autocmd BufReadPost *.frag set syntax=c
" }}}

" KEYMAP ----------------------------------------------------------------- {{{
let mapleader = ','

nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <PageUp> <PageUp>zz
nnoremap <PageDown> <PageDown>zz
nnoremap <C-Up> {
nnoremap <C-Down> }
nnoremap <C-k> {
nnoremap <C-j> }
nnoremap <leader>h :ClangdSwitchSourceHeader<CR>
nnoremap <C-l> :nohl<CR><C-l>
nnoremap <leader>tm :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>
nnoremap <C-p> :lua require'telescope.builtin'.find_files({layout_strategy='vertical'})<CR>
nnoremap <C-c> i
nnoremap ga <Plug>(EasyAlign)
nnoremap <leader>l :hi Normal guibg=#22272E<CR>
nnoremap <leader>L :hi Normal guibg=gray8<CR>

if has('win32')
    nnoremap <C-s> :!dev && make.cmd /r<CR>
endif

inoremap <C-n> <cmd>lua require('cmp').complete()<CR>
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

tnoremap <Esc> <C-\><C-n>
" }}}

" COLORS ----------------------------------------------------------------- {{{
set termguicolors
hi clear
colorscheme lunaperche

hi link Function Normal
hi Normal           guifg=gray76           guibg=gray6  gui=none

hi Todo             guifg=bg               guibg=lightblue gui=none
hi NonText          guifg=slategray4
hi ExtraWhitespace  guifg=red              guibg=red
hi StatusLine       guifg=bg               guibg=fg     gui=none
hi StatusLineNC     guifg=gray36           guibg=fg     gui=none
hi TabLineFill      guifg=bg               guibg=bg     gui=none
hi TabLineSel       guifg=bg               guibg=white  gui=none
hi TabLine          guifg=bg               guibg=gray46 gui=none

hi VertSplit        guifg=fg               guibg=none
hi Visual           guifg=none             guibg=bg gui=inverse
hi Pmenu            guifg=gray62           guibg=bg
hi PmenuSel         guifg=bg               guibg=fg
" }}}
