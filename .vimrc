execute pathogen#infect()
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1

set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in the tab when editing
set expandtab " tabs are shortcut for spaces
set shiftwidth=4
syntax enable " enalbe syntax processing
set smartindent
" when opening a new line, keep the same indentation if no
" file-specific indenting is enabled
set autoindent

" load filetype-specific indent files
filetype plugin indent on

" compiling for different file types
autocmd FileType markdown nnoremap cp :w<Enter>:!pandoc -f gfm -V geometry=margin=1in -V links-as-notes -o %.pdf %<Enter><Enter>
autocmd FileType html setlocal ts=2 sts=2 sw=2
" autocmd FileType c nnoremap cp :w<Enter>:!clear && gcc % && ./a.out<Enter>
autocmd BufRead *.pdentry :Goyo

" QuickFix Navigation
nnoremap cn :cn<CR>
nnoremap cN :cN<CR>

colorscheme hybrid_reverse
set background=dark
set backspace=indent,eol,start

" visual autocomplete for command menu
set wildmenu

" redraw only when we need to
set lazyredraw

" highligt matching [{()}]
set showmatch

hi MatchParen cterm=none ctermbg=none ctermfg=white

set incsearch "search as characters are entered
"set hlsearch " highlight search matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set foldenable " enable folding

set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folds max
set foldmethod=indent " fold based on indent

" <Space> is foldToggle (za) in normal mode
nnoremap <silent> <Tab> @=(foldlevel('.')?'za':"\<Space>")<CR>

" <C-c> in visual mode copies to clipboard
vnoremap <C-c> "+y

map <C-n> :NERDTreeToggle<CR>


set number " number line
set showcmd " show command in bottom bar


" MOVEMENT " 

" allow to move around visualy by default
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" Window splits control
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-l> <C-W><C-L>

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
