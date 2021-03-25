" 基础配置文件

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
set autoread                     " 自动重加载
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
set fileformats=unix,dos

" 备份设置
set backup                       " 备份
set writebackup                  " 保存时备份
set backupdir=~/.vim/backup      " 备份地址
set noswapfile                   " 禁用交换文件
set noundofile                   " 禁用undo


