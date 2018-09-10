set nocompatible              " be iMproved, required

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
 " Python Editing:
 Plugin 'tmhedberg/SimpylFold'
 Plugin 'vim-scripts/indentpython.vim'
 " Autocomplete:
 Plugin 'w0rp/ale'
 " Vim Environment:
 Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
 Plugin 'SirVer/ultisnips'
 Plugin 'tpope/vim-surround'
 " Colorschemes:
 Plugin 'drewtempelmeyer/palenight.vim'
 Plugin 'jnurmine/Zenburn'
 Plugin 'rafi/awesome-vim-colorschemes'
 " CSS Color Viewer:
 Plugin 'ap/vim-css-color'
 " File Manager: 
 Plugin 'scrooloose/nerdtree'
 " Javascript Syntax:
 Plugin 'petrbroz/vim-glsl'
 Plugin 'pangloss/vim-javascript'
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

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

"autocmd vimenter * NERDTree

set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

" Open NERDtree if no files selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDtree CRTL + n
map <C-n> :NERDTreeToggle<CR>

" Close NERDtree if it's last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set encoding=utf-8

" Tab File Completion:
set path+=**
set wildmenu

" Colourscheme:
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

" line numbers
set number
set relativenumber
" 90 Char col highlight
set colorcolumn=90

" More memory for vim 
set hidden
set history=100

" Goyo Config:
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

" ALE Setup:
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
