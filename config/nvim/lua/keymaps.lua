local k = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

vim.g.mapleader = ' '
k('i', 'jk', '<esc>', options)
k('n', 'j', 'gj', options)
k('n', 'k', 'gk', options)
k('n', '<C-j>', '<C-W><C-J>', options)
k('n', '<C-k>', '<C-W><C-K>', options)
k('n', '<C-h>', '<C-W><C-H>', options)
k('n', '<C-l>', '<C-W><C-L>', options)
k('n', '<leader>m', ':nohlsearch<CR>', options)
k('n', '<leader>z', ':MaximizerToggle<CR>', options)
