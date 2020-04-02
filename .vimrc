" Vundle stuff starts here
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'dracula/vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'dracula/vim', {'name':'dracula'}
Plugin 'simeji/winresizer'
Plugin 'rakr/vim-one'
Plugin 'tomasr/molokai'
Plugin 'junegunn/fzf.vim'
Plugin 'chriskempson/base16-vim'

call vundle#end()
" Vundle stuff ends here

set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in the tab when editing
set expandtab " tabs are shortcut for spaces
set shiftwidth=4
syntax enable " enalbe syntax processing
set smartindent
" when opening a new line, keep the same indentation if no
" file-specific indenting is enabled
set autoindent
" set viminfo='10,<100,:100,%,n~/.vim/.viminfo
set undofile

set background=dark
colorscheme base16-classic-dark
set termguicolors

" load filetype-specific indent files
filetype plugin indent on

" compiling for different file types
" autocmd FileType markdown nnoremap cm :w<Enter>:!pandoc -f gfm -V geometry=margin=0.75in --resource-path="expand('%:p:h')/img" -V links-as-notes -o %.pdf %<Enter><Enter>
"autocmd FileType markdown nnoremap cm :w<Enter>:!pandoc -f markdown+raw_tex -V geometry=margin=0.75in -V papersize=A4 -o pdf/%.pdf %<Enter><Enter>
"
autocmd FileType markdown nnoremap cm :w<Enter>:!pandoc -H ~/.config/header -f markdown+raw_tex+raw_attribute -o pdf/%.pdf %<Enter><Enter>
" autocmd FileType markdown nnoremap cm :w<Enter>:!pandoc -f markdown+raw_tex+raw_attribute -o pdf/%.pdf %<Enter><Enter>
autocmd FileType tex nnoremap cm :w<Enter>:!xelatex % 1&>/dev/null<Enter><Enter>
" autocmd FileType tex nnoremap cm :w<Enter>:!pdflatex -interaction nonstopmode % 1&>/dev/null<Enter><Enter>
autocmd FileType html setlocal ts=2 sts=2 sw=2
" autocmd FileType c nnoremap cp :w<Enter>:!clear && gcc % && ./a.out<Enter>
autocmd BufRead *.pdentry :Goyo
autocmd BufRead *.pdentry set nosmartindent

" leader is comma
let mapleader=","

" QuickFix Navigation
nnoremap cn :cn<CR>
nnoremap cN :cN<CR>


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
nnoremap <leader>ihs i\texthindi{<Esc>:r !zenity --entry --width=800<Enter>kJxA}<CR><Esc>
nnoremap <leader>ih :r !zenity --entry --width=800<Enter>
nnoremap <leader>iim i![](img/){width=80%}<Esc>F)

set foldenable " enable folding

set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folds max
set foldmethod=indent " fold based on indent

" <Space> is foldToggle (za) in normal mode
nnoremap <silent> <Tab> @=(foldlevel('.')?'za':"\<Space>")<CR>

" <C-c> in visual mode copies to clipboard
vnoremap <C-c> "+y
nnoremap <C-S-p> "+P

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

nnoremap <unique> <C-_> :FZF<CR>
nnoremap <unique> <C-B> :Buffers<CR>

set autoread
nnoremap <leader>r :e!<Enter>
nnoremap <leader>m :nohlsearch<CR>
" replace the char with '✓'
nnoremap <leader>o r<C-k>OK

" jk is escape
inoremap jk <esc>

let g:winresizer_start_key = '<leader>e'
let g:winresizer_vert_resize = 4
let g:winresizer_horiz_resize = 2

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
"if &term == 'xterm-256color' || &term == 'screen-256color'
" let &t_SI = "\<Esc>[5 q"
" let &t_EI = "\<Esc>[2 q"
"endif

" if exists('$TMUX')
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" endif
"
nnoremap <leader>n :w<Enter>:!ns %<Enter>
