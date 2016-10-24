" vi/vim issues resolved
set nocompatible

" utf-8 encoding display
set encoding=utf-8

" setting terminal color settings
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

"this is needed to make sure that ultisnips works finally...!
filetype off 

" Updating vim 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'


"Plugin 'Valloric/YouCompleteMe' " please make sure that you have python-dev and ruby-dev installed :)

" The ultimate searcher
Plugin 'kien/ctrlp.vim'

" The in file searcher
Plugin 'Lokaltog/vim-easymotion'

" Manage your undos
Plugin 'sjl/gundo.vim'

" Multiple editing which gives sublime a run for its money
Plugin 'terryma/vim-multiple-cursors'

" The explorer
Plugin 'scrooloose/nerdtree'

" Themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'majutsushi/tagbar'

" JS beautifiers
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'

" Tabss
Plugin 'ervandew/supertab'

" Git in hand
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Python charmer
Plugin 'klen/python-mode'

" Multiple language mgmt
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'honza/vim-snippets' 
Plugin 'SirVer/ultisnips'

" vim behaviour
Plugin 'tpope/vim-repeat'
Plugin 'tmhedberg/SimpylFold'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'rking/ag.vim' " need to install the_silver_searcher

"Plugin 'tpope/vim-obsession'

" Typescript plugins
Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/vimproc.vim' " this needs to be built from source
" Plugin 'magarcia/vim-angular2-snippets'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'

" Manage Dockerfile
Plugin 'ekalinin/Dockerfile.vim'

" Icons
" Install the amazaing nerd fonts for this
Plugin 'ryanoasis/vim-devicons'

"Fun
Plugin 'glts/vim-cottidie'

call vundle#end()      

" Needed to get ultisnips working
filetype indent plugin on  
    
"Nerdtree toggling enabled
function OpenNERDTree()
    execute ":NERDTree"
endfunction
      
command -nargs=0 OpenNERDTree :call OpenNERDTree()
nmap <ESC>t :NERDTreeToggle<CR>

" Ignore file types of .vim ~ .git and .pyc
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '\.pyc', '\.map']

" Delete all buffers
nmap <ESC>a :qa<CR>

" Toggle tagbar
nmap <F8> :TagbarToggle<CR>

" Syntastic keymappings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:EasyMotion_leader_key = ','

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" Gundo toggling enabled
nnoremap <F5> :GundoToggle<CR>

" Ultisnips functionality tuning
let g:UltiSnipsExpandTrigger='<c-a>'
let g:UltiSnipsListSnippets='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-l>'
let g:UltiSnipsJumpBackwardTrigger='<c-h>'

" Autocmd to beautify functions
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" For the smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" The width of tab is set to 2
set smartindent 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Fold settings | deepest 10 folds | dont fold by default | :h folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1 

" Pray that it exist
colorscheme molokai 
set guifont=Consolas:h12:cANSI

filetype plugin on
syntax on
set relativenumber
set wildmenu

" vim-airline was not coming default
set laststatus=2 

" Remove red bar in pymode
let g:pymode_options_colorcolumn = 0

" No auto document display in python mode
set completeopt=menu

" Enable debugging
let g:pymode_breakpoint = 1

" No swapfile
set noswapfile

" God save me
set nobackup
 
" How to enable the word completion
set complete=.,w,b,t 

" Enable the space utilization
set listchars=eol:↲,tab:>·,trail:.,extends:>,precedes:<,space:.

" Turn the space utilization on
set nolist 

" No hilighting on cursorline
hi CursorLine NONE gui=underline term=underline cterm=underline 

" Have a helpful line
set cursorline

noremap <F3> :Autoformat<CR><CR>

"##################################
" touch ~/.ctags
" echo --python-kinds=-i >> ~/.ctags

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Remove experimentalDecorators error
let g:syntastic_typescript_tsc_args = "--experimentalDecorators"

" To sync the fonts with airline
let g:airline_powerline_fonts=1

"" May be for some later use..let us see..
"=========================================
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi'] 

