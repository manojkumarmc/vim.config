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
" Plug 'edkolev/tmuxline.vim'
Plug 'flazz/vim-colorschemes'
" Plug 'majutsushi/tagbar'
Plug 'vim-scripts/taglist.vim'
" Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale' " formatter
Plug 'tpope/vim-repeat'
Plug 'tmhedberg/SimpylFold'
Plug 'terryma/vim-smooth-scroll'
Plug 'sickill/vim-pasta' " intendation manager
Plug 'bronson/vim-trailing-whitespace' " whitespace cleaner
Plug 'tommcdo/vim-exchange' "the ultimate exchange
Plug 'nelstrom/vim-visual-star-search'
" Plug 'fisadev/vim-isort'
Plug 'ekalinin/Dockerfile.vim'
" Plug 'ryanoasis/vim-devicons'
Plug 'glts/vim-cottidie'
" Plug 'fatih/vim-go'
Plug 'junegunn/vim-easy-align'
Plug 'chiedo/vim-case-convert'
" Plug 'sebdah/vim-delve'
Plug 'meain/vim-jsontogo'
Plug 'svermeulen/vim-yoink'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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

" <<< COC
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" >>> COC
"
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

autocmd FileType yaml,*.txt let b:autoformat_autoindent=0
autocmd FileType yaml,*.txt let b:autoformat_retab=0
autocmd BufWrite * :Autoformat
