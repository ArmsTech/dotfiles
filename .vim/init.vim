" Setup {{{

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'SirVer/ultisnips'
Plugin 'joequery/Stupid-EasyMotion'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'LargeFile'

call vundle#end()

filetype plugin indent on
syntax on

" }}} Setup
" Options {{{

set colorcolumn=79                      " show line to enforce 80 char lines
set completeopt-=preview                " do not show ycm preview window
set copyindent                          " copy previous auto indent
set expandtab                           " use spaces when <tab> is pressed
set foldmethod=marker                   " enable folding
set hidden                              " hide (not close) buffers
set ignorecase                          " ignore case when searching
set lazyredraw                          " only redraw when required
set list                                " show special characters
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
set softtabstop=4                       " simulate tabstop width != tabstop
set tabstop=4                           " a <tab> is equvalent to x spaces
set undolevels=1000                     " increase undo history
set visualbell                          " no flashing
hi Search cterm=NONE ctermfg=black ctermbg=yellow

" }}} Options
" Leaders {{{

let mapleader=","

map <leader>f <leader><leader>f
map <leader>w <leader><leader>w
map <leader>W <leader><leader>W

nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader><bar> <c-w>v
nnoremap <leader>- <c-w>s
nnoremap <leader>c <c-w>w
nnoremap <leader>C <c-w>w<c-w>w
nnoremap <leader>e :e %:p:h<cr>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<cr>
nnoremap <leader>m <c-w>_<c-w><bar>
nnoremap <leader>mu <c-w>=
nnoremap <leader>q :q!<cr>
nnoremap <leader>rw mz:%s/\s\+$//<cr>:let @/=''<cr>`z
nnoremap <leader>s :set spell!<cr>
nnoremap <leader>v :edit $MYVIMRC<cr>
nnoremap <leader>x <c-w>x
nnoremap <leader>z :wq!<cr>

inoremap <leader>i <esc>

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

let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_key_list_select_completion=['<up>', '<down>']

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
  au filetype javascript nnoremap <buffer> <F7> :JSHint<CR>
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
