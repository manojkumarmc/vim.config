" vi/vim issues resolved
set nocompatible

" utf-8 encoding display
set encoding=utf-8

" setting terminal color settings
set t_Co=256 
set term=gnome-256color

"this is needed to make sure that ultisnips works finally...!
filetype off 

" Updating vim 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'


"Plugin 'Valloric/YouCompleteMe' " please make sure that you have python-dev and ruby-dev installed :)

Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'ervandew/supertab'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'klen/python-mode'
Plugin 'flazz/vim-colorschemes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'glts/vim-cottidie'
Plugin 'tomtom/tcomment_vim'
Plugin 'honza/vim-snippets' 
Plugin 'SirVer/ultisnips'

"Plugin 'tpope/vim-obsession'

call vundle#end()      

" Needed to get ultisnips working
filetype indent plugin on  
    
"Nerdtree toggling enabled
function OpenNERDTree()
    execute ":NERDTree"
endfunction
      
command -nargs=0 OpenNERDTree :call OpenNERDTree()
nmap <ESC>t :NERDTreeToggle<CR>

" Delete all buffers
nmap <ESC>a :qa<CR>

" Toggle tagbar
nmap <F8> :TagbarToggle<CR>

" Syntastic keymappings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
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

set smartindent 
set tabstop=2 
set shiftwidth=2
set expandtab
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

" No swapfile
set noswapfile
 
" How to enable the word completion
set complete=.,w,b,t 

" Enable the space utilization
set listchars=eol:↲,tab:>·,trail:.,extends:>,precedes:<,space:.

" Turn the space utilization on
set list 

noremap <F3> :Autoformat<CR><CR>
