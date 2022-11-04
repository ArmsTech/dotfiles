" Setup {{{

set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'lifepillar/vim-solarized8'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'puremourning/vimspector'
Plug 'mark2185/vim-fubitive'
call plug#end()

colorscheme solarized8

" }}} Setup
" Options {{{

set autoindent                          " auto indenting is on
set background=dark                     " set solarized scheme
set colorcolumn=80                      " show line to enforce 80 char lines
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
set laststatus=2                        " enable status line
set lazyredraw                          " only redraw when required
set list                                " show special characters
set listchars=tab:..                    " show tab character as .. when used
set nobackup                            " do not save backup files
set noerrorbells                        " no beeping
set noswapfile                          " do not create swap files
set nowrap                              " do not wrap lines
set number                              " show line numbers
set pastetoggle=<F2>                    " toggle :set paste on
set relativenumber                      " set number hybrid mode
set rtp+=/usr/local/opt/fzf             " enable fzf
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
set termguicolors                       " support millions of colors
set ttyfast                             " scroll fast in terminal
set undolevels=1000                     " increase undo history
set visualbell t_vb=                    " no flashing

" }}} Options
" Colors {{{

hi IncSearch guibg=#FBF719
hi Search guibg=#FBF719
hi Sneak guifg=white guibg=red
hi GitGutterAdd guifg=green
hi GitGutterChange guifg=green
hi GitGutterDelete guifg=red

" }}} Colors
" Leaders {{{

let mapleader=","

nnoremap <leader>e :e <c-r>=expand('%:p:h') . '/'<cr>
inoremap <leader>i <esc>
nnoremap <leader>q :q!<cr>
nnoremap <leader>r :so %<cr>
nnoremap <leader>s :w<cr>
nnoremap <leader>v :edit $MYVIMRC<cr>
nnoremap <leader>x <c-w>x
nnoremap <leader>y "*y"
nnoremap <leader>z :wq!<cr>

nnoremap <leader>G :gui<cr>

" Remove white space
nnoremap <leader>rw mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Remove search highlights
nnoremap <leader><space> :nohlsearch<cr>

" FZF
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fc :Commits<cr>
nnoremap <leader>fb :BLines<cr>
nnoremap <leader>fg :GFiles?<cr>

" Fugitive
nnoremap <leader>g? :map <leader>g<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gb :G blame<cr>
nnoremap <leader>gc :G commit<cr>
nnoremap <leader>gd :G diff<cr>
nnoremap <leader>gg :Ggrep
nnoremap <leader>go :Gread<cr>
nnoremap <leader>gs :G status<cr>
nnoremap <leader>gw :Gbrowse<cr>
nnoremap <leader>gx :Gdelete<cr>

" GitGutter
nnoremap <leader>h? :map <leader>h<cr>
nnoremap <leader>ha :GitGutterStageHunk<cr>
nnoremap <leader>hn :GitGutterNextHunk<cr>
nnoremap <leader>hp :GitGutterPrevHunk<cr>
nnoremap <leader>hu :GitGutterUndoHunk<cr>

" Sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S

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

" }}} Leaders
" Remap Keys {{{

" remap ; to : for entering command mode
nnoremap ; :

" remap motion keys for colemak
noremap n h
noremap e l
noremap s k
noremap t j

" next and previous match for incsearch
noremap k n
noremap K N

" jump forwards to the end of a word with punctuation
noremap l E

" delete character and substitute text
noremap h s

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

let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save=1
let g:ale_linters = {'python': ['flake8']}
let g:ale_linters_explicit=1

let g:bufferline_echo=0

let g:fzf_layout = { 'down': '~40%'  }

let g:gitgutter_map_keys=0

let g:lightline = {'colorscheme': 'solarized'}

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:sneak#s_next=1
let g:sneak#label=1

let g:ycm_add_preview_to_completeopt=0
let g:ycm_auto_hover=''
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
