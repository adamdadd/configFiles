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
