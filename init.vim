
" 防止重新加载
if get(s:, 'loaded', 0) != 0
    finish
else
    let s:loaded = 1
endif

" 有时候会可能不会自动加入runtimepath
set rtp+=~/.vim

source ~/.vim/src/basic.vim
source ~/.vim/src/keymaps.vim
source ~/.vim/src/plugins.vim

