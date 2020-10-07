set nocompatible
set number
set nobackup
set noswapfile
set undofile
set undodir=~/.vim/undodir
set wrap
set linebreak
set fileformat=unix
set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set showmatch
set backspace=2
set mouse=a
set hlsearch
set magic
set autoread
set hidden
set cmdheight=2
set laststatus=2
set wildmenu
set smartindent
set ai!
set updatetime=300

set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese,cp936
set formatoptions+=m " 在任何值高于255的多字节字符上分行
set formatoptions+=B " 连接行时，不要在两个多字节字符之间插入空格

set foldmethod=syntax
set nofoldenable
set synmaxcol=200

if has("gui")
    set guifont=Ubuntu\ Mono:h12
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
    set lines=40 columns=120
endif

filetype off
call plug#begin("~/.vim/myplug")
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
filetype plugin indent on
syntax enable
syntax on

" theme
set background=dark
colorscheme onedark
let g:light = {
    \ 'colorscheme': 'onedark'
    \}

" map setting
let mapleader=';'
nnoremap j gj
nnoremap k gk
vnoremap j gk
vnoremap k gk
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>sw <c-w><c-w>
nnoremap <Leader>wl <c-w>l
nnoremap <Leader>wh <c-w>h
nnoremap <Leader>wj <c-w>j
nnoremap <Leader>wk <c-w>k
nnoremap <Leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" coc.nvim settings
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

let g:coc_snippet_next = '<tab>'

" use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-reference)

nmap <Leader>rn <Plug>(coc-rename)

" plugins map setting
nnoremap <Leader>ce :CocCommand explorer<cr>

" asyncrun
let g:asyncrun_bell = 1
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.root', '.git', '.project', 'Makefile']
let g:asynctasks_term_pos = "quickfix"
let g:asynctasks_term_rows = 6
"nnoremap <Leader>aq :call asyncrun#quickfix_toggle(6)<cr>

nnoremap <Leader>fb :AsyncTask file-build<cr>
nnoremap <Leader>fr :AsyncTask file-run<cr>
nnoremap <Leader>pb :AsyncTask project-build<cr>
nnoremap <Leader>pr :AsyncTask project-run<cr>

