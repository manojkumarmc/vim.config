
"this is needed to make sure that ultisnips works finally...!
filetype off

call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'Valloric/YouCompleteMe' " please make sure that you have python-dev and ruby-dev installed :)

" The ultimate searcher
Plug 'ctrlpvim/ctrlp.vim'

" The in file searcher
Plug 'Lokaltog/vim-easymotion'

" Manage your undos
Plug 'sjl/gundo.vim'

" Multiple editing which gives sublime a run for its money
Plug 'terryma/vim-multiple-cursors'

" The explorer
Plug 'scrooloose/nerdtree'

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/taglist.vim'


" JS beautifiers
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'

" Tabss
Plug 'ervandew/supertab'

" Git in hand
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Python charmer
Plug 'python-mode/python-mode', { 'branch': 'develop' }
" Plug 'davidhalter/jedi-vim'
" Plug 'tell-k/vim-autopep8'
" Plug 'google/yapf'

" Multiple language mgmt
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'rstacruz/sparkup' " html autogenerator
Plug 'Chiel92/vim-autoformat'

" vim behaviour
Plug 'tpope/vim-repeat'
Plug 'tmhedberg/SimpylFold'
Plug 'terryma/vim-smooth-scroll'
" Removing ag dependency cos of the awesome fzf
" Plug 'rking/ag.vim' " need to install the_silver_searcher
Plug 'sickill/vim-pasta' " intendation manager
Plug 'bronson/vim-trailing-whitespace' " whitespace cleaner
Plug 'tommcdo/vim-exchange' "the ultimate exchange
Plug 'nelstrom/vim-visual-star-search'

"Plug 'tpope/vim-obsession'

" Typescript plugins
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}  " this needs to be built from source
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

" Plug 'magarcia/vim-angular2-snippets' " syntax issues

" Manage Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" Icons
" Install the amazaing nerd fonts for this
Plug 'ryanoasis/vim-devicons'

"Fun
Plug 'glts/vim-cottidie'

" Terminal
Plug 'kassio/neoterm'
Plug 'fatih/vim-go'

" The ultimate fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

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
let g:UltiSnipsExpandTrigger='<c-k>'
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
" colorscheme xoria256 " even molokai

" If Droid Sans Mono dont exist
set guifont=Consolas:h12:cANSI

filetype plugin on
syntax on

" omnicompletion setup
set omnifunc=syntaxcomplete#Complete
set completeopt+=longest

" set relativenumber
set wildmenu
" set number relativenumber
" set nonumber norelativenumber  " turn hybrid line numbers off
" set !number !relativenumber    " toggle hybrid line numbers

"Let it be smooth
set lazyredraw

" vim-airline was not coming default
set laststatus=2

"mkmc
"mkmclet g:pymode = 0
let g:pymode_folding = 0
" Remove red bar in pymode
let g:pymode_options_colorcolumn = 0
" No auto document display in python mode
set completeopt=menu
" Enable debugging
let g:pymode_breakpoint = 1

" vim hanging issue on python save - critical fix
" let g:pymode_rope = 0
" let g:pymode_rope_lookup_project = 0
"

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
" set clipboard=unnamed
let g:webdevicons_conceal_nerdtree_brackets = 1

let g:yankring_clipboard_monitor=0
let g:ctrlp_max_files=40000
let g:ctrlp_max_depth=40
let g:ycm_use_ultisnips_completer = 1

inoremap <silent> ,o <C-o>o
inoremap <silent> ,a <C-o><S-a>
inoremap <silent> ,h <C-o>h
inoremap <silent> ,j <C-o>j
inoremap <silent> ,k <C-o>k
inoremap <silent> ,l <C-o>l
inoremap <silent> ,b <C-o>b
inoremap <silent> ,w <C-o>w
inoremap <silent> ,[ <C-o>{
inoremap <silent> ,] <C-o>}
inoremap <silent> ,0 <C-o>0

noremap ,ff :NERDTreeFind<CR>
map <F6> :setlocal spell! spelllang=en_us<CR>
set tags+=$HOME/full-tags


function CreateMyTags(filetype, foldername)
  echom a:filetype
  echom a:foldername
endfunction

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

let g:formatters_python = ['yapf', 'autopep8']
let g:formatter_yapf_style = 'yapf;ALIGN_CLOSING_BRACKET_WITH_VISUAL_INDENT;COALESCE_BRACKETS'

let g:ycm_use_ultisnips_completer = 1


function TryThis()
  !touch /opt/chumma.txt
endfunction

au FilterWritePre * if &diff | colorscheme evening | endif

inoremap <c-f> <esc>:Ag
noremap <c-f> <esc>:Ag

" search always to center
noremap n nzz
noremap N Nzz

set nohlsearch
" let mapleader = ','

" This is to manage preview of fzf Files command
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" This is to manage preview of fzf Ag command
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

