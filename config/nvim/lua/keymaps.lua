local k = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

vim.g.mapleader = ' '
k('i', 'jk', '<esc>', options)

-- move around visually (when line is wrapped)
k('n', 'j', 'gj', options)
k('n', 'k', 'gk', options)

-- window navigation
k('n', '<C-j>', '<C-W><C-J>', options)
k('n', '<C-k>', '<C-W><C-K>', options)
k('n', '<C-h>', '<C-W><C-H>', options)
k('n', '<C-l>', '<C-W><C-L>', options)

-- tab navigation
k('n', 'H', 'gT', options)
k('n', 'L', 'gt', options)

-- tree nav
k('n', '<C-n>', ':NvimTreeToggle<CR>', options)


-- folds
k('n', '<leader>j', 'za', options)
-- add keymap to unfold and others

-- visual 
-- copy to clipbaord in visual mode
k('v', '<C-c>', '"+y', options)
k('v', 'J', ':m \'>+1<CR>gv=gv', options)
k('v', 'K',':m \'<-2<CR>gv=gv', options)

k('n', '<leader>m', ':nohlsearch<CR>', options)
k('n', '<leader>z', ':MaximizerToggle<CR>', options)
