"        _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"

syntax on
set mouse=a  " :O
set laststatus=2

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set cino=N-s  " Don't indent namespace
set cino+=:0  " Don't indent switch labels
set cino+=g0  " Don't indent public: or private: labels

set splitbelow

" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

map [1;5A <C-Up>
map [1;5B <C-Down>

" 2 spaces
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2

" Tabs
autocmd FileType go setlocal ts=4 sw=4 noexpandtab
autocmd FileType asm setlocal ts=8 sw=8 noexpandtab
autocmd FileType masm setlocal ts=8 sw=8 noexpandtab

" Sign column for coc.nvim
set signcolumn=yes

let mapleader = ","

" Pretty much the default status line but using virtual column
" instead of actual column
set statusline=%f\ %w%m%r\ %=%(%l,%v\ %=\ \ \ \ \ \ \ \ \ \ %P%)

" _____  _             _
" |  __ \| |           (_)
" | |__) | |_   _  __ _ _ _ __  ___
" |  ___/| | | | |/ _` | | '_ \/ __|
" | |    | | |_| | (_| | | | | \__ \
" |_|    |_|\__,_|\__, |_|_| |_|___/
"                  __/ |
"                 |___/

if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

Plug 'omnisharp/omnisharp-vim'
Plug 'tpope/vim-dispatch'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'bfrg/vim-cpp-modern'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/ShaderHighLight'
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim'
Plug 'dense-analysis/ale'

Plug 'stillwwater/vim-nebula'
Plug 'srcery-colors/srcery-vim'
Plug 'rakr/vim-two-firewatch'
Plug 'relastle/bluewery.vim'
Plug 'ciaranm/inkpot'
Plug 'morhetz/gruvbox'
Plug 'protesilaos/prot16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dylanaraps/wal.vim'
Plug 'fcpg/vim-fahrenheit'
Plug 'haishanh/night-owl.vim'
Plug 'owickstrom/vim-colors-paramount'
Plug 'reedes/vim-colors-pencil'
Plug 'noahfrederick/vim-hemisu/'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'axvr/photon.vim'
Plug 'andreypopp/vim-colors-plain'
Plug 'nanotech/jellybeans.vim'

set t_Co=256

filetype plugin indent on

" Initialize plugin system
call plug#end()

"  _______ _
" |__   __| |
"    | |  | |__   ___ _ __ ___   ___
"    | |  | '_ \ / _ \ '_ ` _ \ / _ \
"    | |  | | | |  __/ | | | | |  __/
"    |_|  |_| |_|\___|_| |_| |_|\___|
"

" vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Enable the theme
syntax enable
set background=dark
colorscheme nebula

" User terminal background
hi! Normal ctermbg=NONE guibg=NONE

" Italics on comments: yikes
hi Comment cterm=NONE gui=NONE

" Todo files
au BufNewFile,BufRead todo.txt set filetype=task

" Highlight ALL_UPPERCASE as constants
syn match MacroConstant '\v\w@<!(\u|_+[A-Z0-9])[A-Z0-9_]*\w@!'
hi link MacroConstant Constant

" Vector types
syn match VectorType '\v\w@<!(float|int|double|char|bool)[2-8](x[2-8])?\w@!'
syn match SSEType '\v\w@<!__m128(i)?\w@!'
hi link VectorType Type
hi link SSEType    Type

hi link typescriptFuncKeyword Type
hi link typescriptExport      Type
hi link typescriptImport      Type

hi link csUserType            Normal
hi link csOpSymbols           Normal
hi link csUserIdentifier      Normal
hi link csUserMethod          Function

hi link cppUserTypedefs       Type

"  _  __          _     _           _
" | |/ /         | |   (_)         | |
" | ' / ___ _   _| |__  _ _ __   __| |
" |  < / _ \ | | | '_ \| | '_ \ / _` |
" | . \  __/ |_| | |_) | | | | | (_| |
" |_|\_\___|\__, |_.__/|_|_| |_|\__,_|
"            __/ |
"           |___/
"

" Move line down
nnoremap <C-Down> :m .+1<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv

" Move line up
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Up> :m '<-1<CR>gv=gv

" Toggle insert (when using laptops without esc key)
nmap <C-a> i
imap <C-a> <Esc>

" Duplicate line (this is no fun)
nnoremap <leader>d ddkpp

" Centered scrolling
nnoremap <Down> jzz
nnoremap <Up> kzz
nnoremap <PageUp> <PageUp>zz
nnoremap <PageDown> <PageDown>zz

" .vimrc
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>v :e $MYVIMRC<CR>

" Echo syntax group
nnoremap <leader>tm :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>

" Terminal
nnoremap <C-j> :terminal<CR>
nnoremap <leader>ht :terminal<CR>
nnoremap <leader>vt :vert terminal<CR>

nmap ga <Plug>(EasyAlign)

" Zen mode
noremap <leader>z :Goyo<CR>

let g:savedpos = getpos('.')
let g:savedposfw = getpos('.')

" Remember current cursor position
function! MemPos()
  let g:savedpos = getpos('.')
endfunction

" Jump back to saved cursor position
" useful when you need to jump to the top of a file
" to include a header, then return to where you were.
function! JumpPos()
  let g:savedposfw = g:savedpos
  call MemPos()
  call setpos('.', g:savedposfw)
endfunction

nmap <leader>m :call MemPos()<CR>
nmap <leader>j :call JumpPos()<CR>zz

function! HeaderSwitch(cmd)
  if expand('%:e') == 'h'
    execute a:cmd . ' %:r.cpp'
  elseif expand('%:e') == 'cpp'
    execute a:cmd . ' %:r.h'
  endif
endfunction

" Switch cpp file
nmap <C-k>o :call HeaderSwitch('e')<CR>
imap <C-k>o :call HeaderSwitch('e')<CR>
nmap <C-k><C-o> :call HeaderSwitch('vs')<CR>
imap <C-k><C-o> :call HeaderSwitch('vs')<CR>

" Go
autocmd FileType go map <buffer> <C-B> :GoRun<CR>

" Auto create licenses
function! Zlib()
  exec '0r ~/.vim/licenses/zlib.txt'
endfunction

function! MIT()
  exec '0r ~/.vim/licenses/mit.txt'
endfunction

"  _
" | |
" | |     __ _ _ __   __ _ _   _  __ _  __ _  ___
" | |    / _` | '_ \ / _` | | | |/ _` |/ _` |/ _ \
" | |___| (_| | | | | (_| | |_| | (_| | (_| |  __/
" |______\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___|
"                     __/ |             __/ |
"                    |___/             |___/

let g:typescript_indent_disable = 1

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}

" Only C# needs ale, all other language servers have builtin
" linters.
let g:ale_pattern_options = {
\   '.*': {'ale_enabled': 0},
\   '.*.cs$': {'ale_enabled': 1},
\}

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1

" let g:OmniSharp_typeLookupInPreview = 1
let g:OmniSharp_timeout = 5
set completeopt=longest,menuone
set previewheight=5
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:OmniSharp_highlight_types = 0
let g:SuperTabDefaultCompletionType = "<Tab>"

" let g:OmniSharp_want_snippet=1
let g:OmniSharp_diagnostic_overrides = {
\ 'CS1644': {'type': 'None'}
\}
