" vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=1:
" ----------------------------------------------------------------------------
" Name:     init.vim
" Version:  12.3
" Date:     2022-07-01
" Modified: 2022-07-25
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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
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

nohlsearch
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
nnoremap <C-b> :FloatermToggle<CR>build && run<CR>
nnoremap <C-\> :FloatermToggle<CR>

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
hi Normal           guifg=gray72           guibg=gray7 gui=none
hi Identifier       guifg=fg
hi Type             guifg=darkgoldenrod3   gui=none
hi Statement        guifg=honeydew4        gui=none
hi Constant         guifg=palevioletred3
hi Comment          guifg=slategray4
hi Special          guifg=darkgoldenrod3
hi PreProc          guifg=lightblue3
hi Todo             guifg=bg               guibg=lightblue
hi NonText          guifg=slategray4
hi ExtraWhitespace  guifg=red              guibg=red
hi StatusLine       guifg=bg               guibg=fg gui=none

hi VertSplit        guifg=bg               guibg=gray72
hi Visual                                  guibg=bg gui=inverse
hi Pmenu            guifg=fg               guibg=gray12
hi PmenuSel         guifg=bg
" }}}
