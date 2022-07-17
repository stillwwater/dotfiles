" -------- Moved to .config/nvim/init.vim ---------
" Name:    .vimrc
" Version: 11.0
" Author:  github.com/stillwwater
" -------------------------------------------------

syntax on

let mapleader = ","

let g:work = 0
let g:lsp = "coc"

set mouse=a  " :O
set laststatus=2
set backspace=indent,eol,start
set smartindent

set linespace=1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"set cursorline
"set number

set cino=N-s  " Don't indent namespace
set cino+=:0  " Don't indent switch labels
set cino+=l1  " Don't align case braces
set cino+=g0  " Don't indent public: or private: labels

set splitbelow

" Sign column for coc.nvim
set signcolumn=no

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

if g:work == 1
  set fileformat=dos
endif

set backupdir=~/tmp
set directory=~/tmp
set undodir=~/tmp

if has('win32')
  let g:wincap_color = ""
  let g:wincap_vim_exe = "vim.exe"

  autocmd VimEnter * call timer_start(33, { tid -> execute('set shell=cmder.cmd')})
endif

" -------------------------------------------------
" gvim
" -------------------------------------------------

if has('gui_running')
  " No nonsense
  set guioptions=Pce
  set clipboard=unnamedplus

  " Start maximized
  au GUIEnter * simalt ~x

  "set guifont=Fira\ Code\ Retina:h11
  "set guifont=APL385\ Unicode:h12
  "set guifont=Anonymous\ Pro:h13
  set guifont=Consolas:h12
  set guifont=Lucida\ Console:h12
  set guifont=fixedsys:h11
  set guifont=Courier\ New:h12
  set guifont=Cascadia\ Mono:h11

  " Block cursor
  set guicursor=i-n-v-c:block-Cursor/lCursor

  " Horizontal cursor
  set guicursor+=i:hor15-Cursor/lCursor
endif

" -------------------------------------------------
" Indent
" -------------------------------------------------

" Strip trailing whitespace on save
au BufWritePre * :%s/\s\+$//e

" 2 spaces
au FileType javascript      setlocal ts=2 sts=2 sw=2
au FileType typescriptreact setlocal ts=2 sts=2 sw=2
au FileType vim             setlocal ts=2 sts=2 sw=2

" Tabs
au FileType go   setlocal ts=4 sw=4 noexpandtab
au FileType asm  setlocal ts=8 sw=8 noexpandtab
au FileType masm setlocal ts=8 sw=8 noexpandtab

" -------------------------------------------------
" Plugins
" -------------------------------------------------

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" lsp
if g:lsp == "coc"
  Plug 'neoclide/coc.nvim'
endif

Plug 'dense-analysis/ale'
Plug 'omnisharp/omnisharp-vim'
Plug 'fatih/vim-go'

" qol
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'drmikehenry/vim-headerguard'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug '~/.vim/plugged/wincap.vim'

" language support
Plug 'vim-scripts/ShaderHighLight'
"Plug 'bfrg/vim-cpp-modern'
Plug 'leafgarland/typescript-vim'
Plug 'tasn/vim-tsx'
Plug 'alvan/vim-closetag'
Plug 'vim-python/python-syntax'
Plug 'teal-language/vim-teal'
Plug '~/.vim/plugged/sw-syntax'

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
Plug 'stillwwater/vim-iridium'
Plug 'stillwwater/vim-ink16'
Plug 'AlessandroYorba/Alduin'
Plug 'danishprakash/vim-yami'

filetype plugin indent on

" Initialize plugin system
call plug#end()

" -------------------------------------------------
" Colorscheme
" -------------------------------------------------

set t_Co=256

if (has('termguicolors'))
  set termguicolors
endif

let g:AutoPairs = {'{':'}'}
let g:AutoPairsMultilineClose = 0

let g:violet_accent = 'purple'
let g:violet_solarized = 0
let g:violet_cursor = 1

let g:pencil_higher_contrast_ui=1

let g:iridium_classic = 0
let g:iridium_solid_vsplit = 1
let g:iridium_variant = "warm"

set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

set background=dark

" ----------------------
" UI Highlighting
" ----------------------
hi ColumnMargin         guibg=#000000
hi CursorColumn         guibg=#424242
hi CursorLine           guibg=#424242
hi Directory            guibg=#242424  guifg=#88CCE7
hi Error                               guifg=#F7F7F7
hi ErrorMsg                            guifg=#F7F7F7
hi FoldColumn           guibg=#3B3B3B  guifg=#90AB41
hi Folded               guibg=#333333  guifg=#777777
hi IncSearch            guifg=#F2E212  guibg=#000000
hi LineNr               guibg=#282828  guifg=#8F8F8F
hi MatchParen           guibg=#888888
hi NonText                             guifg=#8F8F8F
hi Normal               guibg=#141414  guifg=#C3C0B7
hi Pmenu                guibg=#3F3F3F  guifg=fg
hi PmenuSbar            guibg=fg       guifg=#3F3F3F
hi PmenuSel             guibg=fg       guifg=#3F3F3F
hi Search               guibg=#BBAAEE  guifg=#000000
hi SpecialKey                          guifg=#8F8F8F
hi Terminal             guifg=fg       guibg=bg
hi StatusLineTerm       guibg=#333333  guifg=fg
hi StatusLineTermNC     guibg=#232323  guifg=#909090
hi Title                               guifg=#88CCE7
hi Visual               guibg=#111199
hi VertSplit            guifg=#333333  guibg=#333333
hi StatusLine           guifg=#333333  guibg=fg
hi StatusLineNC         guifg=#282828  guibg=#909090

