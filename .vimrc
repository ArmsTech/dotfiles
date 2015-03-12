" Setup {{{
set nocompatible
filetype off

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
Plugin 'ervandew/supertab'

call vundle#end()
filetype plugin indent on

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

syntax on
colorscheme elflord
" }}} Setup
" Options {{{
set autoindent                          " auto indenting is on
set colorcolumn=79                      " show line to enforce 80 char lines
set complete+=k
set copyindent                          " copy previous auto indent
set dictionary=/usr/share/dict/words    " default dictionary
set encoding=utf-8                      " set file encoding
set expandtab                           " use spaces when <tab> is pressed
set foldmethod=marker                   " enable folding
set hidden                              " hide (not close) buffers
set history=1000                        " remember more history
set hlsearch                            " highlight found search terms
set ignorecase                          " ignore case when searching
set incsearch                           " show matches while typing
set list                                " show special characters
set listchars=tab:▸\ ,eol:¬             " tab and EOL to TextMate chars
set nobackup                            " do not save backup files
set noerrorbells                        " no beeping
set noswapfile                          " do not create swap files
set nowrap                              " do not wrap lines
set number                              " show line numbers
set pastetoggle=<F2>                    " toggle :set paste on
set shiftround                          " indent by mulitible of shiftwidth
set shiftwidth=4                        " size of the indent is x spaces
set showcmd                             " show info about the current command
set showmatch                           " show matching parenthesis
set showmode                            " show current mode
set smartcase                           " ignore case when lowercase
set smarttab                            " tabs are only used for indentation
set softtabstop=4                       " simulate tabstop width != tabstop
set tabstop=4                           " a <tab> is equvalent to x spaces
set title                               " change the terminal title
set undolevels=1000                     " increase undo history
set visualbell                          " no flashing
hi Search cterm=NONE ctermfg=black ctermbg=yellow
" }}} Options
" Leaders {{{
let mapleader=","

nmap <leader>/ :nohlsearch<CR>
inoremap <leader>i <Esc>
nmap <leader>s :set spell!<CR>
nmap <leader>v :edit $MYVIMRC<CR>
nnoremap <leader>stw :call <SID>StripTrailingWhitespaces()<CR>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
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
nnoremap j e
nnoremap h s

" previous search term is K (k is next)
nnoremap <s-k> N

" toggle folding with space
" http://vim.wikia.com/wiki/Folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> za

" save a file that requires root privelages AFTER opening
cmap w!! w !sudo tee % >/dev/null
" }}} Remap Keys
" Plugins {{{
let g:ycm_key_list_select_completion=['<Up>', '<Down>']

let g:SuperTabDefaultCompletionType = "<c-n>"

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
endif
" }}} Auto Commands
" Functions {{{
" http://vimcasts.org/episodes/tidying-whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }}} Functions
