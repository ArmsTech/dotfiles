set nocompatible        " explicitly do not care about vi compat
filetype off            " filetype must be off for vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/simple-pairs'
Plugin 'vim-scripts/tComment'
Plugin 'SirVer/ultisnips'

call vundle#end()
filetype plugin indent on

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

syntax on               " turn on syntax highlighting
colorscheme elflord     " set the colorscheme

set hidden              " hide buffers rather than close them
set showmode            " show current mode

set nowrap              " do not wrap lines
set number              " show line numbers
set list                " show special characters
set listchars=eol:¬     " Tab and EOL to cool unicode chars
set colorcolumn=79      " show vertical line to enforce 80 char lines

set smarttab            " tabs are only used for indentation
set expandtab           " use spaces when <tab> is pressed
set tabstop=4           " a <tab> is equvalent to x spaces
set softtabstop=4       " simulate tabstop at width != tabstop

set autoindent          " auto indenting is on
set copyindent          " copy previous auto indent
set shiftround          " indent by mulitible of shiftwidth
set shiftwidth=4        " size of the indent is x spaces
set pastetoggle=<F2>    " Make :set paste on easier to disable 'smart' stuff

set showmatch           " show matching parenthesis
set ignorecase          " ignore case when searching
set smartcase           " ignore case when term is all lowercase
set hlsearch            " highlight found search terms
set incsearch           " show matches while typing
hi Search cterm=NONE ctermfg=black ctermbg=yellow

set history=1000        " remember more history
set undolevels=1000     " increase undo history
set nobackup            " do not save backup files
set noswapfile          " do not create swap files

set title               " change the terminal title
set visualbell          " no flashing
set noerrorbells        " no beeping

let mapleader=","       " , is preferred over \ for leader

"" you complete me
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion=['<Up>', '<Down>']

"" ultisnips
let g:UltiSnipsSnippetDirectories=["ultisnips-snippets"]
let g:ultisnips_python_style="sphinx"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" For searching: k is n, K is N
nnoremap <s-k> N

" Remove highlight simply (<leader>/)
nmap <silent> <leader>/ :nohlsearch<CR>

" Remap ; to : for entering command mode
nnoremap ; :

nnoremap QQ :q!<CR>

" Remap <Esc> to <leader>i
inoremap <leader>i <Esc>

" Normal mode only
" Remap motion keys for Colemak and keys clobbered by change
nnoremap n h
nnoremap e l
nnoremap s k
nnoremap t j
nnoremap k n
nnoremap j e

" Visual mode only
" Remap motion keys for Colemak
xnoremap n h
xnoremap e l
xnoremap s k
xnoremap t j

" Save a file that requires root privelages AFTER opening
cmap w!! w !sudo tee % >/dev/null

" File types
au BufNewFile,BufRead *.jinja2 set filetype=html
