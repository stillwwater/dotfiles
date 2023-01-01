" vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=1:
" ----------------------------------------------------------------------------
" Name:     init.vim
" Version:  12.6
" Date:     2022-07-01
" Modified: 2023-01-01
" Author:   stillwwater@gmail.com
" ----------------------------------------------------------------------------

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'voldikss/vim-floaterm'
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

set cino=N-s  " Don't indent namespace
set cino+=:0  " Don't indent switch labels
set cino+=l1  " Don't align case braces
set cino+=L0  " Don't auto unindent labels
set cino+=g0  " Don't indent public: or private: labels

if has('win32')
    set shell=cmd.exe
endif

nohlsearch

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
" }}}

" KEYMAP ----------------------------------------------------------------- {{{
let mapleader = ','

nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>n :noh<CR>
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
nnoremap <C-\> :FloatermToggle<CR>
nnoremap ga <Plug>(EasyAlign)
nnoremap <leader>l :hi Normal guibg=#22272E<CR>
nnoremap <leader>L :hi Normal guibg=gray8<CR>
nnoremap <C-s> :!dev && build.bat /run<CR>

inoremap <C-n> <cmd>lua require('cmp').complete()<CR>
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

tnoremap <Esc> <C-\><C-n>
tnoremap <C-w> <C-\><C-n><C-w>
tnoremap <C-\> <C-\><C-n>:FloatermToggle<CR>
" }}}

" COLORS ----------------------------------------------------------------- {{{
set termguicolors
hi clear
hi Normal           guifg=gray72           guibg=gray8 gui=none
"hi Identifier       guifg=fg
"hi Function         guifg=#969dcb
"hi Type             guifg=#cfcfbf          gui=none
"hi Statement        guifg=#969dcb          gui=none
"hi Constant         guifg=cyan3
"hi String           guifg=#b4c4b4
"hi Comment          guifg=slategray4
"hi Special          guifg=rosybrown4
"hi PreProc          guifg=lightblue3
hi Todo             guifg=bg               guibg=lightblue
hi NonText          guifg=slategray4
hi ExtraWhitespace  guifg=red              guibg=red
hi StatusLine       guifg=bg               guibg=fg gui=none
hi StatusLineNC     guifg=gray36           guibg=fg gui=none
hi TabLineFill      guifg=bg               guibg=fg gui=none
hi TabLineSel       guifg=bg               guibg=fg gui=none
hi TabLine          guifg=bg               guibg=fg gui=none

hi VertSplit        guifg=bg               guibg=gray72
hi Visual                                  guibg=bg gui=inverse
hi Pmenu            guifg=fg               guibg=bg
hi PmenuSel         guifg=bg               guibg=fg
" }}}
