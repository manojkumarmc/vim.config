"this is needed to make sure that ultisnips works finally...!
filetype off

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'neovim/nvim-lsp'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'Chiel92/vim-autoformat'
Plug 'Lokaltog/vim-easymotion'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/taglist.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'rstacruz/sparkup' " html autogenerator
Plug 'w0rp/ale' " formatter
Plug 'tpope/vim-repeat'
Plug 'tmhedberg/SimpylFold'
Plug 'terryma/vim-smooth-scroll'
Plug 'sickill/vim-pasta' " intendation manager
Plug 'bronson/vim-trailing-whitespace' " whitespace cleaner
Plug 'tommcdo/vim-exchange' "the ultimate exchange
Plug 'nelstrom/vim-visual-star-search'
Plug 'fisadev/vim-isort'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'glts/vim-cottidie'
Plug 'fatih/vim-go'
Plug 'junegunn/vim-easy-align'
Plug 'chiedo/vim-case-convert'
Plug 'sebdah/vim-delve'
Plug 'meain/vim-jsontogo'
Plug 'svermeulen/vim-yoink'
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

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
" let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
" let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" Gundo toggling enabled
nnoremap <F5> :GundoToggle<CR>

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
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set omnifunc=syntaxcomplete#Complete
set wildmenu
set lazyredraw
set laststatus=2
set noswapfile
set nobackup
set complete=.,w,b,t
set listchars=eol:↲,tab:>·,trail:.,extends:>,precedes:<,space:.
set nolist
hi CursorLine NONE gui=underline term=underline cterm=underline
set cursorline
noremap <F3> :Autoformat<CR><CR>
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" To sync the fonts with airline
let g:airline_powerline_fonts=1
set clipboard+=unnamedplus
let g:webdevicons_conceal_nerdtree_brackets = 1

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


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:ale_enabled = 0
nmap <F9> <Plug>(ale_fix)
let g:ale_python_pylint_options = '--ignore-docstrings=y'
let g:ale_python_black_options = '--fast'

let g:ale_linters = {
\   '*':                ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript':       ['standard'],
\   'json':             ['standard'],
\   'TypeScript':       ['standard'],
\   'yaml':             ['yamllint'],
\   'reStructuredText': ['rstcheck'],
\   'go':               ['gofmt'],
\   'html':             ['prettier'],
\   'python':           ['flake8']
\}

let g:ale_fixers = {
\   '*':                ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript':       ['standard'],
\   'json':             ['standard'],
\   'TypeScript':       ['standard'],
\   'yaml':             ['yamllint'],
\   'reStructuredText': ['rstcheck'],
\   'go':               ['gofmt'],
\   'html':             ['prettier'],
\   'python':           ['black']
\}

"hi Visual  guifg=White guibg=LightBlue gui=none
let g:go_version_warning = 0

vnoremap \q c()<ESC>PF(i

let g:vim_isort_map = '<C-i>'
let g:vim_isort_python_version = 'python3'

colorscheme jellybeans

lua require'nvim_lsp'.rust_analyzer.setup{}
lua require'nvim_lsp'.pyls.setup{}

autocmd BufWrite * :Autoformat
