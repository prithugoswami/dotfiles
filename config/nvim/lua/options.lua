vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.undofile = true
--o.colorcolumn = '80'
vim.opt.mouse = 'a'
vim.opt.wildmenu = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.foldenable = true
vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.number = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.termguicolors = true

vim.cmd('colorscheme base16-classic-dark')
vim.cmd('filetype plugin indent on')

vim.g.winresizer_vert_resize = 4
vim.g.winresizer_horiz_resize = 2
