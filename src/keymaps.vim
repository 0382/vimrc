" 快捷键设置

" 移动键
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" 普通模式下移动
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

" 复制粘贴
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p

" 切换窗口
nnoremap <Leader>sw <c-w><c-w>
nnoremap <Leader>wl <c-w>l
nnoremap <Leader>wh <c-w>h
nnoremap <Leader>wj <c-w>j
nnoremap <Leader>wk <c-w>k

" 消除搜索高亮
nnoremap <Leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

