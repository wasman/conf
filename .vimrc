" Setup start
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end
" Plugins start
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-markdown'
Plugin 'reedes/vim-thematic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'Chiel92/vim-autoformat'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-scala'
" Plugin 'derekwyatt/vim-sbt'
"
" Plugins end
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" let mapleader = ','
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Setup end
set number
set cursorline
set nocompatible
syntax on
hi CursorLineNr term=bold ctermfg=Grey gui=bold guifg=Grey
hi LineNr ctermfg=DarkGrey guifg=#2b506e guibg=#000000 
" set nowrap
" airline start
set guifont=Liberation\ Mono\ for\ Powerline\ 22 
let airline_powerline_fonts = 1
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
set laststatus=2
colorscheme molokai
let g:airline_section_z = '%3pp %l:%c'
" airline end
" crtlp start
set runtimepath^=~/.vim/bundle/ctrlp.vim
" ctrpl end
" syntastic start
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_javac_config_file_enabled = 1
" syntastic end
" thermatic start
" thermatic end
" start AG
let g:ackprg = 'ag --vimgrep'
let g:ag_working_path_mode="r"
" end AG
" start gitgutter
let g:gitgutter_sign_column_always = 1
" end gitgutter
" start tmux
let g:tmuxline_powerline_separators = 2 
" end tmux
" start vim-autoformat Disabling becouse of non compability with markdown
" au BufWrite * :Autoformat
" end vim-autoformat
" start YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'
" end YouCompleteMe
" start vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" end vim-markdown
" start vim-ident-guides
"let g:indent_guides_enable_on_vim_startup = 1 
"let g:indent_guides_auto_colors = 1 
"let g:indent_guides_guide_size = 1 
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=darkgrey ctermbg=252
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=251
" end vim-ident-guides
