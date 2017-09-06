" Setup {{{

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin manager
Plugin 'gmarik/Vundle.vim'

Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'joequery/Stupid-EasyMotion'
Plugin 'vim-syntastic/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'

" JavaScript and the web
Plugin 'mattn/emmet-vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()
filetype plugin indent on

syntax on
colorscheme elflord

" }}} Setup
" Options {{{

set autoindent                          " auto indenting is on
set colorcolumn=79                      " show line to enforce 80 char lines
set completeopt-=preview                " don't show preview window
set copyindent                          " copy previous auto indent
set cursorline                          " show a cursor line
set encoding=utf-8                      " set file encoding
set expandtab                           " use spaces when <tab> is pressed
set foldmethod=marker                   " enable folding
set hidden                              " hide (not close) buffers
set history=1000                        " remember more history
set hlsearch                            " highlight found search terms
set ignorecase                          " ignore case when searching
set incsearch                           " show matches while typing
set lazyredraw                          " only redraw when required
set list                                " show special characters
set listchars=tab:▸\ ,eol:¬             " tab and EOL to TextMate chars
set nobackup                            " do not save backup files
set noerrorbells                        " no beeping
set noswapfile                          " do not create swap files
set nowrap                              " do not wrap lines
set number                              " show line numbers
set pastetoggle=<F2>                    " toggle :set paste on
set relativenumber                      " set number hybrid mode
set shiftround                          " indent by mulitible of shiftwidth
set shiftwidth=4                        " size of the indent is x spaces
set showcmd                             " show info about the current command
set showmatch                           " show matching parenthesis
set showmode                            " show current mode
set smartcase                           " ignore case when lowercase
set smarttab                            " tabs are only used for indentation
set softtabstop=4                       " simulate tabstop width != tabstop
set tags+=./tags                        " add path for tag files
set tabstop=4                           " a <tab> is equvalent to x spaces
set ttyfast                             " scroll fast in terminal
set undolevels=1000                     " increase undo history
set updatetime=250                      " delay for writing to swap file
set visualbell                          " no flashing

" }}} Options
" Colors {{{

hi Search cterm=NONE ctermfg=black ctermbg=yellow
hi CursorLine term=bold cterm=bold
hi GitGutterAdd ctermfg=green
hi GitGutterChange ctermfg=green
hi GitGutterDelete ctermfg=red

" }}} Colors
" Leaders {{{

let mapleader=","

nnoremap <leader>e :e <c-r>=expand('%:p:h') . '/'<cr>
inoremap <leader>i <esc>
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>G :gui<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>rw mz:%s/\s\+$//<cr>:let @/=''<cr>`z
nnoremap <leader>s :w<cr>
nnoremap <leader>v :edit $MYVIMRC<cr>
nnoremap <leader>x <c-w>x
nnoremap <leader>z :wq!<cr>

" CtrlP
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>p? :map <leader>p<cr>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>pb :CtrlPBuffer<cr>
nnoremap <leader>pc :CtrlPCurFile<cr>
nnoremap <leader>pd :CtrlPDir<cr>
nnoremap <leader>pf :CtrlPMRU<cr>
nnoremap <leader>pm :CtrlPMixed<cr>

" Fugitive
nnoremap <leader>g? :map <leader>g<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gg :Ggrep
nnoremap <leader>go :Gread<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gbrowse<cr>
nnoremap <leader>gx :Gdelete<cr>

" GitGutter
nnoremap <leader>h? :map <leader>h<cr>
nnoremap <leader>ha :GitGutterStageHunk<cr>
nnoremap <leader>hn :GitGutterNextHunk<cr>
nnoremap <leader>hp :GitGutterPrevHunk<cr>
nnoremap <leader>hr :GitGutterUndoHunk<cr>

" StupidEasyMotion
map <leader>w <leader><leader>w

" Syntastic
nnoremap <leader>s? :map <leader>s<cr>
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>sr :SyntasticReset<cr>
nnoremap <leader>st :SyntasticToggleMode<cr>

" Vim window splits
nnoremap <leader><bar> <c-w>v
nnoremap <leader>- <c-w>s
nnoremap <leader>c <c-w>w
nnoremap <leader>m <c-w>_<c-w><bar>
nnoremap <leader>= <c-w>=

" Vim location window
nnoremap <leader>lc :lclose<cr>
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lo :lopen<cr>
nnoremap <leader>lp :lprevious<cr>

" YouCompleteMe
nnoremap <leader>y? :map <leader>y<cr>
nnoremap <leader>yg :YcmCompleter GoToDefinitionElseDeclaration<cr>

" }}} Leaders
" Remap Keys {{{

" remap ; to : for entering command mode
nnoremap ; :

" remap motion keys for colemak (normal mode)
nnoremap n h
nnoremap e l
nnoremap s k
nnoremap t j

" remap motion keys for colemak (visual mode)
xnoremap n h
xnoremap e l
xnoremap s k
xnoremap t j
"
" remap keys clobbered for colemak
nnoremap k n
nnoremap l e
nnoremap h s
nnoremap j t

" go to beginning and end of line with *strong* motion keys
noremap N ^
noremap E g_

" toggle folding with space
" http://vim.wikia.com/wiki/Folding
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<cr>
vnoremap <space> za

" save a file that requires root privelages AFTER opening
cmap w!! w !sudo tee % >/dev/null

" use <tab> to match parenthesis, brackets, etc...
noremap <tab> %

" }}} Remap Keys
" Plugins {{{

let g:airline_theme='minimalist'

let g:ctrlp_by_filename=1
let g:ctrlp_regexp=1
let g:ctrlp_show_hidden=1

let g:gitgutter_map_keys=0

let g:user_emmet_leader_key=','
let g:user_emmet_settings={'indentation': '  '}

let g:jsx_ext_required=0
let g:used_javascript_libs='chai,jquery,react,underscore'

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map={"mode": "passive"}
let g:syntastic_python_checkers = ['flake8']

let g:ycm_add_preview_to_completeopt=0
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_key_list_select_completion=['<up>', '<down>']
let g:ycm_seed_identifiers_with_syntax=1

let g:UltiSnipsSnippetDirectories=["ultisnips-snippets"]
let g:ultisnips_python_style="sphinx"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" }}} Plugins
" Auto Commands {{{

if has("autocmd")
  au BufNewFile,BufRead *.jinja2 setfiletype html
  au bufwritepost .vimrc source $MYVIMRC
  au filetype netrw call Netrw_Maps_For_Colemak()
endif

" }}} Auto Commands
" Functions {{{

function! Netrw_Maps_For_Colemak()
    noremap <buffer> n h
    noremap <buffer> e l
    noremap <buffer> s k
    noremap <buffer> t j
endfunction

" }}} Functions
