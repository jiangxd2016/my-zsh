call plug#begin('~/.config/nvim/autoload') 

 Plugin 'VundleVim/Vundle.vim'
Plugin 'ryanoasis/vim-devicons'                     "图标支持， 需要安装 Nerdfont 字体
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'    "nerdtree 根据文件类型高亮
Plugin 'Xuyuanp/nerdtree-git-plugin'                "nerdtree git 支持
Plugin 'octol/vim-cpp-enhanced-highlight'           "对c++语法高亮增强
Plugin 'neoclide/coc.nvim', {'branch' : 'release'}  "自动补全
Plugin 'skywind3000/asyncrun.vim'                   "执行 shell 命令 主要用于编译运行代码
Plugin 'SirVer/ultisnips'                           "代码片段插件 
Plug 'navarasu/onedark.nvim'                        "主题
Plug 'preservim/nerdtree'                           "文件管理器
Plug 'Pocco81/auto-save.nvim'                       "自动保存
Plug 'leafOfTree/vim-matchtag'                      "匹配标签
Plug 'mhinz/vim-startify'                           "启动界面
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "多光标
Plug 'tpope/vim-surround'                           "快速添加括号


"Plug 'nvim-tree/nvim-web-devicons',
"Plug 'nvim-tree/nvim-tree.lua'

call plug#end()  

let g:onedark_config = {  
    \ 'style': 'warm',  
\}  
colorscheme onedark  


let g:native_sidebar_shortcut = '<c-t>'  

set clipboard^=unnamed,unnamedplus  

syntax on                       "syntax highlighting, see :help syntax  
filetype plugin indent on       "file type detection, see :help filetype  
set number                      "display line number  
set path+=**                    "improves searching, see :help path  
set noswapfile                  "disable use of swap files  
set wildmenu                    "completion menu  
set backspace=indent,eol,start  "ensure proper backspace functionality  
set undodir=~/.cache/nvim/undo  "undo ability will persist after exiting file  
set undofile                    "see :help undodir and :help undofile  
set incsearch                   "see results while search is being typed, see :help incsearch  
set smartindent                 "auto indent on new lines, see :help smartindent  
set ic                          "ignore case when searching  

set expandtab                   "expanding tab to spaces  
set tabstop=4                   "setting tab to 4 columns  
set shiftwidth=4                "setting tab to 4 columns  
set softtabstop=4               "setting tab to 4 columns  
set showmatch                   "display matching bracket or parenthesis  
set hlsearch incsearch          "highlight all pervious search pattern with incsearch  

highlight ColorColumn ctermbg=9 "display ugly bright red bar at color column number  

" Keybind Ctrl+l to clear search  
nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>  


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let s:fontsize = 12  
function! AdjustFontSize(amount)  
  let s:fontsize = s:fontsize+a:amount  
  :execute "GuiFont! Consolas:h" . s:fontsize  
endfunction  

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"  
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"  
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"  
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"  

" In insert mode, pressing ctrl + numpad's+ increases the font  
inoremap <C-kPlus> <Esc>:call AdjustFontSize(1)<CR>a  
inoremap <C-kMinus> <Esc>:call AdjustFontSize(-1)<CR>a