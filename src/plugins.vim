" 插件配置文件，使用vim-plug作为插件管理器

filetype off
call plug#begin("~/.vim/myplug")
Plug 'JuliaEditorSupport/julia-vim'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'bfrg/vim-cpp-modern', { 'for': ['c', 'cpp'] }
Plug 'vim-python/python-syntax', { 'for': ['python'] }
Plug 'skywind3000/vim-terminal-help'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
filetype plugin indent on
syntax enable
syntax on

" 主题
set background=dark
set t_Co=256
colorscheme onedark
let g:light = {
    \ 'colorscheme': 'onedark'
    \}

" coc.nvim 设置
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

" coc-explorer 设置
nnoremap <Leader>ce :CocCommand explorer<cr>

" asyncrun 设置
let g:asyncrun_bell = 1
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.root', '.git', '.project', 'Makefile']
let g:asynctasks_term_pos = "quickfix"
let g:asynctasks_term_rows = 6
nnoremap <Leader>aq :call asyncrun#quickfix_toggle(6)<cr>

nnoremap <Leader>fb :AsyncTask file-build<cr>
nnoremap <Leader>fr :AsyncTask file-run<cr>
nnoremap <Leader>ff :AsyncTask file-format<cr>
nnoremap <Leader>pb :AsyncTask project-build<cr>
nnoremap <Leader>pr :AsyncTask project-run<cr>