" ----------------------
" Syntax Highlighting
" ----------------------
hi Comment              guifg=#777777
hi Constant             guifg=#B0A080
hi Delimiter            guifg=#F7F7F7
hi Define               guifg=#888888
hi Function             guifg=fg
hi Identifier           guifg=#778c73
hi Ignore               guifg=bg
hi Include              guifg=#888888
hi Keyword              guifg=#6688AA
hi Method               guifg=#F7F7F7
hi Number               guifg=#995599
hi Character            guifg=#995599
hi PreProc              guifg=#888888
hi Special              guifg=#559999
hi Statement            guifg=#B0A080  gui=none
hi String               guifg=#AA90AA
hi Structure            guifg=#709070
hi Symbol               guifg=#FAB1AB
hi Todo                 guifg=bg       guibg=#BBAAEE
hi Type                 guifg=#77AABB  gui=none
hi Underlined           guibg=#272727
" hi Constant 90AACC


" -------------------------------------------------
" Syntax
" -------------------------------------------------

syntax match ccxType "\v\w@<!(s8|u8|s16|u16|s32|u32|s64|u64|float32|float64)\w@!"
au VimEnter,BufWinEnter *.cpp,*.h
  \ hi! link ccxType Type

hi! link ccxType Type

" paramount overrides
" hi! Normal guibg='#0e0e0f'
" hi! link Type Constant

" User terminal background
hi! Normal ctermbg=NONE
hi! link Function Normal
hi! link Identifier Normal

" No italics on comments
hi! Comment cterm=NONE gui=NONE

hi! link macroConstant Normal

" C++
hi! link csUserType      Normal
hi! link cppSTLconcept   Normal
hi! link cppSTLnamespace Normal

" Python
hi! link pythonFunction   Function
hi! link pythonImport     PreProc
hi! link pythonStatement  Type
hi! link pythonSpaceError Normal

" Go
hi! link goSpaceError Normal

" C#
hi! link csOpSymbols Normal

" TS
au VimEnter,BufWinEnter *.ts,*tsx
  \ hi! link typescriptParens        Normal |
  \ hi! link typescriptOpSymbols     Normal |
  \ hi! link typescriptGlobalObjects Type   |
  \ hi! link typescriptExceptions    Normal |
  \ hi! link typescriptFuncKeyword   Type   |
  \ hi! link typescriptLogicSymbols  Normal

" -------------------------------------------------
" Functions
" -------------------------------------------------

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

function! g:HeaderguardName()
  return toupper(expand('%:t:gs/[^0-9a-zA-Z_]/_/g')) . '_'
endfunction

" Auto create licenses
function! License(name)
  exec '0r ~/.vim/licenses/' . a:name . '.txt'
endfunction

let g:savedpos = getpos('.')
let g:savedposfw = getpos('.')

" -------------------------------------------------
" Keymap
" -------------------------------------------------

map [1;5A <C-Up>
map [1;5B <C-Down>

nno <leader>( (
nno <leader>{ {
nno <leader>[ [
nno <leader>) )
nno <leader>} }
nno <leader>] ]
nno <leader>" "
nno <leader>' '
nno <leader>` `

" Don't use Ex mode, use Q for formatting
map Q gq

" Clear search
nno <silent> <esc> :noh<return><esc>

" Toggle insert (when using laptops without esc key)
nmap <C-a> i
imap <C-a> <Esc>

" Move line down
"nno <C-Down> :m .+1<CR>==
"ino <C-Down> <Esc>:m .+1<CR>==gi
"vno <C-Down> :m '>+1<CR>gv=gv
nno [ {
nno ] }
nno <C-Down> }zz
nno <C-Up> {zz

" Move line up
"nno <C-Up> :m .-2<CR>==
"ino <C-Up> <Esc>:m .-2<CR>==gi
"vno <C-Up> :m '<-2<CR>gv=gv

" Centered scrolling
"nno <Down> jzz
"nno <Up> kzz
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

" -------------------------------------------------
" LSP
" -------------------------------------------------

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

au filetype go inoremap <buffer> . .<C-x><C-o>

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:SuperTabDefaultCompletionType = "<Tab>"
let g:SuperTabContextTextMemberPatterns = ['']
.
let g:OmniSharp_highlighting = 1
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
