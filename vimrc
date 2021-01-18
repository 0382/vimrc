" 基础设置
set nocompatible                 " 禁用 vi 兼容模式
set backspace=eol,start,indent   " 设置 Backspace 建模式
set autoindent                   " 自动缩进
set cindent                      " c/c++语言缩进优化
set winaltkeys=no                " windows 禁用 alt 操作菜单
set wrap                         " 自动换行
set linebreak
set ruler                        " 显示光标位置
set number                       " 显示行号
set wildmenu                     " 允许下方显示目录
set autoread
set mouse=a
set updatetime=300
set synmaxcol=200

" 显示设置
set laststatus=2                 " 显示状态栏
set list                         " 显示制表符等隐藏字符
set showcmd                      " 右下角显示命令
set splitbelow                   " 切割窗口优先向下
set splitright                   " vsplit 优先向右
set cmdheight=2                  " 命令行显示两行

" 搜索设置
set ignorecase                   " 搜索忽略大小写
set smartcase                    " 包含大写字母时，不忽略大小写
set hlsearch                     " 高亮搜索结果
set incsearch                    " 动态增量显示查找结果
set magic

" GUI 设置
if has("gui")
    set guifont=Cascadia\ Mono:h12
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
    set lines=30 columns=120
endif

" 编码设置
if has('multi_byte')
    set encoding=utf-8           " 内部编码
    set fileencoding=utf-8       " 文件默认编码
    set fileencodings=utf-8,ucs-bom,gbk,gb18030,big5,euc-jp,lantin1
    set formatoptions+=m         " 在任何值高于255的多字节字符上分行
    set formatoptions+=B         " 连接行时，不要在两个多字节字符之间插入空格
endif

" 允许 Vim 自带脚本根据文件类型自动设置缩进
if has('autocmd')
    filetype plugin indent on
endif

" 语法高亮设置
if has('syntax')
    syntax enable
    syntax on
endif

" 设置代码折叠
if has('folding')
    set foldenable               " 允许代码折叠
    set foldmethod=indent        " 默认使用缩进折叠
    set foldlevel=99             " 默认打开所有缩进
endif

" tab 设置
set shiftwidth=4                 " 缩进大小
set tabstop=4                    " tab 大小
set softtabstop=4                " tab 转换成几个空格
set expandtab                    " 展开 tab

" 其他设置
set showmatch                    " 显示匹配的括号
set matchtime=2                  " 显示匹配括号的时间
set lazyredraw                   " 延迟绘制
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m
set fileformat=unix

" 备份设置
set backup                       " 备份
set writebackup                  " 保存时备份
set backupdir=~/.vim/backup      " 备份地址
set noswapfile                   " 禁用交换文件
set noundofile                   " 禁用undo


filetype off
call plug#begin("~/.vim/myplug")
Plug 'JuliaEditorSupport/julia-vim'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'vim-python/python-syntax', { 'for': ['python'] }
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
filetype plugin indent on
syntax enable
syntax on

" theme
set background=dark
set t_Co=256
colorscheme onedark
let g:light = {
    \ 'colorscheme': 'onedark'
    \}

" map setting
nnoremap j gj
nnoremap k gk
vnoremap j gk
vnoremap k gk

noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
" insert 模式移动
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
" 命令模式下移动
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>

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

