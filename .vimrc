"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author   : dx
" Version  : v0.1
" Blog     :
" Mail     :
" Date     : 2014-12-16
"
" Setions  :  ->General
"             ->VIM user interface
"             ->Colors and Fonts
"             ->Files and Backups
"             ->Text, tab and indent
"             ->Staus line
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set how many lines of history VIM has to remember
set history=1000

" Line number
set number
set rnu

" 设置匹配模式，输入左括号会出现右括号
set showmatch

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" 编辑时显示光标状态
set ruler

" Set mapleader
let mapleader = ","
" Fast reload .vimrc
map <silent> <leader>ss : source ~/.vimrc<cr>
" Fast edit .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
" when .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
colorscheme desert
set background=light

" Enable syntax highlighting
syntax enable
syntax on
hi search term=reverse ctermbg=1 guibg=DarkRed

" utf-8 encoding
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> Files, backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> Text, tab and indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tab
set expandtab

" Be smart when using tabs
set smarttab

" 移动整行内容时，一次移动的字宽度
set shiftwidth=4

" 1 tab == 4 spaces
"set tabstop=4
set softtabstop=4

" 空白或者标点处折行
set lbr

" Linebreak on 500 characters
set tw=500

" screen wrap, don't insert EOL
set wrap

" smart indent mode
set smartindent

" C indent
set cindent

" Auto indent
set autoindent

"hight
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> NerdTree window
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTree_title="[NERDTree]"

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> Window Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let winManagerWindowLayout = "NERDTree|TagList"

"设置win窗口宽度
let winManagerWidth=30

"不同时显示多个文件的tag，只显示当前文件的tag
let Tlist_Show_One_File=1

"如果taglist是最后一个窗口,则退出vim
let Tlist_Exit_OnlyWindow=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> supertab plugin setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType="context"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> OmniCppComplete plugin setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp
set completeopt=menu,longest,menuone "关掉只能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1 "autocomplete with .
let OmniCpp_MayCompleteArrow = 1 "autocomplete with ->
let OmniCpp_MayCompleteScope = 1 "autocomplete with ::
let OmniCpp_SelectFirstItem = 2 "search namespace in this and include files
let OmniCpp_ShowPrototypeInAbbt = 1 "show function prototype in popup window
let OmniCpp_GlobalScopeSearch = 1 "enable the global scope search
let OmniCpp_DisplayMode = 1 "Class scope completion mode : always show all members
let OmniCpp_DefaultNamespaces = ["std","_GLIBCXX_STD"]
let OmniCpp_ShowScopeInAbbt = 1 "show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess = 1
let OmniCpp_NamespaceSearch = 2
let OmniCpp_LocalSearchDecl = 1 " use local search function, bracket on 1st column
let OmniCpp_DisplayMode = 1
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> cscope plugin setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
set cspc=0
if filereadable("cscope.out")
    cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
endif

nmap <C-a>s : cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-a>g : cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-a>c : cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-a>t : cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-a>f : cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-a>i : cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-a>d : cs find d <C-R>=expand("<cfile>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> ctsgs plugin setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> F快捷键定义
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"按下F2根据头文件内关键字补全
imap <F2> <C-X><C-O>

"按下F3自动补全代码，注意该映射语句后不能有其它字符，否则
"按下F3后自动补全一些乱码
imap <F3> <C-X><C-I>

"定义打开winmanager快捷键为F4
nmap <silent> <F4> : WMToggle<cr>

"按下F5重新生成tag文件，并更新taglist
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q <CR><ESC>
imap <F5><ESC> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q <CR><ESC>

"按下F6重新cscope.out文件
nmap <silent><F6> :!/usr/bin/cscope -Rbq <cr>
