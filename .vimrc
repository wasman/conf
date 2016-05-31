" Setup start
" source /apollo/env/envImprovement/var/vimrc
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
Plugin 'Chiel92/vim-autoformat'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'derekwyatt/vim-scala'
Plugin 'greyblake/vim-preview'
"Plugin 'derekwyatt/vim-sbt'
Plugin 'klen/python-mode'
"Plugin 'YankRing.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'Yggdroot/indentLine.git'
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
"
" set nowrap
" airline start
set guifont=Liberation\ Mono\ for\ Powerline\ 22 
let airline_powerline_fonts = 1
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
set laststatus=2
set colorcolumn=120
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
au BufWrite *.java :Autoformat
" end vim-autoformat
" start YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'
"let g:ycm_key_invoke_completion = 'M-Space'
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
" start key mapping
inoremap jj <ESC>
inoremap <silent> <Up> <ESC><UP>
inoremap <silent> <Down> <ESC><Down>
imap ,, <C-Space>
" end key mapping
" start clipboard
set clipboard^=unnamedplus
" copy to buffer
vmap <C-y> :w! ~/.vimbuffer<CR>
nmap <C-y> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-b> :r ~/.vimbuffer<CR>
" end clipboard
" start SirVer/ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "usnippets"]
" end SirVer/ultisnips
" start indentLine
" vertical line indentation
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#09AA08'
"let g:indentLine_char = '│'
" end indentLine
"starts scripts
function! ViewHtmlText(url)
	if !empty(a:url)
		new
		setlocal buftype=nofile bufhidden=hide noswapfile
		execute 'r !links ' . a:url . ' -dump -dump-width ' . winwidth(0)
		1d
	endif
endfunction
" Save and view text for current html file.
nnoremap <Leader>H :update<Bar>call ViewHtmlText(expand('%:p'))<CR>
" View text for visually selected url.
vnoremap <Leader>h y:call ViewHtmlText(@@)<CR>
" View text for URL from clipboard.
" On Linux, use @* for current selection or @+ for text in clipboard.
nnoremap <Leader>h :call ViewHtmlText(@+)<CR>
"end scripts
"start NERDTree keymap
nnoremap <C-n> :NERDTreeToggle<CR>
"end NERDTree keymap
"starm keymap for buffers
nmap <Leader>] :bn<CR>
nmap <Leader>[ :bp<CR>
nmap <Leader>x :bd<CR>
"end keymap for buffers
"start insert line in n mode keymap
nmap `O O<Esc>
nmap `o o<Esc>
"end insertline in n mode keymap
"start soft wraps
set wrap linebreak nolist
"end soft wraps
"start  python mode
let g:syntastic_python_pylint_post_args="--max-line-length=120"
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'
"end python mode
"start Eclim
nnoremap <silent> <buffer> <leader>I :JavaImport<cr>
nnoremap <silent> <buffer> <leader>m :JavaImportOrganize<cr>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <leader>s "zyiw:exe "JavaSearch -p ".@z."" <cr>
nnoremap <silent> <buffer> <leader><cr> :JavaSearchContext<cr>
nnoremap <leader>q :JavaCorrect<cr>
nnoremap <silent> <buffer> <leader>f :JavaFormat<cr>
nnoremap <leader>t :JUnit %<cr>
"end eclim
"start tabs replacment on save
set tabstop=4 shiftwidth=4 expandtab
"end tab replacment on save
