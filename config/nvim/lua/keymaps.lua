local k = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

vim.g.mapleader = ' '
k('', '<Space>', '<Nop>', options)
k('i', 'jk', '<esc>', options)

-- move around visually (when line is wrapped)
k('n', 'j', 'gj', options)
k('n', 'k', 'gk', options)

-- window navigation
k('n', '<C-j>', '<C-W><C-j>', options)
k('n', '<C-k>', '<C-W><C-k>', options)
k('n', '<C-h>', '<C-W><C-h>', options)
k('n', '<C-l>', '<C-W><C-l>', options)
vim.g.winresizer_start_key = '<leader>e'

-- tab navigation
k('n', 'H', 'gT', options)
k('n', 'L', 'gt', options)

-- tree nav
k('n', '<C-n>', ':NvimTreeToggle<CR>', options)


-- folds
k('n', '<leader>l', 'za', options)
-- add keymap to unfold and others

-- visual 
-- copy to clipbaord in visual mode
k('v', '<C-c>', '"+y', options)
-- move blocks of text visually
k('v', 'J', ':m \'>+1<CR>gv=gv', options)
k('v', 'K',':m \'<-2<CR>gv=gv', options)
-- stay in visual mode while indenting
k('v', '>', '>gv', options)
k('v', '<', '<gv', options)

-- telescope
k('n', '<C-_>', ':Telescope find_files<CR>', options)
k('n', '<leader>f', ':Telescope live_grep<CR>', options)
k('n', '<C-b>', ':Telescope buffers<CR>', options)
k('n', '<leader>h', ':Telescope help_tags<CR>', options)

k('n', '<leader>m', ':nohlsearch<CR>', options)
k('n', '<leader>z', '<C-W>_', options)
k('n', 'n', 'nzz', options)

-- fugitive
k('n', '<leader>g', ':G<CR>', options)
