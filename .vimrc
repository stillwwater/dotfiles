"        _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"
syntax on

let mapleader = ","

set mouse=a  " :O
set laststatus=2
set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set cino=N-s  " Don't indent namespace
set cino+=:0  " Don't indent switch labels
set cino+=g0  " Don't indent public: or private: labels

set splitbelow

" Sign column for coc.nvim
set signcolumn=yes

" Pretty much the default status line but using virtual column
" instead of actual column
set statusline=%f\ %w%m%r\ %=%(%l,%v\ %=\ \ \ \ \ \ \ \ \ \ %P%)

set incsearch
set hlsearch
noh

set noerrorbells
set belloff=all

set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos

set backupdir=~/tmp
set directory=~/tmp
set undodir=~/tmp

if has('gui_running')
  " No nonsense
  set guioptions=Pce
  set clipboard=unnamedplus

  " Start maximized
  au GUIEnter * simalt ~x

  set guifont=Fira\ Code\ Retina:h11
  set guifont=Consolas:h12
  set guifont=APL385\ Unicode:h11
  set guifont=Anonymous\ Pro:h12

  " Always use block cursor
  set guicursor=i-n-v-c:block-Cursor/lCursor
endif

" Strip trailing whitespace on save
au BufWritePre * :%s/\s\+$//e

" 2 spaces
au FileType javascript      setlocal ts=2 sts=2 sw=2
au FileType css             setlocal ts=2 sts=2 sw=2
au FileType typescript      setlocal ts=2 sts=2 sw=2
au FileType typescriptreact setlocal ts=2 sts=2 sw=2
au FileType html            setlocal ts=2 sts=2 sw=2
au FileType vim             setlocal ts=2 sts=2 sw=2

" Tabs
au FileType go   setlocal ts=4 sw=4 noexpandtab
au FileType asm  setlocal ts=8 sw=8 noexpandtab
au FileType masm setlocal ts=8 sw=8 noexpandtab

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

" qol
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'drmikehenry/vim-headerguard'

" lsp
Plug 'neoclide/coc.nvim'
Plug 'dense-analysis/ale'
Plug 'omnisharp/omnisharp-vim'

" language support
Plug 'vim-scripts/ShaderHighLight'
Plug 'bfrg/vim-cpp-modern'
Plug 'leafgarland/typescript-vim'
Plug 'tasn/vim-tsx'
Plug 'alvan/vim-closetag'
Plug 'vim-python/python-syntax'

" colorschemes
Plug 'stillwwater/vim-violet'
Plug 'stillwwater/vim-nebula'
Plug 'srcery-colors/srcery-vim'
Plug 'relastle/bluewery.vim'
Plug 'ciaranm/inkpot'
Plug 'morhetz/gruvbox'
Plug 'owickstrom/vim-colors-paramount'
Plug 'reedes/vim-colors-pencil'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'axvr/photon.vim'
Plug 'andreypopp/vim-colors-plain'

filetype plugin indent on

" Initialize plugin system
call plug#end()

"  _______ _
" |__   __| |
"    | |  | |__   ___ _ __ ___   ___
"    | |  | '_ \ / _ \ '_ ` _ \ / _ \
"    | |  | | | |  __/ | | | | |  "_
"    |_|  |_| |_|\___|_| |_| |_|\___|
"

" Custom rules ------------------------

" Highlight ALL_UPPERCASE as constants
au VimEnter,BufWinEnter * syn match macroConstant '\v\w@<!(\u|_+[A-Z0-9])[A-Z0-9_]*\w@!'

" Theme setup -------------------------

set t_Co=256

if (has('termguicolors'))
  set termguicolors
endif

set background=dark

let g:violet_accent = 'purple'
let g:violet_solarized = 1
let g:violet_cursor = 1

let g:pencil_higher_contrast_ui=1

colorscheme violet
colorscheme pencil

" Overrides ---------------------------

" User terminal background
hi! Normal ctermbg=NONE

" No italics on comments
hi! Comment cterm=NONE gui=NONE

hi! link macroConstant Normal

" C++
hi! link csUserType      Normal
hi! link cppSTLconcept   Normal
hi! link cppSTLnamespace Normal

" Python
hi! link pythonFunction  Function
hi! link pythonImport    PreProc
hi! link pythonStatement Type
hi! link pythonSpaceError Normal

" TS
au VimEnter,BufWinEnter *.ts,*tsx
  \ hi! link typescriptParens        Normal |
  \ hi! link typescriptOpSymbols     Normal |
  \ hi! link typescriptGlobalObjects Type   |
  \ hi! link typescriptExceptions    Normal |
  \ hi! link typescriptFuncKeyword   Type   |
  \ hi! link typescriptLogicSymbols  Normal

"  _  __          _     _           _
" | |/ /         | |   (_)         | |
" | ' / ___ _   _| |__  _ _ __   __| |
" |  < / _ \ | | | '_ \| | '_ \ / _` |
" | . \  __/ |_| | |_) | | | | | (_| |
" |_|\_\___|\__, |_.__/|_|_| |_|\__,_|
"            __/ |
"           |___/
"

" Remember current cursor position
function! MemPos()
  let g:savedpos = getpos('.')
endfunction

" Jump back to saved cursor position
function! JumpPos()
  let g:savedposfw = g:savedpos
  call MemPos()
  call setpos('.', g:savedposfw)
endfunction

function! HeaderSwitch(cmd)
  if expand('%:e') == 'h'
    execute a:cmd . ' %:r.cpp'
  elseif expand('%:e') == 'cpp'
    execute a:cmd . ' %:r.h'
  endif
endfunction

" Auto create licenses
function! License(name)
  exec '0r ~/.vim/licenses/' . a:name . '.txt'
endfunction

let g:savedpos = getpos('.')
let g:savedposfw = getpos('.')

" Mappings ----------------------------

map [1;5A <C-Up>
map [1;5B <C-Down>

" Clear search
nno <silent> <esc> :noh<return><esc>

" Toggle insert (when using laptops without esc key)
nmap <C-a> i
imap <C-a> <Esc>

" Move line down
nno <C-Down> :m .+1<CR>==
ino <C-Down> <Esc>:m .+1<CR>==gi
vno <C-Down> :m '>+1<CR>gv=gv

" Move line up
nno <C-Up> :m .-2<CR>==
ino <C-Up> <Esc>:m .-2<CR>==gi
vno <C-Up> :m '<-2<CR>gv=gv

" Centered scrolling
nno <Down> jzz
nno <Up> kzz
nno <PageUp> <PageUp>zz
nno <PageDown> <PageDown>zz

" .vimrc
nno <leader>r :source $MYVIMRC<CR>
nno <leader>v :e $MYVIMRC<CR>

" Terminal
nno <C-k><C-j> :terminal<CR>
nno <leader>ht :terminal<CR>
nno <leader>vt :vert terminal<CR>

" Align with gaip=
nmap ga <Plug>(EasyAlign)

" Zen mode
nno <leader>z :Goyo<CR>

" Header guard
nno <leader>hg :HeaderguardAdd<CR>

" Jumps
nno <leader>m :call MemPos()<CR>
nno <leader>j :call JumpPos()<CR>zz

" Switch cpp file
nno <C-k>o :call HeaderSwitch('e')<CR>
ino <C-k>o :call HeaderSwitch('e')<CR>
nno <C-k><C-o> :call HeaderSwitch('vs')<CR>
ino <C-k><C-o> :call HeaderSwitch('vs')<CR>

nno <leader>zlib :call License('zlib')<CR>
nno <leader>mit :call License('mit')<CR>

" Echo syntax group
nno <leader>tm
  \ :echo
  \ synIDattr(synID(line('.'), col('.'), 1), 'name')
  \ <CR>

"  _
" | |
" | |     __ _ _ __   __ _ _   _  __ _  __ _  ___
" | |    / _` | '_ \ / _` | | | |/ _` |/ _` |/ _ \
" | |___| (_| | | | | (_| | |_| | (_| | (_| |  __/
" |______\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___|
"                     __/ |             __/ |
"                    |___/             |___/

let g:python_highlight_all = 1
let g:typescript_indent_disable = 1

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
au BufWritePost *.tsx :Prettier

" Emmet for react
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}

let g:headerguard_use_cpp_comments = 1

" Only C# needs ale, all other language servers have builtin
" linters.
let g:ale_pattern_options = {
\   '.*': {'ale_enabled': 0},
\   '.*.cs$': {'ale_enabled': 1},
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

let g:asyncomplete_auto_popup = 0

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:SuperTabDefaultCompletionType = "<Tab>"
let g:SuperTabContextTextMemberPatterns = ['']
.
let g:OmniSharp_highlighting = 0
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1

" let g:OmniSharp_typeLookupInPreview = 1
let g:OmniSharp_timeout = 5
set completeopt=longest,menuone
set previewheight=1
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:OmniSharp_highlight_types = 0

" let g:OmniSharp_want_snippet=1
let g:OmniSharp_diagnostic_overrides = {
\ 'CS1644': {'type': 'None'}
\}

let g:easy_align_delimiters = {
  \ '\': {
  \     'pattern': '\\$',
  \ },
  \ }

au CursorHold *.cs OmniSharpTypeLookup
