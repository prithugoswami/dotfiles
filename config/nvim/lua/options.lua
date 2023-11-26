vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.undofile = true
--o.colorcolumn = '80'
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.sidescrolloff = 10
vim.opt.wrap = true
vim.opt.mouse = 'a'
vim.opt.wildmenu = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.foldenable = true
vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.numberwidth = 4
vim.opt.backspace = 'indent,eol,start'
vim.opt.termguicolors = true
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.o.statusline="%<%f %{%v:lua.require'nvim-navic'.get_location()%} %h%m%r%=%-14.(%l,%c%V%) %P"


vim.cmd('colorscheme base16-classic-dark')
vim.cmd('filetype plugin indent on')

vim.g.winresizer_vert_resize = 4
vim.g.winresizer_horiz_resize = 2
