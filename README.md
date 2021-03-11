# 我的vim配置文件

## 安装

### 依赖

由于使用了[coc.nvim](https://github.com/neoclide/coc.nvim)插件，需要`nodejs`支持，需要首先安装[nodejs](https://nodejs.org/)。且`coc.nvim`仅支持vim8以上的版本，故本配置也仅适用于vim8以上版本。

### 安装

先删除本地的`~/.vim`文件。然后直接clone本仓库
```bash
git clone http://github.com/0382/settings.git ~/.vim
```

在linux下`$~/.vimrc`或windows下的`$VIM/_vimrc`中只用写一句
```vim
source ~/.vim/init.vim
```

本仓库内置了[vim-plug](https://github.com/junegunn/vim-plug)插件管理器，直接使用`:PlugInstall`命令安装插件，初次打开可能会有报错，装完插件应该就没问题了。

## 使用

### 基本功能

没有设置`<leader>`键，即使用默认的`\`键。

#### 文件侧边栏

使用[coc-explorer](https://github.com/weirongxu/coc-explorer)插件，需要使用命令`:CocInstall coc-explorer`来安装。

快捷键
- `<leader>ce`打开`coc-explorer`

#### 代码提示

代码提示使用的是`coc.nvim`插件，使用`<tab>`键选择提示项，使用回车键确认。

`coc.nvim`及其系列插件的配置文件使用`:CocConfig`打开，为了方便编译这个`json`文件，建议安装`coc-json`插件，`:CocInstall coc-json`。

#### 快捷编译运行

使用[asyncrun.vim](https://github.com/skywind3000/asyncrun.vim)和[asynctasks.vim](https://github.com/skywind3000/asynctasks.vim)来配置这个功能。

- `<leader>fb`，编译单个文件，支持`c,c++,fortran,latex`。
- `<leader>fr`，运行单个文件结果，支持`c,c++,fortran,python,javascript,julia,lisp`。
- `<Leader>ff`, 格式化整个文件，姑目前仅支持`c,c++`。
- `<leader>pb`，编译整个项目，姑且定义了这个快捷键实际上是`make`命令，需要你自己写`Makefile`。
- `<leader>pr`，运行整个小目，实际上是`make run`命令。
- `<leader>aq`，快速打开或关闭上述命令打开的qucikfix窗口。

#### 其他
- `<leader>w[hjkl]`切换窗口。
- `<alt>=`打开或关闭`terminal`，使用的是`vim-terminal-help`的默认设置。
- `<leader>l`去除搜索后的高亮。
- `<C-[hjkl]>`总是（包括插入模式下）能够作为方向键移动（大概）。

### 具体编程语言

#### c/c++开发

使用[clangd](https://clangd.llvm.org/)作为[language server](https://microsoft.github.io/language-server-protocol/)来提供更加强大的代码提示功能，所以需要安装`clangd`。

#### Fortran 开发

使用[fortran-language-server](https://github.com/hansec/fortran-language-server)作为language server，这是python写的包，所以在Windows下需要安装`python`，然后用`pip install fortran-language-server`来安装这个包，一些配置可能需要去看看该库的README。

#### julia

使用了[julia-vim](https://github.com/JuliaEditorSupport/julia-vim)插件作为基础支持，其中的Unicode功能待配置。使用julia包`LanguageServer, SymbolServer, StaticLint`作为language server，所以需要安装这三个包，不需要额外设置。

#### python

没有特别设置，建议使用`coc.nvim`插件`coc-python`，用`:CocInstall coc-python`安装。目前我不太写`python`，待调教。

## 参考
- [vim-init](https://github.com/skywind3000/vim-init)
- [coc.nvim](https://github.com/neoclide/coc.nvim/wiki)
