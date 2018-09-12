"                                       iiii
"                                      i::::i
"                                       iiii
"          vvvvvvv           vvvvvvv  iiiiiii    mmmmmmm    mmmmmmm
"           v:::::v         v:::::v   i:::::i  mm:::::::m  m:::::::mm
"             v:::::v       v:::::v   i::::i m::::::::::mm::::::::::m
"              v:::::v     v:::::v    i::::i m::::::::::::::::::::::m
"               v:::::v   v:::::v     i::::i m:::::mmm::::::mmm:::::m
"                v:::::v v:::::v      i::::i m::::m   m::::m   m::::m
"                 v:::::v:::::v       i::::i m::::m   m::::m   m::::m
"                  v:::::::::v        i::::i m::::m   m::::m   m::::m
"                   v:::::::v        i::::::im::::m   m::::m   m::::m
"                    v:::::v         i::::::im::::m   m::::m   m::::m
"                     v:::v          i::::::im::::m   m::::m   m::::m
"                      vvv           iiiiiiiimmmmmm   mmmmmm   mmmmmm
set nocompatible              " be iMproved, required
set encoding=utf-8

" Plugins:{{{
" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

 " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'

 " The following are examples of different formats supported.
 " Keep Plugin commands between vundle#begin/end.
 " Plugin 'L9'
 " Git plugin not hosted on GitHub
 " Plugin 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (i.e. when working on your own plugin)
 " Plugin 'file:///home/gmarik/path/to/plugin'
 " The sparkup vi script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
 Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Install L9 and avoid a Naming conflict if you've already installed a
 " different version somewhere else.
 Plugin 'ascenator/L9', {'name': 'newL9'}
 " Start Screen:
 Plugin 'mhinz/vim-startify'
 " Python Editing:
 Plugin 'tmhedberg/SimpylFold'
 Plugin 'vim-scripts/indentpython.vim'
 " Javascript Syntax:
 Plugin 'petrbroz/vim-glsl'
 Plugin 'pangloss/vim-javascript'
 " Autocomplete:
 Plugin 'w0rp/ale'
 " Codi Interpreter:
 Plugin 'metakirby5/codi.vim'
 " Vim Environment:
 Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
 Plugin 'SirVer/ultisnips'
 Plugin 'tpope/vim-surround' "surround tags
 Plugin 'tpope/vim-commentary' "gcc to comment lines, gcap comment paragraphs works with motions
 Plugin 'mileszs/ack.vim' " Code searching using ack required for ag
 Plugin 'kien/ctrlp.vim' " fuzzy finder works well with ag
 " Colorschemes:
 Plugin 'drewtempelmeyer/palenight.vim'
 Plugin 'jnurmine/Zenburn'
 Plugin 'rafi/awesome-vim-colorschemes'
 " CSS Color Viewer:
 Plugin 'ap/vim-css-color'
 " File Manager: 
 Plugin 'scrooloose/nerdtree'
 " GOYO Distraction Free Writing:
 Plugin 'junegunn/goyo.vim'
 " Text Highlighting:
 Plugin 'junegunn/limelight.vim'
" Plugin 'python-mode/python-mode', { 'branch': 'develop' }
 " All of your Plugins must be added before the following line
 call vundle#end()            " required

 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line
"}}}
 " Runtime:{{{
set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
"}}}
" Window Splitting:{{{
set splitbelow
set splitright
"}}}
" Folding:{{{
set foldmethod=syntax
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1
"}}}
" Startup: {{{
" Startup if no files selected:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in")
            \| NERDTree
            \| Startify
            \| wincmd p
            \| endif
"}}}
" NERDtree:{{{
" Open NERDtree CRTL + n
map <C-n> :NERDTreeToggle<CR>

" Close NERDtree if it's last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}}
" Tab File Completion:{{{
set path+=**
set wildmenu
"}}}
" Colourscheme:{{{
" deus - late night
" dracula
" zenburn
" archery - terminal like arch
" materialbox
" happy_hacking
"
"set termguicolors
"set t_ut=
syntax enable
colorscheme deus

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"}}}
" Editor Layout:{{{
" line numbers
set number
set relativenumber
set numberwidth=5

" 90 Char col highlight
set colorcolumn=90

" Highlight Current Line
set cursorline

" Line wrap
let &showbreak='↪ '

" Remap esc to jk for exiting insert
inoremap jk <esc> 
"}}}
"Optimisation:{{{
" More memory for vim
set hidden
set history=200

" Search while typing
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Vim likes to redraw the screen a lot. This prevents that.
set lazyredraw
"}}}
" Startify Config:{{{

" let g:ascii = [
"             \'  ____________________________________________________________________ ',
"             \' | Hi Adam!      　　　　　　　　　　　　　　　　　　    [－] [口] [×]|',
"             \' | ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣ ￣    |',
"             \' |　            Unix has detected that Vim is awesome!                |',
"             \' |                          Do you agree?                             |',
"             \' |　 　　＿＿＿＿＿＿　　　　＿＿＿＿＿＿　　　　＿＿＿＿＿　　       |',
"             \' | 　 　|Yes Vimister|　　   | vimprove  |      | vim off! |          |',
"             \' |　 　　￣￣￣￣￣￣　　　　￣￣￣￣￣￣　　　　￣￣￣￣￣　         |',
"             \' |＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿________|',
"             \]

let g:ascii = [
            \"             ________________________________________________",
            \"            '   _________________________________________    `",
            \"           |   |                                         |    |",
            \"           |   |  C:\> Hello Adam!_                       |    |",
            \"           |   |                                         |    |",
            \"           |   |                                         |    |",
            \"           |   |                                         |    |",
            \"           |   |                                         |    |",
            \"           |   |                                         |    |",
            \"           |   |                                         |    |",
            \"           |   |                                         |    |",
            \"           |   |_________________________________________|    |",
            \"           |                                                  |",
            \"            `_________________________________________________'",
            \"                  `___________________________________'",
            \"         _________________________________________________________",
            \"      _-'.-.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-`__`. .-.-.-.`-_",
            \"   _-'.-.-.-.-. .-----.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-----. .-.-.-.-.`-",
            \" _-'.-.-.-.-.-. .---.-. .-------------------------. .-.---. .---.-.-.-.`-",
            \":-------------------------------------------------------------------------:",
            \"`---._.-------------------------------------------------------------._.---'",
            \]

let g:startify_custom_header = g:ascii + startify#fortune#boxed()

" Cursorline in startify
autocmd User Startified setlocal cursorline
"}}}
" Goyo Config:{{{
function! s:goyo_enter()
      silent !tmux set status off
      silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
      set noshowmode
      set noshowcmd
      set scrolloff=999
      colorscheme focuspoint
      Limelight
 endfunction

function! s:goyo_leave()
      silent !tmux set status on
      silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
      set showmode
      set showcmd
      set scrolloff=5
      Limelight!
      colorscheme deus
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
"}}}
" ALE Setup:{{{
" Asynchronous Lint Engine (ALE)
" " Limit linters used for JavaScript.
 let g:ale_linters = {
 \  'javascript': ['flow'],
 \  'python': ['pyre'],
 \  'CSS': ['csslint'],
 \  'HTML': ['HTMLHint'],
 \  'Perl': ['perl -c']
 \}
 highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
 highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
 let g:ale_sign_error = 'X' " could use emoji
 let g:ale_sign_warning = '?' " could use emoji
 let g:ale_statusline_format = ['X %d', '? %d', '']
 " %linter% is the name of the linter that provided the message
 " %s is the error or warning message
 let g:ale_echo_msg_format = '%linter% says %s'
 " Map keys to navigate between lines with errors and warnings.
 nnoremap <leader>an :ALENextWrap<cr>
 nnoremap <leader>ap :ALEPreviousWrap<cr>
"}}}
" CtrlP:{{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
"}}}
" The Silver Searcher:{{{
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif
"}}}

"This is for readability of file and must stay at the end
set modelines=1
" vim:foldmethod=marker:foldlevel=0
