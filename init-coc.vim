"this is needed to make sure that ultisnips works finally...!
filetype off

call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }

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

" Git in hand
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Multiple language mgmt
Plug 'jiangmiao/auto-pairs'
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
Plug 'chiedo/vim-case-convert'

" Manage Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" Install the amazaing nerd fonts for this
Plug 'ryanoasis/vim-devicons'

"Fun
Plug 'glts/vim-cottidie'

" Terminal
Plug 'kassio/neoterm'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug '~/.fzf/'
Plug 'junegunn/fzf.vim'
"
" " The magic alignment
" Plug 'junegunn/vim-easy-align'
"
" " For the hylang
" Plug 'hylang/vim-hy'

call plug#end()

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>

" let g:LanguageClient_useVirtualText = 0
" let g:LanguageClient_useFloatingHover = 0
" let g:LanguageClient_hoverPreview = 'Never'

" Needed to get ultisnips working
filetype indent plugin on
syntax on

set hidden

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
" let g:UltiSnipsExpandTrigger='<c-k>'
" let g:UltiSnipsListSnippets='<c-j>'
" let g:UltiSnipsJumpForwardTrigger='<c-l>'
" let g:UltiSnipsJumpBackwardTrigger='<c-h>'

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
" set clipboard=unnamedplus
set clipboard+=unnamed
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

let base16colorspace=256
" colorscheme base16-gruvbox-dark-hard
set background=dark

au FilterWritePre * if &diff | colorscheme evening | endif

inoremap ,s <esc>:Ag
inoremap ,f <esc>:Files<CR>
noremap ,s <esc>:Ag
noremap ,f <esc>:Files<CR>

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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:ale_enabled = 0
nmap <F9> <Plug>(ale_fix)
let g:ale_python_pylint_options = '--ignore-docstrings=y'
let g:ale_python_black_options = '--fast'

let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['tslint'],
\   'json': ['standard'],
\   'TypeScript': ['standard'],
\   'yaml': ['yamllint'],
\   'reStructuredText': ['rstcheck'],
\   'go': ['gofmt'],
\   'html': ['prettier'],
\   'python': ['flake8']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['tslint'],
\   'json': ['standard'],
\   'TypeScript': ['standard'],
\   'yaml': ['yamllint'],
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
" let g:vim_isort_python_version = venv_path . '/bin/python'

" set conceallevel=0

nmap <F7> :ALEFix<CR>

" <<< *************** COC related items *******************
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

colorscheme Monokai

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" *************** COC related items ******************* >>> 
