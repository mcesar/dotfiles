" This file represents the minimal .vimrc needed to work with govim.
"
" We also include a number of suggested settings that we think the majority of
" users will like/prefer.

set nocompatible
set nobackup
set nowritebackup
set noswapfile

filetype plugin on

set mouse=nv

" To get hover working in the terminal we need to set ttymouse. See
"
" :help ttymouse
"
" for the appropriate setting for your terminal. Note that despite the
" automated tests using xterm as the terminal, a setting of ttymouse=xterm
" does not work correctly beyond a certain column number (citation needed)
" hence we use ttymouse=sgr
set ttymouse=sgr

" Suggestion: By default, govim populates the quickfix window with diagnostics
" reported by gopls after a period of inactivity, the time period being
" defined by updatetime (help updatetime). Here we suggest a short updatetime
" time in order that govim/Vim are more responsive/IDE-like
set updatetime=500

" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
" balloondelay
set balloondelay=250

" Suggestion: Turn on the sign column so you can see error marks on lines
" where there are quickfix errors. Some users who already show line number
" might prefer to instead have the signs shown in the number column; in which
" case set signcolumn=number
set signcolumn=number

" Suggestion: Turn on syntax highlighting for .go files. You might prefer to
" turn on syntax highlighting for all files, in which case
"
syntax on
"
" will suffice, no autocmd required.
"autocmd! BufEnter,BufNewFile *.go syntax on
"autocmd! BufLeave *.go syntax off

" Suggestion: turn on auto-indenting. If you want closing parentheses, braces
" etc to be added, https://github.com/jiangmiao/auto-pairs. In future we might
" include this by default in govim.
set autoindent
set smartindent
filetype indent on

" Suggestion: define sensible backspace behaviour. See :help backspace for
" more details
set backspace=2

" Suggestion: show info for completion candidates in a popup menu
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif

" Custom settings
set number
set relativenumber
set encoding=utf8
colorscheme base16-railscasts
set fillchars+=vert:\ 
set colorcolumn=80
set background=dark
set ignorecase
set smartcase
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshowmode
set ttimeoutlen=50
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
inoremap <C-@> <C-x><C-o>
nnoremap <silent> <Space><Space> :nohlsearch<Bar>:echo<CR>
nnoremap <F12> :GOVIMGoToDef<CR>
if &term =~ "screen."
    let &t_SI = "\eP\e[6 q\e\\"
    let &t_SR = "\eP\e[4 q\e\\"
    let &t_EI = "\eP\e[2 q\e\\"
else
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif
hi LineNr ctermbg=235
hi ColorColumn ctermbg=235
hi Pmenu ctermbg=235
hi PmenuSel ctermfg=WHITE
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
let g:git_status=GitBranch()
function! StatuslineGit()
    let l:branchname = g:git_status " GitBranch()
    return strlen(l:branchname) > 0 ? '  '.l:branchname.' ' : ''
endfunction
set laststatus=2
set statusline=
set statusline+=%#LineNr#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#MatchParen#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#Cursor#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

packadd! asyncomplete.vim
packadd! asyncomplete-omni.vim
call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
                \ 'name': 'omni',
                \ 'whitelist': ['*'],
                \ 'blacklist': ['c', 'cpp', 'html'],
                \ 'completor': function('asyncomplete#sources#omni#completor')
                \  }))

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

let g:omni_sql_no_default_maps = 1
let g:loaded_sql_completion = 0
set clipboard=unnamedplus
nnoremap <C-p> :Files<Cr>
