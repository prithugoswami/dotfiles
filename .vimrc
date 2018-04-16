execute pathogen#infect()
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1

set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in the tab when editing
set expandtab " tabs are shortcut for spaces
set shiftwidth=2
syntax enable " enalbe syntax processing
set smartindent
" when opening a new line, keep the same indentation if no
" file-specific indenting is enabled
set autoindent

" load filetype-specific indent files
filetype indent on

set backspace=indent,eol,start

" visual autocomplete for command menu
set wildmenu

" redraw only when we need to
set lazyredraw

" highligt matching [{()}]
set showmatch

hi MatchParen cterm=none ctermbg=none ctermfg=white

set incsearch "search as characters are entered
set hlsearch " highlight search matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set foldenable " enable folding

set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folds max
set foldmethod=indent " fold based on indent




set number " number line
set showcmd " show command in bottom bar


" MOVEMENT " 

" allow to move around visualy by default
nnoremap j gj
nnoremap k gk

" Move the begining/end of the line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" leader is comma
let mapleader=","

" jk is escape
inoremap jk <esc>

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
"if &term == 'xterm-256color' || &term == 'screen-256color'
let &t_SI = "\<Esc>[5 q"
let &t_EI = "\<Esc>[1 q"
"endif

if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif
