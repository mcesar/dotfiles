set nocompatible hidden laststatus=2

set rtp+=/root/.fzf

call plug#begin('/dotfiles/nvim/plugged')
Plug 'autozimu/LanguageClient-neovim', { 'tag': '0.1.58', 'do': 'sh install.sh' }
Plug 'roxma/nvim-completion-manager', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf.vim'
call plug#end()

" general
set encoding=utf8
set mouse+=a
set fillchars+=vert:\ 
set colorcolumn=100
set noshowmode

" temp files
set noswapfile
set nobackup
let g:session_autoload = 'no'

" indenting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
syntax on

" numbering
set number
set relativenumber

" completion
if has('shortmess')
    set shortmess+=c
endif
set completeopt-=preview

" clipboard                                                                                                                                                                                
set clipboard+=unnamedplus
set mouse+=c

" color
colorscheme base16-railscasts
set background=dark
if has('termguicolors')
    set termguicolors
endif

" shortcuts
let mapleader = "\<Space>"
nnoremap <Leader>r <C-^>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <Leader><Tab> gt
nnoremap <Leader><S-Tab> gT
nnoremap <Leader>e :e
nnoremap <Leader>w :bd<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qq :q!<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>h <C-W>h<C-W>_
nnoremap <Leader>j <C-W>j<C-W>_
nnoremap <Leader>k <C-W>k<C-W>_
nnoremap <Leader>l <C-W>l<C-W>_
nmap <leader>t :TagbarToggle<CR>
map <leader>n :NERDTreeToggle<CR>
inoremap <C-c> <Esc>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap ; :

" search
set ignorecase
set smartcase
set hlsearch
nnoremap <silent> <Leader><Space> :nohlsearch<Bar>:echo<CR>

" ncm
imap <c-space> <Plug>(cm_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
let g:cm_matcher = {'module': 'cm_matchers.fuzzy_matcher', 'case': 'smartcase'}
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'
