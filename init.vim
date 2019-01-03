"this is needed to make sure that ultisnips works finally...!
filetype off

call plug#begin()

Plug 'tpope/vim-sensible'

" Absoute
Plug 'Valloric/YouCompleteMe'

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
Plug 'ryanoasis/vim-devicons'

" Tabss
Plug 'ervandew/supertab'

" Git in hand
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Multiple language mgmt
Plug 'jiangmiao/auto-pairs'
" Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'rstacruz/sparkup' " html autogenerator
Plug 'w0rp/ale' " formatter

" vim behaviour
Plug 'tpope/vim-repeat'
Plug 'tmhedberg/SimpylFold'
Plug 'terryma/vim-smooth-scroll'
Plug 'sickill/vim-pasta' " intendation manager
Plug 'bronson/vim-trailing-whitespace' " whitespace cleaner
Plug 'tommcdo/vim-exchange' "the ultimate exchange
Plug 'nelstrom/vim-visual-star-search'
Plug 'Yggdroot/indentLine'

" Python charmer
Plug 'davidhalter/jedi-vim'
Plug 'fisadev/vim-isort'

" Manage Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" Install the amazaing nerd fonts for this
Plug 'ryanoasis/vim-devicons'

"Fun
Plug 'glts/vim-cottidie'

" Terminal
Plug 'kassio/neoterm'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go'

" The ultimate fuzzy finder
set rtp+=~/.fzf
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" The magic alignment
Plug 'junegunn/vim-easy-align'

call plug#end()

" Needed to get ultisnips working
filetype indent plugin on
syntax on

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
let g:syntastic_typescript_tsc_args = "--experimentalDecorators"  "Remove experimentalDecorators error

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

" omnicompletion setup
set omnifunc=syntaxcomplete#Complete

" set the wild menu
set wildmenu

"Let it be smooth
set lazyredraw

" vim-airline was not coming default
set laststatus=2

let g:pymode = 0
let g:pymode_folding = 0

" Remove red bar in pymode
let g:pymode_options_colorcolumn = 0

" Enable debugging
let g:pymode_breakpoint = 1

" vim hanging issue on python save - critical fix
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0

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

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


" To sync the fonts with airline
let g:airline_powerline_fonts=1
set clipboard+=unnamedplus
let g:webdevicons_conceal_nerdtree_brackets = 1

let g:yankring_clipboard_monitor=0

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

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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

" yaml formatter
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" xclip is needed for this
let g:clipboard = {
  \   'name': 'xclip-xfce4-clipman',
  \   'copy': {
  \      '+': 'xclip -selection clipboard',
  \      '*': 'xclip -selection clipboard',
  \    },
  \   'paste': {
  \      '+': 'xclip -selection clipboard -o',
  \      '*': 'xclip -selection clipboard -o',
  \   },
  \   'cache_enabled': 1
  \ }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:ycm_auto_trigger = 1
let g:ycm_global_ycm_extra_conf = '/home/mmc/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_use_ultisnips_completer = 1

let g:ale_enabled = 0
nmap <F9> <Plug>(ale_fix)
let g:ale_python_pylint_options = '--ignore-docstrings=y'

let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'TypeScript': ['prettier'],
\   'yaml': ['yamllint'],
\   'reStructuredText': ['rstcheck'],
\   'go': ['gofmt'],
\   'html': ['prettier'],
\   'python': ['flake8']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'TypeScript': ['prettier'],
\   'yaml': ['prettier'],
\   'reStructuredText': ['rstcheck'],
\   'go': ['gofmt'],
\   'html': ['prettier'],
\   'python': ['black']
\}

"hi Visual  guifg=White guibg=LightBlue gui=none
let g:go_version_warning = 0

vnoremap \q c()<ESC>PF(i

let g:indentLine_char = '|'

let g:vim_isort_map = '<C-i>'
let g:vim_isort_python_version = 'python3'
